-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 10:28 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl-admin`
--

CREATE TABLE `tbl-admin` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `User_Name` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl-category`
--

CREATE TABLE `tbl-category` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Image_name` varchar(255) NOT NULL,
  `Featured` varchar(10) NOT NULL,
  `Active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl-food`
--

CREATE TABLE `tbl-food` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Image_name` varchar(255) NOT NULL,
  `Category_id` int(10) UNSIGNED NOT NULL,
  `Featured` varchar(10) NOT NULL,
  `Active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl-order`
--

CREATE TABLE `tbl-order` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Food` varchar(150) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Order_date` datetime NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Customer_name` varchar(150) NOT NULL,
  `Customer_contact` varchar(20) NOT NULL,
  `Customer_email` varchar(150) NOT NULL,
  `Customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl-admin`
--
ALTER TABLE `tbl-admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl-category`
--
ALTER TABLE `tbl-category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl-food`
--
ALTER TABLE `tbl-food`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl-order`
--
ALTER TABLE `tbl-order`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl-admin`
--
ALTER TABLE `tbl-admin`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl-category`
--
ALTER TABLE `tbl-category`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl-food`
--
ALTER TABLE `tbl-food`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl-order`
--
ALTER TABLE `tbl-order`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
