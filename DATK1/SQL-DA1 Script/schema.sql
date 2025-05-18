use master
go

--Quản lý hệ thống
create table Co_So
(
ID_CoSo int identity(10000000,1) primary key,
TenCoSo nvarchar(50) not null,
ChuCoSo nvarchar(50) not null,
DiaChi nvarchar(50) not null,
SĐT varchar(12) not null,
DienTich float not null --mét vuông
)
go

create table Vat_Nuoi
(
ID_VatNuoi int identity(30000000,1) primary key,
LoaiVatNuoi nvarchar(30) not null,
ThoiGianNuoi int not null, --ngày
TrongLuong float not null,  --kg
TieuThu float not null, --kg
TinhTrang nvarchar(50) not null,
ID_CoSo2 int not null,
foreign key (ID_CoSo2) references Co_So(ID_CoSo)
)
go

create table Nhan_Cong
(
ID_NhanCong int identity(40000000,1) primary key,
HoTen nvarchar(50) not null,
Luong int not null,  -- vnd
NgayNhanViec datetime not null,
SoDienThoai varchar(12) not null,
ChucVu nvarchar(50) not null,
ID_CoSo3 int,
foreign key (ID_CoSo3) references Co_So(ID_CoSo)
)
go

create table Tai_Khoan
(
ID_TaiKhoan int identity(20000000,1) primary key,
TenDangNhap nvarchar(50) not null,
MatKhau nvarchar(20) not null,
MoTa nvarchar(50) not null,
ID_NhanCong1 int,
foreign key (ID_NhanCong1) references Nhan_Cong(ID_NhanCong)
)
go

create table Hang_Hoa
(
ID_HangHoa int identity(50000000,1) primary key,
TenHangHoa nvarchar(40) not null,
SoLuong int not null, 
MoTa nvarchar(50) not null,
DonGia int not null, --vnd
TongGiaTriHangHoa int
)
go 

create table Nhap_Kho
(
SoPhieuNhap int identity(60000000,1) primary key,
TenHangHoa1 nvarchar(20) not null,
SoLuongNhap int not null,
DonGia int not null, --vnd
NgayNhapHang datetime not null,
ChiPhiNhapHang int not null --vnd
)
go

create table ChiTiet_NhapKho_HangHoa
(
ID_NhapKho_HangHoa int identity(1,1) primary key,
SoPhieuNhap1 int not null,
ID_HangHoa1 int not null,
SoLuongNhap int not null,
foreign key (SoPhieuNhap1) references Nhap_Kho(SoPhieuNhap),
foreign key (ID_HangHoa1) references Hang_Hoa(ID_HangHoa)
)
go

create table Xuat_Kho
(
SoPhieuXuat int identity(70000000,1) primary key,
TenHangHoa2 nvarchar(20) not null,
SoLuongXuat int not null,
DonGia int not null, --vnd
NgayXuatHang datetime not null,
ChiPhiGiaoDich int not null, --vnd
ID_CoSo1 int not null,
foreign key (ID_CoSo1) references Co_So(ID_CoSo)
)
go

create table ChiTiet_XuatKho_HangHoa
(
ID_XuatKho_HangHoa int identity(1,1) primary key,
SoPhieuXuat1 int not null,
ID_HangHoa2 int not null,
SoLuongXuat int not null,
foreign key (SoPhieuXuat1) references Xuat_Kho(SoPhieuXuat),
foreign key (ID_HangHoa2) references Hang_Hoa(ID_HangHoa)
)
go

create table Che_bien
(
ID_CheBien int identity(80000000,1) primary key,
SoLuongCheBien int not null,  -- số con vật
NgayCheBien datetime not null,
HSD datetime not null,
TenSanPham nvarchar(20) not null,
TrongLuongSanPham float not null, --kg
ChiPhiCheBien int not null,    --vnd
ID_VatNuoi1 int not null,
foreign key (ID_VatNuoi1) references Vat_Nuoi(ID_VatNuoi)
)
go

create table Hoa_Don
(
ID_HoaDon int identity(90000000,1) primary key,
TrongLuongSanPham1 float not null, --kg
GiaBan int not null, --kg
DoanhThu int not null, --vnd
NgayBan datetime not null
)
go

create table CheBien_HoaDon 
(
ID_CheBien_HoaDon int identity(1,1) primary key,
ID_CheBien1 int not null,
ID_HoaDon1 int not null,
TrongLuongSanPham float not null,
foreign key (ID_CheBien1) references Che_Bien(ID_CheBien),
foreign key (ID_HoaDon1) references Hoa_Don(ID_HoaDon)
)
go
