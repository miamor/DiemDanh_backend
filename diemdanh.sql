-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 30, 2019 lúc 01:54 PM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `diemdanh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_bomon`
--

CREATE TABLE `tbl_bomon` (
  `MaBM` int(11) NOT NULL,
  `TenBM` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_bomon`
--

INSERT INTO `tbl_bomon` (`MaBM`, `TenBM`) VALUES
(1, 'Tiếng Anh kỹ sư'),
(2, 'Công nghệ phần mềm'),
(3, 'Công nghệ mạng'),
(4, 'Hệ thống thông tin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chitietdiemdanh`
--

CREATE TABLE `tbl_chitietdiemdanh` (
  `MaChitietDiemdanh` int(11) NOT NULL,
  `MaDiemDanh` int(11) NOT NULL,
  `MaSV` int(11) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `GhiChu` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_chitietdiemdanh`
--

INSERT INTO `tbl_chitietdiemdanh` (`MaChitietDiemdanh`, `MaDiemDanh`, `MaSV`, `TrangThai`, `GhiChu`) VALUES
(1, 1, 1054030231, -1, 'jhgfds'),
(2, 1, 1054030039, 1, NULL),
(3, 1, 1054030359, -2, 'y9uilkhmnvbv'),
(4, 1, 954030009, -2, '\" dgkjnem ; dkjfnke \\ c'),
(5, 1, 1054030225, 0, NULL),
(6, 1, 1054030093, 0, NULL),
(7, 1, 1054030334, 0, NULL),
(8, 1, 854030190, 0, NULL),
(9, 1, 954030282, 0, NULL),
(10, 1, 1054030032, 0, NULL),
(11, 1, 1054030318, 0, NULL),
(12, 1, 1054030440, 0, NULL),
(13, 1, 1054030016, 0, NULL),
(14, 1, 1054030428, 0, NULL),
(15, 1, 1054030307, 0, NULL),
(16, 1, 1054030316, 0, NULL),
(17, 1, 1054030272, 0, NULL),
(18, 1, 1054030027, 0, NULL),
(19, 1, 1054030271, 0, NULL),
(20, 1, 1054030035, 0, NULL),
(21, 1, 1054030237, 0, NULL),
(22, 1, 1054030221, 0, NULL),
(23, 1, 1054030298, 0, NULL),
(24, 1, 1054030122, 0, NULL),
(25, 1, 1054030402, 0, NULL),
(26, 1, 954030233, 0, NULL),
(27, 1, 1054030119, 0, NULL),
(28, 1, 1054030050, 0, NULL),
(29, 1, 1054030209, 0, NULL),
(30, 1, 1054030007, -1, 'Ly do nghi phep~~'),
(31, 1, 1054030330, 0, NULL),
(32, 1, 1054030006, 0, NULL),
(33, 1, 1054030001, 0, NULL),
(34, 1, 1054030244, 0, NULL),
(35, 1, 1054030336, 0, NULL),
(36, 1, 1054030069, 0, NULL),
(37, 1, 854030130, 0, NULL),
(38, 1, 1054030372, 0, NULL),
(39, 1, 1054030397, 0, NULL),
(40, 1, 1054030328, 0, NULL),
(41, 1, 954030040, 0, NULL),
(42, 1, 1054030412, 0, NULL),
(43, 1, 1054030421, 0, NULL),
(44, 1, 954030029, 0, NULL),
(45, 1, 1054030264, 0, NULL),
(46, 1, 954030075, 0, NULL),
(47, 1, 1054030086, 0, NULL),
(48, 1, 1054030155, 0, NULL),
(49, 1, 1054030414, 0, NULL),
(50, 2, 1054030231, 1, NULL),
(51, 2, 1054030334, -1, 'ikmuj'),
(52, 2, 1054030032, -2, 'o7,i8mu7n'),
(53, 2, 1054030440, 0, NULL),
(54, 2, 1054030016, 0, NULL),
(55, 2, 1054030272, 0, NULL),
(56, 2, 1054030237, 0, NULL),
(57, 2, 1054030221, 0, NULL),
(58, 2, 1054030122, 0, NULL),
(59, 2, 1054030119, 0, NULL),
(60, 2, 1054030007, 1, NULL),
(61, 2, 1054030006, 0, NULL),
(62, 2, 1054030244, 0, NULL),
(63, 2, 1054030328, 0, NULL),
(64, 2, 1054030412, 0, NULL),
(65, 2, 1054030264, 0, NULL),
(66, 2, 1054030086, 0, NULL),
(67, 3, 1054030231, 1, NULL),
(68, 3, 1054030334, -1, 'tuynt'),
(69, 3, 1054030032, 0, NULL),
(70, 3, 1054030440, 0, NULL),
(71, 3, 1054030016, 0, NULL),
(72, 3, 1054030272, 0, NULL),
(73, 3, 1054030237, 0, NULL),
(74, 3, 1054030221, 0, NULL),
(75, 3, 1054030122, 0, NULL),
(76, 3, 1054030119, 0, NULL),
(77, 3, 1054030007, 1, NULL),
(78, 3, 1054030006, 0, NULL),
(79, 3, 1054030244, 0, NULL),
(80, 3, 1054030328, 0, NULL),
(81, 3, 1054030412, 0, NULL),
(82, 3, 1054030264, 0, NULL),
(83, 3, 1054030086, 0, NULL),
(84, 4, NULL, NULL, NULL),
(85, 4, 1054030007, 1, NULL),
(86, 4, 1054030221, -1, 'Vang phep'),
(87, 4, 1054030244, -2, 'Vang khong phep~~~'),
(88, 5, NULL, NULL, NULL),
(89, 5, 1054030007, 1, NULL),
(90, 5, 1054030221, -1, 'Vang phep'),
(91, 5, 1054030244, -2, 'Vang khong phep~~~');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_chitietlopmonhoc`
--

CREATE TABLE `tbl_chitietlopmonhoc` (
  `ID` int(11) NOT NULL,
  `MaSV` int(11) DEFAULT NULL,
  `MaLMH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_chitietlopmonhoc`
--

INSERT INTO `tbl_chitietlopmonhoc` (`ID`, `MaSV`, `MaLMH`) VALUES
(1, 1054030007, 1231211),
(2, 1054030221, 1231211),
(3, 1054030244, 1231211),
(4, 1054030264, 1231211),
(5, 1054030328, 1231211),
(6, 1054030334, 1231211),
(7, 1054030412, 1231211),
(8, 1054030231, 1231211),
(9, 1054030440, 1231211),
(10, 1054030006, 1231211),
(11, 1054030016, 1231211),
(12, 1054030032, 1231211),
(13, 1054030086, 1231211),
(14, 1054030119, 1231211),
(15, 1054030122, 1231211),
(16, 1054030237, 1231211),
(17, 1054030272, 1231211);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_diemdanh`
--

CREATE TABLE `tbl_diemdanh` (
  `MaDiemDanh` int(11) NOT NULL,
  `MaLichHoc` int(11) DEFAULT NULL,
  `NgayDiemdanh` date DEFAULT NULL,
  `MaGV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_diemdanh`
--

INSERT INTO `tbl_diemdanh` (`MaDiemDanh`, `MaLichHoc`, `NgayDiemdanh`, `MaGV`) VALUES
(1, 15, '2019-02-24', 1),
(2, 14, '2019-03-12', 1),
(3, 13, '2019-03-12', 1),
(4, 12, '2019-04-16', 1),
(5, 11, '2019-04-16', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_giangvien`
--

CREATE TABLE `tbl_giangvien` (
  `MaGV` int(11) NOT NULL,
  `HoTen` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `Email` varchar(256) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SoDT` int(11) DEFAULT NULL,
  `MaBM` int(11) NOT NULL,
  `PassHash` char(64) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_giangvien`
--

INSERT INTO `tbl_giangvien` (`MaGV`, `HoTen`, `NgaySinh`, `Email`, `SoDT`, `MaBM`, `PassHash`) VALUES
(1, 'Nguyễn Khang', '1985-12-01', 'gv1@email.com', 123456789, 1, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'),
(2, 'Nguyễn Hữu Thiên', '1985-12-02', 'example@email.com', 123456789, 1, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D9'),
(3, 'Trần Mạnh  Hùng', '1985-12-03', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(4, 'Ngô Dương  Phương', '1985-12-04', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(5, 'Trần Đức  Tín', '1985-12-05', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(6, 'Vũ Đình  Sơn', '1985-12-06', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(7, 'Phạm Hoàng Cường', '1985-12-07', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(8, 'Đinh Gia  Huấn', '1985-12-08', 'example@email.com', 123456789, 2, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(9, 'Lê Minh  Huệ', '1985-12-09', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(10, 'Nguyễn Văn  Cương', '1985-12-10', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(11, 'Trần Trọng Sang', '1985-12-11', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(12, 'Lê Văn  Hải', '1985-12-12', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(13, 'Phạm Văn  Long', '1985-12-13', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(14, 'Trần  Thắng', '1985-12-14', 'example@email.com', 123456789, 4, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(15, 'Trần Anh  Vũ', '1985-12-15', 'example@email.com', 123456789, 4, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(16, 'Hoàng Đăng  Hưng', '1985-12-16', 'example@email.com', 123456789, 3, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_khoa`
--

CREATE TABLE `tbl_khoa` (
  `MaKhoa` int(11) NOT NULL,
  `TenKhoa` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_khoa`
--

INSERT INTO `tbl_khoa` (`MaKhoa`, `TenKhoa`) VALUES
(1, 'Ngoại ngữ'),
(2, 'Công nghệ thông tin'),
(3, 'Kỹ thuật điều khiển'),
(4, 'Mac Lê-nin'),
(5, 'Quân sự chung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_lichhoc`
--

CREATE TABLE `tbl_lichhoc` (
  `MaLichHoc` int(11) NOT NULL,
  `MaLMH` int(11) DEFAULT NULL,
  `Ngay` date DEFAULT NULL,
  `Phonghoc` int(11) DEFAULT NULL,
  `TietBatDau` int(11) DEFAULT NULL,
  `TietKetThuc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_lichhoc`
--

INSERT INTO `tbl_lichhoc` (`MaLichHoc`, `MaLMH`, `Ngay`, `Phonghoc`, `TietBatDau`, `TietKetThuc`) VALUES
(1, 1231211, '2019-01-15', 1, 1, 3),
(2, 1231211, '2019-01-22', 1, 1, 3),
(3, 1231211, '2019-01-29', 1, 1, 3),
(4, 1231211, '2019-02-05', 1, 1, 3),
(5, 1231211, '2019-02-12', 1, 1, 3),
(6, 1231211, '2019-02-19', 1, 1, 3),
(7, 1231211, '2019-02-26', 1, 1, 3),
(8, 1231211, '2019-03-05', 1, 1, 3),
(9, 1231211, '2019-03-12', 1, 1, 3),
(10, 1231211, '2019-03-19', 1, 1, 3),
(11, 1231211, '2019-03-26', 1, 1, 3),
(12, 1231211, '2019-04-02', 1, 1, 3),
(13, 1231211, '2019-04-09', 1, 1, 3),
(14, 1231211, '2019-04-16', 1, 1, 3),
(15, 1231211, '2019-04-23', 1, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_lop`
--

CREATE TABLE `tbl_lop` (
  `MaLop` int(11) NOT NULL,
  `TenLop` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `MaKhoa` int(11) NOT NULL,
  `NienKhoa` char(9) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_lop`
--

INSERT INTO `tbl_lop` (`MaLop`, `TenLop`, `MaKhoa`, `NienKhoa`) VALUES
(1, 'Công nghệ thông tin 14', 2, '2015-2019');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_lopmonhoc`
--

CREATE TABLE `tbl_lopmonhoc` (
  `MaLMH` int(11) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `MaLop` int(11) NOT NULL,
  `MaGVC` int(11) DEFAULT NULL,
  `MaGVP` int(11) DEFAULT NULL,
  `MaHK` int(11) DEFAULT NULL,
  `Thu` char(3) COLLATE utf8_vietnamese_ci NOT NULL,
  `TietBD` int(1) NOT NULL,
  `TietKT` int(1) NOT NULL,
  `TongSoBuoi` int(11) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_lopmonhoc`
--

INSERT INTO `tbl_lopmonhoc` (`MaLMH`, `MaMH`, `MaLop`, `MaGVC`, `MaGVP`, `MaHK`, `Thu`, `TietBD`, `TietKT`, `TongSoBuoi`, `TrangThai`) VALUES
(1231211, 1, 1, 1, 2, 20191, 'Tue', 1, 3, 15, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_monhoc`
--

CREATE TABLE `tbl_monhoc` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `SoTinChi` int(11) DEFAULT NULL,
  `MaBM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_monhoc`
--

INSERT INTO `tbl_monhoc` (`MaMH`, `TenMH`, `SoTinChi`, `MaBM`) VALUES
(1, 'Tiếng Anh B11', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_phuhuynh`
--

CREATE TABLE `tbl_phuhuynh` (
  `MaSV` int(11) NOT NULL,
  `PassHash` char(64) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_phuhuynh`
--

INSERT INTO `tbl_phuhuynh` (`MaSV`, `PassHash`) VALUES
(854030130, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(854030190, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030009, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030029, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030040, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030075, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030233, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(954030282, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D5'),
(1054030001, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030006, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030007, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'),
(1054030016, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030027, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030032, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030035, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030039, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030050, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030069, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030086, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030093, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030119, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030122, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030155, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030209, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030221, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'),
(1054030225, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D3'),
(1054030231, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030237, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030244, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D9'),
(1054030264, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030271, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030272, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030298, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030307, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030316, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030318, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030328, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030330, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030334, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030336, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030359, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030372, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030397, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030402, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030412, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1'),
(1054030414, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030421, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D2'),
(1054030428, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D4'),
(1054030440, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sinhvien`
--

CREATE TABLE `tbl_sinhvien` (
  `MaSV` int(11) NOT NULL,
  `HoTen` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `Email` varchar(256) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `SoDT` int(11) DEFAULT NULL,
  `MaLop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_sinhvien`
--

INSERT INTO `tbl_sinhvien` (`MaSV`, `HoTen`, `NgaySinh`, `Email`, `SoDT`, `MaLop`) VALUES
(854030130, 'Hoàng Thị Trà  My', '0000-00-00', 'abc', 123, 1),
(854030190, 'Phạm Thị Hồng Thắm', '0000-00-00', 'abc', 123, 1),
(954030009, 'Trần Tuấn Anh', '0000-00-00', 'abc', 123, 1),
(954030029, 'Đào Thị Thùy Dương', '0000-00-00', 'abc', 123, 1),
(954030040, 'Đỗ Sơn Hà', '0000-00-00', 'abc', 123, 1),
(954030075, 'Dương Thị Hoài', '0000-00-00', 'abc', 123, 1),
(954030233, 'Nguyễn Anh Tú', '0000-00-00', 'abc', 123, 1),
(954030282, 'Phạm Thị Hồng Linh', '0000-00-00', 'abc', 123, 1),
(1054030001, 'Lộc Thị Ngọc Ái', '0000-00-00', 'abc', 123, 1),
(1054030006, 'Lưu Kim Anh', '0000-00-00', 'abc', 123, 1),
(1054030007, 'Lý Hà Anh', '0000-00-00', 'abc', 123, 1),
(1054030016, 'Nguyễn Thị Vân Anh', '0000-00-00', 'abc', 123, 1),
(1054030027, 'Nguyễn Thị Ngọc Bích', '0000-00-00', 'abc', 123, 1),
(1054030032, 'Nông Thị Chăm', '0000-00-00', 'abc', 123, 1),
(1054030035, 'Nguyễn Thị Minh Châu', '0000-00-00', 'abc', 123, 1),
(1054030039, 'Uông Thanh Chiến', '0000-00-00', 'abc', 123, 1),
(1054030050, 'Mai Thị Huyền Diễm', '0000-00-00', 'abc', 123, 1),
(1054030069, 'Hoàng Văn Dũng', '0000-00-00', 'abc', 123, 1),
(1054030086, 'Chu Thị Thu Hà', '0000-00-00', 'abc', 123, 1),
(1054030093, 'Trần Thị Hà', '0000-00-00', 'abc', 123, 1),
(1054030119, 'Ngô Thị Hảo', '0000-00-00', 'abc', 123, 1),
(1054030122, 'Nguyễn Thị Hiên', '0000-00-00', 'abc', 123, 1),
(1054030155, 'Chu Thị Phương Hồng', '0000-00-00', 'abc', 123, 1),
(1054030209, 'Mạc Thị Lê', '0000-00-00', 'abc', 123, 1),
(1054030221, 'Nguyễn Thị Linh', '0000-00-00', 'abc', 123, 1),
(1054030225, 'Trần Thị Thuỳ Linh', '0000-00-00', 'abc', 123, 1),
(1054030231, 'Vũ Thị Loan', '0000-00-00', 'abc', 123, 1),
(1054030237, 'Nguyễn Thị Luyến', '0000-00-00', 'abc', 123, 1),
(1054030244, 'Lê Nguyễn Ngọc Mai', '0000-00-00', 'abc', 123, 1),
(1054030264, 'Dương Thị Thu Nga', '0000-00-00', 'abc', 123, 1),
(1054030271, 'Nguyễn Thị Nga', '0000-00-00', 'abc', 123, 1),
(1054030272, 'Nguyễn Thị Nguyệt Nga', '0000-00-00', 'abc', 123, 1),
(1054030298, 'Nguyễn Thị Hồng Nhung', '0000-00-00', 'abc', 123, 1),
(1054030307, 'Nguyễn Thị Phương', '0000-00-00', 'abc', 123, 1),
(1054030316, 'Nguyễn Thị Phượng', '0000-00-00', 'abc', 123, 1),
(1054030318, 'Nhữ Thị Phượng', '0000-00-00', 'abc', 123, 1),
(1054030328, 'Hà Thị Quỳnh', '0000-00-00', 'abc', 123, 1),
(1054030330, 'Lưu Thị Hương Quỳnh', '0000-00-00', 'abc', 123, 1),
(1054030334, 'Phạm Thị Sao', '0000-00-00', 'abc', 123, 1),
(1054030336, 'Lê Anh Sơn', '0000-00-00', 'abc', 123, 1),
(1054030359, 'Trình Thị Thảo', '0000-00-00', 'abc', 123, 1),
(1054030372, 'Hoàng Thị Kim Thúy', '0000-00-00', 'abc', 123, 1),
(1054030397, 'Hà Thị Thu Trang', '0000-00-00', 'abc', 123, 1),
(1054030402, 'Nguyễn Thanh Trang', '0000-00-00', 'abc', 123, 1),
(1054030412, 'Đặng Xuân Trường', '0000-00-00', 'abc', 123, 1),
(1054030414, 'Bùi Văn Tú', '0000-00-00', 'abc', 123, 1),
(1054030421, 'Đặng Hà Tuyến', '0000-00-00', 'abc', 123, 1),
(1054030428, 'Nguyễn Thị Vàn', '0000-00-00', 'abc', 123, 1),
(1054030440, 'Nguyễn Thị Xuân', '0000-00-00', 'abc', 123, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_bomon`
--
ALTER TABLE `tbl_bomon`
  ADD PRIMARY KEY (`MaBM`);

--
-- Chỉ mục cho bảng `tbl_chitietdiemdanh`
--
ALTER TABLE `tbl_chitietdiemdanh`
  ADD PRIMARY KEY (`MaChitietDiemdanh`),
  ADD KEY `MaSV` (`MaSV`),
  ADD KEY `MaDiemDanh` (`MaDiemDanh`);

--
-- Chỉ mục cho bảng `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MaLMH` (`MaLMH`),
  ADD KEY `MaSV` (`MaSV`);

--
-- Chỉ mục cho bảng `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  ADD PRIMARY KEY (`MaDiemDanh`),
  ADD KEY `MaLichHoc` (`MaLichHoc`),
  ADD KEY `MaGV` (`MaGV`);

--
-- Chỉ mục cho bảng `tbl_giangvien`
--
ALTER TABLE `tbl_giangvien`
  ADD PRIMARY KEY (`MaGV`),
  ADD KEY `MaBM` (`MaBM`);

--
-- Chỉ mục cho bảng `tbl_khoa`
--
ALTER TABLE `tbl_khoa`
  ADD PRIMARY KEY (`MaKhoa`);

--
-- Chỉ mục cho bảng `tbl_lichhoc`
--
ALTER TABLE `tbl_lichhoc`
  ADD PRIMARY KEY (`MaLichHoc`),
  ADD KEY `MaLMH` (`MaLMH`);

--
-- Chỉ mục cho bảng `tbl_lop`
--
ALTER TABLE `tbl_lop`
  ADD PRIMARY KEY (`MaLop`),
  ADD UNIQUE KEY `NienKhoa` (`NienKhoa`),
  ADD KEY `MaKhoa` (`MaKhoa`);

--
-- Chỉ mục cho bảng `tbl_lopmonhoc`
--
ALTER TABLE `tbl_lopmonhoc`
  ADD PRIMARY KEY (`MaLMH`),
  ADD KEY `MaMH` (`MaMH`),
  ADD KEY `MaLop` (`MaLop`),
  ADD KEY `MaGVC` (`MaGVC`),
  ADD KEY `MaGVP` (`MaGVP`);

--
-- Chỉ mục cho bảng `tbl_monhoc`
--
ALTER TABLE `tbl_monhoc`
  ADD PRIMARY KEY (`MaMH`),
  ADD KEY `MaBM` (`MaBM`);

--
-- Chỉ mục cho bảng `tbl_phuhuynh`
--
ALTER TABLE `tbl_phuhuynh`
  ADD PRIMARY KEY (`MaSV`);

--
-- Chỉ mục cho bảng `tbl_sinhvien`
--
ALTER TABLE `tbl_sinhvien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `MaLop` (`MaLop`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_chitietdiemdanh`
--
ALTER TABLE `tbl_chitietdiemdanh`
  MODIFY `MaChitietDiemdanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  MODIFY `MaDiemDanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_chitietdiemdanh`
--
ALTER TABLE `tbl_chitietdiemdanh`
  ADD CONSTRAINT `tbl_chitietdiemdanh_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `tbl_sinhvien` (`MaSV`),
  ADD CONSTRAINT `tbl_chitietdiemdanh_ibfk_2` FOREIGN KEY (`MaDiemDanh`) REFERENCES `tbl_diemdanh` (`MaDiemDanh`);

--
-- Các ràng buộc cho bảng `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  ADD CONSTRAINT `tbl_chitietlopmonhoc_ibfk_1` FOREIGN KEY (`MaLMH`) REFERENCES `tbl_lopmonhoc` (`MaLMH`),
  ADD CONSTRAINT `tbl_chitietlopmonhoc_ibfk_2` FOREIGN KEY (`MaSV`) REFERENCES `tbl_sinhvien` (`MaSV`);

--
-- Các ràng buộc cho bảng `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  ADD CONSTRAINT `tbl_diemdanh_ibfk_1` FOREIGN KEY (`MaLichHoc`) REFERENCES `tbl_lichhoc` (`MaLichHoc`),
  ADD CONSTRAINT `tbl_diemdanh_ibfk_2` FOREIGN KEY (`MaGV`) REFERENCES `tbl_giangvien` (`MaGV`);

--
-- Các ràng buộc cho bảng `tbl_giangvien`
--
ALTER TABLE `tbl_giangvien`
  ADD CONSTRAINT `tbl_giangvien_ibfk_1` FOREIGN KEY (`MaBM`) REFERENCES `tbl_bomon` (`MaBM`);

--
-- Các ràng buộc cho bảng `tbl_lichhoc`
--
ALTER TABLE `tbl_lichhoc`
  ADD CONSTRAINT `tbl_lichhoc_ibfk_1` FOREIGN KEY (`MaLMH`) REFERENCES `tbl_lopmonhoc` (`MaLMH`);

--
-- Các ràng buộc cho bảng `tbl_lop`
--
ALTER TABLE `tbl_lop`
  ADD CONSTRAINT `tbl_lop_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `tbl_khoa` (`MaKhoa`);

--
-- Các ràng buộc cho bảng `tbl_lopmonhoc`
--
ALTER TABLE `tbl_lopmonhoc`
  ADD CONSTRAINT `tbl_lopmonhoc_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `tbl_monhoc` (`MaMH`),
  ADD CONSTRAINT `tbl_lopmonhoc_ibfk_2` FOREIGN KEY (`MaLop`) REFERENCES `tbl_lop` (`MaLop`),
  ADD CONSTRAINT `tbl_lopmonhoc_ibfk_3` FOREIGN KEY (`MaGVC`) REFERENCES `tbl_giangvien` (`MaGV`),
  ADD CONSTRAINT `tbl_lopmonhoc_ibfk_4` FOREIGN KEY (`MaGVP`) REFERENCES `tbl_giangvien` (`MaGV`);

--
-- Các ràng buộc cho bảng `tbl_monhoc`
--
ALTER TABLE `tbl_monhoc`
  ADD CONSTRAINT `tbl_monhoc_ibfk_1` FOREIGN KEY (`MaBM`) REFERENCES `tbl_bomon` (`MaBM`);

--
-- Các ràng buộc cho bảng `tbl_sinhvien`
--
ALTER TABLE `tbl_sinhvien`
  ADD CONSTRAINT `tbl_sinhvien_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `tbl_lop` (`MaLop`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;