-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2023 at 10:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_comp_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_code` int(11) NOT NULL,
  `emp_first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_birth_date` date NOT NULL,
  `emp_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_address_province_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_company_id` int(11) NOT NULL,
  `emp_branch_id` int(11) NOT NULL,
  `emp_work_date_start` date NOT NULL,
  `emp_salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `province_name`) VALUES
(1, 'กรุงเทพมหานคร'),
(2, 'สมุทรปราการ'),
(3, 'นนทบุรี'),
(4, 'ปทุมธานี'),
(5, 'พระนครศรีอยุธยา'),
(6, 'อ่างทอง'),
(7, 'ลพบุรี'),
(8, 'สิงห์บุรี'),
(9, 'ชัยนาท'),
(10, 'สระบุรี'),
(11, 'ชลบุรี'),
(12, 'ระยอง'),
(13, 'จันทบุรี'),
(14, 'ตราด'),
(15, 'ฉะเชิงเทรา'),
(16, 'ปราจีนบุรี'),
(17, 'นครนายก'),
(18, 'สระแก้ว'),
(19, 'นครราชสีมา'),
(20, 'บุรีรัมย์'),
(21, 'สุรินทร์'),
(22, 'ศรีสะเกษ'),
(23, 'อุบลราชธานี'),
(24, 'ยโสธร'),
(25, 'ชัยภูมิ'),
(26, 'อำนาจเจริญ'),
(27, 'หนองบัวลำภู'),
(28, 'ขอนแก่น'),
(29, 'อุดรธานี'),
(30, 'เลย'),
(31, 'หนองคาย'),
(32, 'มหาสารคาม'),
(33, 'ร้อยเอ็ด'),
(34, 'กาฬสินธุ์'),
(35, 'สกลนคร'),
(36, 'นครพนม'),
(37, 'มุกดาหาร'),
(38, 'เชียงใหม่'),
(39, 'ลำพูน'),
(40, 'ลำปาง'),
(41, 'อุตรดิตถ์'),
(42, 'แพร่'),
(43, 'น่าน'),
(44, 'พะเยา'),
(45, 'เชียงราย'),
(46, 'แม่ฮ่องสอน'),
(47, 'นครสวรรค์'),
(48, 'อุทัยธานี'),
(49, 'กำแพงเพชร'),
(50, 'ตาก'),
(51, 'สุโขทัย'),
(52, 'พิษณุโลก'),
(53, 'พิจิตร'),
(54, 'เพชรบูรณ์'),
(55, 'ราชบุรี'),
(56, 'กาญจนบุรี'),
(57, 'สุพรรณบุรี'),
(58, 'นครปฐม'),
(59, 'สมุทรสาคร'),
(60, 'สมุทรสงคราม'),
(61, 'เพชรบุรี'),
(62, 'ประจวบคีรีขันธ์'),
(63, 'นครศรีธรรมราช'),
(64, 'กระบี่'),
(65, 'พังงา'),
(66, 'ภูเก็ต'),
(67, 'สุราษฎร์ธานี'),
(68, 'ระนอง'),
(69, 'ชุมพร'),
(70, 'สงขลา'),
(71, 'สตูล'),
(72, 'ตรัง'),
(73, 'พัทลุง'),
(74, 'ปัตตานี'),
(75, 'ยะลา'),
(76, 'นราธิวาส'),
(77, 'บึงกาฬ');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `login_id` int(11) NOT NULL,
  `login_User` varchar(100) NOT NULL,
  `login_Pass` varchar(100) NOT NULL,
  `login_Name` varchar(100) NOT NULL,
  `login_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`login_id`, `login_User`, `login_Pass`, `login_Name`, `login_type`) VALUES
(1, '888888', '123456', 'HR', 1),
(2, '666666', '123456', 'พนักงาน', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_code`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
