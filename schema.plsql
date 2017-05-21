-- Tạo bảng
create table NhanVien
(
  maNV char(10) primary key,
  hoTen nvarchar2(50),
  diaChi nvarchar2(100),
  dienThoai number,
  email varchar2(50),
  maPhong char(10),
  chiNhanh char(10),
  luong number
);

create table PhongBan
(
  maPhong char(10) primary key,
  tenPhong nvarchar2(50),
  truongPhong char(10),
  ngayNhanChuc date,
  soNhanVien number,
  chiNhanh char(10)
);

create table DuAn
(
  maDA char(10) primary key,
  tenDA nvarchar2(50),
  kinhPhi number,
  phongChuTri char(10),
  truongDA char(10)
);

create table ChiNhanh
(
  maCN char(10) primary key,
  tenCN nvarchar2(50),
  truongChiNhanh char(10)
);

create table ChiTieu
(
  maChiTieu char(10) primary key,
  tenChiTieu nvarchar2(50),
  soTien number,
  duAn char(10)
);

create table PhanCong
(
  maNV char(10),
  duAn char(10),
  vaiTro nvarchar2(50),
  phuCap number,
  primary key (maNV,duAn)
);

-- Tạo khóa ngoại

	alter table NhanVien
	add constraint fk_NhanVien_PhongBan
	foreign key (maPhong)
	references PhongBan(maPhong);
  
  alter table NhanVien
	add	constraint fk_NhanVien_ChiNhanh
	foreign key (chiNhanh)
	references ChiNhanh(maCN);

	alter table PhongBan
	add constraint fk_PhongBan_ChiNhanh
	foreign key (chiNhanh)
	references ChiNhanh(maCN);
  
  alter table PhongBan
	add	constraint fk_PhongBan_NhanVien
	foreign key (truongPhong)
	references NhanVien(maNV);

	alter table ChiNhanh
	add constraint ChiNhanh_NhanVien
	foreign key (truongChiNhanh)
	references NhanVien(maNV);

	alter table DuAn
	add constraint fk_DuAn_PhongBan
	foreign key (phongChuTri)
	references PhongBan(maPhong);
  
  alter table DuAn
	add	constraint fk_DuAn_NhanVien
	foreign key (truongDA)
	references NhanVien(maNV);

	alter table ChiTieu
	add constraint fk_ChiTieu_DuAn
	foreign key (duAn)
	references DuAn(maDA);

	alter table PhanCong
	add constraint fk_PhanCong_NhanVien
	foreign key (maNV)
	references NhanVien(maNV);
  
  alter table PhanCong
	add	constraint fk_PhanCong_DuAn
	foreign key (duAn)
	references DuAn(maDA);
  
 
INSERT ALL 
  INTO ChiNhanh VALUES ('CN001     ', 'TP Ho Chi Minh 1', NULL)
  INTO ChiNhanh VALUES ('CN002     ', 'Ha Noi', NULL)
  INTO ChiNhanh VALUES ('CN003     ', 'Da Nang', NULL)
  INTO ChiNhanh VALUES ('CN004     ', 'Hue', NULL)
  INTO ChiNhanh VALUES ('CN005     ', 'TP Ho Chi Minh 2', NULL)
SELECT * FROM dual;

INSERT ALL
INTO PhongBan VALUES ('PCSKH     ', 'Cham soc khach hang', NULL, to_date('03/09/2016','DD/MM/YYYY'), 2, 'CN004     ')
INTO PhongBan VALUES ('PKD       ', 'Kinh doanh', NULL,  to_date('09/11/2015','DD/MM/YYYY'), 2, 'CN001     ')
INTO PhongBan VALUES ('PKDCL     ', 'Kiem dinh chat luong', NULL,  to_date('02/08/2016','DD/MM/YYYY'), 2, 'CN005     ')
INTO PhongBan VALUES ('PNS       ', 'Nhan su', NULL,  to_date('03/04/2014','DD/MM/YYYY'), 2, 'CN003     ')
INTO PhongBan VALUES ('PTCKT     ', 'Tai chinh ke toan', NULL,  to_date('25/01/2017','DD/MM/YYYY'), 2, 'CN002     ')
SELECT* FROM dual;

INSERT ALL
INTO NhanVien VALUES ('GD001     ', 'Chung Ba Vinh', '56 Cong Quynh', '0123456789     ', 'GD001123@gmail.com', 'PCSKH     ', 'CN001     ', 5000)
INTO NhanVien VALUES ('GD002     ', 'Thach Van Ngoc Tanh', '554 To Ngoc Van', '0123456789     ', 'GD002123@gmail.com', 'PKD       ', 'CN002     ', 4500)
INTO NhanVien VALUES ('GD003     ', 'Doan Van Quy', '112 Pham Van Dong', '0123456789     ', 'GD003123@gmail.com', 'PKDCL     ', 'CN003     ', 4800)
INTO NhanVien VALUES ('GD004     ', 'Dao Quoc Thien', '84 Nguyen Dinh Chieu', '0123456789     ', 'GD004123@gmail.com', 'PNS       ', 'CN004     ', 4700)
INTO NhanVien VALUES ('GD005     ', 'Dinh Mong Long', '332 Nam Ki Khoi Nghia', '0123456789     ', 'GD005123@gmail.com', 'PTCKT     ', 'CN005     ', 4600)
INTO NhanVien VALUES ('NV001     ', 'Dau Thi Ngoc', '142 Phan Dinh Phung', '0123456789     ', 'NV001123@gmail.com', 'PCSKH     ', 'CN001     ', 1200)
INTO NhanVien VALUES ('NV002     ', 'Giang Tuan Anh', '554 Tran Quang Khai', '0123456789     ', 'NV002123@gmail.com', 'PCSKH     ', 'CN001     ', 900)
INTO NhanVien VALUES ('NV003     ', 'Le Ngoc Ba Tai', '88 Xa lo Ha Noi', '0123456789     ', 'NV003123@gmail.com', 'PKD       ', 'CN002     ', 1000)
INTO NhanVien VALUES ('NV004     ', 'Ho Thi Huong', '12 Nguyen Thi Thap', '0123456789     ', 'NV004123@gmail.com', 'PKD       ', 'CN002     ', 800)
INTO NhanVien VALUES ('NV005     ', 'Mac Van Ty', '65 An Duong Vuong', '0123456789     ', 'NV005123@gmail.com', 'PKDCL     ', 'CN003     ', 1100)
INTO NhanVien VALUES ('NV006     ', 'Huynh Thi Dep', '123 Hoa Hung', '0123456789     ', 'NV006123@gmail.com', 'PKDCL     ', 'CN003     ', 700)
INTO NhanVien VALUES ('NV007     ', 'Thai Van Nhat', '432 Hoang Van Thu', '0123456789     ', 'NV007123@gmail.com', 'PNS       ', 'CN004     ', 800)
INTO NhanVien VALUES ('NV008     ', 'Tran Ngoc Viet', '65 Pham Van Hai', '0123456789     ', 'NV008123@gmail.com', 'PNS       ', 'CN004     ', 1000)
INTO NhanVien VALUES ('NV009     ', 'Le Van Ngoc Nam', '87 Ly Thuong Kiet', '0123456789     ', 'NV009123@gmail.com', 'PTCKT     ', 'CN005     ', NULL)
INTO NhanVien VALUES ('NV010     ', 'Tieu Ngoc Mong Lan', '54 Hung Vuong', '0123456789     ', 'NV010123@gmail.com', 'PTCKT     ', 'CN005     ', NULL)
INTO NhanVien VALUES ('TCN001    ', 'Tran Dinh Son', '90 Vo Van Ngan', '0123456789     ', 'TCN001123@gmail.com', 'PCSKH     ', 'CN001     ', 2000)
INTO NhanVien VALUES ('TCN002    ', 'Doan Ngoc Thuy San', '1002 Vo Van Kiet', '0123456789     ', 'TCN002123@gmail.com', 'PKD       ', 'CN002     ', 2100)
INTO NhanVien VALUES ('TCN003    ', 'Cao Thi Hien', '12 Duong Ba Trac', '0123456789     ', 'TCN003123@gmail.com', 'PKDCL     ', 'CN003     ', 2300)
INTO NhanVien VALUES ('TCN004    ', 'Ngo Thi Ngoc', '89 Ly Thai To', '0123456789     ', 'TCN004123@gmail.com', 'PNS       ', 'CN004     ', 2000)
INTO NhanVien VALUES ('TCN005    ', 'Do Thi Sen', '78 Le Lai', '0123456789     ', 'TCN005123@gmail.com', 'PTCKT     ', 'CN005     ', 2200)
INTO NhanVien VALUES ('TDA001    ', 'Nguyen Van Nam', '123 Nguyen Van Cu', '0123456789     ', 'TDA001123@gmail.com', 'PCSKH     ', 'CN001     ', 2900)
INTO NhanVien VALUES ('TDA002    ', 'Tran Thi Mong Mo', '32 Nguyen Cu Trinh', '0123456789     ', 'TDA002123@gmail.com', 'PKD       ', 'CN002     ', 2800)
INTO NhanVien VALUES ('TDA003    ', 'Le Van Hoang', '123 Nguyen Trai', '0123456789     ', 'TDA003123@gmail.com', 'PKDCL     ', 'CN003     ', 2700)
INTO NhanVien VALUES ('TDA004    ', 'Mac Thi Van', '44 Le Van Sy', '0123456789     ', 'TDA004123@gmail.com', 'PNS       ', 'CN004     ', 2950)
INTO NhanVien VALUES ('TDA005    ', 'Dang Ngoc Nhan', '33 Tran Quoc Thao', '0123456789     ', 'TDA005123@gmail.com', 'PTCKT     ', 'CN005     ', 3000)
INTO NhanVien VALUES ('TP001     ', 'Hong Ngoc An', '66 Dien Bien Phu', '0123456789     ', 'TP001123@gmail.com', 'PCSKH     ', 'CN001     ', 1500)
INTO NhanVien VALUES ('TP002     ', 'Tieu Van Cam', '22 Cach mang thang 9', '0123456789     ', 'TP002123@gmail.com', 'PKD       ', 'CN002     ', 1600)
INTO NhanVien VALUES ('TP003     ', 'Le Ngoc Quyet Thang', '99 3/2', '0123456789     ', 'TP003123@gmail.com', 'PKDCL     ', 'CN003     ', 1700)
INTO NhanVien VALUES ('TP004     ', 'Mai Van Man', '78 Le Hong Phong', '0123456789     ', 'TP004123@gmail.com', 'PNS       ', 'CN004     ', 1600)
INTO NhanVien VALUES ('TP005     ', 'Le Thi Hong', '77 Kha Van Can', '0123456789     ', 'TP005123@gmail.com', 'PTCKT     ', 'CN005     ', 1900)
SELECT* FROM dual;

INSERT ALL
INTO DuAn VALUES ('DA001     ', 'Ra soat thi truong', 10000, 'PKD       ', 'TDA001    ')
INTO DuAn VALUES ('DA002     ', 'Tuyen nhan vien 2017', 1000, 'PNS       ', 'TDA002    ')
INTO DuAn VALUES ('DA003     ', 'Ke hoach tang luong', 100000, 'PTCKT     ', 'TDA003    ')
INTO DuAn VALUES ('DA004     ', 'Nghien cuu san pham moi', 2000, 'PKDCL     ', 'TDA004    ')
INTO DuAn VALUES ('DA005     ', 'Kiem ke tai chinh', 1200, 'PTCKT     ', 'TDA005    ')
SELECT* FROM dual;

INSERT ALL 
  INTO ChiTieu VALUES ('CT001     ', 'In an tai lieu', 1000, 'DA001     ')
  INTO ChiTieu VALUES ('CT002     ', 'Goi dien cho khach hang', 500, 'DA002     ')
  INTO ChiTieu VALUES ('CT003     ', 'Gap khach hang', 400, 'DA003     ')
  INTO ChiTieu VALUES ('CT004     ', 'Thue mat bang', 500, 'DA004     ')
  INTO ChiTieu VALUES ('CT005     ', 'Lien hoan', 500, 'DA005     ')
SELECT * FROM dual;

INSERT ALL
INTO PhanCong VALUES ('NV001     ', 'DA001     ', 'Thu thap bao cao', 100)
INTO PhanCong VALUES ('NV003     ', 'DA002     ', 'Goi dien cho cac ung vien duoi 25 tuoi o TPHCM', 100)
INTO PhanCong VALUES ('NV005     ', 'DA003     ', 'Phan tich so lieu viec lam cua nhan vien', 100)
INTO PhanCong VALUES ('NV007     ', 'DA004     ', 'Phan tich mau san pham', 100)
INTO PhanCong VALUES ('NV009     ', 'DA005     ', 'Tong ket cac so lieu bao cao', 100)
INTO PhanCong VALUES ('TDA001    ', 'DA001     ', 'Viet mau ra soat', 120)
INTO PhanCong VALUES ('TDA002    ', 'DA002     ', 'Tien hanh phong van cac nhan vien', 90)
INTO PhanCong VALUES ('TDA003    ', 'DA003     ', 'Lap bao cao so lieu tang luong cu the', 50)
INTO PhanCong VALUES ('TDA004    ', 'DA004     ', 'Dinh luong mau', 100)
INTO PhanCong VALUES ('TDA005    ', 'DA005     ', 'Tham gia kiem toan', 200)
SELECT* FROM dual;

update ChiNhanh 
set truongChiNhanh = 'TCN001' 
where maCN = 'CN001';

update ChiNhanh 
set truongChiNhanh = 'TCN002' 
where maCN = 'CN002';

update ChiNhanh 
set truongChiNhanh = 'TCN003' 
where maCN = 'CN003';

update ChiNhanh 
set truongChiNhanh = 'TCN004' 
where maCN = 'CN004';

update ChiNhanh 
set truongChiNhanh = 'TCN005' 
where maCN = 'CN005';

update PhongBan 
set truongPhong = 'TP001' 
where maPhong = 'PKD';

update PhongBan 
set truongPhong = 'TP002' 
where maPhong = 'PTCKT';

update PhongBan 
set truongPhong = 'TP003' 
where maPhong = 'PNS';

update PhongBan 
set truongPhong = 'TP004' 
where maPhong = 'PCSKH';

update PhongBan 
set truongPhong = 'TP005' 
where maPhong = 'PKDCL';
