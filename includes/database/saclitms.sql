-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 03:29 PM
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
(59, '0991782287', 'Admin', '2025-06-01', '07:30:00', '17:30:00', 'Edited', 'Fix'),
(60, '0991782287', 'Admin', '2025-06-02', '07:30:00', '17:00:00', 'Normal', 'None'),
(61, '0991782287', 'Admin', '2025-06-03', '07:30:00', '17:30:00', 'Normal', 'None'),
(62, '0991782287', 'Admin', '2025-06-04', '08:00:00', '17:00:00', 'Normal', 'None'),
(63, '0991782287', 'Admin', '2025-06-05', '07:30:00', '19:30:00', 'Normal', 'None'),
(64, '0991782287', 'Admin', '2025-06-06', '10:00:00', '20:00:00', 'Normal', 'None'),
(65, '0991782287', 'Admin', '2025-06-07', '12:00:00', '17:30:00', 'Normal', 'None'),
(77, '1234567890', 'Student', '2025-06-18', '04:59:22', '04:59:39', 'Normal', 'None'),
(78, '0991782287', 'Admin', '2025-06-18', '04:59:44', '05:00:01', 'Normal', 'None'),
(80, '0991782287', 'Admin', '2025-06-24', '11:57:12', NULL, 'Normal', 'None'),
(81, '0991782287', 'Admin', '2025-06-25', '01:37:36', '09:25:37', 'Normal', '\'None\''),
(82, 'EEY7M18L5E', 'Employee', '2025-06-25', '01:37:54', '09:11:45', 'Normal', '\'None\''),
(83, 'Y67O4L56M6', 'Employee', '2025-06-25', '01:38:03', NULL, 'Normal', '\'None\''),
(84, '81E8LE52E8', 'Employee', '2025-06-25', '09:11:52', '09:12:07', 'Normal', '\'None\'');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_name_shorten` varchar(100) DEFAULT NULL,
  `course_ini` varchar(10) DEFAULT NULL,
  `course_department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_name_shorten`, `course_ini`, `course_department`) VALUES
('ABCOMM-2025', 'Bachelor Of Arts In Communication', 'AB Comm', 'AB Comm', NULL),
('ABPSYCH-2025', 'Bachelor Of Arts In Psychology', 'AB Psychology', 'AB Psych', NULL),
('BEED-2019', 'Bachelor Of Elementary Education', 'BSed', 'BSed', NULL),
('BSA-2018', 'Bachelor Of Science In Accountancy', 'BS Accountancy', 'BSA', NULL),
('BSBA-2020', 'Bachelor Of Science In Business Administration', 'BS Business Administration', 'BSBA', NULL),
('BSCE-2022', 'Bachelor Of Science In Civil Engineering', 'BS Civil Engineering', 'BSCE', NULL),
('BSCRIM-2015', 'Bachelor Of Science In Criminology', 'BS Criminology', 'BS Crim', NULL),
('BSED-2020', 'Bachelor Of Secondary Education', 'BS Ed', 'BSEd', NULL),
('BSHM-2015', 'Bachelor Of Science In Hospitality Management', 'BS Hospitality Management', 'BSHM', NULL),
('BSIE-2018', 'Bachelor Of Science In Industrial Engineering', 'BS Industrial Engineering', 'BSIE', NULL),
('BSIT-2018', 'Bachelor Of Science In Information Technology', 'BS Information Technology', 'BSIT', 'SBAT'),
('BSMA-2019', 'Bachelor Of Science In Management Accounting', 'BS Management Accounting', 'BSMA', NULL),
('BSMID-2022', 'Bachelor Of Science In Midwifery', 'BS Midwifery', 'BS Mid', NULL),
('BSMT-2020', 'Bachelor Of Science In Medical Technology', 'BS Medical Technology', 'BSMT', NULL),
('BSN-2015', 'Bachelor Of Science In Nursing', 'BS Nursing', 'BSN', NULL),
('BSPT-2019', 'Bachelor Of Science In Physical Therapy', 'BS Physical Therapy', 'BSPT', NULL),
('BSTM-2020', 'Bachelor Of Science In Tourism Management', 'BS Tourism Management', 'BSTM', NULL),
('DEN-2019', 'Doctor Of Dental Medicine', 'Dentistry', 'Dentistry', NULL),
('OTHERS', 'Professional Education Uniting', 'TESDA Programs', 'TESDA', NULL);

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
('SBAT-2018', 'School Of Business, Accounting and Technology', 'SBAT');

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
  `department` varchar(100) DEFAULT NULL,
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
(1, '../assets/User-placeholder.png', '6516259278', '2301-000001', 'Henry', 'Carla', 'Cooper', 19, '2005-11-04', 'BS Nursing', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000001', '$2y$12$q36WgrnkP55uYrcWCoJDsOb/dhw0rykQ6mtDHSLGUaMieg56yZTbe', 'cooperhc@gmail.com', 'undefined', '2025-06-25'),
(2, '../assets/User-placeholder.png', '6637085092', '2301-000002', 'Joseph', 'Brittany', 'Kelley', 21, '2004-03-16', 'BS Hospitality Management', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000002', '$2y$12$qXQT7oonjoydsWfUa8n8p.Ov9nH7Wfzb/Ys2CwyUHksK6/HfT0Vyu', 'kelleyjb@gmail.com', 'undefined', '2025-06-25'),
(3, '../assets/User-placeholder.png', '7753970662', '2301-000003', 'Adam', 'Darlene', 'Moore', 23, '2001-08-29', 'BS Nursing', '3', '2024-2025', '2', 'SNAHS', 'Student', '2301-000003', '', 'mooread@gmail.com', '09966822435', '2025-06-25'),
(4, '../assets/User-placeholder.png', '4074123496', '2301-000004', 'Joshua', 'Chris', 'Lucas', 17, '2008-03-27', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000004', '', 'lucasjc@gmail.com', '09424665989', '2025-06-25'),
(5, '../assets/User-placeholder.png', '7550622543', '2301-000005', 'Matthew', 'Erika', 'White', 20, '2004-10-11', 'BS Accountancy', '1', '2024-2025', '2', 'SASH', 'Student', '2301-000005', '', 'whiteme@gmail.com', '09221439890', '2025-06-25'),
(6, '../assets/User-placeholder.png', '4455401734', '2301-000006', 'Christopher', 'Michael', 'Houston', 19, '2006-03-10', 'BS Physical Therapy', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000006', '', 'houstoncm@gmail.com', '09711449172', '2025-06-25'),
(7, '../assets/User-placeholder.png', '1751418460', '2301-000007', 'William', 'Dominic', 'Johnson', 20, '2005-02-09', 'AB Psychology', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000007', '$2y$12$j54NJDrefnocok7.sDdybO28ZPrWY7CWHq7rxU/h90A1WW7SJb/le', 'johnsonwd@gmail.com', 'undefined', '2025-06-25'),
(8, '../assets/User-placeholder.png', '1730380357', '2301-000008', 'Brandon', 'Lisa', 'Jimenez', 17, '2008-05-25', 'AB Psychology', '3', '2024-2025', '2', 'SIHTM', 'Student', '2301-000008', '', 'jimenezbl@gmail.com', '09268259608', '2025-06-25'),
(9, '../assets/User-placeholder.png', '6001110555', '2301-000009', 'John', 'Todd', 'Lopez', 22, '2002-08-15', 'BS Midwifery', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000009', '', 'lopezjt@gmail.com', '09179643804', '2025-06-25'),
(10, '../assets/User-placeholder.png', '3821590899', '2301-000010', 'Travis', 'Daniel', 'Obrien', 20, '2004-09-18', 'BSed', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000010', '', 'obrientd@gmail.com', '09490039438', '2025-06-25'),
(11, '../assets/User-placeholder.png', '6252821031', '2301-000011', 'Kyle', 'Madison', 'Moses', 17, '2007-10-29', 'BS Industrial Engineering', '2', '2024-2025', '2', 'SCT', 'Student', '2301-000011', '', 'moseskm@gmail.com', '09713518784', '2025-06-25'),
(12, '../assets/User-placeholder.png', '4872055574', '2301-000012', 'Ian', 'Robert', 'Rivera', 22, '2002-12-12', 'BS Management Accounting', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000012', '', 'riverair@gmail.com', '09522860390', '2025-06-25'),
(13, '../assets/User-placeholder.png', '1485408522', '2301-000013', 'David', 'Chelsea', 'Miller', 17, '2007-09-19', 'BS Hospitality Management', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000013', '', 'millerdc@gmail.com', '09379280452', '2025-06-25'),
(14, '../assets/User-placeholder.png', '7761333737', '2301-000014', 'Joseph', 'Johnny', 'Clark', 19, '2006-04-01', 'BS Midwifery', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000014', '', 'clarkjj@gmail.com', '09715896925', '2025-06-25'),
(15, '../assets/User-placeholder.png', '8839389612', '2301-000015', 'Robert', 'Sarah', 'Perkins', 20, '2004-11-19', 'BS Medical Technology', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000015', '', 'perkinsrs@gmail.com', '09358121330', '2025-06-25'),
(16, '../assets/User-placeholder.png', '1281789591', '2301-000016', 'Kyle', 'Whitney', 'Scott', 22, '2003-05-14', 'BS Accountancy', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000016', '', 'scottkw@gmail.com', '09885528555', '2025-06-25'),
(17, '../assets/User-placeholder.png', '0045964074', '2301-000017', 'William', 'Stephen', 'Sloan', 23, '2001-08-24', 'BS Midwifery', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000017', '', 'sloanws@gmail.com', '09101789068', '2025-06-25'),
(18, '../assets/User-placeholder.png', '7546239738', '2301-000018', 'Kevin', 'Henry', 'Montoya', 22, '2002-12-23', 'BS Ed', '2', '2024-2025', '2', 'SCT', 'Student', '2301-000018', '', 'montoyakh@gmail.com', '09369418889', '2025-06-25'),
(19, '../assets/User-placeholder.png', '5826115878', '2301-000019', 'Nicholas', 'Christopher', 'Chandler', 21, '2003-10-28', 'BS Management Accounting', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000019', '', 'chandlernc@gmail.com', '09742589958', '2025-06-25'),
(20, '../assets/User-placeholder.png', '1806479600', '2301-000020', 'Donald', 'Paula', 'Powell', 18, '2006-12-25', 'AB Psychology', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000020', '', 'powelldp@gmail.com', '09455854644', '2025-06-25'),
(21, '../assets/User-placeholder.png', '1795907954', '2301-000021', 'Jason', 'Katelyn', 'Gray', 23, '2001-11-01', 'BS Civil Engineering', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000021', '', 'grayjk@gmail.com', '09472781847', '2025-06-25'),
(22, '../assets/User-placeholder.png', '4712234856', '2301-000022', 'George', 'Katelyn', 'Mccoy', 18, '2006-08-13', 'TESDA Programs', '2', '2024-2025', '2', 'SNAHS', 'Student', '2301-000022', '', 'mccoygk@gmail.com', '09729661300', '2025-06-25'),
(23, '../assets/User-placeholder.png', '4192919904', '2301-000023', 'John', 'Kelly', 'Boyd', 20, '2005-05-24', 'BS Information Technology', '3', '2024-2025', '2', 'SIHTM', 'Student', '2301-000023', '$2y$12$lcmarkvwbSthbanxmLnyIueOxc/4aMSp5TxIQOKQSoD4dBREEqHOa', 'boydjk@gmail.com', 'undefined', '2025-06-25'),
(24, '../assets/User-placeholder.png', '0568459245', '2301-000024', 'Donald', 'Christopher', 'Aguilar', 17, '2007-10-08', 'BS Industrial Engineering', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000024', '', 'aguilardc@gmail.com', '09388064819', '2025-06-25'),
(25, '../assets/User-placeholder.png', '9476595352', '2301-000025', 'David', 'Danielle', 'Holt', 21, '2004-06-04', 'BS Accountancy', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000025', '', 'holtdd@gmail.com', '09594460114', '2025-06-25'),
(26, '../assets/User-placeholder.png', '8289411308', '2301-000026', 'Erik', 'Donald', 'Nunez', 23, '2001-12-23', 'BSed', '3', '2024-2025', '2', 'SNAHS', 'Student', '2301-000026', '', 'nunezed@gmail.com', '09968236033', '2025-06-25'),
(27, '../assets/User-placeholder.png', '6722882628', '2301-000027', 'Alan', 'Sarah', 'Fischer', 17, '2007-09-15', 'BS Accountancy', '1', '2024-2025', '2', 'SCT', 'Student', '2301-000027', '', 'fischeras@gmail.com', '09967911264', '2025-06-25'),
(28, '../assets/User-placeholder.png', '1981303352', '2301-000028', 'Michael', 'Samantha', 'Lewis', 21, '2004-04-19', 'BS Civil Engineering', '4', '2024-2025', '2', 'SCT', 'Student', '2301-000028', '', 'lewisms@gmail.com', '09575947648', '2025-06-25'),
(29, '../assets/User-placeholder.png', '6842572454', '2301-000029', 'Thomas', 'John', 'Cantrell', 23, '2001-10-30', 'BS Criminology', '3', '2024-2025', '2', 'SIHTM', 'Student', '2301-000029', '', 'cantrelltj@gmail.com', '09218644211', '2025-06-25'),
(30, '../assets/User-placeholder.png', '0235789652', '2301-000030', 'Jacob', 'Gabriela', 'Ali', 18, '2007-04-15', 'BS Midwifery', '2', '2024-2025', '2', 'SNAHS', 'Student', '2301-000030', '', 'alijg@gmail.com', '09445469218', '2025-06-25'),
(31, '../assets/User-placeholder.png', '5773402493', '2301-000031', 'John', 'Gloria', 'Garcia', 23, '2002-06-23', 'BS Tourism Management', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000031', '', 'garciajg@gmail.com', '09336503640', '2025-06-25'),
(32, '../assets/User-placeholder.png', '3254896950', '2301-000032', 'Jerry', 'Ethan', 'Mcdonald', 23, '2002-06-07', 'AB Psychology', '1', '2024-2025', '2', 'SBAT', 'Student', '2301-000032', '', 'mcdonaldje@gmail.com', '09971295408', '2025-06-25'),
(33, '../assets/User-placeholder.png', '9636416617', '2301-000033', 'Kenneth', 'Cynthia', 'Dickson', 22, '2003-06-01', 'BS Medical Technology', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000033', '', 'dicksonkc@gmail.com', '09861020398', '2025-06-25'),
(34, '../assets/User-placeholder.png', '9186764301', '2301-000034', 'Henry', 'Patrick', 'Lopez', 18, '2006-12-30', 'BS Ed', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000034', '', 'lopezhp@gmail.com', '09322521704', '2025-06-25'),
(35, '../assets/User-placeholder.png', '0609528365', '2301-000035', 'Matthew', 'Juan', 'Boyd', 21, '2004-02-03', 'BSed', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000035', '', 'boydmj@gmail.com', '09644882411', '2025-06-25'),
(36, '../assets/User-placeholder.png', '6114377163', '2301-000036', 'Carlos', 'Jeremy', 'Schultz', 22, '2003-01-19', 'BS Civil Engineering', '3', '2024-2025', '2', 'SIHTM', 'Student', '2301-000036', '', 'schultzcj@gmail.com', '09891583961', '2025-06-25'),
(37, '../assets/User-placeholder.png', '0665294923', '2301-000037', 'Mark', 'Timothy', 'Mccullough', 21, '2003-06-24', 'BS Civil Engineering', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000037', '', 'mcculloughmt@gmail.com', '09985554550', '2025-06-25'),
(38, '../assets/User-placeholder.png', '7794114660', '2301-000038', 'Joseph', 'Kaitlyn', 'Williams', 22, '2003-01-16', 'BS Physical Therapy', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000038', '', 'williamsjk@gmail.com', '09452047845', '2025-06-25'),
(39, '../assets/User-placeholder.png', '3589805238', '2301-000039', 'Christopher', 'Marcus', 'Ellis', 18, '2006-07-22', 'AB Psychology', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000039', '', 'elliscm@gmail.com', '09922815167', '2025-06-25'),
(40, '../assets/User-placeholder.png', '5962027009', '2301-000040', 'Chad', 'Jennifer', 'Bolton', 17, '2007-07-31', 'BS Accountancy', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000040', '', 'boltoncj@gmail.com', '09188057289', '2025-06-25'),
(41, '../assets/User-placeholder.png', '3868375121', '2301-000041', 'Andre', 'Natalie', 'Watkins', 18, '2007-04-27', 'BS Hospitality Management', '1', '2024-2025', '2', 'SCT', 'Student', '2301-000041', '', 'watkinsan@gmail.com', '09781061770', '2025-06-25'),
(42, '../assets/User-placeholder.png', '7234447712', '2301-000042', 'Mark', 'Tommy', 'Good', 18, '2007-06-04', 'BS Nursing', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000042', '', 'goodmt@gmail.com', '09700859987', '2025-06-25'),
(43, '../assets/User-placeholder.png', '3612076691', '2301-000043', 'Johnny', 'Kimberly', 'Mueller', 22, '2003-03-03', 'BS Accountancy', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000043', '', 'muellerjk@gmail.com', '09269523920', '2025-06-25'),
(44, '../assets/User-placeholder.png', '9346739929', '2301-000044', 'Sergio', 'Chase', 'Diaz', 20, '2004-08-11', 'BS Management Accounting', '3', '2024-2025', '2', 'SNAHS', 'Student', '2301-000044', '', 'diazsc@gmail.com', '09484356105', '2025-06-25'),
(45, '../assets/User-placeholder.png', '3203039157', '2301-000045', 'Timothy', 'Philip', 'Lee', 17, '2007-12-26', 'BS Industrial Engineering', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000045', '', 'leetp@gmail.com', '09527965510', '2025-06-25'),
(46, '../assets/User-placeholder.png', '7962198216', '2301-000046', 'Andrew', 'Erik', 'Garcia', 18, '2006-08-12', 'AB Psychology', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000046', '', 'garciaae@gmail.com', '09123431119', '2025-06-25'),
(47, '../assets/User-placeholder.png', '4711633140', '2301-000047', 'Matthew', 'Ashlee', 'Johnson', 17, '2007-12-13', 'BSed', '1', '2024-2025', '2', 'SCT', 'Student', '2301-000047', '', 'johnsonma@gmail.com', '09388088032', '2025-06-25'),
(48, '../assets/User-placeholder.png', '8682641869', '2301-000048', 'Jeffrey', 'William', 'Hill', 17, '2008-04-05', 'BS Criminology', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000048', '', 'hilljw@gmail.com', '09754457464', '2025-06-25'),
(49, '../assets/User-placeholder.png', '3151159566', '2301-000049', 'Carl', 'Shannon', 'Allen', 20, '2004-07-05', 'BS Nursing', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000049', '', 'allencs@gmail.com', '09770858782', '2025-06-25'),
(50, '../assets/User-placeholder.png', '1028694034', '2301-000050', 'Caleb', 'Charles', 'Burton', 17, '2008-06-01', 'AB Psychology', '2', '2024-2025', '2', 'SCT', 'Student', '2301-000050', '', 'burtoncc@gmail.com', '09754080395', '2025-06-25'),
(51, '../assets/User-placeholder.png', '2281768002', '2301-000051', 'William', 'Gina', 'Silva', 18, '2006-07-02', 'AB Comm', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000051', '', 'silvawg@gmail.com', '09147778558', '2025-06-25'),
(52, '../assets/User-placeholder.png', '1375789150', '2301-000052', 'Raymond', 'Zachary', 'Patton', 18, '2007-01-07', 'AB Comm', '2', '2024-2025', '2', 'SCT', 'Student', '2301-000052', '', 'pattonrz@gmail.com', '09464923227', '2025-06-25'),
(53, '../assets/User-placeholder.png', '6002728077', '2301-000053', 'Sean', 'Amanda', 'Gutierrez', 19, '2006-03-26', 'BS Physical Therapy', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000053', '', 'gutierrezsa@gmail.com', '09751647690', '2025-06-25'),
(54, '../assets/User-placeholder.png', '0955006948', '2301-000054', 'Michael', 'Margaret', 'Martinez', 19, '2005-11-08', 'BS Ed', '4', '2024-2025', '2', 'SNAHS', 'Student', '2301-000054', '', 'martinezmm@gmail.com', '09248342495', '2025-06-25'),
(55, '../assets/User-placeholder.png', '2395947705', '2301-000055', 'Dustin', 'Jeremy', 'Roberts', 23, '2001-07-11', 'BS Physical Therapy', '4', '2024-2025', '2', 'SIHTM', 'Student', '2301-000055', '', 'robertsdj@gmail.com', '09485976386', '2025-06-25'),
(56, '../assets/User-placeholder.png', '6208002310', '2301-000056', 'Brandon', 'Melissa', 'Medina', 20, '2004-09-29', 'Dentistry', '2', '2024-2025', '2', 'SCT', 'Student', '2301-000056', '', 'medinabm@gmail.com', '09427722081', '2025-06-25'),
(57, '../assets/User-placeholder.png', '9414003687', '2301-000057', 'Jeremy', 'Elizabeth', 'Griffith', 19, '2006-04-16', 'BS Accountancy', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000057', '', 'griffithje@gmail.com', '09190886073', '2025-06-25'),
(58, '../assets/User-placeholder.png', '2684875885', '2301-000058', 'Thomas', 'James', 'Myers', 18, '2006-10-07', 'BS Management Accounting', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000058', '', 'myerstj@gmail.com', '09247012368', '2025-06-25'),
(59, '../assets/User-placeholder.png', '9216848690', '2301-000059', 'Matthew', 'Angela', 'Smith', 21, '2003-07-12', 'BS Hospitality Management', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000059', '', 'smithma@gmail.com', '09764847960', '2025-06-25'),
(60, '../assets/User-placeholder.png', '9534766961', '2301-000060', 'Jeffrey', 'James', 'Ochoa', 18, '2007-01-23', 'BS Ed', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000060', '', 'ochoajj@gmail.com', '09799864260', '2025-06-25'),
(61, '../assets/User-placeholder.png', '2685901776', '2301-000061', 'Brian', 'Caroline', 'Palmer', 22, '2002-07-22', 'BS Criminology', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000061', '', 'palmerbc@gmail.com', '09331209048', '2025-06-25'),
(62, '../assets/User-placeholder.png', '3476712991', '2301-000062', 'Andrew', 'Andrew', 'Riggs', 18, '2007-06-02', 'BS Nursing', '1', '2024-2025', '2', 'SASH', 'Student', '2301-000062', '', 'riggsaa@gmail.com', '09913681231', '2025-06-25'),
(63, '../assets/User-placeholder.png', '0944153779', '2301-000063', 'John', 'Leslie', 'Ho', 21, '2004-04-15', 'BS Management Accounting', '3', '2024-2025', '2', 'SBAT', 'Student', '2301-000063', '', 'hojl@gmail.com', '09672549056', '2025-06-25'),
(64, '../assets/User-placeholder.png', '5446928592', '2301-000064', 'Mark', 'Brian', 'Little', 23, '2001-07-08', 'BS Information Technology', '1', '2024-2025', '2', 'SCT', 'Student', '2301-000064', '', 'littlemb@gmail.com', '09683830742', '2025-06-25'),
(65, '../assets/User-placeholder.png', '5736894851', '2301-000065', 'Joseph', 'Mark', 'Brown', 21, '2003-09-10', 'BS Management Accounting', '4', '2024-2025', '2', 'SCT', 'Student', '2301-000065', '', 'brownjm@gmail.com', '09509064513', '2025-06-25'),
(66, '../assets/User-placeholder.png', '8826902960', '2301-000066', 'Joshua', 'Jaclyn', 'Hoover', 19, '2006-06-16', 'BS Criminology', '4', '2024-2025', '2', 'SNAHS', 'Student', '2301-000066', '', 'hooverjj@gmail.com', '09707322020', '2025-06-25'),
(67, '../assets/User-placeholder.png', '3479374045', '2301-000067', 'Andrew', 'Troy', 'Mata', 18, '2007-06-07', 'BS Civil Engineering', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000067', '', 'mataat@gmail.com', '09499813864', '2025-06-25'),
(68, '../assets/User-placeholder.png', '6523703685', '2301-000068', 'Francis', 'Brian', 'Young', 21, '2003-07-01', 'BSed', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000068', '', 'youngfb@gmail.com', '09683346983', '2025-06-25'),
(69, '../assets/User-placeholder.png', '0602952800', '2301-000069', 'Mike', 'Shannon', 'Clark', 20, '2005-05-18', 'BS Criminology', '3', '2024-2025', '2', 'SNAHS', 'Student', '2301-000069', '', 'clarkms@gmail.com', '09113497594', '2025-06-25'),
(70, '../assets/User-placeholder.png', '6302960875', '2301-000070', 'Phillip', 'Jennifer', 'Andrews', 20, '2005-04-16', 'BS Civil Engineering', '4', '2024-2025', '2', 'SBAT', 'Student', '2301-000070', '', 'andrewspj@gmail.com', '09100335319', '2025-06-25'),
(71, '../assets/User-placeholder.png', '3519731963', '2301-000071', 'Brian', 'Cindy', 'Schultz', 18, '2006-07-01', 'BS Midwifery', '4', '2024-2025', '2', 'SNAHS', 'Student', '2301-000071', '', 'schultzbc@gmail.com', '09654206290', '2025-06-25'),
(72, '../assets/User-placeholder.png', '1804965787', '2301-000072', 'Bryan', 'Eric', 'Smith', 17, '2007-10-14', 'BS Nursing', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000072', '', 'smithbe@gmail.com', '09815588084', '2025-06-25'),
(73, '../assets/User-placeholder.png', '9781159838', '2301-000073', 'Johnny', 'Drew', 'Dunn', 17, '2007-07-30', 'BS Medical Technology', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000073', '', 'dunnjd@gmail.com', '09660391873', '2025-06-25'),
(74, '../assets/User-placeholder.png', '7215653234', '2301-000074', 'Mark', 'Zachary', 'Johnson', 19, '2006-05-15', 'BS Industrial Engineering', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000074', '', 'johnsonmz@gmail.com', '09150880456', '2025-06-25'),
(75, '../assets/User-placeholder.png', '0014620776', '2301-000075', 'Martin', 'Brian', 'Jones', 21, '2004-04-21', 'BS Ed', '1', '2024-2025', '2', 'SASH', 'Student', '2301-000075', '', 'jonesmb@gmail.com', '09870430507', '2025-06-25'),
(76, '../assets/User-placeholder.png', '9936384967', '2301-000076', 'Nicholas', 'Brianna', 'Smith', 18, '2006-12-20', 'BS Civil Engineering', '3', '2024-2025', '2', 'SCT', 'Student', '2301-000076', '', 'smithnb@gmail.com', '09753998837', '2025-06-25'),
(77, '../assets/User-placeholder.png', '0292627358', '2301-000077', 'Steven', 'Sarah', 'Young', 19, '2006-02-02', 'BS Accountancy', '4', '2024-2025', '2', 'SIHTM', 'Student', '2301-000077', '', 'youngss@gmail.com', '09510616455', '2025-06-25'),
(78, '../assets/User-placeholder.png', '9594356367', '2301-000078', 'Shaun', 'Katrina', 'Sosa', 22, '2003-02-22', 'BS Business Administration', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000078', '', 'sosask@gmail.com', '09621420524', '2025-06-25'),
(79, '../assets/User-placeholder.png', '2987297658', '2301-000079', 'Brendan', 'Mark', 'Brown', 22, '2003-04-11', 'BS Medical Technology', '2', '2024-2025', '2', 'SNAHS', 'Student', '2301-000079', '', 'brownbm@gmail.com', '09500997772', '2025-06-25'),
(80, '../assets/User-placeholder.png', '0061380194', '2301-000080', 'Kenneth', 'Jeff', 'Hood', 18, '2006-08-24', 'BS Nursing', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000080', '', 'hoodkj@gmail.com', '09703938243', '2025-06-25'),
(81, '../assets/User-placeholder.png', '9289251715', '2301-000081', 'Johnny', 'Amy', 'Ochoa', 17, '2007-06-30', 'AB Psychology', '4', '2024-2025', '2', 'SNAHS', 'Student', '2301-000081', '', 'ochoaja@gmail.com', '09943918368', '2025-06-25'),
(82, '../assets/User-placeholder.png', '5111608127', '2301-000082', 'Joseph', 'Mark', 'Garcia', 17, '2007-11-26', 'BS Civil Engineering', '1', '2024-2025', '2', 'SCT', 'Student', '2301-000082', '', 'garciajm@gmail.com', '09627596123', '2025-06-25'),
(83, '../assets/User-placeholder.png', '1753819509', '2301-000083', 'Nicholas', 'Lynn', 'Hughes', 18, '2007-04-02', 'BS Physical Therapy', '4', '2024-2025', '2', 'SIHTM', 'Student', '2301-000083', '', 'hughesnl@gmail.com', '09308515339', '2025-06-25'),
(84, '../assets/User-placeholder.png', '2084442226', '2301-000084', 'Matthew', 'Michael', 'Evans', 19, '2006-04-05', 'AB Comm', '2', '2024-2025', '2', 'SASH', 'Student', '2301-000084', '', 'evansmm@gmail.com', '09963885897', '2025-06-25'),
(85, '../assets/User-placeholder.png', '2364564960', '2301-000085', 'Daniel', 'James', 'Caldwell', 22, '2002-09-05', 'BS Management Accounting', '4', '2024-2025', '2', 'SNAHS', 'Student', '2301-000085', '', 'caldwelldj@gmail.com', '09664897129', '2025-06-25'),
(86, '../assets/User-placeholder.png', '1449021942', '2301-000086', 'David', 'Sandra', 'Howell', 17, '2008-06-07', 'BS Criminology', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000086', '', 'howellds@gmail.com', '09104224790', '2025-06-25'),
(87, '../assets/User-placeholder.png', '7874436667', '2301-000087', 'Jason', 'Matthew', 'King', 22, '2002-06-26', 'BS Hospitality Management', '4', '2024-2025', '2', 'SCT', 'Student', '2301-000087', '', 'kingjm@gmail.com', '09129041316', '2025-06-25'),
(88, '../assets/User-placeholder.png', '5395778608', '2301-000088', 'Jacob', 'Jessica', 'Simpson', 18, '2007-06-20', 'TESDA Programs', '3', '2024-2025', '2', 'SIHTM', 'Student', '2301-000088', '', 'simpsonjj@gmail.com', '09650990284', '2025-06-25'),
(89, '../assets/User-placeholder.png', '6516733306', '2301-000089', 'Timothy', 'Brian', 'Grant', 23, '2002-03-07', 'BS Nursing', '1', '2024-2025', '2', 'SASH', 'Student', '2301-000089', '', 'granttb@gmail.com', '09227317330', '2025-06-25'),
(90, '../assets/User-placeholder.png', '1103142385', '2301-000090', 'Brian', 'Tracy', 'Turner', 23, '2002-03-02', 'BS Business Administration', '1', '2024-2025', '2', 'SNAHS', 'Student', '2301-000090', '', 'turnerbt@gmail.com', '09854944883', '2025-06-25'),
(91, '../assets/User-placeholder.png', '8518216499', '2301-000091', 'Raymond', 'Lauren', 'Gonzales', 22, '2003-06-08', 'BS Tourism Management', '3', '2024-2025', '2', 'SNAHS', 'Student', '2301-000091', '', 'gonzalesrl@gmail.com', '09777126771', '2025-06-25'),
(92, '../assets/User-placeholder.png', '2878444551', '2301-000092', 'Kevin', 'April', 'Wiley', 18, '2006-07-30', 'BS Management Accounting', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000092', '', 'wileyka@gmail.com', '09700587352', '2025-06-25'),
(93, '../assets/User-placeholder.png', '8196288135', '2301-000093', 'Mark', 'Michael', 'Kemp', 22, '2003-03-11', 'AB Comm', '3', '2024-2025', '2', 'SASH', 'Student', '2301-000093', '', 'kempmm@gmail.com', '09203419885', '2025-06-25'),
(94, '../assets/User-placeholder.png', '4506337750', '2301-000094', 'James', 'Travis', 'Barnes', 18, '2006-12-22', 'TESDA Programs', '1', '2024-2025', '2', 'SIHTM', 'Student', '2301-000094', '', 'barnesjt@gmail.com', '09663560817', '2025-06-25'),
(95, '../assets/User-placeholder.png', '6263292476', '2301-000095', 'William', 'Lori', 'Jackson', 23, '2002-06-09', 'Dentistry', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000095', '', 'jacksonwl@gmail.com', '09543078669', '2025-06-25'),
(96, '../assets/User-placeholder.png', '5748266384', '2301-000096', 'Christopher', 'Elizabeth', 'Anderson', 19, '2005-07-01', 'BS Tourism Management', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000096', '', 'andersonce@gmail.com', '09664590996', '2025-06-25'),
(97, '../assets/User-placeholder.png', '8141022152', '2301-000097', 'Daniel', 'Kelsey', 'Cross', 18, '2006-12-14', 'BS Midwifery', '2', '2024-2025', '2', 'SBAT', 'Student', '2301-000097', '', 'crossdk@gmail.com', '09537975228', '2025-06-25'),
(98, '../assets/User-placeholder.png', '8011418451', '2301-000098', 'Luke', 'Stephen', 'Wilson', 17, '2007-09-21', 'BS Nursing', '1', '2024-2025', '2', 'SASH', 'Student', '2301-000098', '', 'wilsonls@gmail.com', '09273878283', '2025-06-25'),
(99, '../assets/User-placeholder.png', '4289062723', '2301-000099', 'Shawn', 'Tyler', 'Bennett', 21, '2004-03-29', 'BS Criminology', '2', '2024-2025', '2', 'SIHTM', 'Student', '2301-000099', '', 'bennettst@gmail.com', '09911601557', '2025-06-25'),
(100, '../assets/User-placeholder.png', '2320522412', '2301-000100', 'Jordan', 'Amy', 'Brown', 21, '2004-02-27', 'AB Psychology', '4', '2024-2025', '2', 'SASH', 'Student', '2301-000100', '', 'brownja@gmail.com', '09333944945', '2025-06-25'),
(101, '../assets/User-placeholder.png', 'E6LP2P784E', '2302-000001', 'John', 'Mary', 'White', 17, '2007-12-19', 'undefined', 'undefined', '2024-2025', '2', 'SNAHS', 'Employee', '2302-000001', '$2y$12$bkxWixYQmRkUMGTiSWqxZ.jqLSVf916CzKJ1KFJCPqo5CmMD4fTza', 'whitejm@gmail.com', 'undefined', '2025-06-25'),
(102, '../assets/User-placeholder.png', 'EEE8YME404', '2302-000002', 'Hector', 'Rachel', 'Bentley', 17, '2008-03-06', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000002', '', 'bentleyhr@gmail.com', '09390407600', '2025-06-25'),
(103, '../assets/User-placeholder.png', 'E7E05EE967', '2302-000003', 'John', 'Olivia', 'Boone', 21, '2003-09-27', NULL, NULL, '2024-2025', '2', 'SASH', 'Employee', '2302-000003', '', 'boonejo@gmail.com', '09584069369', '2025-06-25'),
(104, '../assets/User-placeholder.png', 'YEE71007Y2', '2302-000004', 'Jesse', 'Stacy', 'Santiago', 23, '2001-08-05', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000004', '', 'santiagojs@gmail.com', '09104057464', '2025-06-25'),
(105, '../assets/User-placeholder.png', 'E68P6EP629', '2302-000005', 'Adam', 'Tina', 'Sims', 18, '2006-09-21', NULL, NULL, '2024-2025', '2', 'SASH', 'Employee', '2302-000005', '', 'simsat@gmail.com', '09318581938', '2025-06-25'),
(106, '../assets/User-placeholder.png', 'ML19E5297O', '2302-000006', 'Charles', 'Melissa', 'Daniels', 23, '2001-07-03', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000006', '', 'danielscm@gmail.com', '09975212698', '2025-06-25'),
(107, '../assets/User-placeholder.png', 'OE004PLP5O', '2302-000007', 'William', 'Allen', 'Larson', 22, '2003-04-01', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000007', '', 'larsonwa@gmail.com', '09249293887', '2025-06-25'),
(108, '../assets/User-placeholder.png', '11PEOM09ME', '2302-000008', 'Charles', 'Nicholas', 'Smith', 23, '2001-12-28', NULL, NULL, '2024-2025', '2', 'SNAHS', 'Employee', '2302-000008', '', 'smithcn@gmail.com', '09351770915', '2025-06-25'),
(109, '../assets/User-placeholder.png', '4YP5MEL72L', '2302-000009', 'Kyle', 'Melinda', 'Anderson', 22, '2002-09-26', NULL, NULL, '2024-2025', '2', 'SCT', 'Employee', '2302-000009', '', 'andersonkm@gmail.com', '09839804047', '2025-06-25'),
(110, '../assets/User-placeholder.png', '5E5Y73EE62', '2302-000010', 'Brian', 'Brian', 'Morales', 22, '2002-09-26', NULL, NULL, '2024-2025', '2', 'SNAHS', 'Employee', '2302-000010', '', 'moralesbb@gmail.com', '09335829947', '2025-06-25'),
(111, '../assets/User-placeholder.png', 'EEL48M3EEP', '2302-000011', 'Nathan', 'Kelly', 'Wilson', 17, '2007-07-01', NULL, NULL, '2024-2025', '2', 'SCT', 'Employee', '2302-000011', '', 'wilsonnk@gmail.com', '09510326346', '2025-06-25'),
(112, '../assets/User-placeholder.png', '1168089513', '2302-000012', 'Samuel', 'Jennifer', 'Brown', 22, '2003-01-11', NULL, NULL, '2024-2025', '2', 'SNAHS', 'Employee', '2302-000012', '', 'brownsj@gmail.com', '09889472715', '2025-06-25'),
(113, '../assets/User-placeholder.png', 'Y67O4L56M6', '2302-000013', 'Brian', 'Roy', 'Bailey', 23, '2001-09-26', NULL, NULL, '2024-2025', '2', 'SNAHS', 'Employee', '2302-000013', '', 'baileybr@gmail.com', '09761596091', '2025-06-25'),
(114, '../assets/User-placeholder.png', '39EL540YEE', '2302-000014', 'Paul', 'Jason', 'Green', 18, '2007-01-01', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000014', '', 'greenpj@gmail.com', '09118961239', '2025-06-25'),
(115, '../assets/User-placeholder.png', '366EEO42Y8', '2302-000015', 'Alexander', 'Joshua', 'Schneider', 17, '2008-01-22', NULL, NULL, '2024-2025', '2', 'SIHTM', 'Employee', '2302-000015', '', 'schneideraj@gmail.com', '09109644086', '2025-06-25'),
(116, '../assets/User-placeholder.png', '81E8LE52E8', '2302-000016', 'Daniel', 'Patricia', 'Mcgee', 17, '2007-07-10', NULL, NULL, '2024-2025', '2', 'SBAT', 'Employee', '2302-000016', '', 'mcgeedp@gmail.com', '09434994452', '2025-06-25'),
(117, '../assets/User-placeholder.png', 'P4EEPL798P', '2302-000017', 'Edward', 'Danielle', 'Gonzalez', 17, '2008-02-01', NULL, NULL, '2024-2025', '2', 'SCT', 'Employee', '2302-000017', '', 'gonzalezed@gmail.com', '09660924097', '2025-06-25'),
(118, '../assets/User-placeholder.png', '9EEY9344LE', '2302-000018', 'Anthony', 'James', 'Pennington', 22, '2002-07-14', NULL, NULL, '2024-2025', '2', 'SASH', 'Employee', '2302-000018', '', 'penningtonaj@gmail.com', '09216591367', '2025-06-25'),
(119, '../assets/User-placeholder.png', 'EEY7M18L5E', '2302-000019', 'Thomas', 'Corey', 'Bennett', 18, '2007-05-20', NULL, NULL, '2024-2025', '2', 'SIHTM', 'Employee', '2302-000019', '', 'bennetttc@gmail.com', '09701676600', '2025-06-25'),
(121, '../assets/User-placeholder.png', '0991782287', '2301-000512', 'John Gregg', 'Virina', 'Felicisimo', 25, '2000-06-13', 'BS Information Technology', '3', '2024-2025', '2', 'SBAT', 'Admin', '2301-000512', '$2y$12$C.jufDM1/Fb8XsFc9Bc1p.wRp1/vVvwn8no8COYUCPqTim9ESQdse', 'felicisimojv@gmail.com', '09917822877', '2025-06-25'),
(122, '../assets/Users/2303-000512/68513408d98d4.jpg', '1234567890', '2303-000512', 'Mark', 'Jovan', 'Cananca', 22, '2002-05-07', 'BS Information Technology', '4', '2024-2025', '2', 'SBAT', 'Student', '2303-000512', '$2y$12$ij73x66qi/09qo1HgTFOw.YAPkDRR/GdZjvj79w4aYciMEn.Yt82a', 'markjovie@gmail.com', NULL, '2025-06-25');

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
  ADD PRIMARY KEY (`course_id`);

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
  ADD UNIQUE KEY `rfid_code` (`rfid_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_rfid_code` FOREIGN KEY (`rfid_code`) REFERENCES `users` (`rfid_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
