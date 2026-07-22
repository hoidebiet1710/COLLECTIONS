import sys
import os
from PyQt5.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, 
                             QHBoxLayout, QPushButton, QTableWidget, QTableWidgetItem,
                             QFileDialog, QLabel, QComboBox, QMessageBox, QHeaderView,
                             QAbstractItemView, QAction, QMenuBar, QMenu)
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QFont, QKeySequence
import pandas as pd
from bs4 import BeautifulSoup

class MDTableViewer(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("MD Table Viewer - Xem và Export dữ liệu OCR")
        self.setGeometry(100, 100, 1200, 700)
        
        self.current_file = None
        self.dataframes = {}
        
        self.init_ui()
        self.create_menu()
        
    def init_ui(self):
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        layout = QVBoxLayout(central_widget)
        
        # Thanh điều khiển
        control_layout = QHBoxLayout()
        
        self.btn_load = QPushButton("📂 Chọn file MD")
        self.btn_load.clicked.connect(self.load_file)
        control_layout.addWidget(self.btn_load)
        
        self.btn_load_folder = QPushButton("📁 Chọn thư mục")
        self.btn_load_folder.clicked.connect(self.load_folder)
        control_layout.addWidget(self.btn_load_folder)
        
        self.file_combo = QComboBox()
        self.file_combo.setMinimumWidth(400)
        self.file_combo.currentIndexChanged.connect(self.switch_file)
        control_layout.addWidget(QLabel("File:"))
        control_layout.addWidget(self.file_combo)
        
        layout.addLayout(control_layout)
        
        # Bảng dữ liệu
        self.table = QTableWidget()
        self.table.setAlternatingRowColors(True)
        self.table.setSelectionBehavior(QAbstractItemView.SelectRows)
        self.table.setSelectionMode(QAbstractItemView.ExtendedSelection)
        self.table.setEditTriggers(QAbstractItemView.DoubleClicked | QAbstractItemView.EditKeyPressed)
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.table.verticalHeader().setVisible(True)
        
        # Font dễ đọc
        font = QFont("Segoe UI", 10)
        self.table.setFont(font)
        
        layout.addWidget(self.table)
        
        # Thanh nút chức năng
        btn_layout = QHBoxLayout()
        
        self.btn_copy = QPushButton("📋 Copy (Ctrl+C)")
        self.btn_copy.clicked.connect(self.copy_to_clipboard)
        btn_layout.addWidget(self.btn_copy)
        
        self.btn_copy_all = QPushButton("📋 Copy tất cả")
        self.btn_copy_all.clicked.connect(self.copy_all_to_clipboard)
        btn_layout.addWidget(self.btn_copy_all)
        
        self.btn_export_excel = QPushButton("💾 Export Excel")
        self.btn_export_excel.clicked.connect(self.export_to_excel)
        btn_export_excel.setStyleSheet("background-color: #4CAF50; color: white; padding: 5px;")
        btn_layout.addWidget(self.btn_export_excel)
        
        self.btn_export_csv = QPushButton("💾 Export CSV")
        self.btn_export_csv.clicked.connect(self.export_to_csv)
        btn_layout.addWidget(self.btn_export_csv)
        
        self.btn_clear = QPushButton("🗑️ Xóa dữ liệu")
        self.btn_clear.clicked.connect(self.clear_table)
        btn_layout.addWidget(self.btn_clear)
        
        layout.addLayout(btn_layout)
        
        # Trạng thái
        self.status_label = QLabel("Sẵn sàng")
        layout.addWidget(self.status_label)
        
    def create_menu(self):
        menubar = self.menuBar()
        
        # Menu File
        file_menu = menubar.addMenu('File')
        
        load_action = QAction('Load file MD', self)
        load_action.setShortcut('Ctrl+O')
        load_action.triggered.connect(self.load_file)
        file_menu.addAction(load_action)
        
        export_action = QAction('Export Excel', self)
        export_action.setShortcut('Ctrl+S')
        export_action.triggered.connect(self.export_to_excel)
        file_menu.addAction(export_action)
        
        file_menu.addSeparator()
        
        exit_action = QAction('Exit', self)
        exit_action.setShortcut('Ctrl+Q')
        exit_action.triggered.connect(self.close)
        file_menu.addAction(exit_action)
        
        # Menu Edit
        edit_menu = menubar.addMenu('Edit')
        
        copy_action = QAction('Copy', self)
        copy_action.setShortcut('Ctrl+C')
        copy_action.triggered.connect(self.copy_to_clipboard)
        edit_menu.addAction(copy_action)
        
        select_all_action = QAction('Select All', self)
        select_all_action.setShortcut('Ctrl+A')
        select_all_action.triggered.connect(self.table.selectAll)
        edit_menu.addAction(select_all_action)
        
    def load_file(self):
        files, _ = QFileDialog.getOpenFileNames(
            self, "Chọn file MD", 
            os.path.join(os.path.expanduser("~"), "Desktop", "output"),
            "Markdown Files (*.md)"
        )
        
        if files:
            for file_path in files:
                self.process_md_file(file_path)
                
            if files:
                self.status_label.setText(f"Đã load {len(files)} file")
                
    def load_folder(self):
        folder = QFileDialog.getExistingDirectory(
            self, "Chọn thư mục",
            os.path.join(os.path.expanduser("~"), "Desktop", "output")
        )
        
        if folder:
            md_files = []
            for root, dirs, files in os.walk(folder):
                for file in files:
                    if file.startswith("doc_") and file.endswith(".md"):
                        md_files.append(os.path.join(root, file))
            
            if md_files:
                for file_path in sorted(md_files):
                    self.process_md_file(file_path)
                self.status_label.setText(f"Đã load {len(md_files)} file từ thư mục")
            else:
                QMessageBox.warning(self, "Thông báo", "Không tìm thấy file doc_*.md trong thư mục")
    
    def process_md_file(self, file_path):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            soup = BeautifulSoup(content, 'lxml')
            table = soup.find('table')
            
            if not table:
                return
            
            # Parse headers
            headers = []
            header_row = table.find('tr')
            for th in header_row.find_all(['th', 'td']):
                headers.append(th.get_text(strip=True))
            
            # Parse data
            data = []
            rows = table.find_all('tr')[1:]
            for row in rows:
                cells = row.find_all(['td', 'th'])
                row_data = [cell.get_text(strip=True) for cell in cells]
                data.append(row_data)
            
            # Lưu vào dataframe
            df = pd.DataFrame(data, columns=headers)
            self.dataframes[file_path] = df
            
            # Thêm vào combobox
            file_name = os.path.basename(file_path)
            self.file_combo.addItem(f"{file_name}", file_path)
            
            # Nếu đây là file đầu tiên, hiển thị ngay
            if self.file_combo.count() == 1:
                self.display_table(df)
                self.current_file = file_path
                
        except Exception as e:
            QMessageBox.critical(self, "Lỗi", f"Không thể đọc file {file_path}:\n{str(e)}")
    
    def switch_file(self, index):
        if index >= 0:
            file_path = self.file_combo.itemData(index)
            if file_path in self.dataframes:
                self.display_table(self.dataframes[file_path])
                self.current_file = file_path
    
    def display_table(self, df):
        self.table.setRowCount(len(df))
        self.table.setColumnCount(len(df.columns))
        self.table.setHorizontalHeaderLabels(df.columns.tolist())
        
        for i in range(len(df)):
            for j in range(len(df.columns)):
                item = QTableWidgetItem(str(df.iloc[i, j]))
                item.setFlags(item.flags() | Qt.ItemIsEditable)
                self.table.setItem(i, j, item)
        
        self.table.resizeColumnsToContents()
        self.status_label.setText(f"Hiển thị {len(df)} dòng, {len(df.columns)} cột")
    
    def copy_to_clipboard(self):
        """Copy các ô đang chọn"""
        selected_ranges = self.table.selectedRanges()
        
        if not selected_ranges:
            # Nếu không có gì được chọn, copy toàn bộ
            self.copy_all_to_clipboard()
            return
        
        clipboard = QApplication.clipboard()
        text = ""
        
        for range_idx, selected_range in enumerate(selected_ranges):
            if range_idx > 0:
                text += "\n\n"  # Separation between ranges
            
            for row in range(selected_range.topRow(), selected_range.bottomRow() + 1):
                row_data = []
                for col in range(selected_range.leftColumn(), selected_range.rightColumn() + 1):
                    item = self.table.item(row, col)
                    if item:
                        row_data.append(item.text())
                    else:
                        row_data.append("")
                text += "\t".join(row_data) + "\n"
        
        clipboard.setText(text)
        QMessageBox.information(self, "Thành công", "Đã copy vào clipboard!\nBạn có thể paste vào Excel/Word.")
    
    def copy_all_to_clipboard(self):
        """Copy toàn bộ bảng"""
        clipboard = QApplication.clipboard()
        text = ""
        
        # Headers
        headers = []
        for col in range(self.table.columnCount()):
            item = self.table.horizontalHeaderItem(col)
            headers.append(item.text() if item else "")
        text += "\t".join(headers) + "\n"
        
        # Data
        for row in range(self.table.rowCount()):
            row_data = []
            for col in range(self.table.columnCount()):
                item = self.table.item(row, col)
                row_data.append(item.text() if item else "")
            text += "\t".join(row_data) + "\n"
        
        clipboard.setText(text)
        QMessageBox.information(self, "Thành công", "Đã copy toàn bộ bảng vào clipboard!")
    
    def export_to_excel(self):
        if self.current_file and self.current_file in self.dataframes:
            default_name = os.path.splitext(os.path.basename(self.current_file))[0] + ".xlsx"
            file_path, _ = QFileDialog.getSaveFileName(
                self, "Lưu file Excel", default_name, "Excel Files (*.xlsx)"
            )
            
            if file_path:
                try:
                    # Lấy dữ liệu từ table (có thể đã được chỉnh sửa)
                    data = []
                    headers = []
                    for col in range(self.table.columnCount()):
                        item = self.table.horizontalHeaderItem(col)
                        headers.append(item.text() if item else "")
                    
                    for row in range(self.table.rowCount()):
                        row_data = []
                        for col in range(self.table.columnCount()):
                            item = self.table.item(row, col)
                            row_data.append(item.text() if item else "")
                        data.append(row_data)
                    
                    df = pd.DataFrame(data, columns=headers)
                    df.to_excel(file_path, index=False, engine='openpyxl')
                    QMessageBox.information(self, "Thành công", f"Đã lưu file:\n{file_path}")
                except Exception as e:
                    QMessageBox.critical(self, "Lỗi", f"Không thể lưu file:\n{str(e)}")
        else:
            QMessageBox.warning(self, "Cảnh báo", "Vui lòng load file trước khi export")
    
    def export_to_csv(self):
        if self.current_file and self.current_file in self.dataframes:
            default_name = os.path.splitext(os.path.basename(self.current_file))[0] + ".csv"
            file_path, _ = QFileDialog.getSaveFileName(
                self, "Lưu file CSV", default_name, "CSV Files (*.csv)"
            )
            
            if file_path:
                try:
                    data = []
                    headers = []
                    for col in range(self.table.columnCount()):
                        item = self.table.horizontalHeaderItem(col)
                        headers.append(item.text() if item else "")
                    
                    for row in range(self.table.rowCount()):
                        row_data = []
                        for col in range(self.table.columnCount()):
                            item = self.table.item(row, col)
                            row_data.append(item.text() if item else "")
                        data.append(row_data)
                    
                    df = pd.DataFrame(data, columns=headers)
                    df.to_csv(file_path, index=False, encoding='utf-8-sig')
                    QMessageBox.information(self, "Thành công", f"Đã lưu file:\n{file_path}")
                except Exception as e:
                    QMessageBox.critical(self, "Lỗi", f"Không thể lưu file:\n{str(e)}")
        else:
            QMessageBox.warning(self, "Cảnh báo", "Vui lòng load file trước khi export")
    
    def clear_table(self):
        reply = QMessageBox.question(self, 'Xác nhận', 
                                    'Bạn có chắc muốn xóa toàn bộ dữ liệu?',
                                    QMessageBox.Yes | QMessageBox.No, 
                                    QMessageBox.No)
        if reply == QMessageBox.Yes:
            self.table.clear()
            self.table.setRowCount(0)
            self.table.setColumnCount(0)
            self.dataframes.clear()
            self.file_combo.clear()
            self.current_file = None
            self.status_label.setText("Đã xóa dữ liệu")

def main():
    app = QApplication(sys.argv)
    app.setStyle('Fusion')  # Modern style
    
    # Set font toàn ứng dụng
    font = QFont("Segoe UI", 10)
    app.setFont(font)
    
    viewer = MDTableViewer()
    viewer.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()