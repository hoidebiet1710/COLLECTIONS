**Quản lý cấu hình liên kết tra cứu hóa đơn và đồng bộ GitHub.**
>
> * Tự động tạo thư mục `Invoice` trong `%APPDATA%` để lưu toàn bộ dữ liệu cấu hình cục bộ.
> * Quản lý các file cấu hình tra cứu hóa đơn theo **MST**, **MSTTCGP** và **Tên tổ chức giải pháp**.
> * Cho phép người dùng thêm, sửa, lưu cấu hình liên kết tra cứu; dữ liệu được lưu vào file JSON UTF-8 không BOM.
> * Mỗi người dùng có một file cấu hình riêng (`InvoiceViewer_1LookLinkConfig_User_<UserName>.json`) để lưu các cấu hình cá nhân.
> * Khi người dùng lưu cấu hình, chương trình tự động đồng bộ file JSON của người dùng lên thư mục `Users` trên GitHub.
> * Khi khởi động hoặc làm mới dữ liệu, chương trình tự động tải các file cấu hình mới nhất từ GitHub về máy cục bộ.
> * Tự động tải và hợp nhất cấu hình chung với cấu hình của tất cả người dùng để sử dụng khi tra cứu hóa đơn.
> * Hỗ trợ quản lý cấu hình tra cứu theo MSTTCGP và ánh xạ MSTTCGP → Tên tổ chức giải pháp.
> * Có chức năng gửi yêu cầu cập nhật dưới dạng file TXT lên GitHub để quản trị viên xem xét và cập nhật dữ liệu.
> * Hỗ trợ tự động đồng bộ dữ liệu từ `InvoiceViewer_1LookLinkConfig.json` sang `InvoiceViewer_LookupConfig.json` theo định dạng chuẩn.
> * Toàn bộ quá trình đồng bộ sử dụng GitHub REST API, ghi dữ liệu UTF-8 không BOM và cập nhật theo cơ chế SHA để tránh ghi đè dữ liệu.
