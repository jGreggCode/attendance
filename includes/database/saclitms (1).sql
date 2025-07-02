-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 03:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saclitms`
--
CREATE DATABASE IF NOT EXISTS `saclitms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `saclitms`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `rfid_code` varchar(50) NOT NULL,
  `user_type` enum('Student','Employee','Admin','') DEFAULT NULL,
  `date` date NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Normal',
  `reason` text NOT NULL DEFAULT '\'None\''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `rfid_code`, `user_type`, `date`, `time_in`, `time_out`, `status`, `reason`) VALUES
(105, '0005796121', 'Admin', '2025-07-01', '05:02:12', '11:28:06', 'Normal', '\'None\''),
(106, '0008522875', 'Student', '2025-07-01', '11:28:56', '11:29:22', 'Normal', '\'None\''),
(107, '0008490453', 'Employee', '2025-07-01', '11:29:13', '11:29:20', 'Normal', '\'None\''),
(111, '0008504785', 'Employee', '2019-03-24', '12:05:14', '12:10:56', 'Normal', '\'None\''),
(112, '0008526106', 'Employee', '2019-12-02', '12:10:47', '12:10:55', 'Normal', '\'None\''),
(113, '0008457235', 'Employee', '2019-08-15', '12:10:50', '12:10:58', 'Normal', '\'None\'');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_name_shorten` varchar(100) DEFAULT NULL,
  `course_ini` varchar(10) DEFAULT NULL,
  `department_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_name_shorten`, `course_ini`, `department_id`) VALUES
('ABCOMM-2025', 'Bachelor of Arts in Communication', 'AB Communication', 'AB Comm', 'SEAS-2025'),
('ABM-2025', 'Accountancy, Business and Management ', 'ABM', 'ABM', 'SHS-2025'),
('ABPSYCH-2025', 'Bachelor of Arts in Psychology', 'AB Psychology', 'AB Psych', 'SEAS-2025'),
('BEED-2025', 'Bachelor of Science in Elementary Education', 'BS Elementary Education', 'BEed', 'SEAS-2025'),
('BSA-2025', 'Bachelor of Science in Accountancy', 'BS Accountancy', 'BSA', 'SBAT-2025'),
('BSBA-2025', 'Bachelor of Science in Business Administration', 'BS Business Administration', 'BSBA', 'SBAT-2025'),
('BSCE-2025', 'Bachelor of Science in Civil Engineering', 'BS Civil Engineering', 'BSCE', 'SE-2025'),
('BSCRIM-2025', 'Bachelor of Science in Criminology', 'BS Criminology', 'BS Crim', 'CC-2025'),
('BSED-2025', 'Bachelor in Secondary Education', 'Bachelor in Secondary Education', 'BSEd', 'SEAS-2025'),
('BSHM-2025', 'Bachelor of Science in Hospitality Management', 'BS Hospitality Management', 'BSHM/BSHRM', 'SMIHT-2025'),
('BSIE-2025', 'Bachelor of Science in Industrial Engineering', 'BS Industrial Engineering', 'BSIE', 'SE-2025'),
('BSIT-2025', 'Bachelor of Science in Information Technology', 'BS Information Technology', 'BSIT', 'SBAT-2025'),
('BSMA-2025', 'Bachelor of Science in Management Accounting', 'BS Management Acccounting', 'BSMA', 'SBAT-2025'),
('BSMID-2025', 'Bachelor of Science in Midwifery', 'BS Midwifery', 'BS Mid', 'SAHS-2025'),
('BSMT-2025', 'Bachelor of Science in Medical Technology', 'BS Medical Technology', 'BSMT', 'SAHS-2025'),
('BSN-2025', 'Bachelor of Science in Nursing', 'BS Nursing', 'BSN', 'SAHS-2025'),
('BSPT-2025', 'Bachelor of Science in Physical Therapy ', 'BS Physical Therapy', 'BSPT', 'SAHS-2025'),
('BSTM-2025', 'Bachelor of Science in Tourism Management', 'BS Tourism Management', 'BSTM', 'SMIHT-2025'),
('DEN-2025', 'Doctor of Dental Medicine', 'Dentistry', 'DDM', 'SAHS-2025'),
('HE-2025', 'Home Economics', 'HE', 'HE', 'SHS-2025'),
('HUMSS-2025', 'Humanities and Social Sciences', 'HUMSS', 'HUMSS', 'SHS-2025'),
('ICT-2025', 'Information and Communication Technology', 'ICT', 'ICT', 'SHS-2025'),
('STEM-2025', 'Science, Technology, Engineering and Mathematics', 'STEM', 'STEM', 'SHS-2025');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(255) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `department_ini` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_ini`) VALUES
('ADMIN', 'Administrator', 'ADMIN'),
('CC-2025', 'COLLEGE OF CRIMINOLOGY', 'CC'),
('IBED-2025', 'INTEGRATED BASIC EDUCATION DEPARTMENT', 'IBED'),
('SAHS-2025', 'SCHOOL OF ALLIED HEALTH SCIENCES', 'SAHS'),
('SBAT-2025', 'SCHOOL OF BUSINESS ACCOUNTANCY, AND TECHNOLOGY', 'SBAT'),
('SE-2025', 'SCHOOL OF ENGINEERING', 'SE'),
('SEAS-2025', 'SCHOOL OF EDUCATION, ARTS AND SCIENCES', 'SEAS'),
('SHS-2025', 'SENIOR HIGH SCHOOL', 'SHS'),
('SMIHT-2025', 'SCHOOL OF MANAGEMENT FOR INTERNATIONAL HOSPITALITY AND TOURISM', 'SMIHT'),
('TESDA-2025', 'TESDA PROGRAMS', 'TESDA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `student_photo` varchar(1000) DEFAULT NULL,
  `rfid_code` varchar(50) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year_level` varchar(20) DEFAULT NULL,
  `academic_year` varchar(50) NOT NULL DEFAULT '2024-2025',
  `semester` varchar(10) NOT NULL DEFAULT '2',
  `department` varchar(50) NOT NULL,
  `user_type` enum('Admin','Employee','Student') NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_photo`, `rfid_code`, `user_id`, `first_name`, `middle_name`, `last_name`, `age`, `birthday`, `course`, `year_level`, `academic_year`, `semester`, `department`, `user_type`, `username`, `password`, `email`, `phone_number`, `created_at`) VALUES
(130, '../assets/User-placeholder.png', '1326219695', '2301-000001', 'Thomas', 'Kelly', 'Carr', 17, '2007-10-03', 'HUMSS', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000001', '', 'carrtk@gmail.com', '09305353004', '2025-07-01'),
(131, '../assets/User-placeholder.png', '2903160564', '2301-000002', 'Mitchell', 'Wendy', 'Mcmahon', 18, '2007-06-13', 'BS Business Administration', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000002', '', 'mcmahonmw@gmail.com', '09461404564', '2025-07-01'),
(132, '../assets/User-placeholder.png', '5398838513', '2301-000003', 'Stephen', 'Christopher', 'Brennan', 19, '2005-07-14', 'BS Midwifery', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000003', '', 'brennansc@gmail.com', '09147612008', '2025-07-01'),
(133, '../assets/User-placeholder.png', '9756846365', '2301-000004', 'Jason', 'Rhonda', 'Hampton', 18, '2007-04-11', 'Dentistry', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000004', '', 'hamptonjr@gmail.com', '09907200190', '2025-07-01'),
(134, '../assets/User-placeholder.png', '4649243729', '2301-000005', 'Christopher', 'Micheal', 'Copeland', 19, '2005-12-16', 'BS Civil Engineering', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000005', '', 'copelandcm@gmail.com', '09429692817', '2025-07-01'),
(135, '../assets/User-placeholder.png', '4111765444', '2301-000006', 'Johnny', 'Regina', 'Jones', 19, '2006-03-03', 'BS Nursing', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000006', '', 'jonesjr@gmail.com', '09227105347', '2025-07-01'),
(136, '../assets/User-placeholder.png', '6733303543', '2301-000007', 'Donald', 'Jonathan', 'Wang', 22, '2002-12-18', 'BS Criminology', '2', '2024-2025', '2', 'SE', 'Student', '2301-000007', '', 'wangdj@gmail.com', '09953592576', '2025-07-01'),
(137, '../assets/User-placeholder.png', '7060571022', '2301-000008', 'Jonathon', 'Michael', 'Cruz', 21, '2003-09-28', 'BS Elementary Education', '1', '2024-2025', '2', 'SE', 'Student', '2301-000008', '', 'cruzjm@gmail.com', '09239054628', '2025-07-01'),
(138, '../assets/User-placeholder.png', '5016406401', '2301-000009', 'Robert', 'Melissa', 'Love', 22, '2002-11-18', 'BS Management Accounting', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000009', '', 'loverm@gmail.com', '09545515399', '2025-07-01'),
(139, '../assets/User-placeholder.png', '5236924274', '2301-000010', 'Patrick', 'Jason', 'Anderson', 18, '2006-10-04', 'BS Management Accounting', '3', '2024-2025', '2', 'CC', 'Student', '2301-000010', '', 'andersonpj@gmail.com', '09261386890', '2025-07-01'),
(140, '../assets/User-placeholder.png', '8052484516', '2301-000011', 'Stephen', 'David', 'Zimmerman', 17, '2008-06-21', 'BS Business Administration', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000011', '', 'zimmermansd@gmail.com', '09845045180', '2025-07-01'),
(141, '../assets/User-placeholder.png', '4822720485', '2301-000012', 'Kyle', 'John', 'Hart', 22, '2002-12-13', 'AB Communication', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000012', '', 'hartkj@gmail.com', '09177943240', '2025-07-01'),
(142, '../assets/User-placeholder.png', '7010981914', '2301-000013', 'Christopher', 'Colleen', 'Young', 17, '2008-04-11', 'BS Accountancy', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000013', '', 'youngcc@gmail.com', '09657568003', '2025-07-01'),
(143, '../assets/User-placeholder.png', '6368571457', '2301-000014', 'Timothy', 'Matthew', 'Shelton', 18, '2006-12-11', 'BS Elementary Education', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000014', '', 'sheltontm@gmail.com', '09922359362', '2025-07-01'),
(144, '../assets/User-placeholder.png', '6930766933', '2301-000015', 'Wayne', 'Andrew', 'Benson', 17, '2008-01-31', 'AB Psychology', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000015', '', 'bensonwa@gmail.com', '09489732744', '2025-07-01'),
(145, '../assets/User-placeholder.png', '5568161743', '2301-000016', 'Adam', 'Jill', 'Bates', 18, '2007-01-27', 'BS Management Accounting', '3', '2024-2025', '2', 'CC', 'Student', '2301-000016', '', 'batesaj@gmail.com', '09860639107', '2025-07-01'),
(146, '../assets/User-placeholder.png', '0120877167', '2301-000017', 'David', 'Wesley', 'Price', 18, '2007-02-27', 'BS Hospitality Management', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000017', '', 'pricedw@gmail.com', '09155607716', '2025-07-01'),
(147, '../assets/User-placeholder.png', '9412814644', '2301-000018', 'Kenneth', 'Johnny', 'Jones', 23, '2002-06-13', 'BS Midwifery', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000018', '', 'joneskj@gmail.com', '09185776800', '2025-07-01'),
(148, '../assets/User-placeholder.png', '9837781178', '2301-000019', 'Manuel', 'Vanessa', 'Davis', 18, '2007-05-14', 'BS Criminology', '1', '2024-2025', '2', 'SE', 'Student', '2301-000019', '', 'davismv@gmail.com', '09491753607', '2025-07-01'),
(149, '../assets/User-placeholder.png', '7598881894', '2301-000020', 'Derek', 'Joshua', 'Mayer', 18, '2007-01-04', 'BS Business Administration', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000020', '', 'mayerdj@gmail.com', '09753767754', '2025-07-01'),
(150, '../assets/User-placeholder.png', '1805782621', '2301-000021', 'Johnny', 'John', 'Bowman', 23, '2002-02-26', 'BS Civil Engineering', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000021', '', 'bowmanjj@gmail.com', '09257127465', '2025-07-01'),
(151, '../assets/User-placeholder.png', '0825498267', '2301-000022', 'Phillip', 'Matthew', 'Olson', 17, '2007-08-12', 'BS Information Technology', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000022', '', 'olsonpm@gmail.com', '09206363114', '2025-07-01'),
(152, '../assets/User-placeholder.png', '5067674310', '2301-000023', 'George', 'Samantha', 'Marquez', 17, '2008-06-08', 'HE', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000023', '', 'marquezgs@gmail.com', '09139452416', '2025-07-01'),
(153, '../assets/User-placeholder.png', '8867579205', '2301-000024', 'Scott', 'Shane', 'Harper', 19, '2005-12-24', 'BS Medical Technology', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000024', '', 'harperss@gmail.com', '09692781354', '2025-07-01'),
(154, '../assets/User-placeholder.png', '7412884673', '2301-000025', 'Roger', 'John', 'Thomas', 22, '2002-09-08', 'BS Business Administration', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000025', '', 'thomasrj@gmail.com', '09690843667', '2025-07-01'),
(155, '../assets/User-placeholder.png', '3374950646', '2301-000026', 'Brian', 'Gerald', 'Haynes', 22, '2003-04-07', 'ICT', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000026', '', 'haynesbg@gmail.com', '09274372407', '2025-07-01'),
(156, '../assets/User-placeholder.png', '5625022087', '2301-000027', 'David', 'Amy', 'Carr', 21, '2003-12-06', 'BS Accountancy', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000027', '', 'carrda@gmail.com', '09255308879', '2025-07-01'),
(157, '../assets/User-placeholder.png', '3860689132', '2301-000028', 'Brett', 'Curtis', 'Morrow', 19, '2006-04-25', 'Dentistry', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000028', '', 'morrowbc@gmail.com', '09939358863', '2025-07-01'),
(158, '../assets/User-placeholder.png', '8075297854', '2301-000029', 'Jonathan', 'Andrea', 'Ochoa', 20, '2005-04-24', 'ICT', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000029', '', 'ochoaja@gmail.com', '09659046643', '2025-07-01'),
(159, '../assets/User-placeholder.png', '0955599307', '2301-000030', 'David', 'Karen', 'Gilbert', 19, '2006-06-20', 'HE', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000030', '', 'gilbertdk@gmail.com', '09510995578', '2025-07-01'),
(160, '../assets/User-placeholder.png', '1375403181', '2301-000031', 'Christian', 'Tricia', 'Edwards', 19, '2005-11-23', 'AB Psychology', '2', '2024-2025', '2', 'CC', 'Student', '2301-000031', '', 'edwardsct@gmail.com', '09340862591', '2025-07-01'),
(161, '../assets/User-placeholder.png', '9048512920', '2301-000032', 'Aaron', 'Ashley', 'Stevens', 21, '2003-09-16', 'BS Information Technology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000032', '', 'stevensaa@gmail.com', '09483790886', '2025-07-01'),
(162, '../assets/User-placeholder.png', '8511265461', '2301-000033', 'Ryan', 'Rachel', 'Sullivan', 17, '2007-09-14', 'BS Business Administration', '3', '2024-2025', '2', 'CC', 'Student', '2301-000033', '', 'sullivanrr@gmail.com', '09328847072', '2025-07-01'),
(163, '../assets/User-placeholder.png', '2646230585', '2301-000034', 'Sean', 'Katherine', 'Miller', 20, '2004-08-13', 'BS Criminology', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000034', '', 'millersk@gmail.com', '09425146134', '2025-07-01'),
(164, '../assets/User-placeholder.png', '6370201139', '2301-000035', 'Keith', 'John', 'Hanson', 22, '2003-04-09', 'BS Business Administration', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000035', '', 'hansonkj@gmail.com', '09644504743', '2025-07-01'),
(165, '../assets/User-placeholder.png', '6152182743', '2301-000036', 'Michael', 'Judy', 'Thomas', 20, '2005-06-21', 'AB Psychology', '4', '2024-2025', '2', 'SE', 'Student', '2301-000036', '', 'thomasmj@gmail.com', '09494012755', '2025-07-01'),
(166, '../assets/User-placeholder.png', '5636254727', '2301-000037', 'Cameron', 'Nancy', 'Harris', 21, '2003-08-19', 'BS Hospitality Management', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000037', '', 'harriscn@gmail.com', '09822372356', '2025-07-01'),
(167, '../assets/User-placeholder.png', '7373489066', '2301-000038', 'Miguel', 'Jeremy', 'Silva', 21, '2004-06-25', 'Dentistry', '3', '2024-2025', '2', 'SE', 'Student', '2301-000038', '', 'silvamj@gmail.com', '09257339225', '2025-07-01'),
(168, '../assets/User-placeholder.png', '5299516828', '2301-000039', 'Terry', 'Lynn', 'Smith', 21, '2003-10-20', 'ICT', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000039', '', 'smithtl@gmail.com', '09839371009', '2025-07-01'),
(169, '../assets/User-placeholder.png', '8780478229', '2301-000040', 'Kenneth', 'Gabriel', 'Lynn', 23, '2001-08-03', 'BS Accountancy', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000040', '', 'lynnkg@gmail.com', '09941126422', '2025-07-01'),
(170, '../assets/User-placeholder.png', '2044186770', '2301-000041', 'Kevin', 'Susan', 'Wright', 23, '2002-01-02', 'BS Management Accounting', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000041', '', 'wrightks@gmail.com', '09118787480', '2025-07-01'),
(171, '../assets/User-placeholder.png', '6435268048', '2301-000042', 'Scott', 'Janet', 'Munoz', 23, '2001-12-30', 'BS Elementary Education', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000042', '', 'munozsj@gmail.com', '09282468202', '2025-07-01'),
(172, '../assets/User-placeholder.png', '7823717164', '2301-000043', 'Ronald', 'Nathan', 'Walters', 19, '2005-07-11', 'AB Communication', '2', '2024-2025', '2', 'SE', 'Student', '2301-000043', '', 'waltersrn@gmail.com', '09858964583', '2025-07-01'),
(173, '../assets/User-placeholder.png', '5043898495', '2301-000044', 'Daniel', 'Charles', 'Edwards', 22, '2003-03-02', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'CC', 'Student', '2301-000044', '', 'edwardsdc@gmail.com', '09996286058', '2025-07-01'),
(174, '../assets/User-placeholder.png', '7192987733', '2301-000045', 'John', 'Gabriel', 'Alexander', 21, '2003-08-10', 'STEM', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000045', '', 'alexanderjg@gmail.com', '09135057467', '2025-07-01'),
(175, '../assets/User-placeholder.png', '4664405897', '2301-000046', 'Andre', 'Danielle', 'Harris', 20, '2005-06-27', 'Dentistry', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000046', '', 'harrisad@gmail.com', '09371090802', '2025-07-01'),
(176, '../assets/User-placeholder.png', '6283012960', '2301-000047', 'Ralph', 'Margaret', 'Miller', 23, '2002-03-10', 'ABM', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000047', '', 'millerrm@gmail.com', '09641460624', '2025-07-01'),
(177, '../assets/User-placeholder.png', '3401741680', '2301-000048', 'John', 'Michael', 'Miles', 22, '2002-09-24', 'BS Tourism Management', '2', '2024-2025', '2', 'CC', 'Student', '2301-000048', '', 'milesjm@gmail.com', '09581053050', '2025-07-01'),
(178, '../assets/User-placeholder.png', '2740073903', '2301-000049', 'Stephen', 'Latoya', 'Brown', 20, '2004-12-28', 'BS Civil Engineering', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000049', '', 'brownsl@gmail.com', '09576696566', '2025-07-01'),
(179, '../assets/User-placeholder.png', '0607288407', '2301-000050', 'David', 'Tammy', 'Young', 20, '2005-05-31', 'BS Tourism Management', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000050', '', 'youngdt@gmail.com', '09116893613', '2025-07-01'),
(180, '../assets/User-placeholder.png', '0551353677', '2301-000051', 'Jimmy', 'Elizabeth', 'Hernandez', 21, '2004-04-17', 'BS Physical Therapy', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000051', '', 'hernandezje@gmail.com', '09572565905', '2025-07-01'),
(181, '../assets/User-placeholder.png', '1830061033', '2301-000052', 'Jackson', 'Amanda', 'Romero', 21, '2004-05-27', 'HUMSS', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000052', '', 'romeroja@gmail.com', '09900977987', '2025-07-01'),
(182, '../assets/User-placeholder.png', '6276185193', '2301-000053', 'David', 'Chad', 'Mann', 20, '2004-12-21', 'BS Criminology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000053', '', 'manndc@gmail.com', '09214292166', '2025-07-01'),
(183, '../assets/User-placeholder.png', '3933500413', '2301-000054', 'Ronnie', 'James', 'Ward', 22, '2003-05-29', 'BS Hospitality Management', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000054', '', 'wardrj@gmail.com', '09685657416', '2025-07-01'),
(184, '../assets/User-placeholder.png', '2883536276', '2301-000055', 'Darrell', 'Julie', 'Bradley', 23, '2002-05-06', 'BS Elementary Education', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000055', '', 'bradleydj@gmail.com', '09270882032', '2025-07-01'),
(185, '../assets/User-placeholder.png', '2856036701', '2301-000056', 'Thomas', 'Nancy', 'Booth', 23, '2002-05-26', 'BS Accountancy', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000056', '', 'boothtn@gmail.com', '09234990579', '2025-07-01'),
(186, '../assets/User-placeholder.png', '8967828629', '2301-000057', 'Calvin', 'Ronald', 'Martinez', 18, '2006-11-24', 'AB Psychology', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000057', '', 'martinezcr@gmail.com', '09218082421', '2025-07-01'),
(187, '../assets/User-placeholder.png', '4623161830', '2301-000058', 'Christopher', 'Jimmy', 'Wade', 20, '2004-11-13', 'BS Nursing', '2', '2024-2025', '2', 'SE', 'Student', '2301-000058', '', 'wadecj@gmail.com', '09865739840', '2025-07-01'),
(188, '../assets/User-placeholder.png', '2457572697', '2301-000059', 'Andrew', 'Amy', 'Walters', 17, '2007-10-30', 'BS Midwifery', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000059', '', 'waltersaa@gmail.com', '09704576886', '2025-07-01'),
(189, '../assets/User-placeholder.png', '6910098999', '2301-000060', 'Dylan', 'Breanna', 'Bentley', 19, '2005-11-28', 'BS Nursing', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000060', '', 'bentleydb@gmail.com', '09587397794', '2025-07-01'),
(190, '../assets/User-placeholder.png', '2429574069', '2301-000061', 'Derek', 'Brett', 'Stevenson', 21, '2003-08-08', 'BS Nursing', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000061', '', 'stevensondb@gmail.com', '09749158482', '2025-07-01'),
(191, '../assets/User-placeholder.png', '9542682989', '2301-000062', 'James', 'Rachel', 'Thompson', 19, '2006-05-06', 'AB Psychology', '4', '2024-2025', '2', 'SE', 'Student', '2301-000062', '', 'thompsonjr@gmail.com', '09995431431', '2025-07-01'),
(192, '../assets/User-placeholder.png', '3251479221', '2301-000063', 'Derrick', 'Christopher', 'Miller', 19, '2005-09-26', 'ABM', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000063', '', 'millerdc@gmail.com', '09581790996', '2025-07-01'),
(193, '../assets/User-placeholder.png', '1682017870', '2301-000064', 'Matthew', 'Robert', 'Mcguire', 17, '2008-02-16', 'BS Industrial Engineering', '2', '2024-2025', '2', 'CC', 'Student', '2301-000064', '', 'mcguiremr@gmail.com', '09859367758', '2025-07-01'),
(194, '../assets/User-placeholder.png', '5996665380', '2301-000065', 'Joshua', 'Aaron', 'Cox', 17, '2007-10-03', 'BS Tourism Management', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000065', '', 'coxja@gmail.com', '09773283145', '2025-07-01'),
(195, '../assets/User-placeholder.png', '8757450088', '2301-000066', 'Andrew', 'Alicia', 'Edwards', 20, '2004-07-14', 'HUMSS', '4', '2024-2025', '2', 'CC', 'Student', '2301-000066', '', 'edwardsaa@gmail.com', '09207265212', '2025-07-01'),
(196, '../assets/User-placeholder.png', '6700505942', '2301-000067', 'Paul', 'Laura', 'Rodriguez', 23, '2001-07-26', 'ABM', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000067', '', 'rodriguezpl@gmail.com', '09876150048', '2025-07-01'),
(197, '../assets/User-placeholder.png', '1575741141', '2301-000068', 'Jay', 'Timothy', 'Powell', 19, '2006-01-01', 'BS Nursing', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000068', '', 'powelljt@gmail.com', '09852091282', '2025-07-01'),
(198, '../assets/User-placeholder.png', '7090546284', '2301-000069', 'Richard', 'Kyle', 'Parsons', 22, '2002-08-25', 'BS Nursing', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000069', '', 'parsonsrk@gmail.com', '09357463550', '2025-07-01'),
(199, '../assets/User-placeholder.png', '9315676931', '2301-000070', 'Tyler', 'Kristen', 'Ray', 17, '2008-04-14', 'BS Management Accounting', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000070', '', 'raytk@gmail.com', '09138896409', '2025-07-01'),
(200, '../assets/User-placeholder.png', '2458853073', '2301-000071', 'Jesse', 'Jacob', 'Rangel', 20, '2005-04-14', 'HUMSS', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000071', '', 'rangeljj@gmail.com', '09718544017', '2025-07-01'),
(201, '../assets/User-placeholder.png', '5853666486', '2301-000072', 'Charles', 'Anne', 'Cummings', 23, '2001-09-05', 'BS Physical Therapy', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000072', '', 'cummingsca@gmail.com', '09839705750', '2025-07-01'),
(202, '../assets/User-placeholder.png', '1280238222', '2301-000073', 'Adrian', 'Brandon', 'Spencer', 20, '2004-07-13', 'STEM', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000073', '', 'spencerab@gmail.com', '09760453168', '2025-07-01'),
(203, '../assets/User-placeholder.png', '0205578743', '2301-000074', 'Zachary', 'Bethany', 'Myers', 21, '2003-10-20', 'ABM', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000074', '', 'myerszb@gmail.com', '09587870255', '2025-07-01'),
(204, '../assets/User-placeholder.png', '9648758028', '2301-000075', 'Jonathan', 'Amber', 'Morrow', 17, '2008-01-20', 'BS Hospitality Management', '3', '2024-2025', '2', 'SE', 'Student', '2301-000075', '', 'morrowja@gmail.com', '09754725636', '2025-07-01'),
(205, '../assets/User-placeholder.png', '6760445392', '2301-000076', 'Scott', 'Tony', 'Ritter', 21, '2004-02-06', 'BS Physical Therapy', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000076', '', 'ritterst@gmail.com', '09520298816', '2025-07-01'),
(206, '../assets/User-placeholder.png', '3277499849', '2301-000077', 'Logan', 'Christopher', 'Bell', 18, '2006-07-11', 'STEM', '4', '2024-2025', '2', 'CC', 'Student', '2301-000077', '', 'belllc@gmail.com', '09801523071', '2025-07-01'),
(207, '../assets/User-placeholder.png', '5762940599', '2301-000078', 'Blake', 'Chad', 'Robinson', 18, '2006-07-28', 'BS Midwifery', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000078', '', 'robinsonbc@gmail.com', '09667245751', '2025-07-01'),
(208, '../assets/User-placeholder.png', '9240166228', '2301-000079', 'Andre', 'Melanie', 'Klein', 19, '2006-03-24', 'BS Nursing', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000079', '', 'kleinam@gmail.com', '09387240403', '2025-07-01'),
(209, '../assets/User-placeholder.png', '0118669637', '2301-000080', 'Geoffrey', 'Jesus', 'Wallace', 22, '2002-07-20', 'BS Hospitality Management', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000080', '', 'wallacegj@gmail.com', '09636814539', '2025-07-01'),
(210, '../assets/User-placeholder.png', '8489975924', '2301-000081', 'Benjamin', 'Carol', 'Cannon', 18, '2006-09-12', 'BS Elementary Education', '2', '2024-2025', '2', 'CC', 'Student', '2301-000081', '', 'cannonbc@gmail.com', '09252812975', '2025-07-01'),
(211, '../assets/User-placeholder.png', '5886614999', '2301-000082', 'Adam', 'Kristen', 'Murphy', 22, '2002-12-16', 'BS Criminology', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000082', '', 'murphyak@gmail.com', '09365929457', '2025-07-01'),
(212, '../assets/User-placeholder.png', '0487683670', '2301-000083', 'Vincent', 'Dustin', 'Pierce', 23, '2002-01-12', 'BS Nursing', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000083', '', 'piercevd@gmail.com', '09897256182', '2025-07-01'),
(213, '../assets/User-placeholder.png', '5569292645', '2301-000084', 'Jeremy', 'Theresa', 'Jackson', 17, '2008-05-28', 'BS Medical Technology', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000084', '', 'jacksonjt@gmail.com', '09826278576', '2025-07-01'),
(214, '../assets/User-placeholder.png', '1344819783', '2301-000085', 'Joseph', 'Kurt', 'Hendrix', 20, '2004-08-14', 'BS Physical Therapy', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000085', '', 'hendrixjk@gmail.com', '09347570258', '2025-07-01'),
(215, '../assets/User-placeholder.png', '6543109105', '2301-000086', 'Russell', 'Norma', 'Williams', 22, '2002-12-07', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000086', '', 'williamsrn@gmail.com', '09803795895', '2025-07-01'),
(216, '../assets/User-placeholder.png', '2779338081', '2301-000087', 'Edward', 'Christine', 'Madden', 21, '2004-06-19', 'HE', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000087', '', 'maddenec@gmail.com', '09627837512', '2025-07-01'),
(217, '../assets/User-placeholder.png', '8591575265', '2301-000088', 'Allen', 'Sandra', 'Moss', 23, '2002-06-26', 'ICT', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000088', '', 'mossas@gmail.com', '09144338729', '2025-07-01'),
(218, '../assets/User-placeholder.png', '2062683316', '2301-000089', 'Jeffrey', 'Laura', 'Cohen', 20, '2005-04-10', 'BS Management Accounting', '4', '2024-2025', '2', 'CC', 'Student', '2301-000089', '', 'cohenjl@gmail.com', '09932639928', '2025-07-01'),
(219, '../assets/User-placeholder.png', '3563267480', '2301-000090', 'Joshua', 'Dana', 'Davis', 22, '2003-04-14', 'BS Management Accounting', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000090', '', 'davisjd@gmail.com', '09704471492', '2025-07-01'),
(220, '../assets/User-placeholder.png', '0414500352', '2301-000091', 'Brandon', 'Darius', 'Osborne', 23, '2001-11-13', 'STEM', '4', '2024-2025', '2', 'CC', 'Student', '2301-000091', '', 'osbornebd@gmail.com', '09532033248', '2025-07-01'),
(221, '../assets/User-placeholder.png', '7451554011', '2301-000092', 'Steven', 'Lori', 'Eaton', 18, '2006-10-31', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000092', '', 'eatonsl@gmail.com', '09346052996', '2025-07-01'),
(222, '../assets/User-placeholder.png', '7295582165', '2301-000093', 'Hector', 'Nicole', 'Martin', 20, '2004-10-29', 'BS Industrial Engineering', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000093', '', 'martinhn@gmail.com', '09163330170', '2025-07-01'),
(223, '../assets/User-placeholder.png', '5717302370', '2301-000094', 'Steven', 'Anthony', 'Molina', 23, '2001-07-19', 'BS Nursing', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000094', '', 'molinasa@gmail.com', '09675614012', '2025-07-01'),
(224, '../assets/User-placeholder.png', '4377111520', '2301-000095', 'John', 'Karen', 'Barber', 20, '2005-02-05', 'BS Elementary Education', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000095', '', 'barberjk@gmail.com', '09579406018', '2025-07-01'),
(225, '../assets/User-placeholder.png', '0910562131', '2301-000096', 'Richard', 'Edward', 'Evans', 18, '2006-11-14', 'BS Hospitality Management', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000096', '', 'evansre@gmail.com', '09296527064', '2025-07-01'),
(226, '../assets/User-placeholder.png', '1240970311', '2301-000097', 'Austin', 'James', 'Rich', 23, '2002-02-28', 'HE', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000097', '', 'richaj@gmail.com', '09513941415', '2025-07-01'),
(227, '../assets/User-placeholder.png', '0602851182', '2301-000098', 'Antonio', 'Shannon', 'Harris', 17, '2007-07-10', 'BS Hospitality Management', '1', '2024-2025', '2', 'CC', 'Student', '2301-000098', '', 'harrisas@gmail.com', '09620960550', '2025-07-01'),
(228, '../assets/User-placeholder.png', '5285669258', '2301-000099', 'Martin', 'Shawn', 'Richard', 23, '2002-02-27', 'BS Information Technology', '3', '2024-2025', '2', 'SE', 'Student', '2301-000099', '', 'richardms@gmail.com', '09976750760', '2025-07-01'),
(229, '../assets/User-placeholder.png', '6869086360', '2301-000100', 'Edward', 'Patrick', 'Walters', 20, '2005-03-20', 'BS Tourism Management', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000100', '', 'waltersep@gmail.com', '09947262270', '2025-07-01'),
(230, '../assets/User-placeholder.png', '4766232715', '2301-000101', 'Jeffrey', 'Brenda', 'Mckinney', 17, '2007-11-11', 'BS Elementary Education', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000101', '', 'mckinneyjb@gmail.com', '09781142682', '2025-07-01'),
(231, '../assets/User-placeholder.png', '4466590422', '2301-000102', 'Patrick', 'Richard', 'Blair', 21, '2003-09-29', 'BS Civil Engineering', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000102', '', 'blairpr@gmail.com', '09856731191', '2025-07-01'),
(232, '../assets/User-placeholder.png', '4577794746', '2301-000103', 'Thomas', 'William', 'Wiley', 21, '2003-12-05', 'BS Medical Technology', '3', '2024-2025', '2', 'CC', 'Student', '2301-000103', '', 'wileytw@gmail.com', '09843998709', '2025-07-01'),
(233, '../assets/User-placeholder.png', '1200645074', '2301-000104', 'Scott', 'Benjamin', 'Collins', 22, '2002-10-14', 'ICT', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000104', '', 'collinssb@gmail.com', '09427211016', '2025-07-01'),
(234, '../assets/User-placeholder.png', '3333057825', '2301-000105', 'Edward', 'Victor', 'Petersen', 19, '2006-02-27', 'BS Accountancy', '1', '2024-2025', '2', 'CC', 'Student', '2301-000105', '', 'petersenev@gmail.com', '09782362541', '2025-07-01'),
(235, '../assets/User-placeholder.png', '8559219446', '2301-000106', 'Colin', 'Jennifer', 'Wallace', 18, '2007-03-12', 'BS Medical Technology', '3', '2024-2025', '2', 'CC', 'Student', '2301-000106', '', 'wallacecj@gmail.com', '09893646587', '2025-07-01'),
(236, '../assets/User-placeholder.png', '5296510802', '2301-000107', 'Troy', 'Joshua', 'Hamilton', 18, '2007-03-11', 'BS Medical Technology', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000107', '', 'hamiltontj@gmail.com', '09106600703', '2025-07-01'),
(237, '../assets/User-placeholder.png', '5254240830', '2301-000108', 'Dylan', 'Paul', 'Carter', 20, '2004-08-26', 'ABM', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000108', '', 'carterdp@gmail.com', '09405373972', '2025-07-01'),
(238, '../assets/User-placeholder.png', '6446190561', '2301-000109', 'Aaron', 'Robert', 'Vaughn', 19, '2005-08-23', 'BS Civil Engineering', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000109', '', 'vaughnar@gmail.com', '09929081223', '2025-07-01'),
(239, '../assets/User-placeholder.png', '9872754826', '2301-000110', 'Timothy', 'Stacy', 'Clark', 20, '2004-11-06', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000110', '', 'clarkts@gmail.com', '09741599461', '2025-07-01'),
(240, '../assets/User-placeholder.png', '8677387661', '2301-000111', 'Johnathan', 'James', 'Lloyd', 22, '2003-05-23', 'BS Civil Engineering', '2', '2024-2025', '2', 'SE', 'Student', '2301-000111', '', 'lloydjj@gmail.com', '09655897598', '2025-07-01'),
(241, '../assets/User-placeholder.png', '4517422413', '2301-000112', 'David', 'Catherine', 'Campbell', 17, '2008-04-24', 'HUMSS', '1', '2024-2025', '2', 'CC', 'Student', '2301-000112', '', 'campbelldc@gmail.com', '09538533509', '2025-07-01'),
(242, '../assets/User-placeholder.png', '3562456757', '2301-000113', 'Ronald', 'Diane', 'Hernandez', 20, '2004-10-04', 'BS Physical Therapy', '4', '2024-2025', '2', 'SE', 'Student', '2301-000113', '', 'hernandezrd@gmail.com', '09841109488', '2025-07-01'),
(243, '../assets/User-placeholder.png', '7199984913', '2301-000114', 'Steven', 'Oscar', 'Ward', 23, '2001-07-20', 'BS Management Accounting', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000114', '', 'wardso@gmail.com', '09730229729', '2025-07-01'),
(244, '../assets/User-placeholder.png', '2666127091', '2301-000115', 'Anthony', 'James', 'Sanford', 17, '2007-08-28', 'BS Tourism Management', '2', '2024-2025', '2', 'SE', 'Student', '2301-000115', '', 'sanfordaj@gmail.com', '09591090068', '2025-07-01'),
(245, '../assets/User-placeholder.png', '2088447127', '2301-000116', 'Erik', 'Renee', 'Chavez', 23, '2001-10-23', 'HE', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000116', '', 'chavezer@gmail.com', '09333516448', '2025-07-01'),
(246, '../assets/User-placeholder.png', '7789390176', '2301-000117', 'Joshua', 'Todd', 'Davis', 19, '2006-01-27', 'BS Nursing', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000117', '', 'davisjt@gmail.com', '09959318491', '2025-07-01'),
(247, '../assets/User-placeholder.png', '3490349839', '2301-000118', 'Bryan', 'Anthony', 'Mccullough', 20, '2005-04-21', 'BS Civil Engineering', '4', '2024-2025', '2', 'CC', 'Student', '2301-000118', '', 'mcculloughba@gmail.com', '09636740196', '2025-07-01'),
(248, '../assets/User-placeholder.png', '2519961323', '2301-000119', 'Michael', 'Todd', 'Carter', 19, '2006-05-07', 'BS Midwifery', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000119', '', 'cartermt@gmail.com', '09549672063', '2025-07-01'),
(249, '../assets/User-placeholder.png', '6729190819', '2301-000120', 'Brian', 'Ralph', 'Hicks', 22, '2002-09-10', 'BS Midwifery', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000120', '', 'hicksbr@gmail.com', '09301944729', '2025-07-01'),
(250, '../assets/User-placeholder.png', '0080159148', '2301-000121', 'Ricky', 'Alexandra', 'Diaz', 19, '2005-09-24', 'BS Elementary Education', '3', '2024-2025', '2', 'SE', 'Student', '2301-000121', '', 'diazra@gmail.com', '09339658128', '2025-07-01'),
(251, '../assets/User-placeholder.png', '0611193861', '2301-000122', 'Christopher', 'Christine', 'Rios', 20, '2004-08-22', 'BS Physical Therapy', '1', '2024-2025', '2', 'CC', 'Student', '2301-000122', '', 'rioscc@gmail.com', '09531893403', '2025-07-01'),
(252, '../assets/User-placeholder.png', '4506020881', '2301-000123', 'Michael', 'Daniel', 'Calderon', 17, '2008-04-03', 'BS Medical Technology', '3', '2024-2025', '2', 'SE', 'Student', '2301-000123', '', 'calderonmd@gmail.com', '09997374374', '2025-07-01'),
(253, '../assets/User-placeholder.png', '2238981089', '2301-000124', 'Matthew', 'Julian', 'Harper', 19, '2005-10-13', 'BS Civil Engineering', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000124', '', 'harpermj@gmail.com', '09635274905', '2025-07-01'),
(254, '../assets/User-placeholder.png', '6366237035', '2301-000125', 'Christopher', 'Patricia', 'Adkins', 18, '2006-09-03', 'AB Psychology', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000125', '', 'adkinscp@gmail.com', '09961953966', '2025-07-01'),
(255, '../assets/User-placeholder.png', '5640536056', '2301-000126', 'Martin', 'Brian', 'Eaton', 23, '2001-10-12', 'BS Business Administration', '1', '2024-2025', '2', 'SE', 'Student', '2301-000126', '', 'eatonmb@gmail.com', '09164762861', '2025-07-01'),
(256, '../assets/User-placeholder.png', '1490424433', '2301-000127', 'Todd', 'Adrian', 'Gonzalez', 22, '2002-07-13', 'BS Midwifery', '3', '2024-2025', '2', 'SE', 'Student', '2301-000127', '', 'gonzalezta@gmail.com', '09624111429', '2025-07-01'),
(257, '../assets/User-placeholder.png', '8043310027', '2301-000128', 'Richard', 'Tanya', 'Wright', 18, '2006-12-22', 'BS Business Administration', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000128', '', 'wrightrt@gmail.com', '09793331021', '2025-07-01'),
(258, '../assets/User-placeholder.png', '6685449904', '2301-000129', 'Keith', 'Latasha', 'Graves', 23, '2002-02-07', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000129', '', 'graveskl@gmail.com', '09586967256', '2025-07-01'),
(259, '../assets/User-placeholder.png', '7070562122', '2301-000130', 'Craig', 'William', 'Harrison', 21, '2003-11-18', 'ABM', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000130', '', 'harrisoncw@gmail.com', '09213702559', '2025-07-01'),
(260, '../assets/User-placeholder.png', '1905824991', '2301-000131', 'James', 'Krystal', 'Smith', 21, '2004-05-11', 'AB Communication', '1', '2024-2025', '2', 'SE', 'Student', '2301-000131', '', 'smithjk@gmail.com', '09492102992', '2025-07-01'),
(261, '../assets/User-placeholder.png', '7440573973', '2301-000132', 'Steven', 'Adam', 'Collins', 23, '2002-01-30', 'BS Information Technology', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000132', '', 'collinssa@gmail.com', '09851235061', '2025-07-01'),
(262, '../assets/User-placeholder.png', '2022953911', '2301-000133', 'Gregory', 'Anna', 'Atkinson', 18, '2007-05-07', 'BS Management Accounting', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000133', '', 'atkinsonga@gmail.com', '09384193537', '2025-07-01'),
(263, '../assets/User-placeholder.png', '0770197706', '2301-000134', 'Matthew', 'Keith', 'Griffith', 23, '2001-07-24', 'HE', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000134', '', 'griffithmk@gmail.com', '09962634588', '2025-07-01'),
(264, '../assets/User-placeholder.png', '7988724499', '2301-000135', 'Michael', 'Joanne', 'Larsen', 22, '2003-06-23', 'BS Accountancy', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000135', '', 'larsenmj@gmail.com', '09435105945', '2025-07-01'),
(265, '../assets/User-placeholder.png', '3094518257', '2301-000136', 'George', 'Natasha', 'Mendoza', 23, '2002-04-09', 'AB Psychology', '2', '2024-2025', '2', 'CC', 'Student', '2301-000136', '', 'mendozagn@gmail.com', '09367907923', '2025-07-01'),
(266, '../assets/User-placeholder.png', '4346254948', '2301-000137', 'Eddie', 'Alejandro', 'Mills', 17, '2008-02-15', 'AB Psychology', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000137', '', 'millsea@gmail.com', '09812195426', '2025-07-01'),
(267, '../assets/User-placeholder.png', '2164716386', '2301-000138', 'Wayne', 'Caitlin', 'Johnson', 19, '2006-01-04', 'BS Hospitality Management', '3', '2024-2025', '2', 'SE', 'Student', '2301-000138', '', 'johnsonwc@gmail.com', '09380998075', '2025-07-01'),
(268, '../assets/User-placeholder.png', '0800238751', '2301-000139', 'Vincent', 'Maria', 'Barnes', 23, '2001-08-27', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000139', '', 'barnesvm@gmail.com', '09351462388', '2025-07-01'),
(269, '../assets/User-placeholder.png', '7384361067', '2301-000140', 'Johnathan', 'Alisha', 'Rogers', 19, '2006-05-30', 'BS Accountancy', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000140', '', 'rogersja@gmail.com', '09133335521', '2025-07-01'),
(270, '../assets/User-placeholder.png', '1959284366', '2301-000141', 'Ryan', 'Robert', 'Lyons', 22, '2003-05-23', 'BS Industrial Engineering', '4', '2024-2025', '2', 'SE', 'Student', '2301-000141', '', 'lyonsrr@gmail.com', '09607616129', '2025-07-01'),
(271, '../assets/User-placeholder.png', '8212830157', '2301-000142', 'Charles', 'Michael', 'Sanders', 17, '2007-09-26', 'BS Civil Engineering', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000142', '', 'sanderscm@gmail.com', '09762173281', '2025-07-01'),
(272, '../assets/User-placeholder.png', '0254663397', '2301-000143', 'Jordan', 'Sean', 'Rodriguez', 23, '2001-09-18', 'BS Criminology', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000143', '', 'rodriguezjs@gmail.com', '09152577570', '2025-07-01'),
(273, '../assets/User-placeholder.png', '2892900346', '2301-000144', 'Nicholas', 'David', 'Young', 21, '2004-03-20', 'BS Elementary Education', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000144', '', 'youngnd@gmail.com', '09311846977', '2025-07-01'),
(274, '../assets/User-placeholder.png', '7107629203', '2301-000145', 'Johnathan', 'Shawna', 'Martinez', 20, '2004-08-13', 'BS Tourism Management', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000145', '', 'martinezjs@gmail.com', '09177737222', '2025-07-01'),
(275, '../assets/User-placeholder.png', '2769028703', '2301-000146', 'Joel', 'Cynthia', 'Morgan', 20, '2005-02-19', 'BS Business Administration', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000146', '', 'morganjc@gmail.com', '09101512545', '2025-07-01'),
(276, '../assets/User-placeholder.png', '8743886675', '2301-000147', 'Scott', 'Ryan', 'Stewart', 20, '2005-05-17', 'BS Information Technology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000147', '', 'stewartsr@gmail.com', '09782927022', '2025-07-01'),
(277, '../assets/User-placeholder.png', '5411520751', '2301-000148', 'John', 'Jessica', 'Walton', 17, '2008-06-17', 'HUMSS', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000148', '', 'waltonjj@gmail.com', '09917835037', '2025-07-01'),
(278, '../assets/User-placeholder.png', '5017660560', '2301-000149', 'Jason', 'Maria', 'Thompson', 18, '2007-03-16', 'BS Criminology', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000149', '', 'thompsonjm@gmail.com', '09138563032', '2025-07-01'),
(279, '../assets/User-placeholder.png', '4037399905', '2301-000150', 'Duane', 'Thomas', 'Ashley', 22, '2003-01-07', 'BS Nursing', '1', '2024-2025', '2', 'SE', 'Student', '2301-000150', '', 'ashleydt@gmail.com', '09739280516', '2025-07-01'),
(280, '../assets/User-placeholder.png', '3384883211', '2301-000151', 'Dennis', 'Michelle', 'Newman', 23, '2001-11-24', 'HUMSS', '2', '2024-2025', '2', 'CC', 'Student', '2301-000151', '', 'newmandm@gmail.com', '09744395710', '2025-07-01'),
(281, '../assets/User-placeholder.png', '2634357747', '2301-000152', 'Matthew', 'Raven', 'Smith', 20, '2004-08-02', 'AB Communication', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000152', '', 'smithmr@gmail.com', '09715892753', '2025-07-01'),
(282, '../assets/User-placeholder.png', '3200863401', '2301-000153', 'Tony', 'Kyle', 'Cervantes', 23, '2001-11-06', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000153', '', 'cervantestk@gmail.com', '09311310869', '2025-07-01'),
(283, '../assets/User-placeholder.png', '4167044177', '2301-000154', 'Nathan', 'Robert', 'English', 22, '2003-02-08', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'CC', 'Student', '2301-000154', '', 'englishnr@gmail.com', '09223075909', '2025-07-01'),
(284, '../assets/User-placeholder.png', '1431235477', '2301-000155', 'Richard', 'Brandon', 'Smith', 23, '2001-11-04', 'AB Communication', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000155', '', 'smithrb@gmail.com', '09352743871', '2025-07-01'),
(285, '../assets/User-placeholder.png', '1866339356', '2301-000156', 'Eric', 'Kimberly', 'Estes', 17, '2008-03-17', 'BS Civil Engineering', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000156', '', 'estesek@gmail.com', '09567647686', '2025-07-01'),
(286, '../assets/User-placeholder.png', '6815514304', '2301-000157', 'Hayden', 'Amy', 'Little', 18, '2006-09-16', 'AB Psychology', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000157', '', 'littleha@gmail.com', '09333342986', '2025-07-01'),
(287, '../assets/User-placeholder.png', '5857502856', '2301-000158', 'Charles', 'William', 'Fitzgerald', 21, '2004-02-28', 'BS Industrial Engineering', '2', '2024-2025', '2', 'SE', 'Student', '2301-000158', '', 'fitzgeraldcw@gmail.com', '09189757587', '2025-07-01'),
(288, '../assets/User-placeholder.png', '0130580470', '2301-000159', 'Michael', 'Melissa', 'Jackson', 18, '2006-07-23', 'BS Tourism Management', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000159', '', 'jacksonmm@gmail.com', '09450544594', '2025-07-01'),
(289, '../assets/User-placeholder.png', '6567895030', '2301-000160', 'Ronald', 'Joshua', 'Ferguson', 21, '2004-01-12', 'BS Medical Technology', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000160', '', 'fergusonrj@gmail.com', '09588242279', '2025-07-01'),
(290, '../assets/User-placeholder.png', '5139904054', '2301-000161', 'David', 'Trevor', 'Franklin', 19, '2006-04-14', 'BS Management Accounting', '1', '2024-2025', '2', 'SE', 'Student', '2301-000161', '', 'franklindt@gmail.com', '09470455264', '2025-07-01'),
(291, '../assets/User-placeholder.png', '6340296291', '2301-000162', 'Jorge', 'Kendra', 'Rosales', 18, '2006-07-27', 'BS Civil Engineering', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000162', '', 'rosalesjk@gmail.com', '09646809903', '2025-07-01'),
(292, '../assets/User-placeholder.png', '7940282991', '2301-000163', 'Richard', 'Jamie', 'Martinez', 22, '2003-03-10', 'BS Civil Engineering', '1', '2024-2025', '2', 'CC', 'Student', '2301-000163', '', 'martinezrj@gmail.com', '09716022916', '2025-07-01'),
(293, '../assets/User-placeholder.png', '2565933563', '2301-000164', 'Mathew', 'Steven', 'Sims', 18, '2007-03-25', 'HUMSS', '2', '2024-2025', '2', 'SE', 'Student', '2301-000164', '', 'simsms@gmail.com', '09877382710', '2025-07-01'),
(294, '../assets/User-placeholder.png', '9472868270', '2301-000165', 'Robert', 'Tamara', 'Brown', 21, '2004-01-24', 'BS Civil Engineering', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000165', '', 'brownrt@gmail.com', '09405141129', '2025-07-01'),
(295, '../assets/User-placeholder.png', '8372993175', '2301-000166', 'John', 'Danielle', 'Kelley', 22, '2003-06-20', 'BS Nursing', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000166', '', 'kelleyjd@gmail.com', '09245980848', '2025-07-01'),
(296, '../assets/User-placeholder.png', '0119634334', '2301-000167', 'Joshua', 'Amber', 'Reed', 18, '2007-01-28', 'BS Elementary Education', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000167', '', 'reedja@gmail.com', '09813870857', '2025-07-01'),
(297, '../assets/User-placeholder.png', '8062239375', '2301-000168', 'Steven', 'Stefanie', 'Henderson', 20, '2005-06-12', 'AB Communication', '1', '2024-2025', '2', 'SE', 'Student', '2301-000168', '', 'hendersonss@gmail.com', '09845073394', '2025-07-01'),
(298, '../assets/User-placeholder.png', '1636246798', '2301-000169', 'Paul', 'Sara', 'Wise', 21, '2003-12-28', 'STEM', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000169', '', 'wiseps@gmail.com', '09210898090', '2025-07-01'),
(299, '../assets/User-placeholder.png', '3811899383', '2301-000170', 'Ryan', 'Jeremy', 'Lawson', 21, '2003-11-10', 'BS Nursing', '4', '2024-2025', '2', 'CC', 'Student', '2301-000170', '', 'lawsonrj@gmail.com', '09156554463', '2025-07-01'),
(300, '../assets/User-placeholder.png', '4017170747', '2301-000171', 'William', 'Cassandra', 'Collins', 19, '2005-07-08', 'BS Accountancy', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000171', '', 'collinswc@gmail.com', '09975050016', '2025-07-01'),
(301, '../assets/User-placeholder.png', '4285484003', '2301-000172', 'Bryan', 'Stephen', 'Vega', 20, '2004-12-20', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000172', '', 'vegabs@gmail.com', '09455117145', '2025-07-01'),
(302, '../assets/User-placeholder.png', '0481406270', '2301-000173', 'Jeremy', 'Jerome', 'Chang', 23, '2002-02-12', 'BS Tourism Management', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000173', '', 'changjj@gmail.com', '09960744847', '2025-07-01'),
(303, '../assets/User-placeholder.png', '4470425180', '2301-000174', 'Jesse', 'Joshua', 'King', 21, '2004-04-17', 'BS Civil Engineering', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000174', '', 'kingjj@gmail.com', '09350665752', '2025-07-01'),
(304, '../assets/User-placeholder.png', '2634461460', '2301-000175', 'Carlos', 'Carrie', 'Jones', 18, '2006-08-06', 'STEM', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000175', '', 'jonescc@gmail.com', '09391550280', '2025-07-01'),
(305, '../assets/User-placeholder.png', '2086002039', '2301-000176', 'Paul', 'Robert', 'Smith', 21, '2003-12-27', 'BS Hospitality Management', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000176', '', 'smithpr@gmail.com', '09270926271', '2025-07-01'),
(306, '../assets/User-placeholder.png', '0227604307', '2301-000177', 'Johnny', 'Molly', 'Hughes', 21, '2003-09-10', 'ICT', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000177', '', 'hughesjm@gmail.com', '09834243146', '2025-07-01'),
(307, '../assets/User-placeholder.png', '4433926214', '2301-000178', 'Jonathon', 'Hannah', 'Thomas', 23, '2002-05-01', 'BS Hospitality Management', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000178', '', 'thomasjh@gmail.com', '09548923919', '2025-07-01'),
(308, '../assets/User-placeholder.png', '2276596112', '2301-000179', 'Benjamin', 'Kevin', 'Wright', 23, '2001-09-24', 'BS Nursing', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000179', '', 'wrightbk@gmail.com', '09303936167', '2025-07-01'),
(309, '../assets/User-placeholder.png', '2560618449', '2301-000180', 'Lawrence', 'Madeline', 'Khan', 20, '2004-10-30', 'BS Management Accounting', '3', '2024-2025', '2', 'SE', 'Student', '2301-000180', '', 'khanlm@gmail.com', '09355124806', '2025-07-01'),
(310, '../assets/User-placeholder.png', '5349421177', '2301-000181', 'Brian', 'Kayla', 'Faulkner', 22, '2003-06-20', 'BS Elementary Education', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000181', '', 'faulknerbk@gmail.com', '09516967199', '2025-07-01'),
(311, '../assets/User-placeholder.png', '1128348930', '2301-000182', 'Thomas', 'Kevin', 'Richards', 18, '2007-05-31', 'ICT', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000182', '', 'richardstk@gmail.com', '09941768786', '2025-07-01'),
(312, '../assets/User-placeholder.png', '6765596994', '2301-000183', 'Jeff', 'Michael', 'Bush', 18, '2006-12-15', 'BS Civil Engineering', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000183', '', 'bushjm@gmail.com', '09568050154', '2025-07-01'),
(313, '../assets/User-placeholder.png', '2997688384', '2301-000184', 'Christopher', 'Steven', 'Sanchez', 20, '2004-11-09', 'AB Communication', '2', '2024-2025', '2', 'CC', 'Student', '2301-000184', '', 'sanchezcs@gmail.com', '09344960273', '2025-07-01'),
(314, '../assets/User-placeholder.png', '4684269685', '2301-000185', 'Ronald', 'Alyssa', 'Davis', 23, '2002-01-25', 'BS Management Accounting', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000185', '', 'davisra@gmail.com', '09501943831', '2025-07-01'),
(315, '../assets/User-placeholder.png', '3485636535', '2301-000186', 'Grant', 'Courtney', 'Davis', 17, '2007-12-26', 'HUMSS', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000186', '', 'davisgc@gmail.com', '09864446833', '2025-07-01'),
(316, '../assets/User-placeholder.png', '2609213067', '2301-000187', 'Samuel', 'Paul', 'Martinez', 22, '2003-03-17', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SE', 'Student', '2301-000187', '', 'martinezsp@gmail.com', '09594278766', '2025-07-01'),
(317, '../assets/User-placeholder.png', '4529888896', '2301-000188', 'Joshua', 'Danielle', 'Riley', 19, '2006-03-24', 'STEM', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000188', '', 'rileyjd@gmail.com', '09608997384', '2025-07-01'),
(318, '../assets/User-placeholder.png', '1975866246', '2301-000189', 'Chad', 'Rebekah', 'Wang', 19, '2006-05-10', 'BS Industrial Engineering', '3', '2024-2025', '2', 'CC', 'Student', '2301-000189', '', 'wangcr@gmail.com', '09885163173', '2025-07-01'),
(319, '../assets/User-placeholder.png', '8714944939', '2301-000190', 'Jeffery', 'Jorge', 'Jordan', 17, '2008-03-06', 'BS Civil Engineering', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000190', '', 'jordanjj@gmail.com', '09263784664', '2025-07-01'),
(320, '../assets/User-placeholder.png', '1521329442', '2301-000191', 'Carlos', 'Casey', 'Tate', 17, '2008-04-08', 'Dentistry', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000191', '', 'tatecc@gmail.com', '09965211067', '2025-07-01'),
(321, '../assets/User-placeholder.png', '3907385129', '2301-000192', 'Carlos', 'Jeremy', 'Smith', 19, '2005-10-29', 'STEM', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000192', '', 'smithcj@gmail.com', '09844947664', '2025-07-01'),
(322, '../assets/User-placeholder.png', '3727292704', '2301-000193', 'Robert', 'Michelle', 'Warren', 19, '2006-04-01', 'BS Physical Therapy', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000193', '', 'warrenrm@gmail.com', '09909146636', '2025-07-01'),
(323, '../assets/User-placeholder.png', '8694672510', '2301-000194', 'Bryan', 'Timothy', 'Cunningham', 18, '2007-01-14', 'AB Psychology', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000194', '', 'cunninghambt@gmail.com', '09745921591', '2025-07-01'),
(324, '../assets/User-placeholder.png', '7699217756', '2301-000195', 'James', 'Katie', 'Foster', 19, '2005-08-05', 'BS Medical Technology', '3', '2024-2025', '2', 'CC', 'Student', '2301-000195', '', 'fosterjk@gmail.com', '09269603091', '2025-07-01'),
(325, '../assets/User-placeholder.png', '1290528317', '2301-000196', 'Robert', 'Sheila', 'Garcia', 17, '2008-06-22', 'ICT', '2', '2024-2025', '2', 'SE', 'Student', '2301-000196', '', 'garciars@gmail.com', '09267371763', '2025-07-01'),
(326, '../assets/User-placeholder.png', '0543549312', '2301-000197', 'John', 'Christopher', 'Collins', 18, '2006-07-18', 'AB Psychology', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000197', '', 'collinsjc@gmail.com', '09473628690', '2025-07-01'),
(327, '../assets/User-placeholder.png', '5794307194', '2301-000198', 'Ryan', 'Jason', 'Chambers', 19, '2006-05-24', 'BS Civil Engineering', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000198', '', 'chambersrj@gmail.com', '09966602008', '2025-07-01'),
(328, '../assets/User-placeholder.png', '2071950870', '2301-000199', 'Cory', 'James', 'Herrera', 22, '2003-06-15', 'HUMSS', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000199', '', 'herreracj@gmail.com', '09944108790', '2025-07-01'),
(329, '../assets/User-placeholder.png', '5100128669', '2301-000200', 'Robert', 'Jason', 'Stewart', 23, '2001-08-27', 'BS Business Administration', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000200', '', 'stewartrj@gmail.com', '09921071199', '2025-07-01');
INSERT INTO `users` (`id`, `student_photo`, `rfid_code`, `user_id`, `first_name`, `middle_name`, `last_name`, `age`, `birthday`, `course`, `year_level`, `academic_year`, `semester`, `department`, `user_type`, `username`, `password`, `email`, `phone_number`, `created_at`) VALUES
(330, '../assets/User-placeholder.png', '9237736630', '2301-000201', 'Brian', 'Nancy', 'Werner', 18, '2006-09-04', 'BS Civil Engineering', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000201', '', 'wernerbn@gmail.com', '09481113728', '2025-07-01'),
(331, '../assets/User-placeholder.png', '1564532184', '2301-000202', 'Cody', 'Gabriel', 'Frank', 18, '2007-03-13', 'BS Accountancy', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000202', '', 'frankcg@gmail.com', '09856703234', '2025-07-01'),
(332, '../assets/User-placeholder.png', '8305983146', '2301-000203', 'Andrew', 'Nathaniel', 'Hutchinson', 22, '2002-11-28', 'HUMSS', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000203', '', 'hutchinsonan@gmail.com', '09650947015', '2025-07-01'),
(333, '../assets/User-placeholder.png', '2650858644', '2301-000204', 'Mark', 'Edward', 'Love', 18, '2006-11-17', 'BS Physical Therapy', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000204', '', 'loveme@gmail.com', '09389228595', '2025-07-01'),
(334, '../assets/User-placeholder.png', '8814828176', '2301-000205', 'Christopher', 'Shannon', 'Roberts', 19, '2005-10-17', 'ABM', '2', '2024-2025', '2', 'SE', 'Student', '2301-000205', '', 'robertscs@gmail.com', '09329913877', '2025-07-01'),
(335, '../assets/User-placeholder.png', '8713806256', '2301-000206', 'Ryan', 'Frederick', 'Howard', 17, '2007-12-24', 'BS Management Accounting', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000206', '', 'howardrf@gmail.com', '09419479997', '2025-07-01'),
(336, '../assets/User-placeholder.png', '7094871406', '2301-000207', 'Jason', 'Michael', 'King', 19, '2005-12-14', 'STEM', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000207', '', 'kingjm@gmail.com', '09577518408', '2025-07-01'),
(337, '../assets/User-placeholder.png', '3381216172', '2301-000208', 'Mark', 'Anthony', 'Cross', 23, '2002-05-21', 'BS Information Technology', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000208', '', 'crossma@gmail.com', '09276885582', '2025-07-01'),
(338, '../assets/User-placeholder.png', '9801320001', '2301-000209', 'Nicholas', 'James', 'Walsh', 18, '2006-07-06', 'BS Industrial Engineering', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000209', '', 'walshnj@gmail.com', '09285726295', '2025-07-01'),
(339, '../assets/User-placeholder.png', '5222508486', '2301-000210', 'John', 'Carmen', 'Norris', 17, '2007-09-13', 'BS Civil Engineering', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000210', '', 'norrisjc@gmail.com', '09150635286', '2025-07-01'),
(340, '../assets/User-placeholder.png', '6980936419', '2301-000211', 'John', 'Angela', 'Oconnor', 21, '2003-11-04', 'BS Tourism Management', '4', '2024-2025', '2', 'CC', 'Student', '2301-000211', '', 'oconnorja@gmail.com', '09812729986', '2025-07-01'),
(341, '../assets/User-placeholder.png', '3800720962', '2301-000212', 'Jonathan', 'Jeffery', 'Brennan', 19, '2005-08-18', 'BS Business Administration', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000212', '', 'brennanjj@gmail.com', '09267976923', '2025-07-01'),
(342, '../assets/User-placeholder.png', '2680941652', '2301-000213', 'Jon', 'Miranda', 'Smith', 23, '2001-10-05', 'BS Midwifery', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000213', '', 'smithjm@gmail.com', '09251492757', '2025-07-01'),
(343, '../assets/User-placeholder.png', '2690478202', '2301-000214', 'James', 'Lisa', 'Lopez', 21, '2004-05-13', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000214', '', 'lopezjl@gmail.com', '09595480291', '2025-07-01'),
(344, '../assets/User-placeholder.png', '2035613850', '2301-000215', 'Zachary', 'Nicole', 'Hamilton', 17, '2008-06-30', 'HUMSS', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000215', '', 'hamiltonzn@gmail.com', '09167507202', '2025-07-01'),
(345, '../assets/User-placeholder.png', '6795549129', '2301-000216', 'Ross', 'Teresa', 'Curtis', 18, '2006-08-01', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000216', '', 'curtisrt@gmail.com', '09261016620', '2025-07-01'),
(346, '../assets/User-placeholder.png', '0988461713', '2301-000217', 'Seth', 'Nicholas', 'Ortiz', 20, '2004-09-11', 'AB Communication', '2', '2024-2025', '2', 'SE', 'Student', '2301-000217', '', 'ortizsn@gmail.com', '09704810060', '2025-07-01'),
(347, '../assets/User-placeholder.png', '5255205071', '2301-000218', 'Juan', 'Catherine', 'Sanchez', 18, '2007-04-07', 'BS Medical Technology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000218', '', 'sanchezjc@gmail.com', '09488973254', '2025-07-01'),
(348, '../assets/User-placeholder.png', '1853982201', '2301-000219', 'Nicholas', 'Brandon', 'Rogers', 22, '2003-03-12', 'BS Nursing', '2', '2024-2025', '2', 'SE', 'Student', '2301-000219', '', 'rogersnb@gmail.com', '09693834768', '2025-07-01'),
(349, '../assets/User-placeholder.png', '4708699849', '2301-000220', 'Jesse', 'Robert', 'Hunt', 18, '2007-04-13', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000220', '', 'huntjr@gmail.com', '09710649491', '2025-07-01'),
(350, '../assets/User-placeholder.png', '8910866642', '2301-000221', 'William', 'James', 'Wolf', 22, '2003-03-04', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'CC', 'Student', '2301-000221', '', 'wolfwj@gmail.com', '09443069973', '2025-07-01'),
(351, '../assets/User-placeholder.png', '4679182422', '2301-000222', 'David', 'Charles', 'Robinson', 18, '2007-06-08', 'BS Midwifery', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000222', '', 'robinsondc@gmail.com', '09281571321', '2025-07-01'),
(352, '../assets/User-placeholder.png', '7210815499', '2301-000223', 'Daniel', 'Michael', 'Burton', 22, '2003-02-07', 'AB Psychology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000223', '', 'burtondm@gmail.com', '09870020456', '2025-07-01'),
(353, '../assets/User-placeholder.png', '6811639780', '2301-000224', 'Nathan', 'Tamara', 'Frost', 18, '2006-09-12', 'HE', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000224', '', 'frostnt@gmail.com', '09262480351', '2025-07-01'),
(354, '../assets/User-placeholder.png', '4087029569', '2301-000225', 'Daniel', 'Jason', 'Carson', 17, '2007-10-12', 'STEM', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000225', '', 'carsondj@gmail.com', '09242117234', '2025-07-01'),
(355, '../assets/User-placeholder.png', '2090357499', '2301-000226', 'Michael', 'Paula', 'Liu', 21, '2004-03-17', 'HUMSS', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000226', '', 'liump@gmail.com', '09866417193', '2025-07-01'),
(356, '../assets/User-placeholder.png', '9972201218', '2301-000227', 'Jordan', 'Michael', 'Hughes', 19, '2005-08-03', 'AB Communication', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000227', '', 'hughesjm@gmail.com', '09670809116', '2025-07-01'),
(357, '../assets/User-placeholder.png', '8644512511', '2301-000228', 'Aaron', 'Tracy', 'Jones', 23, '2002-07-04', 'ICT', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000228', '', 'jonesat@gmail.com', '09778699188', '2025-07-01'),
(358, '../assets/User-placeholder.png', '7756352183', '2301-000229', 'William', 'Charles', 'Lee', 19, '2006-06-22', 'BS Physical Therapy', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000229', '', 'leewc@gmail.com', '09149394981', '2025-07-01'),
(359, '../assets/User-placeholder.png', '7391486797', '2301-000230', 'David', 'Christine', 'Gilbert', 23, '2001-08-30', 'BS Civil Engineering', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000230', '', 'gilbertdc@gmail.com', '09865035839', '2025-07-01'),
(360, '../assets/User-placeholder.png', '3059795254', '2301-000231', 'David', 'Robin', 'Hudson', 19, '2005-09-05', 'Dentistry', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000231', '', 'hudsondr@gmail.com', '09712245606', '2025-07-01'),
(361, '../assets/User-placeholder.png', '0840294610', '2301-000232', 'Kirk', 'Dorothy', 'Walker', 21, '2004-02-08', 'BS Accountancy', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000232', '', 'walkerkd@gmail.com', '09534230084', '2025-07-01'),
(362, '../assets/User-placeholder.png', '7572474239', '2301-000233', 'Ricardo', 'Brandon', 'Jennings', 22, '2003-05-22', 'AB Psychology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000233', '', 'jenningsrb@gmail.com', '09602936585', '2025-07-01'),
(363, '../assets/User-placeholder.png', '0065748438', '2301-000234', 'Robert', 'Kim', 'Knight', 20, '2004-09-19', 'BS Civil Engineering', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000234', '', 'knightrk@gmail.com', '09968289061', '2025-07-01'),
(364, '../assets/User-placeholder.png', '3917011482', '2301-000235', 'James', 'Jorge', 'Holder', 23, '2002-05-01', 'BS Accountancy', '4', '2024-2025', '2', 'CC', 'Student', '2301-000235', '', 'holderjj@gmail.com', '09378963777', '2025-07-01'),
(365, '../assets/User-placeholder.png', '6818590347', '2301-000236', 'Devon', 'Janice', 'Phillips', 17, '2008-05-19', 'BS Accountancy', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000236', '', 'phillipsdj@gmail.com', '09745624568', '2025-07-01'),
(366, '../assets/User-placeholder.png', '5090320883', '2301-000237', 'Dustin', 'Zachary', 'Hall', 18, '2006-10-10', 'BS Business Administration', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000237', '', 'halldz@gmail.com', '09134344322', '2025-07-01'),
(367, '../assets/User-placeholder.png', '3203918267', '2301-000238', 'Michael', 'Steven', 'Lewis', 22, '2002-12-13', 'HUMSS', '1', '2024-2025', '2', 'CC', 'Student', '2301-000238', '', 'lewisms@gmail.com', '09851919385', '2025-07-01'),
(368, '../assets/User-placeholder.png', '7042756641', '2301-000239', 'John', 'Deborah', 'Reynolds', 20, '2005-06-17', 'AB Communication', '4', '2024-2025', '2', 'SE', 'Student', '2301-000239', '', 'reynoldsjd@gmail.com', '09402625384', '2025-07-01'),
(369, '../assets/User-placeholder.png', '8055229711', '2301-000240', 'James', 'Alexis', 'Haley', 18, '2006-10-24', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000240', '', 'haleyja@gmail.com', '09877030920', '2025-07-01'),
(370, '../assets/User-placeholder.png', '1198856235', '2301-000241', 'Christopher', 'Wendy', 'Hopkins', 17, '2007-08-27', 'Dentistry', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000241', '', 'hopkinscw@gmail.com', '09741168409', '2025-07-01'),
(371, '../assets/User-placeholder.png', '8673471394', '2301-000242', 'Juan', 'Susan', 'Johnson', 23, '2002-01-24', 'ICT', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000242', '', 'johnsonjs@gmail.com', '09935053465', '2025-07-01'),
(372, '../assets/User-placeholder.png', '7526726281', '2301-000243', 'Richard', 'Christopher', 'Robbins', 17, '2007-07-23', 'BS Business Administration', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000243', '', 'robbinsrc@gmail.com', '09333422264', '2025-07-01'),
(373, '../assets/User-placeholder.png', '1753583429', '2301-000244', 'Raymond', 'Beth', 'Ramirez', 17, '2007-08-01', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'SE', 'Student', '2301-000244', '', 'ramirezrb@gmail.com', '09847820236', '2025-07-01'),
(374, '../assets/User-placeholder.png', '9259074943', '2301-000245', 'Matthew', 'Heather', 'Hale', 23, '2001-07-21', 'BS Nursing', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000245', '', 'halemh@gmail.com', '09836246847', '2025-07-01'),
(375, '../assets/User-placeholder.png', '1904380366', '2301-000246', 'John', 'Benjamin', 'Rocha', 23, '2002-01-28', 'BS Accountancy', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000246', '', 'rochajb@gmail.com', '09517971775', '2025-07-01'),
(376, '../assets/User-placeholder.png', '3466055761', '2301-000247', 'Cody', 'Sarah', 'Young', 23, '2001-11-23', 'BS Medical Technology', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000247', '', 'youngcs@gmail.com', '09221236400', '2025-07-01'),
(377, '../assets/User-placeholder.png', '6390455886', '2301-000248', 'Randy', 'Patricia', 'Garcia', 18, '2007-05-14', 'AB Psychology', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000248', '', 'garciarp@gmail.com', '09388657641', '2025-07-01'),
(378, '../assets/User-placeholder.png', '7461917123', '2301-000249', 'Jon', 'Candice', 'Smith', 19, '2006-04-19', 'AB Psychology', '4', '2024-2025', '2', 'SE', 'Student', '2301-000249', '', 'smithjc@gmail.com', '09184795441', '2025-07-01'),
(379, '../assets/User-placeholder.png', '7481185857', '2301-000250', 'Michael', 'Maria', 'Vega', 18, '2007-01-30', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'SE', 'Student', '2301-000250', '', 'vegamm@gmail.com', '09754796581', '2025-07-01'),
(380, '../assets/User-placeholder.png', '3585326967', '2301-000251', 'William', 'Zachary', 'Martin', 20, '2004-12-09', 'BS Management Accounting', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000251', '', 'martinwz@gmail.com', '09633878844', '2025-07-01'),
(381, '../assets/User-placeholder.png', '7471033730', '2301-000252', 'Luke', 'Ethan', 'Sherman', 18, '2006-09-12', 'AB Communication', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000252', '', 'shermanle@gmail.com', '09791518812', '2025-07-01'),
(382, '../assets/User-placeholder.png', '3059260692', '2301-000253', 'Noah', 'Brett', 'Rollins', 19, '2006-03-06', 'BS Elementary Education', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000253', '', 'rollinsnb@gmail.com', '09565575337', '2025-07-01'),
(383, '../assets/User-placeholder.png', '2518532653', '2301-000254', 'Charles', 'Donna', 'Duran', 19, '2005-11-14', 'BS Management Accounting', '1', '2024-2025', '2', 'CC', 'Student', '2301-000254', '', 'durancd@gmail.com', '09793642037', '2025-07-01'),
(384, '../assets/User-placeholder.png', '4051678743', '2301-000255', 'Donald', 'Lisa', 'Koch', 18, '2006-11-24', 'AB Psychology', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000255', '', 'kochdl@gmail.com', '09394483760', '2025-07-01'),
(385, '../assets/User-placeholder.png', '0637157628', '2301-000256', 'Rodney', 'Jose', 'Cook', 20, '2004-11-23', 'BS Physical Therapy', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000256', '', 'cookrj@gmail.com', '09902193422', '2025-07-01'),
(386, '../assets/User-placeholder.png', '2511874996', '2301-000257', 'Kenneth', 'Philip', 'Bolton', 21, '2003-12-03', 'BS Information Technology', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000257', '', 'boltonkp@gmail.com', '09303476628', '2025-07-01'),
(387, '../assets/User-placeholder.png', '3562100570', '2301-000258', 'Brett', 'Michael', 'Henderson', 22, '2002-07-15', 'BS Elementary Education', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000258', '', 'hendersonbm@gmail.com', '09127062822', '2025-07-01'),
(388, '../assets/User-placeholder.png', '9626753332', '2301-000259', 'Thomas', 'Heidi', 'Beck', 20, '2005-06-13', 'AB Psychology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000259', '', 'beckth@gmail.com', '09329760500', '2025-07-01'),
(389, '../assets/User-placeholder.png', '8475059468', '2301-000260', 'William', 'Ashley', 'Evans', 23, '2002-02-05', 'BS Accountancy', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000260', '', 'evanswa@gmail.com', '09676078683', '2025-07-01'),
(390, '../assets/User-placeholder.png', '0990343105', '2301-000261', 'Michael', 'Sean', 'Figueroa', 19, '2005-10-11', 'BS Physical Therapy', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000261', '', 'figueroams@gmail.com', '09315740184', '2025-07-01'),
(391, '../assets/User-placeholder.png', '7272248372', '2301-000262', 'Jeremy', 'Shawn', 'Pollard', 21, '2004-01-12', 'BS Business Administration', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000262', '', 'pollardjs@gmail.com', '09172785361', '2025-07-01'),
(392, '../assets/User-placeholder.png', '3201719827', '2301-000263', 'Shawn', 'Andrew', 'Mercado', 20, '2004-08-22', 'BS Civil Engineering', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000263', '', 'mercadosa@gmail.com', '09134864665', '2025-07-01'),
(393, '../assets/User-placeholder.png', '0775866376', '2301-000264', 'Reginald', 'Brianna', 'Anderson', 18, '2006-10-06', 'HUMSS', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000264', '', 'andersonrb@gmail.com', '09640232919', '2025-07-01'),
(394, '../assets/User-placeholder.png', '5525424080', '2301-000265', 'Gerald', 'Henry', 'Lawson', 19, '2005-12-14', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000265', '', 'lawsongh@gmail.com', '09327809680', '2025-07-01'),
(395, '../assets/User-placeholder.png', '8668429995', '2301-000266', 'Brandon', 'Linda', 'Vance', 19, '2006-02-08', 'BS Accountancy', '3', '2024-2025', '2', 'CC', 'Student', '2301-000266', '', 'vancebl@gmail.com', '09958337264', '2025-07-01'),
(396, '../assets/User-placeholder.png', '0944052990', '2301-000267', 'Stephen', 'David', 'Guerrero', 19, '2006-05-31', 'BS Hospitality Management', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000267', '', 'guerrerosd@gmail.com', '09163864626', '2025-07-01'),
(397, '../assets/User-placeholder.png', '1437111789', '2301-000268', 'Sean', 'Patrick', 'Lane', 18, '2007-04-14', 'BS Medical Technology', '2', '2024-2025', '2', 'CC', 'Student', '2301-000268', '', 'lanesp@gmail.com', '09295729458', '2025-07-01'),
(398, '../assets/User-placeholder.png', '8019182705', '2301-000269', 'Joel', 'David', 'Nash', 21, '2004-06-21', 'HUMSS', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000269', '', 'nashjd@gmail.com', '09831010844', '2025-07-01'),
(399, '../assets/User-placeholder.png', '8136937716', '2301-000270', 'Keith', 'Jessica', 'Collier', 22, '2003-02-08', 'BS Management Accounting', '1', '2024-2025', '2', 'SE', 'Student', '2301-000270', '', 'collierkj@gmail.com', '09550821027', '2025-07-01'),
(400, '../assets/User-placeholder.png', '7090787556', '2301-000271', 'Daniel', 'Christopher', 'Sutton', 19, '2005-09-10', 'BS Civil Engineering', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000271', '', 'suttondc@gmail.com', '09216958008', '2025-07-01'),
(401, '../assets/User-placeholder.png', '9183850773', '2301-000272', 'Victor', 'Taylor', 'Wells', 22, '2002-10-12', 'BS Criminology', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000272', '', 'wellsvt@gmail.com', '09361201753', '2025-07-01'),
(402, '../assets/User-placeholder.png', '1287789319', '2301-000273', 'George', 'David', 'Velasquez', 21, '2003-07-08', 'ICT', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000273', '', 'velasquezgd@gmail.com', '09768446580', '2025-07-01'),
(403, '../assets/User-placeholder.png', '0612810419', '2301-000274', 'Christopher', 'Melinda', 'Wallace', 19, '2005-12-13', 'BS Physical Therapy', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000274', '', 'wallacecm@gmail.com', '09216458267', '2025-07-01'),
(404, '../assets/User-placeholder.png', '4800498408', '2301-000275', 'Tim', 'Edward', 'Hernandez', 19, '2006-02-18', 'BS Hospitality Management', '4', '2024-2025', '2', 'SE', 'Student', '2301-000275', '', 'hernandezte@gmail.com', '09165959573', '2025-07-01'),
(405, '../assets/User-placeholder.png', '5186872721', '2301-000276', 'Randy', 'Natalie', 'West', 19, '2005-12-05', 'BS Industrial Engineering', '4', '2024-2025', '2', 'CC', 'Student', '2301-000276', '', 'westrn@gmail.com', '09757441350', '2025-07-01'),
(406, '../assets/User-placeholder.png', '6136592204', '2301-000277', 'Grant', 'Michael', 'Harmon', 21, '2004-02-02', 'AB Communication', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000277', '', 'harmongm@gmail.com', '09667426875', '2025-07-01'),
(407, '../assets/User-placeholder.png', '1084604225', '2301-000278', 'Douglas', 'Elizabeth', 'Ramos', 20, '2005-04-15', 'BS Criminology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000278', '', 'ramosde@gmail.com', '09991824780', '2025-07-01'),
(408, '../assets/User-placeholder.png', '6319831899', '2301-000279', 'Jeffrey', 'Mackenzie', 'Colon', 22, '2002-12-13', 'ICT', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000279', '', 'colonjm@gmail.com', '09362341328', '2025-07-01'),
(409, '../assets/User-placeholder.png', '9803198567', '2301-000280', 'Joshua', 'Robert', 'Flores', 19, '2006-04-02', 'Dentistry', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000280', '', 'floresjr@gmail.com', '09899548511', '2025-07-01'),
(410, '../assets/User-placeholder.png', '9895933630', '2301-000281', 'Michael', 'Susan', 'Sanders', 19, '2006-05-26', 'Dentistry', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000281', '', 'sandersms@gmail.com', '09104548599', '2025-07-01'),
(411, '../assets/User-placeholder.png', '4262736561', '2301-000282', 'Jack', 'Natalie', 'King', 17, '2007-11-28', 'BS Industrial Engineering', '1', '2024-2025', '2', 'CC', 'Student', '2301-000282', '', 'kingjn@gmail.com', '09814347095', '2025-07-01'),
(412, '../assets/User-placeholder.png', '1034250667', '2301-000283', 'Juan', 'Natalie', 'Donovan', 19, '2006-01-09', 'BS Civil Engineering', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000283', '', 'donovanjn@gmail.com', '09782212533', '2025-07-01'),
(413, '../assets/User-placeholder.png', '8953722693', '2301-000284', 'Adam', 'Christina', 'Shepherd', 20, '2005-01-21', 'BS Medical Technology', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000284', '', 'shepherdac@gmail.com', '09131199687', '2025-07-01'),
(414, '../assets/User-placeholder.png', '6585126260', '2301-000285', 'David', 'Briana', 'Chambers', 17, '2007-08-04', 'AB Psychology', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000285', '', 'chambersdb@gmail.com', '09107634818', '2025-07-01'),
(415, '../assets/User-placeholder.png', '2017996628', '2301-000286', 'Jesus', 'Julie', 'Berg', 17, '2008-06-08', 'HE', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000286', '', 'bergjj@gmail.com', '09557715886', '2025-07-01'),
(416, '../assets/User-placeholder.png', '7221827442', '2301-000287', 'Kenneth', 'Christopher', 'Baker', 17, '2008-04-13', 'BS Business Administration', '4', '2024-2025', '2', 'CC', 'Student', '2301-000287', '', 'bakerkc@gmail.com', '09865573318', '2025-07-01'),
(417, '../assets/User-placeholder.png', '1377732910', '2301-000288', 'Ricky', 'James', 'Wood', 22, '2003-05-18', 'ICT', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000288', '', 'woodrj@gmail.com', '09433801960', '2025-07-01'),
(418, '../assets/User-placeholder.png', '9438348856', '2301-000289', 'Andrew', 'Stephanie', 'Owens', 19, '2005-10-30', 'BS Hospitality Management', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000289', '', 'owensas@gmail.com', '09194200961', '2025-07-01'),
(419, '../assets/User-placeholder.png', '3618982392', '2301-000290', 'Tyler', 'Matthew', 'Davis', 19, '2005-09-27', 'STEM', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000290', '', 'davistm@gmail.com', '09579074282', '2025-07-01'),
(420, '../assets/User-placeholder.png', '0163840395', '2301-000291', 'Peter', 'Christina', 'Jordan', 19, '2006-01-08', 'BS Elementary Education', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000291', '', 'jordanpc@gmail.com', '09479077506', '2025-07-01'),
(421, '../assets/User-placeholder.png', '2479981695', '2301-000292', 'Benjamin', 'Willie', 'Brewer', 17, '2007-12-06', 'AB Psychology', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000292', '', 'brewerbw@gmail.com', '09271339755', '2025-07-01'),
(422, '../assets/User-placeholder.png', '2949667247', '2301-000293', 'Glenn', 'Bridget', 'Young', 17, '2008-04-15', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000293', '', 'younggb@gmail.com', '09560589345', '2025-07-01'),
(423, '../assets/User-placeholder.png', '8775717603', '2301-000294', 'Derek', 'Laura', 'Anderson', 17, '2007-07-17', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000294', '', 'andersondl@gmail.com', '09286913762', '2025-07-01'),
(424, '../assets/User-placeholder.png', '4671642579', '2301-000295', 'Andrew', 'Carla', 'Brown', 18, '2006-07-10', 'BS Nursing', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000295', '', 'brownac@gmail.com', '09142579532', '2025-07-01'),
(425, '../assets/User-placeholder.png', '5146424561', '2301-000296', 'Raymond', 'Michael', 'Ward', 23, '2002-03-18', 'BS Medical Technology', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000296', '', 'wardrm@gmail.com', '09686571151', '2025-07-01'),
(426, '../assets/User-placeholder.png', '3731843155', '2301-000297', 'Anthony', 'Mark', 'Wilson', 20, '2004-10-17', 'BS Elementary Education', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000297', '', 'wilsonam@gmail.com', '09400618882', '2025-07-01'),
(427, '../assets/User-placeholder.png', '4693974985', '2301-000298', 'Jamie', 'Paul', 'Miller', 23, '2001-10-19', 'AB Psychology', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000298', '', 'millerjp@gmail.com', '09296611736', '2025-07-01'),
(428, '../assets/User-placeholder.png', '2010790705', '2301-000299', 'Adam', 'Steven', 'King', 20, '2004-07-09', 'BS Midwifery', '2', '2024-2025', '2', 'SE', 'Student', '2301-000299', '', 'kingas@gmail.com', '09253892064', '2025-07-01'),
(429, '../assets/User-placeholder.png', '9613809849', '2301-000300', 'Calvin', 'Kimberly', 'Williams', 21, '2003-12-11', 'BS Accountancy', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000300', '', 'williamsck@gmail.com', '09803267771', '2025-07-01'),
(430, '../assets/User-placeholder.png', '8427438867', '2301-000301', 'Jason', 'Elizabeth', 'Riley', 21, '2004-02-10', 'BS Civil Engineering', '1', '2024-2025', '2', 'CC', 'Student', '2301-000301', '', 'rileyje@gmail.com', '09403175703', '2025-07-01'),
(431, '../assets/User-placeholder.png', '0114822474', '2301-000302', 'Andrew', 'Amanda', 'Montes', 17, '2007-09-21', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000302', '', 'montesaa@gmail.com', '09690019097', '2025-07-01'),
(432, '../assets/User-placeholder.png', '7821973011', '2301-000303', 'Richard', 'Tanner', 'Carpenter', 19, '2006-05-10', 'AB Communication', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000303', '', 'carpenterrt@gmail.com', '09800072101', '2025-07-01'),
(433, '../assets/User-placeholder.png', '8451108921', '2301-000304', 'Scott', 'Jessica', 'Cooper', 20, '2005-04-14', 'AB Psychology', '4', '2024-2025', '2', 'SE', 'Student', '2301-000304', '', 'coopersj@gmail.com', '09730316894', '2025-07-01'),
(434, '../assets/User-placeholder.png', '4672439360', '2301-000305', 'Ricky', 'Thomas', 'Costa', 21, '2003-10-20', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000305', '', 'costart@gmail.com', '09193334797', '2025-07-01'),
(435, '../assets/User-placeholder.png', '0213759442', '2301-000306', 'Michael', 'Amber', 'Johnson', 22, '2003-02-12', 'BS Medical Technology', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000306', '', 'johnsonma@gmail.com', '09838375786', '2025-07-01'),
(436, '../assets/User-placeholder.png', '5130467603', '2301-000307', 'Robert', 'Alan', 'Silva', 20, '2005-04-25', 'HE', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000307', '', 'silvara@gmail.com', '09546342296', '2025-07-01'),
(437, '../assets/User-placeholder.png', '9962910736', '2301-000308', 'Steven', 'Jake', 'Oliver', 17, '2008-06-04', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'SE', 'Student', '2301-000308', '', 'oliversj@gmail.com', '09662972365', '2025-07-01'),
(438, '../assets/User-placeholder.png', '5523339608', '2301-000309', 'George', 'Nancy', 'Cortez', 23, '2001-07-26', 'BS Industrial Engineering', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000309', '', 'cortezgn@gmail.com', '09127410910', '2025-07-01'),
(439, '../assets/User-placeholder.png', '0844875353', '2301-000310', 'Riley', 'Elizabeth', 'Johnson', 19, '2005-10-31', 'BS Midwifery', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000310', '', 'johnsonre@gmail.com', '09121609232', '2025-07-01'),
(440, '../assets/User-placeholder.png', '6295603539', '2301-000311', 'Daniel', 'Donald', 'Carter', 21, '2003-09-03', 'BS Physical Therapy', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000311', '', 'carterdd@gmail.com', '09290471123', '2025-07-01'),
(441, '../assets/User-placeholder.png', '9576448870', '2301-000312', 'Antonio', 'Kimberly', 'Mercado', 17, '2008-04-16', 'BS Nursing', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000312', '', 'mercadoak@gmail.com', '09852037062', '2025-07-01'),
(442, '../assets/User-placeholder.png', '2522841949', '2301-000313', 'Kenneth', 'Todd', 'Knight', 22, '2003-06-24', 'BS Elementary Education', '4', '2024-2025', '2', 'SE', 'Student', '2301-000313', '', 'knightkt@gmail.com', '09992002258', '2025-07-01'),
(443, '../assets/User-placeholder.png', '2876071435', '2301-000314', 'Caleb', 'Donna', 'Moss', 22, '2002-09-30', 'BS Medical Technology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000314', '', 'mosscd@gmail.com', '09894233100', '2025-07-01'),
(444, '../assets/User-placeholder.png', '9906495903', '2301-000315', 'Reginald', 'Mark', 'Wu', 18, '2007-07-02', 'AB Communication', '2', '2024-2025', '2', 'CC', 'Student', '2301-000315', '', 'wurm@gmail.com', '09426792710', '2025-07-01'),
(445, '../assets/User-placeholder.png', '2562302088', '2301-000316', 'Justin', 'Amy', 'Mcpherson', 19, '2005-08-30', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000316', '', 'mcphersonja@gmail.com', '09207746459', '2025-07-01'),
(446, '../assets/User-placeholder.png', '8641006876', '2301-000317', 'Tyler', 'Ryan', 'Moore', 19, '2005-07-22', 'BS Business Administration', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000317', '', 'mooretr@gmail.com', '09337540228', '2025-07-01'),
(447, '../assets/User-placeholder.png', '4706159128', '2301-000318', 'Austin', 'Theodore', 'Lopez', 22, '2002-11-26', 'Dentistry', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000318', '', 'lopezat@gmail.com', '09951408947', '2025-07-01'),
(448, '../assets/User-placeholder.png', '6761768073', '2301-000319', 'Mark', 'Sabrina', 'Meyer', 19, '2005-08-02', 'AB Communication', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000319', '', 'meyerms@gmail.com', '09842954018', '2025-07-01'),
(449, '../assets/User-placeholder.png', '2373445062', '2301-000320', 'Stephen', 'Aaron', 'Williams', 18, '2007-04-15', 'BS Business Administration', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000320', '', 'williamssa@gmail.com', '09243773366', '2025-07-01'),
(450, '../assets/User-placeholder.png', '3958461189', '2301-000321', 'David', 'Mary', 'Carr', 19, '2006-03-02', 'ICT', '1', '2024-2025', '2', 'SE', 'Student', '2301-000321', '', 'carrdm@gmail.com', '09318509327', '2025-07-01'),
(451, '../assets/User-placeholder.png', '6867250439', '2301-000322', 'James', 'Jeffrey', 'Maxwell', 18, '2006-11-09', 'ABM', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000322', '', 'maxwelljj@gmail.com', '09630947663', '2025-07-01'),
(452, '../assets/User-placeholder.png', '1023069248', '2301-000323', 'Kyle', 'Jonathan', 'Smith', 23, '2001-08-25', 'ABM', '3', '2024-2025', '2', 'SE', 'Student', '2301-000323', '', 'smithkj@gmail.com', '09683955627', '2025-07-01'),
(453, '../assets/User-placeholder.png', '3519286632', '2301-000324', 'Jeffrey', 'James', 'Sanchez', 19, '2005-10-17', 'ABM', '1', '2024-2025', '2', 'SE', 'Student', '2301-000324', '', 'sanchezjj@gmail.com', '09114595461', '2025-07-01'),
(454, '../assets/User-placeholder.png', '3436414363', '2301-000325', 'Alejandro', 'Daniel', 'Farrell', 20, '2005-02-20', 'ICT', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000325', '', 'farrellad@gmail.com', '09337240741', '2025-07-01'),
(455, '../assets/User-placeholder.png', '4770827550', '2301-000326', 'Aaron', 'Jenna', 'Brown', 17, '2008-03-31', 'BS Criminology', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000326', '', 'brownaj@gmail.com', '09573413819', '2025-07-01'),
(456, '../assets/User-placeholder.png', '0230162736', '2301-000327', 'Isaiah', 'Crystal', 'Washington', 22, '2002-09-05', 'HUMSS', '2', '2024-2025', '2', 'SE', 'Student', '2301-000327', '', 'washingtonic@gmail.com', '09358410274', '2025-07-01'),
(457, '../assets/User-placeholder.png', '6914721082', '2301-000328', 'Adam', 'Lauren', 'Johnson', 23, '2002-04-14', 'BS Hospitality Management', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000328', '', 'johnsonal@gmail.com', '09974962700', '2025-07-01'),
(458, '../assets/User-placeholder.png', '1994586951', '2301-000329', 'Lucas', 'Joshua', 'Cox', 18, '2007-02-12', 'AB Psychology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000329', '', 'coxlj@gmail.com', '09986849966', '2025-07-01'),
(459, '../assets/User-placeholder.png', '4727167159', '2301-000330', 'Ryan', 'Douglas', 'Turner', 20, '2004-07-18', 'BS Criminology', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000330', '', 'turnerrd@gmail.com', '09549112394', '2025-07-01'),
(460, '../assets/User-placeholder.png', '6956784379', '2301-000331', 'Brian', 'Ashley', 'Fox', 20, '2004-11-14', 'BS Management Accounting', '3', '2024-2025', '2', 'CC', 'Student', '2301-000331', '', 'foxba@gmail.com', '09876424946', '2025-07-01'),
(461, '../assets/User-placeholder.png', '7704111583', '2301-000332', 'Shawn', 'Morgan', 'Hughes', 18, '2007-03-31', 'BS Civil Engineering', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000332', '', 'hughessm@gmail.com', '09240011777', '2025-07-01'),
(462, '../assets/User-placeholder.png', '9880239050', '2301-000333', 'Jacob', 'Andrew', 'Garcia', 18, '2007-02-04', 'BS Business Administration', '1', '2024-2025', '2', 'SE', 'Student', '2301-000333', '', 'garciaja@gmail.com', '09823729960', '2025-07-01'),
(463, '../assets/User-placeholder.png', '1995779334', '2301-000334', 'Scott', 'Sandra', 'Douglas', 22, '2003-02-25', 'BS Hospitality Management', '3', '2024-2025', '2', 'SE', 'Student', '2301-000334', '', 'douglasss@gmail.com', '09747740483', '2025-07-01'),
(464, '../assets/User-placeholder.png', '4126655645', '2301-000335', 'Anthony', 'Linda', 'Pacheco', 17, '2007-09-18', 'HUMSS', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000335', '', 'pachecoal@gmail.com', '09443914366', '2025-07-01'),
(465, '../assets/User-placeholder.png', '7835702409', '2301-000336', 'Jorge', 'Rebecca', 'Brown', 18, '2007-05-16', 'BS Hospitality Management', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000336', '', 'brownjr@gmail.com', '09388592417', '2025-07-01'),
(466, '../assets/User-placeholder.png', '4822570886', '2301-000337', 'Matthew', 'Melinda', 'Robinson', 21, '2003-11-14', 'ICT', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000337', '', 'robinsonmm@gmail.com', '09482934168', '2025-07-01'),
(467, '../assets/User-placeholder.png', '8170145003', '2301-000338', 'Ronald', 'Arthur', 'Davis', 21, '2004-03-06', 'BS Physical Therapy', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000338', '', 'davisra@gmail.com', '09235308017', '2025-07-01'),
(468, '../assets/User-placeholder.png', '9265456064', '2301-000339', 'Christopher', 'Holly', 'Wolf', 17, '2008-05-01', 'BS Information Technology', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000339', '', 'wolfch@gmail.com', '09509110712', '2025-07-01'),
(469, '../assets/User-placeholder.png', '7787745646', '2301-000340', 'Christopher', 'George', 'Williams', 18, '2007-03-07', 'BS Information Technology', '3', '2024-2025', '2', 'SE', 'Student', '2301-000340', '', 'williamscg@gmail.com', '09499169636', '2025-07-01'),
(470, '../assets/User-placeholder.png', '6576167571', '2301-000341', 'Tyler', 'Jennifer', 'Nguyen', 19, '2005-07-17', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SE', 'Student', '2301-000341', '', 'nguyentj@gmail.com', '09896244538', '2025-07-01'),
(471, '../assets/User-placeholder.png', '4499533300', '2301-000342', 'Mark', 'Katelyn', 'Brown', 21, '2003-08-16', 'HUMSS', '2', '2024-2025', '2', 'IBED', 'Student', '2301-000342', '', 'brownmk@gmail.com', '09409343600', '2025-07-01'),
(472, '../assets/User-placeholder.png', '0828636033', '2301-000343', 'Clarence', 'John', 'Torres', 21, '2004-06-19', 'ICT', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000343', '', 'torrescj@gmail.com', '09733197688', '2025-07-01'),
(473, '../assets/User-placeholder.png', '9253173315', '2301-000344', 'Anthony', 'Frank', 'Phelps', 20, '2005-01-22', 'AB Communication', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000344', '', 'phelpsaf@gmail.com', '09814727178', '2025-07-01'),
(474, '../assets/User-placeholder.png', '0817969535', '2301-000345', 'Matthew', 'Kevin', 'Hayes', 23, '2001-08-20', 'BS Civil Engineering', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000345', '', 'hayesmk@gmail.com', '09131873019', '2025-07-01'),
(475, '../assets/User-placeholder.png', '8838657137', '2301-000346', 'Nathaniel', 'Jason', 'Moss', 22, '2002-10-14', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000346', '', 'mossnj@gmail.com', '09105651548', '2025-07-01'),
(476, '../assets/User-placeholder.png', '5000662849', '2301-000347', 'Eric', 'Ronald', 'Bailey', 17, '2007-12-19', 'BS Physical Therapy', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000347', '', 'baileyer@gmail.com', '09290767935', '2025-07-01'),
(477, '../assets/User-placeholder.png', '3457388003', '2301-000348', 'Justin', 'Micheal', 'Woods', 19, '2005-10-01', 'BS Criminology', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000348', '', 'woodsjm@gmail.com', '09876843869', '2025-07-01'),
(478, '../assets/User-placeholder.png', '5118106005', '2301-000349', 'Victor', 'Jermaine', 'Fields', 23, '2001-12-03', 'AB Communication', '1', '2024-2025', '2', 'SE', 'Student', '2301-000349', '', 'fieldsvj@gmail.com', '09678050870', '2025-07-01'),
(479, '../assets/User-placeholder.png', '2019046318', '2301-000350', 'Brian', 'Nicholas', 'Butler', 21, '2003-08-20', 'ICT', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000350', '', 'butlerbn@gmail.com', '09691571036', '2025-07-01'),
(480, '../assets/User-placeholder.png', '4535644998', '2301-000351', 'Tony', 'Adam', 'Benton', 20, '2005-01-29', 'BS Tourism Management', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000351', '', 'bentonta@gmail.com', '09824529246', '2025-07-01'),
(481, '../assets/User-placeholder.png', '5060365583', '2301-000352', 'Zachary', 'Edward', 'Lee', 18, '2007-06-01', 'HE', '3', '2024-2025', '2', 'SHS', 'Student', '2301-000352', '', 'leeze@gmail.com', '09453842402', '2025-07-01'),
(482, '../assets/User-placeholder.png', '2228660932', '2301-000353', 'Austin', 'Jerome', 'Lewis', 19, '2006-05-17', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000353', '', 'lewisaj@gmail.com', '09542109819', '2025-07-01'),
(483, '../assets/User-placeholder.png', '1221998046', '2301-000354', 'Jerry', 'Susan', 'Solomon', 17, '2008-01-24', 'BS Midwifery', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000354', '', 'solomonjs@gmail.com', '09156377971', '2025-07-01'),
(484, '../assets/User-placeholder.png', '2888660290', '2301-000355', 'Matthew', 'Cynthia', 'Hines', 18, '2006-09-26', 'BS Accountancy', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000355', '', 'hinesmc@gmail.com', '09662270743', '2025-07-01'),
(485, '../assets/User-placeholder.png', '5701263267', '2301-000356', 'Donald', 'Rebecca', 'Sherman', 17, '2007-07-12', 'Bachelor in Secondary Education', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000356', '', 'shermandr@gmail.com', '09689086206', '2025-07-01'),
(486, '../assets/User-placeholder.png', '3305787154', '2301-000357', 'John', 'Kevin', 'Good', 23, '2002-04-17', 'HUMSS', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000357', '', 'goodjk@gmail.com', '09584450388', '2025-07-01'),
(487, '../assets/User-placeholder.png', '0373047024', '2301-000358', 'Brian', 'Sheila', 'Ferrell', 20, '2005-07-06', 'BS Medical Technology', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000358', '', 'ferrellbs@gmail.com', '09444477719', '2025-07-01'),
(488, '../assets/User-placeholder.png', '9038658529', '2301-000359', 'John', 'Kyle', 'Dougherty', 19, '2005-08-19', 'Dentistry', '1', '2024-2025', '2', 'SE', 'Student', '2301-000359', '', 'doughertyjk@gmail.com', '09606050160', '2025-07-01'),
(489, '../assets/User-placeholder.png', '7314381011', '2301-000360', 'Samuel', 'Mario', 'Jones', 19, '2006-01-30', 'BS Criminology', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000360', '', 'jonessm@gmail.com', '09165289308', '2025-07-01'),
(490, '../assets/User-placeholder.png', '2691763040', '2301-000361', 'Brandon', 'Peter', 'Gibson', 21, '2004-06-24', 'STEM', '2', '2024-2025', '2', 'SE', 'Student', '2301-000361', '', 'gibsonbp@gmail.com', '09894056948', '2025-07-01'),
(491, '../assets/User-placeholder.png', '8437492385', '2301-000362', 'Anthony', 'Robert', 'Bailey', 21, '2004-01-02', 'AB Psychology', '2', '2024-2025', '2', 'CC', 'Student', '2301-000362', '', 'baileyar@gmail.com', '09973985891', '2025-07-01'),
(492, '../assets/User-placeholder.png', '6386463722', '2301-000363', 'John', 'Sabrina', 'Young', 19, '2006-03-11', 'BS Elementary Education', '3', '2024-2025', '2', 'CC', 'Student', '2301-000363', '', 'youngjs@gmail.com', '09686801828', '2025-07-01'),
(493, '../assets/User-placeholder.png', '1755532022', '2301-000364', 'Derek', 'Christopher', 'Parker', 18, '2007-06-20', 'BS Tourism Management', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000364', '', 'parkerdc@gmail.com', '09945052114', '2025-07-01'),
(494, '../assets/User-placeholder.png', '9666520850', '2301-000365', 'Matthew', 'Caroline', 'Logan', 17, '2008-03-19', 'HUMSS', '1', '2024-2025', '2', 'CC', 'Student', '2301-000365', '', 'loganmc@gmail.com', '09801836732', '2025-07-01'),
(495, '../assets/User-placeholder.png', '7938126396', '2301-000366', 'Stephen', 'Matthew', 'Fernandez', 18, '2007-04-17', 'BS Midwifery', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000366', '', 'fernandezsm@gmail.com', '09343155655', '2025-07-01'),
(496, '../assets/User-placeholder.png', '7025890518', '2301-000367', 'Steven', 'Sharon', 'Davidson', 17, '2007-08-21', 'AB Psychology', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000367', '', 'davidsonss@gmail.com', '09495660576', '2025-07-01'),
(497, '../assets/User-placeholder.png', '7851300364', '2301-000368', 'Mark', 'Joseph', 'Cooper', 19, '2006-01-31', 'BS Elementary Education', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000368', '', 'coopermj@gmail.com', '09490160721', '2025-07-01'),
(498, '../assets/User-placeholder.png', '9537784358', '2301-000369', 'William', 'James', 'Ross', 22, '2002-09-19', 'ABM', '2', '2024-2025', '2', 'CC', 'Student', '2301-000369', '', 'rosswj@gmail.com', '09728655506', '2025-07-01'),
(499, '../assets/User-placeholder.png', '0657415468', '2301-000370', 'Jose', 'Erika', 'Jackson', 19, '2006-04-27', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000370', '', 'jacksonje@gmail.com', '09861382526', '2025-07-01'),
(500, '../assets/User-placeholder.png', '5655315418', '2301-000371', 'Christopher', 'Jose', 'Carter', 22, '2003-06-04', 'BS Accountancy', '1', '2024-2025', '2', 'CC', 'Student', '2301-000371', '', 'cartercj@gmail.com', '09457576271', '2025-07-01'),
(501, '../assets/User-placeholder.png', '8285267002', '2301-000372', 'Michael', 'Victor', 'Hoover', 18, '2006-10-22', 'ICT', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000372', '', 'hoovermv@gmail.com', '09842735658', '2025-07-01'),
(502, '../assets/User-placeholder.png', '4107088735', '2301-000373', 'John', 'Jonathan', 'Davis', 17, '2007-08-12', 'BS Tourism Management', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000373', '', 'davisjj@gmail.com', '09949767735', '2025-07-01'),
(503, '../assets/User-placeholder.png', '5065141439', '2301-000374', 'Joseph', 'Raven', 'Tucker', 21, '2004-07-02', 'BS Management Accounting', '1', '2024-2025', '2', 'SE', 'Student', '2301-000374', '', 'tuckerjr@gmail.com', '09749502477', '2025-07-01'),
(504, '../assets/User-placeholder.png', '9186134916', '2301-000375', 'Anthony', 'Jeffrey', 'Murphy', 22, '2002-08-08', 'HE', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000375', '', 'murphyaj@gmail.com', '09859330573', '2025-07-01'),
(505, '../assets/User-placeholder.png', '5526731041', '2301-000376', 'Ralph', 'Nicole', 'Jones', 20, '2004-12-27', 'BS Hospitality Management', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000376', '', 'jonesrn@gmail.com', '09117173168', '2025-07-01'),
(506, '../assets/User-placeholder.png', '4229173987', '2301-000377', 'Craig', 'Lisa', 'Reeves', 18, '2007-04-26', 'HUMSS', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000377', '', 'reevescl@gmail.com', '09412181660', '2025-07-01'),
(507, '../assets/User-placeholder.png', '1037423109', '2301-000378', 'Edward', 'Melanie', 'Brooks', 22, '2002-09-05', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000378', '', 'brooksem@gmail.com', '09771347543', '2025-07-01'),
(508, '../assets/User-placeholder.png', '8284462547', '2301-000379', 'Terry', 'Isabel', 'Lawson', 18, '2007-02-23', 'STEM', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000379', '', 'lawsonti@gmail.com', '09568657663', '2025-07-01'),
(509, '../assets/User-placeholder.png', '2890743408', '2301-000380', 'Andrew', 'Kimberly', 'Jacobs', 22, '2003-05-03', 'BS Civil Engineering', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000380', '', 'jacobsak@gmail.com', '09219693285', '2025-07-01'),
(510, '../assets/User-placeholder.png', '7195675167', '2301-000381', 'Paul', 'Nicole', 'Nichols', 18, '2006-12-22', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000381', '', 'nicholspn@gmail.com', '09946692287', '2025-07-01'),
(511, '../assets/User-placeholder.png', '5153676755', '2301-000382', 'Gregory', 'Jennifer', 'Ray', 19, '2005-08-29', 'BS Management Accounting', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000382', '', 'raygj@gmail.com', '09172910824', '2025-07-01'),
(512, '../assets/User-placeholder.png', '7887304489', '2301-000383', 'Allen', 'Jeff', 'Livingston', 18, '2006-12-04', 'BS Physical Therapy', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000383', '', 'livingstonaj@gmail.com', '09907532397', '2025-07-01'),
(513, '../assets/User-placeholder.png', '6958358420', '2301-000384', 'Ryan', 'Erik', 'Porter', 19, '2006-04-17', 'BS Midwifery', '1', '2024-2025', '2', 'CC', 'Student', '2301-000384', '', 'porterre@gmail.com', '09875750196', '2025-07-01'),
(514, '../assets/User-placeholder.png', '7641140968', '2301-000385', 'Kenneth', 'April', 'Davis', 23, '2002-06-01', 'BS Nursing', '4', '2024-2025', '2', 'CC', 'Student', '2301-000385', '', 'daviska@gmail.com', '09627897233', '2025-07-01'),
(515, '../assets/User-placeholder.png', '9828058003', '2301-000386', 'John', 'Kristie', 'Roberts', 23, '2001-08-12', 'BS Accountancy', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000386', '', 'robertsjk@gmail.com', '09458933484', '2025-07-01'),
(516, '../assets/User-placeholder.png', '5415211734', '2301-000387', 'Donald', 'Phillip', 'Greer', 23, '2001-11-18', 'BS Medical Technology', '2', '2024-2025', '2', 'SE', 'Student', '2301-000387', '', 'greerdp@gmail.com', '09500450775', '2025-07-01'),
(517, '../assets/User-placeholder.png', '9354735269', '2301-000388', 'Corey', 'Randall', 'Lynch', 18, '2007-06-07', 'BS Physical Therapy', '1', '2024-2025', '2', 'CC', 'Student', '2301-000388', '', 'lynchcr@gmail.com', '09251850963', '2025-07-01'),
(518, '../assets/User-placeholder.png', '9353191328', '2301-000389', 'Cory', 'Timothy', 'Johnson', 19, '2006-05-12', 'AB Communication', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000389', '', 'johnsonct@gmail.com', '09786968899', '2025-07-01'),
(519, '../assets/User-placeholder.png', '1753750438', '2301-000390', 'Aaron', 'Brian', 'Sheppard', 18, '2006-10-28', 'ICT', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000390', '', 'sheppardab@gmail.com', '09420823575', '2025-07-01'),
(520, '../assets/User-placeholder.png', '3338864330', '2301-000391', 'Brian', 'Adam', 'Mckay', 23, '2001-07-28', 'BS Midwifery', '1', '2024-2025', '2', 'SE', 'Student', '2301-000391', '', 'mckayba@gmail.com', '09607695391', '2025-07-01'),
(521, '../assets/User-placeholder.png', '0527495466', '2301-000392', 'Victor', 'Kristen', 'Hart', 19, '2005-07-15', 'AB Communication', '3', '2024-2025', '2', 'CC', 'Student', '2301-000392', '', 'hartvk@gmail.com', '09377816957', '2025-07-01'),
(522, '../assets/User-placeholder.png', '3760531230', '2301-000393', 'Jacob', 'Calvin', 'Schultz', 17, '2008-05-09', 'HE', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000393', '', 'schultzjc@gmail.com', '09590834319', '2025-07-01'),
(523, '../assets/User-placeholder.png', '1011856536', '2301-000394', 'Jeffrey', 'Christine', 'Cortez', 20, '2004-12-27', 'BS Elementary Education', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000394', '', 'cortezjc@gmail.com', '09642308112', '2025-07-01'),
(524, '../assets/User-placeholder.png', '1365118633', '2301-000395', 'Lawrence', 'Erin', 'Moran', 21, '2003-08-30', 'HE', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000395', '', 'moranle@gmail.com', '09862654652', '2025-07-01'),
(525, '../assets/User-placeholder.png', '0923696697', '2301-000396', 'George', 'Joshua', 'Munoz', 18, '2006-08-09', 'Bachelor in Secondary Education', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000396', '', 'munozgj@gmail.com', '09506776753', '2025-07-01'),
(526, '../assets/User-placeholder.png', '7726301809', '2301-000397', 'Robert', 'Todd', 'Weaver', 22, '2003-04-06', 'BS Management Accounting', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000397', '', 'weaverrt@gmail.com', '09940671271', '2025-07-01'),
(527, '../assets/User-placeholder.png', '3876017473', '2301-000398', 'Brian', 'Adam', 'Ball', 18, '2007-06-11', 'BS Medical Technology', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000398', '', 'ballba@gmail.com', '09825133692', '2025-07-01'),
(528, '../assets/User-placeholder.png', '2242686562', '2301-000399', 'Sean', 'Beverly', 'Hodges', 23, '2001-09-10', 'BS Industrial Engineering', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000399', '', 'hodgessb@gmail.com', '09532841404', '2025-07-01'),
(529, '../assets/User-placeholder.png', '1168879337', '2301-000400', 'Dennis', 'Elizabeth', 'Kline', 20, '2005-05-19', 'BS Tourism Management', '3', '2024-2025', '2', 'SE', 'Student', '2301-000400', '', 'klinede@gmail.com', '09407107776', '2025-07-01');
INSERT INTO `users` (`id`, `student_photo`, `rfid_code`, `user_id`, `first_name`, `middle_name`, `last_name`, `age`, `birthday`, `course`, `year_level`, `academic_year`, `semester`, `department`, `user_type`, `username`, `password`, `email`, `phone_number`, `created_at`) VALUES
(530, '../assets/User-placeholder.png', '1986556057', '2301-000401', 'Gregory', 'Richard', 'Conner', 22, '2002-09-11', 'BS Medical Technology', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000401', '', 'connergr@gmail.com', '09224314637', '2025-07-01'),
(531, '../assets/User-placeholder.png', '0490948645', '2301-000402', 'Steven', 'Joshua', 'Johnson', 18, '2006-11-05', 'HE', '4', '2024-2025', '2', 'SHS', 'Student', '2301-000402', '', 'johnsonsj@gmail.com', '09717917757', '2025-07-01'),
(532, '../assets/User-placeholder.png', '3310886678', '2301-000403', 'Justin', 'Kimberly', 'Gardner', 23, '2002-04-26', 'HUMSS', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000403', '', 'gardnerjk@gmail.com', '09968986671', '2025-07-01'),
(533, '../assets/User-placeholder.png', '3535088603', '2301-000404', 'Matthew', 'Vickie', 'King', 19, '2005-08-25', 'BS Industrial Engineering', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000404', '', 'kingmv@gmail.com', '09188492612', '2025-07-01'),
(534, '../assets/User-placeholder.png', '3820972747', '2301-000405', 'Joel', 'Roger', 'Moore', 20, '2005-04-22', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000405', '', 'moorejr@gmail.com', '09683721988', '2025-07-01'),
(535, '../assets/User-placeholder.png', '8764155076', '2301-000406', 'Jordan', 'Kathryn', 'Johnson', 20, '2005-01-30', 'HE', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000406', '', 'johnsonjk@gmail.com', '09858948163', '2025-07-01'),
(536, '../assets/User-placeholder.png', '7373501517', '2301-000407', 'Brandon', 'Erin', 'Butler', 17, '2008-01-23', 'ICT', '2', '2024-2025', '2', 'SE', 'Student', '2301-000407', '', 'butlerbe@gmail.com', '09786902905', '2025-07-01'),
(537, '../assets/User-placeholder.png', '3186123456', '2301-000408', 'David', 'Kevin', 'Lee', 20, '2004-07-21', 'BS Medical Technology', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000408', '', 'leedk@gmail.com', '09853153693', '2025-07-01'),
(538, '../assets/User-placeholder.png', '9355244245', '2301-000409', 'Christopher', 'Paul', 'Martin', 21, '2003-11-21', 'HE', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000409', '', 'martincp@gmail.com', '09762344268', '2025-07-01'),
(539, '../assets/User-placeholder.png', '4466698282', '2301-000410', 'Daniel', 'Linda', 'Henry', 19, '2006-01-31', 'BS Tourism Management', '2', '2024-2025', '2', 'CC', 'Student', '2301-000410', '', 'henrydl@gmail.com', '09547201964', '2025-07-01'),
(540, '../assets/User-placeholder.png', '0866235870', '2301-000411', 'Joshua', 'Rachael', 'Guerrero', 21, '2003-07-30', 'BS Medical Technology', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000411', '', 'guerrerojr@gmail.com', '09586878987', '2025-07-01'),
(541, '../assets/User-placeholder.png', '7625092511', '2301-000412', 'Austin', 'Robert', 'Romero', 21, '2003-07-18', 'BS Business Administration', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000412', '', 'romeroar@gmail.com', '09738871628', '2025-07-01'),
(542, '../assets/User-placeholder.png', '5488079962', '2301-000413', 'Terry', 'Marc', 'Hopkins', 21, '2004-02-02', 'STEM', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000413', '', 'hopkinstm@gmail.com', '09462182832', '2025-07-01'),
(543, '../assets/User-placeholder.png', '6207387891', '2301-000414', 'Matthew', 'Tammy', 'Williams', 21, '2003-09-11', 'BS Accountancy', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000414', '', 'williamsmt@gmail.com', '09135744400', '2025-07-01'),
(544, '../assets/User-placeholder.png', '3877810163', '2301-000415', 'Randy', 'Timothy', 'Clark', 17, '2007-11-22', 'BS Information Technology', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000415', '', 'clarkrt@gmail.com', '09814401421', '2025-07-01'),
(545, '../assets/User-placeholder.png', '7002638032', '2301-000416', 'Joshua', 'Richard', 'Jackson', 20, '2005-05-03', 'BS Elementary Education', '3', '2024-2025', '2', 'CC', 'Student', '2301-000416', '', 'jacksonjr@gmail.com', '09349223383', '2025-07-01'),
(546, '../assets/User-placeholder.png', '9198677235', '2301-000417', 'Thomas', 'David', 'Bender', 21, '2003-08-17', 'STEM', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000417', '', 'bendertd@gmail.com', '09229762578', '2025-07-01'),
(547, '../assets/User-placeholder.png', '3687158851', '2301-000418', 'Thomas', 'Linda', 'Patterson', 18, '2006-12-23', 'Dentistry', '1', '2024-2025', '2', 'SMIHT', 'Student', '2301-000418', '', 'pattersontl@gmail.com', '09595492434', '2025-07-01'),
(548, '../assets/User-placeholder.png', '9390775032', '2301-000419', 'Arthur', 'Amanda', 'Bell', 18, '2007-04-17', 'BS Civil Engineering', '2', '2024-2025', '2', 'SE', 'Student', '2301-000419', '', 'bellaa@gmail.com', '09768981534', '2025-07-01'),
(549, '../assets/User-placeholder.png', '4422375812', '2301-000420', 'Andrew', 'Megan', 'Ballard', 19, '2005-12-16', 'BS Information Technology', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000420', '', 'ballardam@gmail.com', '09418915311', '2025-07-01'),
(550, '../assets/User-placeholder.png', '8070330223', '2301-000421', 'Todd', 'Daniel', 'Williams', 19, '2005-08-10', 'ICT', '2', '2024-2025', '2', 'CC', 'Student', '2301-000421', '', 'williamstd@gmail.com', '09305489882', '2025-07-01'),
(551, '../assets/User-placeholder.png', '6443787923', '2301-000422', 'William', 'Shawna', 'Weaver', 17, '2007-08-14', 'BS Criminology', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000422', '', 'weaverws@gmail.com', '09514718620', '2025-07-01'),
(552, '../assets/User-placeholder.png', '6633687603', '2301-000423', 'Steve', 'Ethan', 'Simmons', 17, '2008-05-05', 'AB Communication', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000423', '', 'simmonsse@gmail.com', '09802314798', '2025-07-01'),
(553, '../assets/User-placeholder.png', '3134700160', '2301-000424', 'Michael', 'David', 'Blankenship', 23, '2002-06-17', 'AB Psychology', '4', '2024-2025', '2', 'SE', 'Student', '2301-000424', '', 'blankenshipmd@gmail.com', '09178627614', '2025-07-01'),
(554, '../assets/User-placeholder.png', '7280418019', '2301-000425', 'Joseph', 'Mary', 'Melton', 17, '2008-03-21', 'STEM', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000425', '', 'meltonjm@gmail.com', '09426092722', '2025-07-01'),
(555, '../assets/User-placeholder.png', '9943547688', '2301-000426', 'Ronald', 'Zachary', 'Johnston', 17, '2008-03-26', 'BS Medical Technology', '4', '2024-2025', '2', 'CC', 'Student', '2301-000426', '', 'johnstonrz@gmail.com', '09613281392', '2025-07-01'),
(556, '../assets/User-placeholder.png', '0610869292', '2301-000427', 'Alex', 'Christine', 'Benson', 21, '2004-01-22', 'BS Criminology', '3', '2024-2025', '2', 'SE', 'Student', '2301-000427', '', 'bensonac@gmail.com', '09442430504', '2025-07-01'),
(557, '../assets/User-placeholder.png', '5079099292', '2301-000428', 'Jesse', 'Mary', 'Hudson', 17, '2007-11-21', 'BS Accountancy', '2', '2024-2025', '2', 'SE', 'Student', '2301-000428', '', 'hudsonjm@gmail.com', '09381898284', '2025-07-01'),
(558, '../assets/User-placeholder.png', '8384924355', '2301-000429', 'Jared', 'Trevor', 'Wallace', 17, '2007-10-08', 'BS Criminology', '2', '2024-2025', '2', 'SEAS', 'Student', '2301-000429', '', 'wallacejt@gmail.com', '09269807733', '2025-07-01'),
(559, '../assets/User-placeholder.png', '9719220538', '2301-000430', 'Jeffrey', 'Daniel', 'Davis', 22, '2002-07-08', 'BS Midwifery', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000430', '', 'davisjd@gmail.com', '09517477650', '2025-07-01'),
(560, '../assets/User-placeholder.png', '8089446905', '2301-000431', 'Wayne', 'Brittany', 'Wilson', 22, '2002-10-20', 'BS Physical Therapy', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000431', '', 'wilsonwb@gmail.com', '09629407548', '2025-07-01'),
(561, '../assets/User-placeholder.png', '7398606869', '2301-000432', 'James', 'Tracy', 'Shah', 23, '2002-06-03', 'BS Business Administration', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000432', '', 'shahjt@gmail.com', '09593681487', '2025-07-01'),
(562, '../assets/User-placeholder.png', '7572999698', '2301-000433', 'Kevin', 'Jessica', 'Smith', 21, '2004-06-07', 'BS Information Technology', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000433', '', 'smithkj@gmail.com', '09935739100', '2025-07-01'),
(563, '../assets/User-placeholder.png', '0308294861', '2301-000434', 'Gary', 'Kelly', 'Hernandez', 18, '2006-07-29', 'BS Accountancy', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000434', '', 'hernandezgk@gmail.com', '09761492922', '2025-07-01'),
(564, '../assets/User-placeholder.png', '5888865548', '2301-000435', 'Harold', 'Cheryl', 'Prince', 23, '2002-06-24', 'AB Psychology', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000435', '', 'princehc@gmail.com', '09224455138', '2025-07-01'),
(565, '../assets/User-placeholder.png', '4639758991', '2301-000436', 'Jeffery', 'Debra', 'Howard', 21, '2004-04-06', 'ABM', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000436', '', 'howardjd@gmail.com', '09447991519', '2025-07-01'),
(566, '../assets/User-placeholder.png', '0983683468', '2301-000437', 'Larry', 'William', 'Reyes', 23, '2002-04-25', 'AB Communication', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000437', '', 'reyeslw@gmail.com', '09541706897', '2025-07-01'),
(567, '../assets/User-placeholder.png', '9436351085', '2301-000438', 'Carl', 'Thomas', 'Moreno', 17, '2008-04-15', 'BS Physical Therapy', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000438', '', 'morenoct@gmail.com', '09504284396', '2025-07-01'),
(568, '../assets/User-placeholder.png', '4534991008', '2301-000439', 'Shawn', 'Abigail', 'Williams', 20, '2004-07-28', 'BS Midwifery', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000439', '', 'williamssa@gmail.com', '09732049618', '2025-07-01'),
(569, '../assets/User-placeholder.png', '0008522875', '2301-000440', 'Vincent', 'Mark', 'Pabon', 18, '2007-03-15', 'BS Information Technology', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000440', '', 'hernandezbh@gmail.com', '09866007132', '2025-07-01'),
(570, '../assets/User-placeholder.png', '9019672979', '2301-000441', 'Andre', 'Michele', 'King', 21, '2003-12-24', 'ABM', '1', '2024-2025', '2', 'CC', 'Student', '2301-000441', '', 'kingam@gmail.com', '09296061252', '2025-07-01'),
(571, '../assets/User-placeholder.png', '1908087920', '2301-000442', 'Kenneth', 'Rachel', 'Cuevas', 17, '2007-07-09', 'ABM', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000442', '', 'cuevaskr@gmail.com', '09710822433', '2025-07-01'),
(572, '../assets/User-placeholder.png', '6592921077', '2301-000443', 'Joshua', 'Charles', 'Atkinson', 19, '2006-07-01', 'BS Physical Therapy', '1', '2024-2025', '2', 'CC', 'Student', '2301-000443', '', 'atkinsonjc@gmail.com', '09762854964', '2025-07-01'),
(573, '../assets/User-placeholder.png', '1709756183', '2301-000444', 'Hunter', 'Jose', 'Miller', 21, '2004-03-11', 'BS Criminology', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000444', '', 'millerhj@gmail.com', '09478061993', '2025-07-01'),
(574, '../assets/User-placeholder.png', '2117798007', '2301-000445', 'Brandon', 'Jason', 'Patton', 20, '2005-05-23', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000445', '', 'pattonbj@gmail.com', '09939809916', '2025-07-01'),
(575, '../assets/User-placeholder.png', '7799576031', '2301-000446', 'Fred', 'Sharon', 'Hendricks', 22, '2003-03-04', 'Dentistry', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000446', '', 'hendricksfs@gmail.com', '09688669543', '2025-07-01'),
(576, '../assets/User-placeholder.png', '6705902824', '2301-000447', 'Nicholas', 'John', 'Diaz', 21, '2004-04-19', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'CC', 'Student', '2301-000447', '', 'diaznj@gmail.com', '09523743748', '2025-07-01'),
(577, '../assets/User-placeholder.png', '7082924367', '2301-000448', 'Michael', 'Jessica', 'Curtis', 18, '2006-08-15', 'Dentistry', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000448', '', 'curtismj@gmail.com', '09156318505', '2025-07-01'),
(578, '../assets/User-placeholder.png', '2987589078', '2301-000449', 'Kyle', 'Andrew', 'Myers', 18, '2006-10-05', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000449', '', 'myerska@gmail.com', '09648120656', '2025-07-01'),
(579, '../assets/User-placeholder.png', '2957353675', '2301-000450', 'James', 'Brian', 'Mann', 22, '2002-10-02', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000450', '', 'mannjb@gmail.com', '09603191150', '2025-07-01'),
(580, '../assets/User-placeholder.png', '0317159766', '2301-000451', 'James', 'Michael', 'Davenport', 22, '2003-05-25', 'BS Criminology', '3', '2024-2025', '2', 'SMIHT', 'Student', '2301-000451', '', 'davenportjm@gmail.com', '09935793177', '2025-07-01'),
(581, '../assets/User-placeholder.png', '5510852674', '2301-000452', 'David', 'Kristen', 'Weiss', 22, '2003-03-04', 'BS Elementary Education', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000452', '', 'weissdk@gmail.com', '09257738939', '2025-07-01'),
(582, '../assets/User-placeholder.png', '9572436950', '2301-000453', 'Martin', 'Nathaniel', 'Miller', 19, '2005-11-08', 'Bachelor in Secondary Education', '4', '2024-2025', '2', 'SAHS', 'Student', '2301-000453', '', 'millermn@gmail.com', '09916991258', '2025-07-01'),
(583, '../assets/User-placeholder.png', '4626832310', '2301-000454', 'James', 'Jennifer', 'Jennings', 17, '2008-02-05', 'BS Civil Engineering', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000454', '', 'jenningsjj@gmail.com', '09595450179', '2025-07-01'),
(584, '../assets/User-placeholder.png', '8662481245', '2301-000455', 'Luke', 'Michael', 'Rodriguez', 19, '2005-08-14', 'BS Physical Therapy', '2', '2024-2025', '2', 'SMIHT', 'Student', '2301-000455', '', 'rodriguezlm@gmail.com', '09393651552', '2025-07-01'),
(585, '../assets/User-placeholder.png', '6276642757', '2301-000456', 'Adam', 'Nathan', 'Johnson', 23, '2002-01-24', 'BS Accountancy', '2', '2024-2025', '2', 'SHS', 'Student', '2301-000456', '', 'johnsonan@gmail.com', '09260129674', '2025-07-01'),
(586, '../assets/User-placeholder.png', '9839035104', '2301-000457', 'Ernest', 'Joseph', 'Aguirre', 19, '2005-08-20', 'BS Industrial Engineering', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000457', '', 'aguirreej@gmail.com', '09303742142', '2025-07-01'),
(587, '../assets/User-placeholder.png', '2476589551', '2301-000458', 'Mark', 'Kyle', 'Meadows', 18, '2006-07-07', 'BS Nursing', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000458', '', 'meadowsmk@gmail.com', '09575287552', '2025-07-01'),
(588, '../assets/User-placeholder.png', '2819929675', '2301-000459', 'Scott', 'Chloe', 'Williams', 23, '2002-02-03', 'BS Criminology', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000459', '', 'williamssc@gmail.com', '09484486609', '2025-07-01'),
(589, '../assets/User-placeholder.png', '6186213434', '2301-000460', 'Isaiah', 'Ashley', 'Torres', 22, '2003-05-17', 'BS Industrial Engineering', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000460', '', 'torresia@gmail.com', '09958480761', '2025-07-01'),
(590, '../assets/User-placeholder.png', '4626174664', '2301-000461', 'David', 'Antonio', 'Harris', 22, '2003-03-08', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000461', '', 'harrisda@gmail.com', '09157483846', '2025-07-01'),
(591, '../assets/User-placeholder.png', '6766833209', '2301-000462', 'Tracy', 'Matthew', 'Allen', 18, '2007-03-27', 'Dentistry', '3', '2024-2025', '2', 'SE', 'Student', '2301-000462', '', 'allentm@gmail.com', '09600714119', '2025-07-01'),
(592, '../assets/User-placeholder.png', '4548189390', '2301-000463', 'Austin', 'Pamela', 'Mckinney', 19, '2005-11-21', 'BS Business Administration', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000463', '', 'mckinneyap@gmail.com', '09400202971', '2025-07-01'),
(593, '../assets/User-placeholder.png', '1118304265', '2301-000464', 'Brandon', 'Julie', 'Alvarez', 23, '2002-02-19', 'ICT', '2', '2024-2025', '2', 'CC', 'Student', '2301-000464', '', 'alvarezbj@gmail.com', '09811684624', '2025-07-01'),
(594, '../assets/User-placeholder.png', '7052947722', '2301-000465', 'Michael', 'Jeanette', 'Gonzalez', 23, '2002-01-05', 'ABM', '4', '2024-2025', '2', 'CC', 'Student', '2301-000465', '', 'gonzalezmj@gmail.com', '09430190011', '2025-07-01'),
(595, '../assets/User-placeholder.png', '3020789570', '2301-000466', 'Tyler', 'Christina', 'Patterson', 21, '2003-12-06', 'BS Industrial Engineering', '1', '2024-2025', '2', 'CC', 'Student', '2301-000466', '', 'pattersontc@gmail.com', '09499002521', '2025-07-01'),
(596, '../assets/User-placeholder.png', '0555123822', '2301-000467', 'Todd', 'Anthony', 'Drake', 17, '2007-08-04', 'BS Tourism Management', '1', '2024-2025', '2', 'SE', 'Student', '2301-000467', '', 'draketa@gmail.com', '09626090917', '2025-07-01'),
(597, '../assets/User-placeholder.png', '9018157007', '2301-000468', 'Scott', 'Chelsea', 'Pierce', 22, '2002-07-28', 'BS Elementary Education', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000468', '', 'piercesc@gmail.com', '09785000796', '2025-07-01'),
(598, '../assets/User-placeholder.png', '1902667074', '2301-000469', 'Adam', 'Courtney', 'Spencer', 17, '2007-10-26', 'BS Midwifery', '1', '2024-2025', '2', 'IBED', 'Student', '2301-000469', '', 'spencerac@gmail.com', '09127925388', '2025-07-01'),
(599, '../assets/User-placeholder.png', '2761551022', '2301-000470', 'Ray', 'Wayne', 'Ellis', 22, '2002-10-19', 'BS Criminology', '1', '2024-2025', '2', 'SAHS', 'Student', '2301-000470', '', 'ellisrw@gmail.com', '09781035363', '2025-07-01'),
(600, '../assets/User-placeholder.png', '4935104637', '2301-000471', 'John', 'Gabrielle', 'Bell', 23, '2002-03-16', 'BS Physical Therapy', '4', '2024-2025', '2', 'CC', 'Student', '2301-000471', '', 'belljg@gmail.com', '09492251458', '2025-07-01'),
(601, '../assets/User-placeholder.png', '6206763870', '2301-000472', 'David', 'Rachael', 'Morris', 22, '2002-11-02', 'Dentistry', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000472', '', 'morrisdr@gmail.com', '09392507809', '2025-07-01'),
(602, '../assets/User-placeholder.png', '5940115563', '2301-000473', 'Jason', 'Veronica', 'Greene', 21, '2003-11-27', 'BS Midwifery', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000473', '', 'greenejv@gmail.com', '09151619236', '2025-07-01'),
(603, '../assets/User-placeholder.png', '6643439544', '2301-000474', 'Lance', 'Barry', 'James', 23, '2001-10-19', 'STEM', '4', '2024-2025', '2', 'SE', 'Student', '2301-000474', '', 'jameslb@gmail.com', '09508162131', '2025-07-01'),
(604, '../assets/User-placeholder.png', '8986830554', '2301-000475', 'Carlos', 'Laura', 'Adkins', 23, '2001-10-03', 'ABM', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000475', '', 'adkinscl@gmail.com', '09982527173', '2025-07-01'),
(605, '../assets/User-placeholder.png', '5846463549', '2301-000476', 'Michael', 'David', 'Williams', 18, '2006-09-12', 'BS Physical Therapy', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000476', '', 'williamsmd@gmail.com', '09916325768', '2025-07-01'),
(606, '../assets/User-placeholder.png', '2038878216', '2301-000477', 'Benjamin', 'Carly', 'Turner', 19, '2006-06-06', 'BS Medical Technology', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000477', '', 'turnerbc@gmail.com', '09347969506', '2025-07-01'),
(607, '../assets/User-placeholder.png', '2245543315', '2301-000478', 'Steven', 'David', 'Thomas', 19, '2006-03-08', 'BS Midwifery', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000478', '', 'thomassd@gmail.com', '09574291819', '2025-07-01'),
(608, '../assets/User-placeholder.png', '9930206259', '2301-000479', 'Daniel', 'Monica', 'Arias', 21, '2004-01-17', 'ABM', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000479', '', 'ariasdm@gmail.com', '09833325479', '2025-07-01'),
(609, '../assets/User-placeholder.png', '8467821313', '2301-000480', 'Kevin', 'Michael', 'Smith', 19, '2005-11-25', 'ICT', '4', '2024-2025', '2', 'SMIHT', 'Student', '2301-000480', '', 'smithkm@gmail.com', '09105857110', '2025-07-01'),
(610, '../assets/User-placeholder.png', '8000488483', '2301-000481', 'Anthony', 'Linda', 'Cervantes', 22, '2003-02-03', 'ICT', '1', '2024-2025', '2', 'SEAS', 'Student', '2301-000481', '', 'cervantesal@gmail.com', '09709118142', '2025-07-01'),
(611, '../assets/User-placeholder.png', '9039933154', '2301-000482', 'Ryan', 'William', 'Esparza', 19, '2006-04-16', 'BS Nursing', '4', '2024-2025', '2', 'CC', 'Student', '2301-000482', '', 'esparzarw@gmail.com', '09808528826', '2025-07-01'),
(612, '../assets/User-placeholder.png', '8429789140', '2301-000483', 'James', 'Joseph', 'Ali', 20, '2005-01-28', 'BS Civil Engineering', '3', '2024-2025', '2', 'IBED', 'Student', '2301-000483', '', 'alijj@gmail.com', '09753613430', '2025-07-01'),
(613, '../assets/User-placeholder.png', '8154512322', '2301-000484', 'Anthony', 'Derek', 'Carroll', 18, '2006-07-14', 'BS Nursing', '4', '2024-2025', '2', 'SEAS', 'Student', '2301-000484', '', 'carrollad@gmail.com', '09222648713', '2025-07-01'),
(614, '../assets/User-placeholder.png', '7618658880', '2301-000485', 'Justin', 'Elizabeth', 'Wilson', 19, '2006-05-05', 'Bachelor in Secondary Education', '1', '2024-2025', '2', 'TESDA', 'Student', '2301-000485', '', 'wilsonje@gmail.com', '09343525044', '2025-07-01'),
(615, '../assets/User-placeholder.png', '9665010823', '2301-000486', 'Christopher', 'Timothy', 'Martinez', 22, '2003-04-15', 'BS Hospitality Management', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000486', '', 'martinezct@gmail.com', '09827892079', '2025-07-01'),
(616, '../assets/User-placeholder.png', '0340371812', '2301-000487', 'Jason', 'Nicholas', 'Rollins', 20, '2005-05-12', 'AB Psychology', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000487', '', 'rollinsjn@gmail.com', '09307531156', '2025-07-01'),
(617, '../assets/User-placeholder.png', '6462044098', '2301-000488', 'Philip', 'Amber', 'Mueller', 20, '2004-09-14', 'Dentistry', '3', '2024-2025', '2', 'SEAS', 'Student', '2301-000488', '', 'muellerpa@gmail.com', '09968346783', '2025-07-01'),
(618, '../assets/User-placeholder.png', '5556786195', '2301-000489', 'Steven', 'Alyssa', 'Benjamin', 20, '2005-01-07', 'BS Management Accounting', '4', '2024-2025', '2', 'TESDA', 'Student', '2301-000489', '', 'benjaminsa@gmail.com', '09184610015', '2025-07-01'),
(619, '../assets/User-placeholder.png', '2950180502', '2301-000490', 'Michael', 'Alex', 'Russell', 18, '2007-05-06', 'Dentistry', '2', '2024-2025', '2', 'SAHS', 'Student', '2301-000490', '', 'russellma@gmail.com', '09344357744', '2025-07-01'),
(620, '../assets/User-placeholder.png', '1159125668', '2301-000491', 'Shawn', 'Rhonda', 'Smith', 21, '2003-10-15', 'AB Psychology', '2', '2024-2025', '2', 'TESDA', 'Student', '2301-000491', '', 'smithsr@gmail.com', '09853630080', '2025-07-01'),
(621, '../assets/User-placeholder.png', '7560234011', '2301-000492', 'John', 'Michael', 'Roberts', 18, '2006-10-26', 'BS Management Accounting', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000492', '', 'robertsjm@gmail.com', '09819933800', '2025-07-01'),
(622, '../assets/User-placeholder.png', '2818109135', '2301-000493', 'Nicholas', 'Brandy', 'King', 23, '2002-02-06', 'BS Civil Engineering', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000493', '', 'kingnb@gmail.com', '09318968933', '2025-07-01'),
(623, '../assets/User-placeholder.png', '7190418887', '2301-000494', 'Robert', 'Christina', 'Taylor', 23, '2002-04-11', 'AB Communication', '3', '2024-2025', '2', 'SAHS', 'Student', '2301-000494', '', 'taylorrc@gmail.com', '09859659665', '2025-07-01'),
(624, '../assets/User-placeholder.png', '7545570963', '2301-000495', 'Mark', 'Claudia', 'Patton', 17, '2008-03-03', 'BS Tourism Management', '3', '2024-2025', '2', 'TESDA', 'Student', '2301-000495', '', 'pattonmc@gmail.com', '09595336565', '2025-07-01'),
(625, '../assets/User-placeholder.png', '8126189055', '2301-000496', 'Matthew', 'Shane', 'Watson', 18, '2006-10-31', 'AB Psychology', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000496', '', 'watsonms@gmail.com', '09563210798', '2025-07-01'),
(626, '../assets/User-placeholder.png', '9780514978', '2301-000497', 'Derek', 'Kelly', 'Durham', 22, '2003-06-17', 'BS Business Administration', '1', '2024-2025', '2', 'SHS', 'Student', '2301-000497', '', 'durhamdk@gmail.com', '09127748258', '2025-07-01'),
(627, '../assets/User-placeholder.png', '2791658236', '2301-000498', 'Robert', 'Cheryl', 'Campbell', 22, '2003-03-24', 'BS Business Administration', '2', '2024-2025', '2', 'CC', 'Student', '2301-000498', '', 'campbellrc@gmail.com', '09247824792', '2025-07-01'),
(628, '../assets/User-placeholder.png', '2022268596', '2301-000499', 'Daniel', 'Erica', 'Davis', 23, '2001-12-03', 'BS Tourism Management', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000499', '', 'davisde@gmail.com', '09432975465', '2025-07-01'),
(629, '../assets/User-placeholder.png', '1637572065', '2301-000500', 'Michael', 'Gene', 'Mcdowell', 23, '2002-01-30', 'STEM', '4', '2024-2025', '2', 'IBED', 'Student', '2301-000500', '', 'mcdowellmg@gmail.com', '09348385158', '2025-07-01'),
(630, '../assets/User-placeholder.png', '83EEL41EP7', '2302-000001', 'Russell', 'Bruce', 'Doyle', 20, '2004-09-11', NULL, NULL, '2024-2025', '2', 'SAHS', 'Employee', '2302-000001', '', 'doylerb@gmail.com', '09886857503', '2025-07-01'),
(631, '../assets/User-placeholder.png', 'E424109111', '2302-000002', 'Aaron', 'Julie', 'Cuevas', 19, '2006-06-16', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000002', '', 'cuevasaj@gmail.com', '09297867056', '2025-07-01'),
(632, '../assets/User-placeholder.png', 'EY086M9391', '2302-000003', 'Jon', 'Jose', 'Reed', 23, '2001-09-30', NULL, NULL, '2024-2025', '2', 'SHS', 'Employee', '2302-000003', '', 'reedjj@gmail.com', '09886824121', '2025-07-01'),
(633, '../assets/User-placeholder.png', '968L9E85EP', '2302-000004', 'Howard', 'Arthur', 'Johnson', 19, '2005-07-19', NULL, NULL, '2024-2025', '2', 'SEAS', 'Employee', '2302-000004', '', 'johnsonha@gmail.com', '09780797906', '2025-07-01'),
(634, '../assets/User-placeholder.png', 'OEE0370MYL', '2302-000005', 'Luke', 'Charles', 'Gibson', 19, '2005-10-08', NULL, NULL, '2024-2025', '2', 'TESDA', 'Employee', '2302-000005', '', 'gibsonlc@gmail.com', '09551786715', '2025-07-01'),
(635, '../assets/User-placeholder.png', 'ELP6LE85P3', '2302-000006', 'Erik', 'Crystal', 'Wolfe', 23, '2001-10-24', NULL, NULL, '2024-2025', '2', 'SHS', 'Employee', '2302-000006', '', 'wolfeec@gmail.com', '09386414064', '2025-07-01'),
(636, '../assets/User-placeholder.png', '2M29EE69E8', '2302-000007', 'Christopher', 'Benjamin', 'Davis', 18, '2006-11-09', NULL, NULL, '2024-2025', '2', 'SE', 'Employee', '2302-000007', '', 'daviscb@gmail.com', '09772615209', '2025-07-01'),
(637, '../assets/User-placeholder.png', '8EL0089633', '2302-000008', 'Anthony', 'Brandy', 'Cole', 23, '2001-08-17', NULL, NULL, '2024-2025', '2', 'CC', 'Employee', '2302-000008', '', 'coleab@gmail.com', '09441310818', '2025-07-01'),
(638, '../assets/User-placeholder.png', '9E8L5PM944', '2302-000009', 'Edward', 'Madison', 'Curry', 17, '2007-07-25', NULL, NULL, '2024-2025', '2', 'TESDA', 'Employee', '2302-000009', '', 'curryem@gmail.com', '09857324137', '2025-07-01'),
(639, '../assets/User-placeholder.png', '0835OEEY3E', '2302-000010', 'Jason', 'Alejandro', 'Murphy', 20, '2004-09-11', NULL, NULL, '2024-2025', '2', 'TESDA', 'Employee', '2302-000010', '', 'murphyja@gmail.com', '09873916000', '2025-07-01'),
(640, '../assets/User-placeholder.png', 'PY51E3P57Y', '2302-000011', 'Adam', 'Steven', 'Jones', 21, '2004-01-10', NULL, NULL, '2024-2025', '2', 'SMIHT', 'Employee', '2302-000011', '', 'jonesas@gmail.com', '09809598165', '2025-07-01'),
(641, '../assets/User-placeholder.png', 'MO7E61O057', '2302-000012', 'Martin', 'Devin', 'Jacobson', 23, '2002-06-03', NULL, NULL, '2024-2025', '2', 'TESDA', 'Employee', '2302-000012', '', 'jacobsonmd@gmail.com', '09101217049', '2025-07-01'),
(642, '../assets/User-placeholder.png', 'MEM67OE15E', '2302-000013', 'Richard', 'Dustin', 'Hodge', 21, '2003-07-21', NULL, NULL, '2024-2025', '2', 'CC', 'Employee', '2302-000013', '', 'hodgerd@gmail.com', '09790668601', '2025-07-01'),
(643, '../assets/User-placeholder.png', '0008526106', '2302-000014', 'Todd', 'Todd', 'Bishop', 23, '2001-09-26', NULL, NULL, '2024-2025', '2', 'SE', 'Employee', '2302-000014', '', 'bishoptt@gmail.com', '09786408948', '2017-07-01'),
(644, '../assets/User-placeholder.png', '0008457235', '2302-000015', 'Brian', 'Roy', 'Davis', 22, '2002-08-10', NULL, NULL, '2024-2025', '2', 'SEAS', 'Employee', '2302-000015', '', 'davisbr@gmail.com', '09182410927', '2015-07-01'),
(645, '../assets/User-placeholder.png', '0008504785', '2302-000016', 'Brandon', 'Brianna', 'Miller', 23, '2002-06-26', NULL, NULL, '2024-2025', '2', 'ADMIN', 'Employee', '2302-000016', '', 'millerbb@gmail.com', '09802601979', '2012-07-01'),
(649, '../assets/User-placeholder.png', '0008490453', '2302-000020', 'Kherlyn', 'Trinidad', 'Bico', 19, '2005-10-12', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000020', '', 'edwardsjl@gmail.com', '09587735137', '2025-07-01'),
(650, '../assets/Dev.png', '0005796121', 'admin', 'John Gregg', 'Virina', 'Felicisimo', 25, '2000-06-13', '', NULL, '2024-2025', '2', 'ADMIN', 'Admin', 'admin', '$2y$12$eTZi9pja/4FQNdFg3pYrbu7NkWQhL7/gq.CJFGXRZGyY8RT60Jlqm', 'felicisimojv@gmail.com', '09917822877', '2025-07-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rfid_code` (`rfid_code`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `fk_department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rfid_code` (`rfid_code`),
  ADD KEY `department` (`department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_rfid_code` FOREIGN KEY (`rfid_code`) REFERENCES `users` (`rfid_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
