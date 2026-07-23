import json
import os
import random
import sys
import time
import requests
from requests.exceptions import ConnectionError, RequestException, Timeout

# FIX LỖI UNICODE TRÊN WINDOWS CONSOLE
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

# ================== CẤU HÌNH ==================
JOB_URL = "https://paddleocr.aistudio-app.com/api/v2/ocr/jobs"
TOKEN = "f4155a6b226cfa5ebd16231f5992b88e49d3062f"
ALLOWED_MODELS = ["PaddleOCR-VL-1.6", "PP-StructureV3", "PP-OCRv6"]

# Cấu hình retry
MAX_RETRIES = 8                 
POLL_MAX_CONSECUTIVE_ERRORS = 15  
DOWNLOAD_MAX_RETRIES = 5        
BASE_DELAY = 2                  
MAX_DELAY = 120                 
REQUEST_TIMEOUT = 90            

# ================== HÀM HỖ TRỢ ==================
def get_backoff_delay(attempt: int) -> float:
    delay = min(BASE_DELAY * (2 ** attempt), MAX_DELAY)
    jitter = random.uniform(0, delay * 0.25)
    return delay + jitter

def is_retryable_status(status_code: int) -> bool:
    if status_code in (408, 425, 429):
        return True
    return 500 <= status_code < 600

def get_retry_after(response: requests.Response) -> int | None:
    raw = response.headers.get("Retry-After")
    if raw is None:
        return None
    try:
        return max(1, int(raw))
    except ValueError:
        return None

def request_with_retry(method: str, url: str, *, max_retries: int = MAX_RETRIES,
                       desc: str = "request", **kwargs) -> requests.Response | None:
    kwargs.setdefault("timeout", REQUEST_TIMEOUT)
    last_exc = None
    for attempt in range(max_retries):
        try:
            resp = requests.request(method, url, **kwargs)
            if 200 <= resp.status_code < 300:
                return resp
            
            # Lỗi có thể retry (Im lặng chờ và thử lại, không in ra màn hình)
            if is_retryable_status(resp.status_code):
                wait = get_retry_after(resp) or get_backoff_delay(attempt)
                time.sleep(wait)
                continue
            
            # Lỗi 4xx không retry được (In ra để xử lý)
            print(f"!! [{desc}] Lỗi HTTP {resp.status_code} (không retry được):")
            print(resp.text[:500])
            return None
            
        except (Timeout, ConnectionError) as e:
            last_exc = e
            wait = get_backoff_delay(attempt)
            time.sleep(wait) # Im lặng chờ
            continue
            
        except RequestException as e:
            print(f"!! [{desc}] Lỗi request không xác định: {e}")
            return None
            
    # Chỉ in ra khi đã thử hết số lần cho phép mà vẫn thất bại
    print(f"!! [{desc}] Đã thử {max_retries} lần nhưng vẫn thất bại"
          f"{f' ({type(last_exc).__name__})' if last_exc else ''}.")
    return None

def download_with_retry(url: str, save_path: str | None = None,
                        max_retries: int = DOWNLOAD_MAX_RETRIES,
                        desc: str = "download") -> str | bytes | None:
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
                time.sleep(wait) # Im lặng chờ
                continue
                
            print(f"!! [{desc}] Lỗi HTTP {resp.status_code}: {resp.text[:200]}")
            return None
            
        except (Timeout, ConnectionError) as e:
            wait = get_backoff_delay(attempt)
            time.sleep(wait) # Im lặng chờ
            continue
            
        except RequestException as e:
            print(f"!! [{desc}] Lỗi request: {e}")
            return None
            
    # Chỉ in ra khi đã thử hết số lần cho phép mà vẫn thất bại
    print(f"!! [{desc}] Thất bại sau {max_retries} lần thử: {url}")
    return None

# ================== 1. XỬ LÝ THAM SỐ DÒNG LỆNH ==================
if len(sys.argv) < 2:
    print("Error: No file path provided.")
    print(f"Usage: python OCRJSON.py <file_path> [model_name] [output_dir]")
    print(f"Allowed models: {', '.join(ALLOWED_MODELS)}")
    sys.exit(1)

file_path = sys.argv[1]
MODEL = "PaddleOCR-VL-1.6"
CUSTOM_OUTPUT_DIR = None

if len(sys.argv) >= 3:
    requested_model = sys.argv[2]
    if requested_model in ALLOWED_MODELS:
        MODEL = requested_model
    # Nếu sai model, script tự động dùng mặc định, không cần in cảnh báo gây nhiễu

if len(sys.argv) >= 4:
    CUSTOM_OUTPUT_DIR = sys.argv[3]

headers = {"Authorization": f"bearer {TOKEN}"}
optional_payload = {
    "useDocOrientationClassify": False,
    "useDocUnwarping": False,
    "useChartRecognition": False,
}

# ================== 2. GỬI JOB (POST) ==================
job_response = None
is_url = file_path.startswith("http")

for attempt in range(MAX_RETRIES):
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
            print(f"!! Error: File not found at {file_path}")
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
                time.sleep(wait) # Im lặng chờ hàng đợi
                continue
            print(f"!! Lỗi API 400: {rj}")
            sys.exit(1)
        except Exception:
            print(f"!! Lỗi 400 không parse được: {resp.text[:300]}")
            sys.exit(1)
    
    job_response = resp
    break
else:
    print("!! LỖI: Đã thử lại tối đa số lần cho phép nhưng vẫn thất bại khi gửi job.")
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
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! Mất kết nối quá lâu khi polling. Thoát.")
            sys.exit(1)
        continue
    except RequestException as e:
        print(f"!! Lỗi request khi polling: {e}")
        sys.exit(1)

    if resp.status_code == 404:
        consecutive_errors += 1
        wait = get_backoff_delay(min(consecutive_errors, 5))
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! 404 kéo dài quá lâu khi polling. Thoát.")
            sys.exit(1)
        continue
    
    if is_retryable_status(resp.status_code):
        consecutive_errors += 1
        wait = get_retry_after(resp) or get_backoff_delay(min(consecutive_errors, 6))
        time.sleep(wait)
        if consecutive_errors >= POLL_MAX_CONSECUTIVE_ERRORS:
            print("!! Quá nhiều lỗi liên tiếp khi polling. Thoát.")
            sys.exit(1)
        continue
    
    if resp.status_code != 200:
        print(f"!! Lỗi polling không retry được: HTTP {resp.status_code}")
        print(resp.text[:500])
        sys.exit(1)
    
    consecutive_errors = 0
    try:
        data = resp.json()["data"]
    except (KeyError, ValueError) as e:
        print(f"!! Không parse được JSON khi polling: {e}")
        sys.exit(1)
    
    state = data.get("state")
    if state == "pending":
        pass # Im lặng chờ
    elif state == "running":
        pass # Im lặng chờ
    elif state == "done":
        prog = data["extractProgress"]
        print(f"✅ Job completed. Extracted: {prog['extractedPages']} trang")
        jsonl_url = data["resultUrl"]["jsonUrl"]
        break
    elif state == "failed":
        print(f"!! Job failed: {data.get('errorMsg', 'unknown')}")
        sys.exit(1)
    
    poll_attempt += 1
    time.sleep(min(3 + poll_attempt * 0.5, 15))

# ================== 4. DOWNLOAD JSON + ẢNH ==================
if not jsonl_url:
    print("!! Không có jsonl_url để tải.")
    sys.exit(1)

jsonl_text = download_with_retry(jsonl_url, desc="jsonl")
if not jsonl_text:
    print("!! Không tải được jsonl. Thoát.")
    sys.exit(1)

lines = [ln.strip() for ln in jsonl_text.strip().split("\n") if ln.strip()]
base_name = os.path.splitext(os.path.basename(file_path))[0]

if CUSTOM_OUTPUT_DIR:
    output_dir = os.path.join(CUSTOM_OUTPUT_DIR, base_name)
else:
    output_dir = os.path.join("output", base_name)

os.makedirs(output_dir, exist_ok=True)

page_num = 0
for line in lines:
    try:
        result = json.loads(line)["result"]
    except (KeyError, ValueError) as e:
        print(f"⚠️ Bỏ qua dòng lỗi: {e}")
        continue
    
    for res in result.get("layoutParsingResults", []):
        json_filename = os.path.join(output_dir, f"doc_{page_num}.json")
        try:
            with open(json_filename, "w", encoding="utf-8") as json_file:
                json.dump(res, json_file, ensure_ascii=False, indent=2)
        except Exception as e:
            print(f"⚠️ Lỗi khi lưu JSON trang {page_num}: {e}")
        
        if "markdown" in res and "images" in res["markdown"]:
            for img_path, img_url in res["markdown"]["images"].items():
                full_img_path = os.path.join(output_dir, img_path)
                ok = download_with_retry(img_url, save_path=full_img_path,
                                         desc=f"md-img[{page_num}]")
                if not ok:
                    print(f"⚠️ Không tải được ảnh markdown: {img_url}")
        
        if "outputImages" in res:
            for img_name, img_url in res["outputImages"].items():
                filename = os.path.join(output_dir, f"{img_name}_{page_num}.jpg")
                ok = download_with_retry(img_url, save_path=filename,
                                         desc=f"out-img[{page_num}]")
                if not ok:
                    print(f"⚠️ Không tải được outputImage: {img_url}")
        
        page_num += 1

print(f"✅ Hoàn tất! Đã lưu kết quả vào: {output_dir}")