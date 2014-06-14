-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:58 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tech2`
--

-- --------------------------------------------------------

--
-- Table structure for table `INVENTORY`
--

CREATE TABLE IF NOT EXISTS `INVENTORY` (
  `WarehouseID` int(11) NOT NULL,
  `SKU` int(11) NOT NULL,
  `SKU_Description` char(35) NOT NULL,
  `QuantityOnHand` int(11) DEFAULT NULL,
  `QuantityOnOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`SKU`,`WarehouseID`),
  KEY `WAREHOUSE_Relationship` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `INVENTORY`
--

INSERT INTO `INVENTORY` (`WarehouseID`, `SKU`, `SKU_Description`, `QuantityOnHand`, `QuantityOnOrder`) VALUES
(100, 100100, 'Acer laptop 8 gig mem 400 gig drive', 250, 0),
(200, 100100, 'Acer laptop 8 gig mem 400 gig drive', 100, 50),
(300, 100100, 'Acer laptop 8 gig mem 400 gig drive', 100, 0),
(400, 100100, 'Acer laptop 8 gig mem 400 gig drive', 200, 0),
(100, 100200, 'Lenovo Laptop 4 gig 250 gig drive', 200, 30),
(200, 100200, 'Lenovo Laptop 4 gig 250 gig drive', 75, 75),
(300, 100200, 'Lenovo Laptop 4 gig 250 gig drive', 100, 100),
(400, 100200, 'Lenovo Laptop 4 gig 250 gig drive', 250, 0),
(100, 101100, '1.5 terabyte USB Drive', 0, 500),
(200, 101100, '1.5 terabyte USB Drive', 0, 500),
(300, 101100, '1.5 terabyte USB Drive', 300, 200),
(400, 101100, '1.5 terabyte USB Drive', 450, 0),
(100, 101200, 'Microsoft Wireless Mouse', 100, 500),
(200, 101200, 'Microsoft Wireless Mouse', 50, 500),
(300, 101200, 'Microsoft Wireless Mouse', 475, 0),
(400, 101200, 'Microsoft Wireless Mouse', 250, 250),
(100, 201000, 'HP Laserjet Model P1102', 2, 100),
(200, 201000, 'HP Laserjet Model P1102', 10, 250),
(300, 201000, 'HP Laserjet Model P1102', 250, 0),
(400, 201000, 'HP Laserjet Model P1102', 0, 250),
(100, 202000, 'HP B&W Cartridge for P1102 Laserjet', 10, 250),
(200, 202000, 'HP B&W Cartridge for P1102 Laserjet', 1, 250),
(300, 202000, 'HP B&W Cartridge for P1102 Laserjet', 100, 0),
(400, 202000, 'HP B&W Cartridge for P1102 Laserjet', 0, 200),
(100, 301000, 'iPhone 5s 64 gig', 300, 250),
(200, 301000, 'iPhone 5s 64 gig', 250, 250),
(300, 301000, 'iPhone 5s 64 gig', 0, 250),
(400, 301000, 'iPhone 5s 64 gig', 0, 250),
(100, 302000, 'iPhone 5s 16 gig', 1000, 0),
(200, 302000, 'iPhone 5s 16 gig', 1250, 0),
(300, 302000, 'iPhone 5s 16 gig', 500, 500),
(400, 302000, 'iPhone 5s 16 gig', 0, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `ORDER_ITEM`
--

CREATE TABLE IF NOT EXISTS `ORDER_ITEM` (
  `OrderNumber` int(11) NOT NULL,
  `SKU` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(9,2) NOT NULL,
  `ExtendedPrice` decimal(9,2) NOT NULL,
  PRIMARY KEY (`SKU`,`OrderNumber`),
  KEY `RETAIL_ORDER_Relationship` (`OrderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ORDER_ITEM`
--

INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`, `Quantity`, `Price`, `ExtendedPrice`) VALUES
(3000, 100200, 1, 699.00, 699.00),
(2000, 101100, 4, 550.00, 2200.00),
(3000, 101100, 2, 120.00, 240.00),
(2000, 101200, 2, 35.00, 70.00),
(3000, 101200, 1, 150.00, 250.00),
(1000, 201000, 1, 399.00, 499.00),
(1000, 202000, 1, 199.00, 299.00);

-- --------------------------------------------------------

--
-- Table structure for table `RETAIL_ORDER`
--

CREATE TABLE IF NOT EXISTS `RETAIL_ORDER` (
  `OrderNumber` int(11) NOT NULL,
  `StoreNumber` int(11) DEFAULT NULL,
  `StoreZip` char(9) DEFAULT NULL,
  `OrderMonth` char(12) NOT NULL,
  `OrderYear` int(11) NOT NULL,
  `OrderTotal` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RETAIL_ORDER`
--

INSERT INTO `RETAIL_ORDER` (`OrderNumber`, `StoreNumber`, `StoreZip`, `OrderMonth`, `OrderYear`, `OrderTotal`) VALUES
(1000, 10, '98110', 'December', 2010, 798.00),
(2000, 20, '02335', 'December', 2010, 2270.00),
(3000, 10, '98110', 'January', 2011, 1189.00);

-- --------------------------------------------------------

--
-- Table structure for table `SKU_DATA`
--

CREATE TABLE IF NOT EXISTS `SKU_DATA` (
  `SKU` int(11) NOT NULL,
  `SKU_Description` char(35) NOT NULL,
  `Department` char(30) NOT NULL,
  `Buyer` char(30) DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SKU_DATA`
--

INSERT INTO `SKU_DATA` (`SKU`, `SKU_Description`, `Department`, `Buyer`) VALUES
(100100, 'Acer laptop 8 gig mem 400 gig drive', 'PCs', 'Jim Hansen'),
(100200, 'Lenovo Laptop 4 gig 250 gig drive', 'PCs', 'Jim Hansen'),
(101100, '1.5 terabyte USB Drive', 'PCs', 'Nancy Byers'),
(101200, 'Microsoft Wireless Mouse', 'PCs', 'Nancy Byers'),
(201000, 'HP Laserjet Model P1102', 'Printers', 'Cindy Lo'),
(202000, 'HP B&W Cartridge for P1102 Laserjet', 'Printers', 'Cindy Lo'),
(301000, 'iPhone 5s 64 gig', 'Phones', 'Jerry Lewis'),
(302000, 'iPhone 5s 16 gig', 'Phones', 'Jerry Lewis');

-- --------------------------------------------------------

--
-- Table structure for table `WAREHOUSE`
--

CREATE TABLE IF NOT EXISTS `WAREHOUSE` (
  `WarehouseID` int(11) NOT NULL,
  `WarehouseCity` char(30) NOT NULL,
  `WarehouseState` char(2) NOT NULL,
  `Manager` char(30) DEFAULT NULL,
  `SquareFeet` int(11) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WAREHOUSE`
--

INSERT INTO `WAREHOUSE` (`WarehouseID`, `WarehouseCity`, `WarehouseState`, `Manager`, `SquareFeet`) VALUES
(100, 'Atlanta', 'GA', 'Maria Mendez', 125000),
(200, 'Chicago', 'IL', 'Bill Smith', 100000),
(300, 'Omaha', 'NE', 'Bart Simpson', 150000),
(400, 'Des Moines', 'IA', 'Jie Hoang', 130000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `INVENTORY`
--
ALTER TABLE `INVENTORY`
  ADD CONSTRAINT `SKU_DATA_Relationship` FOREIGN KEY (`SKU`) REFERENCES `SKU_DATA` (`SKU`),
  ADD CONSTRAINT `WAREHOUSE_Relationship` FOREIGN KEY (`WarehouseID`) REFERENCES `WAREHOUSE` (`WarehouseID`);

--
-- Constraints for table `ORDER_ITEM`
--
ALTER TABLE `ORDER_ITEM`
  ADD CONSTRAINT `RETAIL_ORDER_Relationship` FOREIGN KEY (`OrderNumber`) REFERENCES `RETAIL_ORDER` (`OrderNumber`),
  ADD CONSTRAINT `SKU_Relationship` FOREIGN KEY (`SKU`) REFERENCES `SKU_DATA` (`SKU`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
