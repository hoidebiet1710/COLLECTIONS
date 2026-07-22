import json
import os
import random
import sys
import time
import requests
from requests.exceptions import ConnectionError, RequestException, Timeout

# ================== CẤU HÌNH ==================
JOB_URL = "https://paddleocr.aistudio-app.com/api/v2/ocr/jobs"
TOKEN = "f4155a6b226cfa5ebd16231f5992b88e49d3062f"
ALLOWED_MODELS = ["PaddleOCR-VL-1.6", "PP-StructureV3", "PP-OCRv6"]

# Cấu hình retry
MAX_RETRIES = 8                 # Số lần thử tối đa cho POST job
POLL_MAX_CONSECUTIVE_ERRORS = 15  # Số lỗi liên tiếp tối đa khi polling
DOWNLOAD_MAX_RETRIES = 5        # Số lần thử tối đa khi download
BASE_DELAY = 2                  # Độ trễ cơ sở (giây) cho exponential backoff
MAX_DELAY = 120                 # Độ trễ tối đa (giây)
REQUEST_TIMEOUT = 90            # Timeout cho mỗi request (giây)

# ================== HÀM HỖ TRỢ ==================
def get_backoff_delay(attempt: int) -> float:
    """Exponential backoff với jitter để tránh thundering herd."""
    delay = min(BASE_DELAY * (2 ** attempt), MAX_DELAY)
    jitter = random.uniform(0, delay * 0.25)
    return delay + jitter

def is_retryable_status(status_code: int) -> bool:
    """Kiểm tra mã HTTP có nên retry không (429, 5xx, 408, 425...)."""
    if status_code in (408, 425, 429):
        return True
    return 500 <= status_code < 600

def get_retry_after(response: requests.Response) -> int | None:
    """Lấy giá trị Retry-After (giây) từ header nếu server trả về."""
    raw = response.headers.get("Retry-After")
    if raw is None:
        return None
    try:
        return max(1, int(raw))
    except ValueError:
        return None

def request_with_retry(method: str, url: str, *, max_retries: int = MAX_RETRIES,
                       desc: str = "request", **kwargs) -> requests.Response | None:
    """
    Wrapper gửi request kèm retry + exponential backoff.
    Trả về Response nếu thành công (2xx), hoặc None nếu hết lượt retry.
    Các lỗi 4xx (trừ 408/425/429) sẽ raise ngay.
    """
    kwargs.setdefault("timeout", REQUEST_TIMEOUT)
    last_exc = None
    for attempt in range(max_retries):
        try:
            resp = requests.request(method, url, **kwargs)
            if 200 <= resp.status_code < 300:
                return resp
            # Lỗi có thể retry
            if is_retryable_status(resp.status_code):
                wait = get_retry_after(resp) or get_backoff_delay(attempt)
                print(f"-> [{desc}] HTTP {resp.status_code}. "
                      f"Thử lại {attempt + 1}/{max_retries} sau {wait:.1f}s...")
                time.sleep(wait)
                continue
            # Lỗi 4xx không retry (trừ đã xử lý ở trên)
            print(f"-> [{desc}] Lỗi HTTP {resp.status_code} (không retry được):")
            print(resp.text[:500])
            return None
        except (Timeout, ConnectionError) as e:
            last_exc = e
            wait = get_backoff_delay(attempt)
            print(f"-> [{desc}] Lỗi mạng ({type(e).__name__}). "
                  f"Thử lại {attempt + 1}/{max_retries} sau {wait:.1f}s...")
            time.sleep(wait)
            continue
        except RequestException as e:
            print(f"-> [{desc}] Lỗi request không xác định: {e}")
            return None
    print(f"!! [{desc}] Đã thử {max_retries} lần nhưng vẫn thất bại"
          f"{f' ({type(last_exc).__name__})' if last_exc else ''}.")
    return None

def download_with_retry(url: str, save_path: str | None = None,
                        max_retries: int = DOWNLOAD_MAX_RETRIES,
                        desc: str = "download") -> str | bytes | None:
    """
    Download URL với retry.
    - Nếu save_path: ghi ra file (stream), trả về True/None.
    - Nếu không: trả về nội dung text.
    """
    for attempt in range(max_retries):
        try:
            resp = requests.get(url, timeout=REQUEST_TIMEOUT,
                                stream=(save_path is not None))
            if resp.status_code == 200:
                if save_path is not None:
                    os.makedirs(os.path.dirname(save_path) or ".", exist_ok=True)
                    with open(save_path, "wb") as f:
                        for chunk in resp.iter_content(8192):
                            if chunk:
                                f.write(chunk)
                    return True
                return resp.text
            if is_retryable_status(resp.status_code):
                wait = get_retry_after(resp) or get_backoff_delay(attempt)
                print(f"-> [{desc}] HTTP {resp.status_code}. "
                      f"Thử lại {attempt + 1}/{max_retries} sau {wait:.1f}s...")
                time.sleep(wait)
                continue
            print(f"-> [{desc}] Lỗi HTTP {resp.status_code}: {resp.text[:200]}")
            return None
        except (Timeout, ConnectionError) as e:
            wait = get_backoff_delay(attempt)
            print(f"-> [{desc}] Lỗi mạng ({type(e).__name__}). "
                  f"Thử lại {attempt + 1}/{max_retries} sau {wait:.1f}s...")
            time.sleep(wait)
            continue
        except RequestException as e:
            print(f"-> [{desc}] Lỗi request: {e}")
            return None
    print(f"!! [{desc}] Thất bại sau {max_retries} lần thử: {url}")
    return None

# ================== 1. XỬ LÝ THAM SỐ DÒNG LỆNH (ĐÃ SỬA LỖI) ==================
if len(sys.argv) < 2:
    print("Error: No file path provided.")
    print(f"Usage: python ocr_v2.py <file_path> [model_name] [output_folder]")
    print(f"Allowed models: {', '.join(ALLOWED_MODELS)}")
    sys.exit(1)

# [SỬA] Loại bỏ dấu ngoặc kép, ngoặc đơn và khoảng trắng thừa do PowerShell truyền vào
file_path = sys.argv[1].strip('"').strip("'").strip()

MODEL = "PaddleOCR-VL-1.6"
if len(sys.argv) >= 3:
    requested_model = sys.argv[2].strip('"').strip("'").strip()
    if requested_model in ALLOWED_MODELS:
        MODEL = requested_model
        print(f"✅ Sử dụng Model: {MODEL}")
    else:
        print(f"⚠️ Cảnh báo: Model '{requested_model}' không hợp lệ.")
        print(f"✅ Tự động chuyển về Model mặc định: {MODEL}")
        print(f"(Các model hợp lệ: {', '.join(ALLOWED_MODELS)})")
else:
    print(f"✅ Sử dụng Model mặc định: {MODEL}")

def normalize_windows_path(path):
    if not path:
        return "output"

    # Xóa ký tự quote dư thừa
    path = path.strip()
    path = path.strip('"')
    path = path.strip("'")
    path = path.strip()

    # Xóa quote còn sót ở cuối
    path = path.rstrip('"')
    path = path.rstrip("'")

    # Chuẩn hóa slash
    path = os.path.normpath(path)

    if len(path) == 2 and path[1] == ":":
        path += "\\"

    return path


output_folder = (
    normalize_windows_path(sys.argv[3])
    if len(sys.argv) > 3
    else os.environ.get("PADDLEOCR_OUTPUT", "output")
)

print(f"📁 Thư mục lưu kết quả sẽ là: {output_folder}")

# ------------------------
headers = {"Authorization": f"bearer {TOKEN}"}
optional_payload = {
    "useDocOrientationClassify": False,
    "useDocUnwarping": False,
    "useChartRecognition": False,
}
print(f"Processing file: {file_path}")

# ================== 2. GỬI JOB (POST) ==================
job_response = None
is_url = file_path.startswith("http")
for attempt in range(MAX_RETRIES):
    print(f"Đang gửi yêu cầu (Lần thử {attempt + 1}/{MAX_RETRIES})...")
    if is_url:
        post_headers = {**headers, "Content-Type": "application/json"}
        payload = {
            "fileUrl": file_path,
            "model": MODEL,
            "optionalPayload": optional_payload,
        }
        resp = request_with_retry(
            "POST", JOB_URL, headers=post_headers, json=payload, desc="POST-job"
        )
    else:
        if not os.path.exists(file_path):
            print(f"Error: File not found at {file_path}")
            sys.exit(1)
        data = {
            "model": MODEL,
            "optionalPayload": json.dumps(optional_payload),
        }
        with open(file_path, "rb") as f:
            files = {"file": f}
            resp = request_with_retry(
                "POST", JOB_URL, headers=headers,
                data=data, files=files, desc="POST-job-upload"
            )
    if resp is None:
        break
    if resp.status_code == 400:
        try:
            rj = resp.json()
            if rj.get("code") == 10010 or "队列已满" in rj.get("msg", ""):
                wait = get_backoff_delay(attempt)
                print(f"-> Hàng đợi API đã đầy. Chờ {wait:.1f}s và thử lại...")
                time.sleep(wait)
                continue
            print(f"Lỗi API 400: {rj}")
            sys.exit(1)
        except Exception:
            print(f"Lỗi 400 không parse được: {resp.text[:300]}")
            sys.exit(1)
    # Thành công
    job_response = resp
    print("✅ Gửi yêu cầu thành công!")
    break
else:
    print("!! LỖI: Đã thử lại tối đa số lần cho phép nhưng vẫn thất bại.")
    sys.exit(1)

if job_response is None:
    print("!! LỖI: Không thể gửi job sau nhiều lần thử.")
    sys.exit(1)

# ================== 3. POLLING KẾT QUẢ ==================
try:
    jobId = job_response.json()["data"]["jobId"]
except (KeyError, ValueError) as e:
    print(f"!! Không lấy được jobId từ response: {e}")
    sys.exit(1)

print(f"✅ Job submitted. jobId: {jobId}")
print("Đang polling kết quả...")
jsonl_url = ""
consecutive_errors = 0
poll_attempt = 0
while True:
    try:
        resp = requests.get(f"{JOB_URL}/{jobId}", headers=headers,
                            timeout=REQUEST_TIMEOUT)
    except (Timeout, ConnectionError) as e:
        consecutive_errors += 1
        wait = get_backoff_delay(min(consecutive_errors, 6))
        print(f"-> Lỗi mạng khi polling ({type(e).__name__}). "
              f"Thử lại sau {wait:.1f}s ({consecutive_errors}/{POLL_MAX_CONSECUTIVE_ERRORS})...")
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! Mất kết nối quá lâu khi polling. Thoát.")
            sys.exit(1)
        continue
    except RequestException as e:
        print(f"!! Lỗi request khi polling: {e}")
        sys.exit(1)

    # --- 404: server chưa đồng bộ jobId → coi như vẫn pending ---
    if resp.status_code == 404:
        consecutive_errors += 1
        wait = get_backoff_delay(min(consecutive_errors, 5))
        print(f"-> 404: Job chưa sẵn sàng trên server "
              f"({consecutive_errors}/{POLL_MAX_CONSECUTIVE_ERRORS}). Chờ {wait:.1f}s...")
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! 404 kéo dài quá lâu. Thoát.")
            sys.exit(1)
        continue

    # --- 429 / 5xx ---
    if is_retryable_status(resp.status_code):
        consecutive_errors += 1
        wait = get_retry_after(resp) or get_backoff_delay(min(consecutive_errors, 6))
        print(f"-> HTTP {resp.status_code} khi polling. "
              f"Thử lại sau {wait:.1f}s ({consecutive_errors}/{POLL_MAX_CONSECUTIVE_ERRORS})...")
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! Quá nhiều lỗi liên tiếp khi polling. Thoát.")
            sys.exit(1)
        continue

    # --- Các lỗi 4xx khác (không retry) ---
    if resp.status_code != 200:
        print(f"!! Lỗi polling không retry được: HTTP {resp.status_code}")
        print(resp.text[:500])
        sys.exit(1)

    # --- 200 OK: reset bộ đếm lỗi ---
    consecutive_errors = 0
    try:
        data = resp.json()["data"]
    except (KeyError, ValueError) as e:
        print(f"!! Không parse được JSON khi polling: {e}")
        sys.exit(1)

    state = data.get("state")
    if state == "pending":
        print("• Trạng thái: pending")
    elif state == "running":
        try:
            prog = data["extractProgress"]
            print(f"• Running: {prog['extractedPages']}/{prog['totalPages']} trang")
        except KeyError:
            print("• Running...")
    elif state == "done":
        prog = data["extractProgress"]
        print(f"✅ Job completed. Extracted: {prog['extractedPages']} trang")
        jsonl_url = data["resultUrl"]["jsonUrl"]
        break
    elif state == "failed":
        print(f"!! Job failed: {data.get('errorMsg', 'unknown')}")
        sys.exit(1)
    else:
        print(f"• Trạng thái lạ: {state}")

    # Exponential backoff nhẹ cho polling (tăng dần tới 15s)
    poll_attempt += 1
    time.sleep(min(3 + poll_attempt * 0.5, 15))

# ================== 4. DOWNLOAD JSONL + ẢNH ==================
if not jsonl_url:
    print("!! Không có jsonl_url để tải.")
    sys.exit(1)

print(f"Đang tải jsonl: {jsonl_url}")
jsonl_text = download_with_retry(jsonl_url, desc="jsonl")
if not jsonl_text:
    print("!! Không tải được jsonl. Thoát.")
    sys.exit(1)

lines = [ln.strip() for ln in jsonl_text.strip().split("\n") if ln.strip()]
base_name = os.path.splitext(os.path.basename(file_path))[0]
output_dir = os.path.join(output_folder, base_name)

try:
    os.makedirs(output_dir, exist_ok=True)
except OSError as e:
    print(f"❌ Không thể tạo thư mục:")
    print(f"   {output_dir}")
    print(f"   Lỗi: {e}")
    sys.exit(1)

os.makedirs(output_dir, exist_ok=True)

page_num = 0
for line in lines:
    try:
        result = json.loads(line)["result"]
    except (KeyError, ValueError) as e:
        print(f"⚠️ Bỏ qua dòng lỗi: {e}")
        continue
    
    # --- Lưu markdown từ layoutParsingResults (bảng biểu) ---
    for res in result.get("layoutParsingResults", []):
        md_filename = os.path.join(output_dir, f"doc_{page_num}.md")
        try:
            with open(md_filename, "w", encoding="utf-8") as md_file:
                md_file.write(res["markdown"]["text"])
        except KeyError:
            print(f"⚠️ Trang {page_num} thiếu markdown.text")
        
        # --- Lưu ảnh trong markdown ---
        for img_path, img_url in res.get("markdown", {}).get("images", {}).items():
            full_img_path = os.path.join(output_dir, img_path)
            ok = download_with_retry(img_url, save_path=full_img_path,
                                     desc=f"md-img[{page_num}]")
            if not ok:
                print(f"⚠️ Không tải được ảnh markdown: {img_url}")
        
        # --- Lưu outputImages ---
        for img_name, img_url in res.get("outputImages", {}).items():
            filename = os.path.join(output_dir, f"{img_name}_{page_num}.jpg")
            ok = download_with_retry(img_url, save_path=filename,
                                     desc=f"out-img[{page_num}]")
            if not ok:
                print(f"️ Không tải được outputImage: {img_url}")
        
        page_num += 1
    
    # --- XỬ LÝ THÊM: Lưu text từ textDetectionResults (chữ thường) ---
    text_results = result.get("textDetectionResults", [])
    if text_results:
        text_filename = os.path.join(output_dir, f"text_{page_num}.txt")
        try:
            with open(text_filename, "w", encoding="utf-8") as text_file:
                for text_item in text_results:
                    text_content = text_item.get("text", "")
                    if text_content:
                        text_file.write(f"{text_content}\n")
            print(f"✅ Đã lưu {len(text_results)} dòng text vào {text_filename}")
        except Exception as e:
            print(f"⚠️ Lỗi khi lưu text: {e}")
    
    # --- XỬ LÝ THÊM: Lưu OCR results (nếu có) ---
    ocr_results = result.get("ocrResults", [])
    if ocr_results:
        ocr_filename = os.path.join(output_dir, f"ocr_{page_num}.txt")
        try:
            with open(ocr_filename, "w", encoding="utf-8") as ocr_file:
                for ocr_item in ocr_results:
                    # Xử lý cả trường hợp ocr_item là dict hoặc list
                    if isinstance(ocr_item, dict):
                        text_content = ocr_item.get("text", "")
                    else:
                        text_content = str(ocr_item)
                    if text_content:
                        ocr_file.write(f"{text_content}\n")
            print(f"✅ Đã lưu {len(ocr_results)} dòng OCR vào {ocr_filename}")
        except Exception as e:
            print(f"⚠️ Lỗi khi lưu OCR: {e}")
    
    # Nếu không có layoutParsingResults nhưng có các kết quả khác, vẫn tăng page_num
    if not result.get("layoutParsingResults", []):
        page_num += 1

print(f"✅ Đã lưu kết quả vào thư mục: {output_dir}")