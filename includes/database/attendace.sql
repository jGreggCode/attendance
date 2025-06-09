-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 03:25 AM
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
-- Database: `attendace`
--
CREATE DATABASE IF NOT EXISTS `attendace` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `attendace`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `rfid_code` varchar(50) NOT NULL,
  `user_type` enum('Student','Employee') DEFAULT NULL,
  `date` date NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `rfid_code`, `user_type`, `date`, `time_in`, `time_out`) VALUES
(5, '0991782287', 'Student', '2025-05-30', '20:58:37', '20:58:50'),
(6, '0991782281', 'Student', '2025-05-30', '21:46:14', '21:46:19'),
(7, '0991782287', 'Student', '2025-05-31', '06:20:42', '06:20:48'),
(8, '0991782281', 'Student', '2025-05-31', '07:33:54', '07:56:12'),
(9, '0991782287', 'Student', '2025-06-01', '07:46:41', '07:46:57'),
(10, '0991782289', 'Student', '2025-06-01', '12:12:15', '12:13:37'),
(11, '0991782282', 'Student', '2025-06-01', '12:48:02', '12:48:04'),
(12, '1234567890', 'Student', '2025-06-01', '17:30:46', '17:31:20'),
(13, '0991782287', '', '2025-06-02', '03:17:58', '03:18:11');

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
('BEED-2019', 'Bachelor Of Elementary Education', NULL, 'BSed', NULL),
('BSA-2018', 'Bachelor Of Science In Accountancy', 'BS Accountancy', 'BSA', NULL),
('BSBA-2020', 'Bachelor Of Science In Business Administration', 'BS Business Administration', 'BSBA', NULL),
('BSCE-2022', 'Bachelor Of Science In Civil Engineering', 'BS Civil Engineering', 'BSCE', NULL),
('BSCRIM-2015', 'Bachelor Of Science In Criminology', 'BS Criminology', 'BS Crim', NULL),
('BSED-2020', 'Bachelor Of Secondary Education', NULL, 'BSEd', NULL),
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
  `department` varchar(100) DEFAULT NULL,
  `user_type` enum('Admin','Employee','Student','') DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_photo`, `rfid_code`, `user_id`, `first_name`, `middle_name`, `last_name`, `age`, `birthday`, `course`, `year_level`, `department`, `user_type`, `username`, `password`, `email`) VALUES
(2, '../assets/Users/Eunice/eunice.jpg', '0991782281', '', 'Eunice', 'Mancenido', 'Amponin', 22, '2002-10-22', 'BS Pyschology', 'IV', 'DepStore', 'Student', NULL, NULL, NULL),
(10, '../assets/Users/2301-000554/683bdb62473c2.png', '0991782282', '2301-000554', 'Mark', 'Jovan', 'Cananca', 22, '2003-02-03', 'BS Information Technology', '3', 'SBAT', 'Student', '', '$2y$12$p9Ck/D8OlolnpbeP7MkAge1dvwjckoEGlOzI2ERgustlx1dsV3yYW', 'markjovans@gmail.com'),
(11, '../assets/Users/2301-123456/683be8fca6acf.png', '1234567890', '2301-123456', 'Mike', 'Jane', 'Loren', 21, '2025-06-17', 'TESDA Programs', '1', 'TESDA', 'Student', '', NULL, 'mike@gmail.com'),
(12, '../assets/Users/2301-000512/683bfbf21d4d5.png', '0991782287', '2301-000512', 'John Gregg', 'Virina', 'Felicisimo', 23, '2001-06-13', 'BS Information Technology', '3', 'SBAT', 'Admin', '2301-000512', '$2y$12$lJf0ZxEeWDFrFxr8FJQvKespinflpZcK3cywAjAtQ9a3Chp9lYss6', 'felicisimojv@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
