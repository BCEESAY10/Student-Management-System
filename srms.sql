-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 01:19 PM
-- Server version: 8.0.39
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `Admin_Username` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `Admin_Password` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`Admin_Username`, `Admin_Password`) VALUES
('myadmin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Dep_Id` varchar(10) NOT NULL,
  `Course_Id` varchar(10) NOT NULL,
  `Course_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Dep_Id`, `Course_Id`, `Course_Name`) VALUES
('DEP103', 'HUM100', 'Civic Education'),
('DEP103', 'HUM101', 'Introduction to Gender'),
('DEP103', 'HUM102', 'Religious Studies'),
('DEP100', 'LAN100', 'English Language'),
('DEP100', 'LAN101', 'French Language'),
('DEP100', 'LAN102', 'Arabic Language'),
('DEP101', 'MTH100', 'Mathematics'),
('DEP101', 'MTH101', 'Further Mathematics'),
('DEP101', 'MTH102', 'Statistics and Probability'),
('DEP101', 'MTH103', 'Calculus'),
('DEP102', 'SCI100', 'General Science'),
('DEP102', 'SCI101', 'General ICT'),
('DEP102', 'SCI102', 'Introduction to Graphic Design'),
('DEP102', 'SCI103', 'Introduction to Programming'),
('DEP104', 'VOC100', 'Home Economics');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_Id` varchar(10) NOT NULL,
  `Department_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Department_Id`, `Department_Name`) VALUES
('DEP100', 'Language'),
('DEP101', 'Mathematics'),
('DEP102', 'Science and Technology'),
('DEP103', 'Humanities'),
('DEP104', 'Vocational');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `std_id` varchar(10) NOT NULL,
  `dep` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL,
  `s_id` int NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `mark` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `S_Id` varchar(10) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phno` int NOT NULL,
  `Dob` date NOT NULL,
  `Dep` varchar(100) NOT NULL,
  `Cid` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`S_Id`, `Fname`, `Lname`, `Email`, `Phno`, `Dob`, `Dep`, `Cid`, `Gender`) VALUES
('BC100', 'Bamfa', 'Ceesay', 'bamfaceesay30@gmail.com', 7109836, '2000-11-30', 'DEP101', 'LAN100', 'male'),
('BC101', 'Muhammed', 'Nget', 'mnget@gmail.com', 3273232, '2000-05-19', 'DEP101', 'LAN100', 'male'),
('BC102', 'Ramou', 'Sowe', 'ramou@gmail.com', 2235467, '2001-02-05', 'DEP101', 'LAN100', 'female'),
('BC104', 'Binta', 'Jaiteh', 'bintajaiteh@gmail.com', 3336764, '1998-08-10', 'DEP101', 'MTH101', 'female'),
('BC105', 'Sunkari', 'Sanneh', 'sunkari@gmail.com', 2336559, '2001-08-05', 'DEP102', 'MTH102', 'female'),
('BC106', 'Bucarr', 'Ceesay', 'bucarrceesay@gmail.com', 4678923, '1999-05-10', 'DEP102', 'MTH102', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Dep` varchar(10) NOT NULL,
  `C_Id` varchar(10) NOT NULL,
  `Subject_Id` int NOT NULL,
  `Subject_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`Admin_Username`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_Id`),
  ADD KEY `Dep_Id` (`Dep_Id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_Id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD KEY `cid` (`cid`),
  ADD KEY `dep` (`dep`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`S_Id`),
  ADD KEY `Dep` (`Dep`),
  ADD KEY `Cid` (`Cid`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Subject_Id`),
  ADD KEY `Dep` (`Dep`),
  ADD KEY `C_Id` (`C_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Dep_Id`) REFERENCES `department` (`Department_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `courses` (`Course_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`dep`) REFERENCES `department` (`Department_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_3` FOREIGN KEY (`std_id`) REFERENCES `student` (`S_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_4` FOREIGN KEY (`s_id`) REFERENCES `subjects` (`Subject_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dep`) REFERENCES `department` (`Department_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Cid`) REFERENCES `courses` (`Course_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`Dep`) REFERENCES `department` (`Department_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`C_Id`) REFERENCES `courses` (`Course_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
