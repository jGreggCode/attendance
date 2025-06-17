SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `saclitms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `saclitms`;

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `rfid_code` varchar(50) NOT NULL,
  `user_type` enum('Student','Employee','Admin','') DEFAULT NULL,
  `date` date NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `Status` varchar(255) NOT NULL DEFAULT 'Normal',
  `Reason` text NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `courses` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_name_shorten` varchar(100) DEFAULT NULL,
  `course_ini` varchar(10) DEFAULT NULL,
  `course_department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `department` (
  `department_id` varchar(255) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `department_ini` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `department` (`department_id`, `department_name`, `department_ini`) VALUES
('SBAT-2018', 'School Of Business, Accounting and Technology', 'SBAT');

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
  `phone_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rfid_code` (`rfid_code`);


ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
