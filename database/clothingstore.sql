-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2026 at 10:36 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothingstore`
--
CREATE DATABASE IF NOT EXISTS `clothingstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `clothingstore`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(100) NOT NULL,
  `adminEmail` varchar(150) NOT NULL,
  `adminPassword` varchar(255) NOT NULL COMMENT 'bcrypt hash via password_hash()',
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `uq_adminEmail` (`adminEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`adminID`, `adminName`, `adminEmail`, `adminPassword`) VALUES
(1, 'Super Admin', 'admin@clothingstore.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(2, 'Store Manager', 'manager@clothingstore.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3, 'Warehouse Admin', 'warehouse@clothingstore.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4, 'Returns Admin', 'returns@clothingstore.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(5, 'Marketing Admin', 'marketing@clothingstore.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

-- --------------------------------------------------------

--
-- Table structure for table `tblaorder`
--

DROP TABLE IF EXISTS `tblaorder`;
CREATE TABLE IF NOT EXISTS `tblaorder` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL COMMENT 'FK → tblUser.userID',
  `clothesID` int(11) NOT NULL COMMENT 'FK → tblClothes.clothesID',
  `orderDate` date NOT NULL,
  `orderQuantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`orderID`),
  KEY `fk_order_user` (`userID`),
  KEY `fk_order_clothes` (`clothesID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblaorder`
--

INSERT INTO `tblaorder` (`orderID`, `userID`, `clothesID`, `orderDate`, `orderQuantity`) VALUES
(1, 1, 1, '2026-01-05', 2),
(2, 1, 3, '2026-01-12', 1),
(3, 2, 5, '2026-01-15', 3),
(4, 2, 7, '2026-01-20', 1),
(5, 3, 2, '2026-01-22', 1),
(6, 3, 10, '2026-01-28', 2),
(7, 4, 4, '2026-02-01', 1),
(8, 4, 9, '2026-02-03', 1),
(9, 5, 6, '2026-02-07', 4),
(10, 5, 11, '2026-02-10', 1),
(11, 1, 13, '2026-02-14', 1),
(12, 2, 15, '2026-02-18', 2),
(13, 3, 17, '2026-02-20', 1),
(14, 4, 19, '2026-02-25', 1),
(15, 5, 21, '2026-03-01', 2),
(16, 1, 23, '2026-03-05', 1),
(17, 2, 25, '2026-03-08', 1),
(18, 3, 27, '2026-03-11', 3),
(19, 4, 29, '2026-03-15', 1),
(20, 5, 8, '2026-03-18', 2),
(21, 1, 14, '2026-03-22', 1),
(22, 2, 16, '2026-03-25', 2),
(23, 3, 18, '2026-03-28', 1),
(24, 4, 20, '2026-04-01', 1),
(25, 5, 22, '2026-04-04', 3),
(26, 1, 24, '2026-04-07', 1),
(27, 2, 26, '2026-04-10', 2),
(28, 3, 28, '2026-04-13', 1),
(29, 4, 30, '2026-04-16', 1),
(30, 5, 12, '2026-04-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblclothes`
--

DROP TABLE IF EXISTS `tblclothes`;
CREATE TABLE IF NOT EXISTS `tblclothes` (
  `clothesID` int(11) NOT NULL AUTO_INCREMENT,
  `clothesName` varchar(150) NOT NULL,
  `clothesDescription` text NOT NULL,
  `clothesPrice` decimal(10,2) NOT NULL,
  `clothesCategory` varchar(80) NOT NULL,
  PRIMARY KEY (`clothesID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblclothes`
--

INSERT INTO `tblclothes` (`clothesID`, `clothesName`, `clothesDescription`, `clothesPrice`, `clothesCategory`) VALUES
(1, 'Classic White Tee', 'A timeless 100% cotton crew-neck t-shirt.', '149.99', 'T-Shirts'),
(2, 'Slim Fit Chinos', 'Smart casual slim-fit chino trousers in khaki.', '399.99', 'Trousers'),
(3, 'Denim Jacket', 'Classic denim jacket with button-front closure.', '699.99', 'Jackets'),
(4, 'Floral Summer Dress', 'Lightweight floral print midi dress for summer.', '549.99', 'Dresses'),
(5, 'Hooded Sweatshirt', 'Comfortable pull-over hoodie in fleece fabric.', '449.99', 'Hoodies'),
(6, 'Leather Belt', 'Genuine leather belt with silver buckle.', '199.99', 'Accessories'),
(7, 'Striped Polo Shirt', 'Short-sleeve polo shirt with contrast stripes.', '299.99', 'Shirts'),
(8, 'Cargo Shorts', 'Multi-pocket cargo shorts in olive green.', '349.99', 'Shorts'),
(9, 'Maxi Skirt', 'Boho-style maxi skirt with elastic waistband.', '429.99', 'Skirts'),
(10, 'Wool Scarf', 'Soft merino wool scarf in charcoal grey.', '249.99', 'Accessories'),
(11, 'Trench Coat', 'Classic double-breasted trench coat in beige.', '1199.99', 'Coats'),
(12, 'Graphic Tee', 'Unisex graphic print t-shirt, crew neck.', '179.99', 'T-Shirts'),
(13, 'High-Rise Jeans', 'High-waisted skinny jeans in dark wash denim.', '599.99', 'Jeans'),
(14, 'Linen Shirt', 'Breathable linen button-up shirt in white.', '329.99', 'Shirts'),
(15, 'Puffer Vest', 'Lightweight quilted puffer vest, water-resistant.', '499.99', 'Jackets'),
(16, 'Wrap Blouse', 'Elegant wrap blouse with ruffle detail.', '369.99', 'Blouses'),
(17, 'Jogger Pants', 'Tapered jogger trousers with drawstring waist.', '379.99', 'Trousers'),
(18, 'Sports Bra', 'High-support sports bra with moisture-wicking fabric.', '269.99', 'Activewear'),
(19, 'Bomber Jacket', 'Satin-finish bomber jacket with ribbed cuffs.', '749.99', 'Jackets'),
(20, 'Knit Beanie', 'Chunky knit beanie hat in navy blue.', '129.99', 'Accessories'),
(21, 'Wide-Leg Trousers', 'Flowing wide-leg trousers in black crepe fabric.', '479.99', 'Trousers'),
(22, 'Off-Shoulder Top', 'Stylish off-shoulder top with gathered hem.', '259.99', 'Tops'),
(23, 'Zip-Up Hoodie', 'Zip-through hoodie in heather grey marl.', '469.99', 'Hoodies'),
(24, 'Pleated Midi Skirt', 'Elegant pleated midi skirt in forest green.', '389.99', 'Skirts'),
(25, 'Oversized Blazer', 'Relaxed-fit oversized blazer in checked pattern.', '899.99', 'Blazers'),
(26, 'Tank Top', 'Essential ribbed tank top, available in 6 colours.', '119.99', 'Tops'),
(27, 'Relaxed Fit Shorts', 'Cotton-linen blend relaxed shorts in cream.', '289.99', 'Shorts'),
(28, 'Turtleneck Sweater', 'Fine-knit roll-neck sweater in burgundy.', '529.99', 'Knitwear'),
(29, 'Slip Dress', 'Satin-look slip dress with lace trim detail.', '489.99', 'Dresses'),
(30, 'Padded Anorak', 'Waterproof padded anorak with adjustable hood.', '849.99', 'Coats');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `userEmail` varchar(150) NOT NULL,
  `userPassword` varchar(255) NOT NULL COMMENT 'bcrypt hash via password_hash()',
  `role` varchar(20) NOT NULL DEFAULT 'customer',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `uq_userEmail` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`userID`, `userName`, `userEmail`, `userPassword`, `role`, `status`) VALUES
(1, 'John Doe', 'j.doe@abc.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(2, 'Jane Smith', 'j.smith@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(3, 'Michael Brown', 'm.brown@outlook.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(4, 'Sarah Johnson', 's.johnson@yahoo.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(5, 'David Williams', 'd.williams@webmail.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(6, 'Emily Clarke', 'e.clarke@icloud.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(7, 'Liam Nkosi', 'l.nkosi@mweb.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(8, 'Aisha Patel', 'a.patel@rediffmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(9, 'Tom Pretorius', 't.pretorius@vodamail.co.za', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending'),
(10, 'Nina van Wyk', 'n.vanwyk@telkomsa.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer', 'pending');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblaorder`
--
ALTER TABLE `tblaorder`
  ADD CONSTRAINT `fk_order_clothes` FOREIGN KEY (`clothesID`) REFERENCES `tblclothes` (`clothesID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`userID`) REFERENCES `tbluser` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
