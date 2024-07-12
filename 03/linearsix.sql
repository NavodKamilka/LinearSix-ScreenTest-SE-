-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2024 at 12:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linearsix`
--

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `created`) VALUES
(10, 'Support', '2010-02-02 00:00:00'),
(12, 'Dev team', '2010-02-03 00:00:00'),
(13, 'Apps team', '2011-05-06 00:00:00'),
(14, 'TEST - dev team', '2013-05-06 00:00:00'),
(15, 'Guest', '2014-02-02 00:00:00'),
(16, 'TEST-QA-team', '2014-02-02 00:00:00'),
(17, 'TEST-team', '2011-01-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `groupmembership`
--

CREATE TABLE `groupmembership` (
  `id` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groupmembership`
--

INSERT INTO `groupmembership` (`id`, `userID`, `groupID`, `created`) VALUES
(110, 2, 10, '2010-02-02 00:00:00'),
(112, 3, 15, '2010-02-03 00:00:00'),
(114, 1, 10, '2014-02-02 00:00:00'),
(115, 1, 17, '2011-05-02 00:00:00'),
(117, 4, 12, '2014-07-13 00:00:00'),
(120, 5, 15, '2014-06-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cultureID` int(11) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `isRevokeAccess` bit(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `cultureID`, `deleted`, `country`, `isRevokeAccess`, `created`) VALUES
(1, 'Victor', 'Shevchenko', 'vs@gmail.com', 1033, b'1', 'US', b'0', '2011-04-05 00:00:00'),
(2, 'Oleksandr', 'Petrenko', 'op@gmail.com', 1034, b'0', 'UA', b'0', '2014-05-01 00:00:00'),
(3, 'Victor', 'Tarasenko', 'vt@gmail.com', 1033, b'1', 'US', b'1', '2015-07-03 00:00:00'),
(4, 'Sergiy', 'Ivanenko', 'sergiy@gmail.com', 1046, b'0', 'UA', b'1', '2010-02-02 00:00:00'),
(5, 'Vitalii', 'Danilchenko', 'shumko@gmail.com', 1031, b'0', 'UA', b'1', '2014-05-01 00:00:00'),
(6, 'Joe', 'Dou', 'joe@gmail.com', 1032, b'0', 'US', b'1', '2009-01-01 00:00:00'),
(7, 'Marko', 'Polo', 'marko@gmail.com', 1033, b'1', 'UA', b'1', '2015-07-03 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
