-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 05, 2016 at 05:53 PM
-- Server version: 5.5.41-log
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`ID` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(15,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `state`, `time`, `total`) VALUES
(1, 'cancelled', '2016-02-05 06:36:42', 0.00),
(2, 'cancelled', '2016-02-05 06:36:42', 0.00),
(3, 'checked out', '2016-02-05 06:48:59', 0.00),
(4, 'checked out', '2016-02-05 06:49:42', 0.00),
(5, 'cancelled', '2016-02-05 08:45:21', 0.00),
(6, 'cancelled', '2016-02-05 08:47:47', 0.00),
(7, 'checked out', '2016-02-05 08:51:01', 0.00),
(8, 'checked out', '2016-02-05 09:31:21', 0.00),
(9, 'checked out', '2016-02-05 09:48:38', 0.00),
(10, 'checked out', '2016-02-05 09:50:13', 0.00),
(11, 'checked out', '2016-02-05 10:21:36', 0.00),
(12, 'checked out', '2016-02-05 10:24:42', 0.00),
(13, 'checked out', '2016-02-05 11:23:23', 0.00),
(14, 'checked out', '2016-02-05 15:35:00', 0.00),
(15, 'checked out', '2016-02-05 17:50:44', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE IF NOT EXISTS `cart_product` (
`ID` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`ID`, `product_id`, `cart_id`, `quantity`, `time`) VALUES
(1, 1, 1, 0, '2016-02-05 06:37:03'),
(2, 2, 1, 0, '2016-02-05 06:37:03'),
(3, 1, 2, 0, '2016-02-05 06:37:03'),
(4, 2, 2, 0, '2016-02-05 06:37:03'),
(5, 1, 3, 1, '2016-02-05 06:49:08'),
(6, 1, 4, 3, '2016-02-05 06:49:49'),
(7, 2, 4, 2, '2016-02-05 06:49:49'),
(8, 3, 4, 2, '2016-02-05 06:49:49'),
(9, 4, 4, 1, '2016-02-05 06:49:49'),
(10, 3, 4, 2, '2016-02-05 06:49:49'),
(11, 4, 4, 1, '2016-02-05 06:49:49'),
(12, 2, 7, 1, '2016-02-05 08:51:29'),
(13, 3, 7, 1, '2016-02-05 08:51:29'),
(14, 4, 7, 1, '2016-02-05 08:51:29'),
(15, 1, 9, 3, '2016-02-05 09:49:37'),
(16, 2, 9, 2, '2016-02-05 09:49:38'),
(17, 3, 9, 3, '2016-02-05 09:49:39'),
(18, 4, 9, 1, '2016-02-05 09:49:39'),
(19, 1, 10, 1, '2016-02-05 09:50:25'),
(20, 2, 10, 3, '2016-02-05 09:50:25'),
(21, 3, 10, 2, '2016-02-05 09:50:25'),
(22, 4, 10, 1, '2016-02-05 09:50:25'),
(23, 1, 11, 1, '2016-02-05 10:21:45'),
(24, 2, 11, 1, '2016-02-05 10:21:45'),
(25, 3, 11, 1, '2016-02-05 10:21:45'),
(26, 1, 12, 1, '2016-02-05 11:00:09'),
(27, 2, 12, 3, '2016-02-05 11:00:09'),
(28, 3, 12, 2, '2016-02-05 11:00:09'),
(29, 4, 12, 2, '2016-02-05 11:00:09'),
(30, 1, 13, 2, '2016-02-05 11:24:31'),
(31, 2, 13, 2, '2016-02-05 11:24:31'),
(32, 3, 13, 1, '2016-02-05 11:24:31'),
(33, 4, 13, 4, '2016-02-05 11:24:31'),
(34, 1, 14, 1, '2016-02-05 15:35:50'),
(35, 2, 14, 3, '2016-02-05 15:35:50'),
(36, 3, 14, 2, '2016-02-05 15:35:50'),
(37, 4, 14, 2, '2016-02-05 15:35:50'),
(38, 1, 15, 2, '2016-02-05 17:50:59'),
(39, 2, 15, 1, '2016-02-05 17:50:59'),
(40, 3, 15, 2, '2016-02-05 17:50:59'),
(41, 4, 15, 3, '2016-02-05 17:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`ID` int(11) NOT NULL,
  `SKU` varchar(100) NOT NULL,
  `item_price` decimal(15,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `SKU`, `item_price`, `description`, `img`) VALUES
(1, 'sk-2843y', 14.99, 'Explosion Deco', 'img/products/674x501_287682_133624_1338413387.jpg'),
(2, 'sk-327623z', 3.99, 'Ladies Deluxe', 'img/products/chris-yonge-3d-printing-tex-talk.jpg'),
(3, 'sk-438s3x', 1.99, 'Men''s Bow', 'img/products/monocircus-3d-printed-bow-tie.jpg'),
(4, 'sk-yx28s9', 2.99, 'Skull Deco', 'img/products/profile_4-3-ratio_1024x1024.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
 ADD PRIMARY KEY (`ID`), ADD KEY `product_id` (`product_id`), ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`ID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
