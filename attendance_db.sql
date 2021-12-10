-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2021 at 02:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_list`
--

CREATE TABLE `attendance_list` (
  `id` int(10) NOT NULL,
  `class_course_id` int(10) NOT NULL,
  `doc` date NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance_list`
--

INSERT INTO `attendance_list` (`id`, `class_course_id`, `doc`, `date_created`) VALUES
(1, 3, '2021-12-07', '2021-12-07 11:36:38.000000'),
(2, 3, '2021-12-08', '2021-12-08 09:01:01.926670');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_record`
--

CREATE TABLE `attendance_record` (
  `id` int(10) NOT NULL,
  `attendance_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0=absent,1=present,2=late',
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance_record`
--

INSERT INTO `attendance_record` (`id`, `attendance_id`, `student_id`, `type`, `date_created`) VALUES
(1, 1, 2, 1, '2021-12-07 11:36:38.000000'),
(2, 2, 1, 1, '2021-12-08 09:01:02.064853'),
(3, 2, 4, 1, '2021-12-08 09:01:02.104064');

-- --------------------------------------------------------

--
-- Table structure for table `aytb`
--

CREATE TABLE `aytb` (
  `ayID` int(10) NOT NULL,
  `aySem` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aytb`
--

INSERT INTO `aytb` (`ayID`, `aySem`) VALUES
(1, '2018-2019-1st Sem'),
(2, '2018-2019-2nd Sem'),
(3, '2019-2020-1st Sem'),
(4, '2019-2020-2nd Sem'),
(5, '2020-2021-1st Sem'),
(6, '2020-2021-2nd Sem'),
(7, '2021-2022-1st Sem'),
(8, '2021-2022-2nd Sem');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(10) NOT NULL,
  `program_id` int(10) NOT NULL,
  `level` int(10) NOT NULL,
  `section` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `program_id`, `level`, `section`, `status`, `date_created`) VALUES
(1, 2, 1, 'B', 1, '2020-10-28 10:48:45.000000'),
(2, 2, 1, 'A', 1, '2020-10-28 10:52:58.000000'),
(3, 2, 2, 'A', 1, '2021-10-18 13:31:00.000000'),
(4, 2, 3, 'A', 1, '2021-10-18 13:31:14.000000'),
(5, 4, 1, 'A', 1, '2021-10-18 13:31:26.000000'),
(6, 4, 1, 'B', 1, '2021-10-18 13:31:35.000000'),
(7, 4, 1, 'C', 1, '2021-10-18 13:31:51.000000'),
(8, 4, 1, 'D', 1, '2021-10-18 13:32:02.000000'),
(9, 4, 2, 'A', 1, '2021-10-18 13:32:22.000000'),
(10, 4, 2, 'B', 1, '2021-10-18 13:32:31.000000'),
(11, 4, 2, 'C', 1, '2021-10-18 13:32:44.000000'),
(12, 4, 3, 'A', 1, '2021-10-18 13:32:58.000000'),
(13, 4, 3, 'B', 1, '2021-10-18 13:33:09.000000'),
(14, 4, 3, 'C', 1, '2021-10-18 13:33:19.000000'),
(16, 4, 4, 'A', 1, '2021-10-18 13:33:46.000000'),
(17, 4, 4, 'B', 1, '2021-10-18 13:33:56.000000'),
(18, 3, 1, 'A', 1, '2021-10-18 13:34:17.000000'),
(19, 3, 2, 'A', 1, '2021-10-18 13:34:28.000000'),
(20, 5, 1, 'A', 1, '2021-10-18 13:34:37.000000'),
(21, 5, 1, 'B', 1, '2021-10-18 13:34:46.000000'),
(22, 5, 1, 'C', 1, '2021-10-18 13:35:02.000000'),
(23, 5, 2, 'A', 1, '2021-10-18 13:35:19.000000'),
(24, 5, 2, 'B', 1, '2021-10-18 13:35:31.000000'),
(25, 5, 3, 'A', 1, '2021-10-18 13:35:41.000000'),
(26, 5, 3, 'B', 1, '2021-10-18 13:35:54.000000'),
(27, 5, 4, 'A', 1, '2021-10-18 13:36:08.000000'),
(28, 5, 4, 'B', 1, '2021-10-18 13:36:18.000000'),
(29, 1, 1, 'A', 1, '2021-10-18 13:36:39.000000'),
(30, 1, 1, 'B', 1, '2021-10-18 13:36:51.000000'),
(31, 1, 1, 'C', 1, '2021-10-18 13:37:02.000000'),
(32, 1, 2, 'A', 1, '2021-10-18 13:37:12.000000'),
(33, 1, 2, 'B', 1, '2021-10-18 13:37:26.000000'),
(34, 1, 3, 'A', 1, '2021-10-18 13:37:36.000000'),
(35, 1, 3, 'B', 1, '2021-10-18 13:37:57.000000'),
(36, 1, 4, 'A', 1, '2021-10-18 13:38:12.000000'),
(37, 1, 4, 'B', 1, '2021-10-18 13:38:26.000000'),
(38, 1, 4, 'C', 1, '2021-11-30 14:10:29.000000');

-- --------------------------------------------------------

--
-- Table structure for table `class_course`
--

CREATE TABLE `class_course` (
  `id` int(10) NOT NULL,
  `class_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `faculty_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_course`
--

INSERT INTO `class_course` (`id`, `class_id`, `course_id`, `faculty_id`, `student_id`, `date_created`) VALUES
(1, 2, 1, 1, 0, '2021-12-08 08:14:50.276557'),
(2, 2, 2, 2, 0, '2021-12-08 08:15:22.125227'),
(3, 2, 3, 3, 0, '2021-12-08 08:15:45.803644'),
(4, 2, 5, 4, 0, '2021-12-08 08:38:49.653102'),
(5, 2, 28, 5, 0, '2021-12-08 08:39:48.788632'),
(6, 2, 6, 6, 0, '2021-12-08 08:40:10.127499'),
(7, 2, 7, 7, 0, '2021-12-08 08:40:38.779469'),
(8, 2, 8, 8, 0, '2021-12-08 08:40:55.581122'),
(9, 2, 9, 9, 0, '2021-12-08 08:41:20.408266'),
(10, 3, 11, 10, 0, '2021-12-08 08:42:01.523095'),
(11, 3, 12, 11, 0, '2021-12-08 08:42:29.749587'),
(12, 3, 13, 12, 0, '2021-12-08 08:42:51.432660'),
(13, 3, 14, 13, 0, '2021-12-08 08:43:13.899498'),
(14, 3, 15, 14, 0, '2021-12-08 08:43:38.750495'),
(15, 3, 16, 15, 0, '2021-12-08 08:44:00.364346'),
(16, 3, 17, 7, 0, '2021-12-08 08:44:32.879322'),
(17, 3, 18, 16, 0, '2021-12-08 08:45:04.063669'),
(18, 4, 19, 13, 0, '2021-12-08 08:45:28.437840'),
(19, 4, 20, 7, 0, '2021-12-08 08:45:54.338085'),
(20, 4, 21, 15, 0, '2021-12-08 08:46:18.008672'),
(21, 4, 22, 17, 0, '2021-12-08 08:46:40.664320'),
(22, 4, 23, 4, 0, '2021-12-08 08:47:09.085840'),
(23, 4, 24, 17, 0, '2021-12-08 08:47:35.931029'),
(24, 4, 25, 18, 0, '2021-12-08 08:47:58.774243'),
(25, 4, 27, 11, 0, '2021-12-08 08:48:26.452542'),
(26, 5, 29, 19, 0, '2021-12-08 08:48:52.292727'),
(27, 5, 15, 20, 0, '2021-12-08 08:49:16.959670');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) NOT NULL,
  `course` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `description`, `date_created`) VALUES
(1, 'GE1', 'Understanding the Self', '2021-10-18 10:15:25.000000'),
(2, 'GE2', 'Readings in Philippine History', '2021-10-18 10:15:58.000000'),
(3, 'AE11', 'Managerial Economics', '2021-10-18 10:16:31.000000'),
(5, 'AE22', 'Cost Accounting and Control', '2021-10-18 10:18:38.000000'),
(6, 'GE4', 'Mathematics in the Modern World', '2021-10-18 10:19:00.000000'),
(7, 'AE13', 'Financial Accounting and...', '2021-10-18 10:21:08.000000'),
(8, 'PEE1', 'Physical Activities Towards Health', '2021-10-18 10:21:36.000000'),
(9, 'NSTP1', 'CWTS/ROTC 1', '2021-10-18 10:22:00.000000'),
(10, 'AE16', 'Intermediate Accounting 2', '2021-10-18 10:22:31.000000'),
(11, 'GE5', 'Purposive Communication', '2021-10-18 10:43:45.000000'),
(12, 'AE23', 'Strategic Cost Management', '2021-10-18 10:44:10.000000'),
(13, 'LIT1-2018', 'Sosyedad at Literatura', '2021-10-18 10:44:34.000000'),
(14, 'AE2', 'Business Laws and...', '2021-10-18 10:44:56.000000'),
(15, 'GE3', 'The Contemporary World', '2021-10-18 10:45:30.000000'),
(16, 'AE21', 'IT Application Tools in Business', '2021-10-18 10:45:57.000000'),
(17, 'AE19', 'Financial Management', '2021-10-18 10:46:18.000000'),
(18, 'PE3-2018', 'Physical Activities Towards Health', '2021-10-18 10:46:48.000000'),
(19, 'PRE7', 'Accounting for Business', '2021-10-18 10:47:11.000000'),
(20, 'AE9', 'Statistical Analysis with...', '2021-10-18 10:47:35.000000'),
(21, 'AE25', 'Business Taxation', '2021-10-18 10:47:56.000000'),
(22, 'AELECT1', 'Updates in Financial Reporting', '2021-10-18 10:48:22.000000'),
(23, 'PRE6', 'Accounting for Special...', '2021-10-18 10:48:54.000000'),
(24, 'AELECT2', 'Valuation Concepts and...', '2021-10-18 10:49:14.000000'),
(25, 'GE6', 'Art Appreciation', '2021-10-18 10:49:43.000000'),
(26, 'PRE2', 'Auditing and Assurance:...', '2021-10-18 10:50:06.000000'),
(27, 'PRE1', 'Auditing and Assurance', '2021-10-18 10:53:37.000000'),
(28, 'ES1', 'Environmental Science', '2021-10-18 10:53:54.000000'),
(29, 'BAC1', 'Basic Microeconomics', '2021-10-18 10:55:33.000000'),
(30, 'GB1', 'Great Books', '2021-10-18 10:55:55.000000'),
(31, 'PE1-B', 'Physical Fitness', '2021-10-18 10:56:20.000000'),
(32, 'FM1', 'Financial Analysis and...', '2021-10-18 10:59:14.000000'),
(33, 'CBME(SM)', 'Strategic Management', '2021-10-18 11:00:12.000000'),
(34, 'BPO2', 'Service Culture', '2021-10-18 11:00:29.000000'),
(35, 'BAC2', 'Law on Obligations and...', '2021-10-18 11:00:53.000000'),
(36, 'FM4', 'Investment and Portfolio', '2021-10-18 11:01:26.000000'),
(37, 'BAC4', 'Good Governance and Social...', '2021-10-18 11:01:49.000000'),
(38, 'FMELECT1', 'Cooperative Management', '2021-10-18 11:02:20.000000'),
(39, 'BAC3', 'Income Taxation', '2021-10-18 11:02:38.000000'),
(40, 'GE8', 'Ethics', '2021-10-18 11:02:51.000000'),
(41, 'RES1B', 'Business Research', '2021-10-18 11:05:23.000000'),
(42, 'BPO5ELEC', 'Fundamentals of BPO2', '2021-10-18 11:05:50.000000'),
(43, 'TAX2', 'Transfer and Business Taxation', '2021-10-18 11:06:09.000000'),
(44, 'FM6', 'Capital Market', '2021-10-18 11:06:22.000000'),
(45, 'ENT1', 'Principles of Entrepreneurship', '2021-10-18 11:06:46.000000'),
(46, 'FM9ELEC', 'Cooperative Management', '2021-10-18 11:07:13.000000'),
(47, 'FM7', 'Strategic Financial', '2021-10-18 11:07:32.000000'),
(48, 'BPO4ELEC', 'Principles of System Thinking', '2021-10-18 11:08:05.000000'),
(49, 'ECON1', 'Introductory Economics', '2021-10-18 11:08:27.000000'),
(50, 'MAEC1', 'Algebra and Trigonometry', '2021-10-18 11:08:50.000000'),
(51, 'AEC1', 'Fundamentals of Accounting', '2021-10-18 11:09:12.000000'),
(52, 'FIL3-2018', 'Dalumat sa Filipino', '2021-10-18 11:09:45.000000'),
(53, 'ECON2', 'Microeconomics', '2021-10-18 11:10:16.000000'),
(54, 'SCIE1', 'Fundamentals of Biology', '2021-10-18 11:10:36.000000'),
(55, 'MAEC3', 'Calculus II', '2021-10-18 11:10:53.000000'),
(56, 'ENT1-2018', 'Entrepreneurial Behavior', '2021-10-18 11:11:20.000000'),
(57, 'ENTELEC1-2018', 'Microfinancing', '2021-10-18 11:15:42.000000'),
(58, 'ENT4-2018', 'Fundamentals of Business', '2021-10-18 11:16:03.000000'),
(59, 'ENT5-2018', 'Innovation Management', '2021-10-18 11:16:22.000000'),
(60, 'AGRI-TECH1', 'Introduction to Agribusiness', '2021-10-18 11:16:47.000000'),
(61, 'ENT6-2018', 'Microeconomics', '2021-10-18 11:17:15.000000'),
(62, 'ENT9-2018', 'Human Resource Management', '2021-10-18 11:17:41.000000'),
(63, 'ENTELEC4', 'E-commerce', '2021-10-18 13:06:49.000000'),
(64, 'AGRI-TECH3', 'Innovative and Integrative', '2021-10-18 13:07:17.000000'),
(65, 'ENT11-2018', 'Business Law', '2021-10-18 13:07:32.000000'),
(66, 'ENT10-2018', 'Financial Management', '2021-10-18 13:08:04.000000'),
(67, 'CBM(POM)', 'Production and Operation', '2021-10-18 13:08:28.000000'),
(68, 'ENT6', 'Business Plan Implementation', '2021-10-18 13:08:53.000000'),
(69, 'ENTELEC5', 'Business Plan Implementation', '2021-10-18 13:09:25.000000'),
(70, 'ENG1-2018', 'Business Communication', '2021-10-18 13:10:37.000000'),
(71, 'OAC2', 'Foundations of Shorthand', '2021-10-18 13:11:08.000000'),
(72, 'OAC1', 'Keyboarding and Documents', '2021-10-18 13:11:24.000000'),
(73, 'OAC5', 'Integrated Software', '2021-10-18 13:11:47.000000'),
(74, 'OAC7', 'Internet Research for Business', '2021-10-18 13:12:53.000000'),
(75, 'OAC8', 'Administrative Office', '2021-10-18 13:13:10.000000'),
(76, 'OAC9', 'Customer Relations', '2021-10-18 13:13:28.000000'),
(77, 'OAELECT1', 'Legal Office Procedures', '2021-10-18 13:13:59.000000'),
(78, 'OAELECT2', 'Medical Office Procedures', '2021-10-18 13:14:24.000000'),
(79, 'COMPELEC', 'Management Information', '2021-10-18 13:15:21.000000'),
(80, 'LIT2', 'The Literatures of the World', '2021-10-18 13:15:35.000000'),
(81, 'BLAW1', 'Law on Obligations and...', '2021-10-18 13:15:53.000000'),
(82, 'SH5B', 'Machine Shorthand', '2021-10-18 13:16:08.000000'),
(83, 'TAX1', 'Income Taxation', '2021-10-18 13:16:25.000000'),
(84, 'SS6', 'Life and Works of Rizal', '2021-10-18 13:17:27.000000'),
(85, 'ST1', 'Seminars and Tours', '2021-12-01 10:29:04.000000');

-- --------------------------------------------------------

--
-- Table structure for table `daytb`
--

CREATE TABLE `daytb` (
  `dayID` int(10) NOT NULL,
  `day` varchar(15) NOT NULL,
  `dayAbvtn` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daytb`
--

INSERT INTO `daytb` (`dayID`, `day`, `dayAbvtn`) VALUES
(1, 'Monday', 'M'),
(2, 'Tuesday', 'T'),
(3, 'Wednesday', 'W'),
(4, 'Thursday', 'Th'),
(5, 'Friday', 'F'),
(6, 'Saturday', 'Sat'),
(7, 'Sunday', 'Sun');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(10) NOT NULL,
  `fuser_no` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `fuser_no`, `email`, `faculty_name`, `date_created`) VALUES
(1, 1111, 'piamonte@sample.com', 'J. Piamonte', '2021-12-08 08:00:03.692165'),
(2, 1112, 'palero@sample.com', 'D. Palero', '2021-12-08 08:01:25.444518'),
(3, 1113, 'gumba@sample.com', 'B. Gumba', '2021-12-08 08:01:43.764379'),
(4, 1114, 'bautista@sample.com', 'L. Bautista', '2021-12-08 08:02:05.641168'),
(5, 1115, 'prado@sample.com', 'M. Prado', '2021-12-08 08:02:35.630356'),
(6, 1116, 'masalunga@sample.com', 'R. Masalunga', '2021-12-08 08:02:53.508037'),
(7, 1117, 'abner@sample.com', 'R. Abner', '2021-12-08 08:03:17.595152'),
(8, 1118, 'peteza@sample.com', 'L. Peteza', '2021-12-08 08:03:38.774128'),
(9, 1119, 'sangalang@sample.com', 'M. Sangalang', '2021-12-08 08:04:07.487707'),
(10, 1120, 'lopez@sample.com', 'R. Lopez', '2021-12-08 08:05:03.920031'),
(11, 1121, 'medroso@sample.com', 'K. Medroso', '2021-12-08 08:05:26.052449'),
(12, 1122, 'abit@sample.com', 'R. Abit', '2021-12-08 08:05:47.838625'),
(13, 1123, 'rodriguez@sample.com', 'R. Rodriguez', '2021-12-08 08:06:12.895283'),
(14, 1124, 'pilapil@sample.com', 'J. Pilapil', '2021-12-08 08:06:34.648650'),
(15, 1125, 'pesino@sample.com', 'I. Pesino', '2021-12-08 08:06:51.889944'),
(16, 1126, 'naz@sample.com', 'L. Naz', '2021-12-08 08:07:10.507883'),
(17, 1127, 'mpesino@sample.com', 'M. Pesino', '2021-12-08 08:07:40.162840'),
(18, 1128, 'abante@sample.com', 'N. Abante', '2021-12-08 08:08:00.383325'),
(19, 1129, 'baltar@sample.com', 'K. Baltar', '2021-12-08 08:08:34.584316'),
(20, 1130, 'epilapil@sample.com', 'E. Pilapil III', '2021-12-08 08:09:07.624496');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(10) NOT NULL,
  `program` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `program`, `description`, `date_created`) VALUES
(1, 'BSOA', 'Bachelor of Science in Office Administration', '2021-12-06 15:22:12.906591'),
(2, 'BSA', 'Bachelor of Science in Accountancy', '2021-12-06 15:22:33.537027'),
(3, 'BSECON', 'Bachelor of Science in Economics', '2021-12-06 15:22:59.930171'),
(4, 'BSBA-FM', 'Bachelor of Science in Business Administration Major in Financial Management', '2021-12-06 15:23:40.202898'),
(5, 'BSENT', 'Bachelor of Science in Entrepreneurship', '2021-12-06 15:23:59.818023');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `suser_no` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `class_id` int(10) NOT NULL,
  `date_created` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `suser_no`, `email`, `student_name`, `class_id`, `date_created`) VALUES
(1, 12345, 'rashel@sample.com', 'Rashel Guevarra ', 2, '2021-12-08 08:10:43.383811'),
(2, 2525, 'juliet@sample.com', 'Juliet Balasta', 3, '2021-12-08 08:11:10.112778'),
(3, 36542, 'ante@sample.com', 'Angelica Ante', 4, '2021-12-08 08:11:50.511132'),
(4, 65451, 'rica@sample.com', 'Rica Jyn Caballero', 2, '2021-12-08 08:12:16.035638'),
(5, 87845, 'divine@sample.com', 'Divine Marie Molina', 3, '2021-12-08 08:12:38.411362'),
(6, 25256, 'elena@sample.com', 'Elena Colinares', 4, '2021-12-08 08:13:02.610683');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`) VALUES
(1, 'Real-Time Mobile-Based Attendance System', 'red@gmail.com', '09278705491');

-- --------------------------------------------------------

--
-- Table structure for table `timetb`
--

CREATE TABLE `timetb` (
  `timeID` int(10) NOT NULL,
  `time` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetb`
--

INSERT INTO `timetb` (`timeID`, `time`) VALUES
(1, '5:00-6:00 pm'),
(2, '7:30-8:30 am'),
(3, '7:30-9:30 am'),
(4, '8:30-9:30 am'),
(5, '8:30-10:30 am'),
(6, '8:30-11:30 am'),
(7, '9:30-10:30 am'),
(8, '9:30-11:30 am'),
(9, '1:00-2:00 pm'),
(10, '1:00-3:00 pm'),
(11, '2:00-3:00 pm'),
(12, '2:00-4:00 pm'),
(13, '3:00-4:00 pm'),
(14, '3:00-5:00 pm'),
(15, '3:00-6:00 pm'),
(16, '10:30-11:30 am'),
(17, '4:00-5:00 pm'),
(18, '8:00-11:00 am'),
(19, '1:00-4:00 pm'),
(20, '7:30-10:30 am'),
(21, '2:00-5:00 pm');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin, 2=Faculty, 3=Student',
  `faculty_id` int(10) NOT NULL COMMENT 'for faculty user only',
  `student_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `username`, `password`, `type`, `faculty_id`, `student_id`) VALUES
(1, 'Administrator', 'CBM_Admin', '0192023a7bbd73250516f069df18b500', 1, 0, 0),
(29, 'J. Piamonte', 'piamonte@sample.com', 'b59c67bf196a4758191e42f76670ceba', 2, 1, 0),
(30, 'D. Palero', 'palero@sample.com', '20d135f0f28185b84a4cf7aa51f29500', 2, 2, 0),
(31, 'B. Gumba', 'gumba@sample.com', '9c3b1830513cc3b8fc4b76635d32e692', 2, 3, 0),
(32, 'L. Bautista', 'bautista@sample.com', 'd6ef5f7fa914c19931a55bb262ec879c', 2, 4, 0),
(33, 'M. Prado', 'prado@sample.com', 'e19347e1c3ca0c0b97de5fb3b690855a', 2, 5, 0),
(34, 'R. Masalunga', 'masalunga@sample.com', 'dd77279f7d325eec933f05b1672f6a1f', 2, 6, 0),
(35, 'R. Abner', 'abner@sample.com', '0eec27c419d0fe24e53c90338cdc8bc6', 2, 7, 0),
(36, 'L. Peteza', 'peteza@sample.com', 'c60d060b946d6dd6145dcbad5c4ccf6f', 2, 8, 0),
(37, 'M. Sangalang', 'sangalang@sample.com', '8597a6cfa74defcbde3047c891d78f90', 2, 9, 0),
(38, 'R. Lopez', 'lopez@sample.com', 'c6036a69be21cb660499b75718a3ef24', 2, 10, 0),
(39, 'K. Medroso', 'medroso@sample.com', '3a15c7d0bbe60300a39f76f8a5ba6896', 2, 11, 0),
(40, 'R. Abit', 'abit@sample.com', '3b712de48137572f3849aabd5666a4e3', 2, 12, 0),
(41, 'R. Rodriguez', 'rodriguez@sample.com', '2cfd4560539f887a5e420412b370b361', 2, 13, 0),
(42, 'J. Pilapil', 'pilapil@sample.com', 'c7635bfd99248a2cdef8249ef7bfbef4', 2, 14, 0),
(43, 'I. Pesino', 'pesino@sample.com', 'c21002f464c5fc5bee3b98ced83963b8', 2, 15, 0),
(44, 'L. Naz', 'naz@sample.com', 'ffeed84c7cb1ae7bf4ec4bd78275bb98', 2, 16, 0),
(45, 'M. Pesino', 'mpesino@sample.com', '678a1491514b7f1006d605e9161946b1', 2, 17, 0),
(46, 'N. Abante', 'abante@sample.com', '3fe78a8acf5fda99de95303940a2420c', 2, 18, 0),
(47, 'K. Baltar', 'baltar@sample.com', '69a5b5995110b36a9a347898d97a610e', 2, 19, 0),
(48, 'E. Pilapil III', 'epilapil@sample.com', '4a213d37242bdcad8e7300e202e7caa4', 2, 20, 0),
(49, 'Rashel Guevarra ', 'rashel@sample.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, 0, 1),
(50, 'Juliet Balasta', 'juliet@sample.com', '9407c826d8e3c07ad37cb2d13d1cb641', 3, 0, 2),
(51, 'Angelica Ante', 'ante@sample.com', '694b9f764e03b6cf70d0ec5cca76985c', 3, 0, 3),
(52, 'Rica Jyn Caballero', 'rica@sample.com', 'e089b3b5750148e7f7fcc282635fb2d4', 3, 0, 4),
(53, 'Divine Marie Molina', 'divine@sample.com', 'a107b936b2d4ec89f7119a5484d87593', 3, 0, 5),
(54, 'Elena Colinares', 'elena@sample.com', 'bbadca995530ba3c915c375b8a110b77', 3, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `webcam`
--

CREATE TABLE `webcam` (
  `id` int(10) NOT NULL,
  `image` varchar(50) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_list`
--
ALTER TABLE `attendance_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_record`
--
ALTER TABLE `attendance_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aytb`
--
ALTER TABLE `aytb`
  ADD PRIMARY KEY (`ayID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_course`
--
ALTER TABLE `class_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daytb`
--
ALTER TABLE `daytb`
  ADD PRIMARY KEY (`dayID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetb`
--
ALTER TABLE `timetb`
  ADD PRIMARY KEY (`timeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webcam`
--
ALTER TABLE `webcam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_list`
--
ALTER TABLE `attendance_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance_record`
--
ALTER TABLE `attendance_record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aytb`
--
ALTER TABLE `aytb`
  MODIFY `ayID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1217;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `class_course`
--
ALTER TABLE `class_course`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `daytb`
--
ALTER TABLE `daytb`
  MODIFY `dayID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1178;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetb`
--
ALTER TABLE `timetb`
  MODIFY `timeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1171;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `webcam`
--
ALTER TABLE `webcam`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
