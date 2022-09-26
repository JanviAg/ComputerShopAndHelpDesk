-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 07:20 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_shop`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `faq report`
-- (See below for the actual view)
--
CREATE TABLE `faq report` (
`faq_id` int(11)
,`user_name` varchar(35)
,`faq_question` varchar(50)
,`faq_answer` varchar(300)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `feedback report`
-- (See below for the actual view)
--
CREATE TABLE `feedback report` (
`feedback_id` int(11)
,`user_name` varchar(35)
,`feedback_rating` int(11)
,`feedback_desc` varchar(300)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order report`
-- (See below for the actual view)
--
CREATE TABLE `order report` (
`order_id` int(11)
,`user_id` int(11)
,`user_name` varchar(35)
,`order_datetime` datetime
,`order_status` varchar(20)
,`order_total` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment report`
-- (See below for the actual view)
--
CREATE TABLE `payment report` (
`payment_id` int(11)
,`order_id` int(11)
,`user_name` varchar(35)
,`payment_datetime` datetime
,`payment_method` varchar(20)
,`order_total` decimal(10,0)
,`payment_status` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product report`
-- (See below for the actual view)
--
CREATE TABLE `product report` (
`product_id` int(11)
,`category_name` varchar(20)
,`product_name` varchar(30)
,`product_price` decimal(10,0)
,`product_qty` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand_mst`
--

CREATE TABLE `tbl_brand_mst` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_brand_mst`
--

INSERT INTO `tbl_brand_mst` (`brand_id`, `brand_name`) VALUES
(1, 'Intel'),
(2, 'Asus'),
(3, 'AMD'),
(4, 'Corsair'),
(5, 'Zotac'),
(6, 'MSI'),
(7, 'Logitech'),
(8, 'BenQ'),
(9, 'Seasonic'),
(10, 'HyperX'),
(11, 'Western Digital');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_mst`
--

CREATE TABLE `tbl_category_mst` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category_mst`
--

INSERT INTO `tbl_category_mst` (`category_id`, `category_name`) VALUES
(1, 'CPU'),
(2, 'Motherboard'),
(3, 'RAM'),
(4, 'HDD'),
(5, 'SSD'),
(6, 'GPU'),
(7, 'Case'),
(8, 'Monitor'),
(9, 'Keyboard'),
(10, 'Mouse'),
(11, 'Headphones');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq_mst`
--

CREATE TABLE `tbl_faq_mst` (
  `faq_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `faq_question` varchar(50) NOT NULL,
  `faq_answer` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_faq_mst`
--

INSERT INTO `tbl_faq_mst` (`faq_id`, `user_id`, `faq_question`, `faq_answer`) VALUES
(1, 3, 'How long does it take to build a PC?', 'It takes about 3-4 hours to build a PC if it is your first time and on your own. If you are experienced you can typically get it done within 1-2 hours, but it also depends on your set up. For example, it might take a little extra time to optimize your cable management.'),
(2, 4, 'Nvidia VS AMD graphics card? Which one is better?', 'Both brands have their pros & cons, and are good for different price points & games. At the end of the day, you’ll get extremely similar performance out of competing cards, so support whichever brand you prefer! Go for the better deal (price vs. performance) and avoid all of the bias!'),
(3, 3, 'How Often Should You Upgrade Your System?', 'The short answer: It varies from person to person.\r\nIt really comes down to personal preference and how important it is to each person to have the latest technology integrated into their setup.'),
(4, 2, 'What tools do you need to build a PC?', 'Almost no tools are actually necessary for most builds, but a screwdriver will be a necessity for standoff screws and mounting other components, like your cooler or your drives. '),
(5, 2, 'Do I have to buy Windows?', 'Windows will provide the best all-around compatibility and support, but you can use Linux if you want. Linux can provide a great gaming experience, and is always getting more and more support, and it\'s open source! :) '),
(6, 4, ' Will antivirus software slow down my computer?', 'Running any program on your computer will slow it down and antivirus software is no exception.'),
(7, 3, ' PC turns on but no display, help!', '1.  Check the power\r\n2.  Confirm the output connection from monitor to the display port\r\n3.  Remove external devices'),
(8, 2, ' How to apply Thermal Compound?', 'Apply a small bead of thermal Paste to one edge of the CPU.\r\nHold a flat-edge at a 45 degree angle to the chip and slowly drag a even layer of paste across the top of the CPU.\r\nThen re-install your heatsink and fan.'),
(9, 2, 'What must I do to fix my PC from slowing down?', 'Defragmentation, updating OS and running an antivirus scan should be able to fix most issues. If not a complete re-installation of OS is recommended.'),
(10, 3, 'Do I need to upgrade my AM3+ motherboard for the n', 'There is no need to upgrade your motherboard. All AM3+ processors, including the new generation is backwards compatible.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback_mst`
--

CREATE TABLE `tbl_feedback_mst` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_rating` int(11) NOT NULL,
  `feedback_desc` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback_mst`
--

INSERT INTO `tbl_feedback_mst` (`feedback_id`, `user_id`, `feedback_rating`, `feedback_desc`) VALUES
(1, 5, 5, 'Beautiful site! Fulfilled all my needs!'),
(2, 9, 2, 'Last time packing was poor and delivery was late. '),
(3, 8, 5, 'Build option is a life saver for someone new like me! Thank you!'),
(4, 7, 4, 'Really easy to use website! Very practical.'),
(5, 10, 3, 'Website is good but packaging was poor! '),
(6, 6, 5, 'Thank you for fast shipping! Received product within 3 days.. :)'),
(7, 4, 4, 'Technicians are really helpful, solved my queries');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_item`
--

CREATE TABLE `tbl_order_item` (
  `orderitem_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_item`
--

INSERT INTO `tbl_order_item` (`orderitem_id`, `order_id`, `product_id`, `product_name`, `product_price`) VALUES
(1, 1, 1, 'Intel Core i7-10700F Processor', '26200'),
(2, 1, 2, 'Asus Prime B460M-A Motherboard', '9400'),
(3, 2, 2, 'Geforce GTX1050Ti', '12999');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_mst`
--

CREATE TABLE `tbl_order_mst` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_datetime` datetime NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `order_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_mst`
--

INSERT INTO `tbl_order_mst` (`order_id`, `user_id`, `order_datetime`, `order_status`, `order_total`) VALUES
(1, 6, '2021-03-08 18:11:37', 'Delivered', '35600'),
(2, 8, '2021-03-09 16:53:00', 'Delivered', '12999'),
(3, 5, '2021-03-09 17:10:33', 'Delivered', '11000'),
(4, 10, '2021-03-10 13:10:54', 'Delivered', '14500'),
(5, 10, '2021-03-10 14:12:05', 'Delivered', '33180'),
(6, 7, '2021-03-11 17:12:42', 'Delivered', '26998'),
(7, 5, '2021-03-11 22:12:42', 'Delivered', '6748'),
(8, 8, '2021-03-12 09:23:52', 'Delivered', '15000'),
(9, 9, '2021-03-12 12:13:52', 'Pending', '23999'),
(10, 6, '2021-03-15 17:15:19', 'Pending', '12999');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_mst`
--

CREATE TABLE `tbl_payment_mst` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_datetime` datetime NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payment_mst`
--

INSERT INTO `tbl_payment_mst` (`payment_id`, `order_id`, `user_id`, `payment_datetime`, `payment_method`, `payment_status`) VALUES
(1, 1, 6, '2021-03-08 19:01:38', 'Credit Card', 'Successful'),
(2, 2, 8, '2021-03-09 16:54:00', 'Debit Card', 'Successful '),
(3, 3, 5, '2021-03-09 17:12:41', 'Net Banking', 'Successful'),
(4, 4, 10, '2021-03-10 13:11:44', 'Debit Card', 'Successful'),
(5, 5, 10, '2021-03-10 14:13:26', 'Debit Card', 'Successful'),
(6, 6, 7, '2021-03-11 17:12:42', 'Credit Card', 'Successful'),
(7, 7, 5, '2021-03-11 22:12:42', 'Net Banking', 'Successful'),
(8, 8, 8, '2021-03-12 09:23:52', 'Debit Card', 'Successful'),
(9, 9, 9, '2021-03-12 12:13:52', 'Net Banking', 'Successful'),
(10, 10, 6, '2021-03-15 17:15:19', 'Credit Card', 'Failure');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_mst`
--

CREATE TABLE `tbl_product_mst` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_mst`
--

INSERT INTO `tbl_product_mst` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_image`, `product_price`, `product_qty`) VALUES
(1, 1, 1, 'Intel Core i5 4570k', 'https://www.dateks.lv/images/pic/2400/2400/218/131.jpg', '23999', 65),
(2, 6, 2, 'Asus Geforce GTX1050Ti', 'https://images-na.ssl-images-amazon.com/images/I/91eoESkNlhL._SX466_.jpg', '12999', 18),
(3, 8, 8, 'BenQ GW Series 27-Inch Screen ', 'https://images-na.ssl-images-amazon.com/images/I/71BuyRgSzdL._SL1280_.jpg', '26998', 18),
(4, 2, 2, 'ASUS ROG Strix X570720', 'https://images-na.ssl-images-amazon.com/images/I/61LJV4NBHvL._SL1001_.jpg', '7999', 8),
(5, 3, 4, 'Corsair Vengance Pro RGB 2x8 1', 'https://images-na.ssl-images-amazon.com/images/I/81CNnjm%2BUwL._SL1500_.jpg', '6748', 15),
(6, 9, 10, 'HyperX Alloy Core RGB Membrane', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6283/6283508_sd.jpg', '11000', 23),
(7, 1, 3, 'AMD Ryzen 5 3600', 'https://images-na.ssl-images-amazon.com/images/I/71WPGXQLcLL._SL1384_.jpg', '33180', 17),
(8, 6, 6, 'MSI GTX 1050 TI ', 'https://images-na.ssl-images-amazon.com/images/I/81jlMszrk2L._SL1500_.jpg', '14500', 40),
(9, 7, 4, 'Corsair 4000D Airflow Cabinet', 'https://images-na.ssl-images-amazon.com/images/I/81hL4tPkXZL._SY355_.jpg', '7100', 7),
(10, 1, 3, ' Amd Ryzen 5 3400G APU', 'https://images-na.ssl-images-amazon.com/images/I/81fbUyjzEmL._SX355_.jpg', '15000', 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ticket_mst`
--

CREATE TABLE `tbl_ticket_mst` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_user_id` int(11) NOT NULL,
  `ticket_query` varchar(250) NOT NULL,
  `ticket_remark` varchar(250) NOT NULL,
  `ticket_datetime` datetime NOT NULL,
  `ticket_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ticket_mst`
--

INSERT INTO `tbl_ticket_mst` (`ticket_id`, `user_id`, `assigned_user_id`, `ticket_query`, `ticket_remark`, `ticket_datetime`, `ticket_status`) VALUES
(1, 5, 2, 'Laptop crashing on opening application, what to do?', 'Re-install application or upgrade RAM.', '2021-03-15 14:47:57', 0),
(2, 6, 4, 'I get a \'no signal input\' message on my monitor, what do I do?', ' Verify that the monitor is properly connected. If so, verify that a cable is not loose by disconnecting all cables that can be disconnected in the back of the monitor (generally the data cable cannot be disconnected). Next, disconnect the data cable', '2021-03-09 14:47:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_mst`
--

CREATE TABLE `tbl_user_mst` (
  `user_id` int(11) NOT NULL,
  `usertype` int(2) NOT NULL COMMENT '1 -> Admin\r\n2 -> Technician\r\n3 -> Normal User',
  `user_name` varchar(35) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_dob` date NOT NULL,
  `user_gender` varchar(1) NOT NULL,
  `user_mobile` bigint(11) NOT NULL,
  `user_address` varchar(250) NOT NULL,
  `isActive` varchar(5) NOT NULL,
  `isApproved` varchar(5) DEFAULT NULL COMMENT 'Only applicable for technician.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_mst`
--

INSERT INTO `tbl_user_mst` (`user_id`, `usertype`, `user_name`, `user_email`, `user_password`, `user_dob`, `user_gender`, `user_mobile`, `user_address`, `isActive`, `isApproved`) VALUES
(1, 1, 'Administrator', 'admin@shophelpdesk.com', 'admin123', '1998-02-21', 'M', 9745653212, 'B-04, Goyal Park Apartment, Vastrapur, Ahmedabad\r\n', 'True', NULL),
(2, 2, 'Rutvik Agrawal', 'rutvik.a@gmail.com', 'rutvik123', '1983-03-01', 'M', 9685741452, 'Shankar Apts, SG Highway, Ahmedabad', 'True', 'True'),
(3, 2, 'Sanjeev Shah', 'sanjeevs@gmail.com', 'sanjeev123', '1990-08-21', 'M', 9485321401, '21, Bhumi Appts, Bapunagar, Ahmedabad', 'True', 'True'),
(4, 2, 'Friya Prajapati', 'pfriya@gmail.com', 'friya123', '1997-10-15', 'F', 9516748421, '105, Rose Tower, Vastral, Ahmeabad', 'True', 'True'),
(5, 3, 'Harsh Mehta', 'harshm@gmail.com', 'harsh123', '1992-09-22', 'M', 7854542101, 'F110, Karunya Apartment, Manekbaug, Ahmedabad - 380002', 'True', NULL),
(6, 3, 'Sucheta Dalal', 'suchetadl@yahoo.in', 'sucheta123', '1988-12-14', 'F', 8741784513, 'A10, Skyline Flats, Satellite, Ahmedabad - 380015', 'True', NULL),
(7, 2, 'Aniket Panchal', 'aniketp99@gmail.com', 'aniket123', '1998-01-24', 'M', 9765421025, 'Zydus Tower, Nr. Sola, Ahmedabad - 380054', 'False', 'False'),
(8, 3, 'Bhumi Jain', 'jainbhumi@yahoo.in', 'bhumi123', '2000-06-12', 'F', 7485963256, '21, Prayag Society, Nikol, Ahmedabad - 380018', 'True', NULL),
(9, 3, 'Rajbeer Chabra', 'craj@yahoo.in', 'rajbeer123', '1991-03-01', 'M', 7485125681, 'Block A, Gokul Society, Maninagar, Ahmedabad - 380006', 'False', NULL),
(10, 3, 'Vraj Nigam', 'vragnigam@rediff.com', 'vrag123', '1997-03-29', 'M', 8796554120, 'Block C, Radhe Apartment, Kankaria, Ahmedabad', 'True', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `technician report`
-- (See below for the actual view)
--
CREATE TABLE `technician report` (
`user_id` int(11)
,`usertype` int(2)
,`user_name` varchar(35)
,`user_email` varchar(40)
,`user_dob` date
,`user_gender` varchar(1)
,`user_mobile` bigint(11)
,`user_address` varchar(250)
,`isApproved` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ticket report`
-- (See below for the actual view)
--
CREATE TABLE `ticket report` (
`ticket_id` int(11)
,`user_name` varchar(35)
,`ticket_query` varchar(250)
,`ticket_remark` varchar(250)
,`ticket_datetime` datetime
,`ticket_status` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user report`
-- (See below for the actual view)
--
CREATE TABLE `user report` (
`user_id` int(11)
,`user_name` varchar(35)
,`user_email` varchar(40)
,`user_dob` date
,`user_gender` varchar(1)
,`user_mobile` bigint(11)
,`user_address` varchar(250)
);

-- --------------------------------------------------------

--
-- Structure for view `faq report`
--
DROP TABLE IF EXISTS `faq report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faq report`  AS SELECT `tbl_faq_mst`.`faq_id` AS `faq_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_faq_mst`.`faq_question` AS `faq_question`, `tbl_faq_mst`.`faq_answer` AS `faq_answer` FROM (`tbl_faq_mst` join `tbl_user_mst` on(`tbl_user_mst`.`user_id` = `tbl_faq_mst`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `feedback report`
--
DROP TABLE IF EXISTS `feedback report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `feedback report`  AS SELECT `tbl_feedback_mst`.`feedback_id` AS `feedback_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_feedback_mst`.`feedback_rating` AS `feedback_rating`, `tbl_feedback_mst`.`feedback_desc` AS `feedback_desc` FROM (`tbl_feedback_mst` join `tbl_user_mst` on(`tbl_feedback_mst`.`user_id` = `tbl_user_mst`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `order report`
--
DROP TABLE IF EXISTS `order report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order report`  AS SELECT `tbl_order_mst`.`order_id` AS `order_id`, `tbl_user_mst`.`user_id` AS `user_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_order_mst`.`order_datetime` AS `order_datetime`, `tbl_order_mst`.`order_status` AS `order_status`, `tbl_order_mst`.`order_total` AS `order_total` FROM (`tbl_order_mst` join `tbl_user_mst` on(`tbl_order_mst`.`user_id` = `tbl_user_mst`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `payment report`
--
DROP TABLE IF EXISTS `payment report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment report`  AS SELECT `tbl_payment_mst`.`payment_id` AS `payment_id`, `tbl_payment_mst`.`order_id` AS `order_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_payment_mst`.`payment_datetime` AS `payment_datetime`, `tbl_payment_mst`.`payment_method` AS `payment_method`, `tbl_order_mst`.`order_total` AS `order_total`, `tbl_payment_mst`.`payment_status` AS `payment_status` FROM ((`tbl_user_mst` join `tbl_payment_mst` on(`tbl_payment_mst`.`user_id` = `tbl_user_mst`.`user_id`)) join `tbl_order_mst` on(`tbl_order_mst`.`order_id` = `tbl_payment_mst`.`order_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `product report`
--
DROP TABLE IF EXISTS `product report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product report`  AS SELECT `tbl_product_mst`.`product_id` AS `product_id`, `tbl_category_mst`.`category_name` AS `category_name`, `tbl_product_mst`.`product_name` AS `product_name`, `tbl_product_mst`.`product_price` AS `product_price`, `tbl_product_mst`.`product_qty` AS `product_qty` FROM (`tbl_product_mst` join `tbl_category_mst` on(`tbl_category_mst`.`category_id` = `tbl_product_mst`.`category_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `technician report`
--
DROP TABLE IF EXISTS `technician report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `technician report`  AS SELECT `tbl_user_mst`.`user_id` AS `user_id`, `tbl_user_mst`.`usertype` AS `usertype`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_user_mst`.`user_email` AS `user_email`, `tbl_user_mst`.`user_dob` AS `user_dob`, `tbl_user_mst`.`user_gender` AS `user_gender`, `tbl_user_mst`.`user_mobile` AS `user_mobile`, `tbl_user_mst`.`user_address` AS `user_address`, `tbl_user_mst`.`isApproved` AS `isApproved` FROM `tbl_user_mst` WHERE `tbl_user_mst`.`usertype` like 2 ;

-- --------------------------------------------------------

--
-- Structure for view `ticket report`
--
DROP TABLE IF EXISTS `ticket report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticket report`  AS SELECT `tbl_ticket_mst`.`ticket_id` AS `ticket_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_ticket_mst`.`ticket_query` AS `ticket_query`, `tbl_ticket_mst`.`ticket_remark` AS `ticket_remark`, `tbl_ticket_mst`.`ticket_datetime` AS `ticket_datetime`, `tbl_ticket_mst`.`ticket_status` AS `ticket_status` FROM (`tbl_user_mst` join `tbl_ticket_mst` on(`tbl_user_mst`.`user_id` = `tbl_ticket_mst`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `user report`
--
DROP TABLE IF EXISTS `user report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user report`  AS SELECT `tbl_user_mst`.`user_id` AS `user_id`, `tbl_user_mst`.`user_name` AS `user_name`, `tbl_user_mst`.`user_email` AS `user_email`, `tbl_user_mst`.`user_dob` AS `user_dob`, `tbl_user_mst`.`user_gender` AS `user_gender`, `tbl_user_mst`.`user_mobile` AS `user_mobile`, `tbl_user_mst`.`user_address` AS `user_address` FROM `tbl_user_mst` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_brand_mst`
--
ALTER TABLE `tbl_brand_mst`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category_mst`
--
ALTER TABLE `tbl_category_mst`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_faq_mst`
--
ALTER TABLE `tbl_faq_mst`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_order_item`
--
ALTER TABLE `tbl_order_item`
  ADD PRIMARY KEY (`orderitem_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_order_mst`
--
ALTER TABLE `tbl_order_mst`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_product_mst`
--
ALTER TABLE `tbl_product_mst`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `tbl_ticket_mst`
--
ALTER TABLE `tbl_ticket_mst`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_user_id` (`assigned_user_id`);

--
-- Indexes for table `tbl_user_mst`
--
ALTER TABLE `tbl_user_mst`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_brand_mst`
--
ALTER TABLE `tbl_brand_mst`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_category_mst`
--
ALTER TABLE `tbl_category_mst`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_faq_mst`
--
ALTER TABLE `tbl_faq_mst`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_order_item`
--
ALTER TABLE `tbl_order_item`
  MODIFY `orderitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order_mst`
--
ALTER TABLE `tbl_order_mst`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_ticket_mst`
--
ALTER TABLE `tbl_ticket_mst`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_mst`
--
ALTER TABLE `tbl_user_mst`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_faq_mst`
--
ALTER TABLE `tbl_faq_mst`
  ADD CONSTRAINT `tbl_faq_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  ADD CONSTRAINT `tbl_feedback_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_order_item`
--
ALTER TABLE `tbl_order_item`
  ADD CONSTRAINT `tbl_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order_mst` (`order_id`),
  ADD CONSTRAINT `tbl_order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product_mst` (`product_id`);

--
-- Constraints for table `tbl_order_mst`
--
ALTER TABLE `tbl_order_mst`
  ADD CONSTRAINT `tbl_order_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  ADD CONSTRAINT `tbl_payment_mst_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order_mst` (`order_id`),
  ADD CONSTRAINT `tbl_payment_mst_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_product_mst`
--
ALTER TABLE `tbl_product_mst`
  ADD CONSTRAINT `tbl_product_mst_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_category_mst` (`category_id`),
  ADD CONSTRAINT `tbl_product_mst_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand_mst` (`brand_id`);

--
-- Constraints for table `tbl_ticket_mst`
--
ALTER TABLE `tbl_ticket_mst`
  ADD CONSTRAINT `tbl_ticket_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`),
  ADD CONSTRAINT `tbl_ticket_mst_ibfk_2` FOREIGN KEY (`assigned_user_id`) REFERENCES `tbl_user_mst` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
