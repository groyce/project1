-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:57 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pvfc`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer_T`
--

CREATE TABLE IF NOT EXISTS `Customer_T` (
  `CustomerID` decimal(11,0) NOT NULL,
  `CustomerName` varchar(25) NOT NULL,
  `CustomerAddress` varchar(30) DEFAULT NULL,
  `CustomerCity` varchar(20) DEFAULT NULL,
  `CustomerState` char(2) DEFAULT NULL,
  `CustomerPostalCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer_T`
--

INSERT INTO `Customer_T` (`CustomerID`, `CustomerName`, `CustomerAddress`, `CustomerCity`, `CustomerState`, `CustomerPostalCode`) VALUES
(1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871'),
(2, 'Value Furniture', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7743'),
(3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125'),
(4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188'),
(5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056'),
(6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432'),
(7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97954-5589'),
(8, 'California Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '96915-7754'),
(9, 'M and H Casual Furniture', '3709 First Street', 'Clearwater', 'FL', '34620-2314'),
(10, 'Seminole Interiors', '2400 Rocky Point Dr.', 'Seminole', 'FL', '34646-4423'),
(11, 'American Euro Lifestyles', '2424 Missouri Ave N.', 'Prospect Park', 'NJ', '07508-5621'),
(12, 'Battle Creek Furniture', '345 Capitol Ave. SW', 'Battle Creek', 'MI', '49015-3401'),
(13, 'Heritage Furnishings', '66789 College Ave.', 'Carlisle', 'PA', '17013-8834'),
(14, 'Kaneohe Homes', '112 Kiowai St.', 'Kaneohe', 'HI', '96744-2537'),
(15, 'Mountain Scenes', '4132 Main Street', 'Ogden', 'UT', '84403-4432');

-- --------------------------------------------------------

--
-- Table structure for table `DoesBusinessIn_T`
--

CREATE TABLE IF NOT EXISTS `DoesBusinessIn_T` (
  `CustomerID` decimal(11,0) NOT NULL,
  `TerritoryID` decimal(11,0) NOT NULL,
  PRIMARY KEY (`CustomerID`,`TerritoryID`),
  KEY `DoesBusinessIn_FK2` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DoesBusinessIn_T`
--

INSERT INTO `DoesBusinessIn_T` (`CustomerID`, `TerritoryID`) VALUES
(1, 1),
(1, 2),
(2, 2),
(5, 2),
(3, 3),
(4, 3),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeSkills_T`
--

CREATE TABLE IF NOT EXISTS `EmployeeSkills_T` (
  `EmployeeID` varchar(10) NOT NULL,
  `SkillID` varchar(12) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`SkillID`),
  KEY `EmployeeSkills_FK2` (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EmployeeSkills_T`
--

INSERT INTO `EmployeeSkills_T` (`EmployeeID`, `SkillID`) VALUES
('123-44-345', 'BS12'),
('454-56-768', 'BS12'),
('123-44-345', 'RT1');

-- --------------------------------------------------------

--
-- Table structure for table `Employee_T`
--

CREATE TABLE IF NOT EXISTS `Employee_T` (
  `EmployeeID` varchar(10) NOT NULL,
  `EmployeeName` varchar(25) DEFAULT NULL,
  `EmployeeAddress` varchar(30) DEFAULT NULL,
  `EmployeeBirthDate` date DEFAULT NULL,
  `EmployeeCity` varchar(20) DEFAULT NULL,
  `EmployeeState` char(2) DEFAULT NULL,
  `EmployeeZipCode` varchar(10) DEFAULT NULL,
  `EmployeeDateHired` date DEFAULT NULL,
  `EmployeeSupervisor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee_T`
--

INSERT INTO `Employee_T` (`EmployeeID`, `EmployeeName`, `EmployeeAddress`, `EmployeeBirthDate`, `EmployeeCity`, `EmployeeState`, `EmployeeZipCode`, `EmployeeDateHired`, `EmployeeSupervisor`) VALUES
('123-44-345', 'Jim Jason', '2134 Hilltop Rd', '0000-00-00', '', 'TN', '', '0000-00-00', '454-56-768'),
('454-56-768', 'Robert Lewis', '17834 Deerfield Ln', '0000-00-00', 'Nashville', 'TN', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `OrderLine_T`
--

CREATE TABLE IF NOT EXISTS `OrderLine_T` (
  `OrderID` decimal(11,0) NOT NULL,
  `ProductID` decimal(11,0) NOT NULL,
  `OrderedQuantity` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `OrderLine_FK2` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderLine_T`
--

INSERT INTO `OrderLine_T` (`OrderID`, `ProductID`, `OrderedQuantity`) VALUES
(1001, 1, 2),
(1001, 2, 2),
(1001, 4, 1),
(1002, 3, 5),
(1003, 3, 3),
(1004, 6, 2),
(1004, 8, 2),
(1005, 4, 3),
(1006, 4, 1),
(1006, 5, 2),
(1006, 7, 2),
(1007, 1, 3),
(1007, 2, 2),
(1008, 3, 3),
(1008, 8, 3),
(1009, 4, 2),
(1009, 7, 3),
(1010, 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Order_T`
--

CREATE TABLE IF NOT EXISTS `Order_T` (
  `OrderID` decimal(11,0) NOT NULL,
  `CustomerID` decimal(11,0) DEFAULT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderID`),
  KEY `Order_FK1` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Order_T`
--

INSERT INTO `Order_T` (`OrderID`, `CustomerID`, `OrderDate`) VALUES
(1001, 1, '0000-00-00 00:00:00'),
(1002, 8, '0000-00-00 00:00:00'),
(1003, 15, '0000-00-00 00:00:00'),
(1004, 5, '0000-00-00 00:00:00'),
(1005, 3, '0000-00-00 00:00:00'),
(1006, 2, '0000-00-00 00:00:00'),
(1007, 11, '0000-00-00 00:00:00'),
(1008, 12, '0000-00-00 00:00:00'),
(1009, 4, '0000-00-00 00:00:00'),
(1010, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ProducedIn_T`
--

CREATE TABLE IF NOT EXISTS `ProducedIn_T` (
  `ProductID` decimal(11,0) NOT NULL,
  `WorkCenterID` varchar(12) NOT NULL,
  PRIMARY KEY (`ProductID`,`WorkCenterID`),
  KEY `ProducedIn_FK2` (`WorkCenterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductLine_T`
--

CREATE TABLE IF NOT EXISTS `ProductLine_T` (
  `ProductLineID` decimal(11,0) NOT NULL,
  `ProductLineName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductLineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ProductLine_T`
--

INSERT INTO `ProductLine_T` (`ProductLineID`, `ProductLineName`) VALUES
(1, 'Cherry Tree'),
(2, 'Scandinavia'),
(3, 'Country Look');

-- --------------------------------------------------------

--
-- Table structure for table `Product_T`
--

CREATE TABLE IF NOT EXISTS `Product_T` (
  `ProductID` decimal(11,0) NOT NULL,
  `ProductLineID` decimal(11,0) DEFAULT NULL,
  `ProductDescription` varchar(50) DEFAULT NULL,
  `ProductFinish` varchar(20) DEFAULT NULL,
  `ProductStandardPrice` decimal(6,2) DEFAULT NULL,
  `QtyOnHand` int(5) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Product_FK1` (`ProductLineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product_T`
--

INSERT INTO `Product_T` (`ProductID`, `ProductLineID`, `ProductDescription`, `ProductFinish`, `ProductStandardPrice`, `QtyOnHand`) VALUES
(1, 1, 'End Table', 'Cherry', 175.00, NULL),
(2, 2, 'Coffee Table', 'Natural Ash', 200.00, NULL),
(3, 2, 'Computer Desk', 'Natural Ash', 375.00, NULL),
(4, 3, 'Entertainment Center', 'Natural Maple', 650.00, NULL),
(5, 1, 'Writers Desk', 'Cherry', 325.00, NULL),
(6, 2, '8-Drawer Desk', 'White Ash', 750.00, NULL),
(7, 2, 'Dining Table', 'Natural Ash', 800.00, NULL),
(8, 3, 'Computer Desk', 'Walnut', 250.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RawMaterial_T`
--

CREATE TABLE IF NOT EXISTS `RawMaterial_T` (
  `MaterialID` varchar(12) NOT NULL,
  `MaterialName` varchar(30) DEFAULT NULL,
  `MaterialStandardCost` decimal(6,2) DEFAULT NULL,
  `UnitOfMeasure` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Salesperson_T`
--

CREATE TABLE IF NOT EXISTS `Salesperson_T` (
  `SalespersonID` decimal(11,0) NOT NULL,
  `SalespersonName` varchar(25) DEFAULT NULL,
  `SalespersonPhone` varchar(50) DEFAULT NULL,
  `SalespersonFax` varchar(50) DEFAULT NULL,
  `TerritoryID` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`SalespersonID`),
  KEY `Salesperson_FK1` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Salesperson_T`
--

INSERT INTO `Salesperson_T` (`SalespersonID`, `SalespersonName`, `SalespersonPhone`, `SalespersonFax`, `TerritoryID`) VALUES
(1, 'Doug Henny', '8134445555', '', 1),
(2, 'Robert Lewis', '8139264006', '', 2),
(3, 'William Strong', '5053821212', '', 3),
(4, 'Julie Dawson', '4355346677', '', 4),
(5, 'Jacob Winslow', '2238973498', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Skill_T`
--

CREATE TABLE IF NOT EXISTS `Skill_T` (
  `SkillID` varchar(12) NOT NULL,
  `SkillDescription` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Skill_T`
--

INSERT INTO `Skill_T` (`SkillID`, `SkillDescription`) VALUES
('BS12', '12in Band Saw'),
('QC1', 'Quality Control'),
('RT1', 'Router'),
('SB1', 'Sander-Belt'),
('SO1', 'Sander-Orbital'),
('TS10', '10in Table Saw'),
('TS12', '12in Table Saw'),
('UC1', 'Upholstery Cutter'),
('US1', 'Upholstery Sewer'),
('UT1', 'Upholstery Tacker');

-- --------------------------------------------------------

--
-- Table structure for table `Supplies_T`
--

CREATE TABLE IF NOT EXISTS `Supplies_T` (
  `VendorID` decimal(11,0) NOT NULL,
  `MaterialID` varchar(12) NOT NULL,
  `SuppliesUnitPrice` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`VendorID`,`MaterialID`),
  KEY `Supplies_FK1` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Territory_T`
--

CREATE TABLE IF NOT EXISTS `Territory_T` (
  `TerritoryID` decimal(11,0) NOT NULL,
  `TerritoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Territory_T`
--

INSERT INTO `Territory_T` (`TerritoryID`, `TerritoryName`) VALUES
(1, 'SouthEast'),
(2, 'SouthWest'),
(3, 'NorthEast'),
(4, 'NorthWest'),
(5, 'Central');

-- --------------------------------------------------------

--
-- Table structure for table `Uses_T`
--

CREATE TABLE IF NOT EXISTS `Uses_T` (
  `ProductID` decimal(11,0) NOT NULL,
  `MaterialID` varchar(12) NOT NULL,
  `GoesIntoQuantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`MaterialID`),
  KEY `Uses_FK2` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Vendor_T`
--

CREATE TABLE IF NOT EXISTS `Vendor_T` (
  `VendorID` decimal(11,0) NOT NULL,
  `VendorName` varchar(25) DEFAULT NULL,
  `VendorAddress` varchar(30) DEFAULT NULL,
  `VendorCity` varchar(20) DEFAULT NULL,
  `VendorState` char(2) DEFAULT NULL,
  `VendorZipcode` varchar(50) DEFAULT NULL,
  `VendorFax` varchar(10) DEFAULT NULL,
  `VendorPhone` varchar(10) DEFAULT NULL,
  `VendorContact` varchar(50) DEFAULT NULL,
  `VendorTaxID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `WorkCenter_T`
--

CREATE TABLE IF NOT EXISTS `WorkCenter_T` (
  `WorkCenterID` varchar(12) NOT NULL,
  `WorkCenterLocation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`WorkCenterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WorkCenter_T`
--

INSERT INTO `WorkCenter_T` (`WorkCenterID`, `WorkCenterLocation`) VALUES
('SM1', 'Main Saw Mill'),
('WR1', 'Warehouse and Receiving');

-- --------------------------------------------------------

--
-- Table structure for table `WorksIn_T`
--

CREATE TABLE IF NOT EXISTS `WorksIn_T` (
  `EmployeeID` varchar(10) NOT NULL,
  `WorkCenterID` varchar(12) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`WorkCenterID`),
  KEY `WorksIn_FK2` (`WorkCenterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WorksIn_T`
--

INSERT INTO `WorksIn_T` (`EmployeeID`, `WorkCenterID`) VALUES
('123-44-345', 'SM1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DoesBusinessIn_T`
--
ALTER TABLE `DoesBusinessIn_T`
  ADD CONSTRAINT `DoesBusinessIn_FK1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer_T` (`CustomerID`),
  ADD CONSTRAINT `DoesBusinessIn_FK2` FOREIGN KEY (`TerritoryID`) REFERENCES `Territory_T` (`TerritoryID`);

--
-- Constraints for table `EmployeeSkills_T`
--
ALTER TABLE `EmployeeSkills_T`
  ADD CONSTRAINT `EmployeeSkills_FK1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee_T` (`EmployeeID`),
  ADD CONSTRAINT `EmployeeSkills_FK2` FOREIGN KEY (`SkillID`) REFERENCES `Skill_T` (`SkillID`);

--
-- Constraints for table `OrderLine_T`
--
ALTER TABLE `OrderLine_T`
  ADD CONSTRAINT `OrderLine_FK1` FOREIGN KEY (`OrderID`) REFERENCES `Order_T` (`OrderID`),
  ADD CONSTRAINT `OrderLine_FK2` FOREIGN KEY (`ProductID`) REFERENCES `Product_T` (`ProductID`);

--
-- Constraints for table `Order_T`
--
ALTER TABLE `Order_T`
  ADD CONSTRAINT `Order_FK1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer_T` (`CustomerID`);

--
-- Constraints for table `ProducedIn_T`
--
ALTER TABLE `ProducedIn_T`
  ADD CONSTRAINT `ProducedIn_FK1` FOREIGN KEY (`ProductID`) REFERENCES `Product_T` (`ProductID`),
  ADD CONSTRAINT `ProducedIn_FK2` FOREIGN KEY (`WorkCenterID`) REFERENCES `WorkCenter_T` (`WorkCenterID`);

--
-- Constraints for table `Product_T`
--
ALTER TABLE `Product_T`
  ADD CONSTRAINT `Product_FK1` FOREIGN KEY (`ProductLineID`) REFERENCES `ProductLine_T` (`ProductLineID`);

--
-- Constraints for table `Salesperson_T`
--
ALTER TABLE `Salesperson_T`
  ADD CONSTRAINT `Salesperson_FK1` FOREIGN KEY (`TerritoryID`) REFERENCES `Territory_T` (`TerritoryID`);

--
-- Constraints for table `Supplies_T`
--
ALTER TABLE `Supplies_T`
  ADD CONSTRAINT `Supplies_FK1` FOREIGN KEY (`MaterialID`) REFERENCES `RawMaterial_T` (`MaterialID`),
  ADD CONSTRAINT `Supplies_FK2` FOREIGN KEY (`VendorID`) REFERENCES `Vendor_T` (`VendorID`);

--
-- Constraints for table `Uses_T`
--
ALTER TABLE `Uses_T`
  ADD CONSTRAINT `Uses_FK1` FOREIGN KEY (`ProductID`) REFERENCES `Product_T` (`ProductID`),
  ADD CONSTRAINT `Uses_FK2` FOREIGN KEY (`MaterialID`) REFERENCES `RawMaterial_T` (`MaterialID`);

--
-- Constraints for table `WorksIn_T`
--
ALTER TABLE `WorksIn_T`
  ADD CONSTRAINT `WorksIn_FK1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee_T` (`EmployeeID`),
  ADD CONSTRAINT `WorksIn_FK2` FOREIGN KEY (`WorkCenterID`) REFERENCES `WorkCenter_T` (`WorkCenterID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
