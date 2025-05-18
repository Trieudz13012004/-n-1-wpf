use master;
go


insert into dbo.Co_So (TenCoSo, ChuCoSo, DiaChi, SĐT, DienTich)
values 
(N'Cơ sở Chăn Nuôi Anh A', N'Nguyễn Văn A', N'Số 1 Trần Đại Nghĩa Hai Bà Trưng', '0320404030', 100.5),
(N'Cơ sở Chăn Nuôi Anh B', N'Hà Văn B', N'Số 43-Hồng Hà-Đan Phượng', '0123445789', 90.5),
(N'Cơ sở Chăn Nuôi Chị C', N'Nguyễn Thị C', N'Số 34-Trần Đại Nghĩa-Hai Bà Trưng', '0134524358', 100.0),
(N'Chăn nuôi Anh D', N'Phạm Văn D', N'Số 12-Hồng Hà-Đan Phượng', 'O234324547', 99.0),
(N'Chăn nuôi Chị Út', N'Lê Thị Út', N'Số 113-Trần Đại Nghĩa-Hai Bà Trưng', '0987654321', 100.0);



insert into dbo.Vat_Nuoi (LoaiVatNuoi, ThoiGianNuoi, TrongLuong, TieuThu, TinhTrang, ID_CoSo2)
values
(N'Gà Đông Tảo', 160, 10.2, 2.5, N'50 con khỏe, 5 con bệnh, 1 con đã chết', 10000000),
(N'Lợn Móng Cái', 300, 200.0, 10.0, N'40 con khỏe, 3 con bệnh, 0 con chết', 10000001),
(N'Gà Ác', 100, 5.0, 1.5, N'60 con khỏe, 5 con bệnh, 1 con đã chết', 10000002),
(N'Bò lai Sind', 350, 250.0, 8.0, N'40 con khỏe, 3 con bệnh, 0 con chết', 10000003),
(N'Bò vàng Việt Nam', 200, 250.0, 9.0, N'50 con khỏe, 4 con bệnh, 0 con chết', 10000004);


insert into dbo.Nhan_Cong (HoTen, Luong, NgayNhanViec, SoDienThoai, ChucVu, ID_CoSo3)
values
(N'Nguyễn Văn C', 5400000, 2025-01-01, '0123456789', N'Nhân viên chăn nuôi', 10000000),
(N'Nguyễn Đức C', 6000000, 2025-02-01, '0345432434', N'Nhân viên chăn nuôi', 10000002),
(N'Phạm Văn E', 12000000, 2025-02-04, '0234535678', N'Nhân viên phụ trách Cơ sở chăn nuôi', NULL),
(N'Nguyễn Thị F', 13000000, 2025-01-05, '0234456789', N'Nhân viên phụ trách Cơ sở chế biến', NULL),
(N'Hà Thị H', 14000000, 2025-02-05, '0345545534', N'Nhân viên quản lý Hóa đơn', NULL),
(N'Lê Thị L', 15000000, 2025-01-02, '0345987654', N'Cán bộ quản lý Hàng hóa', NULL),
(N'Nguyễn Thị A', 6000000, 2025-02-08, '0345324987', N'Nhân viên chăn nuôi', 10000003),
(N'Phạm Thị H', 5700000, 2025-03-01, '0234043405', N'Nhân viên chăn nuôi', 10000001),
(N'Cù Thị Nở', 5600000, 2025-02-01, '0234543455', N'Nhân viên chăn nuôi', 10000004);

SELECT 
    f.name AS ConstraintName,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    OBJECT_NAME(f.referenced_object_id) AS ReferencedTable
FROM sys.foreign_keys AS f
JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'Tai_Khoan'; -- hoặc 'Xuat_Kho'

ALTER TABLE dbo.Tai_Khoan DROP CONSTRAINT FK__Tai_Khoan__ID_Nh__28A2FA0E;
ALTER TABLE Tai_Khoan
ALTER COLUMN ID_NhanCong1 INT NULL;

ALTER TABLE Tai_Khoan
ADD CONSTRAINT FK_Tai_Khoan_ID_NhanCong1
FOREIGN KEY (ID_NhanCong1) REFERENCES Nhan_Cong(ID_NhanCong);

insert into dbo.Tai_Khoan (TenDangNhap, MatKhau, MoTa, ID_NhanCong1)
values
(N'PhamVanE', N'phamvane_123', N'Nhân viên phụ trách cơ sở chăn nuôi', 40000002),
(N'NguyenThiF', N'nguyenthif_345', N'Nhân viên phụ trách cơ sở chế biến', 40000003),
(N'HaThiH', N'hathih_135', N'Nhân viên quản lý Hóa đơn', 40000004),
(N'LeThiL', N'lethil_234', N'Cán bộ quản lý Hàng hóa', 40000005),
(N'Admin', N'admin_1234', N'Quản trị hệ thống', NULL);

insert into dbo.Hang_Hoa (TenHangHoa, SoLuong, MoTa, DonGia, TongGiaTriHangHoa)
values
(N'BMD 500', 150, N'Thuốc thú ý chuyên đường ruột cho gia cầm', 60000, 9000000),
(N'NOR 10', 100, N'Sản phẩm đặc trị hô hấp gia cầm', 50000, 5000000),
(N'PROPENTO', 100, N'Đặc trị nhiễm trùng', 100000, 10000000),
(N'Men tiêu hóa', 50, N'Đặc trị tiêu hóa cho lợn', 80000, 4000000),
(N'AMOXIVET L.A', 100, N'Đặc trị viêm phổi, viêm vú, viêm tử cung cho bò', 100000, 10000000),
(N'DEXASONE 2', 100, N'Kháng viêm, chống dị ứng, chống sốc', 80000, 8000000);

insert into dbo.Nhap_Kho (TenHangHoa1, SoLuongNhap, DonGia