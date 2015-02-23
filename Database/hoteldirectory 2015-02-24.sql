-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 23, 2015 at 08:50 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hoteldirectory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcity`
--

CREATE TABLE IF NOT EXISTS `tblcity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tblcity`
--

INSERT INTO `tblcity` (`ID`, `Code`, `Name`, `Status`) VALUES
(1, 'GAL', 'Galle', 1),
(2, 'COL', 'Colombo', 1),
(3, 'KDY', 'Kandy', 1),
(4, 'KAL', 'Kalutara', 1),
(5, 'MTR', 'Matara', 1),
(6, 'GMP', 'Gampaha', 1),
(7, 'JFN', 'Jafna', 1),
(8, 'NEL', 'NuwaraEliya', 1),
(9, 'AMP', 'Ampara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblhotel`
--

CREATE TABLE IF NOT EXISTS `tblhotel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `City` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `City` (`City`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tblhotel`
--

INSERT INTO `tblhotel` (`ID`, `Name`, `Address`, `City`, `Status`) VALUES
(1, 'Test', 'Test Address', 1, 1),
(2, 'Cinnamon Grand', 'Colombo', 2, 1),
(3, '', '', 3, 1),
(4, 'Test2', '123', 1, 1),
(5, 'New Hotel', 'Colombo 5', 2, 1),
(6, 'Test Hotel 2', 'galle Road', 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblhotel`
--
ALTER TABLE `tblhotel`
  ADD CONSTRAINT `tblhotel_ibfk_1` FOREIGN KEY (`City`) REFERENCES `tblcity` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
