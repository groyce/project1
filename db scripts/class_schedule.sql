-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:54 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `class_schedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE IF NOT EXISTS `Course` (
  `CourseID` varchar(8) NOT NULL,
  `CourseName` varchar(15) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseID`, `CourseName`) VALUES
('ISM 3112', 'Syst Design'),
('ISM 3113', 'Syst Analysis'),
('ISM 4212', 'Database'),
('ISM 4930', 'Networking');

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE IF NOT EXISTS `Faculty` (
  `FacultyID` int(11) NOT NULL,
  `FacultyName` varchar(25) NOT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Faculty`
--

INSERT INTO `Faculty` (`FacultyID`, `FacultyName`) VALUES
(2143, 'Birkin'),
(3467, 'Berndt'),
(4756, 'Collins');

-- --------------------------------------------------------

--
-- Table structure for table `Qualified`
--

CREATE TABLE IF NOT EXISTS `Qualified` (
  `FacultyID` int(11) NOT NULL,
  `CourseID` varchar(8) NOT NULL,
  `DateQualified` date NOT NULL,
  PRIMARY KEY (`FacultyID`,`CourseID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Qualified`
--

INSERT INTO `Qualified` (`FacultyID`, `CourseID`, `DateQualified`) VALUES
(2143, 'ISM 3112', '1988-01-09'),
(2143, 'ISM 3113', '1988-01-09'),
(3467, 'ISM 4212', '1995-01-09'),
(3467, 'ISM 4930', '1996-01-09'),
(4756, 'ISM 3112', '1991-01-09'),
(4756, 'ISM 3113', '1991-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `Registration`
--

CREATE TABLE IF NOT EXISTS `Registration` (
  `StudentID` int(11) NOT NULL,
  `SectionNo` int(11) NOT NULL,
  `Semester` varchar(7) NOT NULL,
  PRIMARY KEY (`StudentID`,`SectionNo`,`Semester`),
  KEY `SectionNo` (`SectionNo`),
  KEY `Semester` (`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Registration`
--

INSERT INTO `Registration` (`StudentID`, `SectionNo`, `Semester`) VALUES
(66324, 2713, '1-2008'),
(38214, 2714, '1-2008'),
(54907, 2714, '1-2008'),
(54907, 2715, '1-2008');

-- --------------------------------------------------------

--
-- Table structure for table `Section`
--

CREATE TABLE IF NOT EXISTS `Section` (
  `SectionNo` int(11) NOT NULL,
  `Semester` varchar(7) NOT NULL,
  `CourseID` varchar(8) NOT NULL,
  PRIMARY KEY (`SectionNo`,`Semester`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  KEY `Semester` (`Semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Section`
--

INSERT INTO `Section` (`SectionNo`, `Semester`, `CourseID`) VALUES
(2712, '1-2008', 'ISM 3113'),
(2713, '1-2008', 'ISM 3113'),
(2714, '1-2008', 'ISM 4212'),
(2715, '1-2008', 'ISM 4930');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `StudentID` int(11) NOT NULL,
  `StudentName` varchar(25) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`StudentID`, `StudentName`) VALUES
(38214, 'Letersky'),
(54907, 'Altvater'),
(66324, 'Aiken'),
(70542, 'Marra');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Qualified`
--
ALTER TABLE `Qualified`
  ADD CONSTRAINT `Qualified_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `Faculty` (`FacultyID`),
  ADD CONSTRAINT `Qualified_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

--
-- Constraints for table `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `Registration_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `Registration_ibfk_2` FOREIGN KEY (`SectionNo`) REFERENCES `Section` (`SectionNo`),
  ADD CONSTRAINT `Registration_ibfk_3` FOREIGN KEY (`Semester`) REFERENCES `Section` (`Semester`);

--
-- Constraints for table `Section`
--
ALTER TABLE `Section`
  ADD CONSTRAINT `Section_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
