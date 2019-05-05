-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2019 at 04:58 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DiemDanh`
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
(96, 7, 13150094, 1, NULL),
(97, 7, 14150314, -1, 'etre'),
(98, 7, 14151292, -1, 'etre'),
(99, 7, 14150193, 1, NULL),
(100, 7, 14151522, -2, 'etre'),
(101, 7, 14150733, 1, NULL),
(102, 7, 14151212, 1, NULL),
(103, 7, 14151270, 1, NULL),
(104, 7, 14150951, 1, NULL),
(105, 7, 14150725, 1, NULL),
(106, 7, 14151255, 1, NULL),
(107, 7, 14150842, 1, NULL),
(108, 7, 14150751, 1, NULL),
(109, 7, 14150044, 1, NULL),
(110, 7, 14150922, 1, NULL),
(111, 7, 14151208, 1, NULL),
(112, 7, 14151279, 1, NULL),
(113, 7, 14150820, 1, NULL),
(114, 7, 14150713, 1, NULL),
(115, 7, 14150618, 1, NULL),
(116, 7, 14150485, 1, NULL),
(117, 7, 14150439, 1, NULL),
(118, 7, 14150966, 1, NULL),
(119, 7, 14150116, 1, NULL),
(120, 7, 14151311, 1, NULL),
(121, 7, 14151061, 1, NULL),
(122, 7, 14150570, 1, NULL),
(123, 7, 14151041, 1, NULL),
(124, 7, 14150114, 1, NULL),
(125, 7, 14150033, 1, NULL),
(126, 7, 14150451, 1, NULL),
(127, 7, 13150161, 1, NULL),
(128, 7, 14151538, 1, NULL),
(129, 7, 14150102, 1, NULL),
(130, 7, 14150247, 1, NULL),
(131, 7, 14150920, 1, NULL),
(132, 7, 14150657, 1, NULL),
(133, 7, 14151200, 1, NULL),
(134, 7, 14150989, 1, NULL),
(135, 7, 14150547, 1, NULL),
(136, 7, 14150401, 1, NULL),
(137, 7, 14150655, 1, NULL),
(138, 7, 14150176, 1, NULL),
(139, 7, 14150584, 1, NULL),
(140, 7, 14150583, 1, NULL),
(141, 7, 14150153, 1, NULL),
(142, 7, 14151073, 1, NULL),
(143, 7, 14150963, 1, NULL),
(144, 7, 14150555, 1, NULL),
(145, 7, 14151489, 1, NULL),
(146, 7, 11150318, 1, NULL),
(147, 7, 14150652, 1, NULL),
(148, 7, 14151568, 1, NULL),
(149, 7, 14150444, 1, NULL),
(150, 7, 9150277, 1, NULL),
(151, 7, 14151423, 1, NULL),
(152, 7, 14151562, 1, NULL),
(153, 7, 14150138, 1, NULL),
(154, 7, 14150182, 1, NULL),
(155, 7, 13151160, 1, NULL),
(156, 7, 14151386, 1, NULL),
(157, 8, 13150094, 1, NULL),
(158, 8, 14150314, -2, NULL),
(159, 8, 14151292, -1, 'trwew'),
(160, 8, 14150193, 1, NULL),
(161, 8, 14151522, -2, NULL),
(162, 8, 14150733, 1, NULL),
(163, 8, 14151212, 1, NULL),
(164, 8, 14151270, 1, NULL),
(165, 8, 14150951, 1, NULL),
(166, 8, 14150725, 1, NULL),
(167, 8, 14151255, 1, NULL),
(168, 8, 14150842, 1, NULL),
(169, 8, 14150751, 1, NULL),
(170, 8, 14150044, 1, NULL),
(171, 8, 14150922, 1, NULL),
(172, 8, 14151208, 1, NULL),
(173, 8, 14151279, 1, NULL),
(174, 8, 14150820, 1, NULL),
(175, 8, 14150713, 1, NULL),
(176, 8, 14150618, 1, NULL),
(177, 8, 14150485, 1, NULL),
(178, 8, 14150439, 1, NULL),
(179, 8, 14150966, 1, NULL),
(180, 8, 14150116, 1, NULL),
(181, 8, 14151311, 1, NULL),
(182, 8, 14151061, 1, NULL),
(183, 8, 14150570, 1, NULL),
(184, 8, 14151041, 1, NULL),
(185, 8, 14150114, 1, NULL),
(186, 8, 14150033, 1, NULL),
(187, 8, 14150451, 1, NULL),
(188, 8, 13150161, 1, NULL),
(189, 8, 14151538, 1, NULL),
(190, 8, 14150102, 1, NULL),
(191, 8, 14150247, 1, NULL),
(192, 8, 14150920, 1, NULL),
(193, 8, 14150657, 1, NULL),
(194, 8, 14151200, 1, NULL),
(195, 8, 14150989, 1, NULL),
(196, 8, 14150547, 1, NULL),
(197, 8, 14150401, 1, NULL),
(198, 8, 14150655, 1, NULL),
(199, 8, 14150176, 1, NULL),
(200, 8, 14150584, 1, NULL),
(201, 8, 14150583, 1, NULL),
(202, 8, 14150153, 1, NULL),
(203, 8, 14151073, 1, NULL),
(204, 8, 14150963, 1, NULL),
(205, 8, 14150555, 1, NULL),
(206, 8, 14151489, 1, NULL),
(207, 8, 11150318, 1, NULL),
(208, 8, 14150652, 1, NULL),
(209, 8, 14151568, 1, NULL),
(210, 8, 14150444, 1, NULL),
(211, 8, 9150277, 1, NULL),
(212, 8, 14151423, 1, NULL),
(213, 8, 14151562, 1, NULL),
(214, 8, 14150138, 1, NULL),
(215, 8, 14150182, 1, NULL),
(216, 8, 13151160, 1, NULL),
(217, 8, 14151386, 1, NULL);

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
(1, 14150033, 1231211),
(2, 14150044, 1231211),
(3, 14150102, 1231211),
(4, 14150114, 1231211),
(5, 14150116, 1231211),
(6, 14150138, 1231211),
(7, 13151160, 1231211),
(8, 14150153, 1231211),
(9, 14150182, 1231211),
(10, 14150176, 1231211),
(11, 14150193, 1231211),
(12, 14150247, 1231211),
(13, 14150314, 1231211),
(14, 14150401, 1231211),
(15, 14150439, 1231211),
(16, 14150444, 1231211),
(17, 14150451, 1231211),
(18, 14150485, 1231211),
(19, 14150547, 1231211),
(20, 14150583, 1231211),
(21, 14150584, 1231211),
(22, 14150618, 1231211),
(23, 14150555, 1231211),
(24, 14150570, 1231211),
(25, 13150094, 1231211),
(26, 14150652, 1231211),
(27, 14150655, 1231211),
(28, 14150657, 1231211),
(29, 9150277, 1231211),
(30, 14150713, 1231211),
(31, 14150725, 1231211),
(32, 14150733, 1231211),
(33, 14150751, 1231211),
(34, 14150820, 1231211),
(35, 14150842, 1231211),
(36, 14150920, 1231211),
(37, 14150922, 1231211),
(38, 11150318, 1231211),
(39, 14150951, 1231211),
(40, 14150963, 1231211),
(41, 14150966, 1231211),
(42, 14150989, 1231211),
(43, 14151041, 1231211),
(44, 14151061, 1231211),
(45, 14151073, 1231211),
(46, 13150161, 1231211),
(47, 14151200, 1231211),
(48, 14151208, 1231211),
(49, 14151212, 1231211),
(50, 14151255, 1231211),
(51, 14151270, 1231211),
(52, 14151292, 1231211),
(53, 14151279, 1231211),
(54, 14151311, 1231211),
(55, 14151386, 1231211),
(56, 14151423, 1231211),
(57, 14151489, 1231211),
(58, 14151522, 1231211),
(59, 14151538, 1231211),
(60, 14151562, 1231211),
(61, 14151568, 1231211),
(62, 14150033, 1231212),
(63, 14150044, 1231212),
(64, 14150102, 1231212),
(65, 14150114, 1231212),
(66, 14150116, 1231212),
(67, 14150138, 1231212),
(68, 13151160, 1231212),
(69, 14150153, 1231212),
(70, 14150182, 1231212),
(71, 14150176, 1231212),
(72, 14150193, 1231212),
(73, 14150247, 1231212),
(74, 14150314, 1231212),
(75, 14150401, 1231212),
(76, 14150439, 1231212),
(77, 14150444, 1231212),
(78, 14150451, 1231212),
(79, 14150485, 1231212),
(80, 14150547, 1231212),
(81, 14150583, 1231212),
(82, 14150584, 1231212),
(83, 14150618, 1231212),
(84, 14150555, 1231212),
(85, 14150570, 1231212),
(86, 13150094, 1231212),
(87, 14150652, 1231212),
(88, 14150655, 1231212),
(89, 14150657, 1231212),
(90, 9150277, 1231212),
(91, 14150713, 1231212),
(92, 14150725, 1231212),
(93, 14150733, 1231212),
(94, 14150751, 1231212),
(95, 14150820, 1231212),
(96, 14150842, 1231212),
(97, 14150920, 1231212),
(98, 14150922, 1231212),
(99, 11150318, 1231212),
(100, 14150951, 1231212),
(101, 14150963, 1231212),
(102, 14150966, 1231212),
(103, 14150989, 1231212),
(104, 14151041, 1231212),
(105, 14151061, 1231212),
(106, 14151073, 1231212),
(107, 13150161, 1231212),
(108, 14151200, 1231212),
(109, 14151208, 1231212),
(110, 14151212, 1231212),
(111, 14151255, 1231212),
(112, 14151270, 1231212),
(113, 14151292, 1231212),
(114, 14151279, 1231212),
(115, 14151311, 1231212),
(116, 14151386, 1231212),
(117, 14151423, 1231212),
(118, 14151489, 1231212),
(119, 14151522, 1231212),
(120, 14151538, 1231212),
(121, 14151562, 1231212),
(122, 14151568, 1231212);

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
(7, 13, '2019-04-29', 1),
(8, 14, '2019-04-30', 1);

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
(15, 1231211, '2019-04-23', 1, 1, 3),
(16, 1231211, '2019-04-30', 1, 1, 3);

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
-- Dumping data for table `tbl_lopmonhoc`
--

INSERT INTO `tbl_lopmonhoc` (`MaLMH`, `MaMH`, `MaLop`, `MaGVC`, `MaGVP`, `MaHK`, `Thu`, `TietBD`, `TietKT`, `TongSoBuoi`, `TrangThai`) VALUES
(1231211, 1, 1, 1, 2, 20191, 'Tue', 1, 3, 15, 1),
(1231212, 2, 1, 1, 2, 20191, 'Wed', 2, 4, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monhoc`
--

CREATE TABLE `tbl_monhoc` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `SoTinChi` int(11) DEFAULT NULL,
  `SoTiet` int(11) NOT NULL,
  `MaBM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `tbl_monhoc`
--

INSERT INTO `tbl_monhoc` (`MaMH`, `TenMH`, `SoTinChi`, `SoTiet`, `MaBM`) VALUES
(1, 'Tiếng Anh B11', 3, 15, 1),
(2, 'Tiếng Anh A12', 3, 15, 1);

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
(14150314, '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8'),
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
(9150277, 'Đặng Việt Khoa', '0000-00-00', NULL, NULL, 0),
(11150318, 'Đoàn Văn Ngọc', '0000-00-00', NULL, NULL, 0),
(13150094, 'Vũ Xuân Hưng', '0000-00-00', NULL, NULL, 0),
(13150161, 'Nguyễn Kim Sơn', '0000-00-00', NULL, NULL, 0),
(13151160, 'Bùi Mạnh Cường', '0000-00-00', NULL, NULL, 0),
(14150033, 'Nguyễn Miên Anh', '0000-00-00', NULL, NULL, 0),
(14150044, 'Nguyễn Thị Thuỳ Anh', '0000-00-00', NULL, NULL, 0),
(14150102, 'Nguyễn Đức Cảnh', '0000-00-00', NULL, NULL, 0),
(14150114, 'Nguyễn Minh Chiến', '0000-00-00', NULL, NULL, 0),
(14150116, 'Nguyễn Quyết Chiến', '0000-00-00', NULL, NULL, 0),
(14150138, 'Đào Văn Công', '0000-00-00', NULL, NULL, 0),
(14150153, 'Hoàng Đình Cường', '0000-00-00', NULL, NULL, 0),
(14150176, 'Hoàng Thị Diệp', '0000-00-00', NULL, NULL, 0),
(14150182, 'Bùi Thị Diễn', '0000-00-00', NULL, NULL, 0),
(14150193, 'Trần Thị Thuỳ Dung', '0000-00-00', NULL, NULL, 0),
(14150247, 'Ngô Xuân Dương', '0000-00-00', NULL, NULL, 0),
(14150314, 'Vũ Văn Đông', '0000-00-00', NULL, NULL, 0),
(14150401, 'Lê Đức Hài', '0000-00-00', NULL, NULL, 0),
(14150439, 'Nguyễn Thị Hiền', '0000-00-00', NULL, NULL, 0),
(14150444, 'Đặng Vũ Hiệp', '0000-00-00', NULL, NULL, 0),
(14150451, 'Nguyễn Mạnh Hiệp', '0000-00-00', NULL, NULL, 0),
(14150485, 'Nguyễn Thị Hoa', '0000-00-00', NULL, NULL, 0),
(14150547, 'Lê Kim Huệ', '0000-00-00', NULL, NULL, 0),
(14150555, 'Hà Minh Hùng', '0000-00-00', NULL, NULL, 0),
(14150570, 'Nguyễn Ngọc Hùng', '0000-00-00', NULL, NULL, 0),
(14150583, 'Hoàng Đình Huy', '0000-00-00', NULL, NULL, 0),
(14150584, 'Hoàng Quốc Huy', '0000-00-00', NULL, NULL, 0),
(14150618, 'Nguyễn Thị Minh Huyền', '0000-00-00', NULL, NULL, 0),
(14150652, 'Đoàn Thanh Hương', '0000-00-00', NULL, NULL, 0),
(14150655, 'Kim Thị Thuỳ Hương', '0000-00-00', NULL, NULL, 0),
(14150657, 'Ngô Quỳnh Hương', '0000-00-00', NULL, NULL, 0),
(14150713, 'Nguyễn Thị Phương Lan', '0000-00-00', NULL, NULL, 0),
(14150725, 'Nguyễn Xuân Lâm', '0000-00-00', NULL, NULL, 0),
(14150733, 'Phí Thị Kim Liên', '0000-00-00', NULL, NULL, 0),
(14150751, 'Nguyễn Tuấn Linh', '0000-00-00', NULL, NULL, 0),
(14150820, 'Nguyễn Thị Phương Mai', '0000-00-00', NULL, NULL, 0),
(14150842, 'Nguyễn Văn Mạnh', '0000-00-00', NULL, NULL, 0),
(14150920, 'Ngô Thị Thúy Nga', '0000-00-00', NULL, NULL, 0),
(14150922, 'Nguyễn Thị Thiên Nga', '0000-00-00', NULL, NULL, 0),
(14150951, 'Ninh Thị Nguyên', '0000-00-00', NULL, NULL, 0),
(14150963, 'Hà Thị Nhung', '0000-00-00', NULL, NULL, 0),
(14150966, 'Nguyễn Thị Cẩm Nhung', '0000-00-00', NULL, NULL, 0),
(14150989, 'Lê Kim Phòng', '0000-00-00', NULL, NULL, 0),
(14151041, 'Nguyễn Minh Quang', '0000-00-00', NULL, NULL, 0),
(14151061, 'Nguyễn Ngọc Quân', '0000-00-00', NULL, NULL, 0),
(14151073, 'Hà Thị Quyết', '0000-00-00', NULL, NULL, 0),
(14151200, 'Lê Mai Bích Thảo', '0000-00-00', NULL, NULL, 0),
(14151208, 'Nguyễn Thị Thảo', '0000-00-00', NULL, NULL, 0),
(14151212, 'Phạm Thu Thảo', '0000-00-00', NULL, NULL, 0),
(14151255, 'Nguyễn Văn Thiện', '0000-00-00', NULL, NULL, 0),
(14151270, 'Phạm Thị Thơm', '0000-00-00', NULL, NULL, 0),
(14151279, 'Nguyễn Thị Phương Thúy', '0000-00-00', NULL, NULL, 0),
(14151292, 'Vũ Thị Thuý', '0000-00-00', NULL, NULL, 0),
(14151311, 'Nguyễn Ngọc Trần Tiến', '0000-00-00', NULL, NULL, 0),
(14151386, 'Bùi Hà Trung', '0000-00-00', NULL, NULL, 0),
(14151423, 'Đặng Văn Tuấn', '0000-00-00', NULL, NULL, 0),
(14151489, 'Đỗ Văn Tú', '0000-00-00', NULL, NULL, 0),
(14151522, 'Trần Mạnh Tường', '0000-00-00', NULL, NULL, 0),
(14151538, 'Nguyễn Đức Việt', '0000-00-00', NULL, NULL, 0),
(14151562, 'Đào Xuân Vương', '0000-00-00', NULL, NULL, 0),
(14151568, 'Đinh Thị Yến', '0000-00-00', NULL, NULL, 0);

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
  MODIFY `MaChitietDiemdanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `tbl_chitietlopmonhoc`
--
ALTER TABLE `tbl_chitietlopmonhoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `tbl_diemdanh`
--
ALTER TABLE `tbl_diemdanh`
  MODIFY `MaDiemDanh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_monhoc`
--
ALTER TABLE `tbl_monhoc`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
