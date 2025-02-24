-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 08:13 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '2025-02-20 19:21:18', '21-02-2025 11:02:31 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Interior', 'Accessories designed to enhance the interior comfort and appearance of the vehicle. This includes seat covers, floor mats, and steering wheel covers that protect your carâ€™s surfaces and add personal style. Items like organizers, pillows, and ambient lighting improve both function and aesthetics.', '2025-02-21 06:14:31', NULL),
(2, 'Exterior', 'These accessories focus on the outer appearance of the car, giving it a custom look. Items such as body decals, spoilers, custom wheels, and bumpers', '2025-02-21 06:17:30', NULL),
(3, 'Car Lighting', 'Includes interior and exterior lighting options like LED kits, underbody neon lights, and ambient dashboard lights. These add style and improve visibility, while also contributing to the mood of your carâ€™s interior, especially at night.', '2025-02-21 06:18:16', NULL),
(4, 'Car Organizational', 'These accessories help keep your car tidy and organized. Seat-back organizers, trunk dividers, and console organizers provide functional storage solutions, while decorative items like dashboard figurines and air fresheners add personality to your space.', '2025-02-21 06:19:14', NULL),
(5, 'Functional & Utility', 'Practical accessories that improve the convenience and utility of your car. This includes items like car covers, roof racks, pet travel accessories, and emergency kits, ensuring your vehicle is equipped for both everyday driving and special circumstances.', '2025-02-21 06:19:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '1', 1, '2025-02-21 07:00:55', 'COD', 'in Process');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'in Process', 'in process order', '2025-02-21 07:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 1, 1, 'Seat Cover Black Red for Hyundai I20', 'PegasusPremium PU Leather Car Seat Cover ', 8999, 18000, '<h1 id="title" class="a-size-large a-spacing-none" style="box-sizing: border-box; padding: 0px; font-weight: 400; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; margin-bottom: 0px !important; font-size: 24px !important; line-height: 32px !important;"><table class="a-normal a-spacing-micro" style="width: 637.688px; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 0px !important;"><tbody style="box-sizing: border-box;"><tr class="a-spacing-small po-fit_type" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Fit Type</span></td><td class="a-span9" style="vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Custom Fit</span></td></tr><tr class="a-spacing-small po-brand" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Brand</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">PegasusPremium</span></td></tr><tr class="a-spacing-small po-color" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Colour</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Black</span></td></tr><tr class="a-spacing-small po-special_feature" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Special Feature</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">UV Resistant, Tear Resistant, Anti-Fungus, Easy to Clean</span></td></tr><tr class="a-spacing-small po-target_audience" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Target Audience</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">General Car Owners</span></td></tr></tbody></table></h1>', 'seat-cover.jpg', 'seat-cover.jpg', 'seat-cover.jpg', 200, 'In Stock', '2025-02-21 06:26:28', NULL),
(2, 1, 2, 'Automaze Interior Car Roof Full Projection Laser USB Atmosphere Ambient Star Light LED (K7 Without Remote', 'JXL', 2899, 3499, '<table class="a-normal a-spacing-micro" style="width: 637.688px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 0px !important;"><tbody style="box-sizing: border-box;"><tr class="a-spacing-small po-item_dimensions" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Item dimensions L x W x H</span></td><td class="a-span9" style="vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">10 x 10 x 4 Centimeters</span></td></tr><tr class="a-spacing-small po-brand" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Brand</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Automaze</span></td></tr><tr class="a-spacing-small po-color" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Colour</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">black</span></td></tr><tr class="a-spacing-small po-auto_part_position" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Auto Part Position</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Front</span></td></tr><tr class="a-spacing-small po-included_components" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Included Components</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">1 X Star light, Installation Accessories</span></td></tr></tbody></table>', '51W8qe1q2ZL.jpg', '61Ud5zF7FIL.jpg', '51QWkfnTfpL.jpg', 200, 'In Stock', '2025-02-21 06:28:48', NULL),
(3, 2, 3, 'Groommm Car Scratch Remover (250ML) with Microfiber Cloth ', 'Swirls Remover Rubbing Compound For Car', 350, 450, '<table class="a-normal a-spacing-micro" style="width: 705.031px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 0px !important;"><tbody style="box-sizing: border-box;"><tr class="a-spacing-small po-material" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 184.562px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Material</span></td><td class="a-span9" style="vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 520.469px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Aluminium Oxide</span></td></tr><tr class="a-spacing-small po-item_dimensions" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 184.562px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Item dimensions L x W x H</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 520.469px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">23 x 10 x 9 Centimeters</span></td></tr><tr class="a-spacing-small po-brand" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 184.562px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Brand</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 520.469px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">GROOMMM</span></td></tr><tr class="a-spacing-small po-grit.type" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 184.562px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Grit Type</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 520.469px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Ultra Fine</span></td></tr><tr class="a-spacing-small po-compatible_material" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 184.562px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Compatible Material</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 520.469px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Chrome</span></td></tr></tbody></table>', '81Qi8Sm81CL._SX522_.jpg', '81enArq-S2L._SX522_.jpg', '91pUNlTnx9L._SX522_.jpg', 122, 'In Stock', '2025-02-21 06:30:40', NULL),
(4, 2, 4, 'Alloy Wheel', 'Bmw ', 70000, 78999, '<table class="a-normal a-spacing-micro" style="width: 637.688px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 0px !important;"><tbody style="box-sizing: border-box;"><tr class="a-spacing-small po-brand" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Brand</span></td><td class="a-span9" style="vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">PRIGAN</span></td></tr><tr class="a-spacing-small po-size" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Size</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">14 Inch</span></td></tr><tr class="a-spacing-small po-color" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Colour</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">multicolor</span></td></tr><tr class="a-spacing-small po-installation_type" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Installation Type</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Press Fitting</span></td></tr><tr class="a-spacing-small po-manufacturer" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Manufacturer</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">PRIGAN, Prigan India Pvt. Ltd. Customer Care no. 9999-135-768. Website- WWW.PriganIndia.com</span></td></tr></tbody></table>', 'rim2.png', 'rim1.png', 'tyre1.png', 1500, 'In Stock', '2025-02-21 06:32:49', NULL),
(5, 1, 1, 'Seat Cover Black Red for Hyundai I20', 'PegasusPremium PU Leather Car Seat Cover ', 8999, 18000, '<h1 id="title" class="a-size-large a-spacing-none" style="box-sizing: border-box; padding: 0px; font-weight: 400; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; margin-bottom: 0px !important; font-size: 24px !important; line-height: 32px !important;"><table class="a-normal a-spacing-micro" style="width: 637.688px; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 0px !important;"><tbody style="box-sizing: border-box;"><tr class="a-spacing-small po-fit_type" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Fit Type</span></td><td class="a-span9" style="vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Custom Fit</span></td></tr><tr class="a-spacing-small po-brand" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Brand</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">PegasusPremium</span></td></tr><tr class="a-spacing-small po-color" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Colour</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">Black</span></td></tr><tr class="a-spacing-small po-special_feature" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Special Feature</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">UV Resistant, Tear Resistant, Anti-Fungus, Easy to Clean</span></td></tr><tr class="a-spacing-small po-target_audience" style="box-sizing: border-box; margin-bottom: 8px !important;"><td class="a-span3" style="vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 166.938px;"><span class="a-size-base a-text-bold" style="box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;">Target Audience</span></td><td class="a-span9" style="vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 470.75px;"><span class="a-size-base po-break-word" style="box-sizing: border-box; word-break: break-word; line-height: 20px !important;">General Car Owners</span></td></tr></tbody></table></h1>', 'seat-cover.jpg', 'seat-cover.jpg', 'seat-cover.jpg', 200, 'In Stock', '2025-02-21 06:44:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Seat Covers', '2025-02-21 06:16:48', NULL),
(2, 1, 'Interior Lights', '2025-02-21 06:17:16', NULL),
(3, 2, 'Body & Paint Accessories', '2025-02-21 06:17:45', NULL),
(4, 2, 'Wheel & Tire Accessories', '2025-02-21 06:17:55', NULL),
(5, 3, 'Interior Lights', '2025-02-21 06:19:59', NULL),
(6, 3, 'Exterior Lights', '2025-02-21 06:20:12', NULL),
(7, 4, 'Trunk Organizers', '2025-02-21 06:20:28', NULL),
(8, 4, 'Seat-back Organizers', '2025-02-21 06:20:35', NULL),
(9, 5, 'Roof Racks & Bars', '2025-02-21 06:20:59', NULL),
(10, 5, 'Car Covers', '2025-02-21 06:21:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'bmehta@gmail.com', 0x3a3a3100000000000000000000000000, '2025-02-21 06:59:47', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'B Mehta', 'bmehta@gmail.com', 9096726519, '202cb962ac59075b964b07152d234b70', 'Shivajinagar Modern college', 'Maharashtra', 'PUNE', 412208, 'Shivajinagar Modern college', 'Maharashtra', 'PUNE', 412208, '2025-02-21 06:59:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
