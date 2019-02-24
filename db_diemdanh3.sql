-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2019 at 07:51 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_diemdanh3`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bomon`
--

CREATE TABLE `tbl_bomon` (
  `MaBM` int(11) NOT NULL,
  `TenBM` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_bomon`
--

INSERT INTO `tbl_bomon` (`MaBM`, `TenBM`) VALUES
(1, 'Tiếng Anh kỹ sư'),
(2, 'Công nghệ phần mềm'),
(3, 'Công nghệ mạng'),
(4, 'Hệ thống thông tin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chitietdiemdanh`
--

CREATE TABLE `tbl_chitietdiemdanh` (
  `MaChitietDiemdanh` int(11) NOT NULL,
  `MaDiemDanh` int(11) NOT NULL,
  `MaSV` int(11) DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `GhiChu` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_chitietdiemdanh`
--

INSERT INTO `tbl_chitietdiemdanh` (`MaChitietDiemdanh`, `MaDiemDanh`, `MaSV`, `TrangThai`, `GhiChu`) VALUES
(1, 1, 1054030007, 0, ''),
(2, 1, 1054030221, 1, ''),
(3, 1, 1054030244, 0, ''),
(4, 1, 1054030264, 2, ''),
(5, 1, 1054030328, 0, ''),
(6, 1, 1054030334, 1, ''),
(7, 1, 1054030412, 0, ''),
(8, 1, 1054030231, 1, ''),
(9, 1, 1054030440, 0, ''),
(10, 1, 1054030006, 1, ''),
(11, 1, 1054030016, 0, ''),
(12, 1, 1054030032, 0, ''),
(13, 1, 1054030086, 1, ''),
(14, 1, 1054030119, 1, ''),
(15, 1, 1054030122, 2, ''),
(16, 1, 1054030237, 1, ''),
(17, 1, 1054030272, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chitietlopmonhoc`
--

CREATE TABLE `tbl_chitietlopmonhoc` (
  `ID` int(11) NOT NULL,
  `MaSV` int(11) DEFAULT NULL,
  `MaLMH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_chitietlopmonhoc`
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
-- Table structure for table `tbl_diemdanh`
--

CREATE TABLE `tbl_diemdanh` (
  `MaDiemDanh` int(11) NOT NULL,
  `MaLichHoc` int(11) DEFAULT NULL,
  `NgayDiemdanh` date DEFAULT NULL,
  `MaGV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_diemdanh`
--

INSERT INTO `tbl_diemdanh` (`MaDiemDanh`, `MaLichHoc`, `NgayDiemdanh`, `MaGV`) VALUES
(1, 1, '2015-01-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_giangvien`
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
-- Dumping data for table `tbl_giangvien`
--

INSERT INTO `tbl_giangvien` (`MaGV`, `HoTen`, `NgaySinh`, `Email`, `SoDT`, `MaBM`, `PassHash`) VALUES
(1, 'Nguyễn Khang', '1985-12-01', 'example@email.com', 123456789, 1, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'),
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
-- Table structure for table `tbl_khoa`
--

CREATE TABLE `tbl_khoa` (
  `MaKhoa` int(11) NOT NULL,
  `TenKhoa` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_khoa`
--

INSERT INTO `tbl_khoa` (`MaKhoa`, `TenKhoa`) VALUES
(1, 'Ngoại ngữ'),
(2, 'Công nghệ thông tin'),
(3, 'Kỹ thuật điều khiển'),
(4, 'Mac Lê-nin'),
(5, 'Quân sự chung');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lichhoc`
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
-- Dumping data for table `tbl_lichhoc`
--

INSERT INTO `tbl_lichhoc` (`MaLichHoc`, `MaLMH`, `Ngay`, `Phonghoc`, `TietBatDau`, `TietKetThuc`) VALUES
(1, 1231211, '2018-01-15', 1, 3, 7),
(2, 1231211, '2018-01-22', 1, 3, 7),
(3, 1231211, '2018-01-29', 1, 3, 7),
(4, 1231211, '2018-02-05', 1, 3, 7),
(5, 1231211, '2018-02-12', 1, 3, 7),
(6, 1231211, '2018-02-19', 1, 3, 7),
(7, 1231211, '2018-02-26', 1, 3, 7),
(8, 1231211, '2018-03-05', 1, 3, 7),
(9, 1231211, '2018-03-12', 1, 3, 7),
(10, 1231211, '2018-03-19', 1, 3, 7),
(11, 1231211, '2018-03-26', 1, 3, 7),
(12, 1231211, '2018-04-02', 1, 3, 7),
(13, 1231211, '2018-04-09', 1, 3, 7),
(14, 1231211, '2018-04-16', 1, 3, 7),
(15, 1231211, '2018-04-23', 1, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lop`
--

CREATE TABLE `tbl_lop` (
  `MaLop` int(11) NOT NULL,
  `TenLop` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `MaKhoa` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `NienKhoa` char(9) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_lop`
--

INSERT INTO `tbl_lop` (`MaLop`, `TenLop`, `MaKhoa`, `NienKhoa`) VALUES
(1, 'Công nghệ thông tin 14', '2', '2015-2019');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lopmonhoc`
--

CREATE TABLE `tbl_lopmonhoc` (
  `MaLMH` int(11) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `MaGVC` int(11) DEFAULT NULL,
  `MaGVP` int(11) DEFAULT NULL,
  `MaHK` int(11) DEFAULT NULL,
  `TongSoBuoi` int(11) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_lopmonhoc`
--

INSERT INTO `tbl_lopmonhoc` (`MaLMH`, `MaMH`, `MaGVC`, `MaGVP`, `MaHK`, `TongSoBuoi`, `TrangThai`) VALUES
(1231211, 1, 1, 2, 20191, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monhoc`
--

CREATE TABLE `tbl_monhoc` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `SoTinChi` int(11) DEFAULT NULL,
  `MaBM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_monhoc`
--

INSERT INTO `tbl_monhoc` (`MaMH`, `TenMH`, `SoTinChi`, `MaBM`) VALUES
(1, 'Tiếng Anh B11', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phuhuynh`
--

CREATE TABLE `tbl_phuhuynh` (
  `MaSV` int(11) NOT NULL,
  `PassHash` char(64) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_phuhuynh`
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
-- Table structure for table `tbl_sinhvien`
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
-- Dumping data for table `tbl_sinhvien`
--

INSERT INTO `tbl_sinhvien` (`MaSV`, `HoTen`, `NgaySinh`, `Email`, `SoDT`, `MaLop`) VALUES
(854030130, 'Hoàng Thị Trà  My', '0000-00-00', 'abc', 123, 0),
(854030190, 'Phạm Thị Hồng Thắm', '0000-00-00', 'abc', 123, 0),
(954030009, 'Trần Tuấn Anh', '0000-00-00', 'abc', 123, 0),
(954030029, 'Đào Thị Thùy Dương', '0000-00-00', 'abc', 123, 0),
(954030040, 'Đỗ Sơn Hà', '0000-00-00', 'abc', 123, 0),
(954030075, 'Dương Thị Hoài', '0000-00-00', 'abc', 123, 0),
(954030233, 'Nguyễn Anh Tú', '0000-00-00', 'abc', 123, 0),
(954030282, 'Phạm Thị Hồng Linh', '0000-00-00', 'abc', 123, 0),
(1054030001, 'Lộc Thị Ngọc Ái', '0000-00-00', 'abc', 123, 0),
(1054030006, 'Lưu Kim Anh', '0000-00-00', 'abc', 123, 0),
(1054030007, 'Lý Hà Anh', '0000-00-00', 'abc', 123, 0),
(1054030016, 'Nguyễn Thị Vân Anh', '0000-00-00', 'abc', 123, 0),
(1054030027, 'Nguyễn Thị Ngọc Bích', '0000-00-00', 'abc', 123, 0),
(1054030032, 'Nông Thị Chăm', '0000-00-00', 'abc', 123, 0),
(1054030035, 'Nguyễn Thị Minh Châu', '0000-00-00', 'abc', 123, 0),
(1054030039, 'Uông Thanh Chiến', '0000-00-00', 'abc', 123, 0),
(1054030050, 'Mai Thị Huyền Diễm', '0000-00-00', 'abc', 123, 0),
(1054030069, 'Hoàng Văn Dũng', '0000-00-00', 'abc', 123, 0),
(1054030086, 'Chu Thị Thu Hà', '0000-00-00', 'abc', 123, 0),
(1054030093, 'Trần Thị Hà', '0000-00-00', 'abc', 123, 0),
(1054030119, 'Ngô Thị Hảo', '0000-00-00', 'abc', 123, 0),
(1054030122, 'Nguyễn Thị Hiên', '0000-00-00', 'abc', 123, 0),
(1054030155, 'Chu Thị Phương Hồng', '0000-00-00', 'abc', 123, 0),
(1054030209, 'Mạc Thị Lê', '0000-00-00', 'abc', 123, 0),
(1054030221, 'Nguyễn Thị Linh', '0000-00-00', 'abc', 123, 0),
(1054030225, 'Trần Thị Thuỳ Linh', '0000-00-00', 'abc', 123, 0),
(1054030231, 'Vũ Thị Loan', '0000-00-00', 'abc', 123, 0),
(1054030237, 'Nguyễn Thị Luyến', '0000-00-00', 'abc', 123, 0),
(1054030244, 'Lê Nguyễn Ngọc Mai', '0000-00-00', 'abc', 123, 0),
(1054030264, 'Dương Thị Thu Nga', '0000-00-00', 'abc', 123, 0),
(1054030271, 'Nguyễn Thị Nga', '0000-00-00', 'abc', 123, 0),
(1054030272, 'Nguyễn Thị Nguyệt Nga', '0000-00-00', 'abc', 123, 0),
(1054030298, 'Nguyễn Thị Hồng Nhung', '0000-00-00', 'abc', 123, 0),
(1054030307, 'Nguyễn Thị Phương', '0000-00-00', 'abc', 123, 0),
(1054030316, 'Nguyễn Thị Phượng', '0000-00-00', 'abc', 123, 0),
(1054030318, 'Nhữ Thị Phượng', '0000-00-00', 'abc', 123, 0),
(1054030328, 'Hà Thị Quỳnh', '0000-00-00', 'abc', 123, 0),
(1054030330, 'Lưu Thị Hương Quỳnh', '0000-00-00', 'abc', 123, 0),
(1054030334, 'Phạm Thị Sao', '0000-00-00', 'abc', 123, 0),
(1054030336, 'Lê Anh Sơn', '0000-00-00', 'abc', 123, 0),
(1054030359, 'Trình Thị Thảo', '0000-00-00', 'abc', 123, 0),
(1054030372, 'Hoàng Thị Kim Thúy', '0000-00-00', 'abc', 123, 0),
(1054030397, 'Hà Thị Thu Trang', '0000-00-00', 'abc', 123, 0),
(1054030402, 'Nguyễn Thanh Trang', '0000-00-00', 'abc', 123, 0),
(1054030412, 'Đặng Xuân Trường', '0000-00-00', 'abc', 123, 0),
(1054030414, 'Bùi Văn Tú', '0000-00-00', 'abc', 123, 0),
(1054030421, 'Đặng Hà Tuyến', '0000-00-00', 'abc', 123, 0),
(1054030428, 'Nguyễn Thị Vàn', '0000-00-00', 'abc', 123, 0),
(1054030440, 'Nguyễn Thị Xuân', '0000-00-00', 'abc', 123, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bomon`
--
ALTER TABLE `tbl_bomon`
  ADD PRIMARY KEY (`MaBM`);

--
-- Indexes for table `tbl_chitietdiemdanh`
--
ALTER TABLE `tbl_chitietdiemdanh`
  ADD PRIMARY KEY (`MaChitietDiemdanh`);

--
-- Indexes for table `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  ADD PRIMARY KEY (`MaDiemDanh`);

--
-- Indexes for table `tbl_giangvien`
--
ALTER TABLE `tbl_giangvien`
  ADD PRIMARY KEY (`MaGV`);

--
-- Indexes for table `tbl_khoa`
--
ALTER TABLE `tbl_khoa`
  ADD PRIMARY KEY (`MaKhoa`);

--
-- Indexes for table `tbl_lichhoc`
--
ALTER TABLE `tbl_lichhoc`
  ADD PRIMARY KEY (`MaLichHoc`);

--
-- Indexes for table `tbl_lop`
--
ALTER TABLE `tbl_lop`
  ADD PRIMARY KEY (`MaLop`),
  ADD UNIQUE KEY `NienKhoa` (`NienKhoa`);

--
-- Indexes for table `tbl_lopmonhoc`
--
ALTER TABLE `tbl_lopmonhoc`
  ADD PRIMARY KEY (`MaLMH`);

--
-- Indexes for table `tbl_monhoc`
--
ALTER TABLE `tbl_monhoc`
  ADD PRIMARY KEY (`MaMH`);

--
-- Indexes for table `tbl_phuhuynh`
--
ALTER TABLE `tbl_phuhuynh`
  ADD PRIMARY KEY (`MaSV`);

--
-- Indexes for table `tbl_sinhvien`
--
ALTER TABLE `tbl_sinhvien`
  ADD PRIMARY KEY (`MaSV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_chitietdiemdanh`
--
ALTER TABLE `tbl_chitietdiemdanh`
  MODIFY `MaChitietDiemdanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  MODIFY `MaDiemDanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
