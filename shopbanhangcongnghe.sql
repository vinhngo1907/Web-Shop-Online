-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 02, 2020 lúc 07:17 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopbanhangcongnghe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cauhinh`
--

CREATE TABLE `cauhinh` (
  `id` int(11) NOT NULL,
  `mail_smtp` varchar(68) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mail_smtp_password` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mail_noreply` varchar(68) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `priceShip` mediumtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cauhinh`
--

INSERT INTO `cauhinh` (`id`, `mail_smtp`, `mail_smtp_password`, `mail_noreply`, `priceShip`, `title`, `description`) VALUES
(1, 'sale.vinhngo2019@gmail.com', 'admin123', 'vinhngo1907@gmail.com', '30000', 'Shop Bán Hàng Công Nghệ', 'Shop bán hàng công nghệ. Chất lượng - giá cả hợp lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdathang`
--

CREATE TABLE `chitietdathang` (
  `id` int(11) NOT NULL,
  `sodondh` int(11) NOT NULL,
  `mshh` int(11) NOT NULL,
  `tenhh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `soluong` tinyint(4) NOT NULL,
  `giaban` int(11) NOT NULL,
  `giadathang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdathang`
--

INSERT INTO `chitietdathang` (`id`, `sodondh`, `mshh`, `tenhh`, `soluong`, `giaban`, `giadathang`) VALUES
(139, 107, 15, 'Router WiFi Linksys EA7500 Max-Stream™ AC1900 (MỚI)', 1, 2490000, 2490000),
(140, 107, 30, 'Apple Watch 5 40mm (GPS) Viền Nhôm Vàng - Dây Hồng (MWV72)', 1, 10315100, 10315100),
(141, 107, 39, 'Chuột không dây Logitech M185', 1, 250000, 250000),
(142, 107, 14, 'Anker Premium 7-in-1 USB-C Hub Adapter', 1, 1190000, 1190000),
(143, 108, 35, 'Dell Precision 7540 i9-9980H RAM 32GB SSD 512GB FHD IPS T2000', 1, 47990000, 47990000),
(144, 108, 38, 'Loa Bluetooth Xiaomi Mi Basic 2 Chính hãng', 1, 540000, 540000),
(145, 108, 39, 'Chuột không dây Logitech M185', 1, 250000, 250000),
(146, 108, 15, 'Router WiFi Linksys EA7500 Max-Stream™ AC1900 (MỚI)', 1, 2490000, 2490000),
(147, 109, 8, 'iMac Pro 2019 Xeon 3.2GHz RAM 32GB 1TB AMD Vega 56 27inch RETINA 5K', 1, 127000000, 127000000),
(148, 110, 9, 'iMac 2019 i5 3.7GHz RAM 8GB 2TB AMD 580X 27inch RETINA 5K ', 1, 56800000, 56800000),
(149, 111, 9, 'iMac 2019 i5 3.7GHz RAM 8GB 2TB AMD 580X 27inch RETINA 5K ', 1, 56800000, 56800000),
(150, 111, 13, 'Chuột không dây Fuhlen A06G (Mới)', 1, 139000, 139000),
(151, 111, 41, 'Razer Keyboard Bag V2', 1, 798000, 798000),
(152, 112, 8, 'iMac Pro 2019 Xeon 3.2GHz RAM 32GB 1TB AMD Vega 56 27inch RETINA 5K', 1, 127000000, 127000000),
(153, 112, 39, 'Chuột không dây Logitech M185', 1, 250000, 250000),
(154, 113, 36, 'Samsung Galaxy S10 White', 5, 16720000, 83600000),
(155, 114, 36, 'Samsung Galaxy S10 White', 2, 16720000, 33440000),
(156, 115, 41, 'Razer Keyboard Bag V2', 2, 798000, 1596000),
(157, 116, 36, 'Samsung Galaxy S10 White', 2, 16720000, 33440000),
(158, 117, 49, 'Samsung Galaxy Note 9 Xanh đen', 1, 19533000, 19533000),
(159, 117, 48, 'Laptop Asus Zenbook 14 UX433FA-A6113T', 1, 20920900, 20920900),
(160, 117, 43, 'Bàn phím + Chuột Logitech MK200', 1, 329000, 329000);

--
-- Bẫy `chitietdathang`
--
DELIMITER $$
CREATE TRIGGER `updateSL` AFTER INSERT ON `chitietdathang` FOR EACH ROW UPDATE hanghoa SET soluonghang = soluonghang-NEW.soluong WHERE mshh = NEW.mshh
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dathang`
--

CREATE TABLE `dathang` (
  `sodondh` int(11) NOT NULL,
  `hotenkh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mskh` int(11) NOT NULL,
  `msnv` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `diachi` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `dienthoai` varchar(13) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tongtien` int(11) NOT NULL,
  `ngaydh` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Đang chờ duyệt',
  `code` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `dathang`
--

INSERT INTO `dathang` (`sodondh`, `hotenkh`, `mskh`, `msnv`, `province`, `district`, `diachi`, `dienthoai`, `tongtien`, `ngaydh`, `trangthai`, `code`) VALUES
(107, 'Trần Thanh Tuy', 26, 1, 10, 7, '11, Nguyễn Trãi, p.Soc Sang, h.Cờ Đỏ, q.Ba Vì, tp.Bình Minh', '090305146', 27735100, '2020-06-07 11:50:03', 'Đã giao', 'S69TeNLZb2'),
(108, 'Thành Thành', 27, 1, 3, 30, '33, Đường số 14, p.Cuc Lạc, tp.Soc Ra Lang', '033564616', 51270000, '2020-06-07 11:52:25', 'Đang chờ duyệt', 'LMSbhpK05O'),
(109, 'Thanh Sơn', 28, 1, 1, 27, '46, Lê Lơi, Bến Thành', '0903121564', 127000000, '2020-06-07 12:03:15', 'Đang giao hàng', 'Ms8IYnyPaB'),
(110, 'Hiệp Gà', 13, 1, 1, 28, '157-159 Nguyễn Thị Minh Khai, P. Phạm Ngũ Lão, Q. 1', '0981643651', 56800000, '2020-06-07 12:11:58', 'Đang giao hàng', 'UsHNCDv7Fd'),
(111, 'Ngô Trung Vinh', 1, 1, 1, 89, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 57737000, '2020-06-08 11:14:13', 'Đã giao', 'wTs1VjEmC5'),
(112, 'Ngô Trung Vinh', 1, 1, 18, 3, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 127250000, '2020-06-08 11:36:16', 'Khách hàng đã hủy', 'Ql24uhjqPY'),
(113, 'Ngô Trung Vinh', 1, 1, 28, 1, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 83600000, '2020-06-12 17:27:14', 'Khách hàng đã hủy', 'fu1OJQpcVN'),
(114, 'Ngô Trung Vinh', 1, 1, 0, 0, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 33440000, '2020-06-12 17:31:22', 'Đã giao', 'gJvdeOiBx4'),
(115, 'Ngô Trung Vinh', 1, 1, 0, 0, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 1596000, '2020-06-12 18:34:56', 'Đang giao hàng', 'gXAlqfxETD'),
(116, 'Ngô Trung Vinh', 1, 1, 2, 27, 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 33440000, '2020-06-18 00:02:03', 'Đang chờ duyệt', 'xpHOCS9rqU'),
(117, 'Bảo bự', 29, 1, 28, 1, '30, Nam kỳ khởi nghĩa', '0932323252', 40782900, '2020-06-18 09:14:08', 'Đang chờ duyệt', 'NYgTs4uaeb');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_district`
--

CREATE TABLE `db_district` (
  `id` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `provinceid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_district`
--

INSERT INTO `db_district` (`id`, `name`, `type`, `provinceid`) VALUES
(1, 'Quận Ba Đình', 'Quận', 1),
(2, 'Quận Hoàn Kiếm', 'Quận', 1),
(3, 'Quận Tây Hồ', 'Quận', 1),
(4, 'Quận Long Biên', 'Quận', 1),
(5, 'Quận Cầu Giấy', 'Quận', 1),
(6, 'Quận Đống Đa', 'Quận', 1),
(7, 'Quận Hai Bà Trưng', 'Quận', 1),
(8, 'Quận Hoàng Mai', 'Quận', 1),
(9, 'Quận Thanh Xuân', 'Quận', 1),
(10, 'Huyện Sóc Sơn', 'Huyện', 1),
(11, 'Huyện Đông Anh', 'Huyện', 1),
(18, 'Huyện Gia Lâm', 'Huyện', 1),
(19, 'Quận Nam Từ Liêm', 'Quận', 1),
(20, 'Huyện Thanh Trì', 'Huyện', 1),
(21, 'Quận Bắc Từ Liêm', 'Quận', 1),
(24, 'Thành phố Hà Giang', 'Thành phố', 2),
(26, 'Huyện Đồng Văn', 'Huyện', 2),
(27, 'Huyện Mèo Vạc', 'Huyện', 2),
(28, 'Huyện Yên Minh', 'Huyện', 2),
(29, 'Huyện Quản Bạ', 'Huyện', 2),
(30, 'Huyện Vị Xuyên', 'Huyện', 2),
(31, 'Huyện Bắc Mê', 'Huyện', 2),
(32, 'Huyện Hoàng Su Phì', 'Huyện', 2),
(33, 'Huyện Xín Mần', 'Huyện', 2),
(34, 'Huyện Bắc Quang', 'Huyện', 2),
(35, 'Huyện Quang Bình', 'Huyện', 2),
(40, 'Thành phố Cao Bằng', 'Thành phố', 4),
(42, 'Huyện Bảo Lâm', 'Huyện', 4),
(43, 'Huyện Bảo Lạc', 'Huyện', 4),
(44, 'Huyện Thông Nông', 'Huyện', 4),
(45, 'Huyện Hà Quảng', 'Huyện', 4),
(46, 'Huyện Trà Lĩnh', 'Huyện', 4),
(47, 'Huyện Trùng Khánh', 'Huyện', 4),
(48, 'Huyện Hạ Lang', 'Huyện', 4),
(49, 'Huyện Quảng Uyên', 'Huyện', 4),
(50, 'Huyện Phục Hoà', 'Huyện', 4),
(51, 'Huyện Hoà An', 'Huyện', 4),
(52, 'Huyện Nguyên Bình', 'Huyện', 4),
(53, 'Huyện Thạch An', 'Huyện', 4),
(58, 'Thành Phố Bắc Kạn', 'Thành phố', 6),
(60, 'Huyện Pác Nặm', 'Huyện', 6),
(61, 'Huyện Ba Bể', 'Huyện', 6),
(62, 'Huyện Ngân Sơn', 'Huyện', 6),
(63, 'Huyện Bạch Thông', 'Huyện', 6),
(64, 'Huyện Chợ Đồn', 'Huyện', 6),
(65, 'Huyện Chợ Mới', 'Huyện', 6),
(66, 'Huyện Na Rì', 'Huyện', 6),
(70, 'Thành phố Tuyên Quang', 'Thành phố', 8),
(71, 'Huyện Lâm Bình', 'Huyện', 8),
(72, 'Huyện Nà Hang', 'Huyện', 8),
(73, 'Huyện Chiêm Hóa', 'Huyện', 8),
(74, 'Huyện Hàm Yên', 'Huyện', 8),
(75, 'Huyện Yên Sơn', 'Huyện', 8),
(76, 'Huyện Sơn Dương', 'Huyện', 8),
(80, 'Thành phố Lào Cai', 'Thành phố', 10),
(82, 'Huyện Bát Xát', 'Huyện', 10),
(83, 'Huyện Mường Khương', 'Huyện', 10),
(84, 'Huyện Si Ma Cai', 'Huyện', 10),
(85, 'Huyện Bắc Hà', 'Huyện', 10),
(86, 'Huyện Bảo Thắng', 'Huyện', 10),
(87, 'Huyện Bảo Yên', 'Huyện', 10),
(88, 'Huyện Sa Pa', 'Huyện', 10),
(89, 'Huyện Văn Bàn', 'Huyện', 10),
(94, 'Thành phố Điện Biên Phủ', 'Thành phố', 11),
(95, 'Thị Xã Mường Lay', 'Thị xã', 11),
(96, 'Huyện Mường Nhé', 'Huyện', 11),
(97, 'Huyện Mường Chà', 'Huyện', 11),
(98, 'Huyện Tủa Chùa', 'Huyện', 11),
(99, 'Huyện Tuần Giáo', 'Huyện', 11),
(100, 'Huyện Điện Biên', 'Huyện', 11),
(101, 'Huyện Điện Biên Đông', 'Huyện', 11),
(102, 'Huyện Mường Ảng', 'Huyện', 11),
(103, 'Huyện Nậm Pồ', 'Huyện', 11),
(105, 'Thành phố Lai Châu', 'Thành phố', 12),
(106, 'Huyện Tam Đường', 'Huyện', 12),
(107, 'Huyện Mường Tè', 'Huyện', 12),
(108, 'Huyện Sìn Hồ', 'Huyện', 12),
(109, 'Huyện Phong Thổ', 'Huyện', 12),
(110, 'Huyện Than Uyên', 'Huyện', 12),
(111, 'Huyện Tân Uyên', 'Huyện', 12),
(112, 'Huyện Nậm Nhùn', 'Huyện', 12),
(116, 'Thành phố Sơn La', 'Thành phố', 14),
(118, 'Huyện Quỳnh Nhai', 'Huyện', 14),
(119, 'Huyện Thuận Châu', 'Huyện', 14),
(120, 'Huyện Mường La', 'Huyện', 14),
(121, 'Huyện Bắc Yên', 'Huyện', 14),
(122, 'Huyện Phù Yên', 'Huyện', 14),
(123, 'Huyện Mộc Châu', 'Huyện', 14),
(124, 'Huyện Yên Châu', 'Huyện', 14),
(125, 'Huyện Mai Sơn', 'Huyện', 14),
(126, 'Huyện Sông Mã', 'Huyện', 14),
(127, 'Huyện Sốp Cộp', 'Huyện', 14),
(128, 'Huyện Vân Hồ', 'Huyện', 14),
(132, 'Thành phố Yên Bái', 'Thành phố', 15),
(133, 'Thị xã Nghĩa Lộ', 'Thị xã', 15),
(135, 'Huyện Lục Yên', 'Huyện', 15),
(136, 'Huyện Văn Yên', 'Huyện', 15),
(137, 'Huyện Mù Căng Chải', 'Huyện', 15),
(138, 'Huyện Trấn Yên', 'Huyện', 15),
(139, 'Huyện Trạm Tấu', 'Huyện', 15),
(140, 'Huyện Văn Chấn', 'Huyện', 15),
(141, 'Huyện Yên Bình', 'Huyện', 15),
(148, 'Thành phố Hòa Bình', 'Thành phố', 17),
(150, 'Huyện Đà Bắc', 'Huyện', 17),
(151, 'Huyện Kỳ Sơn', 'Huyện', 17),
(152, 'Huyện Lương Sơn', 'Huyện', 17),
(153, 'Huyện Kim Bôi', 'Huyện', 17),
(154, 'Huyện Cao Phong', 'Huyện', 17),
(155, 'Huyện Tân Lạc', 'Huyện', 17),
(156, 'Huyện Mai Châu', 'Huyện', 17),
(157, 'Huyện Lạc Sơn', 'Huyện', 17),
(158, 'Huyện Yên Thủy', 'Huyện', 17),
(159, 'Huyện Lạc Thủy', 'Huyện', 17),
(164, 'Thành phố Thái Nguyên', 'Thành phố', 19),
(165, 'Thành phố Sông Công', 'Thành phố', 19),
(167, 'Huyện Định Hóa', 'Huyện', 19),
(168, 'Huyện Phú Lương', 'Huyện', 19),
(169, 'Huyện Đồng Hỷ', 'Huyện', 19),
(170, 'Huyện Võ Nhai', 'Huyện', 19),
(171, 'Huyện Đại Từ', 'Huyện', 19),
(172, 'Thị xã Phổ Yên', 'Thị xã', 19),
(173, 'Huyện Phú Bình', 'Huyện', 19),
(178, 'Thành phố Lạng Sơn', 'Thành phố', 20),
(180, 'Huyện Tràng Định', 'Huyện', 20),
(181, 'Huyện Bình Gia', 'Huyện', 20),
(182, 'Huyện Văn Lãng', 'Huyện', 20),
(183, 'Huyện Cao Lộc', 'Huyện', 20),
(184, 'Huyện Văn Quan', 'Huyện', 20),
(185, 'Huyện Bắc Sơn', 'Huyện', 20),
(186, 'Huyện Hữu Lũng', 'Huyện', 20),
(187, 'Huyện Chi Lăng', 'Huyện', 20),
(188, 'Huyện Lộc Bình', 'Huyện', 20),
(189, 'Huyện Đình Lập', 'Huyện', 20),
(193, 'Thành phố Hạ Long', 'Thành phố', 22),
(194, 'Thành phố Móng Cái', 'Thành phố', 22),
(195, 'Thành phố Cẩm Phả', 'Thành phố', 22),
(196, 'Thành phố Uông Bí', 'Thành phố', 22),
(198, 'Huyện Bình Liêu', 'Huyện', 22),
(199, 'Huyện Tiên Yên', 'Huyện', 22),
(200, 'Huyện Đầm Hà', 'Huyện', 22),
(201, 'Huyện Hải Hà', 'Huyện', 22),
(202, 'Huyện Ba Chẽ', 'Huyện', 22),
(203, 'Huyện Vân Đồn', 'Huyện', 22),
(204, 'Huyện Hoành Bồ', 'Huyện', 22),
(205, 'Thị xã Đông Triều', 'Thị xã', 22),
(206, 'Thị xã Quảng Yên', 'Thị xã', 22),
(207, 'Huyện Cô Tô', 'Huyện', 22),
(213, 'Thành phố Bắc Giang', 'Thành phố', 24),
(215, 'Huyện Yên Thế', 'Huyện', 24),
(216, 'Huyện Tân Yên', 'Huyện', 24),
(217, 'Huyện Lạng Giang', 'Huyện', 24),
(218, 'Huyện Lục Nam', 'Huyện', 24),
(219, 'Huyện Lục Ngạn', 'Huyện', 24),
(220, 'Huyện Sơn Động', 'Huyện', 24),
(221, 'Huyện Yên Dũng', 'Huyện', 24),
(222, 'Huyện Việt Yên', 'Huyện', 24),
(223, 'Huyện Hiệp Hòa', 'Huyện', 24),
(227, 'Thành phố Việt Trì', 'Thành phố', 25),
(228, 'Thị xã Phú Thọ', 'Thị xã', 25),
(230, 'Huyện Đoan Hùng', 'Huyện', 25),
(231, 'Huyện Hạ Hoà', 'Huyện', 25),
(232, 'Huyện Thanh Ba', 'Huyện', 25),
(233, 'Huyện Phù Ninh', 'Huyện', 25),
(234, 'Huyện Yên Lập', 'Huyện', 25),
(235, 'Huyện Cẩm Khê', 'Huyện', 25),
(236, 'Huyện Tam Nông', 'Huyện', 25),
(237, 'Huyện Lâm Thao', 'Huyện', 25),
(238, 'Huyện Thanh Sơn', 'Huyện', 25),
(239, 'Huyện Thanh Thuỷ', 'Huyện', 25),
(240, 'Huyện Tân Sơn', 'Huyện', 25),
(243, 'Thành phố Vĩnh Yên', 'Thành phố', 26),
(244, 'Thị xã Phúc Yên', 'Thị xã', 26),
(246, 'Huyện Lập Thạch', 'Huyện', 26),
(247, 'Huyện Tam Dương', 'Huyện', 26),
(248, 'Huyện Tam Đảo', 'Huyện', 26),
(249, 'Huyện Bình Xuyên', 'Huyện', 26),
(250, 'Huyện Mê Linh', 'Huyện', 1),
(251, 'Huyện Yên Lạc', 'Huyện', 26),
(252, 'Huyện Vĩnh Tường', 'Huyện', 26),
(253, 'Huyện Sông Lô', 'Huyện', 26),
(256, 'Thành phố Bắc Ninh', 'Thành phố', 27),
(258, 'Huyện Yên Phong', 'Huyện', 27),
(259, 'Huyện Quế Võ', 'Huyện', 27),
(260, 'Huyện Tiên Du', 'Huyện', 27),
(261, 'Thị xã Từ Sơn', 'Thị xã', 27),
(262, 'Huyện Thuận Thành', 'Huyện', 27),
(263, 'Huyện Gia Bình', 'Huyện', 27),
(264, 'Huyện Lương Tài', 'Huyện', 27),
(268, 'Quận Hà Đông', 'Quận', 1),
(269, 'Thị xã Sơn Tây', 'Thị xã', 1),
(271, 'Huyện Ba Vì', 'Huyện', 1),
(272, 'Huyện Phúc Thọ', 'Huyện', 1),
(273, 'Huyện Đan Phượng', 'Huyện', 1),
(274, 'Huyện Hoài Đức', 'Huyện', 1),
(275, 'Huyện Quốc Oai', 'Huyện', 1),
(276, 'Huyện Thạch Thất', 'Huyện', 1),
(277, 'Huyện Chương Mỹ', 'Huyện', 1),
(278, 'Huyện Thanh Oai', 'Huyện', 1),
(279, 'Huyện Thường Tín', 'Huyện', 1),
(280, 'Huyện Phú Xuyên', 'Huyện', 1),
(281, 'Huyện Ứng Hòa', 'Huyện', 1),
(282, 'Huyện Mỹ Đức', 'Huyện', 1),
(288, 'Thành phố Hải Dương', 'Thành phố', 30),
(290, 'Thị xã Chí Linh', 'Thị xã', 30),
(291, 'Huyện Nam Sách', 'Huyện', 30),
(292, 'Huyện Kinh Môn', 'Huyện', 30),
(293, 'Huyện Kim Thành', 'Huyện', 30),
(294, 'Huyện Thanh Hà', 'Huyện', 30),
(295, 'Huyện Cẩm Giàng', 'Huyện', 30),
(296, 'Huyện Bình Giang', 'Huyện', 30),
(297, 'Huyện Gia Lộc', 'Huyện', 30),
(298, 'Huyện Tứ Kỳ', 'Huyện', 30),
(299, 'Huyện Ninh Giang', 'Huyện', 30),
(300, 'Huyện Thanh Miện', 'Huyện', 30),
(303, 'Quận Hồng Bàng', 'Quận', 31),
(304, 'Quận Ngô Quyền', 'Quận', 31),
(305, 'Quận Lê Chân', 'Quận', 31),
(306, 'Quận Hải An', 'Quận', 31),
(307, 'Quận Kiến An', 'Quận', 31),
(308, 'Quận Đồ Sơn', 'Quận', 31),
(309, 'Quận Dương Kinh', 'Quận', 31),
(311, 'Huyện Thuỷ Nguyên', 'Huyện', 31),
(312, 'Huyện An Dương', 'Huyện', 31),
(313, 'Huyện An Lão', 'Huyện', 31),
(314, 'Huyện Kiến Thuỵ', 'Huyện', 31),
(315, 'Huyện Tiên Lãng', 'Huyện', 31),
(316, 'Huyện Vĩnh Bảo', 'Huyện', 31),
(317, 'Huyện Cát Hải', 'Huyện', 31),
(318, 'Huyện Bạch Long Vĩ', 'Huyện', 31),
(323, 'Thành phố Hưng Yên', 'Thành phố', 33),
(325, 'Huyện Văn Lâm', 'Huyện', 33),
(326, 'Huyện Văn Giang', 'Huyện', 33),
(327, 'Huyện Yên Mỹ', 'Huyện', 33),
(328, 'Huyện Mỹ Hào', 'Huyện', 33),
(329, 'Huyện Ân Thi', 'Huyện', 33),
(330, 'Huyện Khoái Châu', 'Huyện', 33),
(331, 'Huyện Kim Động', 'Huyện', 33),
(332, 'Huyện Tiên Lữ', 'Huyện', 33),
(333, 'Huyện Phù Cừ', 'Huyện', 33),
(336, 'Thành phố Thái Bình', 'Thành phố', 34),
(338, 'Huyện Quỳnh Phụ', 'Huyện', 34),
(339, 'Huyện Hưng Hà', 'Huyện', 34),
(340, 'Huyện Đông Hưng', 'Huyện', 34),
(341, 'Huyện Thái Thụy', 'Huyện', 34),
(342, 'Huyện Tiền Hải', 'Huyện', 34),
(343, 'Huyện Kiến Xương', 'Huyện', 34),
(344, 'Huyện Vũ Thư', 'Huyện', 34),
(347, 'Thành phố Phủ Lý', 'Thành phố', 35),
(349, 'Huyện Duy Tiên', 'Huyện', 35),
(350, 'Huyện Kim Bảng', 'Huyện', 35),
(351, 'Huyện Thanh Liêm', 'Huyện', 35),
(352, 'Huyện Bình Lục', 'Huyện', 35),
(353, 'Huyện Lý Nhân', 'Huyện', 35),
(356, 'Thành phố Nam Định', 'Thành phố', 36),
(358, 'Huyện Mỹ Lộc', 'Huyện', 36),
(359, 'Huyện Vụ Bản', 'Huyện', 36),
(360, 'Huyện Ý Yên', 'Huyện', 36),
(361, 'Huyện Nghĩa Hưng', 'Huyện', 36),
(362, 'Huyện Nam Trực', 'Huyện', 36),
(363, 'Huyện Trực Ninh', 'Huyện', 36),
(364, 'Huyện Xuân Trường', 'Huyện', 36),
(365, 'Huyện Giao Thủy', 'Huyện', 36),
(366, 'Huyện Hải Hậu', 'Huyện', 36),
(369, 'Thành phố Ninh Bình', 'Thành phố', 37),
(370, 'Thành phố Tam Điệp', 'Thành phố', 37),
(372, 'Huyện Nho Quan', 'Huyện', 37),
(373, 'Huyện Gia Viễn', 'Huyện', 37),
(374, 'Huyện Hoa Lư', 'Huyện', 37),
(375, 'Huyện Yên Khánh', 'Huyện', 37),
(376, 'Huyện Kim Sơn', 'Huyện', 37),
(377, 'Huyện Yên Mô', 'Huyện', 37),
(380, 'Thành phố Thanh Hóa', 'Thành phố', 38),
(381, 'Thị xã Bỉm Sơn', 'Thị xã', 38),
(382, 'Thị xã Sầm Sơn', 'Thị xã', 38),
(384, 'Huyện Mường Lát', 'Huyện', 38),
(385, 'Huyện Quan Hóa', 'Huyện', 38),
(386, 'Huyện Bá Thước', 'Huyện', 38),
(387, 'Huyện Quan Sơn', 'Huyện', 38),
(388, 'Huyện Lang Chánh', 'Huyện', 38),
(389, 'Huyện Ngọc Lặc', 'Huyện', 38),
(390, 'Huyện Cẩm Thủy', 'Huyện', 38),
(391, 'Huyện Thạch Thành', 'Huyện', 38),
(392, 'Huyện Hà Trung', 'Huyện', 38),
(393, 'Huyện Vĩnh Lộc', 'Huyện', 38),
(394, 'Huyện Yên Định', 'Huyện', 38),
(395, 'Huyện Thọ Xuân', 'Huyện', 38),
(396, 'Huyện Thường Xuân', 'Huyện', 38),
(397, 'Huyện Triệu Sơn', 'Huyện', 38),
(398, 'Huyện Thiệu Hóa', 'Huyện', 38),
(399, 'Huyện Hoằng Hóa', 'Huyện', 38),
(400, 'Huyện Hậu Lộc', 'Huyện', 38),
(401, 'Huyện Nga Sơn', 'Huyện', 38),
(402, 'Huyện Như Xuân', 'Huyện', 38),
(403, 'Huyện Như Thanh', 'Huyện', 38),
(404, 'Huyện Nông Cống', 'Huyện', 38),
(405, 'Huyện Đông Sơn', 'Huyện', 38),
(406, 'Huyện Quảng Xương', 'Huyện', 38),
(407, 'Huyện Tĩnh Gia', 'Huyện', 38),
(412, 'Thành phố Vinh', 'Thành phố', 40),
(413, 'Thị xã Cửa Lò', 'Thị xã', 40),
(414, 'Thị xã Thái Hoà', 'Thị xã', 40),
(415, 'Huyện Quế Phong', 'Huyện', 40),
(416, 'Huyện Quỳ Châu', 'Huyện', 40),
(417, 'Huyện Kỳ Sơn', 'Huyện', 40),
(418, 'Huyện Tương Dương', 'Huyện', 40),
(419, 'Huyện Nghĩa Đàn', 'Huyện', 40),
(420, 'Huyện Quỳ Hợp', 'Huyện', 40),
(421, 'Huyện Quỳnh Lưu', 'Huyện', 40),
(422, 'Huyện Con Cuông', 'Huyện', 40),
(423, 'Huyện Tân Kỳ', 'Huyện', 40),
(424, 'Huyện Anh Sơn', 'Huyện', 40),
(425, 'Huyện Diễn Châu', 'Huyện', 40),
(426, 'Huyện Yên Thành', 'Huyện', 40),
(427, 'Huyện Đô Lương', 'Huyện', 40),
(428, 'Huyện Thanh Chương', 'Huyện', 40),
(429, 'Huyện Nghi Lộc', 'Huyện', 40),
(430, 'Huyện Nam Đàn', 'Huyện', 40),
(431, 'Huyện Hưng Nguyên', 'Huyện', 40),
(432, 'Thị xã Hoàng Mai', 'Thị xã', 40),
(436, 'Thành phố Hà Tĩnh', 'Thành phố', 42),
(437, 'Thị xã Hồng Lĩnh', 'Thị xã', 42),
(439, 'Huyện Hương Sơn', 'Huyện', 42),
(440, 'Huyện Đức Thọ', 'Huyện', 42),
(441, 'Huyện Vũ Quang', 'Huyện', 42),
(442, 'Huyện Nghi Xuân', 'Huyện', 42),
(443, 'Huyện Can Lộc', 'Huyện', 42),
(444, 'Huyện Hương Khê', 'Huyện', 42),
(445, 'Huyện Thạch Hà', 'Huyện', 42),
(446, 'Huyện Cẩm Xuyên', 'Huyện', 42),
(447, 'Huyện Kỳ Anh', 'Huyện', 42),
(448, 'Huyện Lộc Hà', 'Huyện', 42),
(449, 'Thị xã Kỳ Anh', 'Thị xã', 42),
(450, 'Thành Phố Đồng Hới', 'Thành phố', 44),
(452, 'Huyện Minh Hóa', 'Huyện', 44),
(453, 'Huyện Tuyên Hóa', 'Huyện', 44),
(454, 'Huyện Quảng Trạch', 'Thị xã', 44),
(455, 'Huyện Bố Trạch', 'Huyện', 44),
(456, 'Huyện Quảng Ninh', 'Huyện', 44),
(457, 'Huyện Lệ Thủy', 'Huyện', 44),
(458, 'Thị xã Ba Đồn', 'Huyện', 44),
(461, 'Thành phố Đông Hà', 'Thành phố', 45),
(462, 'Thị xã Quảng Trị', 'Thị xã', 45),
(464, 'Huyện Vĩnh Linh', 'Huyện', 45),
(465, 'Huyện Hướng Hóa', 'Huyện', 45),
(466, 'Huyện Gio Linh', 'Huyện', 45),
(467, 'Huyện Đa Krông', 'Huyện', 45),
(468, 'Huyện Cam Lộ', 'Huyện', 45),
(469, 'Huyện Triệu Phong', 'Huyện', 45),
(470, 'Huyện Hải Lăng', 'Huyện', 45),
(471, 'Huyện Cồn Cỏ', 'Huyện', 45),
(474, 'Thành phố Huế', 'Thành phố', 46),
(476, 'Huyện Phong Điền', 'Huyện', 46),
(477, 'Huyện Quảng Điền', 'Huyện', 46),
(478, 'Huyện Phú Vang', 'Huyện', 46),
(479, 'Thị xã Hương Thủy', 'Thị xã', 46),
(480, 'Thị xã Hương Trà', 'Thị xã', 46),
(481, 'Huyện A Lưới', 'Huyện', 46),
(482, 'Huyện Phú Lộc', 'Huyện', 46),
(483, 'Huyện Nam Đông', 'Huyện', 46),
(490, 'Quận Liên Chiểu', 'Quận', 48),
(491, 'Quận Thanh Khê', 'Quận', 48),
(492, 'Quận Hải Châu', 'Quận', 48),
(493, 'Quận Sơn Trà', 'Quận', 48),
(494, 'Quận Ngũ Hành Sơn', 'Quận', 48),
(495, 'Quận Cẩm Lệ', 'Quận', 48),
(497, 'Huyện Hòa Vang', 'Huyện', 48),
(498, 'Huyện Hoàng Sa', 'Huyện', 48),
(502, 'Thành phố Tam Kỳ', 'Thành phố', 49),
(503, 'Thành phố Hội An', 'Thành phố', 49),
(504, 'Huyện Tây Giang', 'Huyện', 49),
(505, 'Huyện Đông Giang', 'Huyện', 49),
(506, 'Huyện Đại Lộc', 'Huyện', 49),
(507, 'Thị xã Điện Bàn', 'Thị xã', 49),
(508, 'Huyện Duy Xuyên', 'Huyện', 49),
(509, 'Huyện Quế Sơn', 'Huyện', 49),
(510, 'Huyện Nam Giang', 'Huyện', 49),
(511, 'Huyện Phước Sơn', 'Huyện', 49),
(512, 'Huyện Hiệp Đức', 'Huyện', 49),
(513, 'Huyện Thăng Bình', 'Huyện', 49),
(514, 'Huyện Tiên Phước', 'Huyện', 49),
(515, 'Huyện Bắc Trà My', 'Huyện', 49),
(516, 'Huyện Nam Trà My', 'Huyện', 49),
(517, 'Huyện Núi Thành', 'Huyện', 49),
(518, 'Huyện Phú Ninh', 'Huyện', 49),
(519, 'Huyện Nông Sơn', 'Huyện', 49),
(522, 'Thành phố Quảng Ngãi', 'Thành phố', 51),
(524, 'Huyện Bình Sơn', 'Huyện', 51),
(525, 'Huyện Trà Bồng', 'Huyện', 51),
(526, 'Huyện Tây Trà', 'Huyện', 51),
(527, 'Huyện Sơn Tịnh', 'Huyện', 51),
(528, 'Huyện Tư Nghĩa', 'Huyện', 51),
(529, 'Huyện Sơn Hà', 'Huyện', 51),
(530, 'Huyện Sơn Tây', 'Huyện', 51),
(531, 'Huyện Minh Long', 'Huyện', 51),
(532, 'Huyện Nghĩa Hành', 'Huyện', 51),
(533, 'Huyện Mộ Đức', 'Huyện', 51),
(534, 'Huyện Đức Phổ', 'Huyện', 51),
(535, 'Huyện Ba Tơ', 'Huyện', 51),
(536, 'Huyện Lý Sơn', 'Huyện', 51),
(540, 'Thành phố Qui Nhơn', 'Thành phố', 52),
(542, 'Huyện An Lão', 'Huyện', 52),
(543, 'Huyện Hoài Nhơn', 'Huyện', 52),
(544, 'Huyện Hoài Ân', 'Huyện', 52),
(545, 'Huyện Phù Mỹ', 'Huyện', 52),
(546, 'Huyện Vĩnh Thạnh', 'Huyện', 52),
(547, 'Huyện Tây Sơn', 'Huyện', 52),
(548, 'Huyện Phù Cát', 'Huyện', 52),
(549, 'Thị xã An Nhơn', 'Thị xã', 52),
(550, 'Huyện Tuy Phước', 'Huyện', 52),
(551, 'Huyện Vân Canh', 'Huyện', 52),
(555, 'Thành phố Tuy Hoà', 'Thành phố', 54),
(557, 'Thị xã Sông Cầu', 'Thị xã', 54),
(558, 'Huyện Đồng Xuân', 'Huyện', 54),
(559, 'Huyện Tuy An', 'Huyện', 54),
(560, 'Huyện Sơn Hòa', 'Huyện', 54),
(561, 'Huyện Sông Hinh', 'Huyện', 54),
(562, 'Huyện Tây Hoà', 'Huyện', 54),
(563, 'Huyện Phú Hoà', 'Huyện', 54),
(564, 'Huyện Đông Hòa', 'Huyện', 54),
(568, 'Thành phố Nha Trang', 'Thành phố', 56),
(569, 'Thành phố Cam Ranh', 'Thành phố', 56),
(570, 'Huyện Cam Lâm', 'Huyện', 56),
(571, 'Huyện Vạn Ninh', 'Huyện', 56),
(572, 'Thị xã Ninh Hòa', 'Thị xã', 56),
(573, 'Huyện Khánh Vĩnh', 'Huyện', 56),
(574, 'Huyện Diên Khánh', 'Huyện', 56),
(575, 'Huyện Khánh Sơn', 'Huyện', 56),
(576, 'Huyện Trường Sa', 'Huyện', 56),
(582, 'Thành phố Phan Rang-Tháp Chàm', 'Thành phố', 58),
(584, 'Huyện Bác Ái', 'Huyện', 58),
(585, 'Huyện Ninh Sơn', 'Huyện', 58),
(586, 'Huyện Ninh Hải', 'Huyện', 58),
(587, 'Huyện Ninh Phước', 'Huyện', 58),
(588, 'Huyện Thuận Bắc', 'Huyện', 58),
(589, 'Huyện Thuận Nam', 'Huyện', 58),
(593, 'Thành phố Phan Thiết', 'Thành phố', 60),
(594, 'Thị xã La Gi', 'Thị xã', 60),
(595, 'Huyện Tuy Phong', 'Huyện', 60),
(596, 'Huyện Bắc Bình', 'Huyện', 60),
(597, 'Huyện Hàm Thuận Bắc', 'Huyện', 60),
(598, 'Huyện Hàm Thuận Nam', 'Huyện', 60),
(599, 'Huyện Tánh Linh', 'Huyện', 60),
(600, 'Huyện Đức Linh', 'Huyện', 60),
(601, 'Huyện Hàm Tân', 'Huyện', 60),
(602, 'Huyện Phú Quí', 'Huyện', 60),
(608, 'Thành phố Kon Tum', 'Thành phố', 62),
(610, 'Huyện Đắk Glei', 'Huyện', 62),
(611, 'Huyện Ngọc Hồi', 'Huyện', 62),
(612, 'Huyện Đắk Tô', 'Huyện', 62),
(613, 'Huyện Kon Plông', 'Huyện', 62),
(614, 'Huyện Kon Rẫy', 'Huyện', 62),
(615, 'Huyện Đắk Hà', 'Huyện', 62),
(616, 'Huyện Sa Thầy', 'Huyện', 62),
(617, 'Huyện Tu Mơ Rông', 'Huyện', 62),
(618, 'Huyện Ia H\' Drai', 'Huyện', 62),
(622, 'Thành phố Pleiku', 'Thành phố', 64),
(623, 'Thị xã An Khê', 'Thị xã', 64),
(624, 'Thị xã Ayun Pa', 'Thị xã', 64),
(625, 'Huyện KBang', 'Huyện', 64),
(626, 'Huyện Đăk Đoa', 'Huyện', 64),
(627, 'Huyện Chư Păh', 'Huyện', 64),
(628, 'Huyện Ia Grai', 'Huyện', 64),
(629, 'Huyện Mang Yang', 'Huyện', 64),
(630, 'Huyện Kông Chro', 'Huyện', 64),
(631, 'Huyện Đức Cơ', 'Huyện', 64),
(632, 'Huyện Chư Prông', 'Huyện', 64),
(633, 'Huyện Chư Sê', 'Huyện', 64),
(634, 'Huyện Đăk Pơ', 'Huyện', 64),
(635, 'Huyện Ia Pa', 'Huyện', 64),
(637, 'Huyện Krông Pa', 'Huyện', 64),
(638, 'Huyện Phú Thiện', 'Huyện', 64),
(639, 'Huyện Chư Pưh', 'Huyện', 64),
(643, 'Thành phố Buôn Ma Thuột', 'Thành phố', 66),
(644, 'Thị Xã Buôn Hồ', 'Thị xã', 66),
(645, 'Huyện Ea H\'leo', 'Huyện', 66),
(646, 'Huyện Ea Súp', 'Huyện', 66),
(647, 'Huyện Buôn Đôn', 'Huyện', 66),
(648, 'Huyện Cư M\'gar', 'Huyện', 66),
(649, 'Huyện Krông Búk', 'Huyện', 66),
(650, 'Huyện Krông Năng', 'Huyện', 66),
(651, 'Huyện Ea Kar', 'Huyện', 66),
(652, 'Huyện M\'Đrắk', 'Huyện', 66),
(653, 'Huyện Krông Bông', 'Huyện', 66),
(654, 'Huyện Krông Pắc', 'Huyện', 66),
(655, 'Huyện Krông A Na', 'Huyện', 66),
(656, 'Huyện Lắk', 'Huyện', 66),
(657, 'Huyện Cư Kuin', 'Huyện', 66),
(660, 'Thị xã Gia Nghĩa', 'Thị xã', 67),
(661, 'Huyện Đăk Glong', 'Huyện', 67),
(662, 'Huyện Cư Jút', 'Huyện', 67),
(663, 'Huyện Đắk Mil', 'Huyện', 67),
(664, 'Huyện Krông Nô', 'Huyện', 67),
(665, 'Huyện Đắk Song', 'Huyện', 67),
(666, 'Huyện Đắk R Lấp', 'Huyện', 67),
(667, 'Huyện Tuy Đức', 'Huyện', 67),
(672, 'Thành phố Đà Lạt', 'Thành phố', 68),
(673, 'Thành phố Bảo Lộc', 'Thành phố', 68),
(674, 'Huyện Đam Rông', 'Huyện', 68),
(675, 'Huyện Lạc Dương', 'Huyện', 68),
(676, 'Huyện Lâm Hà', 'Huyện', 68),
(677, 'Huyện Đơn Dương', 'Huyện', 68),
(678, 'Huyện Đức Trọng', 'Huyện', 68),
(679, 'Huyện Di Linh', 'Huyện', 68),
(680, 'Huyện Bảo Lâm', 'Huyện', 68),
(681, 'Huyện Đạ Huoai', 'Huyện', 68),
(682, 'Huyện Đạ Tẻh', 'Huyện', 68),
(683, 'Huyện Cát Tiên', 'Huyện', 68),
(688, 'Thị xã Phước Long', 'Thị xã', 70),
(689, 'Thị xã Đồng Xoài', 'Thị xã', 70),
(690, 'Thị xã Bình Long', 'Thị xã', 70),
(691, 'Huyện Bù Gia Mập', 'Huyện', 70),
(692, 'Huyện Lộc Ninh', 'Huyện', 70),
(693, 'Huyện Bù Đốp', 'Huyện', 70),
(694, 'Huyện Hớn Quản', 'Huyện', 70),
(695, 'Huyện Đồng Phú', 'Huyện', 70),
(696, 'Huyện Bù Đăng', 'Huyện', 70),
(697, 'Huyện Chơn Thành', 'Huyện', 70),
(698, 'Huyện Phú Riềng', 'Huyện', 70),
(703, 'Thành phố Tây Ninh', 'Thành phố', 72),
(705, 'Huyện Tân Biên', 'Huyện', 72),
(706, 'Huyện Tân Châu', 'Huyện', 72),
(707, 'Huyện Dương Minh Châu', 'Huyện', 72),
(708, 'Huyện Châu Thành', 'Huyện', 72),
(709, 'Huyện Hòa Thành', 'Huyện', 72),
(710, 'Huyện Gò Dầu', 'Huyện', 72),
(711, 'Huyện Bến Cầu', 'Huyện', 72),
(712, 'Huyện Trảng Bàng', 'Huyện', 72),
(718, 'Thành phố Thủ Dầu Một', 'Thành phố', 74),
(719, 'Huyện Bàu Bàng', 'Huyện', 74),
(720, 'Huyện Dầu Tiếng', 'Huyện', 74),
(721, 'Thị xã Bến Cát', 'Thị xã', 74),
(722, 'Huyện Phú Giáo', 'Huyện', 74),
(723, 'Thị xã Tân Uyên', 'Thị xã', 74),
(724, 'Thị xã Dĩ An', 'Thị xã', 74),
(725, 'Thị xã Thuận An', 'Thị xã', 74),
(726, 'Huyện Bắc Tân Uyên', 'Huyện', 74),
(731, 'Thành phố Biên Hòa', 'Thành phố', 75),
(732, 'Thị xã Long Khánh', 'Thị xã', 75),
(734, 'Huyện Tân Phú', 'Huyện', 75),
(735, 'Huyện Vĩnh Cửu', 'Huyện', 75),
(736, 'Huyện Định Quán', 'Huyện', 75),
(737, 'Huyện Trảng Bom', 'Huyện', 75),
(738, 'Huyện Thống Nhất', 'Huyện', 75),
(739, 'Huyện Cẩm Mỹ', 'Huyện', 75),
(740, 'Huyện Long Thành', 'Huyện', 75),
(741, 'Huyện Xuân Lộc', 'Huyện', 75),
(742, 'Huyện Nhơn Trạch', 'Huyện', 75),
(747, 'Thành phố Vũng Tàu', 'Thành phố', 77),
(748, 'Thành phố Bà Rịa', 'Thành phố', 77),
(750, 'Huyện Châu Đức', 'Huyện', 77),
(751, 'Huyện Xuyên Mộc', 'Huyện', 77),
(752, 'Huyện Long Điền', 'Huyện', 77),
(753, 'Huyện Đất Đỏ', 'Huyện', 77),
(754, 'Huyện Tân Thành', 'Huyện', 77),
(755, 'Huyện Côn Đảo', 'Huyện', 77),
(760, 'Quận 1', 'Quận', 79),
(761, 'Quận 12', 'Quận', 79),
(762, 'Quận Thủ Đức', 'Quận', 79),
(763, 'Quận 9', 'Quận', 79),
(764, 'Quận Gò Vấp', 'Quận', 79),
(765, 'Quận Bình Thạnh', 'Quận', 79),
(766, 'Quận Tân Bình', 'Quận', 79),
(767, 'Quận Tân Phú', 'Quận', 79),
(768, 'Quận Phú Nhuận', 'Quận', 79),
(769, 'Quận 2', 'Quận', 79),
(770, 'Quận 3', 'Quận', 79),
(771, 'Quận 10', 'Quận', 79),
(772, 'Quận 11', 'Quận', 79),
(773, 'Quận 4', 'Quận', 79),
(774, 'Quận 5', 'Quận', 79),
(775, 'Quận 6', 'Quận', 79),
(776, 'Quận 8', 'Quận', 79),
(777, 'Quận Bình Tân', 'Quận', 79),
(778, 'Quận 7', 'Quận', 79),
(783, 'Huyện Củ Chi', 'Huyện', 79),
(784, 'Huyện Hóc Môn', 'Huyện', 79),
(785, 'Huyện Bình Chánh', 'Huyện', 79),
(786, 'Huyện Nhà Bè', 'Huyện', 79),
(787, 'Huyện Cần Giờ', 'Huyện', 79),
(794, 'Thành phố Tân An', 'Thành phố', 80),
(795, 'Thị xã Kiến Tường', 'Thị xã', 80),
(796, 'Huyện Tân Hưng', 'Huyện', 80),
(797, 'Huyện Vĩnh Hưng', 'Huyện', 80),
(798, 'Huyện Mộc Hóa', 'Huyện', 80),
(799, 'Huyện Tân Thạnh', 'Huyện', 80),
(800, 'Huyện Thạnh Hóa', 'Huyện', 80),
(801, 'Huyện Đức Huệ', 'Huyện', 80),
(802, 'Huyện Đức Hòa', 'Huyện', 80),
(803, 'Huyện Bến Lức', 'Huyện', 80),
(804, 'Huyện Thủ Thừa', 'Huyện', 80),
(805, 'Huyện Tân Trụ', 'Huyện', 80),
(806, 'Huyện Cần Đước', 'Huyện', 80),
(807, 'Huyện Cần Giuộc', 'Huyện', 80),
(808, 'Huyện Châu Thành', 'Huyện', 80),
(815, 'Thành phố Mỹ Tho', 'Thành phố', 82),
(816, 'Thị xã Gò Công', 'Thị xã', 82),
(817, 'Thị xã Cai Lậy', 'Huyện', 82),
(818, 'Huyện Tân Phước', 'Huyện', 82),
(819, 'Huyện Cái Bè', 'Huyện', 82),
(820, 'Huyện Cai Lậy', 'Thị xã', 82),
(821, 'Huyện Châu Thành', 'Huyện', 82),
(822, 'Huyện Chợ Gạo', 'Huyện', 82),
(823, 'Huyện Gò Công Tây', 'Huyện', 82),
(824, 'Huyện Gò Công Đông', 'Huyện', 82),
(825, 'Huyện Tân Phú Đông', 'Huyện', 82),
(829, 'Thành phố Bến Tre', 'Thành phố', 83),
(831, 'Huyện Châu Thành', 'Huyện', 83),
(832, 'Huyện Chợ Lách', 'Huyện', 83),
(833, 'Huyện Mỏ Cày Nam', 'Huyện', 83),
(834, 'Huyện Giồng Trôm', 'Huyện', 83),
(835, 'Huyện Bình Đại', 'Huyện', 83),
(836, 'Huyện Ba Tri', 'Huyện', 83),
(837, 'Huyện Thạnh Phú', 'Huyện', 83),
(838, 'Huyện Mỏ Cày Bắc', 'Huyện', 83),
(842, 'Thành phố Trà Vinh', 'Thành phố', 84),
(844, 'Huyện Càng Long', 'Huyện', 84),
(845, 'Huyện Cầu Kè', 'Huyện', 84),
(846, 'Huyện Tiểu Cần', 'Huyện', 84),
(847, 'Huyện Châu Thành', 'Huyện', 84),
(848, 'Huyện Cầu Ngang', 'Huyện', 84),
(849, 'Huyện Trà Cú', 'Huyện', 84),
(850, 'Huyện Duyên Hải', 'Huyện', 84),
(851, 'Thị xã Duyên Hải', 'Thị xã', 84),
(855, 'Thành phố Vĩnh Long', 'Thành phố', 86),
(857, 'Huyện Long Hồ', 'Huyện', 86),
(858, 'Huyện Mang Thít', 'Huyện', 86),
(859, 'Huyện  Vũng Liêm', 'Huyện', 86),
(860, 'Huyện Tam Bình', 'Huyện', 86),
(861, 'Thị xã Bình Minh', 'Thị xã', 86),
(862, 'Huyện Trà Ôn', 'Huyện', 86),
(863, 'Huyện Bình Tân', 'Huyện', 86),
(866, 'Thành phố Cao Lãnh', 'Thành phố', 87),
(867, 'Thành phố Sa Đéc', 'Thành phố', 87),
(868, 'Thị xã Hồng Ngự', 'Thị xã', 87),
(869, 'Huyện Tân Hồng', 'Huyện', 87),
(870, 'Huyện Hồng Ngự', 'Huyện', 87),
(871, 'Huyện Tam Nông', 'Huyện', 87),
(872, 'Huyện Tháp Mười', 'Huyện', 87),
(873, 'Huyện Cao Lãnh', 'Huyện', 87),
(874, 'Huyện Thanh Bình', 'Huyện', 87),
(875, 'Huyện Lấp Vò', 'Huyện', 87),
(876, 'Huyện Lai Vung', 'Huyện', 87),
(877, 'Huyện Châu Thành', 'Huyện', 87),
(883, 'Thành phố Long Xuyên', 'Thành phố', 89),
(884, 'Thành phố Châu Đốc', 'Thành phố', 89),
(886, 'Huyện An Phú', 'Huyện', 89),
(887, 'Thị xã Tân Châu', 'Thị xã', 89),
(888, 'Huyện Phú Tân', 'Huyện', 89),
(889, 'Huyện Châu Phú', 'Huyện', 89),
(890, 'Huyện Tịnh Biên', 'Huyện', 89),
(891, 'Huyện Tri Tôn', 'Huyện', 89),
(892, 'Huyện Châu Thành', 'Huyện', 89),
(893, 'Huyện Chợ Mới', 'Huyện', 89),
(894, 'Huyện Thoại Sơn', 'Huyện', 89),
(899, 'Thành phố Rạch Giá', 'Thành phố', 91),
(900, 'Thị xã Hà Tiên', 'Thị xã', 91),
(902, 'Huyện Kiên Lương', 'Huyện', 91),
(903, 'Huyện Hòn Đất', 'Huyện', 91),
(904, 'Huyện Tân Hiệp', 'Huyện', 91),
(905, 'Huyện Châu Thành', 'Huyện', 91),
(906, 'Huyện Giồng Riềng', 'Huyện', 91),
(907, 'Huyện Gò Quao', 'Huyện', 91),
(908, 'Huyện An Biên', 'Huyện', 91),
(909, 'Huyện An Minh', 'Huyện', 91),
(910, 'Huyện Vĩnh Thuận', 'Huyện', 91),
(911, 'Huyện Phú Quốc', 'Huyện', 91),
(912, 'Huyện Kiên Hải', 'Huyện', 91),
(913, 'Huyện U Minh Thượng', 'Huyện', 91),
(914, 'Huyện Giang Thành', 'Huyện', 91),
(916, 'Quận Ninh Kiều', 'Quận', 92),
(917, 'Quận Ô Môn', 'Quận', 92),
(918, 'Quận Bình Thuỷ', 'Quận', 92),
(919, 'Quận Cái Răng', 'Quận', 92),
(923, 'Quận Thốt Nốt', 'Quận', 92),
(924, 'Huyện Vĩnh Thạnh', 'Huyện', 92),
(925, 'Huyện Cờ Đỏ', 'Huyện', 92),
(926, 'Huyện Phong Điền', 'Huyện', 92),
(927, 'Huyện Thới Lai', 'Huyện', 92),
(930, 'Thành phố Vị Thanh', 'Thành phố', 93),
(931, 'Thị xã Ngã Bảy', 'Thị xã', 93),
(932, 'Huyện Châu Thành A', 'Huyện', 93),
(933, 'Huyện Châu Thành', 'Huyện', 93),
(934, 'Huyện Phụng Hiệp', 'Huyện', 93),
(935, 'Huyện Vị Thuỷ', 'Huyện', 93),
(936, 'Huyện Long Mỹ', 'Huyện', 93),
(937, 'Thị xã Long Mỹ', 'Thị xã', 93),
(941, 'Thành phố Sóc Trăng', 'Thành phố', 94),
(942, 'Huyện Châu Thành', 'Huyện', 94),
(943, 'Huyện Kế Sách', 'Huyện', 94),
(944, 'Huyện Mỹ Tú', 'Huyện', 94),
(945, 'Huyện Cù Lao Dung', 'Huyện', 94),
(946, 'Huyện Long Phú', 'Huyện', 94),
(947, 'Huyện Mỹ Xuyên', 'Huyện', 94),
(948, 'Thị xã Ngã Năm', 'Thị xã', 94),
(949, 'Huyện Thạnh Trị', 'Huyện', 94),
(950, 'Thị xã Vĩnh Châu', 'Thị xã', 94),
(951, 'Huyện Trần Đề', 'Huyện', 94),
(954, 'Thành phố Bạc Liêu', 'Thành phố', 95),
(956, 'Huyện Hồng Dân', 'Huyện', 95),
(957, 'Huyện Phước Long', 'Huyện', 95),
(958, 'Huyện Vĩnh Lợi', 'Huyện', 95),
(959, 'Thị xã Giá Rai', 'Thị xã', 95),
(960, 'Huyện Đông Hải', 'Huyện', 95),
(961, 'Huyện Hoà Bình', 'Huyện', 95),
(964, 'Thành phố Cà Mau', 'Thành phố', 96),
(966, 'Huyện U Minh', 'Huyện', 96),
(967, 'Huyện Thới Bình', 'Huyện', 96),
(968, 'Huyện Trần Văn Thời', 'Huyện', 96),
(969, 'Huyện Cái Nước', 'Huyện', 96),
(970, 'Huyện Đầm Dơi', 'Huyện', 96),
(971, 'Huyện Năm Căn', 'Huyện', 96),
(972, 'Huyện Phú Tân', 'Huyện', 96),
(973, 'Huyện Ngọc Hiển', 'Huyện', 96);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_province`
--

CREATE TABLE `db_province` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `db_province`
--

INSERT INTO `db_province` (`id`, `name`, `type`) VALUES
(1, 'Thành phố Hà Nội', 'Thành phố Trung ương'),
(2, 'Tỉnh Hà Giang', 'Tỉnh'),
(3, 'Tỉnh Cao Bằng', 'Tỉnh'),
(4, 'Tỉnh Bắc Kạn', 'Tỉnh'),
(5, 'Tỉnh Tuyên Quang', 'Tỉnh'),
(6, 'Tỉnh Lào Cai', 'Tỉnh'),
(7, 'Tỉnh Điện Biên', 'Tỉnh'),
(8, 'Tỉnh Lai Châu', 'Tỉnh'),
(9, 'Tỉnh Sơn La', 'Tỉnh'),
(10, 'Tỉnh Yên Bái', 'Tỉnh'),
(11, 'Tỉnh Hoà Bình', 'Tỉnh'),
(12, 'Tỉnh Thái Nguyên', 'Tỉnh'),
(13, 'Tỉnh Lạng Sơn', 'Tỉnh'),
(14, 'Tỉnh Quảng Ninh', 'Tỉnh'),
(15, 'Tỉnh Bắc Giang', 'Tỉnh'),
(16, 'Tỉnh Phú Thọ', 'Tỉnh'),
(17, 'Tỉnh Vĩnh Phúc', 'Tỉnh'),
(18, 'Tỉnh Bắc Ninh', 'Tỉnh'),
(19, 'Tỉnh Hải Dương', 'Tỉnh'),
(20, 'Thành phố Hải Phòng', 'Thành phố Trung ương'),
(21, 'Tỉnh Hưng Yên', 'Tỉnh'),
(22, 'Tỉnh Thái Bình', 'Tỉnh'),
(23, 'Tỉnh Hà Nam', 'Tỉnh'),
(24, 'Tỉnh Nam Định', 'Tỉnh'),
(25, 'Tỉnh Ninh Bình', 'Tỉnh'),
(26, 'Tỉnh Thanh Hóa', 'Tỉnh'),
(27, 'Tỉnh Nghệ An', 'Tỉnh'),
(28, 'Tỉnh Hà Tĩnh', 'Tỉnh'),
(29, 'Tỉnh Quảng Bình', 'Tỉnh'),
(30, 'Tỉnh Quảng Trị', 'Tỉnh'),
(31, 'Tỉnh Thừa Thiên Huế', 'Tỉnh'),
(32, 'Thành phố Đà Nẵng', 'Thành phố Trung ương'),
(33, 'Tỉnh Quảng Nam', 'Tỉnh'),
(34, 'Tỉnh Quảng Ngãi', 'Tỉnh'),
(35, 'Tỉnh Bình Định', 'Tỉnh'),
(36, 'Tỉnh Phú Yên', 'Tỉnh'),
(37, 'Tỉnh Khánh Hòa', 'Tỉnh'),
(38, 'Tỉnh Ninh Thuận', 'Tỉnh'),
(39, 'Tỉnh Bình Thuận', 'Tỉnh'),
(40, 'Tỉnh Kon Tum', 'Tỉnh'),
(41, 'Tỉnh Gia Lai', 'Tỉnh'),
(42, 'Tỉnh Đắk Lắk', 'Tỉnh'),
(43, 'Tỉnh Đắk Nông', 'Tỉnh'),
(44, 'Tỉnh Lâm Đồng', 'Tỉnh'),
(45, 'Tỉnh Bình Phước', 'Tỉnh'),
(46, 'Tỉnh Tây Ninh', 'Tỉnh'),
(47, 'Tỉnh Bình Dương', 'Tỉnh'),
(48, 'Tỉnh Đồng Nai', 'Tỉnh'),
(49, 'Tỉnh Bà Rịa - Vũng Tàu', 'Tỉnh'),
(50, 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương'),
(51, 'Tỉnh Long An', 'Tỉnh'),
(52, 'Tỉnh Tiền Giang', 'Tỉnh'),
(53, 'Tỉnh Bến Tre', 'Tỉnh'),
(54, 'Tỉnh Trà Vinh', 'Tỉnh'),
(55, 'Tỉnh Vĩnh Long', 'Tỉnh'),
(56, 'Tỉnh Đồng Tháp', 'Tỉnh'),
(57, 'Tỉnh An Giang', 'Tỉnh'),
(58, 'Tỉnh Kiên Giang', 'Tỉnh'),
(59, 'Thành phố Cần Thơ', 'Thành phố Trung ương'),
(60, 'Tỉnh Hậu Giang', 'Tỉnh'),
(61, 'Tỉnh Sóc Trăng', 'Tỉnh'),
(62, 'Tỉnh Bạc Liêu', 'Tỉnh'),
(63, 'Tỉnh Cà Mau', 'Tỉnh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gallery`
--

CREATE TABLE `gallery` (
  `idgallery` int(11) NOT NULL,
  `mshh` int(11) NOT NULL,
  `hinhanhsp` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `gallery`
--

INSERT INTO `gallery` (`idgallery`, `mshh`, `hinhanhsp`) VALUES
(14, 39, '3daf27b63c30e5a8f1dc1d2ab09349591591509774.png'),
(15, 39, '3f83d23fdc12378fc61ac5c0e55c24761591509774.png'),
(16, 42, 'ab6c2dc71ee55a8e3aa58b9dfe6ec8961591509874.jpg'),
(18, 25, '13b9fc538c72f97683304fcd8c7194fb1591511136.jpg'),
(19, 25, 'b6a64d0316b06e976ad4324a4063e3411591511136.jpg'),
(20, 25, 'ed69079d22eeec88ee5027717452a4f61591511136.jpg'),
(21, 42, 'b96fbb511e7d5d4424ca2eae52a3eb281591511808.jpg'),
(22, 42, 'd7ed3e9c74108cfa3d260b8b097ca6a11591511808.jpg'),
(23, 42, 'd5276929094f87e470ca2d957917c59d1591511808.jpg'),
(24, 5, 'thumb_550x550_img_60531591587467.jpg'),
(25, 5, 'thumb_550x550_img_60551591587467.jpg'),
(26, 5, 'thumb_550x550_img_60821591587467.jpg'),
(27, 5, 'thumb_550x550_img_60831591587467.jpg'),
(28, 5, 'thumb_550x550_img_60871591587467.jpg'),
(29, 45, '220ab7ba8f2149a182a33b0789b938e91591592439.jpg'),
(30, 45, '305e036a276dfa0d1844cfc305aa26f01591592439.jpg'),
(31, 45, 'd74c3c405b20ab5bdc354bfc2ed27ac41591592439.jpg'),
(32, 48, '19f19b95a5e3da0faf795a102fc8f4321591593790.jpg'),
(33, 47, '6da3e971273bdff3b680b42d12adb7491591593869.jpg'),
(34, 47, '7b7b2921713608c27ec12d66c7973fd21591593869.jpg'),
(35, 47, '19f19b95a5e3da0faf795a102fc8f4321591593869.jpg'),
(36, 47, 'a64986a8622edd9744fe5eecd2878fb71591593869.jpg'),
(37, 46, '84dc9f701c61f6a00b28ad8766ad61591591593920.jpg'),
(38, 46, 'e8a82e95d2df07f19ffc79c0f06e5ca71591593920.jpg'),
(39, 49, '07d28d193d39c71fee80b5ecc77cbe051591958098.jpg'),
(40, 49, '52b1d853ed587bff480075187258af891591958098.jpg'),
(43, 51, '4c7c90edfdbfb0767a20354a573438061592069095.jpg'),
(44, 51, '2c4d3f8a829af803a7e4d136796fdc831592069175.jpg'),
(45, 44, '23f164c8a75a27464e75292caebde3051592069343.png'),
(49, 40, '636748771945393060_iPhone-Xs-Max-gold1592069571.jpg'),
(50, 40, '636767481293463872_iphone-xs-gold-41592069580.jpg'),
(51, 40, '636767481293188883_iphone-xs-gold-21592069588.jpg'),
(52, 40, '404f37a03e8278fd72c4b421a85bb9a91592069600.jpg'),
(53, 40, '8161dd6861975d560bc1d272ed3322431592069600.jpg'),
(54, 25, '2aa38bbfc27b9aac9d958fb4898bbe081592069681.png'),
(55, 48, '7b7b2921713608c27ec12d66c7973fd21592069762.jpg'),
(57, 21, '1_431592070810.jpg'),
(58, 21, 'taycam1592070818.jpg'),
(59, 36, 'note_10_plus_den_11592071045.jpg'),
(60, 36, 'note_10_plus_xanh1592071045.jpg'),
(63, 43, '4521_bo_ban_phim_mouse_logitech_mk200_0001_21592071997.jpg'),
(64, 43, '4521_bo_ban_phim_mouse_logitech_mk200_0000_11592072126.jpg'),
(65, 30, 'apple-watch-s5-lte-44mm-vien-nhom-day-cao-su1592072170.jpg'),
(66, 30, 'apple-watch-series-5-black_2hzi-q81592072170.jpg'),
(69, 41, '89812372029741592072381.jpg'),
(70, 41, 'razer-keyboard-bag1592072381.png'),
(80, 14, 'dsc0987515925504351592550501.png'),
(81, 14, 'dsc0988115925504671592550501.png'),
(82, 14, 'dsc0988215925504671592550501.png'),
(83, 14, 'dsc0988315925504671592550501.png'),
(84, 14, 'dsc0988515925504671592550501.png'),
(85, 14, 'dsc0989015925504351592550501.png'),
(86, 14, 'dsc0989215925504671592550501.png'),
(87, 14, 'dsc0989315925504351592550501.png'),
(88, 14, 'dsc0989415925504671592550502.png'),
(89, 33, 'dsc015451592551039.jpg'),
(90, 33, 'thumb_550x550_dsc015841592551052.jpg'),
(91, 33, 'thumb_550x550_dsc015881592551052.jpg'),
(92, 33, 'thumb_550x550_dsc015931592551052.jpg'),
(93, 6, 'img_643421592551212.jpg'),
(94, 6, 'img_643931592551212.jpg'),
(95, 6, 'img_644211592551212.jpg'),
(96, 6, 'img_644631592551212.jpg'),
(97, 6, 'img_643821592551251.jpg'),
(98, 8, '27inch_211592551343.jpg'),
(99, 8, '27inch_311592551343.jpg'),
(100, 8, '27inch_411592551343.jpg'),
(101, 8, '27inch_511592551343.jpg'),
(102, 9, 'img_65731592551470.jpg'),
(103, 9, 'img_65741592551470.jpg'),
(104, 9, 'img_65751592551470.jpg'),
(105, 9, 'img_65831592551470.jpg'),
(106, 9, 'img_65891592551470.jpg'),
(107, 9, 'img_65991592551470.jpg'),
(108, 32, '2171592551637.jpg'),
(109, 32, '3101592551637.jpg'),
(110, 32, 'thumb_550x550_157648368816201592551637.jpg'),
(111, 32, '481592551698.jpg'),
(112, 31, '730s_aio_asp_61592551794.jpg'),
(113, 31, '730s_aio_asp_71592551802.jpg'),
(114, 31, '730s_aio_asp_31592551814.jpg'),
(115, 31, '730s_aio_asp_51592551814.jpg'),
(116, 31, '730s_aio_asp_81592551836.jpg'),
(117, 31, '730s_aio_asp_11592551869.jpg'),
(118, 10, 'img_64581592551951.jpg'),
(119, 10, 'img_62511592551967.jpg'),
(120, 10, 'img_62611592551967.jpg'),
(121, 10, 'img_62631592551967.jpg'),
(122, 10, 'img_64651592551967.jpg'),
(123, 10, 'img_64681592551967.jpg'),
(128, 16, 'thumb_550x550_1555933675526711592552383.jpg'),
(129, 12, 'thumb_300x300_1581069739765815925522841592552464.jpg'),
(130, 38, '6c6044d233d6a8373c7f214ae49004621592552533.jpg'),
(131, 13, '1809927_l11592552623.jpg'),
(132, 13, 'bc8a70f55f7ab0d9efd0be3a663126671592552623.jpg'),
(133, 37, 'huawei-p40-pro-xanh-1-org1592641340.jpg'),
(134, 37, 'huawei-p40-pro-xanh-2-org1592641356.jpg'),
(135, 37, 'huawei-p40-pro-xanh-6-org1592641356.jpg'),
(136, 37, 'huawei-p40-pro-xanh-9-org1592641356.jpg'),
(137, 37, 'huawei-p40-pro-xanh-11-org1592641356.jpg'),
(138, 37, 'huawei-p40-pro-xanh-12-org1592641356.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id_giohang` int(11) NOT NULL,
  `tenhh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mshh` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `giaban` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hanghoa`
--

CREATE TABLE `hanghoa` (
  `mshh` int(11) NOT NULL,
  `mahh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tenhh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `giaban` float NOT NULL,
  `giagoc` float NOT NULL,
  `sale_off` int(11) NOT NULL,
  `soluonghang` tinyint(11) NOT NULL,
  `number` tinyint(4) NOT NULL,
  `manhom` int(11) NOT NULL,
  `idhieusp` int(11) NOT NULL,
  `hinhanh` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `motahh` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `noidung` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `hanghoa`
--

INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(5, 'D_51M', 'Dell Alienware Area-51M  (Mới)', 61911400, 71990000, 14, 110, 0, 2, 6, 'thumb_300x300_a_area_51m.png', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Dell Alienware Area-51M Core i7-9700K, RAM 16GB, SSD 256GB, nVIDIA RTX 2060 6GB, 17.3\" FHD IPS, Win 10 Pro</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Thay đổi trải nghiệm chơi game:&nbsp;</span></span><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-alienware-area-51m-pl478.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Dell Alienware Area-51M</span></span></a>&nbsp;ho&agrave;n to&agrave;n kh&aacute;c biệt với những chiếc gaming laptop m&agrave; bạn từng biết. Với một sức mạnh chưa từng c&oacute; tr&ecirc;n laptop, khả năng n&acirc;ng cấp CPU lẫn GPU vượt trội, bộ tản nhiệt ti&ecirc;n tiến c&ugrave;ng với một thiết kế qu&yacute; tộc mang thi&ecirc;n hướng của một cuộc c&aacute;ch mạng laptop, bạn giờ đ&acirc;y đ&atilde; c&oacute; thể thực sự chi&ecirc;m nghiệm cụm từ \"Laptop thay thế Desktop\".</p>\r\n<h1 style=\"box-sizing: border-box; margin: 0px 0cm 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Laptop với cấu h&igrave;nh si&ecirc;u mạnh</span></span></h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: justify;\"><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-alienware-area-51m-pl478.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Area-51M</span></span></a>&nbsp;c&oacute; thể được coi l&agrave; chiếc laptop mạnh nhất từ trước tới giờ khi được trang bị bộ vi xử l&yacute; si&ecirc;u mạnh 8 nh&acirc;n 8&nbsp;luồng chỉ được trang bị tr&ecirc;n những bộ PC để b&agrave;n. Kh&ocirc;ng những thế,&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-alienware-area-51m-pl478.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Dell Alienware Area-51M&nbsp;</span></span></a>c&ograve;n c&oacute; khả năng &eacute;p xung CPU l&ecirc;n tới 125% c&ocirc;ng suất b&igrave;nh thường, khiến khả năng đa nhiệm sẽ trở n&ecirc;n tốt hơn bất cứ mẫu laptop n&agrave;o.&nbsp;H&ograve;a m&igrave;nh v&agrave;o thế giới tr&ograve; chơi sống động, mượt m&agrave; nhờ v&agrave;o card đồ họa NVIDIA&reg; GeForce RTX &trade; với c&ocirc;ng suất tối đa v&agrave; c&oacute; thể &eacute;p xung m&agrave;n h&igrave;nh Full HD G-SYNC 17 \" một c&aacute;ch tốt nhất.&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-alienware-area-51m-pl478.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Dell Alienware Area-51M</span></span></a>&nbsp;cũng l&agrave; chiếc m&aacute;y t&iacute;nh x&aacute;ch tay&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/alienware-pl232.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Alienware</span></span></a>&nbsp;đầu ti&ecirc;n của&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-pl224.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Dell</span></span></a>&nbsp;hỗ trợ bộ nhớ DDR4 l&ecirc;n đến 64GB, đảm bảo bạn c&oacute; đủ RAM cho cả những t&aacute;c vụ ngốn RAM nhất quả đất.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/area_51_4.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">&nbsp;</p>\r\n<h1 style=\"box-sizing: border-box; margin: 0px 0cm 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Khả năng n&acirc;ng cấp vượt bậc</span></span></h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: justify;\">C&aacute;c game thủ từ l&acirc;u đ&atilde; thấy r&otilde; rằng những chiếc Gaming Laptop thường thiếu đi khả năng n&acirc;ng cấp CPU v&agrave; GPU. V&agrave; để khắc phục t&igrave;nh trạng đ&oacute;,&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/dell-alienware-area-51m-pl478.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; color: blue;\">Area-51M</span></span></a>&nbsp;được thiết kế để chiều l&ograve;ng c&aacute;c game thủ khi cho ph&eacute;p họ khai th&aacute;c sức mạnh tương đương với m&aacute;y t&iacute;nh để b&agrave;n, cho hiệu năng cao nhất v&agrave; tận dụng c&aacute;c c&ocirc;ng nghệ mới nhất từ NVIDIA&reg; như&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Ray Tracing</span>,&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">DLSS</span>&nbsp;v&agrave; n&acirc;ng cao đồ họa bằng&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">AI</span>. CPU nay c&oacute; thể được n&acirc;ng cấp như những d&agrave;n PC th&ocirc;ng thường, trong khi ta c&oacute; thể n&acirc;ng cấp GPU th&ocirc;ng qua việc thay thế m&ocirc;-đun đồ họa tr&ecirc;n bo mạch chủ hoặc với Bộ khuếch đại đồ họa Alienware. (Alienware Graphics Amplifier).</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/area_51_2.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin: 0px 0cm 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Thiết kế ấn tượng</span></h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: justify;\">Với thiết kế g&oacute;c cạnh sắc n&eacute;t, sang trọng, sử dụng m&agrave;n h&igrave;nh 17.3 inch viền mỏng rất hợp thời, cộng th&ecirc;m phần tản nhiệt ph&iacute;a sau cũng được gắn đ&egrave;n LED chạy dọc khung l&agrave;m cho thiết bị c&agrave;ng th&ecirc;m ấn tượng. Thiết kế kết hợp v&aacute;t g&oacute;c v&agrave; bo tr&ograve;n, cho cảm gi&aacute;c mềm mại hơn, nhưng vẫn giữ n&eacute;t khỏe khoắn v&agrave; ngầu đặc trưng của d&ograve;ng Alienware gaming. Dải m&agrave;u l&ecirc;n đến 117,5% sRGB, độ s&aacute;ng 284 nits sẽ đem đến trải nghiệm cực tốt.&nbsp;Vỏ m&aacute;y được l&agrave;m bằng hợp kim magie cao cấp trong một m&agrave;u được gọi l&agrave; Dark Side of the Moon gi&uacute;p tăng cường độ cứng đồng thời giảm bớt trọng lượng tổng thể của m&aacute;y.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/area_51_1.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin: 0px 0cm 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4. C&ocirc;ng nghệ t</span></span><span style=\"box-sizing: border-box; font-weight: bolder;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ản nhiệt \"Đại H&agrave;n\" ti&ecirc;n tiến của Alienware</span></span></h1>\r\n<p style=\"box-sizing: border-box; margin: 0px 0cm 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: justify;\">C&ocirc;ng nghệ tản nhiệt mới nhất của&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/alienware-pl232.html\">Alienware</a>, Advanced Alienware Cryo-Tech v2.0 (C&ocirc;ng nghệ Si&ecirc;u l&agrave;m lạnh), được tối ưu một c&aacute;ch tốt nhất cho việc tản nhiệt, gi&uacute;p cho chiếc laptop kh&ocirc;ng bị ảnh hưởng đến hiệu năng khi d&ugrave;ng.<br style=\"box-sizing: border-box;\" />Cryo-Tech v2.0 lu&ocirc;n đảm bảo hiệu năng của cả CPU lẫn GPU đều ở mức 100%, tức l&agrave; d&ugrave; bạn c&oacute; chơi game nhiều đến bao nhi&ecirc;u, render đồ họa nặng nhiều đến mấy th&igrave; cũng kh&ocirc;ng sợ gặp hiện tượng tụt hiệu năng, đảm bảo cho t&iacute;nh bền lầu của trải nghiệm của bạn.Ồn &agrave;o v&agrave; lặng y&ecirc;n: D&ugrave; sở hữu khả năng tản nhiệt mạnh mẽ như vậy, nhưng nếu bạn đang l&agrave;m việc với những t&aacute;c vụ hằng ng&agrave;y th&igrave; tuyệt nhi&ecirc;n sẽ kh&ocirc;ng nghe thấy t&iacute; tiếng quạt n&agrave;o.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/area_51_41.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>', 1),
(6, 'TP_X1', 'Lenovo ThinkPad X1 Carbon Gen 7 i7 10710U RAM 16GB SSD 256GB FHD IPS', 48990000, 48990000, 0, 123, 0, 2, 21, 'thumb_300x300_x1_carbon_gen_7.jpg', '<p><span style=\"color: #666666; font-family: Roboto, sans-serif; font-size: 13px;\">Ultrabook cao cấp, mỏng nhẹ, hiệu năng cao. B&agrave;n ph&iacute;m g&otilde; sướng.</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Cổ điển nhưng chững chạc</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Mặc d&ugrave; chẳng c&oacute; g&igrave; thay đổi về thiết kế. Nhưng<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-x1-carbon-gen-7-pl456.html\">ThinkPad X1 Carbon Gen 7</a></span><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-x1-carbon-gen-7-pl456.html\">&nbsp;</a>vẫn chiếm được cảm tỉnh của người d&ugrave;ng v&igrave; sự bền b&igrave; cổ điển nhưng chững chạc. Điều n&agrave;y được thể hiện th&ocirc;ng qua việc lu&ocirc;n giữ vững lập trường của sự ho&agrave;n hảo m&agrave; bao nhi&ecirc;u năm nay<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Lenovo&nbsp;</span>đ&atilde; l&agrave;m với chiếc m&aacute;y n&agrave;y</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_64361.jpg\" alt=\"\" width=\"775\" height=\"435\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Cấu h&igrave;nh cải tiến</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Tất nhi&ecirc;n nếu kh&ocirc;ng cải tiến th&igrave;<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-x1-carbon-gen-7-pl456.html\">ThinkPad X1 Carbon Gen 7</a></span>&nbsp;kh&ocirc;ng c&oacute; được như ng&agrave;y h&ocirc;m nay. Nhờ được trang bị cho m&igrave;nh CPU mới nhất của cả Intel đem tới trải nghiệm mượt m&agrave; hơn nữa. Giờ đ&acirc;y kh&ocirc;ng chỉ đơn thuần l&agrave; ultrabook mỏng nhẹ, ThinkPad X1 Carbon Gen 7 c&ograve;n phục vụ tốt trong c&aacute;c t&aacute;c vụ đồ họa nữa.&nbsp;M&agrave;n h&igrave;nh của m&aacute;y cũng thể hiện sự sắc n&eacute;t v&ocirc; c&ugrave;ng tuyệt vời, m&igrave;nh tin đ&acirc;y ch&iacute;nh l&agrave; laptop đ&aacute;ng hứa hẹn nhất trong năm nay.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_6448.jpg\" alt=\"\" width=\"750\" height=\"421\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Trải nghiệm sướng nhất</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">B&agrave;n ph&iacute;m v&agrave; touchpad</span>&nbsp;của<span style=\"box-sizing: border-box; font-weight: bolder;\"><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-x1-carbon-gen-7-pl456.html\">&nbsp;ThinkPad X1 Carbon Gen 7</a>&nbsp;</span>ch&iacute;nh l&agrave; điểm nhất gi&uacute;p cho người d&ugrave;ng cảm thấy thoải m&aacute;i khi g&otilde; văn bản. Nhờ chất lượng m&agrave;n h&igrave;nh được cải thiện hơn nữa, giờ đ&acirc;y bạn kh&ocirc;ng c&ograve;n phải lo đến việc mỏi mắt khi l&agrave;m việc l&acirc;u d&agrave;i với&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-x1-carbon-gen-7-pl456.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad X1 Carbon Gen 7</span></a>&nbsp;nữa.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_64391.jpg\" alt=\"\" width=\"775\" height=\"435\" /></p>\r\n<p>&nbsp;</p>\r\n</div>', 1),
(7, 'R_15', 'Razer Blade 15 i7-8750H RAM 16GB SSD 512GB FHD IPS RTX 2060', 45490000, 45490000, 0, 126, 0, 2, 20, 'thumb_300x300_untitled33.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Razer Blade 15 i7-8750H, RAM 16GB, SSD 512GB, 15.6\" FHD IPS, NVIDIA RTX 2060 (6GB)</span></p>', '<div class=\"block-title\" style=\"box-sizing: border-box; font-size: 1.8rem; text-transform: uppercase; padding-left: 10px; color: #27bece; border-left: 6px solid #27bece; margin-bottom: 20px; font-family: Roboto, Arial;\">TH&Ocirc;NG S&aacute;&raquo; K&Auml;&uml; THU&aacute;&ordm;&not;T</div>\r\n<div class=\"block-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<ul class=\"parameter list-unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding-left: 0px; list-style: none;\">\r\n<li class=\"ts_5\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">CPU:</span>\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">Intel Core i7-8750H 2.20 GHz, 9 MB SmartCache Cache, Upto 4.10 GHz</div>\r\n</li>\r\n<li class=\"ts_6\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">RAM:</span>\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">16GB DDR4 2666 MHz</div>\r\n</li>\r\n<li class=\"ts_7\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">&aacute;&raquo;&rdquo; c&aacute;&raquo;&copy;ng:</span>\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">512GB SSD</div>\r\n</li>\r\n<li class=\"ts_1\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">M&agrave;n h&igrave;nh:</span>\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">15.6 inch FHD (1920 x 1080), IPS Anti-Glare</div>\r\n</li>\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">Card m&agrave;n h&igrave;nh:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">Nvidia GeForce RTX 2060 6GB GDDR5</div>\r\n</li>\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">C&aacute;&raquo;&bull;ng giao ti&aacute;&ordm;&iquest;p:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">3 C&aacute;&raquo;&bull;ng USB 3.1 1 C&aacute;&raquo;&bull;ng Thunderbolt 3 1 C&aacute;&raquo;&bull;ng Mini Display Port 1 C&aacute;&raquo;&bull;ng HDMI</div>\r\n</li>\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">K&iacute;ch th&AElig;&deg;&aacute;&raquo;&rsaquo;c:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">355 x 235 x 17.8mm</div>\r\n</li>\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">Tr&aacute;&raquo;ng l&AElig;&deg;&aacute;&raquo;&pound;ng:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">2.07kg</div>\r\n</li>\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">H&aacute;&raquo;&Dagger; &Auml;&lsquo;i&aacute;&raquo;u h&agrave;nh:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">Windows 10</div>\r\n</li>\r\n</ul>\r\n</div>', 1),
(8, 'Imac', 'iMac Pro 2019 Xeon 3.2GHz RAM 32GB 1TB AMD Vega 56 27inch RETINA 5K', 127000000, 127000000, 0, 123, 0, 3, 3, 'thumb_300x300_112.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">iMac Pro 2019 Intel Xeon 8 core 3.2GHz RAM 32GB SSD 1TB AMD Vega56 27inch RETINA 5K</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Chữ \"Pro\" của sự ho&agrave;n hảo</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Lần n&agrave;y&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple&nbsp;</span>đ&atilde; th&ecirc;m v&agrave;o d&ograve;ng sản phẩm<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac&nbsp;</span>của họ một c&aacute;i chữ nữa đ&oacute; ch&iacute;nh l&agrave;&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Pro</span>. Tất nhi&ecirc;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Pro</span>&nbsp;tức chuy&ecirc;n nghiệp v&agrave; chiếc m&aacute;y n&agrave;y đ&atilde; chuy&ecirc;n nghiệp rồi nay c&ograve;n chuy&ecirc;n nghiệp hơn nữa. Điều&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple</span>&nbsp;muốn gửi gắm cho sản phẩm của họ ch&iacute;nh l&agrave;<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Pro</span>&nbsp;cho sự ho&agrave;n hảo. Điều đ&oacute; được cụ thể h&oacute;a bằng cấu h&igrave;nh v&ocirc; c&ugrave;ng mạnh mẽ với<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;CPU intel Xeon 8 core&nbsp;v&agrave; c&oacute; thể l&ecirc;n tới 18 core t&ugrave;y chọn.</span>&nbsp;Nhờ sức mạnh đa nh&acirc;n từ&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">CPU</span>, giờ đ&acirc;y mọi thao t&aacute;c của bạn kh&ocirc;ng c&ograve;n g&oacute;i gọn 1 sản phẩm nữa m&agrave; c&oacute; thể l&agrave;m việc 2 t&aacute;c vụ hay nhiều hơn nữa.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/imac_pro_2.png\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. B&oacute;ng tối trở lại</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Nếu&nbsp;như sản phẩm&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac&nbsp;</span>chỉ c&oacute; duy nhất một m&agrave;u sắc đ&oacute; ch&iacute;nh l&agrave; m&agrave;u bạc th&igrave; phi&ecirc;n bản&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac Pro&nbsp;</span>mang tới m&agrave;u sắc huyền b&iacute; như c&aacute;c&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple</span>&nbsp;d&ugrave;ng cho sản phẩm&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iphone 11</span>&nbsp;của m&igrave;nh vậy. Nhưng kh&ocirc;ng chỉ&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac Pro</span>&nbsp;kh&ocirc;ng th&ocirc;i m&agrave; cả phụ kiện của m&aacute;y cũng sẽ mang m&agrave;u sắc n&agrave;y đem tới trải nghiệm nam t&iacute;nh hơn, sang trọng hơn v&agrave; đẹp hơn</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/imac_pro_3.png\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Tản nhiệt đ&atilde; được cải thiện</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Để c&oacute; thể g&aacute;nh được&nbsp;cấu h&igrave;nh của&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac Pro</span>&nbsp;v&ocirc; c&ugrave;ng mạnh mẽ,&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple</span>&nbsp;đ&atilde; trang bị cho m&igrave;nh một bộ tản nhiệt v&ocirc; c&ugrave;ng m&aacute;t mẻ. Điều n&agrave;y mang tới kết quả v&ocirc; c&ugrave;ng đ&aacute;ng ngạc nhi&ecirc;n khi nhiệt độ của<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac Pro&nbsp;</span>được cải thiện đ&aacute;ng kể, hiệu năng c&ocirc;ng suất của m&aacute;y c&oacute; thể bung hết tất cả sức mạnh gi&uacute;p cho trải nghiệm đ&atilde; mượt c&ograve;n mượt hơn nữa.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/imac_pro_1.png\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4. Qu&aacute;i vật b&ecirc;n trong vẻ người đẹp</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Nếu vẻ đẹp thiết kế của<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac Pro</span>&nbsp;đến từ việc tối giản, mọi thứ đều được l&agrave;m cong mềm mại, ho&agrave;n thiện xuất sắc. B&ecirc;n trong n&oacute; cũng l&agrave; cấu h&igrave;nh mạnh mẽ. Nhưng&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac Pro&nbsp;</span>c&ograve;n c&oacute; một con qu&aacute;i vật nữa đ&oacute; ch&iacute;nh l&agrave;&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">GPU AMD Radeon Vega</span>. Nhờ sức mạnh từ chiếc card n&agrave;y, kh&ocirc;ng t&aacute;c vụ render n&agrave;o c&oacute; thể l&agrave;m kh&oacute; được&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac Pro&nbsp;</span>kể cả file video chất lượng&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">8K.</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/imac_pro_4.png\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n</div>', 1),
(9, 'Imac_', 'iMac 2019 i5 3.7GHz RAM 8GB 2TB AMD 580X 27inch RETINA 5K ', 56800000, 56800000, 0, 126, 0, 3, 3, 'thumb_300x300_15749050795038.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">iMac 2019 Intel Core i5 6 core 3.7GHz RAM 8GB HDD 2TB AMD 580X 27inch RETINA 5K</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. M&agrave;n h&igrave;nh sống động chi tiết</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Chất lượng m&agrave;n h&igrave;nh vốn đ&atilde; v&ocirc; c&ugrave;ng xuất sắc tr&ecirc;n tất cả mọi sản phẩm của&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple&nbsp;</span>v&agrave;&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac 2019</span>&nbsp;cũng kh&ocirc;ng ngoại lệ. Nếu như phi&ecirc;n bản<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;21.5 inch</span>&nbsp;mang tới độ s&aacute;ng l&ecirc;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">500Nits, độ ph&acirc;n giải 4k Retina</span>&nbsp;đ&atilde; mang tới trải nghiệm v&ocirc; c&ugrave;ng tốt rồi. Phi&ecirc;n bản<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;27 inch&nbsp;</span>c&ograve;n mang tới trải nghiệm tốt hơn nữa khi độ ph&acirc;n giải đ&atilde; l&ecirc;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">5k</span>. V&igrave; vậy t&ugrave;y v&agrave;o nhu cầu,<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac</span>&nbsp;lu&ocirc;n đảm bảo độ hiển thị s&aacute;ng sắc n&eacute;t khiến bạn kh&ocirc;ng thể n&agrave;o khước từ được</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_65831.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Hiệu năng kh&ocirc;ng thể n&agrave;o ch&ecirc; được</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Sự cải tiến của c&aacute;c phi&ecirc;n bản 2019 của&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac</span>&nbsp;phải n&oacute;i tới<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;GPU&nbsp;</span>mạnh mẽ. C&aacute;c phi&ecirc;n&nbsp;bản iMac đều được trang bị d&ograve;ng card đồ họa mớ<span style=\"box-sizing: border-box; font-weight: bolder;\">i Radeon Pro 500X</span>&nbsp;mang tới sức mạnh hiệu năng v&ocirc; c&ugrave;ng tốt. Nhờ đ&oacute; khả năng<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Render&nbsp;</span>cũng được tăng l&ecirc;n đ&aacute;ng kể gi&uacute;p cho việc l&agrave;m đồ họa tr&ecirc;n chiếc<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac</span>&nbsp;trở n&ecirc;n dễ h&agrave;ng hơn. Giờ đ&acirc;y bạn c&oacute; thể y&ecirc;n tầm l&agrave;m việc thoải m&aacute;i nhất tr&ecirc;n chiếc m&aacute;y n&agrave;y m&agrave; kh&ocirc;ng phải mất thời gian đợi m&aacute;y load xong nội dung dẫn tới chậm deadline nữa.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_65812.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. MacOS + iMac</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Tưởng như kh&ocirc;ng c&oacute; g&igrave; đ&aacute;ng để n&oacute;i khi chắc chắn<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;PC</span>&nbsp;n&agrave;o của h&atilde;ng&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple&nbsp;</span>đều chạy hệ h&agrave;nh<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;MacOS&nbsp;</span>đ&uacute;ng kh&ocirc;ng? nhưng phi&ecirc;n bản&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">iMac 2019&nbsp;</span>lần n&agrave;y đ&atilde; được ưu đ&atilde;i ri&ecirc;ng từ h&atilde;ng nhờ mang tới giao diện dễ sử dụng hơn, th&acirc;n thiện hơn v&agrave; lu&ocirc;n cập nhật n&acirc;ng cấp để gi&uacute;p cho trải nghiệm người d&ugrave;ng mượt m&agrave; hơn nữa</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_65991.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4. Thiết kế tối giản</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">điều l&agrave;m&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Apple&nbsp;</span>tự h&agrave;o nhất ch&iacute;nh l&agrave; việc họ lu&ocirc;n muốn sản phẩm của m&igrave;nh đơn giản v&agrave; đẹp nhất, v&agrave;<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;iMac 2019</span>&nbsp;ch&iacute;nh l&agrave; những g&igrave; tinh hoa nhất m&agrave; h&atilde;ng đ&atilde; l&agrave;m được. Với thiết kế tối giản, c&aacute;c viền được bo cong mềm mại, chất lượng ho&agrave;n thiện v&ocirc; c&ugrave;ng xuất sắc. Kh&ocirc;ng c&oacute; từ n&agrave;o c&oacute; thể m&ocirc; tả được sản phẩm n&agrave;y ngo&agrave;i 2 chữ: \"&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Tuyệt Với\"</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_65781.jpg\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<div class=\"block-title\" style=\"box-sizing: border-box; font-size: 1.8rem; text-transform: uppercase; padding-left: 10px; color: #27bece; border-left: 6px solid #27bece; margin-bottom: 20px; font-family: Roboto, Arial;\">&nbsp;</div>', 1),
(10, 'C730', 'Lenovo LEGION C730 i9-9900K 512GB SSD 16GB BT WIN10 RTX 2080 ', 44900000, 44900000, 0, 123, 0, 3, 1, 'thumb_300x300_c730_3.png', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Lenovo LEGION C730-19ICO GAMING CUBE Core i9-9900K 3.6GHz RAM 16GB 512GB SSD BT WIN10 NVIDIA RTX 2080 Keyboard Mouse IRON GRAY</span></p>', '<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Qu&aacute;i vật b&ecirc;n trong người t&iacute; hon</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Nhờ được trang bị cấu h&igrave;nh v&ocirc; c&ugrave;ng mạnh mẽ<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Intel Core i9 9900K c&ugrave;ng với nVIDIA RTX 2080</span>.&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\"><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/lenovo-legion-c730/lenovo-legion-c730-i9-9900k-1tb-512gb-ssd-32gb-bt-win10-rtx-2080-pd44012.html\">Lenovo Legion C730</a></span>&nbsp;mang tới sức mạnh v&ocirc; c&ugrave;ng tuyệt với, c&oacute; thể đ&aacute;nh bại bất kỳ đối thủ n&agrave;o. Chưa kể thiết kế của&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/lenovo-legion-c730/lenovo-legion-c730-i9-9900k-1tb-512gb-ssd-32gb-bt-win10-rtx-2080-pd44012.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Lenovo Legion C730</span></a>&nbsp;lại v&ocirc; c&ugrave;ng nhỏ gọn tiện lợi gi&uacute;p cho việc x&aacute;ch đi lại v&ocirc; c&ugrave;ng dễ d&agrave;ng.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_62461.jpg\" alt=\"\" width=\"755\" height=\"424\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Qu&aacute;i vật cũng cần phải đẹp chứ</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Điều n&agrave;y đ&uacute;ng với<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/lenovo-legion-c730/lenovo-legion-c730-i9-9900k-1tb-512gb-ssd-32gb-bt-win10-rtx-2080-pd44012.html\">&nbsp;Lenovo Legion C730&nbsp;</a>khi giờ đ&acirc;y chiếc m&aacute;y kh&ocirc;ng chỉ mạnh m&agrave; c&ograve;n phải đẹp nữa. Với đ&egrave;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Led RGB, Lenovo Legion C730&nbsp;</span>nổi bật l&ecirc;n trong căn ph&ograve;ng của bạn. Giờ đ&acirc;y bạn c&oacute; thể đắm ch&igrave;m v&agrave;o kh&ocirc;ng gian game thủ với<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Lenovo Legion C730</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_62611.jpg\" alt=\"\" width=\"755\" height=\"424\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. X&aacute;ch đi tiện lợi</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Với chu&ocirc;i quai ở ph&iacute;a tr&ecirc;n,<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/lenovo-legion-c730/lenovo-legion-c730-i9-9900k-1tb-512gb-ssd-32gb-bt-win10-rtx-2080-pd44012.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Lenovo Legion C730&nbsp;</span></a>c&oacute; thể x&aacute;ch đi một c&aacute;ch dễ d&agrave;ng m&agrave; kh&ocirc;ng hề kh&oacute; khăn như những chiếc PC kh&aacute;c. Một chiếc PC tiện lợi ch&iacute;nh l&agrave; điểm m&agrave; kh&ocirc;ng phải chiếc m&aacute;y n&agrave;y cũng l&agrave;m được như&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Lenovo Legion C730.</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/img_64611.jpg\" alt=\"\" width=\"755\" height=\"424\" /></p>', 1),
(11, 'D_G5', 'Dell G5 15 5590 i5 9300H RAM 8GB 1TB HDD + 128GB SSD FHD IPS GTX 1650', 0, 24990000, 0, 105, 0, 2, 23, 'thumb_300x300_g5.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Dell G5 15 5590 Intel Core i5 9300H RAM 8GB 1TB HDD + 128GB SSD FHD IPS 15.6\" FHD IPS, nVIDIA GeForce GTX 1650, Win 10 Home 64 bits</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1.Thiết kế sang trọng v&agrave; bền bỉ</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5590</span>&nbsp;l&agrave; phi&ecirc;n bản n&acirc;ng cấp của&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5587</span>, thiết kế b&ecirc;n ngo&agrave;i của ch&uacute;ng kh&aacute; giống nhau với 2 lớp vỏ được l&agrave;m từ nh&ocirc;m cao cấp c&oacute; m&agrave;u đen hoặc trắng khiến cho chiếc m&aacute;y bền bỉ hơn nhưng vẫn giữ được n&eacute;t đẹp rất ri&ecirc;ng của m&igrave;nh, tạo cảm hứng rất tốt cho người d&ugrave;ng.Với k&iacute;ch thước chỉ 364.3 x 273.4 x 19.9 mm v&agrave; c&acirc;n nặng chỉ xấp xỉ 2.5kg - nhẹ hơn thế hệ trước -&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5590</span>&nbsp;trở n&ecirc;n cơ động hơn rất nhiều d&ugrave; c&oacute; \"b&eacute;\" hơn đ&ocirc;i ch&uacute;t, gi&uacute;p bạn c&oacute; thể mang theo b&ecirc;n m&igrave;nh, chinh phục c&aacute;c tựa game mọi l&uacute;c mọi nơi.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/g5_3.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2.Viền m&agrave;n h&igrave;nh thời cuộc - mỏng v&agrave; quyến rũ</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Kh&ocirc;ng như thế hệ trước, viền m&agrave;n h&igrave;nh tr&ecirc;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5590</span>&nbsp;được l&agrave;m mỏng đi rất nhiều khiến cho tỉ lệ m&agrave;n/lưng hay diện t&iacute;ch hiển thị cũng được tăng l&ecirc;n khiến cho chiếc m&aacute;y \"nh&igrave;n như 14 inch\" d&ugrave; sở hữu một m&agrave;n h&igrave;nh 15.6 inch. C&oacute; lẽ đ&acirc;y ch&iacute;nh l&agrave; l&iacute; do khiến cho chiếc m&aacute;y vừa b&eacute; lại vừa nhẹ hơn thế hệ trước.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/g5_2.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Màn hình 15.6 inch với đ&ocirc;̣ ph&acirc;̀n giải Full HD (1920 x 1080) cùng c&ocirc;ng nghệ màn hình Dell UltraSharp mang đến những h&igrave;nh ảnh chất lượng, chi tiết, r&otilde; n&eacute;t, m&agrave;u sắc cũng cực kỳ trung thực v&agrave; sống động. Ngo&agrave;i ra m&agrave;n h&igrave;nh IPS c&ograve;n cung cấp g&oacute;c nh&igrave;n l&ecirc;n tới 178 độ so với phương ngang, điều n&agrave;y c&oacute; nghĩa l&agrave; người d&ugrave;ng kh&ocirc;ng nhất thiết phải ngồi trực diện vẫn c&oacute; thể trải nghiệm hết chất lượng của h&igrave;nh ảnh. Đặc biệt l&agrave; với tần số qu&eacute;t của m&agrave;n h&igrave;nh l&agrave; 144Hz, c&aacute;c chuyển động trong game sẽ trở n&ecirc;n v&ocirc; c&ugrave;ng mượt m&agrave; gi&uacute;p tăng chất lượng trải nghiệm game của bạn l&ecirc;n rất nhiều</p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3.Hiệu năng mạnh mẽ với CPU Intel thế hệ 8</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5590</span>&nbsp;được trang bị bộ vi xử l&yacute; Intel Core i7-8750H (6 l&otilde;i 12 luồng) với xung nhịp l&ecirc;n tới 4.1GHz khiến cho mọi t&aacute;c vụ đều được thực hiện một c&aacute;ch nhanh ch&oacute;ng v&agrave; mượt m&agrave;. V&igrave; đ&acirc;y l&agrave; CPU đa nh&acirc;n n&ecirc;n n&oacute; hỗ trợ rất tốt cho c&aacute;c t&aacute;c vụ đa nhiệm d&ugrave; ch&uacute;ng nặng đến mấy. Thậm ch&iacute; nếu bạn muốn l&agrave;m đồ họa th&igrave; c&oacute; khi đ&acirc;y lại ch&iacute;nh l&agrave; điểm mạnh của chiếc CPU n&agrave;y v&igrave; khả năng Render của n&oacute; l&agrave; rất tốt.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/g5_1.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4.Đắm ch&igrave;m v&agrave;o thế giới game</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Card đồ họa được trang bị tr&ecirc;n&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Dell G5 15 5590</span>&nbsp;thuộc thế hệ Turing của nVIDIA vừa c&oacute; khả năng hỗ trợ VR (thực tế ảo) lại vừa hỗ trợ t&iacute;nh năng Ray Tracing khiến cho mọi h&igrave;nh ảnh trong game trở n&ecirc;n đẹp lung linh huyền ảo, tạo cho bạn cảm gi&aacute;c như đang h&ograve;a m&igrave;nh v&agrave;o thế giới của game đ&oacute; vậy. Điều n&agrave;y hứa hẹn sẽ mang đến cho c&aacute;c bạn những trải nghiệm chơi game tốt nhất.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/g5_51.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n</div>', 1),
(12, 'Core_X_3', 'Razer Core X Chroma ThunderBolt 3 cho laptop cao cấp - 700W (Mới)', 13490000, 13490000, 0, 107, 0, 4, 20, 'thumb_300x300_15559340019234.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">eGPU Razer Core X Chroma, GPU gắn ngo&agrave;i hỗ trợ kết nối Thunderbolt 3 cho Windows 10 v&agrave; Mac</span></p>', '<h2 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 15px; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2rem;\">eGPU Razer Core X&nbsp;</h2>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">TH&Ocirc;NG SỐ KỸ THUẬT:</p>\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">K&iacute;ch thước: 32.51 x 16.00 x 20.57 cm</li>\r\n<li style=\"box-sizing: border-box;\">C&acirc;n nặng: 5,49kg</li>\r\n<li style=\"box-sizing: border-box;\">Nh&agrave; sản xuất: Razer USA Ltd</li>\r\n<li style=\"box-sizing: border-box;\">Cổng kết nối: USB Type-C, USB 3</li>\r\n<li style=\"box-sizing: border-box;\">C&aacute;c hệ điều h&agrave;nh hỗ trợ: Windows 7/8/8.1/10, MacOS, Linux, Unbuntu, ....</li>\r\n<li style=\"box-sizing: border-box;\">Nguồn: 700W</li>\r\n</ul>', 1);
INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(13, 'M_A06G', 'Chuột không dây Fuhlen A06G (Mới)', 139000, 139000, 0, 101, 0, 4, 14, 'thumb_300x300_1mouse.jpg', '<p><span style=\"color: #666666; font-family: Roboto, sans-serif; font-size: 13px;\">Chuột&nbsp;kh&ocirc;ng d&acirc;y Fuhlen A06G Wireless 1000 DP</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<table style=\"border-collapse: collapse;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- Thiết kế Ergonomic, 3 ph&iacute;m chức năng.</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- Đầu tiếp nhận mini receiver, c&ocirc;ng nghệ Nano 2.4Ghz,&nbsp; độ ph&acirc;n giải 1000DPI, khoảng c&aacute;ch hoạt động 10m.</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- Tuổi thọ pin: 1 năm, với 1 pin AA Alkaline</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- Mầu: Black, Red, Blue,Grey</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- C&ocirc;ng nghệ quang tiết ki&ecirc;n pin 12 th&aacute;ng</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- K&iacute;ch thước: 100*59*38mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box;\">- Trọng lượng: 51.5g<br /><br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div class=\"block-title\" style=\"box-sizing: border-box; font-size: 1.8rem; text-transform: uppercase; padding-left: 10px; color: #27bece; border-left: 6px solid #27bece; margin-bottom: 20px; font-family: Roboto, Arial;\">&nbsp;</div>', 1),
(14, 'A_premium', 'Anker Premium 7-in-1 USB-C Hub Adapter', 1190000, 1190000, 0, 119, 0, 4, 15, 'thumb_300x300_15777885555384.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Anker Premium 7-in-1 USB-C Hub, with 4K USB C to HDMI, microSD/SD Card Reader, 3 USB 3.0 Ports, with 60W Power Delivery for Laptop.</span></p>', '<div class=\"block-title\" style=\"box-sizing: border-box; font-size: 1.8rem; text-transform: uppercase; padding-left: 10px; color: #27bece; border-left: 6px solid #27bece; margin-bottom: 20px; font-family: Roboto, Arial;\">TH&Ocirc;NG SỐ KỸ THUẬT</div>\r\n<div class=\"block-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<ul class=\"parameter list-unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding-left: 0px; list-style: none;\">\r\n<li class=\"ts_2\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\"><span class=\"lable-ts\" style=\"box-sizing: border-box; min-width: 134px; display: inline-block; vertical-align: top;\">Cổng giao tiếp:</span>&nbsp;\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">Anker USB C Hub, 7-in-1 USB C Adapter, with 4K USB C to HDMI, microSD/SD Card Reader, 3 USB 3.0 Ports, with 60W Power Delivery</div>\r\n</li>\r\n</ul>\r\n</div>', 1),
(15, 'EA7500', 'Router WiFi Linksys EA7500 Max-Stream™ AC1900 (MỚI)', 2490000, 2490000, 0, 106, 0, 4, 10, 'thumb_300x300_15649976402179.jpeg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Linksys EA7500 Max-Stream&trade; AC1900, CPU : 1.4 GHz, 2 băng tần 2.4 v&agrave; 5GHz tốc độ 600Mbps + AC1300Mbps</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Linksys EA7500 MAX-STREAM&trade; -&nbsp;Wi-Fi&nbsp;Router chuẩn AC 1900Mbps&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Linksys EA7500 - Wi-Fi&nbsp; Router sử dụng c&ocirc;ng nghệ&nbsp;MU-MIMO, truyền tải&nbsp; t&iacute;n hiệu kh&ocirc;ng d&acirc;y mạnh mẽ tới nhiều thiết bị c&ugrave;ng l&uacute;c.<br style=\"box-sizing: border-box;\" />C&aacute;c thiết bị như đầu thu HD, TV độ ph&acirc;n giải 4K, &nbsp;m&aacute;y t&iacute;nh bảng, m&aacute;y chơi game sử dụng băng th&ocirc;ng rất lớn. Tuy nhi&ecirc;n với c&ocirc;ng nghệ MU-MIMO ( Multi-User, Multipe-Input, Multipe Output) Linksys&nbsp;EA7500 MAX-STREAM&trade;&nbsp;mang lại khả năng truyền tải t&iacute;n hiệu Wi-Fi tới nhiều thiết bị c&ugrave;ng l&uacute;c m&agrave; vẫn duy tr&igrave; được tốc độ cao.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: center;\">&nbsp;<img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.anphatpc.com.vn/media/lib/20875_linksys-li-EA7500-2.png\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">C&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh bạn c&oacute; thể thoải mải chơi game, chia sẻ dữ liệu hay l&agrave;m việc đồng thời m&agrave; kh&ocirc;ng hề gặp hiện tượng giật lag - nhờ khả năng cung cấp tốc độ cao gấp đ&ocirc;i so với Wi-Fi Router kh&ocirc;ng hỗ trợ MU-MIMO</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">T&iacute;ch hợp ứng dụng Linksys Smart Wifi&nbsp;</span><br style=\"box-sizing: border-box;\" />C&ocirc;ng nghệ điện to&aacute;n đ&aacute;m m&acirc;y t&iacute;ch hợp trong c&aacute;c d&ograve;ng Linksys EA-Series cao cấp, cho ph&eacute;p truy cập hệ thống mạng để gi&aacute;m s&aacute;t v&agrave; quản l&yacute; ở mọi l&uacute;c mọi nơi bất kể bạn đang ở đ&acirc;u.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Trải nghiệm tốc độ Wifi l&ecirc;n tới 1900Mbps</span><br style=\"box-sizing: border-box;\" />EA7500 MAX-STREAM&trade; MU-MIMO hỗ trợ đồng thời 2 băng tần với tổng tốc độ l&ecirc;n tới 1900Mbps.<br style=\"box-sizing: border-box;\" />Thiết bị cho ph&eacute;p bạn dễ d&agrave;ng trải nghiệm c&aacute;c hoạt động đ&ograve;i hỏi băng th&ocirc;ng cao như truyền tải TV 4K tr&ecirc;n băng tần 5Ghz v&agrave; sử dụng c&aacute;c hoạt động cơ bản như email, lướt web tr&ecirc;n băng tần 2,4Ghz.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Kết nối cổng mạng Gigabit tốc độ cao</span><br style=\"box-sizing: border-box;\" />Kết nối mạng d&acirc;y đến nhiều thiết bị qua 4 cổng Gigabit chia sẻ dữ liệu với tốc độ cao gấp 10 lần chuẩn Ethernet th&ocirc;ng thường. Kết nối thiết bị lưu trữ qua cổng USB 3.0 hoặc c&aacute;c thiết bị kh&aacute;c như m&aacute;y in để sử dụng qua mạng Wi-Fi.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Bộ xử l&yacute; mạnh mẽ tăng cường hiệu năng&nbsp;</span><br style=\"box-sizing: border-box;\" />Sử dụng bộ xử l&yacute; Dual-Core tốc độ 1.4Ghz với 3 luồng truyền tải dữ liệu đồng thời, Thiết kế đặc biệt d&agrave;nh cho c&aacute;c trải nghiệm tốc độ cao như xem phim 4K v&agrave; chơi game online với Wi-Fi Router EA7500 MAX-STREAM&trade; 1900AC, sự kết hợp n&agrave;y gi&uacute;p tăng cường hiệu suất mạng Wi-Fi v&agrave; tốc độ truyền tới nhiều thiết bị.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Tăng cường tốc độ Wifi v&agrave; c&ugrave;ng phủ s&oacute;ng với Beamforming&nbsp;</span><br style=\"box-sizing: border-box;\" />C&ocirc;ng nghệ Beamforming mang lại khả năng định hướng s&oacute;ng Wi-Fi v&agrave; tăng cường t&iacute;n hiệu hiệu để tăng cường chất lượng phủ s&oacute;ng v&agrave; tăng tốc độ truyền dữ liệu tới c&aacute;c thiết bị đang kết nối.<br style=\"box-sizing: border-box;\" />Bạn c&oacute; thể&nbsp;dễ d&agrave;ng trải nghiệm c&aacute;c hoạt động như chơi game, nghe nhạc, truyền tải phim HD v&agrave; 4K m&agrave; kh&ocirc;ng phải lo lắng bị chậm hay mất t&iacute;n hiệu.</p>\r\n</div>', 1),
(16, 'MZ-02', 'eGPU Mantiz Venus MZ-02 Thunderbolt 3', 11500000, 11500000, 0, 126, 0, 4, 30, 'thumb_300x300_15559336755267.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Mantiz Venus MZ-02 b&aacute;&raquo;&trade; x&aacute;&raquo;&shy; l&yacute; &Auml;&lsquo;&aacute;&raquo;&ldquo; h&aacute;&raquo;a ngo&agrave;i eGPU- h&aacute;&raquo;&mdash; tr&aacute;&raquo;&pound; k&aacute;&ordm;&iquest;t n&aacute;&raquo;&lsquo;i Thunderbolt 3, SATA cho MacOS/Windows/Intel</span></p>', '<div class=\"block-title\" style=\"box-sizing: border-box; font-size: 1.8rem; text-transform: uppercase; padding-left: 10px; color: #27bece; border-left: 6px solid #27bece; margin-bottom: 20px; font-family: Roboto, Arial;\">TH&Ocirc;NG S&aacute;&raquo; K&Auml;&uml; THU&aacute;&ordm;&not;T</div>\r\n<div class=\"block-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<ul class=\"parameter list-unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding-left: 0px; list-style: none;\">\r\n<li class=\"ts_5\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\">K&iacute;ch th&AElig;&deg;&aacute;&raquo;&rsaquo;c: 231.14 x 373.38 x 167.64 mm</li>\r\n<li class=\"ts_6\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\">C&acirc;n n&aacute;&ordm;&middot;ng: 6.48kg<br />\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">&nbsp;</div>\r\n</li>\r\n<li class=\"ts_7\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\">Nh&agrave; s&aacute;&ordm;&pound;n xu&aacute;&ordm;&yen;t: Mantiz Innovation<br />\r\n<div style=\"box-sizing: border-box; display: inline-block; vertical-align: top;\">&nbsp;</div>\r\n</li>\r\n<li class=\"ts_1\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\">C&aacute;&raquo;&bull;ng k&aacute;&ordm;&iquest;t n&aacute;&raquo;&lsquo;i: USB Type-C, USB 3</li>\r\n<li class=\"ts_1\" style=\"box-sizing: border-box; padding-bottom: 15px; border-bottom: 1px solid #e1e1e1; margin-bottom: 15px;\">C&aacute;c h&aacute;&raquo;&Dagger; &Auml;&lsquo;i&aacute;&raquo;u h&agrave;nh h&aacute;&raquo;&mdash; tr&aacute;&raquo;&pound;: Windows 7/8/8.1/10, MacOS, Linux, Unbuntu, ....</li>\r\n</ul>\r\n</div>', 1),
(17, 'Dell_XPS_13', 'Dell XPS 13 7390 Core i7-10710U RAM 8GB SSD 256GB FHD IPS (Mới)', 0, 34990000, 3, 122, 0, 2, 23, 'thumb_300x300_anh_xps_7390.jpg', '<p><span style=\"color: #666666; font-family: Roboto, sans-serif; font-size: 13px;\">Cao cấp, sang trọng, ph&ugrave; hợp l&agrave;m văn ph&ograve;ng, CPU thế hệ mới nhất</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Cần g&igrave; thay đổi khi đ&atilde; ho&agrave;n hảo</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Dell XPS 13 7390 mặc d&ugrave; kh&ocirc;ng c&oacute; thay đổi g&igrave; nhiều so với c&aacute;c phi&ecirc;n bản trước kia, thế nhưng m&aacute;y việc g&igrave; thay đổi khi chất lượng sản phẩm vẫn lu&ocirc;n được đảm bảo. Vẫn được&nbsp;sử dụng bằng chất lượng Carbon Fiber, XPS 13 7390 mang tới trải nghiệm v&ocirc; c&ugrave;ng sướng cho người d&ugrave;ng. Độ ho&agrave;n thiện thiết kế v&ocirc; c&ugrave;ng tốt khiến cho m&aacute;y lu&ocirc;n giữ được d&aacute;ng vẻ thanh lịch vốn c&oacute; của n&oacute;. Ngo&agrave;i ra bản lề của m&aacute;y cũng v&ocirc; c&ugrave;ng chắc chắn khiến người d&ugrave;ng y&ecirc;n t&acirc;m trong qu&aacute; tr&igrave;nh sử dụng</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/7390_21.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Ho&agrave;n hảo nhưng vẫn cải tiến</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Điều thay đổi r&otilde; nhất trong phi&ecirc;n bản XPS 13 7390 đến từ Camera của m&aacute;y, giờ đ&acirc;y m&aacute;y đ&atilde; đặt vị tr&iacute; Camera tốt hơn&nbsp;mang tới trải nghiệm cho người d&ugrave;ng tốt hơn c&aacute;c phi&ecirc;n bản trước kia. Giờ đ&acirc;y việc sử dụng webcam kh&ocirc;ng c&ograve;n kh&oacute; khăn nữa</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/7390_41.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Cấu h&igrave;nh mạnh hơn nhanh hơn</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Điều n&agrave;y được thể hiện qua việc XPS 13 7390 l&agrave; một trong những laptop đi đầu về sử dụng CPU thế hệ mới của Intel đ&oacute; l&agrave;&nbsp;i5-10210U. Giờ đ&acirc;y việc giải tr&iacute; l&agrave;m việc đa t&aacute;c vụ kh&ocirc;ng c&ograve;n l&agrave; vấn đề với chiếc laptop mỏng nhẹ n&agrave;y nữa. Phương ch&acirc;m của Dell mang tới sản phẩm n&agrave;y ch&iacute;nh l&agrave; bền bỉ, mạnh mẽ, thanh lịch, sang trọng trong chiếc XPS 7390 n&agrave;y</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/7390_51.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>', 1),
(21, 'ROG_2', 'ASUS ROG phone 2 512GB', 19260600, 20490000, 6, 125, 0, 1, 16, '1_43.jpg', '<p>dsdasadadas</p>', '<div class=\"header\" style=\"box-sizing: border-box; margin: auto; padding: 0px; width: 343px; height: 53px; background: #f7f7f7; font-weight: bold; text-align: center; line-height: 50px; border-bottom: 1px solid #eeeeee; color: #3c3d41; font-family: sans-serif; font-size: 12px;\">\r\n<h2 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: inherit; line-height: 50px; color: #0a263c; font-size: 15px;\">Th&ocirc;ng số kỹ thuật</h2>\r\n</div>\r\n<div class=\"content\" style=\"box-sizing: border-box; margin: 0px; padding: 10px; color: #3c3d41; font-family: sans-serif; font-size: 12px;\">\r\n<table id=\"tskt\" style=\"margin: 0px; padding: 0px; border-spacing: 0px; border-collapse: collapse; background-color: transparent; border: 0px; empty-cells: show; width: 945px; height: 1075px;\">\r\n<tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">H&atilde;ng sản xuất</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">ASUS</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">K&iacute;ch thước</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">171.99 mm - 77.6 mm - 9.48 mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Trọng lượng</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">240g</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Bộ nhớ đệm / Ram</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">12 GB</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Bộ nhớ trong</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">512 GB</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Loại SIM</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Nano-SIM</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Loại m&agrave;n h&igrave;nh</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">AMOLED Tấm nền cảm ứng điện dung đa điểm 10 ng&oacute;n (hỗ trợ chế độ găng tay)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">6.59 inches</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Độ ph&acirc;n giải m&agrave;n h&igrave;nh</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">1080 x 2340 pixels</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Hệ điều h&agrave;nh</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Android</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Phi&ecirc;n bản hệ điều h&agrave;nh</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Android 9.0 (Pie)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Chipset</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Snapdragon 855 Plus Mobile Platform</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">CPU</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">64-bit Octa-core</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">GPU</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Qualcomm Adreno 640</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Khe cắm thẻ nhớ</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Kh&ocirc;ng</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Camera sau</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">48 MP + 13 MP</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Camera trước</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">24 MP</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Quay video</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">4K UHD (3840 x 2160) ở 30 / 60 fps cho camera ch&iacute;nh, ở 30 fps cho camera phụ</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">WLAN</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">802.11a/b/g/n/ac (2x2 MIMO) WLAN 802.11ad 60GHz</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Bluetooth</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">V 5.0 (BR/EDR+LE), hỗ trợ Qualcomm&reg; aptX Adaptive</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">GPS</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">GPS (L1+L5), GLO, BDS, GAL (E1+E5a), QZSS (L1+L5)</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">NFC</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Yes</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">USB</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">USB Type-C</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Cảm biến</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Cảm biến v&acirc;n tay trong m&agrave;n h&igrave;nh, Nhận diện khu&ocirc;n mặt, Gia tốc kế, E-Compass, Con quay hồi chuyển, Cảm bi&ecirc;n tiệm cận, Cảm biến Hall, Cảm biến &aacute;nh s&aacute;ng, Cảm biến si&ecirc;u &acirc;m cho AirTrigger II v&agrave; t&iacute;nh năng grip press, Hệ thống rung k&eacute;p</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: none; width: 100px;\">Pin</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: none;\">6000mAh, hỗ trợ Quick Charge 4.0 v&agrave; PD Charging</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 1),
(24, 'HP_G6', 'HP EliteBook 840 G6 i5-8265U SSD 256GB + 32GB Optane RAM 8GB FHD', 19100900, 20990000, 9, 126, 0, 2, 12, 'thumb_300x300_envy15x360avt.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">HP EliteBook 840 G6 Intel Core i5-8265U SSD 256GB + 32GB Optane RAM 8GB FHD IPS, Windows 10</span></p>', '<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Thiết kế ti&ecirc;n tiến đẹp mắt</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">HP EliteBook 840 G6 mang tới một thiết kế v&ocirc; c&ugrave;ng độc đ&aacute;o c&oacute; chất lường ho&agrave;n thiện tốt, khỏe khoắn gi&uacute;p cho năng lượng l&agrave;m việc của bạn lu&ocirc;n được tr&agrave;n đầy. Khi cấm chiếc HP EliteBook 840 G6, đ&acirc;y kh&ocirc;ng chỉ đơn thuần l&agrave; laptop d&agrave;nh cho doanh nghiệp, n&oacute; c&ograve;n l&agrave; người bạn th&acirc;n thiết, hỗ trợ bạn mọi l&uacute;c, mọi nơi.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/f10.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Chất lượng hiển thị sắc n&eacute;t</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Hp EliteBook 840 G6 mang tới chất lượng hiển thị sắc n&eacute;t với chuẩn FHD IPS, điều n&agrave;y sẽ gi&uacute;p &iacute;ch rất nhiều cho người d&ugrave;ng muốn một chiếc laptop lu&ocirc;n đảm bảo độ ch&acirc;n thật cần ch&iacute;nh x&aacute;c khi hiển thị b&aacute;o c&aacute;o, kết quả.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/i6.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. L&agrave;m việc hiệu quả</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Nhờ được trang bị t&iacute;nh năng khử tiếng ồn cao cấp, k&egrave;m với đ&oacute; l&agrave; camera chất lượng cũng như micro v&ocirc; cũng r&otilde; r&agrave;ng. Việc li&ecirc;n lạc giao tiếp trở n&ecirc;n v&ocirc; c&ugrave;ng hiệu quả gi&uacute;p bạn kh&ocirc;ng lo vấn đề khi họp hay thậm ch&iacute; l&agrave; trao đổi online với đối t&aacute;c.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/g8.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4. B&agrave;n ph&iacute;m chất lượng tốt</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">HP EliteBook 840 G6 mang tới chất lượng b&agrave;n ph&iacute;m v&ocirc; c&ugrave;ng tốt, k&egrave;m với đ&oacute; l&agrave; bảo mật v&acirc;n tay khiến bạn tự tin khi sử dụng cũng như lưu trữ t&agrave;i liệu tr&ecirc;n chiếc laptop n&agrave;y. HP EliteBook 840 G6 ch&iacute;nh l&agrave; lựa chọn ho&agrave;n hảo cho một trải nghiệm l&agrave;m việc tuyệt vời.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/h7.jpg\" alt=\"\" /></p>', 1);
INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(25, 'IP11_pro_max', 'Iphone 11 pro max', 28891500, 33990000, 15, 100, 0, 1, 3, '2aa38bbfc27b9aac9d958fb4898bbe08.png', '<p><span style=\"color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">Giảm 200.000đ khi mua k&egrave;m tai nghe airpods v&agrave;&nbsp;</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold; color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">1 km</span><span style=\"color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">&nbsp;kh&aacute;c</span></p>', '<h2 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 21px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại iPhone 11 Pro Max ch&iacute;nh h&atilde;ng VN/A\" href=\"https://cellphones.com.vn/iphone-11-pro-max.html\" target=\"_blank\" rel=\"noopener noreferrer\">iPhone 11 Pro Max</a>&nbsp;ch&iacute;nh h&atilde;ng VN/A&nbsp;&ndash; Bộ ba camera sau chụp ảnh đỉnh cao</span></h2>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Ra mắt c&ugrave;ng với iPhone 11 v&agrave;&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" href=\"https://cellphones.com.vn/iphone-11-pro.html\" target=\"_blank\" rel=\"noopener noreferrer\">iPhone 11 Pro</a>&nbsp;l&agrave;&nbsp;</em><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max</span>, đ&acirc;y&nbsp;mẫu smartphone cao cấp nhất của Apple được ra mắt năm 2019. Với thiết kế cao cấp, hệ thống camera 3 camera c&ugrave;ng cấu h&igrave;nh si&ecirc;u mạnh mẽ th&igrave; iPhone 11 Pro Max ch&iacute;nh l&agrave; một chiếc&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại smartphone ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/mobile.html\" target=\"_blank\" rel=\"noopener noreferrer\">smartphone</a>&nbsp;đ&aacute;p ứng mọi trải nghiệm của người d&ugrave;ng.</em></p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">iPhone 11 Pro Max c&oacute; k&iacute;ch thước to hơn với chất liệu th&eacute;p kh&ocirc;ng gỉ bền bỉ</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max</span>&nbsp;c&oacute; thiết kế tương tự như iPhone 11 Pro nhưng k&iacute;ch thước th&igrave; to hơn với k&iacute;ch thước m&agrave;n h&igrave;nh 6.5 inch v&agrave; to&agrave;n bộ m&aacute;y c&oacute; k&iacute;ch thước 158 x 77.8 x 8.1 mm. Thiết kế kh&ocirc;ng c&oacute; nhiều thay đổi trừ hệ thống camera sau được n&acirc;ng cấp th&agrave;nh 3 camera. M&agrave;n h&igrave;nh tai thỏ vẫn được giữ nguy&ecirc;n v&agrave; chất liệu th&eacute;p kh&ocirc;ng gỉ gi&uacute;p iPhone 11 Pro Max bền bỉ hơn.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-1.jpg\" alt=\"Thiết kế to hơn cho trải nghiệm tốt hơn với chất liệu th&eacute;p kh&ocirc;ng gỉ bền bỉ\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Đối với Series iPhone 11,&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại Apple ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/mobile/apple.html\" target=\"_blank\" rel=\"noopener noreferrer\">Apple&nbsp;</a>đ&atilde; bỏ đi mặt k&iacute;nh ở mặt lưng v&agrave; thay bằng chất liệu mờ mang đến cảm gi&aacute;c sờ th&iacute;ch hơn cũng như hạn chế trầy xước, b&aacute;m v&acirc;n tay. C&aacute;c m&agrave;u sắc của iPhone 11 Pro Max cũng lạ hơn so với c&aacute;c người anh em tiền nhiệm trước đ&acirc;y với c&aacute;c m&agrave;u x&aacute;m, v&agrave;ng, bạc v&agrave; xanh b&oacute;ng đ&ecirc;m.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-2.jpg\" alt=\"4 phi&ecirc;n bản m&agrave;u sắc\" /></p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">M&agrave;n h&igrave;nh 6.5 inch, c&ocirc;ng nghệ m&agrave;n h&igrave;nh Super Retina XDR cho khả năng hiển thị tuyệt vời</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max</span>&nbsp;c&oacute; m&agrave;n h&igrave;nh lớn với k&iacute;ch thước m&agrave;n h&igrave;nh 6.5 inch, độ ph&acirc;n giải 1242 x 2688 pixels cho h&igrave;nh ảnh hiển thị sắc n&eacute;t. M&agrave;n h&igrave;nh đạt chuẩn Super Retina XDR mang đến khả năng hiển thị tuyệt vời, h&igrave;nh ảnh ch&acirc;n thật, m&agrave;u sắc sinh động, độ tương phản m&agrave;u cao, h&igrave;nh ảnh chi tiết cao. Với m&agrave;n h&igrave;nh của iPhone 11 Pro Max, bạn c&oacute; thể tận hưởng những bộ phim hấp dẫn, c&aacute;c game đỉnh cao với chất lượng h&igrave;nh ảnh v&ocirc; c&ugrave;ng tuyệt vời.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-3.jpg\" alt=\"M&agrave;n h&igrave;nh 6.5 inch, c&ocirc;ng nghệ m&agrave;n h&igrave;nh Super Retina XDR cho khả năng hiển thị tuyệt vời\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Tấm nền&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"M&agrave;n h&igrave;nh Oled l&agrave; g&igrave;\" href=\"https://cellphones.com.vn/sforum/cong-nghe-man-hinh-oled-la-gi-smartphone-nao-dang-su-dung-man-hinh-oled?utm_source=sforum&amp;utm_medium=thu-thuat\" target=\"_self\">OLED&nbsp;</a>sẽ gi&uacute;p cho iPhone 11 Pro Max c&oacute; m&agrave;u sắc hiển thị đẹp hơn v&agrave; s&aacute;t với thực tế, c&oacute; thể n&oacute;i l&agrave; thực hơn bao giờ hết. Ở iPhone 11 Pro Max, c&oacute; thể thấy Apple đ&atilde; chăm ch&uacute;t rất nhiều cho h&igrave;nh ảnh hiển thị đến với người d&ugrave;ng tốt nhất, ho&agrave;n hảo nhất.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Hệ thống 3 camera</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;12MP</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;sau được n&acirc;ng cấp ch&iacute;nh l&agrave; điểm nổi bật ở iPhone 11 Pro Max</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Apple đ&atilde; n&acirc;ng cấp hệ thống camera cho iPhone 11 Pro Max th&agrave;nh cụm 3 camera v&agrave; được đặt gọn trong một h&igrave;nh vu&ocirc;ng. Với 1 camera g&oacute;c si&ecirc;u rộng m&agrave; ở c&aacute;c thế hệ iPhone trước đ&acirc;y chưa từng c&oacute;, gi&uacute;p cho khả năng chụp ảnh của iPhone 11 Pro Max đỉnh hơn v&agrave; chuy&ecirc;n nghiệp hơn.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-4.jpg\" alt=\"Hệ thống 3 camera 12MP sau được n&acirc;ng cấp ch&iacute;nh l&agrave; điểm nổi bật ở iPhone 11 Pro Max\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Hệ thống 3 camera c&oacute; c&ugrave;ng th&ocirc;ng số cảm biến l&agrave; 12MP v&igrave; thế h&igrave;nh ảnh được chụp từ iPhone 11 Pro Max v&ocirc; c&ugrave;ng sắc n&eacute;t v&agrave; ấn tượng. Khả năng chụp ảnh ở điều kiện thiếu s&aacute;ng tốt hơn, phạm vi zoom được mở rộng, cảm biến chiều s&acirc;u 3D mang đến h&igrave;nh ảnh như được chụp từ c&aacute;c m&aacute;y ảnh chuy&ecirc;n nghiệp, v&ocirc; c&ugrave;ng chất lượng, sắc n&eacute;t. B&ecirc;n cạnh đ&oacute; camera trước 12MP TrueDepth với c&ocirc;ng nghệ IR v&agrave; RBG cho khả năng nhận diện &aacute;nh s&aacute;ng tốt hơn, mang đến ảnh selfie đẹp v&agrave; rực rỡ hơn.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Cấu h&iacute;nh mạnh mẽ với chip&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #000000;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">A13 Bionic</span></span>, RAM đến 4GB xử l&yacute; nhanh ch&oacute;ng mọi t&aacute;c vụ v&agrave; chạy hệ điều h&agrave;nh iOS 13</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Con chip A13 Bionic l&agrave; một bộ vi xử l&yacute; tuyệt vời, mang sức mạnh vượt trội hơn hẳn chip A12 cũ. Được trang bị con chip A13,&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max</span></em>&nbsp;sở hữu cấu h&igrave;nh mạnh mẽ, ấn tượng v&agrave; k&egrave;m với RAM dung lượng đến 4GB, mọi thao t&aacute;c t&aacute;c vụ iPhone 11 Pro Max đều c&oacute; thể xử l&yacute; nhanh ch&oacute;ng, cho bạn trải nghiệm mượt m&agrave;, ổn định tất cả c&aacute;c t&aacute;c vụ, đa nhiệm.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-5_1.jpg\" alt=\"Cấu h&iacute;nh mạnh mẽ với chip A13 Bionic, RAM đến 6GB xử l&yacute; nhanh ch&oacute;ng mọi t&aacute;c vụ v&agrave; chạy hệ điều h&agrave;nh iOS 13\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">iPhone 11 Pro Max chạy hệ điều h&agrave;nh iOS 13 v&agrave; đ&acirc;y cũng l&agrave; hệ điều h&agrave;nh đang thu h&uacute;t nhiều sự ch&uacute; &yacute; từ ph&iacute;a truyền th&ocirc;ng cũng như cộng đồng y&ecirc;u c&ocirc;ng nghệ. iOS 13 ch&iacute;nh l&agrave; nền tảng cơ bản để iPhone 11 Pro Max c&oacute; thể ph&aacute;t huy những t&iacute;nh năng, sức mạnh nổi bật của m&igrave;nh. iPhone 11 Pro Max c&oacute; bộ nhớ trong 64GB v&igrave; vậy bạn c&oacute; thể lưu trữ nhiều dữ liệu, tập tin h&igrave;nh ảnh. Ngo&agrave;i ra iPhone 11 Pro Max c&ograve;n c&oacute; phi&ecirc;n bản&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"iPhone 11 Pro Max 256GB\" href=\"https://cellphones.com.vn/iphone-11-pro-max-256gb.html\" target=\"_blank\" rel=\"noopener noreferrer\">iPhone 11 Pro Max 256GB</a>&nbsp;v&agrave;&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"iPhone 11 Pro Max 512GB\" href=\"https://cellphones.com.vn/iphone-11-pro-max-512gb.html\" target=\"_blank\" rel=\"noopener noreferrer\">iPhone 11 Pro Max 512GB</a>&nbsp;d&agrave;nh cho ai c&oacute; nhu cầu lưu trữ cao, tận dụng tối đa bộ nhớ điện thoại.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #000000;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">FaceID tr&ecirc;n iPhone 11 Pro Max được n&acirc;ng cấp cho</span>&nbsp;</span>bảo mật an to&agrave;n, mở kh&oacute;a nhanh hơn</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">T&iacute;nh năng nhận diện khu&ocirc;n mặt FaceID vẫn được ứng dụng cho&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max</span>&nbsp;để bạn c&oacute; thể sử dụng điện thoại an to&agrave;n hơn. Khả năng nhận diện khu&ocirc;n mặt chuẩn x&aacute;c với camera hồng ngoại v&igrave; vậy bạn c&oacute; thể y&ecirc;n t&acirc;m về độ bảo mật tr&ecirc;n iPhone 11 Pro Max. Với FaceID, bạn c&oacute; thể nhanh ch&oacute;ng mở kh&oacute;a đăng nhập v&agrave;o điện thoại m&agrave; kh&ocirc;ng cần phải nhập mật khẩu cho mỗi lần đăng nhập.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-6.jpg\" alt=\"FaceID bảo mật an to&agrave;n, mở kh&oacute;a nhanh ch&oacute;ng\" /></p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Dung lượng pin 3500 mAh, c&ocirc;ng nghệ sạc ngược kh&ocirc;ng d&acirc;y tối ưu khả năng sử dụng</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Pin của&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">iPhone 11 Pro Max</em>&nbsp;c&oacute; dung lượng 3500 mAh, lớn hơn pin của iPhone Xs Max chỉ c&oacute; 3174 mAh v&igrave; thế iPhone 11 Pro Max mang đến thời gian sử dụng l&acirc;u hơn. B&ecirc;n cạnh đ&oacute;, sự hỗ trợ từ chip A13 Bionic c&ograve;n gi&uacute;p thời lượng pin tăng l&ecirc;n ch&iacute;nh v&igrave; thế bạn sẽ c&oacute; thể trải nghiệm điện thoại l&acirc;u hơn, nghe nhạc, xem phim, chơi game, l&agrave;m việc...trong thời gian d&agrave;i hơn.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-pro-max-7.jpg\" alt=\"Dung lượng pin 3500 mAh, c&ocirc;ng nghệ sạc ngược kh&ocirc;ng d&acirc;y tối ưu khả năng sử dụng\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">iPhone 11 Pro Max c&ograve;n được trang bị c&ocirc;ng nghệ sạc nhanh 18W, c&ocirc;ng nghệ sạc ngược kh&ocirc;ng d&acirc;y gi&uacute;p bạn chia sẻ pin cho c&aacute;c thiết bị Apple kh&aacute;c. Với c&ocirc;ng nghệ sạc nhanh, bạn c&oacute; thể nạp lại ngay 50% pin cho iPhone của m&igrave;nh chỉ trong 30 ph&uacute;t. Giờ đ&acirc;y bạn c&oacute; thể sử dụng điện thoại mọi l&uacute;c m&agrave; kh&ocirc;ng c&ograve;n lo t&igrave;nh trạng hết pin cũng như phải chờ đợi sạc l&acirc;u.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Mua ngay iPhone 11 Pro Max ch&iacute;nh h&atilde;ng VN/A với gi&aacute; hấp dẫn nhất tại CellphoneS</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">C&oacute; thể n&oacute;i&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">iPhone 11 Pro Max ch&iacute;nh h&atilde;ng</span>&nbsp;VN/A l&agrave; một chiếc si&ecirc;u phẩm cao cấp nhất của Apple với nhiều cải tiến vượt trội. Nếu bạn y&ecirc;u th&iacute;ch v&agrave; mong muốn sở hữu ngay iPhone 11 Pro Max, bạn c&oacute; thể mua ngay tại CellphoneS với cam kết sản phẩm ch&iacute;nh h&atilde;ng v&agrave; c&oacute; chất lượng tốt. Khi mua sản phẩm tại CellphoneS, bạn c&ograve;n được hưởng ch&iacute;nh s&aacute;ch bảo h&agrave;nh hấp dẫn, mức gi&aacute; b&aacute;n iPhone 11 Pro Max tại CellphoneS cũng v&ocirc; c&ugrave;ng hấp dẫn.</p>', 1),
(30, 'Ap_watch', 'Apple Watch 5 40mm (GPS) Viền Nhôm Vàng - Dây Hồng (MWV72)', 10315100, 11590000, 11, 107, 0, 4, 3, 'apple-watch-s5-lte-44mm-vien-nhom-day-cao-su_mrwh-j6.jpg', '<div class=\"header\" style=\"box-sizing: border-box; margin: auto; padding: 0px; width: 343px; height: 53px; background: #f7f7f7; font-weight: bold; text-align: center; line-height: 50px; border-bottom: 1px solid #eeeeee; color: #3c3d41; font-family: sans-serif; font-size: 12px;\">\r\n<h2 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: inherit; line-height: 50px; color: #0a263c; font-size: 15px;\">Th&ocirc;ng số kỹ thuật</h2>\r\n</div>\r\n<div class=\"content\" style=\"box-sizing: border-box; margin: 0px; padding: 10px; color: #3c3d41; font-family: sans-serif; font-size: 12px;\">\r\n<table id=\"tskt\" style=\"margin: 0px; padding: 0px; border-spacing: 0px; border-collapse: collapse; background-color: transparent; border: 0px; empty-cells: show; width: 322.4px;\">\r\n<tbody style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">H&atilde;ng sản xuất</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Apple Ch&iacute;nh h&atilde;ng</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Chất liệu</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Viền nh&ocirc;m - D&acirc;y cao su</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">K&iacute;ch thước</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">40mm - 34mm - 10.74mm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Trọng lượng</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">30.1 g</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Chipset</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Apple W3</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">CPU</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Bộ xử l&yacute; l&otilde;i k&eacute;p 64 bit</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Chống nước</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">Độ chịu nước 50 m&eacute;t</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Bluetooth</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">5.0</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: 1px solid #eeeeee; width: 100px;\">Pin</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: 1px solid #eeeeee;\">L&ecirc;n đến 18 giờ</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; margin: 0px; padding: 0px; height: 35px;\">\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; border-bottom: none; width: 100px;\">T&iacute;nh năng kh&aacute;c</td>\r\n<td style=\"box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: middle; font-weight: bold; border-bottom: none;\">M&agrave;n h&igrave;nh Retina lu&ocirc;n s&aacute;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 21px; text-align: left;\" align=\"center\"><a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"https://cellphones.com.vn/apple-watch-series-5-40-mm.html\" href=\"https://cellphones.com.vn/apple-watch-series-5-40-mm.html\" target=\"_blank\" rel=\"noopener noreferrer\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">A</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">pple watch series 5 40 mm</span></a><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;tương t&aacute;c trực quan c&ugrave;ng t&iacute;nh năng theo d&otilde;i sức khỏe hiện đại</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">iPhone đang ng&agrave;y được rất nhiều người d&ugrave;ng ưa chuộng v&agrave; tin tưởng sử dụng bởi kiểu d&aacute;ng thời thượng m&agrave; n&oacute; mang lại c&ugrave;ng c&aacute;c t&iacute;nh năng hiện đại v&agrave; độ bảo mật cao. Song song đ&oacute; Apple c&ograve;n cho ra mắt c&aacute;c d&ograve;ng&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Apple Watch ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/do-choi-cong-nghe/apple-watch.html\" target=\"_blank\" rel=\"noopener noreferrer\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Apple watch</span></a>&nbsp;để &ldquo;đồng h&agrave;nh&rdquo; c&ugrave;ng với iPhone gi&uacute;p cho nhưng thao t&aacute;c v&agrave; việc sử dụng của người d&ugrave;ng trở n&ecirc;n tiện lợi v&agrave; dễ d&agrave;ng hơn. Một trong số đ&oacute; ch&iacute;nh l&agrave;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">&nbsp;A</span></em><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">pple watch series 5 40 mm</em></span><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;hiện đại v&agrave; được trang bị nhiều t&iacute;nh năng hữu &iacute;ch</em></p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Thiết kế sang trọng với lớp vỏ chất liệu titan v&agrave; m&agrave;n h&igrave;nh 40mm</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Apple watch series 5 40 mm sở hữu cho m&igrave;nh một thiết kế kh&ocirc;ng c&oacute; nhiều kh&aacute;c biệt so với Apple watch series 4, d&acirc;y đeo vẫn với chất liệu cao su chất lượng cao, chống mồ h&ocirc;i v&agrave; đảm bảo &ecirc;m tay khi sử dụng. Lớp vỏ bằng titan rắn chắc v&agrave; bắt mắt sẽ khiến Apple watch series 5 trở n&ecirc;n v&ocirc; c&ugrave;ng thu h&uacute;t.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/accessories/watch_band/apple-watch-series-5-40-mm-1.jpg\" alt=\"Thiết kế sang trọng với lớp vỏ chất liệu titan v&agrave; m&agrave;n h&igrave;nh 40mm\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">M&agrave;n h&igrave;nh của Apple watch series 5 với k&iacute;ch thước 40mm v&agrave; tấm nền&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Tấm nền Amoled\" href=\"https://www.samsung.com/global/galaxy/what-is/amoled/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #333300;\">Amoled</span>&nbsp;</a>hiển thị r&otilde; r&agrave;ng, dễ d&agrave;ng thao t&aacute;c. Mặt k&iacute;nh chống thấm nước c&ugrave;ng khả năng cường lực tốt cho bạn y&ecirc;n t&acirc;m sử dụng ngay cả khi đang vận động.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Khả năng tương t&aacute;c trực quan với nền tảng&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #000000;\"><a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"watchOS 6\" href=\"https://www.apple.com/vn/watchos/watchos-preview/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #000000;\">WatchOS 6&nbsp;</span></a></span></span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">c&ugrave;ng&nbsp;</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">kho ứng dụng ri&ecirc;ng</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Apple watch series 5 được Apple trang bị nền tảng WatchOS 6 mới nhất với khả năng tương t&aacute;c trực quan. Bạn c&oacute; thể điều khiển v&agrave; hay thực hiện c&aacute;c t&aacute;c vụ chỉ bằng một c&aacute;i lắc cổ tay hoặc nắm tay lại. Ch&iacute;nh điều n&agrave;y sẽ gi&uacute;p cho việc sử dụng trở n&ecirc;n dễ d&agrave;ng hơn bao giờ hết ngay cả khi tay bạn đang b&aacute;m bẩn kh&ocirc;ng thể chạm v&agrave;o m&agrave;n h&igrave;nh.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/accessories/watch_band/apple-watch-series-5-40-mm-2.jpg\" alt=\"Khả năng tương t&aacute;c trực quan với nền tảng WatchOS 6 c&ugrave;ng kho ứng dụng ri&ecirc;ng\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Kh&ocirc;ng chỉ thế, Apple watch series 5 c&ograve;n được trang bị một kho ứng dụng ri&ecirc;ng tương tự như App store tr&ecirc;n iPhone để người d&ugrave;ng c&oacute; thể tải về những ứng dụng m&agrave; bạn muốn cho chiếc Apple watch của m&igrave;nh.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">T&iacute;nh năng theo d&otilde;i sức khỏe hiện đại v&agrave; pin sử dụng l&ecirc;n đến 18 giờ</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Apple watch series 5 v&ocirc; c&ugrave;ng th&iacute;ch hợp cho những người thường xuy&ecirc;n vận động v&agrave; tập luyện v&igrave; chiếc&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Đồng hồ th&ocirc;ng minh ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/do-choi-cong-nghe.html\" target=\"_blank\" rel=\"noopener noreferrer\">đồng hồ th&ocirc;ng minh</a>&nbsp;n&agrave;y sẽ trở th&agrave;nh một trợ thủ đắc lực gi&uacute;p bạn theo d&otilde;i t&igrave;nh h&igrave;nh sức khỏe v&agrave; mức độ luyện tập hợp l&iacute; cho bạn. Bạn c&oacute; thể theo d&otilde;i thời gian tập luyện th&iacute;ch hợp của m&igrave;nh, gi&uacute;p bạn như c&oacute; th&ecirc;m một &ldquo;người trợ l&iacute;&rdquo; lu&ocirc;n chăm s&oacute;c chu đ&aacute;o cho bạn.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/accessories/watch_band/apple-watch-series-5-40-mm-3.jpg\" alt=\"T&iacute;nh năng theo d&otilde;i sức khỏe hiện đại v&agrave; pin sử dụng l&ecirc;n đến 18 giờ\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Với dung lượng pin l&ecirc;n đến 18 giờ sử dụng gi&uacute;p cho người d&ugrave;ng thoải m&aacute;i sử dụng hầu như l&agrave; cả ng&agrave;y cho c&ocirc;ng việc, giải tr&iacute; v&agrave; cả vận động m&agrave; kh&ocirc;ng cần phải sạc lại rất bất tiện.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Mua Apple watch series 5 40mm&nbsp;</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">với&nbsp;</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">gi&aacute; tốt tại&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Hệ thống cửa h&agrave;ng b&aacute;n lẻ thiết bị c&ocirc;ng nghệ - điện tử ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/\" target=\"_blank\" rel=\"noopener noreferrer\">CellphoneS</a></span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif;\">Bạn đang muốn t&igrave;m cho m&igrave;nh một chiếc Apple Watch 5 40mm ch&iacute;nh h&atilde;ng với gi&aacute; cực tốt th&igrave; h&atilde;y nhanh ch&oacute;ng đến ngay CellphoneS &ndash; hệ thống chuy&ecirc;n b&aacute;n lẻ điện thoại, laptop, m&aacute;y t&iacute;nh bảng v&agrave; phụ kiện chất lượng tr&ecirc;n to&agrave;n quốc. Đến với CellphoneS bạn sẽ được sự tư vấn nhiệt t&igrave;nh v&agrave; chu đ&aacute;o bởi đội ngũ nh&acirc;n vi&ecirc;n gi&agrave;u kinh nghiệm v&agrave; v&ocirc; c&ugrave;ng th&acirc;n thiện, chắc chắn sẽ gi&uacute;p bạn t&igrave;m được sản phẩm ph&ugrave; hợp với nhu cầu của m&igrave;nh.&nbsp;&nbsp;</p>', 1),
(31, 'L_730S', 'Lenovo IdeaCentre 730S AIO i7-8550U HDD 1TB RAM 8GB 23.8', 0, 19990000, 0, 109, 0, 3, 1, 'thumb_300x300_15675851974137.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Lenovo IdeaCentre 730S ALL-IN-ONE Core&trade; i7-8550U, HDD 1TB, RAM 8GB, 23.8\" FHD IPS TOUCHSCREEN, Win 10, Webcam IR</span></p>', '<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Người đẹp&nbsp;<s style=\"box-sizing: border-box;\">v&agrave;</s>&nbsp;\"Qu&aacute;i th&uacute;\"</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">The IdeaCentre all-in-one 730s mang đến cho bạn t&ugrave;y chọn c&ocirc;ng nghệ&nbsp;Advanced In-Cell Touch (AIT), cực k&igrave; hiện đại, gi&uacute;p bạn c&oacute; thể thoải m&aacute;i tận hưởng chất lượng hiển thị tuyệt với tr&ecirc;n m&agrave;n h&igrave;nh rộng tới 23.8 inch.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_6.jpg\" width=\"800\" height=\"449\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Mỏng hơn nữa, tiết kiệm kh&ocirc;ng gian cực tốt</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Thiết kế để c&acirc;n bằng giữa sự cứng rắn v&agrave; sự quyến rũ, m&agrave;n h&igrave;nh n&agrave;y tuy chỉ d&agrave;y 7mm nhưng được l&agrave;m từ những chất liệu cực k&igrave; cứng c&aacute;p v&agrave; cao cấp gi&uacute;p bạn c&oacute; thể thoải m&aacute;i sử dụng trong thời gian l&acirc;u d&agrave;i.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_3.jpg\" width=\"800\" height=\"450\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Chỉ việc \"Cắm\" v&agrave; \"Chạy\"</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Chỉ cần mở hộp v&agrave; kh&ocirc;ng cần phải mua th&ecirc;m thứ g&igrave; cả, Lenovo đ&atilde; cung cấp sẵn cho Lenovo IdeaCentre 730S ALL-IN-ONE một bộ thiết bị bao gồm chuột v&agrave; b&agrave;n ph&iacute;m để bạn c&oacute; thể nhanh ch&oacute;ng kết nối v&agrave; sẵn s&agrave;ng l&agrave;m việc bất cứ l&uacute;c n&agrave;o.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_7.jpg\" width=\"800\" height=\"450\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Lu&ocirc;n giữ vững nhịp độ ph&aacute;t triển</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">IdeaCentre AIO 730s sở hữu một bộ vi xử l&yacute; Intel Core i thế hệ 8 mới nhất c&oacute; tới 4 nh&acirc;n 8 luồng&nbsp;tốc độ xử l&yacute; nhanh nhất hiện nay, l&ecirc;n tới 3.40 GHz. Kết hợp với&nbsp;16 GB RAM DDR4 với c&ocirc;ng nghệ&nbsp;Intel&reg; Optane&trade; tăng tốc cho bộ nhớ, th&igrave; m&igrave;nh d&aacute;m đảm bảo rằng sẽ kh&ocirc;ng c&oacute; bất cứ một c&ocirc;ng việc n&agrave;o c&oacute; thể l&agrave;m kh&oacute; được chiếc m&aacute;y All-In-One n&agrave;y, kể cả l&agrave; c&ocirc;ng việc nặng nhọc nhất.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_4.jpg\" width=\"800\" height=\"450\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Mang cả thế giới ra b&ecirc;n ngo&agrave;i</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">H&atilde;y tận hưởng khả năng xử l&yacute; đồ họa tuyệt với của GPU Intel UHD Graphics 620 được t&iacute;ch hợp sẵn trong m&aacute;y. Hoặc nếu bạn chọn phi&ecirc;n bản c&oacute; card đồ họa AMD th&igrave; bạn c&oacute; thể tho&aacute;i m&aacute;i l&agrave;m c&aacute;c t&aacute;c vụ đồ họa phức tạp hay chiến mọi tựa game đồ họa nặng nhất hiện nay m&agrave; kh&ocirc;ng sợ giật lag.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_1.jpg\" width=\"800\" height=\"449\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Đầy đủ cổng kết nối</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Sở hữu&nbsp;USB-C si&ecirc;u tốc, bạn c&oacute; thể truyền tải dữ liệu với tốc độ l&ecirc;n tới 5GB/s n&ecirc;n d&ugrave; tệp tin c&oacute; nặng đến đ&acirc;u th&igrave; bạn cũng kh&ocirc;ng phải lo lắng v&igrave; tốn thời gian. Hơn nữa, với đầy đủ c&aacute;c cổng kết nối th&ocirc;ng dụng nhất hiện nay, bạn c&oacute; thể thoải m&aacute;i kết nối với c&aacute;c thiết bị ngoại vị kh&aacute;c v&agrave;&nbsp;sẽ kh&ocirc;ng phải mua th&ecirc;m c&aacute;c cổng chuyển đổi vướng v&iacute;u nữa.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_2.jpg\" width=\"800\" height=\"449\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">C&oacute; hẳn trợ l&yacute; ri&ecirc;ng lu&ocirc;n!</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">IdeaCentre AIO 730s được t&iacute;ch hợp sẵn Windows 10 Home v&agrave; trợ l&yacute; ảo Cortana, với giọng n&oacute;i của bạn, bạn c&oacute; thể setup Cortana trở th&agrave;nh trợ l&yacute; ri&ecirc;ng của m&igrave;nh. Cortana c&oacute; thể hỗ trợ bạn bằng c&aacute;ch t&igrave;m c&aacute;c tập tin, mở ứng dụng, tra dữ liệu tr&ecirc;n mạng, đặt b&aacute;o thức v&agrave; thậm ch&iacute; l&agrave; tr&ograve; chuyện cả với bạn nếu bạn đang độc th&acirc;n lu&ocirc;n!&nbsp;Hơn nữa, Micro được gắn sẵn trong m&aacute;y c&oacute; khả năng bắt s&oacute;ng ở rất xa, n&ecirc;n d&ugrave; c&aacute;ch xa đến 1 bức tường, bạn vẫn c&oacute; thể ra lệnh cho Cortana.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://metro.co.uk/wp-content/uploads/2018/10/windows-10-505c.png\" alt=\"Image result for windows 10 cortana\" width=\"800\" height=\"450\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Roboto, sans-serif; font-weight: 500; line-height: 1.2; color: #666666; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Qu&ecirc;n mật khẩu thoải m&aacute;i đi!</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif;\">Nếu bạn chọn một chiếc AIO 730S c&oacute; t&ugrave;y chọn camera hồng ngoại, kết hợp với chức năng Windows Hello mới nhất tr&ecirc;n Windows 10 th&igrave; bạn sẽ kh&ocirc;ng cần phải nhớ mật khẩu lằng nhằng. Chỉ cần bạn c&oacute; mặt ở đ&oacute;, m&aacute;y t&iacute;nh sẽ tự mở l&ecirc;n ch&agrave;o đ&oacute;n bạn v&agrave; khi bạn rời khỏi, m&agrave;n h&igrave;nh sẽ tự tắt v&agrave; đưa chiếc m&aacute;y v&agrave;o trạng th&aacute;i an to&agrave;n nhất!</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #666666; font-family: Roboto, sans-serif; text-align: center;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/san-pham/Lenovo/730SAIO/730s_aio_asp_8.jpg\" width=\"800\" height=\"450\" /></p>', 1);
INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(32, 'R_Raptor', 'Razer Raptor 27inch WQHD 144Hz- Non-Glare IPS (Mới)', 0, 22990000, 0, 99, 0, 3, 20, 'thumb_300x300_15764826148690.jpg', '<p><span style=\"color: #666666; font-family: Arial; font-size: 13px;\">Razer Raptor 27\" 144Hz Gaming Monitor - Non-Glare WQHD (2560 x 1440) IPS Display 90&deg; Tilt</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1.M&agrave;n h&igrave;nh gaming tiện&nbsp;lợi</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Thiết kế của Razer Raptor mang tới sự sang trọng cao cấp nhưng cũng đậm chất gaming d&agrave;nh ri&ecirc;ng cho game thủ. Giờ đ&acirc;y mọi thứ kh&ocirc;ng chỉ m&agrave;n h&igrave;nh to, sắc n&eacute;t m&agrave; c&ograve;n tiện lợi, dễ d&agrave;ng th&aacute;o lắp. Razer Raptor ch&iacute;nh l&agrave; sự lựa chọn ho&agrave;n hảo cho người cần một m&agrave;n h&igrave;nh chuẩn gaming nhưng cũng phải gọn g&agrave;ng. Chưa kể điểm s&aacute;ng của Razer Raptor c&ograve;n đến từ gi&aacute; nghi&ecirc;n c&oacute; thể gi&uacute;p m&agrave;n h&igrave;nh gập 90 độ một c&aacute;ch dễ d&agrave;ng.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/razer_raptor.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. Chuẩn mực m&agrave;u sắc</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Kh&ocirc;ng chỉ đẹp sang trọng, Razer Raptor mang tới m&agrave;n h&igrave;nh k&iacute;ch thước 27 inch cũng với độ ph&acirc;n giải WQHD (2560x1440) v&ocirc; c&ugrave;ng sống động. Tất nhi&ecirc;n ch&uacute;ng ta kh&ocirc;ng thể n&agrave;o bỏ qua tần số qu&eacute;t 144HZ của m&agrave;n h&igrave;nh n&agrave;y được. Trải nghiệm game giờ đ&acirc;y kh&ocirc;ng c&ograve;n bị ngăn c&aacute;ch bởi tần số qu&eacute;t thấp nữa. Nhưng điểm nổi bật của Razer Raptor ch&iacute;nh l&agrave; m&agrave;u sắc. M&agrave;n h&igrave;nh đem tới độ m&agrave;u sắc&nbsp;95% DCI-P3, c&ugrave;ng với đ&oacute; l&agrave;&nbsp;HDR tr&ecirc;n&nbsp;400 nits cho ph&eacute;p hiển thị tốt nhất. V&igrave; thế chẳng c&oacute; g&igrave; c&oacute; thể ngăn cản bạn d&agrave;nh chiến thắng khi sử dụng Razer Raptor.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/123.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Th&iacute;ch ứng mọi khắc nghiệt</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Với Razer Raptor, những hiện tượng x&eacute; m&agrave;n h&igrave;nh hay khựng răng cưa kh&ocirc;ng c&ograve;n l&agrave; vấn đề nữa. Với việc Razer Raptor 27 hỗ trợ AMD Freesync v&agrave; nVIDIA G-Sync. Những g&igrave; bạn cần l&agrave;m trải nghiệm, trải nghiệm m&agrave; kh&ocirc;ng hề bị những hiện tượng trễ l&agrave;m chậm đi nhịp điệu cuộc chiến trong game của bạn đặc biệt l&agrave; game FPS. V&igrave; thế Razer Raptor l&agrave; lựa chọn ho&agrave;n hảo cho game thủ.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/122.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<p>&nbsp;</p>\r\n</div>', 1),
(33, 'TP_P51', 'ThinkPad P51 i7-7700HQ SSD 512GB RAM 16GB 4K UHD IPS M1200M (Mới)', 31610700, 33990000, 7, 83, 0, 2, 21, 'thumb_300x300_p51_nen.png', '<p><span style=\"color: #666666; font-family: Roboto, sans-serif; font-size: 13px;\">M&aacute;y trạm mạnh mẽ, b&agrave;n ph&iacute;m h&agrave;ng đầu, m&agrave;n h&igrave;nh hiển thị sống động.</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1.Mạnh hơn, nhưng lại nhẹ đi?!?</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-p51-pl353.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">Lenovo ThinkPad P51</span></a>&nbsp;l&agrave; sản phẩm của&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-pl218.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad</span></a>&nbsp;v&agrave;o năm 2017 được coi l&agrave; một sự n&acirc;ng cấp đ&aacute;ng gi&aacute; so với&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-p50-pl352.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P50</span></a>&nbsp;do cấu h&igrave;nh nay đ&atilde; c&oacute; thể l&ecirc;n tới&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">Intel Core i7&nbsp;vPro</span>&nbsp;thế hệ 7&nbsp;cực k&igrave; mạnh mẽ v&agrave; tiết kiệm điện, kết hợp với&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">RAM DDR4 2400MHz</span>&nbsp;cho hiệu năng mạnh hơn&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-p50-pl352.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P50</span></a>&nbsp;tới 25%. Thế nhưng tổng c&acirc;n nặng của chiếc&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"http://www.thinkpro.vn/thinkpad-p51-pl353.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P51</span></a>&nbsp;lại nhẹ hơn&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/thinkpad-p50-pl352.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P50</span></a>&nbsp;tới 0.2kg (2.5kg) gi&uacute;p cho con qu&aacute;i vật n&agrave;y giờ đ&acirc;y đ&atilde; trở n&ecirc;n cơ động hơn kh&aacute; nhiều, gi&uacute;p bạn c&oacute; thể dễ d&agrave;ng mang đi hơn so với thế hệ trước</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/p51_41.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2.Thiết kế&nbsp;\"vạm vỡ\" đặc trưng huyền thoại</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Vẫn giữ được n&eacute;t thiết kế đặc trưng của d&ograve;ng&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"https://www.thinkpro.vn/p-series-pl237.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad Workstation</span></a>&nbsp;với độ ho&agrave;n thiện vượt xa c&aacute;c d&ograve;ng Laptop phổ th&ocirc;ng kh&aacute;c,&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"http://www.thinkpro.vn/thinkpad-p51-pl353.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P51</span></a>&nbsp;mang một d&aacute;ng cứng c&aacute;p v&agrave; chắc chắn sẽ mang lại một cảm gi&aacute;c cực kỳ&nbsp;an to&agrave;n cho bạn.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/p51_21.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Độ bao phủ m&agrave;u sắc đạt tr&ecirc;n 95% sRGB, cực kỳ ph&ugrave; hợp cho đồ họa</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">M&agrave;n h&igrave;nh&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">15.6\" FHD</span>&nbsp;tr&ecirc;n&nbsp;<a style=\"box-sizing: border-box; color: #176093; text-decoration-line: none; background-color: transparent;\" href=\"http://www.thinkpro.vn/thinkpad-p51-pl353.html\"><span style=\"box-sizing: border-box; font-weight: bolder;\">ThinkPad P51</span></a>&nbsp;c&oacute; độ ph&acirc;n giải l&agrave;&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">1920 x 1080</span>&nbsp;c&ugrave;ng độ bao phủ m&agrave;u sắc đạt&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">98% sRGB</span>,&nbsp;<span style=\"box-sizing: border-box; font-weight: bolder;\">77% AdobeRGB</span>&nbsp;v&agrave; độ sai lệch m&agrave;u sắc chỉ l&agrave;<span style=\"box-sizing: border-box; font-weight: bolder;\">&nbsp;Delta E = 1.23</span>&nbsp;cho chất lượng hiển thị cực tốt với gam m&agrave;u rộng c&ugrave;ng độ ch&acirc;n thực rất cao cho ph&eacute;p bạn c&oacute; thể thoải m&aacute;i thiết kế đồ họa v&agrave; tạo ra những kiệt t&aacute;c của đời m&igrave;nh.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/p51_11.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem; text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">4.Hiệu năng ổn định</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Được trang bị bộ vi xử l&yacute; Intel Core i7 vPro thế hệ 6/7 (4 l&otilde;i 8 luồng) c&oacute; xung nhịp l&ecirc;n tới 4.10 GHz cho hiệu năng cực tốt d&ugrave; l&agrave; hoạt động đơn nh&acirc;n hay đa nh&acirc;n, gi&uacute;p bạn c&oacute; thể l&agrave;m bất cứ thứ g&igrave; với một tốc độ cực kỳ nhanh v&agrave; c&oacute; thể l&agrave;m c&aacute;c t&aacute;c vụ đa nhiệm một c&aacute;ch mượt m&agrave; nhất.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/p511.jpg\" alt=\"\" width=\"775\" height=\"436\" /></p>\r\n<p>&nbsp;</p>\r\n</div>', 1),
(35, 'Dell_7540', 'Dell Precision 7540 i9-9980H RAM 32GB SSD 512GB FHD IPS T2000', 0, 47990000, 0, 96, 0, 2, 23, 'thumb_300x300_7540_avt.jpg', '<p><span style=\"color: #666666; font-family: Roboto, sans-serif; font-size: 13px;\">M&aacute;y trạm đồ họa bền bỉ, hiệu năng cao, GPU đa năng, b&agrave;n ph&iacute;m g&otilde; tốt.</span></p>', '<div class=\"content-danhgia built-toggle ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">1. Kh&ocirc;ng ngừng s&aacute;ng tạo</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Dell Precision 7540 mang tới sự s&aacute;ng tạo kh&ocirc;ng ngừng nghỉ với việc sở hữu CPU Intel&nbsp;mới nhất c&ugrave;ng với GPU chuy&ecirc;n dụng cho l&agrave;m đồ họa Quadro. Trải nghiệm l&agrave;m việc chuy&ecirc;n nghiệp của 7540&nbsp;n&agrave;y chắc chắn v&ocirc; c&ugrave;ng đỉnh cao m&agrave; kh&ocirc;ng phải chiếc laptop n&agrave;o cũng l&agrave;m được. Những g&igrave; bạn cần l&agrave;m đ&oacute; l&agrave; s&aacute;ng tạo v&agrave; s&aacute;ng tạo, những c&ocirc;ng đoạn c&ograve;n lại cứ để Dell Precision 7540 giải quyết nh&eacute;.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/368.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">2. N&acirc;ng cao chất lượng l&agrave;m việc</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Nhờ được trang bị vi&ecirc;n pin 97 Whr k&egrave;m với c&ocirc;ng nghệ ExpressCharge gi&uacute;p cho năng suất l&agrave;m việc lu&ocirc;n được đảm bảo l&acirc;u d&agrave;i v&agrave; bển bỉ nhất. Chưa dừng ở đ&oacute;, với việc hỗ trợ RAM ECC, những vấn đề render bị lỗi thường gặp sẽ được Dell Precision 7540&nbsp;giảm thải từ đ&oacute; n&acirc;ng cao chất lượng l&agrave;m việc cho bạn. Nhờ khả năng n&acirc;ng cấp dung lượng với 2 ổ PCle NVMe v&agrave; 1 khay HDD 2.5\" hoặc 3 ổ PCle NVMe, bạn khi đang l&agrave;m việc th&igrave; đột nhi&ecirc;n hết dung lượng nữa. R&otilde; r&agrave;ng những yếu tố n&agrave;y đ&atilde; cho thấy Dell Precison 7540 ph&ugrave; hợp với quay dựng, chuy&ecirc;n s&acirc;u đồ họa như thế n&agrave;o.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/199.jpg\" alt=\"\" /><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/f13.jpg\" alt=\"\" /></p>\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">3. Thiết kế tối giản nhưng bền bỉ</span></h1>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Mặc d&ugrave; cấu h&igrave;nh mạnh mẽ như vậy nhưng thiết kể của Dell Precision 7540 lại v&ocirc; c&ugrave;ng tối giản đậm chất doanh nh&acirc;n, thế nhưng điều đ&oacute; kh&ocirc;ng c&oacute; nghĩa chiếc laptop n&agrave;y chất lượng b&igrave;nh thường, sự bền bỉ theo thời gian th&ocirc;ng qua việc ho&agrave;n thiện chắc chắn khiến Dell Precision 7540 ghi điểm với người d&ugrave;ng. Nếu bạn mong đợi một thiết kế thời trang th&igrave; Dell Precision 7540 kh&ocirc;ng d&agrave;nh cho bạn, nhưng nếu bạn muốn một chiếc laptop th&uacute;c đẩy khả năng s&aacute;ng tạo, bền bỉ theo thời gian th&igrave; chắc chắn chiếc laptop n&agrave;y l&agrave; đỉnh cao.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%; margin-bottom: 20px;\" src=\"https://thinkpro.vn/uploads/images/userfiles/294.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n</div>', 1),
(36, 'SS_N10', 'Samsung Galaxy S10 White', 16720000, 20900000, 20, 110, 0, 1, 35, 'note_10_plus_xanh.jpg', '<p>Điện thoại Samsung Galaxy S10 - Cập nhật th&ocirc;ng tin cấu h&igrave;nh, gi&aacute; b&aacute;n, chương tr&igrave;nh khuyến m&atilde;i</p>', '<p><em>Sự kiện Samsung Unpacked 2019 đ&atilde; kh&eacute;p lại với th&agrave;nh c&ocirc;ng kh&ocirc;ng thể tuyệt vời hơn, ch&iacute;nh l&agrave; biết thế hệ S thứ 10 của m&igrave;nh th&agrave;nh t&acirc;m điểm, chiếm s&oacute;ng to&agrave;n bộ spotlight của Đại hội MWC 2019. Thực sự, Samsung Galaxy S10 kh&ocirc;ng hẳn l&agrave; bản n&acirc;ng cấp ho&agrave;n hảo về mọi mặt nhưng n&oacute; hội tụ đủ, đ&uacute;ng những yếu tố cần thiết để người d&ugrave;ng cả thấy kh&ocirc;ng nh&agrave;m ch&aacute;n v&agrave; h&agrave;o hứng muốn sở hữu. Samsung Galaxy S10 cũng ch&iacute;nh l&agrave; bước s&atilde;i ch&acirc;n xa bắt kịp với c&aacute;c đối thủ song vẫn chứng minh ng&ocirc;i vương của bản th&acirc;n sau một năm nhạt nh&ograve;a.</em></p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Thiết kế đỉnh cao &ndash; điểm nhấn m&agrave;n h&igrave;nh &ldquo;nốt ruồi&rdquo;</strong></h3>\r\n<p>C&ocirc;ng nghệ Infinity O đ&atilde; được Samsung c&ocirc;ng bố v&agrave; ứng dụng tr&ecirc;n c&aacute;c smartphone tầm trung của m&igrave;nh. Tuy kh&ocirc;ng c&ograve;n qu&aacute; xa lạ nhưng với ph&acirc;n kh&uacute;c cao cấp đ&acirc;y l&agrave; một sự mới mẻ b&ecirc;n cạnh một rừng tai thỏ đủ thế loại. Tấm nền hiển thị tr&ecirc;n S10 cũng đ&atilde; được n&acirc;ng cấp, v&agrave; giờ đ&acirc;y sau bao nhi&ecirc;u năng gắn b&oacute; với Super AMOLED, Samsung gọi c&ocirc;ng nghệ mới của m&igrave;nh l&agrave; Dynamic AMOLED. Samsung Galaxy S10 c&oacute; độ ph&acirc;n giải m&agrave;n h&igrave;nh Quad HD+ với tỷ lệ 19:9 mới, điều đặt biệt l&agrave; độ s&aacute;ng của tấm nền mới l&ecirc;n đến 1200nits đạt chuẩn HDR10 v&agrave; HDR10+ đầu ti&ecirc;n tr&ecirc;n thiết bị duy động. Kh&ocirc;ng những thế Samsung Galaxy S10 c&ograve;n được c&ocirc;ng nhận đạt 100% chuẩn m&agrave;u điện ảnh DCI-P3 v&agrave; độ tương phản khủng khiếp 2.000.000:1. Hiển thị tr&ecirc;n Galaxy S10 kh&ocirc;ng c&oacute; g&igrave; để c&oacute; thể ph&agrave;n n&agrave;n bất kể mục đ&iacute;ch sử dụng, điều kiện m&ocirc;i trường.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 408px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s10.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s10.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Vẫn l&agrave; triết l&yacute; thiết kế quen thuộc của Samsung từ 2016, kim loại c&ugrave;ng với 2 mặt k&iacute;nh cong nhưng tr&igrave;nh độ ho&agrave;n thiện của Samsung Galaxy S10 đ&atilde; đạt đến tr&igrave;nh độ tuyệt hảo đến từng chi tiết nhỏ. M&agrave;u sắc cũng l&agrave; điểm thu h&uacute;t của c&aacute;c series S10 vẫn bắt kịp xung hướng Gradient nhưng c&aacute;ch l&agrave;m của Samsung v&ocirc; c&ugrave;ng tinh tế v&agrave; nhẹ nh&agrave;ng d&ugrave; l&agrave; chuyển m&agrave;u nhưng vẫn giữ t&ocirc;ng m&agrave;u ch&iacute;nh chủ đạo kh&ocirc;ng kề qu&aacute; rực, qu&aacute; chỏi nhau. Khung viền được đ&aacute;nh b&oacute;ng, c&ugrave;ng với mặt trước một m&agrave;u đen tạo cho viền c&oacute; cảm đ&atilde; mỏng lại c&agrave;ng mỏng hơn. Cụm ba camera sau đặt ngang hơi hướng của Note 8, kh&ocirc;ng c&ograve;n cảm biến v&acirc;n tay b&agrave;n chạm nữa n&ecirc;n mặt lưng trong gọn g&agrave;n c&acirc;n đối. Cạnh tr&ecirc;n l&agrave; khe sim + thẻ nhớ, dưới vẫn l&agrave; cổng 3.5mm + cổng sạc type-C + loa ngo&agrave;i, ph&iacute;m &acirc;m lượng + ph&iacute;m Bixby vẫn b&ecirc;n tr&aacute;i, b&ecirc;n phải l&agrave; ph&iacute;m nguồn.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 605px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/s10_-_m_t_sau.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/s10_-_m_t_sau.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Tuy được đ&aacute;nh gi&aacute; cao về thiết kế song Samsung Galaxy S10 vẫn vấp phải nhưng tranh c&atilde;i về mặt thiết kế. Về ph&iacute;m nguồn đặt qu&aacute; cao, g&acirc;y thay t&aacute;c cho những người c&oacute; b&agrave;n tay nhỏ kh&oacute; khăn hơn. Hay kịch liệt hơn ch&iacute;nh l&agrave; c&ocirc;ng nghệ Infinity - O, phần nhỏ người d&ugrave;ng kh&ocirc;ng chấp nhận với việc m&agrave;n h&igrave;nh bị 1 lỗ đen ngứa mắt, cản trở hiển thị, phần c&ograve;n lại th&igrave; chấp nhận v&igrave; giới hạn c&ocirc;ng nghệ cũng như thấy b&igrave;nh thường v&igrave; kh&ocirc;ng ản hưởng qu&aacute; nhiều đến khả năng sử dụng hay hiển thị. Rồi ngay cả c&ocirc;ng nghệ mới v&acirc;n tay si&ecirc;u &acirc;m cũng bị ch&ecirc; tr&aacute;ch l&agrave; qu&aacute; chậm, kh&ocirc;ng thể d&aacute;m m&agrave;n h&igrave;nh&hellip; Nhưng tất cả những điều tr&ecirc;n đều kh&ocirc;ng thể phủ nhận l&agrave; Samsung Galaxy S10 gần như tiệm cận đến sự ho&agrave;n hảo.</p>\r\n<h3><strong>Bộ vi xử l&yacute; mới ho&agrave;n to&agrave;n, dung lượng pin cao chưa từng c&oacute;</strong></h3>\r\n<p>Ở thị trường Việt Nam, Samsung trang bị con chip &ldquo;nh&agrave; l&agrave;m&rdquo; Exynos 9820 Octa-core, tiến tr&igrave;nh 8nm mới nhất, 3 cụm nh&acirc;n phối hợp với nhau gồm 2xCustomCPU(M4), 2xCortexA75 v&agrave; 4xCortexA55 cho ph&eacute;p xung nhịp tối đa l&ecirc;n đến 2.7Hz. Về GPU th&igrave; Galaxy S10 trang bị Mali G76MP12 tăng đến 40% so với GPU đang trang bị tr&ecirc;n S9. Hỗ trợ chuẩn RAM cao nhất 4x 16-bit CHLPDDR4x l&ecirc;n đến 12GB, Exynos 9820 hổ trợ USF3.0 nhanh gấp 2 lần chuẩn 2.1 (2.9GHz). B&ecirc;n cạnh đ&oacute; tr&ecirc;n Exynos 9820 c&ograve;n được trang bị 2 nh&acirc;n NPU ri&ecirc;ng biệt hổ trợ c&aacute;c t&iacute;nh năng AI t&iacute;ch hợp v&agrave; d&ugrave;ng AI để do lường ch&iacute;nh x&aacute;c c&oacute; tiến tr&igrave;nh tr&ecirc;n m&aacute;y ph&acirc;n bổ t&agrave;i nguy&ecirc;n m&aacute;y, c&ograve;n c&oacute; c&aacute;c khu vực d&agrave;nh ri&ecirc;ng cho bảo mật, xử l&iacute; h&igrave;nh ảnh&hellip; Theo l&iacute; thuyết th&igrave; năng lực xử l&yacute; của 9820 cao hơn 20% so với 9810 v&agrave; tiết kiệm pin hơn 40%.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 343px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s10-cau-hinh.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s10-cau-hinh.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Dung lượng pin cũng l&agrave; thứ được Samsung nhấn mạnh cho S10, với vi&ecirc;n pin 4100mAh lớn nhất trong c&aacute;c flagship Samsung hiện tại cho ph&eacute;p d&ugrave;ng trong cả ng&agrave;y d&agrave;i, thậm ch&iacute; sạc ngược cho thiết bị kh&aacute;c bằng t&iacute;nh năng Wireless Powershare mới. Đ&acirc;y cũng l&agrave; lần đầy ti&ecirc;n, Samsung n&acirc;ng tốc độ sạc sau vụ việc Note7, từ 18watt l&ecirc;n 25watt kh&aacute; d&egrave; dặt nhưng vẫn l&agrave;m ấm l&ograve;ng người sử dụng khi m&agrave; Samsung đ&atilde; ở qu&aacute; l&acirc;u với chuẩn Quick Charge 2.0.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 318px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Screenshot_5.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Screenshot_5.jpg\" /></p>\r\n<p>Với cấu h&igrave;nh mạnh mẻ hiện tại cũng dung lượng pin thoải m&aacute;i, Galaxy S10 hầu như c&oacute; thẻ g&aacute;nh mọi t&aacute;c vụ nặng nề nhất tr&ecirc;n Android b&acirc;y giờ như chỉnh sửa h&igrave;nh ảnh, l&agrave;m video, t&aacute;c vụ AR, chơi c&aacute;c game khủng nhất tr&ecirc;n CH Play m&agrave; kh&ocirc;ng lo lắng t&igrave;nh trạng chậm, giật lag&hellip;</p>\r\n<h3><strong>Gia nhập hội flagship ba camera sau &ldquo;chậm nhưng chắc&rdquo;</strong></h3>\r\n<p>Thiếu s&oacute;t nếu kh&ocirc;ng đề cập đến những n&acirc;ng cấp s&aacute;ng gi&aacute; tr&ecirc;n bộ 3 camera tr&ecirc;n Galaxy S10. Ngo&agrave;i ống k&iacute;nh ch&iacute;nh f1.5-2.4 c&oacute; Dualpixel v&agrave; lấy n&eacute;t theo pha, c&ugrave;ng ống tele 2x f2.4 th&igrave; t&ecirc;n S10 c&ograve;n c&oacute; th&ecirc;m 1 mắt si&ecirc;u rộng l&ecirc;n đến 123 độ f2.2 Điểm được Samsung nhấn mạnh nhất năm nay tr&ecirc;n bộ ba camera ch&iacute;nh l&agrave; chất lượng video khi m&agrave;n được trang bị th&ecirc;m t&iacute;nh năng Steady Shot khiến cho khả năng chống rung tuyệt vời hơn. B&ecirc;n cạnh đ&oacute; sau, c&oacute; v&agrave;i sự thay đổi ch&iacute;nh l&agrave; t&iacute;nh năng x&oacute;a ph&ocirc;ng đ&atilde; được Samsung chuyển từ cam tele về cam ch&iacute;nh. Vừa c&oacute; lợi cũng vừa c&oacute; hại, ảnh từ cam ch&iacute;nh cho ra m&agrave;u sắc chi tiết hay độ s&aacute;ng đều nhỉnh hơn cam tele, g&oacute;c cũng rộng hơn nhưng b&ugrave; lại khi muốn lấy được gần chủ thể phải zoom bằng ch&acirc;n, v&agrave; khả năng t&aacute;ch nền tạo bokeh đều bằng phần mềm n&ecirc;n sẽ c&oacute; đ&ocirc;i ch&uacute;t kh&aacute;c biệt.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 488px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Screenshot_4.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Screenshot_4.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Năm nay d&atilde;y nhạy s&aacute;ng cũng ch&iacute;nh l&agrave; một trong những sự cả tiến lớn. Khi m&agrave; cả cam trước lẫn cam sau đều phải gọi l&agrave; xuất sắc khi chụp c&aacute;c bức ngược s&aacute;ng, hay gần nguồn s&aacute;ng mạnh. N&oacute;i về camera trước, sự quay lại của lấy n&eacute;t tự động v&agrave; bổ sung th&ecirc;m g&oacute;c chụp rộng hơn l&agrave;m cho c&aacute;c t&ugrave;y chọn selfie phong ph&uacute; v&agrave; chuy&ecirc;n nghiệp hơn. M&agrave;u da v&agrave; c&aacute;c chi tiết đều được giữ lại nhiều hơn, do độ ph&acirc;n giải được n&acirc;ng l&ecirc;n từ 8MP l&ecirc;n 10MP.</p>\r\n<h3><strong>Giao diện mới OneUI hiện đại, hổ trợ tốt m&agrave;n h&igrave;nh d&agrave;i</strong></h3>\r\n<p>C&oacute; qu&aacute; nhiều b&agrave;i đ&aacute;nh gi&aacute; trải nghiệm OneUI kể từ khi S10 chưa xuất hiện, hầu như giao diện được trang bị tr&ecirc;n S10 sẽ kh&ocirc;ng kh&aacute;c qu&aacute; nhiều tr&ecirc;n S9 hay Note9 được cập nhật. OneUI được khen nức nở bởi t&iacute;nh tiện dụng c&ugrave;ng với những thay đổi th&acirc;n thiện hơn với người d&ugrave;ng, c&aacute;c t&iacute;nh năng như Darkmode hay điều khiển cử chỉ đều được trang bị ngo&agrave;i ra nhưng thay đổi nhỏ về c&aacute;ch sắp xếp hiện thị cũng ghi điểm c&ocirc;ng cho OneUI trong mắt người ti&ecirc;u d&ugrave;ng.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 566px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/s10_-_OneUI.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/s10_-_OneUI.jpg\" /></p>\r\n<p>Tuy nhi&ecirc;n v&agrave;i vấn đề tr&ecirc;n OneUI ch&iacute;nh l&agrave; bộ Icon mới trong hoạt h&igrave;nh v&agrave; k&eacute;m sang hẳn so với giao diện cũ. V&agrave; c&aacute;ch điều hướng cử chỉ tr&ecirc;n OneUI kh&aacute; l&agrave; ngu, chả mấy tuận tiện cho người d&ugrave;ng.</p>\r\n<h3><strong>C&aacute;c t&iacute;nh năng mới được trang bị tr&ecirc;n Galaxy S10</strong></h3>\r\n<p>Phải kể đến t&iacute;nh năng được Samsung nhấn kh&aacute; s&acirc;u v&agrave; mạnh tr&ecirc;n S10 ch&iacute;nh l&agrave; t&iacute;nh năng sạc ngược Wireless Powershare. Thực tế đ&acirc;y kh&ocirc;ng phải l&agrave; t&iacute;nh năng mới do Samsung nghĩ ra, nhưng trước đ&oacute; với Huawei chưa bao giờ biến t&iacute;nh năng n&agrave;y trở n&ecirc;n hữu &iacute;ch, bởi mang t&iacute;nh tr&igrave;nh diễn nhiều hơn l&agrave; tiện &iacute;ch. Tuy nhi&ecirc;n với hệ sinh th&aacute;i Galaxy, như tai nghe Galaxy Bubs hay đồng hồ Galaxy Watch, Samsung sẽ gi&uacute;p t&iacute;nh năng n&agrave;y c&oacute; nhiều đất diễn hơn.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 444px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Samsung-galaxy-s10-plus-chinh-hang-8.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Samsung-galaxy-s10-plus-chinh-hang-8.jpg\" /></p>\r\n<p>Một t&iacute;nh năng được xem l&agrave; điểm nhấn của S10 ch&iacute;nh l&agrave; cảm biến v&acirc;n tay si&ecirc;u &acirc;m 3D. đ&acirc;y cũng kh&ocirc;ng phải l&agrave; t&iacute;nh năng mới bởi n&oacute; đ&atilde; được Qualcomm nghi&ecirc;n cứu v&agrave; giới thiệu từ l&acirc;u, nhưng phải đến gần đ&acirc;y khi vị tr&iacute; của n&oacute; được đưa xuống dưới m&agrave;n h&igrave;nh th&igrave; mới được xem l&agrave; t&iacute;nh năng mới, v&agrave; Samsung l&agrave; nh&agrave; sản xuất đầu ti&ecirc;n d&ugrave;ng t&iacute;nh năng n&agrave;y. Cơ chế hoạt độ bằng s&oacute;ng &acirc;m vẻ bản đồ 3D v&acirc;n tay, ch&iacute;nh đến từng nm nếu so với c&ocirc;ng nghệ nhận diện Gương mặt th&igrave; đ&acirc;y ch&iacute;nh l&agrave; FaceID của Apple v&igrave; n&oacute; d&ugrave;ng h&igrave;nh ảnh 3D của sinh trắc học chứ kh&ocirc;ng pahir l&agrave; ảnh 2D th&ocirc;ng thường. T&iacute;nh năng tương lai n&agrave;y cho ph&eacute;p sử dụng cả khi ng&oacute;n tay bị d&iacute;nh nước, dầu, lotion&hellip; nhưng lại cự tuyệt d&aacute;n cường lực hay miếng d&aacute;n th&ocirc;ng thường. Trong tương lai Samsung sẽ chắc chắn cho ra mắt những miếng d&aacute;n hỗ trợ c&ocirc;ng nghệ n&agrave;y vừa d&ugrave;ng được v&acirc;n tay, vừa bảo vệ điện thoại khỏi trầy xướt.</p>', 1),
(37, 'H_P40_Pro', 'Huawei P40 Pro', 0, 23990000, 0, 109, 0, 1, 28, '637222023497659466_huawei-p40-pro-xanh-1.png', '<p><span style=\"color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">Tặng sim 4g viettel v120 v&agrave;&nbsp;</span><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold; color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">1 km</span><span style=\"color: #333333; font-family: sans-serif; font-size: 12px; text-transform: lowercase;\">&nbsp;kh&aacute;c</span></p>', '<h2 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 21px; text-align: justify;\"><a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Đi&ecirc;̣n thoại Huawei P40 Pro\" href=\"https://cellphones.com.vn/huawei-p40-pro.html\" target=\"_blank\" rel=\"noopener noreferrer\">Đi&ecirc;̣n thoại Huawei P40 Pro</a>&nbsp;- Smartphone cao c&acirc;́p với camera si&ecirc;u n&eacute;t</h2>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Thời gian g&acirc;̀n đ&acirc;y, g&atilde; kh&ocirc;̉ng l&ocirc;̀ n&ocirc;̉i ti&ecirc;́ng đ&ecirc;́n từ Trung Qu&ocirc;́c Huawei lu&ocirc;n \"khu&acirc;́y đảo\" thị trường&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại smartphone ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/mobile.html\" target=\"_blank\" rel=\"noopener noreferrer\">smartphone&nbsp;</a>với những thi&ecirc;́t bị flagship cao c&acirc;́p c&ugrave;ng c&acirc;́u h&igrave;nh &acirc;́n tượng. V&agrave; m&ocirc;̣t trong những chi&ecirc;́c flagship được h&atilde;ng cho ra mắt trong năm 2020 đ&oacute; l&agrave;&nbsp;</em><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Huawei P40 Pro</span>&nbsp;v&agrave;&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại Huawei P40 ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/huawei-p40.html\" target=\"_blank\" rel=\"noopener noreferrer\">Huawei P40</a>. Trong đ&oacute;, P40 Pro l&agrave; smartphone sở hữu m&agrave;n h&igrave;nh cong lớn, vi xử l&yacute; mạnh mẽ c&ugrave;ng camera c&oacute; đ&ocirc;̣ ph&acirc;n giải si&ecirc;u n&eacute;t.</em></p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\">Huawei P40 Pro c&oacute; thi&ecirc;́t k&ecirc;́ hi&ecirc;̣n đại với lớp phủ g&ocirc;́m bắt mắt, m&agrave;n h&igrave;nh t&acirc;̀n s&ocirc;́ 120Hz sắc n&eacute;t</h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Huawei<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;</em>P40 Pro</span>&nbsp;được xem l&agrave; flagship mới nh&acirc;́t của&nbsp;<a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" title=\"Điện thoại Huawei ch&iacute;nh h&atilde;ng\" href=\"https://cellphones.com.vn/mobile/huawei.html\" target=\"_blank\" rel=\"noopener noreferrer\">Huawei</a>&nbsp;trong năm 2020, do đ&oacute; chi&ecirc;́c smartphonen&agrave;y sẽ sở hữu vẻ ngo&agrave;i v&ocirc; c&ugrave;ng bắt mắt. M&aacute;y c&oacute; thi&ecirc;́t k&ecirc;́ vu&ocirc;ng vức, khung kim loại cứng c&aacute;p, mặt lưng được phủ m&ocirc;̣t lớp g&ocirc;́m l&agrave;m tăng th&ecirc;m n&eacute;t sang trọng cho m&ocirc;̣t flagship cao c&acirc;́p.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p40-pro-3_1.jpg\" alt=\"Thi&ecirc;́t k&ecirc;́ hi&ecirc;̣n đại với lớp phủ g&ocirc;́m bắt mắt\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">M&agrave;n h&igrave;nh của Huawei<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;</em>P40 Pro bao phủ g&acirc;̀n như to&agrave;n b&ocirc;̣ mặt trước của m&aacute;y, với k&iacute;ch thước rơi v&agrave;o khoảng 6.58 inch v&agrave; c&oacute; đ&ocirc;̣ ph&acirc;n giải Full HD+ tr&ecirc;n n&ecirc;̀n m&agrave;u OLED. Đặc bi&ecirc;̣t, m&agrave;n h&igrave;nh c&oacute; th&ecirc;̉ chạy với t&acirc;̀n s&ocirc;́ qu&eacute;t l&ecirc;n đ&ecirc;́n 90Hz, mang đ&ecirc;́n h&igrave;nh ảnh ch&acirc;n thực hơn v&agrave; r&otilde; n&eacute;t hơn.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\">Hệ thống 4 camera sau với đ&ocirc;̣ ph&acirc;n giải l&ecirc;n đ&ecirc;́n 50MP chụp ảnh đỉnh cao</h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">M&ocirc;̣t trong những đi&ecirc;̉m nh&acirc;́n tr&ecirc;n chi&ecirc;́c flagship&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Huawei P40 Pro</span>&nbsp;đ&oacute; l&agrave; cụm camera 4 &ocirc;́ng k&iacute;nh &acirc;́n tượng. &Ocirc;́ng k&iacute;nh ch&iacute;nh c&oacute; đ&ocirc;̣ ph&acirc;n giải lớn nh&acirc;́t - 50MP. Trong khi đ&oacute;, c&aacute;c &ocirc;́ng k&iacute;nh phụ sẽ bao g&ocirc;̀m: camera 40MP chụp ảnh g&oacute;c si&ecirc;u r&ocirc;̣ng, camera 12MP telephoto chụp ảnh x&oacute;a ph&ocirc;ng chuy&ecirc;n nghi&ecirc;̣p, camera cảm bi&ecirc;́n đ&ocirc;̣ s&acirc;u 3D. Cụm camera tr&ecirc;n&nbsp;Huawei P40 Pro h&ocirc;̃ trợ n&acirc;́y n&eacute;t tự đ&ocirc;̣ng c&ugrave;ng khả năng zoom kỹ thu&acirc;̣t s&ocirc;́ c&ugrave;ng quay video 4K.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p40-pro-1_1.jpg\" alt=\"Cụm camera 4 &ocirc;́ng k&iacute;nh Leica\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Camera selfie ph&iacute;a trước tr&ecirc;n&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">P40 Pro</span>&nbsp;của&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Huawei</span>&nbsp;sở hữu đ&ocirc;̣ ph&acirc;n giải 32MP c&ugrave;ng camera đo chi&ecirc;̀u s&acirc;u gi&uacute;p h&ocirc;̃ trợ mở kh&oacute;a gương mặt.&nbsp;Camera selfie cho khả năng chụp ảnh ch&acirc;n dung ch&acirc;́t lượng cao với m&agrave;u da tự nhi&ecirc;n, chi ti&ecirc;́t sắc n&eacute;t.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\">P40 Pro hiệu năng mạnh mẽ với chip Kirin 990 5G đi k&egrave;m b&ocirc;̣ nhớ RAM 8GB</h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">Huawei P40 Pro</span></em>&nbsp;được cho l&agrave; sẽ mang trong m&igrave;nh chip&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #333333;\"><a style=\"box-sizing: border-box; margin: 0px; padding: 0px; background-color: transparent; color: #d70018; text-decoration-line: none;\" href=\"https://consumer.huawei.com/vn/campaign/kirin-990-series/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: #333333;\">HiSilicon Kirin 990</span></a></span>&nbsp;với hi&ecirc;̣u năng mạnh mẽ, đ&aacute;p ứng ho&agrave;n hảo mọi nhu c&acirc;̀u c&ocirc;ng vi&ecirc;̣c hoặc gaming. Con chip n&agrave;y cũng c&oacute; khả năng v&acirc;̣n h&agrave;nh sim mạng 5G hi&ecirc;̣n đại. B&ocirc;̣ nhớ RAM của phi&ecirc;n bản \"Pro\" sẽ l&agrave; 8GB, m&ocirc;̣t mức RAM ho&agrave;n to&agrave;n ph&ugrave; hợp gi&uacute;p chi&ecirc;́c m&aacute;y chạy mượt m&agrave; những ứng dụng nặng v&agrave; thực hi&ecirc;̣n đa nhi&ecirc;̣m.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p40-pro-2_1.jpg\" alt=\"V&acirc;̣n h&agrave;nh mạnh mẽ với chip Kirin 990 5G &amp; b&ocirc;̣ nhớ trong 8GB RAM\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">H&ecirc;̣ đi&ecirc;̀u h&agrave;nh của P40 Pro sẽ mặc định l&agrave; Android 10 v&agrave; c&oacute; h&ecirc;̣ sinh th&aacute;i EMUI 10. Với thi&ecirc;́t k&ecirc;́ t&ocirc;́i giản c&ugrave;ng khả năng t&ugrave;y bi&ecirc;́n v&agrave; cho ph&eacute;p người d&ugrave;ng sử dụng đa m&agrave;n h&igrave;nh c&ugrave;ng l&uacute;c, EMUI 10 hứa hẹn sẽ n&acirc;ng c&acirc;́p trải nghi&ecirc;̣m sử dụng tr&ecirc;n m&ocirc;̣t chi&ecirc;́c smartphone ph&acirc;n kh&uacute;c cao c&acirc;́p.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\">Pin 42000 t&iacute;ch hợp sạc kh&ocirc;ng d&acirc;y, sạc nhanh 40W k&egrave;m khả năng ch&ocirc;́ng nước ti&ecirc;n ti&ecirc;́n nh&acirc;́t</h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Huawei P40 Pro</em>&nbsp;được trang bị vi&ecirc;n pin dung lượng 4200 mAh, h&ocirc;̃ trợ sạc nhanh&nbsp;<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">HUAWEI SuperCharge 40W. B&ecirc;n cạnh đ&oacute;, m&aacute;y cũng được trang bị c&ocirc;ng ngh&ecirc;̣ sạc kh&ocirc;ng d&acirc;y với t&ocirc;́c đ&ocirc;̣ t&ocirc;́i đa 27W.&nbsp;&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\"><img style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: top;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p40-pro-5.jpg\" alt=\"T&iacute;ch hợp sạc kh&ocirc;ng d&acirc;y k&egrave;m khả năng ch&ocirc;́ng nước ti&ecirc;n ti&ecirc;́n nh&acirc;́t\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Kh&ocirc;ng chỉ cao c&acirc;́p v&agrave; hi&ecirc;̣n đại, Huawei P40 Pro c&ograve;n c&oacute; đ&ocirc;̣ b&ecirc;̀n bỉ t&ocirc;́t nhờ v&agrave;o khả năng ch&ocirc;́ng nước/bụi chu&acirc;̉n IP68. Đ&acirc;y l&agrave; ti&ecirc;u chu&acirc;̉n kh&aacute;ng nước ch&acirc;́t lượng cao được &aacute;p dụng l&ecirc;n g&acirc;̀n như t&acirc;́t cả smartphone cao c&acirc;́p. Do đ&oacute; c&oacute; th&ecirc;̉ khẳng định chi&ecirc;́c flagship mới nh&acirc;́t của Huawei sẽ lu&ocirc;n lu&ocirc;n an to&agrave;n &amp; b&ecirc;̀n l&acirc;u.</p>\r\n<h3 style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; font-family: sans-serif; line-height: 1.35; color: #0a263c; font-size: 16px; text-align: justify;\">Mua Huawei P40 Pro ch&iacute;nh h&atilde;ng với nhi&ecirc;̀u qu&agrave; tặng h&acirc;́p d&acirc;̃n tại CellphoneS</h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">P40 Pro sẽ l&agrave; m&ocirc;̣t trong những \"si&ecirc;u ph&acirc;̉m\" được t&acirc;̣p đo&agrave;n c&ocirc;ng ngh&ecirc;̣ Trung Qu&ocirc;́c Huawei. Sản ph&acirc;̉m được cho l&agrave; sẽ khi&ecirc;́n c&aacute;c t&iacute;n đ&ocirc;̀ c&ocirc;ng ngh&ecirc;̣ \"đứng ng&ocirc;̀i kh&ocirc;ng y&ecirc;n\" v&agrave; sẽ g&acirc;y sự ch&uacute; &yacute; đ&ecirc;́n thị trường smartphone trong năm 2020. Ch&iacute;nh v&igrave; th&ecirc;́, mua ngay điện thoại<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: bold;\">&nbsp;Huawei P40 Pro ch&iacute;nh h&atilde;ng</span>&nbsp;đ&ecirc;̉ c&oacute; cơ h&ocirc;̣i nh&acirc;̣n được nhi&ecirc;̀u khuy&ecirc;́n m&atilde;i h&acirc;́p d&acirc;̃n tại h&ecirc;̣ th&ocirc;́ng CellphoneS.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; font-size: 15px; line-height: 1.5; color: #3c3d41; font-family: sans-serif; text-align: justify;\">Bạn c&oacute; th&ecirc;̉ đ&ecirc;́n trực ti&ecirc;́p cửa h&agrave;ng CellphoneS g&acirc;̀n nh&acirc;́t tại H&agrave; N&ocirc;̣i v&agrave; TP. H&ocirc;̀ Ch&iacute; Minh đ&ecirc;̉ được trải nghi&ecirc;̣m t&acirc;̣n tay c&aacute;c sản ph&acirc;̉m c&ocirc;ng ngh&ecirc;̣ mới nh&acirc;́t. Ngo&agrave;i ra, bạn cũng c&oacute; th&ecirc;̉ truy c&acirc;̣p v&agrave;o website CellphoneS.com.vn hoặc li&ecirc;n h&ecirc;̣ t&ocirc;̉ng đ&agrave;i 1800.2097 đ&ecirc;̉ được tư v&acirc;́n, h&ocirc;̃ trợ. H&atilde;y nhanh tay đặt trước sản ph&acirc;̉m Huawei P40 Pro đ&ecirc;̉ nh&acirc;̣n được nhi&ecirc;̀u ưu đ&atilde;i li&ecirc;̀n tay từ CellphoneS.</p>', 1),
(38, 'B2_Xiaomi', 'Loa Bluetooth Xiaomi Mi Basic 2 Chính hãng', 0, 600000, 10, 97, 0, 4, 24, '6c6044d233d6a8373c7f214ae4900462.jpg', '<p>Loa Bluetooth Xiaomi Mi Basic 2 rất tinh tế, thuận tiện cho di động</p>', '<h2>Đặc điểm loa Bluetooth Xiaomi Mi Basic 2 Ch&iacute;nh h&atilde;ng</h2>\r\n<p>Như truyền thống của thương hiệu,&nbsp;<strong>loa Bluetooth Xiaomi Mi Basic 2</strong>&nbsp;được b&aacute;n với mức gi&aacute; hấp dẫn m&agrave; chất lượng kh&ocirc;ng hề thua k&eacute;m nhiều sản phẩm gi&aacute; c&oacute; gi&aacute; cao hơn.&nbsp;<a href=\"https://cellphones.com.vn/thiet-bi-am-thanh/loa/xiaomi.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/thiet-bi-am-thanh/loa/xiaomi.html\">Loa Xiaomi</a>&nbsp;l&agrave; sự lựa chọn l&yacute; tưởng với những người d&ugrave;ng muốn &ldquo;đổi gi&oacute;&rdquo; khi nghe nhạc d&ugrave; điều kiện t&agrave;i ch&iacute;nh hạn chế.</p>\r\n<p><strong>Loa Xiaomi Mi Basic 2</strong>&nbsp;c&oacute; k&iacute;ch thước vừa phải v&agrave; trọng lượng nhẹ, thuận tiện để người d&ugrave;ng mang theo tr&ecirc;n tay hay bỏ v&agrave;o ba l&ocirc;, t&uacute;i x&aacute;ch. B&ecirc;n cạnh đ&oacute;, loa sở hữu phần khung nh&ocirc;m v&agrave; c&aacute;c cạnh v&aacute;t được ho&agrave;n thiện tinh tế, tất cả pha trộn lại với nhau một c&aacute;ch ho&agrave;n hảo tạo n&ecirc;n vẻ đẹp đầy phong c&aacute;ch cho sản phẩm.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 570px; width: 840px;\" src=\"../../DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-4.jpg\" alt=\"\" data-cke-saved-src=\"/DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-4.jpg\" /></p>\r\n<p><strong>Loa Xiaomi Mi Basic 2</strong>&nbsp;c&oacute; k&iacute;ch thước vừa phải v&agrave; trọng lượng nhẹ, thuận tiện để người d&ugrave;ng mang theo tr&ecirc;n tay hay bỏ v&agrave;o ba l&ocirc;, t&uacute;i x&aacute;ch. B&ecirc;n cạnh đ&oacute;, loa sở hữu phần khung nh&ocirc;m v&agrave; c&aacute;c cạnh v&aacute;t được ho&agrave;n thiện tinh tế, tất cả pha trộn lại với nhau một c&aacute;ch ho&agrave;n hảo tạo n&ecirc;n vẻ đẹp đầy phong c&aacute;ch cho sản phẩm.</p>\r\n<p><img style=\"height: 481px; width: 840px;\" src=\"../../DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-2.jpg\" alt=\"\" data-cke-saved-src=\"/DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-2.jpg\" /></p>\r\n<h3>Loa Bluetooth Xiaomi Mi Basic 2 t&iacute;ch hợp micro</h3>\r\n<p>Với micro t&iacute;ch hợp,&nbsp;<strong><a href=\"https://cellphones.com.vn/loa-bluetooth-xiaomi-mi-basic-2-chinh-hang.html\" target=\"_self\" data-cke-saved-href=\"https://cellphones.com.vn/loa-bluetooth-xiaomi-mi-basic-2-chinh-hang.html\">loa Xiaomi Mi Basic 2 ch&iacute;nh h&atilde;ng</a></strong>&nbsp;gi&uacute;p người d&ugrave;ng dễ d&agrave;ng trả lời cuộc gọi đến m&agrave; kh&ocirc;ng cần d&ugrave;ng điện thoại. Thay v&agrave;o đ&oacute;, bạn chỉ cần nhấn ph&iacute;m nguồn tr&ecirc;n loa, giữ đ&ocirc;i tay rảnh rang để l&agrave;m nhiều việc kh&aacute;c trong l&uacute;c tr&ograve; chuyện như xem tin tức, lau ch&ugrave;i b&agrave;n ghế...</p>\r\n<p><img style=\"height: 493px; width: 840px;\" src=\"../../DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-3.jpg\" alt=\"\" data-cke-saved-src=\"/DO-AN-TN-2019/public/upload/images/Loa-Bluetooth-Xiaomi-Mi-Basic-2-Chinh-hang-3.jpg\" /></p>\r\n<h3>Thời lượng pin loa Bluetooth Xiaomi Mi Basic 2 rất ấn tượng</h3>\r\n<p>Với vi&ecirc;n pin lithium polymer cho 10 giờ ph&aacute;t nhạc li&ecirc;n tục,&nbsp;<strong>loa di động Xiaomi Mi Basic 2</strong>&nbsp;cung cấp thời lượng pin tuyệt vời để người d&ugrave;ng thoải m&aacute;i nghe nhạc giải tr&iacute; c&aacute; nh&acirc;n hoặc tổ chức những cuộc vui chơi c&ugrave;ng người th&acirc;n v&agrave; bạn b&egrave; trong cả ng&agrave;y m&agrave; kh&ocirc;ng phải lo lắng về việc sạc pin.</p>', 1);
INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(39, 'L_M185', 'Chuột không dây Logitech M185', 0, 250000, 0, 125, 0, 4, 13, '3f83d23fdc12378fc61ac5c0e55c2476.png', '<p>Chuột kh&ocirc;ng d&acirc;y Logitech M185, Ch&iacute;nh h&atilde;ng</p>', '<div id=\"tab2\" style=\"box-sizing: border-box; color: #222222; font-family: arial, verdana, sans-serif;\">\r\n<h2 class=\"h-title\" style=\"box-sizing: border-box; margin: 20px 0px 11px; padding: 0px 0px 6px; font-size: 17px; border-bottom: 1px solid #dddddd; text-transform: uppercase;\">&nbsp;</h2>\r\n<div class=\"nd\" style=\"box-sizing: border-box; line-height: 1.5; text-align: justify; overflow-wrap: break-word; max-width: 965px; margin: 0px auto; width: 945px; height: auto; overflow: hidden;\">\r\n<h2 style=\"box-sizing: border-box;\">Chu&ocirc;̣t kh&ocirc;ng d&acirc;y Logitech Quang M185 (Đen viền x&aacute;m)</h2>\r\n<p style=\"box-sizing: border-box;\">Chu&ocirc;̣t kh&ocirc;ng d&acirc;y Logitech Quang M185 nằm trong ph&acirc;n kh&uacute;c chuột gi&aacute; rẻ nhưng đ&aacute;p ứng được tốt nhu cầu của người d&ugrave;ng. Với thiết kế trẻ trung, trang nh&atilde;, độ nhạy cao, sản phẩm n&agrave;y chắc chắn sẽ kh&ocirc;ng l&agrave;m bạn thất vọng trong ph&acirc;n kh&uacute;c chuột gi&aacute; rẻ khoảng 200.000đ.&nbsp;</p>\r\n<p style=\"box-sizing: border-box;\"><img style=\"box-sizing: border-box; border: none; max-width: 100%; height: auto; display: block; margin-left: auto; margin-right: auto;\" src=\"https://phucanhcdn.com/media/product/8792_chu____t_kh__ng_d__y_logitech_quang_m185____en_vi___n_x__m__1_4.jpg\" alt=\"Chu&ocirc;̣t kh&ocirc;ng d&acirc;y Logitech Quang M185 (Đen viền x&aacute;m)\" width=\"500\" /></p>\r\n<h3 style=\"box-sizing: border-box;\">Plug-and-play đơn giản</h3>\r\n<p style=\"box-sizing: border-box;\">Chuột kh&ocirc;ng d&acirc;y&nbsp;<span style=\"box-sizing: border-box; color: #3366ff;\"><a style=\"box-sizing: border-box; color: #3366ff; text-decoration-line: none;\" title=\"Logitech\" href=\"https://www.phucanh.vn/chuot-mouse.html?brand=108\">Logitech</a></span>&nbsp;M185 với đầu thu Nano nhỏ gọn, bạn c&oacute; thể k&iacute;ch hoạt v&agrave; sử dụng chuột một c&aacute;ch nhanh ch&oacute;ng m&agrave; kh&ocirc;ng cần c&agrave;i đặt phức tạp.</p>\r\n<h3 style=\"box-sizing: border-box;\">Khả năng tương th&iacute;ch hiệu quả</h3>\r\n<p style=\"box-sizing: border-box;\">Với khả năng tương th&iacute;ch nhiều hệ điều h&agrave;nh như Windows Vista&reg;, Windows&reg; 7, Windows 8, Windows 10, Mac&reg;, Chrome OS &trade; v&agrave; Linux&reg;, Logitech M185 gi&uacute;p bạn dễ d&agrave;ng v&agrave; thuận tiện hơn với việc sử dụng c&aacute;c loại m&aacute;y t&iacute;nh x&aacute;ch tay hiện nay.</p>\r\n<h3 style=\"box-sizing: border-box;\">Thiết kế nhỏ gọn, tiện dụng</h3>\r\n<p style=\"box-sizing: border-box;\">Logitech M185 c&oacute; k&iacute;ch thước nhỏ gọn, vừa với tay cầm tạo cảm gi&aacute;c thoải m&aacute;i cho người d&ugrave;ng khi l&agrave;m việc. C&ugrave;ng với kiểu d&aacute;ng đơn giản, nhiều m&agrave;u sắc kh&aacute;c nhau cho bạn c&oacute; th&ecirc;m nhiều sự chọn lựa ph&ugrave; hợp với sở th&iacute;ch v&agrave; đối tượng sử dụng.</p>\r\n<h3 style=\"box-sizing: border-box;\">Tuổi thọ pin l&ecirc;n đến 1 năm</h3>\r\n<p style=\"box-sizing: border-box;\">Bạn c&oacute; thể d&ugrave;ng chuột l&ecirc;n đến 1 năm m&agrave; kh&ocirc;ng phải thay pin. N&uacute;t On/Off gi&uacute;p bạn đưa chuột về chế độ nghỉ v&agrave; chức năng tự nghỉ th&ocirc;ng minh gi&uacute;p tiết kiệm năng lượng.</p>\r\n<p style=\"box-sizing: border-box;\"><img style=\"box-sizing: border-box; border: none; max-width: 100%; height: auto; display: block; margin-left: auto; margin-right: auto;\" src=\"https://phucanhcdn.com/media/product/8792_chu____t_kh__ng_d__y_logitech_quang_m185____en_vi___n_x__m__1_3.jpg\" alt=\"\" width=\"500\" /></p>\r\n<h3 style=\"box-sizing: border-box;\">C&ocirc;ng nghệ cảm biến quang học</h3>\r\n<p style=\"box-sizing: border-box;\">C&ocirc;ng nghệ cảm biến quang học gi&uacute;p cho thiết bị di chuyển dễ d&agrave;ng hơn, truyền tải dữ liệu nhanh ch&oacute;ng, kh&ocirc;ng c&oacute; cảm gi&aacute;c bị trễ - chậm hay mất t&iacute;n hiệu khi đang l&agrave;m việc.</p>\r\n<p style=\"box-sizing: border-box;\">Một số c&aacute;ch k&eacute;o d&agrave;i tuổi thọ pin cho chuột kh&ocirc;ng d&acirc;y</p>\r\n<p style=\"box-sizing: border-box;\">- On/ Off nguồn mỗi khi kh&ocirc;ng sử dụng l&acirc;u hoặc hết giờ l&agrave;m việc.</p>\r\n<p style=\"box-sizing: border-box;\">- H&atilde;y đảm bảo phần USB nhận t&iacute;n hiệu (Receiver) gần chuột nhất c&oacute; thể.</p>\r\n<p style=\"box-sizing: border-box;\">- Tr&aacute;nh sử dụng b&agrave;n chuột m&agrave;u tối hoặc đục mờ. Mắt cảm ứng l&agrave; phần ti&ecirc;u hao năng lượng nhiều nhất của chuột, n&oacute; tốn nhiều năng lượng hơn tr&ecirc;n bề mặt tối, đục hay gồ ghề.</p>\r\n<p style=\"box-sizing: border-box;\">- H&atilde;y d&ugrave;ng b&agrave;n chuột m&agrave;u s&aacute;ng v&agrave; mượt để tối ưu việc sử dụng năng lượng</p>\r\n<p style=\"box-sizing: border-box;\">- Sử dụng pin c&ugrave;ng dung lượng v&agrave; c&ugrave;ng h&atilde;ng để tăng hiệu suất của pin.</p>\r\n</div>\r\n<div class=\"clear\" style=\"box-sizing: border-box; clear: both;\">&nbsp;</div>\r\n</div>\r\n<div id=\"tab1\" style=\"box-sizing: border-box; color: #222222; font-family: arial, verdana, sans-serif;\">\r\n<h2 class=\"h-title\" style=\"box-sizing: border-box; margin: 20px 0px 11px; padding: 0px 0px 6px; font-size: 17px; border-bottom: 1px solid #dddddd; text-transform: uppercase;\">TH&Ocirc;NG SỐ KỸ THUẬT</h2>\r\n<div class=\"tbl-technical nd\" style=\"box-sizing: border-box; line-height: 1.5; text-align: justify; overflow-wrap: break-word; max-width: 965px; margin: 0px auto; width: 945px; height: auto; overflow: hidden;\">\r\n<table style=\"border-collapse: collapse; width: 944.8px; max-width: 100%;\" width=\"692\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\" width=\"177\">Sản phẩm</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\" width=\"515\">Chu&ocirc;̣t kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">H&atilde;ng sản xuất</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Logitech</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Model</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">M185</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Ki&ecirc;̉u k&ecirc;́t n&ocirc;́i</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Chu&acirc;̉n giao ti&ecirc;́p</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">USB-Wireless</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Ph&iacute;m chức năng</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Standard</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">M&agrave;u</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Đen viền x&aacute;m</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Đặc đi&ecirc;̉m kh&aacute;c</td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dddddd; padding: 0px; max-width: 300px;\">Chuột quang kh&ocirc;ng d&acirc;y, 1000dpi, giao tiếp USB, nhỏ gọn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div id=\"tab3\" style=\"box-sizing: border-box; color: #222222; font-family: arial, verdana, sans-serif;\">\r\n<h4 class=\"h-title\" style=\"box-sizing: border-box; margin: 20px 0px 11px; padding: 0px 0px 6px; font-size: 17px; border-bottom: 1px solid #dddddd; text-transform: uppercase;\">VIDEO</h4>\r\n<div style=\"box-sizing: border-box; text-align: center;\"><iframe style=\"box-sizing: border-box;\" src=\"https://www.youtube.com/embed/GTITnrCAiyc\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div>\r\n</div>', 1),
(40, 'Ip_Xs_gold', 'iPhone Xs Max 64GB  Rose gold', 0, 28900000, 0, 120, 0, 1, 3, '272c385eb253dd599607d99fdf3240cd.jpg', '<p>iPhone Xs Max 64GB Rose gold (V&agrave;ng hồng) l&agrave; chiếc iPhone c&oacute; m&agrave;n h&igrave;nh lớn nhất từ trước đến nay, mang đến những trải nghiệm tuyệt vời về m&agrave;n h&igrave;nh v&agrave; thời lượng pin.</p>', '<h2><strong>M&agrave;n h&igrave;nh lớn 6,5 inch chuẩn Super Retina si&ecirc;u sắc n&eacute;t</strong></h2>\r\n<p><strong>iPhone Xs Max 64GB</strong>&nbsp;c&oacute; m&agrave;n h&igrave;nh vượt trội so với mọi thế hệ iPhone trước đ&acirc;y khi lớn tới 6,5 inch, được l&agrave;m từ tấm nền OLED, hỗ trợ hiển thị HDR. HDR mang đến m&agrave;u sắc ch&iacute;nh x&aacute;c, m&agrave;u đen c&oacute; chiều s&acirc;u, độ s&aacute;ng v&agrave; độ tương phản tuyệt vời. Bạn sẽ được tận hưởng một m&agrave;n h&igrave;nh cực lớn, độ ph&acirc;n giải si&ecirc;u cao 2688 x 1242 pixels cho trải nghiệm xem đ&aacute;ng kinh ngạc.</p>\r\n<p><img style=\"height: 455px; width: 907px;\" src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iPhone-xs-max-3.jpg\" alt=\"\" data-cke-saved-src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iPhone-xs-max-3.jpg\" /></p>\r\n<p>Nếu như bạn lo lắng m&agrave;n h&igrave;nh lớn sẽ khiến cho&nbsp;<strong>iPhone Xs Max 64GB&nbsp;</strong>kh&oacute; cầm nắm tr&ecirc;n tay th&igrave; h&atilde;y qu&ecirc;n ngay nỗi lo đ&oacute;, v&igrave; viền m&agrave;n h&igrave;nh tr&agrave;n 4 cạnh gi&uacute;p cho iPhone Xs Max thậm ch&iacute; c&ograve;n nhỏ gọn hơn iPhone 8 Plus. Ch&uacute;ng ta c&oacute; một chiếc m&aacute;y m&agrave;n h&igrave;nh lớn hơn rất nhiều, nhưng vẫn đủ gọn g&agrave;ng để dễ d&agrave;ng cầm nắm v&agrave; thao t&aacute;c.</p>\r\n<p><img style=\"height: 654px; width: 981px;\" src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iPhone-xs-max-2.JPG\" alt=\"\" data-cke-saved-src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iPhone-xs-max-2.JPG\" /></p>\r\n<h2><strong>Sự kết hợp giữa k&iacute;nh v&agrave; th&eacute;p, sang trọng nhưng kh&ocirc;ng k&eacute;m phần bền vững</strong></h2>\r\n<p><strong>iPhone Xs Max 64GB</strong>&nbsp;được ho&agrave;n thiện từ những vật liệu đặc biệt, đ&oacute; l&agrave; viền th&eacute;p kh&ocirc;ng gỉ s&aacute;ng b&oacute;ng v&agrave; mặt k&iacute;nh bền nhất trong thế giới smartphone. Kỹ thuật gia c&ocirc;ng ch&iacute;nh x&aacute;c ho&agrave;n hảo của Apple mang đến chiếc điện thoại cứng c&aacute;p, thời trang, vừa vặn trong l&ograve;ng b&agrave;n tay bạn. Ba m&agrave;u sắc thời thượng X&aacute;m kh&ocirc;ng gian, Bạc v&agrave; V&agrave;ng cho những lựa chọn c&aacute; t&iacute;nh. Đặc biệt, hai phi&ecirc;n bản m&agrave;u V&agrave;ng v&agrave; X&aacute;m được sơn bằng qu&aacute; tr&igrave;nh xử l&yacute; m&agrave;u PVD, tạo hiệu ứng &aacute;nh s&aacute;ng qua lớp k&iacute;nh rất đẹp mắt.</p>\r\n<p><img style=\"height: 700px; width: 1050px;\" src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xs-3.jpg\" alt=\"\" data-cke-saved-src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xs-3.jpg\" /></p>\r\n<h2><strong>Face ID thế hệ mới, mật khẩu ch&iacute;nh l&agrave; khu&ocirc;n mặt của bạn</strong></h2>\r\n<p>Face ID tr&ecirc;n&nbsp;<strong>iPhone Xs Max 64GB</strong>&nbsp;khiến cho việc bảo mật đơn giản v&agrave; an to&agrave;n hơn. Bạn c&oacute; thể mở kh&oacute;a, đăng nhập, thanh to&aacute;n nhanh ch&oacute;ng th&ocirc;ng qua nhận diện khu&ocirc;n mặt. Ngay khi đưa m&aacute;y l&ecirc;n, hệ thống camera TrueDepth sẽ nhận diện tới 30.000 điểm tr&ecirc;n khu&ocirc;n mặt của bạn v&agrave; mở kh&oacute;a ngay lập tức. Đồng thời, hệ thống n&agrave;y cũng sẽ ghi nhớ v&agrave; học hỏi th&oacute;i quen của bạn để sau n&agrave;y d&ugrave; c&oacute; đội mũ hay đeo k&iacute;nh th&igrave; Face ID vẫn nhận diện nhanh ch&oacute;ng đầy ch&iacute;nh x&aacute;c. Face ID của iPhone Xs Max ch&iacute;nh l&agrave; phương thức bảo mật an to&agrave;n nhất tr&ecirc;n smartphone từ trước đến nay.</p>\r\n<p><img style=\"height: 812px; width: 1217px;\" src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xs-4.jpg\" alt=\"\" data-cke-saved-src=\"https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xs-4.jpg\" /></p>', 1),
(41, 'R_BagV2', 'Razer Keyboard Bag V2', 0, 840000, 5, 113, 0, 4, 20, 'razer-keyboard-bag.png', '<h1 class=\"title pdTitle\" style=\"box-sizing: border-box; margin: 0px; font-family: Quicksand, sans-serif; font-weight: normal; line-height: 1.3; font-size: 1.5em; border: 0px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both;\">T&uacute;i Đựng Gear Razer Keyboard Bag V2</h1>', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; border: 0px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 24px; color: #333333; font-family: Quicksand, sans-serif;\"><span style=\"font-size: 15pt;\">T&uacute;i Đựng Ph&iacute;m Razer Keyboard Bag V2</span></p>\r\n<p style=\"text-align: center;\"><img style=\"box-sizing: border-box; border: none; vertical-align: middle; max-width: 100%; height: auto;\" src=\"//file.hstatic.net/1000129940/file/t_i-d_ng-gear-razer-keyboard-bag-v2-2_grande.jpg\" /></p>\r\n<div class=\"row bordered shown\" style=\"box-sizing: border-box; border: 0px; margin: 0px -15px; outline: 0px; padding: 0px; vertical-align: baseline; color: #333333; font-family: Quicksand, sans-serif;\">\r\n<div class=\"col-sm-9\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px 15px; vertical-align: baseline; position: relative; min-height: 1px; float: left; width: 928.5px;\">\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">Chất liệu ngoại thất bền</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">Mở kh&oacute;a k&eacute;o ho&agrave;n to&agrave;n</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">Thiết kế nội thất đệm</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">Được thiết kế để ph&ugrave; hợp với hầu hết c&aacute;c b&agrave;n ph&iacute;m</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">D&acirc;y đeo vai đệm với bảng điều khiển trở lại lưới kh&ocirc;ng kh&iacute;</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"row bordered shown\" style=\"box-sizing: border-box; border: 0px; margin: 0px -15px; outline: 0px; padding: 0px; vertical-align: baseline; color: #333333; font-family: Quicksand, sans-serif;\">\r\n<div class=\"col-sm-3\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px 15px; vertical-align: baseline; position: relative; min-height: 1px; float: left; width: 309.5px;\">\r\n<h3 class=\"text-24 text-thin text-white\" style=\"box-sizing: border-box; font-family: inherit; font-weight: 500; line-height: 1.1; color: #000000; margin: 0px; font-size: 18px; border: 0px; outline: 0px; padding: 0px; vertical-align: baseline; clear: both;\"><span style=\"font-size: 15pt;\">Th&ocirc;ng số kỹ thuật</span></h3>\r\n</div>\r\n<div class=\"col-sm-9\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px 15px; vertical-align: baseline; position: relative; min-height: 1px; float: left; width: 928.5px;\">\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"font-size: 15pt;\">50,5cm LX 22,5cm WX 6cm H</span></li>\r\n</ul>\r\n</div>\r\n</div>', 1),
(42, 'SS_S8+', 'Samsung Galaxy S8+ Chính hãng', 0, 17900000, 20, 120, 0, 1, 35, 'cadd73e4617f599e52932e90a8f94976.jpg', '<p>Thiết kế Samsung Galaxy S8 Plus: vẻ đẹp độc đ&aacute;o từ m&agrave;n h&igrave;nh &ldquo;kh&ocirc;ng viền&rdquo;</p>', '<h2>Samsung Galaxy S8 Plus ch&iacute;nh h&atilde;ng</h2>\r\n<p>Sau th&agrave;nh c&ocirc;ng vang dội của bộ đ&ocirc;i&nbsp;<a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s/galaxy-s7-s7-edge.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s/galaxy-s7-s7-edge.html\">Galaxy S7, Galaxy S7 Edge</a>, Samsung tiếp tục mang đến cho thị trường nhiều bất ngờ với cặp&nbsp;<a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s8.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s8.html\">Galaxy S8/S8 Plus</a>&nbsp;sở hữu thiết kế độc đ&aacute;o v&agrave; nhiều t&iacute;nh năng mới th&uacute; vị. Trong đ&oacute;, Galaxy S8 Plus được dự b&aacute;o sẽ l&agrave; đối thủ xứng tầm của d&ograve;ng iPhone Plus.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 458px; width: 640px;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-1.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Vẫn l&agrave; thiết kế nguy&ecirc;n khối với bộ khung nh&ocirc;m v&agrave; hai mặt trước sau ốp k&iacute;nh cường lực b&oacute;ng bảy, nhưng Galaxy S8 Plus đ&atilde; được n&acirc;ng l&ecirc;n một tầm cao mới khi phần viền được l&agrave;m cực mỏng, tr&agrave;n ra s&aacute;t c&aacute;c m&eacute;p cạnh, tạo n&ecirc;n m&agrave;n h&igrave;nh m&agrave; Samsung gọi l&agrave; &ldquo;v&ocirc; cực&rdquo;, tạo n&ecirc;n một vẻ đẹp vừa độc đ&aacute;p vừa quyến rũ.</p>\r\n<p>&nbsp;</p>\r\n<h3>M&agrave;n h&igrave;nh Samsung Galaxy S8 Plus: hai cạnh cong, hiển thị sắc n&eacute;t đến từng chi tiết</h3>\r\n<p>Hai cạnh b&ecirc;n của Galaxy S8 Plus được l&agrave;m cong 3D v&agrave; vẫn được t&iacute;ch hợp thanh c&ocirc;ng cụ gi&uacute;p người d&ugrave;ng truy cập nhanh c&aacute;c ứng dụng rất tiện lợi.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 427px; width: 640px;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-2.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-2.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Về m&agrave;n h&igrave;nh, Samsung trang bị độ ph&acirc;n giải 1440 x 2960 theo tỷ lệ mới (18.5:9) nhằm tối ưu h&oacute;a đa nhiệm, kết hợp c&ugrave;ng k&iacute;ch thước lớn, l&ecirc;n đến 6.2 inch mang lại cho người d&ugrave;ng trải nghiệm ấn tượng khi xem phim v&agrave; chơi game giải tr&iacute;.</p>\r\n<p>&nbsp;</p>\r\n<h3>Hiệu năng Samsung Galaxy S8 Plus: mạnh mẽ đến kinh ngạc</h3>\r\n<p>Samsung Galaxy S8 Plus C&ocirc;ng ty được trang bị vi xử l&yacute; Exynos 8895 t&aacute;m nh&acirc;n sản xuất tr&ecirc;n tiến tr&igrave;nh 10nm hiện đại cho hiệu năng cực kỳ đ&aacute;ng nể. N&oacute; đạt kết quả benchmark vượt trội hơn tất cả những smartphone c&oacute; mặt tr&ecirc;n thị trường v&agrave;o thời điểm ra mắt, kể cả iPhone 7 Plus.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 360px; width: 640px;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-3.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-3.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<h3>Nhiều t&iacute;nh năng hữu &iacute;ch trang bị tr&ecirc;n Samsung Galaxy S8 Plus</h3>\r\n<p>&nbsp;</p>\r\n<p>Với Galaxy S8 Plus, người d&ugrave;ng tự tin nghe điện thoại dưới trời mưa v&igrave; m&aacute;y được t&iacute;ch hợp ti&ecirc;u chuẩn chống nước IP68 (ng&acirc;m được trong nước ở độ s&acirc;u 1,5m trong v&ograve;ng 30 ph&uacute;t).</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, Galaxy S8 Plus hỗ trợ người d&ugrave;ng bảo mật theo nhiều h&igrave;nh thức: bằng mật khẩu, h&igrave;nh vẽ, v&acirc;n tay hoặc mống mắt. Bạn cũng c&oacute; thể mở kh&oacute;a nhanh bằng c&aacute;ch k&iacute;ch hoạt chế độ nhận diện khu&ocirc;n mặt.</p>\r\n<p><img style=\"height: 327px; width: 640px;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-5.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-5.jpg\" /></p>\r\n<p>Những thao t&aacute;c hằng ng&agrave;y sẽ được thực hiện nhanh ch&oacute;ng m&agrave; kh&ocirc;ng cần d&ugrave;ng đến đ&ocirc;i tay nhờ trợ l&yacute; ảo Bixby mới (điều khiển bằng giọng n&oacute;i) m&agrave; Samsung trang bị cho Galaxy S8 Plus. Đặc biệt, h&atilde;ng c&ograve;n ph&aacute;t h&agrave;nh một phụ kiện đặc biệt c&oacute; t&ecirc;n Samsung DeX để biến Galaxy S8 Plus th&agrave;nh m&aacute;y t&iacute;nh để b&agrave;n.</p>\r\n<p>&nbsp;</p>\r\n<h3>Camera Samsung Galaxy S8 Plus: ng&agrave;y c&agrave;ng gần hơn với m&aacute;y ảnh chuy&ecirc;n nghiệp</h3>\r\n<p>Với độ ph&acirc;n giải 12MP, ống k&iacute;nh khẩu độ lớn f/1.7, c&ocirc;ng nghệ lấy n&eacute;t DualPixel v&agrave; c&ocirc;ng nghệ chống rung quang học, camera sau của Galaxy S8 Plus mang lại những bức ảnh si&ecirc;u n&eacute;t, kh&ocirc;ng hề thua k&eacute;m m&aacute;y ảnh chuy&ecirc;n nghiệp DSLR.</p>\r\n<p><img style=\"height: 370px; width: 640px;\" src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-7.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-s8-plus-chinh-hang-7.jpg\" /></p>\r\n<h3>Thời lượng pin Samsung Galaxy S8 Plus đ&aacute;p ứng tốt nhu cầu</h3>\r\n<p>Với vi&ecirc;n pin dung lượng 3500mAh v&agrave; con chip Exynos mới tiết kiệm điện năng, Galaxy S8 Plus đ&aacute;p ứng tốt nhu cầu l&agrave;m việc v&agrave; giải tr&iacute; trong ng&agrave;y. M&aacute;y cũng được t&iacute;ch hợp c&ocirc;ng nghệ sạc nhanh, người d&ugrave;ng c&oacute; thể nhanh ch&oacute;ng nạp lại năng lượng cho thiết bị th&ocirc;ng qua cổng USB Type-C (cắm được c&aacute;p theo cả 2 chiều) v&agrave; đế sạc kh&ocirc;ng d&acirc;y.</p>', 1),
(43, 'L_MK200', 'Bàn phím + Chuột Logitech MK200', 0, 329000, 0, 100, 0, 4, 13, '4521_bo_ban_phim_mouse_logitech_mk200_0001_2.jpg', '<p>B&agrave;n ph&iacute;m + Chuột Logitech MK200, độ bền cao, số lượng c&ograve;n rất &iacute;t (ch&iacute;nh h&atilde;ng)</p>', '<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><img style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px auto; border-style: none; max-width: 100%; display: block; height: auto !important;\" title=\"Combo Ph&iacute;m + Chuột MK200\" src=\"https://phongvu.vn/media/wysiwyg/phongvu/Combo/7062_81w6us04yal__sl1500_.jpg\" alt=\"Combo Ph&iacute;m + Chuột MK200\" /></p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">KẾT NỐI&nbsp;<a class=\"linkify\" style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; background-color: transparent; text-decoration-line: none; cursor: pointer; color: #000000 !important;\" title=\"usb\" href=\"https://phongvu.vn/usb-565.cat??utm_source=SEO\" target=\"_blank\" rel=\"noopener noreferrer\">USB</a>&nbsp;ĐỂ SỬ DỤNG NGAY SAU KHI CẮM</span></p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">C&agrave;i đặt đơn giản - bạn chỉ cần cắm v&agrave;o cổng&nbsp;<a class=\"linkify\" style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; background-color: transparent; text-decoration-line: none; cursor: pointer; color: #000000 !important;\" title=\"usb\" href=\"https://phongvu.vn/usb-565.cat??utm_source=SEO\" target=\"_blank\" rel=\"noopener noreferrer\">USB</a>&nbsp;tr&ecirc;n m&aacute;y t&iacute;nh để b&agrave;n, m&aacute;y t&iacute;nh x&aacute;ch tay hoặc netbook v&agrave; bắt đầu sử dụng ngay sau khi mở hộp.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">DỄ D&Agrave;NG THAO T&Aacute;C</span></p>\r\n<div class=\"feature-content\" style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px;\">Bạn c&oacute; thể l&agrave;m được nhiều hơn v&agrave; nhanh hơn với điều khiển 1 chạm với c&aacute;c n&uacute;t chức năng tr&ecirc;n ph&iacute;m.</p>\r\n</div>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">G&Otilde; THOẢI M&Aacute;I TRONG Y&Ecirc;N LẶNG</span></p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">Bạn sẽ th&iacute;ch trải nghiệm g&otilde; thoải m&aacute;i v&agrave; y&ecirc;n lặng nhờ c&aacute;c ph&iacute;m thấp hầu như kh&ocirc;ng tạo ra &acirc;m thanh v&agrave; bố cục ti&ecirc;u chuẩn với đầy đủ ph&iacute;m số v&agrave; c&aacute;c ph&iacute;m chức năng (F-key).</p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">CH&Acirc;N NGHI&Ecirc;NG VỮNG CH&Atilde;I, C&Oacute; THỂ ĐIỀU CHỈNH ĐƯỢC</span></p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">Bạn c&oacute; thể k&eacute;o d&agrave;i c&aacute;c ch&acirc;n gập vững chắc để tăng độ nghi&ecirc;ng của b&agrave;n ph&iacute;m l&ecirc;n 8 độ để ph&ugrave; hợp với nhu cầu của m&igrave;nh.</p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">THIẾT KẾ CHỐNG CHẤT LỎNG TR&Agrave;N V&Agrave;O</span></p>\r\n<div class=\"feature-content\" style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px;\">Chất lỏng sẽ tr&ocirc;i ra khi bạn chẳng may bị tr&agrave;n v&agrave;o.</p>\r\n</div>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\"><span style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 0px; font-weight: bolder;\">MẮT ĐỌC QUANG HỌC CHẤT LƯỢNG CAO</span></p>\r\n<p style=\"box-sizing: border-box; background-repeat: no-repeat; padding: 0px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif;\">Bạn sẽ tận hưởng được sự phản hồi mượt m&agrave; từ mắt đọc quang học (1000 dpi), ph&ugrave; hợp với cả người d&ugrave;ng tay tr&aacute;i v&agrave; tay phải .</p>', 1),
(44, 'H_P30', 'Huawei P30, Xanh dương, Chính hãng', 0, 16900000, 0, 125, 0, 1, 28, 'fb032ffb762cddf1ca3a35214b52fa96.png', '<p>Điện thoại Huawei P30 ch&iacute;nh h&atilde;ng &ndash; Chiếc điện thoại th&ocirc;ng minh độc đ&aacute;o nhất</p>', '<p><em><strong><a href=\"https://cellphones.com.vn/mobile/huawei.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/huawei.html\">Huawei</a></strong>&nbsp;vừa mới tr&igrave;nh l&agrave;ng chiếc smartphone cao cấp Huawei P30 c&ugrave;ng với&nbsp;<a href=\"https://cellphones.com.vn/huawei-p30-pro.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/huawei-p30-pro.html\"><strong>P30 Pro</strong></a>&nbsp;v&agrave;&nbsp;<a href=\"https://cellphones.com.vn/huawei-p30-lite.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/huawei-p30-lite.html\"><strong>P30 Lite</strong></a>. Được thừa hưởng những thiết kế của Huawei P20, hơn nữa thiết bị cũng được cải tiến mạnh mẽ về camera cũng như hiệu năng. Huawei P30 hứa hẹn sẽ l&agrave; đối thủ đ&aacute;ng gờm trong ph&acirc;n kh&uacute;c cao cấp v&agrave; mang lại cho người d&ugrave;ng những trải nghiệm tuyệt vời.</em></p>\r\n<h3>Thiết kế m&agrave;n h&igrave;nh Huawei P30 xứng đ&aacute;ng l&agrave; smartphone cao cấp</h3>\r\n<p>Điện thoại&nbsp;<strong>Huawei P30</strong>&nbsp;nổi bật với m&agrave;u &ldquo;Gradient&rdquo; vốn đ&atilde; được sử dụng tr&ecirc;n Huawei P20, được lấy cảm hứng từ xu hướng sử dụng bản m&agrave;u Gradients tr&ecirc;n c&aacute;c giao diện. Với lớp phủ quang học NCVM b&ecirc;n dưới mặt k&iacute;nh, kết hợp phản chiếu kh&uacute;c xạ &aacute;nh s&aacute;ng để tạo n&ecirc;n dải m&agrave;u tươi mới, gi&uacute;p n&oacute; c&oacute; thể đổi m&agrave;u từ m&agrave;u t&iacute;m sang xanh lục, sang xanh lam.</p>\r\n<p><img style=\"height: 559px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-1.jpg\" /></p>\r\n<p>B&ecirc;n cạnh đ&oacute;, mặt lưng k&iacute;nh cao cấp đi k&egrave;m với bộ khung kim loại cứng c&aacute;p ở th&acirc;n m&aacute;y gi&uacute;p bảo vệ Huawei P30 tr&aacute;nh khỏi những t&aacute;c động vật l&yacute; b&ecirc;n ngo&agrave;i. M&aacute;y d&ugrave;ng m&agrave;n h&igrave;nh khuyết đỉnh nhưng được l&agrave;m nhỏ gọn hơn v&agrave; c&oacute; h&igrave;nh giọt nước gi&uacute;p cho m&aacute;y c&oacute; c&aacute;i nh&igrave;n tổng thể tinh tế hơn phi&ecirc;n bản trước.</p>\r\n<p>Về m&agrave;n h&igrave;nh,&nbsp;<strong>điện thoại</strong>&nbsp;<strong>Huawei P30</strong>&nbsp;được trang bị m&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước lớn 6 inch nhưng do được tối ưu phần viền n&ecirc;n tổng thể m&aacute;y vẫn rất vừa vặn trong l&ograve;ng b&agrave;n tay. Hơn nữa, phần nội dung được tr&agrave;n ra s&aacute;t c&aacute;c m&eacute;p cạnh sẽ n&acirc;ng cao việc trải nghiệm giải tr&iacute; như xem phim hay chơi game. Ngo&agrave;i ra, độ ph&acirc;n giải Full HD+ (1080 x 2340 Pixels) kết hợp với c&ocirc;ng nghệ m&agrave;n h&igrave;nh&nbsp;<a href=\"https://www.trustedreviews.com/news/what-is-oled-3285263\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.trustedreviews.com/news/what-is-oled-3285263\">OLED</a>&nbsp;cho chất lượng hiển thị h&igrave;nh ảnh sắc n&eacute;t với m&agrave;u sắc rực rỡ, độ tương phản cao.</p>\r\n<p><img style=\"height: 531px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-2.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-2.jpg\" /></p>\r\n<p>Điểm mạnh của m&agrave;n h&igrave;nh OLED l&agrave; khả năng thể hiện những m&agrave;u sắc rực rỡ, bắt mắt v&agrave; trung thực, m&agrave;u đen gần như l&agrave; tuyệt đối. Ngo&agrave;i ra, g&oacute;c nh&igrave;n si&ecirc;u rộng, c&oacute; thể đạt xấp xỉ l&ecirc;n đến 180 độ, người d&ugrave;ng c&oacute; thể tận hưởng trọn vẹn chất lượng h&igrave;nh ảnh ngay cả khi kh&ocirc;ng nh&igrave;n trực diện. Điểm yếu duy nhất l&agrave; ti&ecirc;u tốn nhiều năng lượng nhưng do khả năng tối ưu về chip, hệ điều h&agrave;nh n&ecirc;n Huawei P30 cũng sẽ cho thời gian sử dụng ấn tượng.</p>\r\n<h3>Chụp ảnh chuy&ecirc;n nghiệp với ba camera sau tr&ecirc;n Huawei P30</h3>\r\n<p><em>Huawei P30</em>&nbsp;sở hữu ba camera&nbsp;<a href=\"http://en.leica-camera.com/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"http://en.leica-camera.com/\">Leica</a>&nbsp;quen thuộc ở mặt sau, bao gồm camera ch&iacute;nh c&oacute; độ ph&acirc;n giải cực khủng 40MP c&oacute; hỗ trợ zoom quang học 5x, camera phụ lần lượt l&agrave; 20MP v&agrave; 13MP trợ chống rung quang học để nội suy h&igrave;nh ảnh v&agrave; hỗ trợ chụp trắng đen. Huawei P30 chắc chắn sẽ kh&ocirc;ng l&agrave;m cho người d&ugrave;ng thất vọng với những bức ảnh ưng &yacute;.</p>\r\n<p>C&ograve;n camera trước của cũng được h&atilde;ng đặc biệt chăm ch&uacute;t khi trang bị độ ph&acirc;n giải 24MP t&iacute;ch hợp c&ocirc;ng nghệ tr&iacute; tuệ nh&acirc;n tạo AI c&ugrave;ng đ&egrave;n LED trợ s&aacute;ng, hỗ trợ chế độ l&agrave;m đẹp sẽ cho người d&ugrave;ng những bức ảnh selfie đẹp n</p>\r\n<p><img style=\"height: 423px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-3.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-3.jpg\" /></p>\r\n<p>Huawei P30 đ&atilde; được bỏ đi n&uacute;t home v&agrave; thay v&agrave;o đ&oacute; chỉ c&ograve;n bảo mật nhận diện khu&ocirc;n mặt Face Unlock. C&ocirc;ng nghệ n&agrave;y hoạt động với cơ chế kết hợp camera hồng ngoại v&agrave; laser ph&aacute;t s&aacute;ng bề mặt khoang dọc (<a href=\"https://en.wikipedia.org/wiki/Vertical-cavity_surface-emitting_laser\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://en.wikipedia.org/wiki/Vertical-cavity_surface-emitting_laser\">VCSEL</a>). Đồng thời, t&iacute;nh năng n&agrave;y hoạt động hiệu quả, thậm ch&iacute; tốc độ mở kh&oacute;a của m&aacute;y c&ograve;n nhanh hơn cả iPhone X.</p>\r\n<p>Với dung lượng pin cao 4.300 mAh mang lại thời lượng sử dụng rất tốt, người d&ugrave;ng thoải m&aacute;i sử dụng m&aacute;y trong 2 ng&agrave;y. Hơn nữa, m&aacute;y cũng hỗ trợ t&iacute;nh năng sạc si&ecirc;u nhanh Huawei Super Charge gi&uacute;p tiết kiệm 30% thời gian sạc nhưng vẫn đảm bảo an to&agrave;n cho người ti&ecirc;u d&ugrave;ng.</p>\r\n<p><img style=\"height: 561px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-4.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/huawei/huawei-p30-4.jpg\" /></p>', 1),
(45, 'MB_Pro13', 'Apple MacBook Pro 13 inch 128GB MPXQ2 Chính hãng', 0, 29900000, 0, 70, 0, 2, 3, '2d6c253a47b945c830cf2ea731f995ed.jpg', '<p>Apple MacBook Pro 13 inch 128GB MPXQ2 (2017)</p>', '<h3>Thiết kế v&agrave; ngoại h&igrave;nh Apple MacBook Pro 13 inch 128GB MPXQ2</h3>\r\n<p>Sở hữu thiết kế mỏng v&agrave; nhẹ với m&agrave;n h&igrave;nh LED-backlit IPS LCD, 2560 x 1600 pixels, 13.3 inches l&agrave;m cho h&igrave;nh ảnh hiển thị cực k&igrave; sắc n&eacute;t v&agrave; thực tế.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 360px; width: 640px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-1.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>M&aacute;y được tạo n&ecirc;n từ kim loại nguy&ecirc;n khối, tuy nhi&ecirc;n ch&uacute;ng c&ograve;n mỏng v&agrave; nhẹ hơn rất nhiều so với phi&ecirc;n bản cũ với trọng lượng chỉ 1.37kg.</p>\r\n<p>&nbsp;</p>\r\n<h3>Hiệu suất cực khủng của Apple MacBook Pro 13 inch 128GB MPXQ2</h3>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 427px; width: 640px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-3.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-3.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Với phi&ecirc;n bản Apple MacBook Pro 13 inch 2017 n&agrave;y, người d&ugrave;ng đảm bảo h&agrave;i l&ograve;ng với tốc độ xử l&iacute; Intel Core i5 Dual-core 2.3 GHz, Turbo Boost l&ecirc;n đến 3.6 GHz, 64MB eDRAM, bộ RAM 8GB, bộ nhớ lưu trữ 128 GB PCIe, đồ họa Intel Iris Plus Graphics 640 xử l&iacute; đồ họa nhanh hơn 130% thực sự đ&atilde; chinh phục to&agrave;n bộ người d&ugrave;ng.</p>\r\n<p>&nbsp;</p>\r\n<h3>Apple MacBook Pro 13 inch 128GB MPXQ2 lưu lượng pin cực bền</h3>\r\n<p><img style=\"height: 360px; width: 640px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-4.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/macbook/apple-macbook-pro-13-inch-128gb-mpxq2-4.jpg\" /></p>', 1),
(46, 'D_Vostro15', 'Laptop Dell Vostro 15 5581 (70175950)', 0, 18790000, 10, 124, 0, 2, 23, '8eaed859be980f79ae65426b01be5d21.jpg', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay Dell Vostro 15 5581 - mẫu laptop nắm bắt được c&ocirc;ng nghệ ti&ecirc;n tiến, người d&ugrave;ng lu&ocirc;n được trải nghiệm độc đ&aacute;o</p>', '<p><em>Với thiết kế lu&ocirc;n giữ được sự đơn giản nhưng hiệu quả m&agrave; d&ograve;ng&nbsp;<strong>Dell Vostro 15 5581</strong>&nbsp;l&agrave;m việc n&agrave;y mang lại thật sự đ&aacute;ng t&igrave;m hiệu. Lu&ocirc;n nắm bắt được c&ocirc;ng nghệ ti&ecirc;n tiến, người d&ugrave;ng lu&ocirc;n được trải nghiệm những c&ocirc;ng nghệ mới m&agrave;&nbsp;Dell&nbsp;mang lại được sự trải nghiệm tốt hơn c&aacute;c&nbsp;ứng dụng&nbsp;đ&aacute;p ứng cho c&ocirc;ng việc cũng như tăng th&ecirc;m phần th&uacute; vị trong thời gian giải tr&iacute;. Hỗ trợ bảo mật v&acirc;n tay gi&uacute;p người d&ugrave;ng c&oacute; thể lưu trữ th&ocirc;ng tin tốt hơn, an to&agrave;n hơn chỉ với 1 lần chạm.</em></p>\r\n<h3><strong>Thiết kế vỏ nh&ocirc;m tinh giản, chuy&ecirc;n nghiệp</strong></h3>\r\n<p>G&oacute;p phần v&agrave;o phong th&aacute;i chỉnh chu cho người d&ugrave;ng c&ocirc;ng sở hiện đại, Dell Vostro 15 5581 c&oacute; cấu tr&uacute;c vỏ nh&ocirc;m, t&ocirc;ng m&agrave;u x&aacute;m trung t&iacute;nh th&iacute;ch hợp cho người d&ugrave;ng nam lẫn nữ.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 487px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-1.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Dell Vostro 15 5581 được thiết kế đơn giản nhưng kh&ocirc;ng k&eacute;m phần sang trọng, tinh tế với lớp vỏ ngo&agrave;i cứng c&aacute;p, chắc chắn gi&uacute;p bảo vệ tốt c&aacute;c linh kiện b&ecirc;n trong v&agrave; c&aacute;c g&oacute;c cạnh được bo tr&ograve;n nhẹ tạo cảm gi&aacute;c thoải m&aacute;i khi cầm nắm. Ngo&agrave;i ra, với k&iacute;ch thước tổng thể 36.1 x 24.9 x 1.8cm v&agrave; trọng lượng chỉ khoảng 1.9kg, bạn c&oacute; thể bỏ m&aacute;y v&agrave;o t&uacute;i x&aacute;ch hoặc balo v&agrave; mang theo b&ecirc;n m&igrave;nh đến bất cứ nơi n&agrave;o bạn muốn để sử dụng khi cần.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh Full&nbsp;</strong><strong>H</strong><strong>D với&nbsp;<a href=\"https://www.tomshardware.com/reviews/ips-in-plane-switching-definition,5748.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.tomshardware.com/reviews/ips-in-plane-switching-definition,5748.html\">tấm nền IPS</a></strong><strong>&nbsp;c&ugrave;ng đ&egrave;n nền LED</strong><strong>&nbsp;chống ch&oacute;i</strong></h3>\r\n<p>Sử dụng tấm nền IPS với điểm mạnh nằm ở g&oacute;c nh&igrave;n rộng, chống l&oacute;a hỗ trợ người d&ugrave;ng c&oacute; thể nh&igrave;n từ nhiều g&oacute;c độ cũng như sử dụng ngay trong m&ocirc;i trường c&oacute; &aacute;nh nắng trực tiếp. Với độ bền cao hơn, duy tr&igrave; tu&ocirc;i thọ sản phẩm l&acirc;u hơn, bền bỉ hơn c&ugrave;ng độ ph&acirc;n giải 1920 x 1080 với h&igrave;nh ảnh chuẩn&nbsp;Full HD&nbsp;được g&oacute;i gọn trong k&iacute;ch thước 15,6 inch mang đến trải nghiệm h&igrave;nh ảnh sắc n&eacute;t.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 634px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-2.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-2.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Một điểm cộng cho chiếc Dell Vostro 5581&nbsp;70175952 đ&oacute; l&agrave; được trang bị đường viền hẹp 2 mặt, vừa tạo được g&oacute;c nh&igrave;n rộng, vừa l&agrave;m cho m&aacute;y trở n&ecirc;n mỏng nhẹ hơn khi nằm trọn trong khung h&igrave;nh Laptop 14inch ti&ecirc;u chuẩn. M&agrave;n h&igrave;nh Full HD k&iacute;ch thước 14 inch của Vostro 5481 v&agrave; 15,6 inch tr&ecirc;n Vostro 5581 cho khung h&igrave;nh rộng, cung cấp những thước h&igrave;nh rực rỡ, sắc n&eacute;t từng chi tiết. Tầm nền IPS ngăn ngừa mỏi mắt v&agrave; chống ch&oacute;i gi&uacute;p người d&ugrave;ng văn ph&ograve;ng c&oacute; thể l&agrave;m việc dưới mọi m&ocirc;i trường &aacute;nh s&aacute;ng.</p>\r\n<p>Đ&egrave;n nền LED chống ch&oacute;i 15,6 inch FHD (1920 x 1080) M&agrave;n h&igrave;nh IPS viền kh&ocirc;ng chạm. C&ocirc;ng nghệ&nbsp;m&agrave;n h&igrave;nh IPS&nbsp;sẽ gi&uacute;p chiếc laptop n&agrave;y t&aacute;i tạo được h&igrave;nh ảnh một c&aacute;ch r&otilde; r&agrave;ng, m&agrave;u sắc ch&iacute;nh x&aacute;c v&agrave; g&oacute;c nh&igrave;n rộng hơn. Tuy nhi&ecirc;n, c&oacute; 1 nhược điểm cho m&agrave;n h&igrave;nh IPS đ&oacute; l&agrave; sẽ ti&ecirc;u tốn điện năng hơn khoảng 15% v&agrave; chi ph&iacute; sản xuất cũng đắt hơn so với tấm nền TN.</p>\r\n<h3><strong>Cấu h&igrave;nh khủng vi xử l&yacute; core i5 thế hệ thứ 8 Kabylake Refresh với ổ cứng&nbsp;</strong><strong>4GB DDR4</strong></h3>\r\n<p>Dell Vostro 15 5581 sử dụng chip&nbsp;Intel&nbsp;Core&nbsp;i5&nbsp;đ&aacute;p ứng được hầu hết tất cả c&aacute;c ti&ecirc;u chuẩn&nbsp;ứng dụng&nbsp;hiện nay. 8265U thuộc thế hệ thứ 8 với độ xung nhịp 1.6 GHz &ndash; 3.9 GHz với 4 nh&acirc;n 8 luồng mang lại tốc độ xử l&yacute; ti&ecirc;u chuẩn cung cấp &ldquo;kh&ocirc;ng gian&rdquo; l&agrave;m việc đảm bảo gi&uacute;p người d&ugrave;ng được trải nghiệm chuy&ecirc;n s&acirc;u. Kh&ocirc;ng đơn giản l&agrave; để đ&aacute;p ứng&nbsp;ứng dụng, độ xung nhịp lớn cũng gi&uacute;p người d&ugrave;ng chạy đa nhiệm tốt hơn v&agrave; mang đến sự mượt m&agrave; với nhiều tab tr&ecirc;n nền c&aacute;c tr&igrave;nh duyệt.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 538px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-3.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-3.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Với RAM 4GB&nbsp;DDR4&nbsp;2666MHz thuộc dạng tầm trung, ngo&agrave;i những gi&acirc;y ph&uacute;t l&agrave;m việc căng thẳng người d&ugrave;ng c&oacute; thể tận hưởng những khoảng thời gian giải tr&iacute; nhẹ nh&agrave;ng. Với 4GB&nbsp;RAM&nbsp;người d&ugrave;ng c&oacute; thể thoải m&aacute;i chơi c&aacute;c game c&oacute; cấu h&igrave;nh tương đối đủ để đ&aacute;p ứng với mức tối thiểu của c&aacute;c dạng game lớn. Với 2 khe cắm hỗ trợ tối đa người d&ugrave;ng l&ecirc;n đến 16GB. T&igrave;m hiểu th&ecirc;m th&igrave;&nbsp;DDR4&nbsp;được xem như l&agrave; sự n&acirc;ng cấp từ&nbsp;DDR3.&nbsp;DDR4&nbsp;được ra mắt với hiệu năng l&agrave;m việc cao hơn, ti&ecirc;u thụ &iacute;t điện năng hơn b&ecirc;n cạnh 1 v&agrave;i chức năng kh&aacute;c của được n&acirc;ng cấp v&agrave; cải tiến. Giảm thiểu 40% điện năng, sở hữu t&iacute;nh năng kiểm tra phần dư tuần ho&agrave;n (CRC) để thực thi nhiệm vụ kiểm tra đường truyền v&agrave; giải quyết mang lại t&iacute;nh an to&agrave;n của dữ liệu, ph&aacute;t hiện t&iacute;nh chẵn lẻ tr&ecirc;n chip nhằm x&aacute;c thực t&iacute;nh to&agrave;n vẹn của dữ liệu, b&ecirc;n cạnh đ&oacute; c&ograve;n thực hiện 1 v&agrave;i t&iacute;nh năng RAS mạnh mẽ kh&aacute;c.&nbsp;</p>\r\n<p>Sử dụng ch&iacute;p&nbsp;<a href=\"https://www.notebookcheck.net/Intel-UHD-Graphics-620-GPU-Review-Benchmarks-and-Specs.239936.0.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.notebookcheck.net/Intel-UHD-Graphics-620-GPU-Review-Benchmarks-and-Specs.239936.0.html\">intel&nbsp;UHD&nbsp;Graphics 620</a>&nbsp;thuộc d&ograve;ng chip cải tiến n&acirc;ng cao khả năng l&agrave;m việc so với 520, với thử nghiệm qua 3D Mark Cloud Gate (đ&aacute;nh gi&aacute; về khả năng xử l&yacute; đồ họa game). Intel&nbsp;HD Graphics 620 nhanh hơn khoảng 7% so với d&ograve;ng 520 trước đ&oacute;.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 358px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-5.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Dell/DELL-VOSTRO-15-5581-5.jpg\" /></p>\r\n<h3><strong>Mạnh mẽ với card đồ họa rời 2GB v&agrave; t&iacute;ch hợp sẵn win10 + Office 365</strong></h3>\r\n<p>Dell Vostro 15 5581 t&iacute;ch hợp card đồ họa rời&nbsp;<a href=\"https://www.notebookcheck.net/NVIDIA-GeForce-MX130-GPU-Benchmarks-and-Specs.258054.0.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.notebookcheck.net/NVIDIA-GeForce-MX130-GPU-Benchmarks-and-Specs.258054.0.html\">NVIDIA GeForce MX130</a>&nbsp;2GB GDDR5 b&ecirc;n trong gi&uacute;p Dell Vostro 15 5581 c&oacute; thể chạy tốt hơn những&nbsp;phần mềm&nbsp;đồ họa văn ph&ograve;ng v&agrave; chơi được c&aacute;c dạng game c&oacute; cấu h&igrave;nh tầm trung. Với kiến tr&uacute;c Maxell cũ nhưng NVIDIA GeForce MX130 vẫn mạnh hơn khoảng 2,5 lần so với ch&iacute;nh card&nbsp;Intel&nbsp;UHD&nbsp;Graphics 620 onboard</p>', 1);
INSERT INTO `hanghoa` (`mshh`, `mahh`, `tenhh`, `giaban`, `giagoc`, `sale_off`, `soluonghang`, `number`, `manhom`, `idhieusp`, `hinhanh`, `motahh`, `noidung`, `trangthai`) VALUES
(47, 'HP_Pavilion15', 'Laptop HP Pavilion 15-cs0014TU 4MF01PA', 0, 13890000, 10, 117, 0, 2, 12, '2fffae1beec0f68c13e8c9864445e29d.jpg', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay HP Pavilion 15-cs0014TU 4MF01PA &ndash; Laptop ph&ugrave; hợp với mọi tầng lớp</p>', '<p><em>D&ograve;ng&nbsp;<a href=\"https://cellphones.com.vn/laptop/hp.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/laptop/hp.html\"><strong>m&aacute;y t&iacute;nh x&aacute;ch tay của HP</strong></a>&nbsp;chắc chắn l&agrave; c&aacute;i t&ecirc;n rất phổ biến với giới văn ph&ograve;ng với ti&ecirc;u ch&iacute;: gi&aacute; cả phải chăng, cấu h&igrave;nh tốt, thiết kế đẹp mắt &hellip; Ch&iacute;nh v&igrave; thế,&nbsp;<strong>laptop HP Pavilion 15-cs0014TU 4MF01PA</strong>&nbsp;lu&ocirc;n l&agrave; sự lựa chọn của đ&ocirc;ng đảo của người d&ugrave;ng, từ học sinh, sinh vi&ecirc;n, nh&acirc;n vi&ecirc;n văn ph&ograve;ng,&hellip;</em></p>\r\n<h3><strong>Thiết kế nh&ocirc;m cao cấp</strong>&nbsp;<strong>với độ mỏng chỉ 17.9mm, c&aacute;c đường cong bo tr&ograve;n tỉ mỉ tinh tế</strong></h3>\r\n<p>Laptop HP Pavilion 15-cs0014TU 4MF01PA c&oacute; thiết kế nh&ocirc;m đẹp mắt, cao cấp. C&aacute;c đường n&eacute;t tr&ecirc;n thiết bị đều được ho&agrave;n thiện tỉ mỉ, tinh tế với độ mỏng chỉ 17.9mm gi&uacute;p người d&ugrave;ng c&oacute; thể thoải m&aacute;i mang đi để sử dụng bất cứ l&uacute;c n&agrave;o.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_1__.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_1__.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>Tr&ecirc;n nắp laptop được sơn 1 lớp tr&aacute;ng bạc &iacute;t b&aacute;m v&acirc;n tay v&agrave; bụi bẩn. C&aacute;c đường cong bo tr&ograve;n bao quanh th&acirc;n m&aacute;y kết hợp 2 n&uacute;t nhựa để người d&ugrave;ng đ&aacute;nh m&aacute;y thoải m&aacute;i hơn &ndash; thiết kế n&agrave;y cũng gần giống 2 đế nẫy của c&aacute;c b&agrave;n ph&iacute;m rời.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh 15.6 inch Full HD với&nbsp;<a href=\"https://www.viewsonic.com/library/photography/what-is-an-ips-monitor-panel\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.viewsonic.com/library/photography/what-is-an-ips-monitor-panel\">tấm nền IPS</a>&nbsp;cho h&igrave;nh ảnh r&otilde; n&eacute;t v&agrave; sống động</strong></h3>\r\n<p>Laptop HP Pavilion 15-cs0014TU 4MF01PA c&oacute; k&iacute;ch thước 15.6 inch độ ph&acirc;n giải Full HD tạo ra h&igrave;nh ảnh r&otilde; n&eacute;t v&agrave; sống động khi phục vụ giải tr&iacute;, xem phim hay c&aacute;c c&ocirc;ng việc đồ hoạ đều thể hiện tốt tr&ecirc;n m&agrave;n h&igrave;nh.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_2_.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_2_.jpg\" /></p>\r\n<p>Laptop c&ograve;n sử dụng c&ocirc;ng nghệ tấm nền IPS anti-glare cho g&oacute;c nh&igrave;n l&ecirc;n tới 178 độ gi&uacute;p người dung nh&igrave;n nghi&ecirc;ng kh&ocirc;ng bị thay đổi m&agrave;u sắc. Phần viền hai b&ecirc;n m&agrave;n h&igrave;nh được chế t&aacute;c mỏng hơn c&ograve;n 6.5 mm tương đương c&aacute;c laptop cao cấp kh&aacute;c tr&ecirc;n thị trường.</p>\r\n<h3><strong>Vi xử l&yacute;&nbsp;<a href=\"https://ark.intel.com/content/www/us/en/ark/products/137977/intel-core-i3-8130u-processor-4m-cache-up-to-3-40-ghz.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://ark.intel.com/content/www/us/en/ark/products/137977/intel-core-i3-8130u-processor-4m-cache-up-to-3-40-ghz.html\">Intel Core i3-8130U</a>&nbsp;v&agrave; ổ cứng 1TB phục vụ tốt nhu cầu l&agrave;m việc, giải tr&iacute;</strong></h3>\r\n<p>Laptop HP Pavilion 15-cs0014TU 4MF01PA được trang bị vi xử l&yacute; Intel Core i3-8130U tốc độ 2.2 GHz, cho thời gian xử l&yacute; dữ liệu nhanh hơn 45% v&agrave; hiệu năng tăng 25% so với d&ograve;ng trước đ&oacute;. B&ecirc;n cạnh đ&oacute;, bộ nhớ RAM DDR4 dung lượng 4 GB đ&aacute;p ứng tốt c&aacute;c nhu cầu học tập, l&agrave;m việc văn ph&ograve;ng hay giải tr&iacute;.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_3_.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_3_.jpg\" /></p>\r\n<p>Sản phẩm kh&ocirc;ng hổ trợ card đồ hoạ rời m&agrave; chỉ d&ugrave;ng GPU t&iacute;ch hợp&nbsp;<a href=\"https://www.notebookcheck.net/Intel-UHD-Graphics-620-GPU-Review-Benchmarks-and-Specs.239936.0.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.notebookcheck.net/Intel-UHD-Graphics-620-GPU-Review-Benchmarks-and-Specs.239936.0.html\">Intel UHD 620</a>,&nbsp;để phục vụ nhu cầu chơi 1 số game online hiện nay. K&egrave;m theo đ&oacute; l&agrave; ổ cứng HDD l&ecirc;n đến 1TB gi&uacute;p người dung tha hồ lưu trữ th&ocirc;ng tin c&aacute; nh&acirc;n, t&agrave;i liệu v&agrave; nhiều game hơn.</p>\r\n<h3><strong>Trang bị thỏi pin 3 Cell 41Wh cung cấp năng lượng sử dụng đến 7 tiếng</strong></h3>\r\n<p>Laptop HP Pavilion 15-cs0014TU 4MF01PA &nbsp;được trang bị 3 Cell pin 41Wh cho thời gian sử dụng của m&aacute;y kh&aacute; do t&iacute;ch hợp loại chip tiết kiệm điện (i3-8130U). V&igrave; vậy, thỏi pin của m&aacute;y ho&agrave;n to&agrave;n c&oacute; thể gi&uacute;p người d&ugrave;ng sử dụng mượt m&agrave; trong thời gian kh&aacute; d&agrave;i.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_4_.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/HP/Laptop_HP_Pavilion_15-cs0014TU_4MF01PA_4_.jpg\" /></p>\r\n<p>Thực tế cho thấy, laptop khi dung để soạn thảo văn bản, xử l&yacute; c&ocirc;ng việc văn ph&ograve;ng th&igrave; sẽ sử dụng được đến 7 tiếng. Ngo&agrave;i ra, HP Pavilion 15-cs0014TU c&ograve;n hỗ trợ c&ocirc;ng nghệ sạc nhanh HP FastCharge cho ph&eacute;p sạc tới 50% pin chỉ sau khoảng 45 ph&uacute;t vừa d&ugrave;ng vừa sạc.</p>\r\n<h3><strong>Thiết kế b&agrave;n ph&iacute;m</strong>&nbsp;<strong>chiclet v&agrave; touch pad rộng r&atilde;i, tạo cảm gi&aacute;c thoải khi nhập liệu</strong></h3>\r\n<p>HP Pavilion 15-cs0014TU được thiết kế b&agrave;n ph&iacute;m kiểu chiclet với khoảng c&aacute;ch giữa c&aacute;c</p>\r\n<p>Bắt được t&acirc;m l&yacute; đ&oacute;, HP đ&atilde; trang bị cho laptop HP Pavilion 15-cs0014TU 4MF01PA hai dải loa B&amp;O được đặt ở ph&iacute;a tr&ecirc;n khu vực b&agrave;n ph&iacute;m. Nh&igrave;n chung loa của m&aacute;y c&oacute; &acirc;m lượng lớn, dải &acirc;m treble, dải trung t&aacute;i tạo &acirc;m thanh trong vắt, gi&uacute;p mang lại chất lượng &acirc;m thanh tuyệt vời cho người d&ugrave;ng.</p>\r\n<h3><strong>HP Pavilion 15-cs0014TU 4MF01PA cung cấp&nbsp;<a href=\"https://cellphones.com.vn/sforum/windows-10-sap-co-them-theme-mau-trang-cuc-sang\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/windows-10-sap-co-them-theme-mau-trang-cuc-sang\">Win10</a>&nbsp;bản quyền, k&egrave;m theo chế độ bảo h&agrave;nh tại nh&agrave;</strong></h3>\r\n<p>Win 10 bản quyền ở laptop cung cấp độ an to&agrave;n cao, hạn chế tối đa virus v&agrave; nguy cơ mất dữ liệu. Laptop sử dụng ổn định, tương th&iacute;ch với hầu hết game v&agrave; ứng dụng, thường xuy&ecirc;n được cập nhật, sửa lỗi từ nh&agrave; cung cấp. Đặc biệt l&agrave; hạn sử dụng vĩnh viễn kh&ocirc;ng cần mua đi mua lại nhiều lần.</p>\r\n<p>CellphoneS lu&ocirc;n nỗ lực hết m&igrave;nh trong việc đảm bảo chất lượng sản phẩm, cũng như dịch vụ hỗ trợ sau b&aacute;n h&agrave;ng. Laptop sẽ bao gồm chế độ bảo h&agrave;nh tại nh&agrave; của hệ thống b&aacute;n h&agrave;ng uy t&iacute;n CellPhoneS. Ch&uacute;ng t&ocirc;i lu&ocirc;n c&oacute; đội ngũ kĩ thuật vi&ecirc;n chuy&ecirc;n nghiệp, c&oacute; nhiều năm kinh nghiệm trong việc bảo h&agrave;nh. Gi&uacute;p kh&aacute;ch h&agrave;ng tiết kiệm được thời gian v&agrave; hạn chế đi lại khi laptop c&oacute; bất k&igrave; trục trặc g&igrave;, nh&acirc;n vi&ecirc;n của ch&uacute;ng t&ocirc;i sẽ c&oacute; mặt kịp thời để xử l&yacute;.</p>', 1),
(48, 'Asus_Zenbook14', 'Laptop Asus Zenbook 14 UX433FA-A6113T', 0, 22990000, 9, 119, 0, 2, 16, '7b7b2921713608c27ec12d66c7973fd2.jpg', '<p>M&aacute;y t&iacute;nh x&aacute;ch tay Asus Zenbook 14 UX433FA-A6113T: D&ograve;ng laptop mỏng nhẹ v&agrave; đầy mạnh mẽ</p>', '<p><em><a href=\"https://cellphones.com.vn/laptop/asus.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/laptop/asus.html\"><strong>Laptop Asus</strong></a>&nbsp;Zenbook lu&ocirc;n được biết đến như một trong những d&ograve;ng laptop mỏng nhẹ v&agrave; đẹp v&agrave; cũng l&agrave; sự lựa chọn thường thấy ở giới doanh nh&acirc;n - nh&acirc;n vi&ecirc;n văn ph&ograve;ng. Với phi&ecirc;n bản&nbsp;<strong>Asus Zenbook UX433FA-A6113T</strong>. Asus tiếp tục cải tiến Zenbook 14 với nhiều n&acirc;ng cấp về m&agrave;n h&igrave;nh cũng như vi xử l&yacute;.</em></p>\r\n<h3><strong>Thiết kế si&ecirc;u mỏng, gọn nhẹ với độ d&agrave;y 16mm v&agrave; trọng lượng 1kg</strong></h3>\r\n<p>Khung m&aacute;y si&ecirc;u gọn nhẹ đ&atilde; l&agrave;m n&ecirc;n mẫu laptop 14-inch nhỏ gọn nhất từ trước đến nay, m&agrave; tr&ecirc;n thực tế chỉ c&oacute; k&iacute;ch thước xấp xỉ một tờ giấy A4 v&agrave; c&ograve;n l&agrave; một trong những chiếc m&aacute;y t&iacute;nh x&aacute;ch tay nhỏ nhất thế giới với độ d&agrave;y 16mm v&agrave; nặng 1.2kg.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-1.jpg\" /></p>\r\n<p>Lớp ho&agrave;n thiện v&acirc;n kim loại đồng t&acirc;m lấy cảm hứng từ Zen đặc trưng tr&ecirc;n nắp lưng c&ugrave;ng hai m&agrave;u sắc lựa chọn: xanh, bạc. Cả hai mẫu thiết kế n&agrave;y đều được nhấn mạnh bằng sự tương phản của panel viền m&agrave;u &agrave;ng hồng ph&iacute;a tr&ecirc;n b&agrave;n ph&iacute;m, l&agrave;m t&ocirc;n l&ecirc;n th&ecirc;m vẻ sang trọng.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh kh&ocirc;ng</strong><strong>&nbsp;viền&nbsp;</strong><a href=\"https://www.asus.com/support/FAQ/1038282/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.asus.com/support/FAQ/1038282/\"><strong>NanoEdge</strong></a><strong>&nbsp;(1920x1080)</strong>&nbsp;<strong>thể hiện m&agrave;u sắc tối ưu</strong><strong>,&nbsp;</strong><strong>g&oacute;c nh&igrave;n rộng</strong></h3>\r\n<p>Asus Zenbook 14 UX433FA-A6113T đ&atilde; trang bị m&agrave;n h&igrave;nh độ ph&acirc;n giải cao (1920x1080), r&otilde; n&eacute;t v&agrave; trong trẻo gi&uacute;p cho từng h&igrave;nh ảnh đều trở n&ecirc;n tốt nhất với g&oacute;c nh&igrave;n rộng 178 , m&agrave;u sắc ch&iacute;nh x&aacute;c v&agrave; sống động.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-2.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-2.jpg\" /></p>\r\n<p>M&agrave;n h&igrave;nh n&agrave;y c&ograve;n hỗ trợ những c&ocirc;ng nghệ độc quyền của ASUS &ndash; trong đ&oacute; c&oacute;&nbsp;<a href=\"https://www.asus.com/vn/support/FAQ/1009986/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.asus.com/vn/support/FAQ/1009986/\">ASUS Splendid</a>&nbsp;v&agrave;&nbsp;<a href=\"https://www.asus.com/me-en/support/FAQ/1038464/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.asus.com/me-en/support/FAQ/1038464/\">ASUS Tru2Life Video</a>&nbsp;&ndash;&nbsp;tinh chỉnh c&aacute;c th&ocirc;ng số m&agrave;n h&igrave;nh để đảm bảo độ thoải m&aacute;i tối đa cho mắt cũng như khả năng thể hiện m&agrave;u sắc tối ưu cho mọi loại nội dung.</p>\r\n<h3><strong>V</strong><strong>i xử l&yacute;&nbsp;<a href=\"https://ark.intel.com/content/www/vn/vi/ark/products/149088/intel-core-i5-8265u-processor-6m-cache-up-to-3-90-ghz.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://ark.intel.com/content/www/vn/vi/ark/products/149088/intel-core-i5-8265u-processor-6m-cache-up-to-3-90-ghz.html\">Intel&reg; Core&trade; i5-8265U</a>&nbsp;trải</strong><strong>&nbsp;nghiệm thoải m&aacute;i đa t&aacute;c vụ, khai ph&aacute; mọi dữ liệu</strong></h3>\r\n<p>ZenBook 14 được x&acirc;y dựng để mang đến sức mạnh kh&ocirc;ng giới hạn cho trải nghiệm m&aacute;y t&iacute;nh v&ocirc; c&ugrave;ng nhẹ nh&agrave;ng khi di chuyển. Trang bị bộ vi xử l&yacute; Intel&reg; Core&trade; i5-8265U Kabylake Refresh thế hệ thứ 8 mới nhất c&ugrave;ng với tốc độ khởi động ứng dụng si&ecirc;u tốc c&oacute; được từ 256GB SSD NVMe, ZenBook 14 sẽ kh&ocirc;ng bao giờ để bạn phải chờ đợi.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-3.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-3.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>D&ugrave; bạn đang soạn lập t&agrave;i liệu phức tạp, khai ph&aacute; dữ liệu, chỉnh sửa ảnh, bi&ecirc;n tập video hay chỉ đơn giản l&agrave; giải tr&iacute; với một v&aacute;n game, Asus Zenbook 14 UX433FA-A6113T đều cho ph&eacute;p bạn l&agrave;m nhiều hơn v&agrave; nhanh hơn.</p>\r\n<h3><strong><a href=\"https://www.computerworld.com/article/3244347/what-is-windows-hello-microsofts-biometrics-security-system-explained.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.computerworld.com/article/3244347/what-is-windows-hello-microsofts-biometrics-security-system-explained.html\">Window Hello</a>&nbsp;mở kho&aacute; bằng khu&ocirc;n mặt c&ugrave;ng&nbsp;<a href=\"https://cellphones.com.vn/sforum/schannel-amazon-alexa-tro-ly-ao-voi-tiem-nang-danh-bai-siri-va-google-assitant-nay-co-gi-hay\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/schannel-amazon-alexa-tro-ly-ao-voi-tiem-nang-danh-bai-siri-va-google-assitant-nay-co-gi-hay\">trợ l&yacute; ảo Alexa</a>&nbsp;gi&uacute;p bạn thực hiện thao t&aacute;c dễ d&agrave;ng</strong></h3>\r\n<p>Phần cứng sinh trắc học ti&ecirc;n tiến hoạt động liền mạch với Windows Hello v&agrave; Cortana, nhờ đ&oacute; bạn c&oacute; thể đ&aacute;nh thức m&aacute;y t&iacute;nh v&agrave; chỉ cần đăng nhập bằng khu&ocirc;n mặt v&agrave; ra lệnh cho Asus Zenbook 14 bằng giọng n&oacute;i.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 500px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-4.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/laptop/Laptop-Asus-Zenbook-14-UX433FA-A6113T-4.jpg\" /></p>\r\n<p>Th&ecirc;m v&agrave;o đ&oacute;, Alexa bởi Microsoft l&agrave; trợ l&yacute; ảo, sử dụng điện to&aacute;n đ&aacute;m m&acirc;y v&agrave; AI gi&uacute;p bạn thực hiện c&aacute;c c&ocirc;ng việc, giải tr&iacute;, t&igrave;m th&ocirc;ng tin chung, v.v... Chỉ cần y&ecirc;u cầu chơi nhạc, đọc tin tức, điều khiển ng&ocirc;i nh&agrave; th&ocirc;ng minh, kể chuyện cười,... Alexa sẽ trả lời ngay lập tức.</p>\r\n<h3><strong>C&ocirc;ng</strong><strong>&nbsp;nghệ&nbsp;</strong><strong><a href=\"https://www.pcworld.idg.com.au/mediareleases/10909/asus-sonicmaster-composes-new-notebook-audio/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.pcworld.idg.com.au/mediareleases/10909/asus-sonicmaster-composes-new-notebook-audio/\">SonicMaster&nbsp;</a>khuếch</strong><strong>&nbsp;đại&nbsp;</strong><strong>&acirc;m thanh lớn hơn m&agrave; kh&ocirc;ng bị m&eacute;o tiếng</strong></h3>\r\n<p>Để tạo n&ecirc;n c&ocirc;ng nghệ &acirc;m thanh ASUS SonicMaster thế hệ tiếp theo, đội ngũ Golden Ear của ASUS đ&atilde; hợp t&aacute;c với c&aacute;c chuy&ecirc;n gia về hệ thống &acirc;m thanh xe hơi v&agrave; gia đ&igrave;nh lừng danh, Harman Kardon.</p>', 1),
(49, 'SS_Note9', 'Samsung Galaxy Note 9 Xanh đen', 0, 22980000, 15, 110, 0, 1, 35, '52b1d853ed587bff480075187258af89.jpg', '<p>Điện thoại Samsung Galaxy Note 9 &ndash; Smartphone đầu ti&ecirc;n sở hữu b&uacute;t S Pen hỗ trợ Bluetooth c&oacute; thể d&ugrave;ng như điều khiển từ xa</p>', '<p><em><a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-note.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/samsung/galaxy-note.html\"><strong>Galaxy Note</strong></a>&nbsp;lu&ocirc;n l&agrave; d&ograve;ng sản phẩn đầu ti&ecirc;n được&nbsp;<a href=\"https://cellphones.com.vn/mobile/samsung.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/samsung.html\"><strong>Samsung</strong></a>&nbsp;đưa v&agrave;o những c&ocirc;ng nghệ mới hoặc những &yacute; tưởng thiết kế c&aacute;ch t&acirc;n nhất. Tuy nhi&ecirc;n chiếc Note 9 lại đi theo một hướng kh&aacute;c với với tập trung v&agrave;o ho&agrave;n thiện những thứ sẵn c&oacute; v&agrave; đưa ra một số c&ocirc;ng nghệ mới để c&oacute; thể cải thiện trải nghiệm cho người d&ugrave;ng. L&agrave; một người c&oacute; đam m&ecirc; về c&ocirc;ng nghệ cũng như l&agrave; một SamFan ch&acirc;n ch&iacute;nh th&igrave; chiếc si&ecirc;u phẩm&nbsp;<strong>Samsung Galaxy Note 9</strong>&nbsp;sẽ l&agrave; một lựa chọn bạn kh&ocirc;ng n&ecirc;n bỏ qua.</em></p>\r\n<h3><strong>Thiết kế sang trọng với bộ khung nh&ocirc;m v&agrave; hai mặt lưng k&iacute;nh cường lực&nbsp;<a href=\"https://cellphones.com.vn/sforum/gorilla-glass-5-chinh-thuc-ra-mat\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/gorilla-glass-5-chinh-thuc-ra-mat\">Gorilla Glass 5</a></strong></h3>\r\n<p>Nh&igrave;n tổng thể, thiết kế của Note 9 cơ bản vẫn kh&ocirc;ng kh&aacute;c biệt so với Note 8. Kiểu d&aacute;ng chung của m&aacute;y vẫn vậy với khung nh&ocirc;m v&agrave; hai mặt lưng k&iacute;nh cường lực Gorilla Glass 5. Hai m&eacute;p k&iacute;nh mặt trước v&agrave; sau bo cong nhẹ hơn Galaxy S8/S9 v&agrave; c&aacute;c g&oacute;c bo vu&ocirc;ng hơn n&ecirc;n tr&ocirc;ng khỏe khoắn v&agrave; nam t&iacute;nh chứ kh&ocirc;ng mềm mại như d&ograve;ng&nbsp;<a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s.html\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/mobile/samsung/galaxy-s.html\">Galaxy S</a>.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh1.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh1.jpg_1.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, phần cạnh của&nbsp;<strong>Galaxy Note 9</strong>&nbsp;kh&ocirc;ng c&ograve;n bo cong v&agrave;o hai mặt k&iacute;nh v&agrave; b&oacute;ng lo&aacute;ng như phi&ecirc;n bản tiền nhiệm. Samsung đ&atilde; gia tăng độ nh&aacute;m ở phần khung viền, c&aacute;c m&eacute;p cạnh m&agrave;n h&igrave;nh đồng thời cũng được v&aacute;t nhẹ gi&uacute;p cho trải nghiệm cầm nắm được an to&agrave;n hơn, kh&oacute; bị tuột tay hơn với k&iacute;ch thước đồ sộ 6.4 inch của m&igrave;nh.</p>\r\n<h3><strong>Smartphone sở hữu m&agrave;n h&igrave;nh&nbsp;<a href=\"https://www.trustedreviews.com/news/what-is-oled-3285263\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.trustedreviews.com/news/what-is-oled-3285263\">OLED</a>&nbsp;cho khả&nbsp;năng hiển thị tốt</strong></h3>\r\n<p>Một điều đ&aacute;ng khen tr&ecirc;n Note 9 l&agrave; k&iacute;ch thước m&agrave;n h&igrave;nh được n&acirc;ng l&ecirc;n th&agrave;nh 6.4 inch so với tiền nhiệm nhưng k&iacute;ch thước tổng thể kh&ocirc;ng đổi, ch&iacute;nh nhờ Samsung đ&atilde; l&agrave;m cho phần viền cạnh dưới mỏng hơn. Cạnh tr&ecirc;n c&ograve;n lại kh&ocirc;ng đổi khi Samsung n&oacute;i kh&ocirc;ng với m&agrave;n h&igrave;nh tai thỏ (notch) vốn l&agrave; xu hướng thiết kế hiện nay. Về tỉ lệ v&agrave; độ ph&acirc;n giải th&igrave; Note 9 kh&ocirc;ng kh&aacute;c nhiều so với Note 8 khi vẫn sử dụng m&agrave;n h&igrave;nh 18:5:9 k&egrave;m độ ph&acirc;n giải 2960x1440 pixels sắc n&eacute;t.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh2.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh2.jpg_1.jpg\" /></p>\r\n<p>Tất nhi&ecirc;n về chất lượng hiện thị th&igrave; Note 9 vẫn l&agrave; một trong những mẫu smartphone c&oacute; m&agrave;n h&igrave;nh OLED tốt nhất hiện nay. Theo đ&aacute;nh gi&aacute; Display Mate, m&aacute;y c&oacute; độ ch&iacute;nh x&aacute;c m&agrave;u tuyệt đối v&agrave; khả năng hiện thị m&agrave;u sắc ch&iacute;nh x&aacute;c nhất, độ s&aacute;ng tăng cao hơn 27% so với Note 8 v&agrave; độ tương phản l&agrave; 32 %. Tr&ecirc;n thực tế, Note 9 mang đến trải nghiệm ho&agrave;n hảo tr&ecirc;n mọi g&oacute;c cạnh, m&agrave;n h&igrave;nh lớn khi kết hợp c&ugrave;ng m&agrave;u sắc sống động gi&uacute;p cho những trải nghiệm khi xem phim hay chơi game đều thật sự tuyệt hảo.</p>\r\n<h3><strong>B&uacute;t S Pen được kết nối&nbsp;<a href=\"https://cellphones.com.vn/sforum/bluetooth-5-1-ra-mat-ho-tro-them-dinh-vi-va-dieu-huong-chinh-xac-den-tung-centimet\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/bluetooth-5-1-ra-mat-ho-tro-them-dinh-vi-va-dieu-huong-chinh-xac-den-tung-centimet\">Bluetooth</a>&nbsp;chỉ cần sạc 40 gi&acirc;y cho thời gian sử dụng 30 ph&uacute;t</strong></h3>\r\n<p>Một điểm đặc biệt l&agrave; b&uacute;t S Pen mới đ&atilde; được bổ sung kết nối Bluetooth để sử dụng điều khiển từ xa cho một số ứng dụng tr&ecirc;n điện thoại như chuyển chế độ chụp v&agrave; chụp ảnh, nghe nhạc, ghi &acirc;m, di chuyển tới lui khi xem ảnh v&agrave; điều khiển slide tr&igrave;nh chiếu PowerPoint, &hellip; S Pen đ&atilde; trở n&ecirc;n đa dụng hơn v&agrave; đến được với số người dụng hơn, kh&ocirc;ng chỉ hữu &iacute;ch với nh&oacute;m người cần vẽ vời hay viết ghi ch&uacute; nữa. B&acirc;y giờ bạn đ&atilde; c&oacute; thể tự sướng kh&ocirc;ng lo rung tay hay c&oacute; để điều khiển file thuyết tr&igrave;nh ngay tr&ecirc;n Note 9 với sự hỗ trợ của&nbsp;<a href=\"https://www.samsung.com/vn/apps/samsung-dex/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.samsung.com/vn/apps/samsung-dex/\">DeX&nbsp;</a>HDMI&nbsp;v&agrave; b&uacute;t S Pen m&agrave; kh&ocirc;ng cần d&ugrave;ng đến laptop nữa.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh3.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh3.jpg_1.jpg\" /></p>\r\n<p><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh3.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh3.jpg_1.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"Khi nghe tin r&ograve; rỉ b&uacute;t S Pen hỗ trợ Bluetooth, nhiều người đ&atilde; lo ngại vấn đề sạc pin của n&oacute;. Thực tế th&igrave; S Pen khing d&ugrave;ng pin m&agrave; d&ugrave;ng si&ecirc;u tụ điện, c&oacute; thể sạc đầy chỉ trong 40 gi&acirc;y sau khi đ&uacute;t v&agrave;o m&aacute;y theo như c&ocirc;ng bố của Samsung. Mỗi lần sạc b&uacute;t đủ d&ugrave;ng trong 30 ph&uacute;t ở chế độ kết nỗi Bluetooth với điện thoại, tương đương 200 lần bấm. Khi hết pin, b&uacute;t vẫn c&oacute; thể sử dụng c&aacute;c chức năng th&ocirc;ng thường như viết, vẽ, tin nhắn động, &hellip;  Camera được t&iacute;ch hợp c&ocirc;ng nghệ Dual Pixel cho khả năng chụp ảnh thiếu s&aacute;ng ấn tượng Với sự kết hợp của AI (tr&iacute; th&ocirc;ng minh nh&acirc;n tạo) th&igrave; camera Note 9 sẽ mang đến chất lượng h&igrave;nh ảnh kh&aacute; ấn tượng sau khoảng thời gian sử dụng. Khả năng nhận dạng kh&aacute; nhanh ch&oacute;ng c&aacute;c trường hợp thường thấy ở smartphone như ống k&iacute;nh bị ẩn, ph&aacute;t hiện ra chủ thể đang nhắm mắt.\" alt=\"\" data-cke-saved-src=\"Khi nghe tin r&ograve; rỉ b&uacute;t S Pen hỗ trợ Bluetooth, nhiều người đ&atilde; lo ngại vấn đề sạc pin của n&oacute;. Thực tế th&igrave; S Pen khing d&ugrave;ng pin m&agrave; d&ugrave;ng si&ecirc;u tụ điện, c&oacute; thể sạc đầy chỉ trong 40 gi&acirc;y sau khi đ&uacute;t v&agrave;o m&aacute;y theo như c&ocirc;ng bố của Samsung. Mỗi lần sạc b&uacute;t đủ d&ugrave;ng trong 30 ph&uacute;t ở chế độ kết nỗi Bluetooth với điện thoại, tương đương 200 lần bấm. Khi hết pin, b&uacute;t vẫn c&oacute; thể sử dụng c&aacute;c chức năng th&ocirc;ng thường như viết, vẽ, tin nhắn động, &hellip;  Camera được t&iacute;ch hợp c&ocirc;ng nghệ Dual Pixel cho khả năng chụp ảnh thiếu s&aacute;ng ấn tượng Với sự kết hợp của AI (tr&iacute; th&ocirc;ng minh nh&acirc;n tạo) th&igrave; camera Note 9 sẽ mang đến chất lượng h&igrave;nh ảnh kh&aacute; ấn tượng sau khoảng thời gian sử dụng. Khả năng nhận dạng kh&aacute; nhanh ch&oacute;ng c&aacute;c trường hợp thường thấy ở smartphone như ống k&iacute;nh bị ẩn, ph&aacute;t hiện ra chủ thể đang nhắm mắt.\" /><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh4.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh4.jpg_1.jpg\" /></p>\r\n<p>Sở hữu khẩu độ cao, khả năng t&ugrave;y chỉnh khẩu độ theo từng m&ocirc;i trường &aacute;nh s&aacute;ng. Note 9 kh&ocirc;ng kh&oacute; để l&agrave;m chủ những khung h&igrave;nh thiếu s&aacute;ng. Độ chi tiết vẫn thể hiện kh&aacute; tốt, m&agrave;u sắc kh&ocirc;ng bị bệch. Ngo&agrave;i ra với lợi thế từ c&ocirc;ng nghệ Dual Pixel t&iacute;ch hợp b&ecirc;n trong cảm biến ảnh của Note 9, tốc độ chụp trong điều kiện thiếu s&aacute;ng vẫn đảm bảo chủ thể kh&ocirc;ng bị rung, nh&egrave;o khi đang di chuyển.</p>\r\n<h3><strong>Cấu h&igrave;nh mạnh khi sở hữu chip&nbsp;<a href=\"https://cellphones.com.vn/sforum/exynos-9810-vuot-moc-4-000-diem-don-loi-trong-bai-kiem-tra-hieu-nang-cua-geekbench\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/exynos-9810-vuot-moc-4-000-diem-don-loi-trong-bai-kiem-tra-hieu-nang-cua-geekbench\">Exynos 9810</a>&nbsp;v&agrave; thời lượng pin l&ecirc;n đến 4000 mAh</strong></h3>\r\n<p>Với những g&igrave; ưu t&uacute; v&agrave; mạnh mẽ nhất th&igrave; Samsung đ&atilde; trang bị cho Note 9 bộ vi xử l&yacute; Exynos 9810 k&egrave;m theo đ&oacute; l&agrave; bộ nhớ RAM 6 GB cho phi&ecirc;n bản 128 GB v&agrave; 8 GB cho phi&ecirc;n bản 512 GB. Thừa sức để đ&aacute;p ứng cho người d&ugrave;ng ở mọi thao t&aacute;c d&ugrave; l&agrave; những tựa game nặng k&yacute; nhất hiện nay th&igrave; mọi thứ vẫn rất mượt m&agrave;.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 560px; width: 840px;\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh5.jpg_1.jpg\" alt=\"\" data-cke-saved-src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/samsung-galaxy-note-9-hinh5.jpg_1.jpg\" /></p>\r\n<p><img src=\"Kh&ocirc;ng những thế, Note 9 c&ograve;n sở hữu dung lượng pin khủng l&ecirc;n đến 4000 mAh gi&uacute;p cho người d&ugrave;ng c&oacute; thể tự tin bật Wi-Fi v&agrave; 4G li&ecirc;n tục. Với nhu cầu sử dụng h&agrave;ng ng&agrave;y th&igrave; th&ocirc;ng thường 1 ng&agrave;y rưỡi đến 2 ng&agrave;y mới phải sạc một lần. C&oacute; thể n&oacute;i đ&acirc;y l&agrave; yếu tố rất đ&aacute;ng gi&aacute; v&igrave; phần lớn smartphone cao cấp hiện tại chỉ c&oacute; thời lượng pin trung b&igrave;nh chứ kh&ocirc;ng qu&aacute; thoải m&aacute;i sử dụng.  Mua Samsung Galaxy Note 9 gi&aacute; ưu đ&atilde;i chỉ c&oacute; tại CellphoneS Cả về thiết kế, hiệu năng, camera lẫn b&uacute;t S Pen đều được Samsung trau chuốt từng ch&uacute;t một, tạo n&ecirc;n một khối thống nhất ho&agrave;n hảo v&agrave; kh&aacute;c biệt hơn bất kỳ mẫu m&aacute;y cao cấp n&agrave;o tr&ecirc;n thị trường hiện nay. Hiện tại CellphoneS đang c&oacute; mức gi&aacute; hết sức ưu đ&atilde;i d&agrave;nh cho sản phẩm Samsung Galaxy Note 10 c&ugrave;ng với đ&oacute; l&agrave; thời gian bảo h&agrave;nh d&agrave;i hạn l&ecirc;n đến 12 th&aacute;ng từ ng&agrave;y qu&yacute; kh&aacute;ch mua sản phẩm.\" alt=\"\" data-cke-saved-src=\"Kh&ocirc;ng những thế, Note 9 c&ograve;n sở hữu dung lượng pin khủng l&ecirc;n đến 4000 mAh gi&uacute;p cho người d&ugrave;ng c&oacute; thể tự tin bật Wi-Fi v&agrave; 4G li&ecirc;n tục. Với nhu cầu sử dụng h&agrave;ng ng&agrave;y th&igrave; th&ocirc;ng thường 1 ng&agrave;y rưỡi đến 2 ng&agrave;y mới phải sạc một lần. C&oacute; thể n&oacute;i đ&acirc;y l&agrave; yếu tố rất đ&aacute;ng gi&aacute; v&igrave; phần lớn smartphone cao cấp hiện tại chỉ c&oacute; thời lượng pin trung b&igrave;nh chứ kh&ocirc;ng qu&aacute; thoải m&aacute;i sử dụng.  Mua Samsung Galaxy Note 9 gi&aacute; ưu đ&atilde;i chỉ c&oacute; tại CellphoneS Cả về thiết kế, hiệu năng, camera lẫn b&uacute;t S Pen đều được Samsung trau chuốt từng ch&uacute;t một, tạo n&ecirc;n một khối thống nhất ho&agrave;n hảo v&agrave; kh&aacute;c biệt hơn bất kỳ mẫu m&aacute;y cao cấp n&agrave;o tr&ecirc;n thị trường hiện nay. Hiện tại CellphoneS đang c&oacute; mức gi&aacute; hết sức ưu đ&atilde;i d&agrave;nh cho sản phẩm Samsung Galaxy Note 10 c&ugrave;ng với đ&oacute; l&agrave; thời gian bảo h&agrave;nh d&agrave;i hạn l&ecirc;n đến 12 th&aacute;ng từ ng&agrave;y qu&yacute; kh&aacute;ch mua sản phẩm.\" /></p>\r\n<p>Kh&ocirc;ng những thế, Note 9 c&ograve;n sở hữu dung lượng pin khủng l&ecirc;n đến 4000 mAh gi&uacute;p cho người d&ugrave;ng c&oacute; thể tự tin bật Wi-Fi v&agrave;&nbsp;<a href=\"https://cellphones.com.vn/sforum/mang-4g-la-gi-toc-do-co-that-su-vuot-troi-hon-3g\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://cellphones.com.vn/sforum/mang-4g-la-gi-toc-do-co-that-su-vuot-troi-hon-3g\">4G</a>&nbsp;li&ecirc;n tục. Với nhu cầu sử dụng h&agrave;ng ng&agrave;y th&igrave; th&ocirc;ng thường 1 ng&agrave;y rưỡi đến 2 ng&agrave;y mới phải sạc một lần. C&oacute; thể n&oacute;i đ&acirc;y l&agrave; yếu tố rất đ&aacute;ng gi&aacute; v&igrave; phần lớn smartphone cao cấp hiện tại chỉ c&oacute; thời lượng pin trung b&igrave;nh chứ kh&ocirc;ng qu&aacute; thoải m&aacute;i sử dụng.</p>\r\n<h3><strong>Mua Samsung Galaxy Note 9 gi&aacute; ưu đ&atilde;i&nbsp;</strong></h3>\r\n<p>Cả về thiết kế, hiệu năng, camera lẫn b&uacute;t S Pen đều được Samsung trau chuốt từng ch&uacute;t một, tạo n&ecirc;n một khối thống nhất ho&agrave;n hảo v&agrave; kh&aacute;c biệt hơn bất kỳ mẫu m&aacute;y cao cấp n&agrave;o tr&ecirc;n thị trường hiện nay. Hiện tại CellphoneS đang c&oacute; mức gi&aacute; hết sức ưu đ&atilde;i d&agrave;nh cho sản phẩm Samsung Galaxy Note 10 c&ugrave;ng với đ&oacute; l&agrave; thời gian bảo h&agrave;nh d&agrave;i hạn l&ecirc;n đến 12 th&aacute;ng từ ng&agrave;y qu&yacute; kh&aacute;ch mua sản phẩm.</p>', 1),
(51, 'R_N7_Pink', 'Redmi Note 7 32GB Pink', 0, 4990000, 10, 124, 0, 1, 24, '06488aaef1d138e77c10e4c750305f1c.jpg', '<p>Cấu h&igrave;nh đỉnh gi&aacute; bất ngờ</p>', '<h2><a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-7\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-7\">Xiaomi Redmi Note 7</a>&nbsp;l&agrave; chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd\">smartphone</a>&nbsp;gi&aacute; rẻ mới được giới thiệu v&agrave;o đầu năm 2019 với nhiều trang bị đ&aacute;ng gi&aacute; như&nbsp;thiết kế notch giọt nước hay camera l&ecirc;n tới 48 MP.</h2>\r\n<h3>Hiệu năng mạnh mẽ trải nghiệm game mượt m&agrave;</h3>\r\n<p>Redmi Note 7 xứng đ&aacute;ng l&agrave; một trong những chiếc smartphone c&oacute; hiệu năng tốt, với điểm Antutu đo được khoảng 137586.</p>\r\n<p><img style=\"height: 433px; width: 780px;\" src=\"https://cdn.tgdd.vn/Products/Images/42/167535/Slider/vi-vn-xiaomi-redmi-note-7-thietke.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.tgdd.vn/Products/Images/42/167535/Slider/vi-vn-xiaomi-redmi-note-7-thietke.jpg\" />Nhờ được cung cấp sức mạnh bởi con chip Snapdragon 660 c&ugrave;ng RAM 4 GB, m&aacute;y chiến mượt m&agrave; c&aacute;c d&ograve;ng game hiện n&agrave;y với cấu h&igrave;nh tầm trung hoặc cao (tuỳ game) như Li&ecirc;n Qu&acirc;n, PUBG,...</p>\r\n<p>Giao diện trực quan dễ sử dụng, c&oacute; thể tuỳ chỉnh ph&iacute;m điều hướng cũng l&agrave; một ưu điểm của m&aacute;y.</p>\r\n<h3>Thiết kế hiện đại, theo xu thế</h3>\r\n<p>Chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd-xiaomi\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd-xiaomi\">điện thoại Xiaomi</a>&nbsp;mới l&agrave; một sự lột x&aacute;c ho&agrave;n to&agrave;n về thiết kế so với c&aacute;c d&ograve;ng Redmi trước đ&acirc;y.<img style=\"height: 533px; width: 800px;\" src=\"https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-tgdd-4.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-tgdd-4.jpg\" /></p>\r\n<p>M&aacute;y sở hữu cho m&igrave;nh&nbsp;mặt lưng bằng kính ph&ocirc;́i màu gradient, mang lại cho m&aacute;y cảm gi&aacute;c cao cấp v&agrave; sang trọng hơn rất nhiều.</p>\r\n<p>4 g&oacute;c m&aacute;y được tăng cường độ bền đ&aacute;ng kể gi&uacute;p chống vỡ k&iacute;nh gấp 4 lần so với c&aacute;c smartphone kh&aacute;c tr&ecirc;n thị trường hiện nay.</p>\r\n<h3>M&agrave;n h&igrave;nh giọt nước th&iacute;ch mắt</h3>\r\n<p>Xiaomi Redmi Note 7 sở hữu m&agrave;n h&igrave;nh 6.3 inch của c&oacute; tỷ lệ khung h&igrave;nh 19.5:9,&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178#fullhd\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178#fullhd\">độ ph&acirc;n giải Full HD+</a>(2.340 x 1.080 pixel).</p>\r\n<p><img style=\"height: 533px; width: 800px;\" src=\"https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-tgdd-1.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.tgdd.vn/Products/Images/42/167535/xiaomi-redmi-note-7-tgdd-1.jpg\" /></p>\r\n<h3>Camera chất lượng tốt trong tầm gi&aacute;</h3>\r\n<p>Xiaomi Redmi Note 7 trở th&agrave;nh chiếc điện thoại c&oacute; camera \"khủng\" gi&aacute; rẻ nhất tr&ecirc;n thị trường hiện nay với \"số chấm\" l&ecirc;n tới&nbsp;&nbsp;48 MP.</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hieusp`
--

CREATE TABLE `hieusp` (
  `idhieusp` int(11) NOT NULL,
  `tenhieusp` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tinhtrang` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `hieusp`
--

INSERT INTO `hieusp` (`idhieusp`, `tenhieusp`, `keyword`, `tinhtrang`, `logo`) VALUES
(1, 'Lenovo', 'laptop,pc,phukien,dienthoai', '1', 'lenovo.png'),
(3, 'Apple', 'laptop,pc,phukien,dienthoai', '1', 'apple.png'),
(5, 'Western Green', 'phukien', '1', ''),
(6, 'Allien Ware', 'Laptop', '1', 'alienware_thinkpro.png'),
(9, 'Microsoft', 'laptop,pc', '1', 'logomicrosoftthinkpro1.png'),
(10, 'Lynksys', 'phukien', '1', ''),
(12, 'HP', 'laptop,pc', '1', 'hp.png'),
(13, 'Logitech', 'phukien', '1', ''),
(14, 'Fulhen', 'phukien', '1', ''),
(15, 'Anker', 'phukien', '1', ''),
(16, 'Asus', 'laptop,pc,dienthoai', '1', 'logo_asus_thinkpro1.png'),
(17, 'HTC', 'dienthoai,phukien', '2', ''),
(18, 'LG', 'dienthoai,phukien', '2', '800pxlg_logo_2015_svg_1.png'),
(19, 'Oppo', 'dienthoai,phukien', '2', ''),
(20, 'Razer', 'laptop,pc', '1', 'razer.png'),
(21, 'ThinkPad', 'laptop,pc', '1', 'thinkpad.png'),
(22, 'MSI', 'laptop,pc', '1', 'logo_msi_thinkpro.png'),
(23, 'DELL', 'laptop,pc', '1', 'dell.png'),
(24, 'Xiaomi', 'dienthoai,phukien', '1', ''),
(25, 'Vivo', 'dienthoai,phukien', '1', ''),
(26, 'Realme', 'dienthoai,phukien', '1', ''),
(27, 'Vsmart', 'dienthoai,phukien', '1', 'logo_vsmart.png'),
(28, 'Huawei', 'dienthoai,maytinhbang,phukien', '1', ''),
(29, 'Nokia', 'dienthoai', '1', ''),
(30, 'Mantiz Innovation', 'phukien', '1', ''),
(31, 'Acer', 'laptop,pc,phukien', '1', 'acerlogo.png'),
(35, 'SamSung', 'dienthoai, maytinhbang', '1', 'logo-samsung.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `mskh` int(11) NOT NULL,
  `hotenkh` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  `diachi` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `dienthoai` varchar(13) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT 3,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`mskh`, `hotenkh`, `username`, `password`, `email`, `createdate`, `diachi`, `dienthoai`, `role`, `status`) VALUES
(1, 'Ngô Trung Vinh', 'vinhngo1999', 'vinhngo123', 'vinhtrungngo1999@gmail.com', '2020-05-12 09:40:45', 'Hà Nội: Số 105 ngõ 562 đường Láng, P. Láng Hạ, Q. Đống Đa, Hà Nội', '0995094072', 3, 1),
(13, 'Hiệp Gà', 'hiep1998', '1234567', 'vanhiepp1998@gmail.com', '2020-05-17 11:04:32', '157-159 Nguyễn Thị Minh Khai, P. Phạm Ngũ Lão, Q. 1', '0981643651', 3, 1),
(26, 'Trần Thanh Tuy', '', '', 'tuytranthanh1919@gmail.com', '2020-06-07 11:50:03', '11, Nguyễn Trãi, p.Soc Sang, h.Cờ Đỏ, q.Ba Vì, tp.Bình Minh', '090305146', 3, 1),
(27, 'Thành Thành', '', '', 'thanhthanh20@gmail.com', '2020-06-07 11:52:25', '33, Đường số 14, p.Cuc Lạc, tp.Soc Ra Lang', '033564616', 3, 1),
(28, 'Thanh Sơn', '', '', 'thanhson89@gmail.com', '2020-06-07 12:03:15', '46, Lê Lơi, Bến Thành', '0903121564', 3, 1),
(29, 'Bảo bự', '', '', 'baobu@gmail.com', '2020-06-18 09:14:08', '30, Nam kỳ khởi nghĩa', '0932323252', 3, 1),
(30, 'Ngô Trung Vinh', 'vinh1998', 'fcea920f7412b5da7be0cf42b8c93759', 'vinhngotrung1999@gmail.com', '2020-06-25 13:31:28', 'Số 29 đường 3/2, q.Bà Vì, tp.Lang Mang', '0985657410', 3, 1),
(57, 'Ngô Trung Vinh', 'vinhngo1999', 'fcea920f7412b5da7be0cf42b8c93759', 'vinhtrungngo1907@gmail.com', '2020-07-01 00:00:06', 'ấddadsa', '0932323252', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giảm giá',
  `discount` int(11) NOT NULL COMMENT 'Số tiền',
  `limit_number` int(11) NOT NULL COMMENT 'giới hạn lượt mua',
  `number_used` int(11) NOT NULL COMMENT 'Số lượng đã nhập',
  `expiration_date` date NOT NULL COMMENT 'Ngày hết hạn',
  `payment_limit` int(11) NOT NULL COMMENT 'giới hạn đơn hàng tối thiểu',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả',
  `created` date NOT NULL,
  `orders` int(11) NOT NULL,
  `trash` int(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khuyenmai`
--

INSERT INTO `khuyenmai` (`id`, `code`, `discount`, `limit_number`, `number_used`, `expiration_date`, `payment_limit`, `description`, `created`, `orders`, `trash`, `status`) VALUES
(1, 'MAHETLUOT', 100000, 30, 30, '2019-09-29', 500000, 'Giam 100000', '2019-06-10', 1, 1, 1),
(2, 'VANHIEP', 200000, 20, 3, '2019-06-12', 500000, 'Giam 200k', '2019-06-10', 1, 0, 1),
(3, 'VANHIEP123', 200000, 300, 103, '2019-07-20', 300000, 'giảm 200k', '2019-06-25', 1, 1, 1),
(4, 'MAHETHAN', 150000, 68, 23, '2019-06-30', 500000, 'giảm 300k', '2019-06-25', 1, 1, 1),
(13, 'CAOTHANG', 150000, 200, 0, '2019-07-26', 100000, 'Giảm 150k', '2019-07-06', 1, 1, 1),
(18, 'VDWI8XESTNCH', 100000, 1, 0, '2020-06-06', 0, 'Mã giảm giá 100.000 đ tự động khi đăng ký thành công', '2020-05-06', 0, 1, 1),
(19, 'XCABSMESZ1RV', 100000, 1, 0, '2020-06-28', 0, 'Mã giảm giá 100.000 đ tự động khi đăng ký thành công', '2020-05-28', 0, 1, 1),
(20, 'VINHNGO', 100000, 100, 0, '2020-07-01', 100000, '<p>M&atilde; giảm gi&aacute; 100.000 đ tự động khi đăng k&yacute; th&agrave;nh c&ocirc;ng</p>', '0000-00-00', 0, 0, 1),
(22, 'CELLPHONES', 0, 0, 0, '2020-07-11', 0, '<p>adsdsasd</p>', '0000-00-00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id_lienhe` int(11) NOT NULL,
  `title` varchar(68) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `hoten` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id_lienhe`, `title`, `phone`, `email`, `content`, `created_at`, `status`, `hoten`) VALUES
(1, 'Câu hỏi', '099509407222', 'vinh@gmail.com', 'Thời giàn giao hang trong Quận 12 là bào nhiê', '2020-05-16 21:58:29', 1, 'Ngô Trung Vinh'),
(2, 'Câu hỏi', '099509407222', 'vinh@gmail.com', 'Thời giàn giao hang trong Quận 12 là bào nhiê', '2020-05-15 21:58:42', 0, 'Ngô Trung Vinh'),
(3, 'Shop', '0981643651', 'vanhiepp19988@gmail.com', 'Shop 12 21', '2020-05-30 22:19:41', 1, 'Ngô Văn Hiệp'),
(4, 'Câu hỏi\r\n', '090305078', 'luong@gmail.com', 'Thời giàn giao hang trong Quận 12 là bào nhiêu', '2020-04-04 22:20:41', 1, 'Nguyễn Đức Lương'),
(5, 'Yêu cầu', '090305078', 'luong@gmail.com', 'Chào shop', '2020-05-29 22:22:04', 1, 'Lương'),
(6, 'Câu hỏi', '', 'hiep1998@gmail.com', 'Giá ship quận gò vấp bao nhiêu', '2020-05-10 23:58:29', 1, 'Hiệp Gà'),
(7, 'Câu hỏi', '0981643651', 'hiepga@gmail.com', 'Cách thức mua hàng online như thế nào?', '2020-05-23 14:10:11', 1, 'Hiệp Gà'),
(8, 'Đặt hàng', '09898918890', 'user@gmail.com', 'Đơn hàng order nước ngoài như thế nào', '2020-05-22 14:11:45', 1, 'Khách vãng lai'),
(9, '', '09898918890', 'fdsdfsfsfd', 'dsfdssdfsf', '2020-05-16 09:34:01', 1, 'dfsfdf'),
(10, 'aSAas', '099509407222', 'vinhtrungngo1907@gmail.com', 'dasdsadsad', '0000-00-00 00:00:00', 1, 'Nguyễn Văn Hiệp2019');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `idnhacc` int(11) NOT NULL,
  `tennhacc` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`idnhacc`, `tennhacc`, `code`, `keyword`, `created_at`, `status`) VALUES
(1, 'Digiworld', 'DIGIWORLD', 'dienthoai,laptop', '2020-05-16 09:34:01', 1),
(2, 'Nhà cung cấp di động gò vấp', 'GOVAPPRODUCER', 'dienthoai,laptop,phukien', '2020-05-17 09:35:00', 1),
(3, 'CÔNG TY THẾ GIỚI DI ĐỘNG', 'TGDDCODE', 'dienthoai,laptop,pc-workstation', '2020-05-30 09:36:37', 1),
(4, 'CellPhones', 'CELLPHONES', 'phụ kiện', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `msnv` int(11) NOT NULL,
  `hotennv` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `chucvu` int(11) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`msnv`, `hotennv`, `username`, `password`, `chucvu`, `img`, `email`, `phone`, `diachi`, `gender`, `status`, `created`) VALUES
(1, 'Quản lý', 'admin', 'admin123', 1, 'quanly.png', 'admin@gmail.com', '0985657410', 'TP HCM: Số 62 Duy Tân, Phường 15, Q.Phú Nhuận, TP HCM', 1, 1, '2020-05-16 03:50:55'),
(2, 'Nguyễn Văn A', 'nhanviena', '1234567', 2, 'nhanvien.png', 'nva@gmail.com', '0985657410', 'Hà Nội: 69 Phố Vọng, Phường Đồng Tâm, Quận Hai Bà Trưng, TP.Hà Nội', 1, 1, '2020-05-17 01:47:35'),
(3, 'Nguyễn Văn Hiệp', 'hiepnguyen2019', '1234567', 2, 'employee.png', 'hiep2019@gmail.com', '01289819981', 'Hà Nội: 69 Phố Vọng, Phường Đồng Tâm, Quận Hai Bà Trưng, TP.Hà Nội', 1, 1, '2020-05-17 02:01:15');

--
-- Bẫy `nhanvien`
--
DELIMITER $$
CREATE TRIGGER `insertUser` AFTER DELETE ON `nhanvien` FOR EACH ROW INSERT INTO user_account VALUES(null,old.msnv,old.username,old.password,old.chucvu,now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateUser` AFTER UPDATE ON `nhanvien` FOR EACH ROW INSERT INTO user_account VALUES(null,new.msnv,new.username,new.password,new.chucvu,now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomhanghoa`
--

CREATE TABLE `nhomhanghoa` (
  `manhom` int(11) NOT NULL,
  `tennhom` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomhanghoa`
--

INSERT INTO `nhomhanghoa` (`manhom`, `tennhom`, `status`, `created`) VALUES
(1, 'SmartPhone', 1, '2020-05-10 07:43:26'),
(2, 'Laptop', 1, '2020-05-10 07:42:54'),
(3, 'PC-WorkStation', 1, '2020-05-10 07:43:06'),
(4, 'Phụ Kiện', 1, '2020-05-10 07:42:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `idslider` int(11) NOT NULL,
  `tenslider` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `hinh` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`idslider`, `tenslider`, `hinh`, `status`) VALUES
(1, 'slider trang 1', 'thumb_1.png', 1),
(2, 'slider trang 2', 'thumb_2.png', 1),
(3, 'slider trang 3', 'thumb_3.png', 1),
(6, 'slider trang 4', 'thumb_4.png', 1),
(7, 'slider trang 5', 'thumb_5.png', 1),
(8, 'slider trang 6', 'thumb_6.png', 1),
(9, 'slider trang 7', 'thumb_7.png', 1),
(10, 'slider trang 8', 'thumb_8.png', 1),
(11, 'slider trang 9', 'thumb_9.png', 1),
(12, 'slider trang 10', 'thumb_10.png', 1),
(16, 'slider trang 11', 'thumb_11.png', 1),
(17, 'asdadsadad', 'banner-samsungs10.png', 1),
(18, 'sadadasda', 'iphone-banner.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

CREATE TABLE `tintuc` (
  `mstt` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `introtext` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `fullcontent` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tintuc`
--

INSERT INTO `tintuc` (`mstt`, `title`, `introtext`, `fullcontent`, `img`, `created`, `modified`, `status`) VALUES
(1, 'Bất chấp lệnh cấm, doanh số smartphone của Huawei vẫn tăng 130% ở Trung Quốc', '<p>Điều n&agrave;y cho thấy ảnh hưởng từ cuộc chiến tranh thương mại Mỹ - Trung l&ecirc;n thị trường Trung Quốc l&agrave; kh&ocirc;ng đ&aacute;ng kể.</p>', '<p>Kể từ khi ch&iacute;nh phủ Hoa Kỳ đưa&nbsp;<a href=\"https://fptshop.com.vn/dien-thoai/huawei\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://fptshop.com.vn/dien-thoai/huawei\">Huawei</a>&nbsp;v&agrave;o &ldquo;danh s&aacute;ch đen&rdquo;, rất nhiều c&ocirc;ng ty như Google Intel, Qualcomm v&agrave; ARM,... đều cũng đ&atilde; l&ecirc;n tiếng x&aacute;c nhận ngừng hợp t&aacute;c với nh&agrave; sản xuất đến từ Trung Quốc n&agrave;y.</p>\r\n<p>Ngo&agrave;i ra, c&aacute;c hiệp hội như Wi-Fi Alliance, hiệp hội b&aacute;n dẫn JEDEC, SDA (Hiệp hội SD) v&agrave; ti&ecirc;u chuẩn PCIe cũng hủy bỏ tư c&aacute;ch th&agrave;nh vi&ecirc;n của Huawei. Người ta tin rằng t&igrave;nh trạng n&agrave;y sẽ l&agrave;m sụp đổ hoạt động kinh doanh của Huawei ngay cả ở thị trường qu&ecirc; nh&agrave; Trung Quốc. Tuy nhi&ecirc;n, dường như lệnh cấm của Mỹ đang khuyến kh&iacute;ch người Trung Quốc chọn mua smartphone của nh&agrave; sản xuất Trung Quốc n&agrave;y.</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img style=\"height: 650px; width: 300px;\" src=\"https://fptshop.com.vn/uploads/images/tin-tuc/84115/Originals/Huawei-dat-doanh-thu-khung-tren-Tmall-2.jpg\" alt=\"\" data-cke-saved-src=\"https://fptshop.com.vn/uploads/images/tin-tuc/84115/Originals/Huawei-dat-doanh-thu-khung-tren-Tmall-2.jpg\" /></p>\r\n<p>Cụ thể, sau lệnh cấm của Mỹ đối với Huawei v&agrave;o ng&agrave;y 16 th&aacute;ng 5, doanh số của điện thoại th&ocirc;ng minh Huawei tr&ecirc;n nền tảng Tmall đ&atilde; tăng mạnh. Theo dữ liệu ch&iacute;nh thức từ Tmall, từ ng&agrave;y 18 đến 20 th&aacute;ng 5, c&aacute;c l&ocirc; h&agrave;ng điện thoại di động của Huawei từ Tmall đ&atilde; tăng 130%, vượt mức tăng trưởng trung b&igrave;nh của ng&agrave;nh smartphone n&oacute;i chung tới 30%. V&agrave; để &ldquo;ăn mừng&rdquo; điều n&agrave;y, Huawei cũng đ&atilde; đăng tải một tấm poster để &ldquo;chia vui&rdquo; c&ugrave;ng người d&ugrave;ng.</p>\r\n<p>Để đạt được điều n&agrave;y l&agrave; do Trung Quốc gần như l&agrave; một thị trường kh&eacute;p k&iacute;n với c&aacute;c dịch vụ &ldquo;tự cung tự cấp&rdquo; v&agrave; kh&ocirc;ng hề dựa dẫm qu&aacute; nhiều v&agrave;o m&ocirc;i trường b&ecirc;n ngo&agrave;i. Do đ&oacute; ảnh hưởng từ lệnh cấm vận của Mỹ l&ecirc;n thị trường tỷ d&acirc;n n&agrave;y l&agrave; kh&ocirc;ng đ&aacute;ng kể v&agrave; Huawei ho&agrave;n to&agrave;n c&oacute; thể l&agrave;m chủ t&igrave;nh h&igrave;nh ở ngay tại thị trường nội địa m&agrave; kh&ocirc;ng gặp bất cứ vấn đề n&agrave;o.</p>\r\n<p><strong>Theo:&nbsp;</strong><em><a href=\"http://www.gizchina.com/2019/05/24/huawei-smartphone-shipment-grows-despite-us-ban/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"http://www.gizchina.com/2019/05/24/huawei-smartphone-shipment-grows-despite-us-ban/\">Gizchina</a></em></p>', 'huawei-hongmeng-os_800x450.jpg', '2019-05-26 23:18:02', '2019-06-23 18:03:27', 1),
(2, 'Sắm Galaxy A50, Sắm Galaxy A50, \"bá chủ\" bán chạy tầm trung, tặng thêm quà Samsung chính hãng	', '', '<p>Cụ thể hơn, khi mua&nbsp;Samsung Galaxy A50 ngay b&acirc;y giờ bạn sẽ nhận được c&aacute;c ưu đ&atilde;i cực kỳ hấp dẫn sau:</p>\r\n<ul>\r\n<li>Tặng sạc nhanh dự ph&ograve;ng 10.000 mAh ch&iacute;nh h&atilde;ng Samsung (hỗ trợ t&iacute;nh năng sạc nhanh).</li>\r\n<li>Giảm ngay 300.000 đồng qua qu&agrave; tặng Galaxy (Kh&ocirc;ng &aacute;p dụng chương tr&igrave;nh thu cũ đổi mới).</li>\r\n<li>Giảm th&ecirc;m 3%, tức khoảng 210.000 đồng cho<a href=\"https://www.thegioididong.com/tin-tuc/uu-dai-sinh-nhat-giam-soc-den-40--nhanh-tay-nao-ban--1168670\" target=\"_blank\" rel=\"noopener noreferrer\">&nbsp;kh&aacute;ch mua online c&oacute; sinh nhật trong th&aacute;ng 6</a>&nbsp;(Kh&ocirc;ng &aacute;p dụng chương tr&igrave;nh thu cũ đổi mới, trả g&oacute;p 0%).</li>\r\n<li>Đổi m&aacute;y cũ l&ecirc;n đời A50 tiết kiệm đến 7.000.000 đồng, &aacute;p dụng từ ng&agrave;y 1/6 đến 30/6​.</li>\r\n</ul>\r\n<p>Samsung Galaxy A50 l&agrave; chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\" rel=\"noopener noreferrer\">smartphone Samsung&nbsp;</a>tầm trung mới&nbsp;trong năm 2019 với nhiều t&iacute;nh năng hấp dẫn như cảm biến v&acirc;n tay dưới m&agrave;n h&igrave;nh,&nbsp;m&agrave;n h&igrave;nh Infinity-U tr&agrave;n viền, 3 camera cho chất lượng ảnh tốt,...</p>\r\n<p><img style=\"height: 450px; width: 800px;\" src=\"../../DO-AN-TN-2019/public/upload/images/samsung-galaxy-a50-black-10_800x450.jpg\" alt=\"\" /></p>\r\n<p>Để đặt mua hoặc biết th&ecirc;m c&aacute;c th&ocirc;ng tin kh&aacute;c về&nbsp;Samsung Galaxy A50, bạn c&oacute; thể nhấn v&agrave;o đường dẫn sản phẩm ngay sau đ&acirc;y!</p>\r\n<p><img style=\"height: 450px; width: 800px;\" src=\"../../DO-AN-TN-2019/public/upload/images/samsung-galaxy-a50-black-9(1).jpg\" alt=\"\" /></p>', 'samsung-galaxy-a50-black-9.jpg', '2019-05-14 23:29:15', '2019-06-26 17:22:04', 1),
(3, 'HongMeng OS của Huawei xuất hiện trực tuyến, có tên quốc tế là Ark OS', '', '<h3>Kh&ocirc;ng c&ograve;n nghi ngờ g&igrave; nữa,&nbsp;<a href=\"https://www.thegioididong.com/dtdd-huawei\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd-huawei\">Huawei</a>&nbsp;đang ph&aacute;t triển hệ điều h&agrave;nh của ri&ecirc;ng m&igrave;nh, c&oacute; thể được gọi l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/huawei-mate-30-se-chay-he-dieu-hanh-hongmeng-os-va-chip-kirin-985-1170811\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/tin-tuc/huawei-mate-30-se-chay-he-dieu-hanh-hongmeng-os-va-chip-kirin-985-1170811\">HongMeng OS</a>&nbsp;ở Trung Quốc v&agrave; Ark OS ở c&aacute;c quốc gia kh&aacute;c. Hệ thống n&agrave;y đ&atilde; th&ocirc;ng qua chứng nhận nh&atilde;n hiệu của Văn ph&ograve;ng Thương hiệu Trung Quốc cũng như Văn ph&ograve;ng Sở hữu Tr&iacute; tuệ Ch&acirc;u &Acirc;u.</h3>\r\n<p>C&aacute;c b&aacute;o c&aacute;o gần đ&acirc;y cho thấy Huawei đ&atilde; nộp đơn xin cấp bằng s&aacute;ng chế giao diện&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd\">smartphone</a>&nbsp;với t&ecirc;n l&agrave; Huawei Ark OS.&nbsp;Trong đ&oacute;, Ark v&agrave; Huawei Ark đ&atilde; được&nbsp;Văn ph&ograve;ng nh&atilde;n hiệu v&agrave; bằng s&aacute;ng chế của Đức chứng nhận v&agrave;o th&aacute;ng 3 năm nay.</p>\r\n<p>Ứng dụng bằng s&aacute;ng chế cũng bao gồm một loạt c&aacute;c ảnh chụp m&agrave;n h&igrave;nh. Tuy nhi&ecirc;n, kh&ocirc;ng r&otilde; liệu ảnh chụp m&agrave;n h&igrave;nh b&ecirc;n dưới c&oacute; thuộc hệ thống HongMeng/ Ark sắp tới của Huawei hay kh&ocirc;ng.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 309px; width: 550px;\" src=\"https://cdn.tgdd.vn/Files/2019/06/08/1171773/Gallery/ark-os-z.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.tgdd.vn/Files/2019/06/08/1171773/Gallery/ark-os-z.jpg\" /></p>\r\n<p>Một trong những ảnh chụp m&agrave;n h&igrave;nh c&oacute; cụm từ \"Android Green Alliance\" gợi &yacute; rằng hệ thống HongMeng/ Ark c&oacute; thể tương th&iacute;ch với c&aacute;c ứng dụng&nbsp;<a href=\"https://www.thegioididong.com/dtdd?g=android\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/dtdd?g=android\">Android</a>. Li&ecirc;n minh Android Xanh được Huawei, Alibaba, Tencent v&agrave; Netease phối hợp ra mắt. N&oacute; nhằm mục đ&iacute;ch tạo ra một hệ sinh th&aacute;i ứng dụng an to&agrave;n, đ&aacute;ng tin cậy v&agrave; l&agrave;nh mạnh.</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"height: 409px; width: 550px;\" src=\"https://cdn.tgdd.vn/Files/2019/06/08/1171773/ark-os_550x409.jpg\" alt=\"\" data-cke-saved-src=\"https://cdn.tgdd.vn/Files/2019/06/08/1171773/ark-os_550x409.jpg\" /></p>\r\n<p>Hiện nay, nhiều c&ocirc;ng ty đ&atilde; tham gia. Trước đ&acirc;y, Yu Chengdong -&nbsp;Gi&aacute;m đốc điều h&agrave;nh bộ phận kinh doanh ti&ecirc;u d&ugrave;ng của Huawei, đ&atilde; tiết lộ rằng Huawei OS sẽ tương th&iacute;ch với smartphone, m&aacute;y t&iacute;nh,&nbsp;<a href=\"https://www.thegioididong.com/may-tinh-bang\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.thegioididong.com/may-tinh-bang\">m&aacute;y t&iacute;nh bảng</a>, TV, xe hơi, thiết bị đeo th&ocirc;ng minh v&agrave; nhiều hệ thống kh&aacute;c.</p>\r\n<p>Nguồn:&nbsp;<a href=\"https://www.gizchina.com/2019/06/07/suspected-huawei-ark-os-interface-appears-online/\" target=\"_blank\" rel=\"noopener noreferrer\" data-cke-saved-href=\"https://www.gizchina.com/2019/06/07/suspected-huawei-ark-os-interface-appears-online/\">Gizchina</a></p>', '636944709585403075_huawei-dat-doanh-thu-khung-tren-tmall-cover.jpg', '2020-05-25 13:50:19', '2020-05-26 13:50:19', 1),
(4, 'Một số người dùng OnePlus 7 Pro báo cáo máy bị lỗi màn hình cảm ứng', '<p>Mặc d&ugrave; vừa mới ra mắt được 1 tuần , tuy nhi&ecirc;n OnePlus 7 pro đ&atilde; d&iacute;nh ngay lỗi cảm ứng kh&aacute; kh&oacute; chịu</p>', '<div class=\"jsx-505457985 thread-cover\" style=\"margin: 0px; padding: 0.5rem 0px; border: none; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14.6667px; line-height: inherit; font-family: Helvetica, Arial, sans-serif; color: #121821; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; width: 784px;\"><img class=\"jsx-505457985 thread-cover__image\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; color: inherit; background: none; max-width: 100%; display: block; height: auto; width: 784px; border-radius: 12px;\" src=\"https://photo2.tinhte.vn/data/attachment-files/2019/05/4666629_COVER_oneplus.jpg\" alt=\"Một số người d&ugrave;ng OnePlus 7 Pro b&aacute;o c&aacute;o m&aacute;y bị lỗi m&agrave;n h&igrave;nh cảm ứng\" /></div>\r\n<div class=\"jsx-505457985\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14.6667px; line-height: inherit; font-family: Helvetica, Arial, sans-serif; color: #121821; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;</div>\r\n<div class=\"jsx-505457985\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14.6667px; line-height: inherit; font-family: Helvetica, Arial, sans-serif; color: #121821; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n<article class=\"jsx-505457985 content\" style=\"margin: 1rem 0px 0px; padding: 0px; border: none; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 15px; line-height: 1.3; color: inherit; background: none;\">\r\n<div class=\"jsx-505457985\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; color: inherit; background: none;\">\r\n<blockquote class=\"jsx-505457985\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; color: inherit; background: none;\">\r\n<div class=\"jsx-1230401612\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; color: inherit; background: none;\">\r\n<div class=\"jsx-1230401612 xfBody big\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 17px; line-height: 25px; color: inherit; background: none; word-break: break-word;\" data-author=\"MinhTriND\">L&agrave; chiếc m&aacute;y duy nhất tr&ecirc;n thị trường hiện nay sở hữu m&agrave;n h&igrave;nhh AMOLED với tần số qu&eacute;t l&ecirc;n đến 90Hz, tuy nhi&ecirc;n, dường như một trong những c&aacute;i tốt nhất tr&ecirc;n thiết bị n&agrave;y đang gặp vấn đề. Một số người d&ugrave;ng&nbsp;<a class=\"Tinhte_XenTag_TagLink\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; background: initial; text-decoration-line: none; cursor: pointer; -webkit-appearance: initial;\" href=\"https://tinhte.vn/tags/oneplus-7-pro/\">OnePlus 7 Pro</a>&nbsp;cho hay họ ph&aacute;t hiện m&agrave;n h&igrave;nh của m&aacute;y bị trục trặc g&igrave; đ&oacute;, kiểu như c&oacute; ai đang chạm v&agrave;o m&agrave;n h&igrave;nh mặc d&ugrave; họ kh&ocirc;ng l&agrave;m g&igrave; cả. Th&ocirc;ng tin từ trang Android Police cho biết&nbsp;<a class=\"Tinhte_XenTag_TagLink\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; background: initial; text-decoration-line: none; cursor: pointer; -webkit-appearance: initial;\" href=\"https://tinhte.vn/tags/oneplus/\">OnePlus</a>&nbsp;đ&atilde; ghi nhận vấn đề, đồng thời sẽ sớm t&igrave;m hiểu v&agrave; đưa ra biện ph&aacute;p khắc phục. Hiện những người đang sở hữu&nbsp;<a class=\"Tinhte_XenTag_TagLink\" style=\"margin: 0px; padding: 0px; border: none; box-sizing: border-box; font: inherit; background: initial; text-decoration-line: none; cursor: pointer; -webkit-appearance: initial;\" href=\"https://tinhte.vn/tags/oneplus-7/\">OnePlus 7</a>&nbsp;Pro c&oacute; lẽ đang hy vọng lỗi tr&ecirc;n chỉ l&agrave; sự cố phần mềm v&agrave; c&oacute; thể được giải quyết th&ocirc;ng qua bản cập nhật phần mềm sắp tới.</div>\r\n</div>\r\n</blockquote>\r\n</div>\r\n</article>\r\n</div>', '636944700734347488_oneplus-7-pro-bi-loi-man-hinh-cover.jpg', '2020-05-26 14:57:55', '2020-05-26 14:57:55', 1),
(5, ' Bộ đôi gaming mới Alienware m15 và m17 R3 có gì?', '<p>Th&aacute;ng 5 n&agrave;y ch&iacute;nh l&agrave; m&ugrave;a n&acirc;ng cấp&nbsp; của Dell, khi kh&ocirc;ng chỉ tung ra bản cập nhật cho con \"qu&aacute;i vật gaming\" Alienware Area-51m, m&agrave; c&ograve;n n&acirc;ng cấp bộ đ&ocirc;i Alienware m15 v&agrave; m17</p>', '<div class=\"tintucdetail-title\" style=\"box-sizing: border-box; font-size: 2.8rem; color: #2e2e2e; margin-bottom: 20px; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\">B&ocirc;̣ đ&ocirc;i gaming mới Alienware m15 và m17 R3 có gì?</h1>\r\n</div>\r\n<div class=\"content-baiviet ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">C&oacute; vẻ như th&aacute;ng 5 n&agrave;y ch&iacute;nh l&agrave; &ldquo;mùa n&acirc;ng c&acirc;́p&rdquo; của Dell, khi kh&ocirc;ng chỉ tung ra bản cập nhật cho con &ldquo;qu&aacute;i vật gaming&rdquo; Alienware Area-51m, m&agrave; c&ograve;n n&acirc;ng cấp bộ đ&ocirc;i Alienware m15 v&agrave; m17.</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Dell đ&atilde; nhanh tay trang bị cho cặp đ&ocirc;i laptop gaming n&agrave;y bộ vi xử l&yacute; thế hệ 10 d&ograve;ng H m&agrave; Intel vừa cho ra mắt cuối th&aacute;ng Tư vừa rồi. B&ecirc;n cạnh việc n&acirc;ng cấp CPU, Dell c&ograve;n đưa ra những lựa chọn mới nhất về card đồ họa, với cấu h&igrave;nh GPU thấp nhất m&agrave; bộ đ&ocirc;i n&agrave;y sở hữu l&agrave; NVIDIA GTX 1650 Ti. Đ&acirc;y cũng l&agrave; lần đầu ti&ecirc;n Alienware &ldquo;ưu &aacute;i&rdquo; cho những game thủ của &ldquo;đội đỏ&rdquo;, khi đưa v&agrave;o dàn sản ph&acirc;̉m của m&igrave;nh cấu h&igrave;nh card đồ họa AMD Radeon RX 5500M cho cả hai chiếc laptop m15 v&agrave; m17 R3.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/alienwarem15r33.jpg\" alt=\"\" width=\"807\" height=\"422\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Về cấu h&igrave;nh CPU, cả hai chiếc laptop gaming cao cấp n&agrave;y của Alienware đều kh&ocirc;ng c&oacute; qu&aacute; nhiều kh&aacute;c biệt. Dell cung cấp ba cấu h&igrave;nh về CPU: i5-10300H (4 nh&acirc;n 8 luồng), i7-10750H (6 nh&acirc;n 12 luồng) v&agrave; i9-10980HK (8 nh&acirc;n 16 luồng). Về bộ nhớ, Alienware m15 v&agrave; m17 R3 đều c&oacute; lựa chọn bộ nhớ từ 8GB đến 32GB RAM DDR4-2666, nhưng với d&ograve;ng laptop gaming cao cấp như bộ đ&ocirc;i n&agrave;y th&igrave; lựa chọn 16GB hoặc 32GB l&agrave; hợp l&yacute; hơn cả.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">B&ecirc;n cạnh lựa chọn card đ&ocirc;̀ họa AMD Radeon RX 5500M đ&ecirc;́n từ đ&ocirc;̣i đỏ, thì Alienware m15 và m17 R3 v&acirc;̃n có những c&acirc;́u hình GPU khác của đ&ocirc;̣i xanh, từ NVIDIA GTX 1650 Ti cho tới RTX 2080 Super cho phi&ecirc;n bản c&acirc;́u hình cao nh&acirc;́t. Nhưng có m&ocirc;̣t lưu ý nho nhỏ khi bạn chọn mua Alienware m15 R3, đó là chi&ecirc;́c laptop này sẽ sử dụng phi&ecirc;n bản Max-Q cho card đ&ocirc;̀ họa RTX 2080 Super thay vì phi&ecirc;n bản th&ocirc;ng thường.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/alienwarem15r34.jpg\" alt=\"\" width=\"807\" height=\"577\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">M&ocirc;̣t đi&ecirc;̉m mà nhi&ecirc;̀u người dùng chú ý khi mua laptop gaming là khả năng tản nhi&ecirc;̣t. Alienware m15 và m17 R3 sử dụng c&ocirc;ng ngh&ecirc;̣ làm mát Cryo-Tech, với sự k&ecirc;́t hợp của &ocirc;́ng tản nhi&ecirc;̣t bằng đ&ocirc;̀ng, tản nhi&ecirc;̣t &ldquo;bu&ocirc;̀ng hơi&rdquo; (vapor chamber) và h&ecirc;̣ th&ocirc;́ng quạt 64 cánh. Alienware cho biết mức ti&ecirc;u thụ năng lượng được điều chỉnh để tối đa h&oacute;a hiệu quả tổng thể.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">M&ocirc;̣t đi&ecirc;̀u &acirc;́n tượng v&ecirc;̀ b&ocirc;̣ đ&ocirc;i Alienware m15 và m17 R3 là màn hình. Ở c&acirc;́u hình cơ bản, Dell cung c&acirc;́p cho người dùng màn hình FHD với t&ocirc;́c đ&ocirc;̣ làm tươi (refresh rate) 144Hz, đ&ocirc;̣ sáng 300 nits và t&ocirc;́c đ&ocirc;̣ phản h&ocirc;̀i 7ms. N&ecirc;́u như v&acirc;̣y là chưa đủ, người dùng có th&ecirc;̉ lựa chọn t&acirc;́m màn FHD có h&ocirc;̃ trợ c&ocirc;ng ngh&ecirc;̣ G-Sync với t&ocirc;́c đ&ocirc;̣ làm tươi 300Hz và đ&ocirc;̣ phủ màu màn hình l&ecirc;n tới 100% Adobe RGB. Lựa chọn đắt ti&ecirc;̀n nh&acirc;́t mà Dell trang bị cho b&ocirc;̣ đ&ocirc;i Alienware m15 và m17 R3 là màn hình đ&ocirc;̣ ph&acirc;n giải 4K UHD, nhưng n&ecirc;́u bạn t&acirc;̣u chi&ecirc;́c laptop này thì phục vụ mục đích chơi game thì đừng lựa chọn c&acirc;́u hình này đ&ecirc;̉ đảm bảo t&ocirc;́c đ&ocirc;̣ phản h&ocirc;̀i cho màn hình.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/alienwarem15r32.jpg\" alt=\"\" width=\"807\" height=\"538\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">Có vẻ như Dell chỉ t&acirc;̣p trung n&acirc;ng c&acirc;́p ph&acirc;̀n cứng b&ecirc;n trong chứ kh&ocirc;ng c&acirc;̣p nh&acirc;̣t những y&ecirc;́u t&ocirc;́ b&ecirc;n ngoài. Ngoại hình của Alienware m15 và m17 R3 khá tương tự với th&ecirc;́ h&ecirc;̣ R2 trước đo, với lớp vỏ ngoài bằng nhựa cao c&acirc;́p, logo Alienware ở mặt lưng và bàn phím LED xanh đặc trưng. Dell cũng có những thay đ&ocirc;̉i v&ecirc;̀ &acirc;m thanh với h&ecirc;̣ th&ocirc;́ng loa hai t&acirc;̀ng, hứa hẹn sẽ sản xu&acirc;́t &acirc;m thanh trung thực hơn và to hơn so với đời máy trước. V&ecirc;̀ thời lượng pin, chưa có m&ocirc;̣t th&ocirc;ng s&ocirc;́ cụ th&ecirc;̉ nào v&ecirc;̀ thời gian mà b&ocirc;̣ đ&ocirc;i này có th&ecirc;̉ hoạt đ&ocirc;̣ng mà kh&ocirc;ng c&acirc;̀n cắm sạc, nhưng người dùng có th&ecirc;̉ lựa chọn hai th&ocirc;ng s&ocirc;́ pin, 56WHr hoặc 86WHr cho cả hai laptop Alienware m15 và m17 R3.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; text-align: justify;\">B&ocirc;̣ đ&ocirc;i Alienware m15 và m17 R3 sẽ chính thức l&ecirc;n k&ecirc;̣ vào ngày 21/5, với mức giá khởi đi&ecirc;̉m cho m15 R3 là 1499.99 USD (khoảng 35 tri&ecirc;̣u VND) và 1549.99 USD (khoảng 36 tri&ecirc;̣u VND) cho m17 R3.</p>\r\n</div>', 'thumb_200x200_15896172291189.jpg', '2020-05-16 13:52:54', '2020-06-16 13:52:54', 1),
(6, 'EliteBook 800 và 805 ra mắt được trang bị AMD Ryzen 4000', '<p><span style=\"box-sizing: border-box; font-weight: bolder; color: #666666; font-family: Roboto, sans-serif;\">HP đang cập nhật to&agrave;n bộ danh mục m&aacute;y t&iacute;nh x&aacute;ch tay d&agrave;nh cho doanh nghiệp EliteBook của m&igrave;nh v&agrave;o năm 2020. Năm nay, HP cuối c&ugrave;ng đ&atilde; kết th&uacute;c sự t&aacute;ch biệt giữa AMD EliteBooks v&agrave; Intel EliteBooks, khi HP t&iacute;ch hợp c&aacute;c mẫu AMD v&agrave;o d&ograve;ng EliteBook 800. Đ&oacute; kh&ocirc;ng phải l&agrave; thay đổi duy nhất, v&igrave; HP đ&atilde; thiết kế lại to&agrave;n bộ loạt m&aacute;y t&iacute;nh x&aacute;ch tay kinh doanh ch&iacute;nh của họ.</span></p>', '<div class=\"tintucdetail-title\" style=\"box-sizing: border-box; font-size: 2.8rem; color: #2e2e2e; margin-bottom: 20px; font-family: Roboto, sans-serif;\">\r\n<h1 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: inherit; font-weight: 500; line-height: 1.2; color: inherit; font-size: 2.5rem;\">EliteBook 800 v&agrave; 805 ra mắt được trang bị AMD Ryzen 4000</h1>\r\n</div>\r\n<div class=\"content-baiviet ck-content\" style=\"box-sizing: border-box; color: #666666; font-family: Roboto, sans-serif;\">\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><span style=\"box-sizing: border-box; font-weight: bolder;\">HP đang cập nhật to&agrave;n bộ danh mục m&aacute;y t&iacute;nh x&aacute;ch tay d&agrave;nh cho doanh nghiệp EliteBook của m&igrave;nh v&agrave;o năm 2020. Năm nay, HP cuối c&ugrave;ng đ&atilde; kết th&uacute;c sự t&aacute;ch biệt giữa AMD EliteBooks v&agrave; Intel EliteBooks, khi HP t&iacute;ch hợp c&aacute;c mẫu AMD v&agrave;o d&ograve;ng EliteBook 800 (trước đ&acirc;y, ch&uacute;ng được t&aacute;ch ra th&agrave;nh EliteBook 700). Đ&oacute; kh&ocirc;ng phải l&agrave; thay đổi duy nhất, v&igrave; HP đ&atilde; thiết kế lại to&agrave;n bộ loạt m&aacute;y t&iacute;nh x&aacute;ch tay kinh doanh ch&iacute;nh của họ.</span></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/tin-tuc/HP-Elitebook-800-805/hpelitebook835g7intel.jpg\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">C&oacute; 7 m&aacute;y t&iacute;nh x&aacute;ch tay EliteBook 800 &amp; 805 G7 mới, 4 với Intel, 3 với AMD. D&ograve;ng EliteBook 800 mới sẽ mang đến c&aacute;c sự lựa chọn: EliteBook 830 G7, EliteBook 840 G7 v&agrave; EliteBook 850 G7 với Intel Comet Lake U (thay thế Whiskey Lake U) hoặc EliteBook 835 G7, EliteBook 845 G7 v&agrave; EliteBook 855 G7 với AMD Ryzen 4000 U, c&ograve;n được gọi l&agrave; Renoir. Chỉ c&oacute; một EliteBook 800 l&agrave; độc quyền của Intel: EliteBook x360 830 G7 dạng 2-trong-1. C&aacute;c lựa chọn Intel sẽ cho con chip l&ecirc;n tới thế hệ thứ 10 mới nhất i7-10810U s&aacute;u nh&acirc;n, trong khi c&aacute;c m&ocirc; h&igrave;nh AMD cung cấp tối đa AMD Ryzen 7 Pro 4750U với t&aacute;m nh&acirc;n.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/tin-tuc/HP-Elitebook-800-805/csm_hp_elitebook_x360_830_g7_tablet_1_9bcf549c7d.jpg\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">D&ograve;ng HP EliteBook 800 G7 bao gồm HP EliteBook 830 G7, HP EliteBook 840 G7 v&agrave; HP EliteBook 850 G7 sẽ c&oacute; sẵn v&agrave;o th&aacute;ng 6 v&agrave; sẽ bắt đầu ở mức $ 1,399. Tiếp theo l&agrave; d&ograve;ng HP EliteBook 805 G7 bao gồm HP EliteBook 835 G7, HP EliteBook 845 G7 v&agrave; HP EliteBook 855 G7 sẽ được b&aacute;n bắt đầu từ th&aacute;ng 8 năm nay v&agrave; gi&aacute; sẽ được tiết lộ gần hơn với ng&agrave;y b&aacute;n. Cuối c&ugrave;ng, HP EliteBook x360 830 c&oacute; gi&aacute; khởi điểm l&agrave; $ 1,419.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/tin-tuc/HP-Elitebook-800-805/csm_hp_elitebook_845_g7_rear_left_9dd25dfaf1.jpg\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">C&aacute;c cổng kết nối phụ v&agrave; cả RJ-45 tr&ecirc;n HP EliteBook mới đ&atilde; được loại bỏ v&agrave; thay thế bằng 2 cổng USB-C/Thunderbolt 3 (c&aacute;c mẫu AMD sẽ kh&ocirc;ng c&oacute; Thunderbolt). Mặc d&ugrave; vậy, h&atilde;ng vẫn giữ lại cổng HDMI 2.0 cũng như USB-A 3.1 để cung cấp cho người d&ugrave;ng nhiều t&ugrave;y chọn li&ecirc;n kết hơn.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\"><img style=\"box-sizing: border-box; vertical-align: middle; border-style: none; max-width: 100%;\" src=\"https://www.thinkpro.vn/uploads/images/userfiles/tin-tuc/HP-Elitebook-800-805/hpx360830g72020.jpg\" alt=\"\" /></p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Kh&ocirc;ng giống như c&aacute;c nh&agrave; sản xuất kh&aacute;c, HP thể hiện sự &ldquo;c&ocirc;ng bằng&rdquo; khi cung cấp t&ugrave;y chọn m&agrave;n h&igrave;nh như nhau tr&ecirc;n mẫu Intel lẫn AMD. Cả hai đều c&oacute; m&agrave;n h&igrave;nh FHD IPS với c&aacute;c t&ugrave;y chọn SureView (tối đa 1000 cd/m2) v&agrave; Super Low Power (tối đa 400 cd/m2).</p>\r\n</div>', 'thumb_200x200_15909822002495.jpg', '2020-06-01 13:57:02', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_account`
--

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_account`
--

INSERT INTO `user_account` (`id`, `id_user`, `username`, `password`, `role`, `created`) VALUES
(1, 1, 'admin', 'admin123', 1, '2020-05-10 05:01:50'),
(2, 2, 'nhanviena', '1234567', 2, '2020-05-10 05:32:38'),
(3, 2, 'nhanviena', '1234567', 1, '2020-05-16 03:47:23'),
(4, 2, 'nhanviena', '1234567', 1, '2020-05-16 03:47:38'),
(5, 1, 'admin', 'admin123', 1, '2020-05-16 03:50:55'),
(6, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:32:14'),
(7, 2, 'nhanviena', '1234567', 1, '2020-05-17 01:32:31'),
(8, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:32:36'),
(14, 2, 'nhanviena', '1234567', 1, '2020-05-17 01:46:33'),
(15, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:46:36'),
(16, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:46:56'),
(17, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:47:00'),
(18, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:47:03'),
(19, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:47:32'),
(20, 2, 'nhanviena', '1234567', 2, '2020-05-17 01:47:35'),
(23, 3, 'hiepnguyen2019', '1234567', 2, '2020-05-17 02:01:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_group`
--

CREATE TABLE `user_group` (
  `id_usergroup` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_group`
--

INSERT INTO `user_group` (`id_usergroup`, `name`, `created`) VALUES
(1, 'Toàn quyền', '2020-05-10 03:10:40'),
(2, 'Nhân viên', '2020-05-10 03:10:48'),
(3, 'Khách Hàng', '2020-05-10 03:11:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cauhinh`
--
ALTER TABLE `cauhinh`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mshh` (`mshh`),
  ADD KEY `sodondh` (`sodondh`);

--
-- Chỉ mục cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`sodondh`),
  ADD KEY `msnv` (`msnv`),
  ADD KEY `mskh` (`mskh`);

--
-- Chỉ mục cho bảng `db_district`
--
ALTER TABLE `db_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matp` (`provinceid`);

--
-- Chỉ mục cho bảng `db_province`
--
ALTER TABLE `db_province`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`idgallery`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id_giohang`),
  ADD KEY `mshh` (`mshh`);

--
-- Chỉ mục cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD PRIMARY KEY (`mshh`),
  ADD KEY `manhom` (`manhom`),
  ADD KEY `idhieusp` (`idhieusp`);

--
-- Chỉ mục cho bảng `hieusp`
--
ALTER TABLE `hieusp`
  ADD PRIMARY KEY (`idhieusp`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`mskh`),
  ADD KEY `role` (`role`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id_lienhe`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`idnhacc`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`msnv`),
  ADD KEY `chucvu` (`chucvu`);

--
-- Chỉ mục cho bảng `nhomhanghoa`
--
ALTER TABLE `nhomhanghoa`
  ADD PRIMARY KEY (`manhom`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`idslider`);

--
-- Chỉ mục cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`mstt`);

--
-- Chỉ mục cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id_usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cauhinh`
--
ALTER TABLE `cauhinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `dathang`
--
ALTER TABLE `dathang`
  MODIFY `sodondh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `db_province`
--
ALTER TABLE `db_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `gallery`
--
ALTER TABLE `gallery`
  MODIFY `idgallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id_giohang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  MODIFY `mshh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `hieusp`
--
ALTER TABLE `hieusp`
  MODIFY `idhieusp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `mskh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id_lienhe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `idnhacc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `msnv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `nhomhanghoa`
--
ALTER TABLE `nhomhanghoa`
  MODIFY `manhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `idslider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `mstt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user_account`
--
ALTER TABLE `user_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id_usergroup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD CONSTRAINT `chitietdathang_ibfk_1` FOREIGN KEY (`sodondh`) REFERENCES `dathang` (`sodondh`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdathang_ibfk_2` FOREIGN KEY (`mshh`) REFERENCES `hanghoa` (`mshh`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD CONSTRAINT `dathang_ibfk_1` FOREIGN KEY (`mskh`) REFERENCES `khachhang` (`mskh`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dathang_ibfk_2` FOREIGN KEY (`msnv`) REFERENCES `nhanvien` (`msnv`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`mshh`) REFERENCES `hanghoa` (`mshh`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`manhom`) REFERENCES `nhomhanghoa` (`manhom`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hanghoa_ibfk_2` FOREIGN KEY (`idhieusp`) REFERENCES `hieusp` (`idhieusp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_group` (`id_usergroup`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`chucvu`) REFERENCES `user_group` (`id_usergroup`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
