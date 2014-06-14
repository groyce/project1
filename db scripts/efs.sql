-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2014 at 02:56 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `efs`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` varchar(10) NOT NULL DEFAULT '',
  `cust_ssn` varchar(9) NOT NULL DEFAULT '',
  `cust_fname` varchar(20) NOT NULL DEFAULT '',
  `cust_lname` varchar(20) NOT NULL DEFAULT '',
  `cust_mname` varchar(20) NOT NULL DEFAULT '',
  `cust_street` varchar(25) NOT NULL DEFAULT '',
  `cust_city` varchar(20) NOT NULL DEFAULT '',
  `cust_zip` varchar(10) NOT NULL DEFAULT '',
  `cust_stateabbr` char(2) NOT NULL DEFAULT '',
  `cust_work_phone` varchar(15) NOT NULL DEFAULT '',
  `cust_home_phone` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`cust_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_ssn`, `cust_fname`, `cust_lname`, `cust_mname`, `cust_street`, `cust_city`, `cust_zip`, `cust_stateabbr`, `cust_work_phone`, `cust_home_phone`) VALUES
('12056', '508451103', 'Katherine', 'McClusky', 'Ann', '6781 Miles Street', 'Ames', '69129', 'IA', '515-554-1023', '515-554-3461'),
('50712', '507150345', 'Gary', 'Smith', 'William', '3478 North 10th', 'Omaha', '68124', 'NE', '402-399-0736', '402-352-9912');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE IF NOT EXISTS `insurance` (
  `id` int(11) NOT NULL,
  `cust_id` varchar(10) NOT NULL DEFAULT '',
  `policy_no` varchar(20) NOT NULL DEFAULT '',
  `policy_type` varchar(20) NOT NULL DEFAULT '',
  `last_pay_date` date NOT NULL DEFAULT '0000-00-00',
  `last_pay_amount` decimal(8,0) NOT NULL DEFAULT '0',
  `current_cash_val` varchar(10) NOT NULL DEFAULT '',
  `value_of_coverage` varchar(10) NOT NULL DEFAULT '0',
  `ins_fname` varchar(20) NOT NULL DEFAULT '',
  `ins_lname` varchar(20) NOT NULL DEFAULT '',
  `ins_mname` varchar(20) NOT NULL DEFAULT '',
  `ins_ssn` varchar(9) NOT NULL DEFAULT '',
  `rel_of_insured` varchar(20) NOT NULL DEFAULT '',
  `ben_fname` varchar(20) NOT NULL DEFAULT '',
  `ben_lname` varchar(20) NOT NULL DEFAULT '',
  `ben_mname` varchar(20) NOT NULL DEFAULT '',
  `ben_ssn` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`id`, `cust_id`, `policy_no`, `policy_type`, `last_pay_date`, `last_pay_amount`, `current_cash_val`, `value_of_coverage`, `ins_fname`, `ins_lname`, `ins_mname`, `ins_ssn`, `rel_of_insured`, `ben_fname`, `ben_lname`, `ben_mname`, `ben_ssn`) VALUES
(0, '12056', '10099023', 'whole life', '2003-08-12', 52, '6800.00', '30000', 'Katherine', 'McClusky', 'Ann', '508451103', 'SELF', 'David', 'McClusky', '507651022', '');

-- --------------------------------------------------------

--
-- Table structure for table `lead`
--

CREATE TABLE IF NOT EXISTS `lead` (
  `cust_id` varchar(10) NOT NULL DEFAULT '',
  `lead_fname` varchar(25) NOT NULL DEFAULT '',
  `lead_lname` varchar(25) NOT NULL DEFAULT '',
  `lead_street` varchar(25) NOT NULL DEFAULT '',
  `lead_city` varchar(25) NOT NULL DEFAULT '',
  `lead_zip` varchar(10) NOT NULL DEFAULT '',
  `lead_stateabbr` varchar(15) NOT NULL DEFAULT '',
  `lead_home_phone` varchar(15) NOT NULL DEFAULT '',
  `lead_email` varchar(50) NOT NULL DEFAULT '',
  `needs` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lead`
--

INSERT INTO `lead` (`cust_id`, `lead_fname`, `lead_lname`, `lead_street`, `lead_city`, `lead_zip`, `lead_stateabbr`, `lead_home_phone`, `lead_email`, `needs`) VALUES
('', 'George', 'Groyce', '3602 South 94th Street', 'Omaha', '68124', 'Ne', '402-215-0853', 'georgeroyce@creighton.edu', 'Great Mobile App'),
('', 'Bill ', 'Smith', '1197 South 87th Street', 'Omaha', '68106', 'Ne', '402-871-1234', 'bill.smith@gmail.com', ''),
('', 'Terry', 'Jones', '3814 North 42nd Street', 'Omaha', '68104', 'NE', '402-992-8892', 'terry.jones@yahoo.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_table`
--

CREATE TABLE IF NOT EXISTS `stock_table` (
  `id` int(11) NOT NULL,
  `cust_id` varchar(10) NOT NULL DEFAULT '',
  `st_symbol` varchar(10) NOT NULL DEFAULT '',
  `st_name` varchar(25) NOT NULL DEFAULT '',
  `no_shares` varchar(8) NOT NULL DEFAULT '',
  `purch_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `purch_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_table`
--

INSERT INTO `stock_table` (`id`, `cust_id`, `st_symbol`, `st_name`, `no_shares`, `purch_price`, `purch_date`) VALUES
(1, '12056', 't', 'AT&T', '200', 23.00, '2005-02-03'),
(2, '12056', 'msft', 'Microsoft', '300', 31.78, '2005-02-03'),
(3, '12056', 'sbux', 'Starbucks', '200', 40.08, '2004-01-15'),
(4, '50712', 'ibm', 'IBM', '500', 72.87, '2002-06-23'),
(5, '50712', 'msft', 'Microsoft', '100', 42.08, '2002-06-23'),
(6, '35109', 'yhoo', 'Yahoo', '800', 31.05, '2004-04-22'),
(7, '35109', 'gm', 'General Motors', '450', 56.92, '2004-04-22'),
(8, '91134', 'csco', 'Cisco', '250', 23.45, '2003-02-11'),
(9, '91134', 'ge', 'General Electric', '800', 52.59, '2001-08-30'),
(10, '91134', 'mot', 'Motorola', '200', 18.12, '2004-02-21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
