import os
import sys
import pandas as pd
from bs4 import BeautifulSoup

def get_desktop_output_path():
    """Lấy đường dẫn thư mục output trên Desktop"""
    desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
    output_path = os.path.join(desktop_path, "output")
    return output_path

def convert_md_to_excel(md_file_path, output_excel_path):
    """Hàm chuyển đổi 1 file md sang excel"""
    try:
        with open(md_file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        soup = BeautifulSoup(content, 'lxml')
        table = soup.find('table')
        
        if not table:
            print(f"  [Bỏ qua] Không tìm thấy table trong: {md_file_path}")
            return False
        
        # Lấy headers
        headers = []
        header_row = table.find('tr')
        if header_row:
            for th in header_row.find_all(['th', 'td']):
                headers.append(th.get_text(strip=True))
        
        # Lấy dữ liệu
        data = []
        rows = table.find_all('tr')[1:]
        for row in rows:
            cells = row.find_all(['td', 'th'])
            row_data = [cell.get_text(strip=True) for cell in cells]
            # Đảm bảo số lượng cột khớp với header
            if len(row_data) == len(headers):
                data.append(row_data)
            elif len(row_data) > len(headers):
                # Gộp các cột thừa vào cột cuối cùng (thường gặp khi OCR bị lệch)
                fixed_data = row_data[:len(headers)-1] + [" ".join(row_data[len(headers)-1:])]
                data.append(fixed_data)
            else:
                # Pad thêm chuỗi rỗng nếu thiếu cột
                row_data += [''] * (len(headers) - len(row_data))
                data.append(row_data)

        df = pd.DataFrame(data, columns=headers)
        df.to_excel(output_excel_path, index=False, engine='openpyxl')
        print(f"  [Thành công] Đã tạo: {output_excel_path}")
        return True
    except Exception as e:
        print(f"  [Lỗi] Khi xử lý {md_file_path}: {e}")
        return False

def main():
    output_dir = get_desktop_output_path()
    
    print(f"Đang tìm thư mục: {output_dir}")
    
    if not os.path.exists(output_dir):
        print("LỖI: Không tìm thấy thư mục 'output' trên Desktop!")
        print("Vui lòng đảm bảo bạn đã chạy OCR và có thư mục output trên Desktop.")
        sys.exit(1)

    # Tìm tất cả file doc_*.md trong thư mục output và các thư mục con
    md_files = []
    for root, dirs, files in os.walk(output_dir):
        for file in files:
            if file.startswith("doc_") and file.endswith(".md"):
                md_files.append(os.path.join(root, file))

    if not md_files:
        print("Không tìm thấy file doc_*.md nào trong thư mục output.")
        sys.exit(0)

    print(f"Tìm thấy {len(md_files)} file md. Bắt đầu chuyển đổi...\n")
    
    success_count = 0
    for md_file in md_files:
        # Tạo tên file excel tương ứng (ví dụ: doc_0.md -> doc_0.xlsx)
        excel_file = os.path.splitext(md_file)[0] + ".xlsx"
        print(f"Đang xử lý: {os.path.basename(md_file)}")
        if convert_md_to_excel(md_file, excel_file):
            success_count += 1
            
    print(f"\nHoàn tất! Đã chuyển đổi thành công {success_count}/{len(md_files)} file.")
    print(f"File Excel được lưu cùng thư mục với file md gốc.")

if __name__ == "__main__":
    main()