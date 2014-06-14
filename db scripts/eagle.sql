-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:55 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eagle`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `streetaddress` varchar(50) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `primaryemail` varchar(30) DEFAULT NULL,
  `homephone` varchar(14) DEFAULT NULL,
  `cellphone` varchar(14) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91135 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `streetaddress`, `city`, `state`, `zip`, `primaryemail`, `homephone`, `cellphone`, `created`, `modified`) VALUES
(12056, 'Katherine McClusky', '6781 Miles Street', 'Ames', 'IA', '69129', 'katherinemc@gmail.com', '515-554-10', '515-554-34', NULL, NULL),
(35109, 'Joseph Patil', '7559 North 121st Street', 'Omaha', 'NE', '68167', 'jpatil@hotmail.com', '402-991-8915', '402-739-1110', NULL, NULL),
(50712, 'Gary Bennet', '3478 North 10th Street', 'Omaha', 'NE', '68124', 'geryb@yahoo.com', '402-399-0956', '4023529912', NULL, NULL),
(68202, 'Jeremy Belknap', '7309 North 74th street', 'Omaha', 'NE', '68145', 'jbelknap@yahoo.com', '402-554-1975', '402-554-1975', '2013-05-27 15:54:23', '2013-05-27 15:54:23'),
(73128, 'George Jones', '1113 South 49th Street', 'Omaha', 'NE', '68175', 'gjones@cox.net', '402-399-1716', '402-399-1716', '2013-05-25 22:50:19', '2013-05-29 21:10:33'),
(78113, 'Mary Smith', '8713 No 143rd Street', 'Omaha', 'NE', '68176', 'mary.smith@gmail.com', '402-923-7818', '402-923-7818', '2013-05-27 13:57:46', '2013-05-27 13:57:46'),
(91134, 'Pam Davis', '3602 South 49th Street', 'Omaha', 'NE', '68175', 'pam.davis@gmail.com', '402-554-1206', '402991-0917', '2013-05-18 21:01:54', '2013-05-18 21:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `category` varchar(12) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `acquiredvalue` decimal(10,2) NOT NULL,
  `acquireddate` date DEFAULT NULL,
  `recentvalue` decimal(10,2) DEFAULT NULL,
  `recentdate` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `customer_id`, `category`, `description`, `acquiredvalue`, `acquireddate`, `recentvalue`, `recentdate`, `created`, `modified`) VALUES
(1, 12056, '401K', '401K with Conagra', 0.00, '2000-01-15', 234000.00, '2013-05-20', '2013-05-20 16:08:11', '2013-05-20 19:12:37'),
(2, 12056, 'fund', 'Oppenheimer Growth Mutual Fund', 23000.00, '2005-11-22', 78000.00, '2013-04-23', '2013-05-20 19:12:10', '2013-05-20 19:12:10'),
(3, 12056, 'property', 'home with no mortgage', 110000.00, '1993-08-23', 130000.00, '2013-04-23', '2013-05-20 19:15:32', '2013-05-20 19:15:32'),
(4, 50712, '401K', '401K with Mutual of Omaha', 0.00, '1997-08-23', 609000.00, '2013-05-20', '2013-05-20 19:27:10', '2013-05-20 19:30:15'),
(5, 50712, 'property', 'condo $45,000 mortgage 5/2013', 80000.00, '1999-08-27', 150000.00, '2013-05-20', '2013-05-20 19:33:06', '2013-05-20 19:33:06'),
(6, 35109, 'mutual fund', 'Janus Venture Fund', 140000.00, '2005-11-01', 287000.00, '2013-04-22', '2013-05-20 19:39:28', '2013-05-20 19:39:28'),
(7, 35109, 'property', 'home with no mortgage', 110000.00, '2013-05-20', 140000.00, '2013-04-22', '2013-05-20 19:41:28', '2013-05-20 19:41:28'),
(8, 35109, '401K', '401K with OPPD', 0.00, '2001-11-01', 234000.00, '2013-04-22', '2013-05-20 19:44:10', '2013-05-20 19:44:10'),
(9, 91134, '401K', '401K with PayPal', 0.00, '2001-06-15', 180000.00, '2013-05-20', '2013-05-20 19:47:10', '2013-05-20 19:47:10'),
(10, 91134, 'property', 'condo with no mortgage', 108000.00, '1999-08-27', 112000.00, '2013-05-20', '2013-05-20 19:48:01', '2013-05-20 19:49:43'),
(11, 50712, 'fund', 'Harris Mutual Fund ', 12000.00, '1997-05-25', 18500.00, '2013-03-14', '2013-05-25 22:55:05', '2013-05-25 22:55:42'),
(12, 68202, 'Fund', 'Janus Mutual Fund', 31000.00, '2007-04-15', 42000.00, '2013-03-16', '2013-05-27 16:15:01', '2013-05-27 16:15:01'),
(13, 73128, '401K', '401K with Mutual of Omaha', 0.00, '2002-03-18', 208000.00, '2013-06-12', '2013-06-12 20:13:15', '2013-06-12 20:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `stsymbol` varchar(6) DEFAULT NULL,
  `stname` varchar(30) DEFAULT NULL,
  `noshares` varchar(6) DEFAULT NULL,
  `purchaseprice` decimal(10,2) DEFAULT NULL,
  `datepurchased` date NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `customer_id`, `stsymbol`, `stname`, `noshares`, `purchaseprice`, `datepurchased`, `created`, `modified`) VALUES
(1, 12056, 'goog', 'Google', '200', 210.00, '2004-02-03', NULL, '2013-05-20 14:43:15'),
(2, 12056, 'msft', 'Microsoft', '400', 31.78, '2005-02-03', '2013-05-18 21:35:39', '2013-05-20 14:42:16'),
(3, 12056, 'sbux', 'Starbucks', '100', 40.08, '2004-01-15', '2013-05-18 21:36:40', '2013-05-20 14:44:06'),
(4, 50712, 'ibm', 'IBM Corp', '550', 72.87, '2002-06-23', '2013-05-18 21:39:16', '2013-05-20 14:45:04'),
(5, 35109, 'yhoo', 'Yahoo', '800', 31.05, '2002-06-18', '2013-05-18 21:41:03', '2013-05-20 15:01:37'),
(6, 35109, 'gm', 'General Motors', '450', 56.92, '2004-04-22', '2013-05-18 21:42:07', '2013-05-20 15:03:02'),
(7, 91134, 'csco', 'Cisco', '250', 23.45, '2004-02-21', '2013-05-18 21:43:44', '2013-05-20 15:03:46'),
(8, 91134, 'T', 'AT&T', '250', 42.78, '2004-01-15', '2013-05-18 21:45:55', '2013-05-20 15:04:21'),
(9, 91134, 'pfe', 'Phizer', '390', 41.91, '2004-01-08', '2013-05-18 21:48:09', '2013-05-20 15:05:00'),
(10, 12056, 'T', 'AT&T', '200', 52.00, '2012-07-25', '2013-05-25 23:17:21', '2013-05-25 23:17:21'),
(11, 12056, 'msft', 'Microsoft ', '50', 34.00, '2012-05-27', '2013-05-27 16:18:42', '2013-05-27 16:18:42'),
(12, 68202, 'goog', 'Google', '100', 601.00, '2012-05-27', '2013-05-27 16:20:19', '2013-05-27 16:20:19'),
(13, 12056, 'aapl', 'Apple', '1360', 350.00, '2013-06-04', '2013-06-04 15:31:23', '2013-06-04 15:47:01'),
(17, 12056, NULL, NULL, '1250', NULL, '0000-00-00', '2013-06-04 15:37:17', '2013-06-04 15:37:17'),
(18, 35109, 't', 'AT&T', '100', 45.00, '2001-02-12', '2013-06-12 19:47:53', '2013-06-12 19:47:53');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
