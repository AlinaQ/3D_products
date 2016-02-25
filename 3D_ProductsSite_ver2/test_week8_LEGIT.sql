-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2016 at 11:53 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `state` varchar(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(15,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `state`, `time`, `total`) VALUES
(1, 'cancelled', '2016-02-05 06:36:42', '0.00'),
(2, 'cancelled', '2016-02-05 06:36:42', '0.00'),
(3, 'checked out', '2016-02-05 06:48:59', '0.00'),
(4, 'checked out', '2016-02-05 06:49:42', '0.00'),
(5, 'cancelled', '2016-02-05 08:45:21', '0.00'),
(6, 'cancelled', '2016-02-05 08:47:47', '0.00'),
(7, 'checked out', '2016-02-05 08:51:01', '0.00'),
(8, 'checked out', '2016-02-05 09:31:21', '0.00'),
(9, 'checked out', '2016-02-05 09:48:38', '0.00'),
(10, 'checked out', '2016-02-05 09:50:13', '0.00'),
(11, 'checked out', '2016-02-05 10:21:36', '0.00'),
(12, 'checked out', '2016-02-05 10:24:42', '0.00'),
(13, 'checked out', '2016-02-05 11:23:23', '0.00'),
(14, 'checked out', '2016-02-05 15:35:00', '0.00'),
(15, 'checked out', '2016-02-05 17:50:44', '0.00'),
(16, 'checked out', '2016-02-05 18:12:03', '0.00'),
(17, 'cancelled', '2016-02-05 18:15:08', '1.00'),
(18, 'checked out', '2016-02-05 18:19:03', '0.00'),
(19, 'checked out', '2016-02-05 18:23:48', '0.00'),
(20, 'checked out', '2016-02-05 18:25:28', '0.00'),
(21, 'checked out', '2016-02-05 23:55:09', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `ID` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `SKU` varchar(100) NOT NULL,
  `item_price` decimal(15,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `SKU`, `item_price`, `description`, `img`) VALUES
(41, '1', '45.00', 'Explosion Deco', 'img/products/674x501_287682_133624_1338413387.jpg'),
(43, '3', '244.00', 'Ladies Deluxe', 'img/products/chris-yonge-3d-printing-tex-talk.jpg'),
(44, '2', '344.00', 'Skull Deco', 'img/products/profile_4-3-ratio_1024x1024.jpg'),
(46, '4', '56.00', 'Men''s Bow', 'img/products/monocircus-3d-printed-bow-tie.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(500) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `first_name`, `last_name`, `password`, `type`) VALUES
(1, 'admin', 'Celina', 'Bzong', '12345', 'admin');

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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`ID`) ON UPDATE CASCADE;
