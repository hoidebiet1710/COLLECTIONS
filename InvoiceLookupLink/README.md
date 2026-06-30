Mô tả tính năng
Tính năng này cho phép người dùng cấu hình liên kết tra cứu hóa đơn điện tử theo Mã số thuế người bán (MST) hoặc Mã số thuế Tổ chức cung cấp giải pháp hóa đơn điện tử (MSTTCGP).
Thông tin cấu hình được lưu cục bộ trên máy tính và tự động đồng bộ lên GitHub để chia sẻ dữ liệu với những người dùng khác. Đồng thời, chương trình cũng gửi yêu cầu cập nhật để quản trị viên xem xét và bổ sung vào cơ sở dữ liệu chính thức.

Cách sử dụng
1. Mở cửa sổ chi tiết hóa đơn
Chọn một hoặc nhiều file XML hóa đơn.
Nhấn View Invoice để mở cửa sổ chi tiết.
2. Chọn hóa đơn cần cấu hình
Trong danh sách hóa đơn, chọn hóa đơn muốn bổ sung hoặc chỉnh sửa thông tin tra cứu.
3. Mở cửa sổ cấu hình
Nhấn nút Update Link ở góc trên bên phải cửa sổ chi tiết.
4. Cấu hình thông tin
4.1 Groupbox 1 – Cấu hình theo MST người bán
Mã số thuế: Tự động lấy từ hóa đơn đang chọn.
Link tra cứu: Nhập địa chỉ website tra cứu hóa đơn.
Trường Mã tra cứu: Nhập tên trường trong XML chứa mã tra cứu (ví dụ: Fkey, MCCQT, MTCuu, Extra2...).
Nhấn Save MST để lưu cấu hình.
4.2 Groupbox 2 – Cấu hình theo MSTTCGP
MSTTCGP: Tự động lấy từ hóa đơn đang chọn.
Link tra cứu: Nhập địa chỉ website tra cứu.
Trường Mã tra cứu: Nhập tên trường trong XML chứa mã tra cứu.
Nhấn Save MSTTCGP để lưu cấu hình.

5. Khi nhấn Refresh, chương trình sẽ:
Tải các cấu hình mới nhất từ GitHub.
Áp dụng ngay các thay đổi vừa được cập nhật.
Trích xuất lại Link tra cứu và Mã tra cứu của hóa đơn theo cấu hình mới.

Lưu ý
Chỉ lưu cấu hình khi MST hoặc MSTTCGP hợp lệ (khác rỗng và khác "-").
Nếu một hóa đơn có cả cấu hình theo MST và MSTTCGP, chương trình sẽ ưu tiên theo quy tắc xử lý đã được lập trình.
Sau khi cập nhật hoặc đồng bộ dữ liệu, nên nhấn Refresh để hiển thị kết quả mới nhất.
Các cấu hình được lưu bằng định dạng UTF-8 không BOM để đảm bảo tương thích và đồng bộ chính xác.
Dữ liệu cấu hình cá nhân được hợp nhất với dữ liệu dùng chung khi chương trình thực hiện tra cứu hóa đơn.