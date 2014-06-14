-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:59 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tech_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE IF NOT EXISTS `CUSTOMER` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` char(25) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `Address` char(35) DEFAULT NULL,
  `City` char(35) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZIP` char(10) DEFAULT NULL,
  `Phone` char(12) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`CustomerID`, `LastName`, `FirstName`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Email`) VALUES
(1, 'Shire', 'Robert', '6225 Evanston Ave N', 'Seattle', 'WA', '98103', '206-524-2433', 'Robert.Shire@somewhere.com'),
(2, 'Goodyear', 'Katherine', '7335 11th Ave NE', 'Seattle', 'WA', '98105', '206-524-3544', 'Katherine.Goodyear@somewhere.com'),
(3, 'Bancroft', 'Chris', '12605 NE 6th Street', 'Bellevue', 'WA', '98005', '425-635-9788', 'Chris.Bancroft@somewhere.com'),
(4, 'Griffith', 'John', '335 Aloha Street', 'Seattle', 'WA', '98109', '206-524-4655', 'John.Griffith@somewhere.com'),
(5, 'Tierney', 'Doris', '14510 NE 4th Street', 'Bellevue', 'WA', '98005', '425-635-8677', 'Doris.Tierney@somewhere.com'),
(6, 'Anderson', 'Donna', '1410 Hillcrest Parkway', 'Mt. Vernon', 'WA', '98273', '360-538-7566', 'Donna.Anderson@elsewhere.com'),
(7, 'Svane', 'Jack', '3211 42nd Street', 'Seattle', 'WA', '98115', '206-524-5766', 'Jack.Svane@somewhere.com'),
(8, 'Walsh', 'Denesha', '6712 24th Avenue NE', 'Redmond', 'WA', '98053', '425-635-7566', 'Denesha.Walsh@somewhere.com'),
(9, 'Enquist', 'Craig', '534 15th Street', 'Bellingham', 'WA', '98225', '360-538-6455', 'Craig.Enquist@elsewhere.com'),
(10, 'Anderson', 'Rose', '6823 17th Ave NE', 'Seattle', 'WA', '98105', '206-524-6877', 'Rose.Anderson@elsewhere.com');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` char(25) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `Phone` char(12) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EmployeeID`, `LastName`, `FirstName`, `Phone`, `Email`) VALUES
(1, 'Stuart', 'Anne', '206-527-0010', 'Anne.Stuart@QACS.com'),
(2, 'Stuart', 'George', '206-527-0011', 'George.Stuart@QACS.com'),
(3, 'Stuart', 'Mary', '206-527-0012', 'Mary.Stuart@QACS.com'),
(4, 'Orange', 'William', '206-527-0013', 'William.Orange@QACS.com'),
(5, 'Griffith', 'John', '206-527-0014', 'John.Griffith@QACS.com');

-- --------------------------------------------------------

--
-- Table structure for table `ITEM`
--

CREATE TABLE IF NOT EXISTS `ITEM` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemDescription` varchar(255) NOT NULL,
  `PurchaseDate` datetime NOT NULL,
  `ItemCost` decimal(9,2) NOT NULL,
  `ItemPrice` decimal(9,2) NOT NULL,
  `VendorID` int(11) NOT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `ITEM_VENDOR_FK` (`VendorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `ITEM`
--

INSERT INTO `ITEM` (`ItemID`, `ItemDescription`, `PurchaseDate`, `ItemCost`, `ItemPrice`, `VendorID`) VALUES
(1, 'Antique Desk', '2012-11-07 00:00:00', 1800.00, 3000.00, 2),
(2, 'Antique Desk Chair', '2012-11-10 00:00:00', 300.00, 500.00, 4),
(3, 'Dining Table Linens', '2012-11-14 00:00:00', 600.00, 1000.00, 1),
(4, 'Candles', '2012-11-14 00:00:00', 30.00, 50.00, 1),
(5, 'Candles', '2012-11-14 00:00:00', 27.00, 45.00, 1),
(6, 'Desk Lamp', '2012-11-14 00:00:00', 150.00, 250.00, 3),
(7, 'Dining Table Linens', '2012-11-14 00:00:00', 450.00, 750.00, 1),
(8, 'Book Shelf', '2012-11-21 00:00:00', 150.00, 250.00, 5),
(9, 'Antique Chair', '2012-11-21 00:00:00', 750.00, 1250.00, 6),
(10, 'Antique Chair', '2012-11-21 00:00:00', 1050.00, 1750.00, 6),
(11, 'Antique Candle Holders', '2012-11-28 00:00:00', 210.00, 350.00, 2),
(12, 'Antique Desk', '2013-01-05 00:00:00', 1920.00, 3200.00, 2),
(13, 'Antique Desk', '2013-01-05 00:00:00', 2100.00, 3500.00, 2),
(14, 'Antique Desk Chair', '2013-01-06 00:00:00', 285.00, 475.00, 9),
(15, 'Antique Desk Chair', '2013-01-06 00:00:00', 339.00, 565.00, 9),
(16, 'Desk Lamp', '2013-01-09 00:00:00', 150.00, 250.00, 10),
(17, 'Desk Lamp', '2013-01-09 00:00:00', 150.00, 250.00, 10),
(18, 'Desk Lamp', '2013-01-09 00:00:00', 144.00, 240.00, 3),
(19, 'Antique Dining Table', '2013-01-10 00:00:00', 3000.00, 5000.00, 7),
(20, 'Antique Sideboard', '2013-01-11 00:00:00', 2700.00, 4500.00, 8),
(21, 'Dining Table Chairs', '2013-01-11 00:00:00', 5100.00, 8500.00, 9),
(22, 'Dining Table Linens', '2013-01-12 00:00:00', 450.00, 750.00, 1),
(23, 'Dining Table Linens', '2013-01-12 00:00:00', 480.00, 800.00, 1),
(24, 'Candles', '2013-01-17 00:00:00', 30.00, 50.00, 1),
(25, 'Candles', '2013-01-17 00:00:00', 36.00, 60.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `VENDOR`
--

CREATE TABLE IF NOT EXISTS `VENDOR` (
  `VendorID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` char(100) DEFAULT NULL,
  `ContactLastName` char(25) NOT NULL,
  `ContactFirstName` char(25) NOT NULL,
  `Address` char(35) DEFAULT NULL,
  `City` char(35) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZIP` char(10) DEFAULT NULL,
  `Phone` char(12) NOT NULL,
  `Fax` char(12) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `VENDOR`
--

INSERT INTO `VENDOR` (`VendorID`, `CompanyName`, `ContactLastName`, `ContactFirstName`, `Address`, `City`, `State`, `ZIP`, `Phone`, `Fax`, `Email`) VALUES
(1, 'Linens and Things', 'Huntington', 'Anne', '1515 NW Market Street', 'Seattle', 'WA', '98107', '206-325-6755', '206-329-9675', 'LAT@business.com'),
(2, 'European Specialties', 'Tadema', 'Ken', '6123 15th Avenue NW', 'Seattle', 'WA', '98107', '206-325-7866', '206-329-9786', 'ES@business.com'),
(3, 'Lamps and Lighting', 'Swanson', 'Sally', '506 Prospect Street', 'Seattle', 'WA', '98109', '206-325-8977', '206-329-9897', 'LAL@business.com'),
(4, NULL, 'Lee', 'Andrew', '1102 3rd Street', 'Kirkland', 'WA', '98033', '425-746-5433', NULL, 'Andrew.Lee@somewhere.com'),
(5, NULL, 'Harrison', 'Denise', '533 10th Avenue', 'Kirkland', 'WA', '98033', '425-746-4322', NULL, 'Denise.Harrison@somewhere.com'),
(6, 'New York Brokerage', 'Smith', 'Mark', '621 Roy Street', 'Seattle', 'WA', '98109', '206-325-9088', '206-329-9908', 'NYB@business.com'),
(7, NULL, 'Walsh', 'Denesha', '6712 24th Avenue NE', 'Redmond', 'WA', '98053', '425-635-7566', NULL, 'Denesha.Walsh@somewhere.com'),
(8, NULL, 'Bancroft', 'Chris', '12605 NE 6th Street', 'Bellevue', 'WA', '98005', '425-635-9788', '425-639-9978', 'Chris.Bancroft@somewhere.com'),
(9, 'Specialty Antiques', 'Nelson', 'Fred', '2512 Lucky Street', 'San Francisco', 'CA', '94110', '415-422-2121', '415-429-9212', 'SA@business.com'),
(10, 'General Antiques', 'Garner', 'Patty', '2515 Lucky Street', 'San Francisco', 'CA', '94110', '415-422-3232', '415-429-9323', 'GA@business.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ITEM`
--
ALTER TABLE `ITEM`
  ADD CONSTRAINT `ITEM_VENDOR_FK` FOREIGN KEY (`VendorID`) REFERENCES `VENDOR` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
