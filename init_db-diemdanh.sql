CREATE TABLE tbl_phuhuynh(
	-- id INT(20) NOT NULL,
    MaSV VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    PassHash CHAR (64) NOT NULL
   --  Sử dụng CHAR(64) vì sử dụng mã hóa SHA-256 
);

CREATE TABLE tbl_sinhvien(
	MaSV VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    HoTen VARCHAR(256) NOT NULL,
    NgaySinh DATE NOT NULL,
    Email VARCHAR(256),
    SoDT INT(11),
    MaLop VARCHAR(20)
);

CREATE TABLE tbl_giangvien(
	MaGV VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    HoTen VARCHAR(256) NOT NULL,
	NgaySinh DATE NOT NULL,
    Email VARCHAR(256),
    SoDT INT(11),
    MaBM VARCHAR(20),
	PassHash CHAR (64) NOT NULL
);

CREATE TABLE tbl_khoa(
	MaKhoa VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    TenKhoa VARCHAR(256) NOT NULL
);

CREATE	TABLE tbl_bomon(
	MaBM VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    TenBM VARCHAR(256) NOT NULL
);

CREATE TABLE tbl_lop(
	MaLop VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    TenLop VARCHAR(256) NOT NULL,
    MaKhoa VARCHAR(256) NOT NULL,
    NienKhoa CHAR(9) UNIQUE
);

CREATE TABLE tbl_monhoc(
	MaMH VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
	TenMH VARCHAR(256) NOT NULL,
    SoTinChi INT,
    MaBM INT(20)
);

CREATE TABLE tbl_lopmonhoc(
	MaLMH VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    MaGV VARCHAR(20),
    MaHK VARCHAR(20),
    TrangThai BOOL
);

CREATE TABLE tbl_lichchoc(
	MaLichHoc VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    MaLMH INT(20),
    Ngay DATE,
    SoTietHoc INT,
    TietBatDau INT
);

CREATE TABLE tbl_diemdanh(
	MaDiemDanh VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    MaSV INT(20),
    MaLichHoc INT(20),
    MaTrangThai INT,
    GhiChu VARCHAR(256)
);

CREATE TABLE tbl_trangthai(
	MaTrangThai INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TenTrangThai VARCHAR(256),
    MaLoai INT
);
-- (Cái này không biết dùng kiểu ENUM luôn được không, vì như vậy thêm
-- một bản cũng hơi thừa)
CREATE TABLE tbl_loaivang(
	MaLoai INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- (vắng có phép và vắng không phép, trong đó vắng có phép không tính 
--     vào 20% số buổi vắng) 
    TenLoai VARCHAR(256) 
)





