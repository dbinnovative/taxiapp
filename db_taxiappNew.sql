-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2017 at 10:35 AM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_taxiappNew`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(20) NOT NULL AUTO_INCREMENT,
  `slave_id` int(20) NOT NULL,
  `mas_id` int(20) NOT NULL,
  `created_dt` datetime NOT NULL,
  `accepted_dt` datetime DEFAULT NULL,
  `arrive_dt` datetime DEFAULT NULL COMMENT 'Arrived data time of driver',
  `start_dt` datetime DEFAULT NULL COMMENT 'Journey start dt',
  `complete_dt` datetime DEFAULT NULL COMMENT 'Complete date time',
  `last_modified_dt` datetime NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '1 - request, 2 - driver acpt, 3 - driver rjct, 4 - pat cncld, 5- driver cancelled, 6 - driver on way, 7 - driver arrived, 8 - jrney start, 9 - Jrney cmplt, 10 - Expired',
  `cancel_status` tinyint(2) DEFAULT NULL COMMENT '1-> before assign, 2-> after assign with in 5 min, 3-> after assign and 5 min, 4-> Passenger not came, 5-> Address wrong, 6-> Passenger asked to cancel, 7-> Dont charge customer, 8->Others',
  `cancel_dt` datetime DEFAULT NULL COMMENT 'cancel datetime',
  `appointment_dt` datetime NOT NULL,
  `appt_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-> Now, 2-> Later',
  `duration` float DEFAULT NULL COMMENT 'duration in mts',
  `waiting_mts` int(10) NOT NULL DEFAULT '0' COMMENT 'waiting time in minutes',
  `distance_in_mts` bigint(25) DEFAULT NULL COMMENT 'journey distance in meters',
  `google_distance` int(11) NOT NULL DEFAULT '0' COMMENT 'google calculated distance',
  `server_distance` int(11) NOT NULL DEFAULT '0' COMMENT 'server calculated distance from booking route',
  `app_distance` int(11) NOT NULL DEFAULT '0' COMMENT 'App calculated distance',
  `car_id` int(15) NOT NULL COMMENT 'Car id for booking',
  `type_id` int(5) DEFAULT NULL COMMENT 'type of workplace',
  `address_line1` varchar(500) NOT NULL,
  `address_line2` varchar(300) DEFAULT NULL,
  `user_device` varchar(200) DEFAULT NULL COMMENT 'Device that booking is done',
  `appt_lat` float DEFAULT NULL COMMENT 'latitude of appointment address',
  `appt_long` float DEFAULT NULL COMMENT 'longitude of appointment address',
  `drop_addr1` varchar(500) DEFAULT NULL,
  `drop_addr2` varchar(150) DEFAULT NULL,
  `drop_lat` double DEFAULT NULL,
  `drop_long` double DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT NULL,
  `payment_status` tinyint(2) DEFAULT NULL COMMENT '1->Paid,2->reported,3->Closed',
  `payment_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 -> Card, 2 -> Cash',
  `apprxAmt` float DEFAULT NULL COMMENT 'Approximate amount calculated for server',
  `amount` float NOT NULL,
  `master_tip` float NOT NULL DEFAULT '0' COMMENT 'Tip amount for master',
  `meter_fee` float NOT NULL DEFAULT '0',
  `toll_fee` float NOT NULL DEFAULT '0',
  `airport_fee` float NOT NULL DEFAULT '0',
  `parking_fee` float NOT NULL DEFAULT '0',
  `tip_amount` float NOT NULL DEFAULT '0',
  `tip_percent` int(3) NOT NULL DEFAULT '0' COMMENT 'Tip percentage',
  `coupon_code` varchar(30) DEFAULT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `B_type` tinyint(2) DEFAULT NULL COMMENT 'Booking type for dispatcher',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Transaction id from stripe to master',
  `cancel_amt` double DEFAULT '0' COMMENT 'Cancel Amount',
  `app_commission` double NOT NULL DEFAULT '0',
  `pg_commission` double NOT NULL DEFAULT '0',
  `mas_earning` double NOT NULL DEFAULT '0',
  `app_owner_pl` double NOT NULL DEFAULT '0' COMMENT 'app owner profit or loss',
  `settled_flag` tinyint(2) NOT NULL DEFAULT '0',
  `surge` int(1) DEFAULT '1' COMMENT '1 - default, > 1  actual surg price',
  `deviceType` int(1) DEFAULT '0' COMMENT '1- android 2- ios',
  `wallet_settled` int(1) DEFAULT '0',
  `wallet` int(1) DEFAULT '0' COMMENT '0- not wallet, 1- wallet',
  `mongoId` varchar(500) DEFAULT NULL,
  `cashCollected` double DEFAULT '0',
  `cycle_id` int(11) DEFAULT NULL,
  `BuildAmout` double DEFAULT NULL,
  `extra_notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`slave_id`,`mas_id`,`status`),
  KEY `status` (`status`),
  KEY `mas_id` (`mas_id`),
  KEY `slave_id` (`slave_id`),
  KEY `status_2` (`status`),
  KEY `appointment_dt` (`appointment_dt`),
  KEY `appointment_id` (`appointment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='appointment data' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `slave_id`, `mas_id`, `created_dt`, `accepted_dt`, `arrive_dt`, `start_dt`, `complete_dt`, `last_modified_dt`, `status`, `cancel_status`, `cancel_dt`, `appointment_dt`, `appt_type`, `duration`, `waiting_mts`, `distance_in_mts`, `google_distance`, `server_distance`, `app_distance`, `car_id`, `type_id`, `address_line1`, `address_line2`, `user_device`, `appt_lat`, `appt_long`, `drop_addr1`, `drop_addr2`, `drop_lat`, `drop_long`, `zipcode`, `payment_status`, `payment_type`, `apprxAmt`, `amount`, `master_tip`, `meter_fee`, `toll_fee`, `airport_fee`, `parking_fee`, `tip_amount`, `tip_percent`, `coupon_code`, `discount`, `B_type`, `txn_id`, `cancel_amt`, `app_commission`, `pg_commission`, `mas_earning`, `app_owner_pl`, `settled_flag`, `surge`, `deviceType`, `wallet_settled`, `wallet`, `mongoId`, `cashCollected`, `cycle_id`, `BuildAmout`, `extra_notes`) VALUES
(1, 1, 4, '2017-02-24 14:45:26', NULL, NULL, NULL, NULL, '2017-02-24 14:45:55', 9, NULL, NULL, '2017-02-24 14:45:26', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0289, 13.0289, '10th Cross Street, Bengaluru, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.35, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.24, 0, 9.87, 2.49, 1, 1, 0, 0, 0, '21', 0, 1, 12.35, NULL),
(2, 1, 4, '2017-02-24 14:47:49', NULL, NULL, NULL, NULL, '2017-02-24 14:48:15', 9, NULL, NULL, '2017-02-24 14:47:49', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '10th Cross Street, Bengaluru, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.25, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.23, 0, 9.78, 2.48, 1, 1, 0, 0, 0, '23', 0, 1, 12.25, NULL),
(3, 1, 3, '2017-02-24 14:55:17', NULL, NULL, NULL, NULL, '2017-02-24 14:55:41', 9, NULL, NULL, '2017-02-24 14:55:17', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '46 1st Main Road, Bengaluru, RBI Colony, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.28, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.23, 0, 9.8, 2.48, 1, 1, 0, 0, 0, '27', 0, 1, 12.28, NULL),
(4, 4, 6, '2017-02-28 11:47:23', NULL, NULL, NULL, NULL, '2017-02-28 11:51:14', 9, NULL, NULL, '2017-02-28 11:47:23', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '10th Cross Street, Bangalore, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.25, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.23, 0, 9.78, 2.48, 0, 1, 0, 0, 0, '40', 0, NULL, 12.25, NULL),
(5, 4, 5, '2017-02-28 11:53:34', NULL, NULL, NULL, NULL, '2017-02-28 11:56:35', 9, NULL, NULL, '2017-02-28 11:53:34', 1, 2, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '10th Cross Street, Bengaluru, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 18.26, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.83, 0, 15.18, 3.08, 0, 1, 0, 0, 0, '42', 0, NULL, 18.26, NULL),
(6, 1, 4, '2017-02-28 15:45:19', NULL, NULL, NULL, NULL, '2017-02-28 15:46:38', 9, NULL, NULL, '2017-02-28 15:45:19', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '10th Cross Street, Bengaluru, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.25, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.23, 0, 9.78, 2.48, 0, 1, 0, 0, 0, '65', 0, NULL, 12.25, NULL),
(7, 1, 4, '2017-03-01 04:07:08', NULL, NULL, NULL, NULL, '2017-03-01 04:08:36', 9, NULL, NULL, '2017-03-01 04:07:08', 1, 1, 0, NULL, 0, 0, 0, 0, 1, '10th Cross Street, RBI Colony, Ganga Nagar', NULL, NULL, 13.0287, 13.0287, '10th Cross Street, Bengaluru, Ganga Nagar, Karnataka-560024', NULL, NULL, NULL, NULL, 1, 2, NULL, 12.25, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '', 0, 1.23, 0, 9.78, 2.48, 0, 1, 0, 0, 0, '92', 0, NULL, 12.25, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cardMapping`
--

DROP TABLE IF EXISTS `cardMapping`;
CREATE TABLE IF NOT EXISTS `cardMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slave_id` int(11) DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `merchant_reference` varchar(1000) DEFAULT NULL,
  `lastDegit` varchar(1000) DEFAULT NULL,
  `expiryDate` varchar(1000) DEFAULT NULL,
  `Status` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `City_Id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'City Id',
  `Country_Id` int(6) NOT NULL COMMENT 'Country Id',
  `City_Name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'City Name',
  `Currency` varchar(15) NOT NULL DEFAULT 'USD' COMMENT 'Currency in 3 char',
  PRIMARY KEY (`City_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Cities in all states around all the countries' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`City_Id`, `Country_Id`, `City_Name`, `Currency`) VALUES
(1, 1, 'Bangalore', 'INR'),
(2, 2, 'Toronto', 'CAD');

-- --------------------------------------------------------

--
-- Table structure for table `city_available`
--

DROP TABLE IF EXISTS `city_available`;
CREATE TABLE IF NOT EXISTS `city_available` (
  `City_Id` int(8) NOT NULL COMMENT 'City Id',
  `Country_Id` int(6) NOT NULL COMMENT 'Country Id',
  `City_Name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'City Name',
  `City_Lat` varchar(50) DEFAULT NULL,
  `City_Long` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`City_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cities in all states around all the countries';

--
-- Dumping data for table `city_available`
--

INSERT INTO `city_available` (`City_Id`, `Country_Id`, `City_Name`, `City_Lat`, `City_Long`) VALUES
(1, 1, 'Bangalore', '12.971599', '77.594563');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colorname` varchar(400) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `colorname`) VALUES
(1, 'WHITE'),
(2, 'SILVER'),
(3, 'GRAY'),
(4, 'BLACK'),
(5, 'RED'),
(6, 'MAROON'),
(7, 'YELLOW'),
(8, 'Reed'),
(9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
CREATE TABLE IF NOT EXISTS `company_info` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `addressline1` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `state` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `postcode` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `vat_number` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `creat_dt` datetime DEFAULT NULL,
  `userame` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Status` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `acc_type` int(11) DEFAULT '2',
  `national_id` varchar(45) DEFAULT NULL,
  `comm_licence` varchar(45) DEFAULT NULL,
  `bank_de1` varchar(45) DEFAULT NULL,
  `bank_de2` varchar(45) DEFAULT NULL,
  `reset_link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`company_id`, `companyname`, `addressline1`, `city`, `state`, `postcode`, `vat_number`, `firstname`, `lastname`, `email`, `mobile`, `creat_dt`, `userame`, `password`, `Status`, `logo`, `acc_type`, `national_id`, `comm_licence`, `bank_de1`, `bank_de2`, `reset_link`) VALUES
(1, '3Embed', 'Bangalore, Karnataka, India', '0', 'Karnataka', '560032', '13757939015168.png', 'Admin', 'Admin', 'superadmin@gmail.com', '78788778788', '2017-02-21 08:40:16', '0', '3Embed', '3', '13098902792880.png', 2, '13377096412672.png', '10995342480656.png', '0', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Country_Id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'Country Id',
  `Country_Name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Country name',
  PRIMARY KEY (`Country_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Country table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Country_Id`, `Country_Name`) VALUES
(1, 'INDIA'),
(2, 'CANADA');

-- --------------------------------------------------------

--
-- Table structure for table `CustomerFrouds`
--

DROP TABLE IF EXISTS `CustomerFrouds`;
CREATE TABLE IF NOT EXISTS `CustomerFrouds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `mas_id` int(11) DEFAULT NULL,
  `slave_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `mongoId` int(11) DEFAULT NULL,
  `totalamt` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerWallet`
--

DROP TABLE IF EXISTS `CustomerWallet`;
CREATE TABLE IF NOT EXISTS `CustomerWallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slave_id` int(11) DEFAULT '0',
  `CreditedDate` datetime DEFAULT NULL,
  `CreditedAmount` double DEFAULT NULL,
  `creditedBy` int(4) DEFAULT '1' COMMENT '1- customer, 2- admin, 3- promo code',
  `CityId` int(11) DEFAULT NULL,
  `TransactionType` int(1) DEFAULT NULL COMMENT '( 1-Credit / 2-Debit )',
  `txn_id` varchar(500) DEFAULT NULL COMMENT ', Payment Gateway Transaction Id',
  `PaymentMethod` varchar(500) DEFAULT NULL COMMENT 'payment getway like stripe,paypal,hyperpay etc.',
  `OpeningBalance` double DEFAULT '0',
  `ClosingBalance` double DEFAULT '0',
  `pgcommission` double DEFAULT '0',
  `CouponCode` varchar(500) DEFAULT NULL,
  `exiryDate` timestamp NULL DEFAULT NULL,
  `ExtraNotes` varchar(1000) DEFAULT NULL,
  `Source` varchar(500) DEFAULT NULL COMMENT '1- Admin, 2- referal, 3- promotion ',
  `Reason` varchar(500) DEFAULT NULL,
  `intiated_by` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dev_type`
--

DROP TABLE IF EXISTS `dev_type`;
CREATE TABLE IF NOT EXISTS `dev_type` (
  `dev_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Device type id',
  `name` varchar(100) NOT NULL COMMENT 'Name of the device',
  PRIMARY KEY (`dev_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores device types which the appl can allow' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dev_type`
--

INSERT INTO `dev_type` (`dev_id`, `name`) VALUES
(1, 'Apple'),
(2, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher`
--

DROP TABLE IF EXISTS `dispatcher`;
CREATE TABLE IF NOT EXISTS `dispatcher` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_name` varchar(150) NOT NULL,
  `dis_email` varchar(150) NOT NULL,
  `dis_pass` varchar(150) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `city` int(12) NOT NULL,
  PRIMARY KEY (`dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `docdetail`
--

DROP TABLE IF EXISTS `docdetail`;
CREATE TABLE IF NOT EXISTS `docdetail` (
  `doc_ids` int(11) NOT NULL AUTO_INCREMENT,
  `driverid` int(11) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `doctype` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_ids`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `docdetail`
--

INSERT INTO `docdetail` (`doc_ids`, `driverid`, `url`, `expirydate`, `doctype`) VALUES
(1, 1, '6395498720946.png', '2017-06-21', 1),
(2, 1, '10897191935550.png', NULL, 2),
(3, 1, '9314309721294.png', NULL, 3),
(4, 2, '4986078388248.jpg', '2014-01-01', 1),
(5, 2, '13139975603288.jpg', NULL, 2),
(6, 2, '9481137418656.jpg', NULL, 3),
(7, 3, '13898881317056.jpg', '1970-07-23', 1),
(8, 3, '3083019172352.jpg', NULL, 2),
(9, 3, '11783025495104.jpg', NULL, 3),
(10, 4, '3129145723074.jpg', '2010-11-25', 1),
(11, 4, '11169993791306.jpg', NULL, 2),
(12, 4, '', NULL, 3),
(13, 5, '1680269023200.png', '2017-06-21', 1),
(14, 5, '13583538861600.png', NULL, 2),
(15, 5, '6225478586400.png', NULL, 3),
(16, 6, '10690327328989.png', '2017-05-25', 1),
(17, 6, '14522652662714.png', NULL, 2),
(18, 6, '14591113620132.png', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `DriverNotification`
--

DROP TABLE IF EXISTS `DriverNotification`;
CREATE TABLE IF NOT EXISTS `DriverNotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` int(11) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `NumOfDriver` int(11) DEFAULT NULL,
  `user_type` int(2) DEFAULT '1' COMMENT '1- driver 2- passenger',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `DriverRecharge`
--

DROP TABLE IF EXISTS `DriverRecharge`;
CREATE TABLE IF NOT EXISTS `DriverRecharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mas_id` int(11) NOT NULL,
  `RechargeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RechargeAmount` double NOT NULL,
  `cycle_id` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `DriverRecharge`
--

INSERT INTO `DriverRecharge` (`id`, `mas_id`, `RechargeDate`, `RechargeAmount`, `cycle_id`) VALUES
(1, 3, '2017-03-03 11:20:34', 9.8, 1),
(2, 4, '2017-03-03 11:20:34', 19.65, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DriverTxn`
--

DROP TABLE IF EXISTS `DriverTxn`;
CREATE TABLE IF NOT EXISTS `DriverTxn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mas_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `Bonusstatus` int(11) DEFAULT '0' COMMENT '0) Last Cycle Adjustment\n1) gaurantee\n2) bounus\n4) Adjustment(superadmin)',
  `gauranteeId` varchar(500) DEFAULT NULL,
  `paymentCycleId` int(11) DEFAULT NULL,
  `acceptance_rate` varchar(45) DEFAULT '0',
  `average_rate` varchar(45) DEFAULT '0',
  `active_time` int(11) DEFAULT '0',
  `masEarning` double DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `numoftrips` int(11) DEFAULT NULL,
  `settled_flag` int(11) DEFAULT '0',
  `reason` varchar(500) DEFAULT NULL,
  `addedBy` varchar(500) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
CREATE TABLE IF NOT EXISTS `master` (
  `mas_id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(150) NOT NULL,
  `type_id` int(3) DEFAULT NULL COMMENT 'type of speciality',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - signed up, 2 - under verification, 3 - active, 4 - rejected, 5 - inactive',
  `mobile` varchar(30) NOT NULL,
  `about` varchar(600) DEFAULT NULL COMMENT 'about doctor',
  `expertise` varchar(1000) DEFAULT NULL COMMENT 'Doc expertise',
  `zipcode` varchar(20) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `last_active_dt` datetime NOT NULL,
  `profile_pic` varchar(500) DEFAULT NULL,
  `stripe_id` varchar(40) DEFAULT NULL COMMENT 'Stripe id for transactions',
  `stoken` varchar(50) DEFAULT NULL COMMENT 'Stripe token',
  `license_type` tinyint(1) DEFAULT NULL,
  `license_num` varchar(100) DEFAULT NULL,
  `license_exp` date DEFAULT NULL,
  `license_pic` varchar(500) DEFAULT NULL,
  `tax_num` varchar(30) DEFAULT NULL COMMENT 'tax number',
  `personal_description` varchar(1000) DEFAULT NULL,
  `insurance_carrier` varchar(250) DEFAULT NULL,
  `certification_board` varchar(250) DEFAULT NULL,
  `board_certification_expiry_dt` datetime DEFAULT NULL,
  `subscription_type` tinyint(1) DEFAULT NULL,
  `subscription_expiry` datetime DEFAULT NULL,
  `workplace_id` int(20) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `resetData` varchar(50) DEFAULT NULL COMMENT 'reset password link',
  `resetFlag` tinyint(1) DEFAULT NULL COMMENT '1-> reset link not used',
  `company_id` int(11) DEFAULT NULL,
  `lang` bigint(1) DEFAULT NULL,
  `vehicle_id` varchar(45) DEFAULT NULL,
  `account_type` int(5) DEFAULT '2' COMMENT '1 - Freelancer,\n2 - Owned',
  `pre_con` varchar(45) DEFAULT NULL COMMENT 'prefix contry',
  `nationalid` varchar(45) DEFAULT NULL,
  `cashBooking` int(1) DEFAULT NULL COMMENT '0-Enable, 1-Disable',
  `blockUnblocktime` datetime DEFAULT NULL,
  `reject_reason` varchar(500) DEFAULT NULL,
  `reject_by` varchar(45) DEFAULT NULL,
  `reject_time` datetime DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` int(11) DEFAULT '0',
  PRIMARY KEY (`mas_id`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Master data table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `master`
--

INSERT INTO `master` (`mas_id`, `first_name`, `last_name`, `email`, `password`, `type_id`, `status`, `mobile`, `about`, `expertise`, `zipcode`, `created_dt`, `last_active_dt`, `profile_pic`, `stripe_id`, `stoken`, `license_type`, `license_num`, `license_exp`, `license_pic`, `tax_num`, `personal_description`, `insurance_carrier`, `certification_board`, `board_certification_expiry_dt`, `subscription_type`, `subscription_expiry`, `workplace_id`, `latitude`, `longitude`, `resetData`, `resetFlag`, `company_id`, `lang`, `vehicle_id`, `account_type`, `pre_con`, `nationalid`, `cashBooking`, `blockUnblocktime`, `reject_reason`, `reject_by`, `reject_time`, `dob`, `gender`) VALUES
(1, 'Admin', '', '', 'b0baee9d279d34fa1dfd71aadb908c3f', 1, 3, '07676989677', NULL, NULL, '0', '2017-02-21 10:00:54', '0000-00-00 00:00:00', '8518405600404.png', NULL, NULL, NULL, NULL, NULL, '6395498720946.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2016-06-14', 0),
(2, 'Dhruv', 'Govila', 'dhruv@mobifyi.com', '6693442136882b89d4f725317c873dfe', 1, 3, '9990967714', NULL, NULL, '0', '2017-02-24 11:57:54', '2017-02-24 13:40:51', '9890320216856.jpg', NULL, NULL, NULL, NULL, NULL, '4986078388248.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2014-07-01', 0),
(3, 'D', 'G', 'd@g.c', '81dc9bdb52d04dc20036dbd8313ed055', 1, 3, '1231231233', NULL, NULL, '0', '2017-02-24 13:40:16', '2017-02-27 15:04:08', '4597745773440.jpg', NULL, NULL, NULL, NULL, NULL, '13898881317056.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '1910-06-21', 0),
(4, 'First', 'Last', 'first@last.com', '6693442136882b89d4f725317c873dfe', 1, 3, '986532741', NULL, NULL, '0', '2017-02-24 13:42:38', '2017-03-01 07:03:55', '2574142701340.jpg', NULL, NULL, NULL, NULL, NULL, '3129145723074.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '1990-11-29', 0),
(5, 'testing', 'test', 'sahu@mobifyi.com', '6693442136882b89d4f725317c873dfe', 1, 3, '7676989677', NULL, NULL, '0', '2017-02-28 11:20:00', '2017-03-03 18:25:25', '6043908328800.png', NULL, NULL, NULL, NULL, NULL, '1680269023200.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2016-10-12', 0),
(6, 'Devraj', '', 'devraj@mobifyi.com', '6693442136882b89d4f725317c873dfe', 1, 3, '7676989688', NULL, NULL, '0', '2017-02-28 11:34:43', '2017-03-01 05:55:59', '8893971337608.png', NULL, NULL, NULL, NULL, NULL, '10690327328989.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2016-10-21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_ratings`
--

DROP TABLE IF EXISTS `master_ratings`;
CREATE TABLE IF NOT EXISTS `master_ratings` (
  `mas_id` int(20) NOT NULL,
  `slave_id` int(20) NOT NULL COMMENT 'Patient who given review',
  `review_dt` datetime NOT NULL,
  `star_rating` float NOT NULL,
  `review` varchar(2000) CHARACTER SET ucs2 DEFAULT NULL,
  `appointment_id` int(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - inactive',
  `positive_review` varchar(1000) DEFAULT NULL,
  KEY `doc_id` (`mas_id`,`star_rating`,`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='doctor ratings';

--
-- Dumping data for table `master_ratings`
--

INSERT INTO `master_ratings` (`mas_id`, `slave_id`, `review_dt`, `star_rating`, `review`, `appointment_id`, `status`, `positive_review`) VALUES
(4, 1, '2017-02-24 14:46:13', 0, '', 21, 1, ''),
(4, 1, '2017-02-24 14:46:18', 0, '', 21, 1, ''),
(4, 1, '2017-02-24 14:48:31', 0, '', 23, 1, ''),
(3, 1, '2017-02-24 14:55:50', 0, '', 27, 1, ''),
(6, 4, '2017-02-28 11:52:04', 3, '', 40, 1, ''),
(5, 4, '2017-02-28 12:07:53', 4, '', 42, 1, ''),
(4, 1, '2017-02-28 15:46:57', 0, '', 65, 1, ''),
(4, 1, '2017-03-01 04:08:50', 0, '', 92, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
CREATE TABLE IF NOT EXISTS `notification_types` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_rating`
--

DROP TABLE IF EXISTS `passenger_rating`;
CREATE TABLE IF NOT EXISTS `passenger_rating` (
  `mas_id` int(11) NOT NULL,
  `slave_id` int(11) NOT NULL,
  `appointment_id` int(15) DEFAULT NULL COMMENT 'Appointment id',
  `rating` float NOT NULL,
  `status` int(11) NOT NULL COMMENT '1-activate,2-Deactivate',
  `rating_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentCycle`
--

DROP TABLE IF EXISTS `paymentCycle`;
CREATE TABLE IF NOT EXISTS `paymentCycle` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cycle_id` tinytext,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(1) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `paymentCycle`
--

INSERT INTO `paymentCycle` (`id`, `cycle_id`, `start_date`, `end_date`, `notes`, `status`) VALUES
(1, 'PYCL000001', '2017-02-21 08:33:48', '2017-02-28 08:33:47', '2017-02-21 08:33:49', 0),
(2, 'PYCL000002', '2017-02-28 08:33:48', '2017-03-07 08:33:47', '2017-03-03 11:20:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Payroll id',
  `trasaction_id` text NOT NULL COMMENT 'Transaction id',
  `mas_id` int(11) NOT NULL COMMENT 'Driver id',
  `opening_balance` double NOT NULL COMMENT 'Remaining balance in the account',
  `pay_date` datetime NOT NULL COMMENT 'Date of payment or transfer',
  `pay_amount` double NOT NULL COMMENT 'Amount transfered',
  `closing_balance` double NOT NULL COMMENT 'Remaining balance after last transaction',
  `due_amount` double NOT NULL,
  PRIMARY KEY (`payroll_id`),
  KEY `mas_id` (`mas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'report id',
  `mas_id` int(20) NOT NULL COMMENT 'master id',
  `slave_id` int(20) NOT NULL COMMENT 'customer id',
  `appointment_id` int(20) NOT NULL COMMENT 'appointment id',
  `report_msg` varchar(350) CHARACTER SET utf8 NOT NULL COMMENT 'detailed message',
  `admin_note` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `report_dt` datetime NOT NULL COMMENT 'reporting date time',
  `report_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-> Reported, 2-> Verified',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='Reports from Customers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_mapping`
--

DROP TABLE IF EXISTS `review_mapping`;
CREATE TABLE IF NOT EXISTS `review_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  `review_for` varchar(45) DEFAULT NULL COMMENT '1 - Driver,\n2 - Passenger',
  `lan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slave`
--

DROP TABLE IF EXISTS `slave`;
CREATE TABLE IF NOT EXISTS `slave` (
  `slave_id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(500) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(150) NOT NULL,
  `stripe_id` varchar(40) DEFAULT NULL COMMENT 'Stripe id for money transferes',
  `paypal_token` varchar(750) DEFAULT NULL COMMENT 'Paypal refresh token for future payments',
  `status` tinyint(1) NOT NULL COMMENT '1 - sign up, 3 - active, 4 - inactive',
  `booking_status` tinyint(2) DEFAULT NULL,
  `created_dt` datetime NOT NULL,
  `last_active_dt` datetime NOT NULL,
  `profile_pic` varchar(600) DEFAULT NULL,
  `ThirdPartyLoginType` int(11) DEFAULT NULL COMMENT '1) simple signup ,2)facebook 3)gmail',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `resetData` varchar(50) DEFAULT NULL COMMENT 'Reset Data for password',
  `resetFlag` tinyint(1) DEFAULT NULL COMMENT 'Reset flag 1-> unused',
  `coupon` varchar(50) DEFAULT NULL,
  `lang` int(2) DEFAULT '1',
  `city_id` int(11) DEFAULT NULL,
  `DeviceId` varchar(500) DEFAULT NULL,
  `ServerTime` datetime DEFAULT NULL,
  `dect_reason` varchar(45) DEFAULT NULL,
  `dect_by` varchar(45) DEFAULT NULL,
  `dect_time` varchar(45) DEFAULT NULL,
  `reset_link` varchar(45) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '1-male, 2-female',
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`slave_id`),
  KEY `email` (`email`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='patient information table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `slave`
--

INSERT INTO `slave` (`slave_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `stripe_id`, `paypal_token`, `status`, `booking_status`, `created_dt`, `last_active_dt`, `profile_pic`, `ThirdPartyLoginType`, `latitude`, `longitude`, `resetData`, `resetFlag`, `coupon`, `lang`, `city_id`, `DeviceId`, `ServerTime`, `dect_reason`, `dect_by`, `dect_time`, `reset_link`, `gender`, `dob`) VALUES
(1, 'Rahul', 'Jain', 'jain@mobifyi.com', '+917406003761', '6693442136882b89d4f725317c873dfe', NULL, NULL, 3, NULL, '2017-02-24 13:00:32', '2017-03-04 06:30:17', 'imageFri02242017183038.jpeg', 1, 13.028694, 77.589561, NULL, NULL, NULL, 1, 1, 'FD9A66C5-6FF1-4D9A-B40F-81B4CFBF1C70', '2017-02-24 13:00:32', NULL, NULL, NULL, NULL, 0, '0000-00-00'),
(2, 'Gddhdh', 'Dgdhyd', 'akbar@gmail.com', '+2056656553', '6693442136882b89d4f725317c873dfe', NULL, NULL, 3, NULL, '2017-02-26 15:27:21', '2017-02-26 17:27:33', NULL, 0, 29.97990701, 30.9791395, NULL, NULL, NULL, 1, 0, '868087025751445', '2017-02-26 15:27:21', NULL, NULL, NULL, NULL, 0, '0000-00-00'),
(3, 'Dhudud', '', 'dghsh@sjkd.djdu', '+2065656', 'c851f49b1ec8283c7e6c1ccea17cde9b', NULL, NULL, 3, NULL, '2017-02-26 15:39:47', '2017-03-02 11:39:00', NULL, 0, 29.98012613, 30.97900404, NULL, NULL, NULL, 1, 0, '868087025751445', '2017-02-26 15:39:47', NULL, NULL, NULL, NULL, 0, '0000-00-00'),
(4, 'Abhishek ', 'Sahu', 'sahu@mobifyi.com', '+917676989677', '6693442136882b89d4f725317c873dfe', NULL, NULL, 3, NULL, '2017-02-28 11:30:02', '2017-03-04 12:48:39', 'imageTue02282017170012.jpeg', 1, 13.028694, 77.589561, NULL, NULL, NULL, 1, 0, '4B1A5CE3-B3A5-4041-9AAF-6311C851BC51', '2017-02-28 11:30:02', NULL, NULL, NULL, NULL, 0, '0000-00-00'),
(5, 'Fggdfggdf', 'Fggdfggdf', 'fgfdgfgd@gmail.com', '+91645656664645', '6693442136882b89d4f725317c873dfe', NULL, NULL, 3, NULL, '2017-03-03 12:30:52', '2017-03-04 11:50:37', NULL, 1, 13.028694, 77.589561, NULL, NULL, NULL, 1, 1, 'D2E56E9D-A629-4112-8C08-EDDE5B4DCC9A', '2017-03-03 12:30:52', NULL, NULL, NULL, NULL, 0, '0000-00-00'),
(6, 'Testing', '', 'testing@gmail.com', '+9154554545555445', '6693442136882b89d4f725317c873dfe', NULL, NULL, 3, NULL, '2017-03-03 12:55:55', '2017-03-03 19:42:03', NULL, 1, 13.028711, 77.589513, NULL, NULL, NULL, 1, 1, 'FD9A66C5-6FF1-4D9A-B40F-81B4CFBF1C70', '2017-03-03 12:55:55', NULL, NULL, NULL, NULL, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `statusmessages`
--

DROP TABLE IF EXISTS `statusmessages`;
CREATE TABLE IF NOT EXISTS `statusmessages` (
  `sid` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `statusNumber` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - success, 1 - error',
  `statusMessage` varchar(400) CHARACTER SET utf8 NOT NULL COMMENT 'brief status message',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='status messages for the appl response' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--

DROP TABLE IF EXISTS `superadmin`;
CREATE TABLE IF NOT EXISTS `superadmin` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(100) NOT NULL COMMENT 'super admin username',
  `password` varchar(100) NOT NULL COMMENT 'super admin pass',
  `email` varchar(150) DEFAULT NULL,
  `user_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 - Superadmin, 2 - manager',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='super admin credencials' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `superadmin`
--

INSERT INTO `superadmin` (`id`, `username`, `password`, `email`, `user_type`) VALUES
(1, 'superadmin@gmail.com', '17c4520f6cfd1ab53d8745e84681eb49', 'chetan2@roadyo.net', 1),
(2, 'manager', '1d0258c2440a8d19e716292b231e3190', NULL, 2),
(3, 'rahul', 'b8e69748e47278f29ae1b7b8f6e49005', 'rahul@3embed.com', 1),
(9, 'chetan', 'a16790e86d4d92a482b7303b7e79ba3e', 'chetan@roadyo.net', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE IF NOT EXISTS `user_sessions` (
  `sid` int(20) NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `oid` int(20) NOT NULL COMMENT 'Object Id',
  `token` varchar(500) NOT NULL COMMENT 'Session token',
  `expiry` datetime NOT NULL COMMENT 'Session expiry date and time in GMT',
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - driver, 2 - passenger',
  `device` varchar(500) NOT NULL COMMENT 'Device on which session is generated',
  `type` int(4) NOT NULL COMMENT 'Type of device or platform',
  `push_token` varchar(700) DEFAULT NULL COMMENT 'Token for push notification',
  `create_date` datetime NOT NULL COMMENT 'Current date and time in GMT',
  `loggedIn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - logged in, 2 - logged out',
  `app_version` varchar(200) DEFAULT NULL,
  `deviceOs` varchar(500) DEFAULT NULL,
  `deviceModel` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='stores multiple session token for all the users' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`sid`, `oid`, `token`, `expiry`, `user_type`, `device`, `type`, `push_token`, `create_date`, `loggedIn`, `app_version`, `deviceOs`, `deviceModel`) VALUES
(1, 2, '36383741433237442D343231392D344236382D423933322D453541343132394439343645kXd4vnkXd4vnIVOBEliBa8WTwvIVOBEliBa8WTwv', '2587-07-20 02:26:04', 1, '687AC27D-4219-4B68-B932-E5A4129D946E', 1, 'Dummy PushToken', '2017-02-24 18:26:04', 3, '1.0', '', ''),
(2, 1, '46443941363643352D364646312D344439PyMh3N7dOyvI1H876srt412D423430462D383142344346424631433730PyMh3N7dOyvI1H876srt', '2587-07-26 20:54:36', 2, 'FD9A66C5-6FF1-4D9A-B40F-81B4CFBF1C70', 1, 'epxqeUUVNqw:APA91bHfAjePVW0XmQSo-HJ9E5zRK10wYshMNr1dvfUx6FqlcxuNzs0vpYoHTO3qzCeCXfrl2tuRGI8X0eNJQmm28RO3RvFmvV_9PWmsxW3hooZ36k5XVJ8ztEdyTw0V8Z12Bun0Ny2t', '2017-02-24 13:00:32', 2, '1.0', '9.3.5', 'iPad'),
(3, 2, '37313333443538462D334334362D343042462D423844322D304237424639MoybyKAu3WUaQq6NnqAV334436303934MoybyKAu3WUaQq6NnqAV', '2587-07-20 02:42:40', 1, '7133D58F-3C46-40BF-B8D2-0B7BF93D6094', 1, 'Dummy PushToken', '2017-02-24 18:38:40', 3, '1.0', '', ''),
(4, 2, '37313333443538462D334334362D343042462D423844322D304237424639MoybyKAu3WUaQq6NnqAV334436303934MoybyKAu3WUaQq6NnqAV', '2587-07-20 02:42:40', 1, '7133D58F-3C46-40BF-B8D2-0B7BF93D6094', 1, 'Dummy PushToken', '2017-02-24 18:41:55', 3, '1.0', '', ''),
(5, 2, '46323444454530332D33YD1OK8ci9Iqui8FoNtg73732422D344239412D384332392D324534383435464439344345YD1OK8ci9Iqui8FoNtg7', '2587-07-20 02:58:20', 1, 'F24DEE03-372B-4B9A-8C29-2E4845FD94CE', 1, 'Dummy PushToken', '2017-02-24 18:58:20', 2, '1.0', '', ''),
(6, 2, '46323444454530332D333732422D344239412D384332392D3245343834354644393443BkvJuJfZL7IJfYHXXCIV45BkvJuJfZL7IJfYHXXCIV', '2587-07-20 03:00:15', 1, 'F24DEE03-372B-4B9A-8C29-2E4845FD94CE', 1, 'Dummy PushToken', '2017-02-24 19:00:15', 2, '1.0', '', ''),
(7, 2, '46323444454530332D333732422D3442394123xkFSQpnzEnkM5413MY1D384332392D3245343834354644393443453xkFSQpnzEnkM5413MY1', '2587-07-20 03:00:50', 1, 'F24DEE03-372B-4B9A-8C29-2E4845FD94CE', 1, 'Dummy PushToken', '2017-02-24 19:00:50', 2, '1.0', '', ''),
(8, 4, '46323444454530332D333RXUjD3Vs8qOIM3oG7tj1732422D344239412D384332392D324534383435464439344345RXUjD3Vs8qOIM3oG7tj1', '2587-07-20 03:14:00', 1, 'F24DEE03-372B-4B9A-8C29-2E4845FD94CE', 1, 'Dummy PushToken', '2017-02-24 19:14:00', 3, '1.0', '', ''),
(9, 2, '31383039424536392D443645442D3437343cknswLo6XMWho36Qi9Eb72D423531302D343634303938353641433233cknswLo6XMWho36Qi9Eb', '2587-07-20 03:31:36', 1, '1809BE69-D6ED-4747-B510-46409856AC23', 1, 'dIA-yUjQOVs:APA91bE_rV4ps0tXQvw-0Qyh2SiANc9aefQXkaAWpoZhXTmJq_fj_9XY4Ex2HJGx-WW8Neyki-lXQ33tDOqqIrJObS5D6N2CBuD73DBh0b6-xjkuqTBo_TnsgjwkIMx4QqhNg58aukuG', '2017-02-24 19:30:14', 2, '1.0', '', ''),
(10, 3, '31383039424536392D443645442D343734372D423531302DwKZR7snTQtQCp81teRLn343634303938353641433233wKZR7snTQtQCp81teRLn', '2587-07-20 03:37:48', 1, '1809BE69-D6ED-4747-B510-46409856AC23', 1, 'dIA-yUjQOVs:APA91bE_rV4ps0tXQvw-0Qyh2SiANc9aefQXkaAWpoZhXTmJq_fj_9XY4Ex2HJGx-WW8Neyki-lXQ33tDOqqIrJObS5D6N2CBuD73DBh0b6-xjkuqTBo_TnsgjwkIMx4QqhNg58aukuG', '2017-02-24 19:33:50', 2, '1.0', '', ''),
(11, 2, '3836383038373032353KRr9xsm2y1BLWTxGeUZY73531343435KRr9xsm2y1BLWTxGeUZY', '2587-07-21 23:27:21', 2, '868087025751445', 2, 'APA91bFnUoJw32atavTcXJhoNdt2vSbZ6eUo_LFP8HGYYHVWjE1ZQyTs3zVJLA4I2ADL23cRiHQUmo2JaqyWPADPqhfKpykfEHMgj9z3ZdbvCGTa8PpcwD7HzdxhAXJI3aWqmlcPLCTA', '2017-02-26 15:27:21', 3, '', '', ''),
(12, 3, '3vlTEQBFwzSbcWgm2g36583638303837303235373531343435vlTEQBFwzSbcWgm2g365', '2587-07-21 23:39:47', 2, '868087025751445', 2, 'APA91bGFxTP-olB14J7W5n3mqakCVlaHPMjyEuF_f8bfYYJLjBXZXbpzZC-OvAYBo_rV__Ny19Chmgqp6DzyU_Dc6bkGosSuPNYXbTCD2Ym0-5rWhHTAOon8uCYxddKBOQPpNdCsxK3I', '2017-02-26 15:39:47', 1, '', '', ''),
(13, 4, '46323444454530332D3VAfn1TLcaHN5Gcr2jNLA33732422D344239412D384332392D324534383435464439344345VAfn1TLcaHN5Gcr2jNLA', '2587-07-22 23:05:30', 1, 'F24DEE03-372B-4B9A-8C29-2E4845FD94CE', 1, 'Dummy PushToken', '2017-02-27 15:05:30', 3, '1.0', '', ''),
(14, 4, '39393245393544302D444243382D343043302D394345382D453641384243353LkxpUGuOFdGzRgnSMbk7144304244LkxpUGuOFdGzRgnSMbk7', '2587-07-22 23:07:02', 1, '992E95D0-DBC8-40C0-9CE8-E6A8BC51D0BD', 1, 'Dummy PushToken', '2017-02-27 15:07:02', 3, '1.0', '', ''),
(15, 4, '3939324539rOLpg8LglXbm7q4XuC8O3544302D444243382D343043302D394345382D453641384243353144304244rOLpg8LglXbm7q4XuC8O', '2587-07-22 23:08:40', 1, '992E95D0-DBC8-40C0-9CE8-E6A8BC51D0BD', 1, 'Dummy PushToken', '2017-02-27 15:08:40', 3, '1.0', '', ''),
(16, 5, '39444444433437312D354638382D343142382D413434322D413337314646364233323730scaB72jIniscaB72jIniHOFmPV602lHOFmPV602l', '2587-07-24 00:50:42', 1, '9DDDC471-5F88-41B8-A442-A371FF6B3270', 1, 'Dummy PushToken', '2017-02-28 16:50:42', 2, '1.0', '', ''),
(17, 4, '34423141354345332D423341352D343034312D3941457hCgM35kRbQAZISmqfN1462D36333131433835314243353157hCgM35kRbQAZISmqfN', '2587-07-23 19:30:02', 2, '4B1A5CE3-B3A5-4041-9AAF-6311C851BC51', 1, 'b4ba182e7b82eeaa477461a702c19e057fe59af8f2283801853797c501d66b76', '2017-02-28 11:30:02', 3, '1.0', '10.2.1', 'iPhone 5s'),
(18, 6, '33433044353739372D463443352D343742452D3832313YNgBF4A0ZnHoCexg0QF302D423233443741454134463833YNgBF4A0ZnHoCexg0QF3', '2587-07-24 01:07:22', 1, '3C0D5797-F4C5-47BE-8210-B23D7AEA4F83', 1, 'Dummy PushToken', '2017-02-28 17:07:22', 3, '1.0', '', ''),
(19, 1, '44324535364539442D413632392D343131322D384330382D4544444535423453NnXb3Q6ypctHsYwVDP444343394153NnXb3Q6ypctHsYwVDP', '2587-07-26 20:28:19', 2, 'D2E56E9D-A629-4112-8C08-EDDE5B4DCC9A', 1, 'garbagevalue', '2017-02-28 12:59:00', 2, '1.0', '9.2', 'iPhone Simulator'),
(20, 1, '35433345344236302D343831302DmYcaDXcgnFn2lf1a2btW343139372D393441462D384342333831423546414339mYcaDXcgnFn2lf1a2btW', '2587-07-24 13:48:29', 2, '5C3E4B60-4810-4197-94AF-8CB381B5FAC9', 1, 'e4d49d4e1c11a62a2c6acab272e32ea6e8e8162ff0e96ceb86282c3be770f69b', '2017-02-28 15:29:27', 2, '1.0', '10.2.1', 'iPhone 5c'),
(21, 5, '33324537xa33uxTe0U5i30RNZgTP423730332D313944462D344139362D393744342D353232383546363432443336xa33uxTe0U5i30RNZgTP', '2587-07-24 05:19:11', 1, '32E7B703-19DF-4A96-97D4-52285F642D36', 1, 'Dummy PushToken', '2017-02-28 21:19:11', 3, '1.0', '', ''),
(22, 4, '46303ACgSAeFVtGUoSTb8HqXT937434244452D413239322D343334432D393130372D434236413546323336463533ACgSAeFVtGUoSTb8HqXT', '2587-07-24 05:35:21', 1, 'F097CBDE-A292-434C-9107-CB6A5F236F53', 1, 'Dummy PushToken', '2017-02-28 21:35:21', 3, '1.0', '', ''),
(23, 4, '39393245393544302D4BBtsFZcmXhFeKtd5LAd644243382D343043302D394345382D453641384243353144304244BBtsFZcmXhFeKtd5LAd6', '2587-07-24 17:36:38', 1, '992E95D0-DBC8-40C0-9CE8-E6A8BC51D0BD', 1, 'Dummy PushToken', '2017-03-01 09:36:38', 1, '1.0', '', ''),
(24, 5, '39444444433437312D354638382nWdCxmZisEReY8qdhZrYD343142382D413434322D413337314646364233323730nWdCxmZisEReY8qdhZrY', '2587-07-24 19:18:04', 1, '9DDDC471-5F88-41B8-A442-A371FF6B3270', 1, 'Dummy PushToken', '2017-03-01 11:18:04', 2, '1.0', '', ''),
(25, 5, '33324537423730332D31vHXCu1xruusLNduBnAm43944462D344139362D393744342D353232383546363432443336vHXCu1xruusLNduBnAm4', '2587-07-24 19:19:19', 1, '32E7B703-19DF-4A96-97D4-52285F642D36', 1, 'Dummy PushToken', '2017-03-01 11:19:19', 1, '1.0', '', ''),
(26, 6, '39444444433437312D354638382D343142382D413434322D4133373146463642333237305s5s9rBTCqUqtbasBLNmuK9rBTCqUqtbasBLNmuK', '2587-07-24 19:19:40', 1, '9DDDC471-5F88-41B8-A442-A371FF6B3270', 1, 'Dummy PushToken', '2017-03-01 11:19:40', 1, '1.0', '', ''),
(27, 4, '35433345344236302D343831302D343139372D39EaCRaYwKjW1eCdSBHUVv3441462D384342333831423546414339EaCRaYwKjW1eCdSBHUVv', '2587-07-24 13:50:26', 2, '5C3E4B60-4810-4197-94AF-8CB381B5FAC9', 1, 'e4d49d4e1c11a62a2c6acab272e32ea6e8e8162ff0e96ceb86282c3be770f69b', '2017-03-01 05:50:26', 3, '1.0', '10.2.1', 'iPhone 5c'),
(28, 4, '46443941363643352D364646312D344439412D423430462D383142349pagfH9xMYvg2JyJ7HJS43464246314337309pagfH9xMYvg2JyJ7HJS', '2587-07-24 15:05:19', 2, 'FD9A66C5-6FF1-4D9A-B40F-81B4CFBF1C70', 1, 'af30b879a15794431129100212c902053450381de2a74162c0f7e6f16b45891f', '2017-03-01 07:05:19', 3, '1.0', '9.3.5', 'iPad'),
(29, 5, '44324535364539442D413632392D343131322D384330382D4544444535qX5MeBrkhr1OtnI1cCvJ42344443433941qX5MeBrkhr1OtnI1cCvJ', '2587-07-26 20:30:52', 2, 'D2E56E9D-A629-4112-8C08-EDDE5B4DCC9A', 1, '', '2017-03-03 12:30:52', 1, '1.0', '9.2', 'iPhone Simulator'),
(30, 6, '464439413636nXIDRwfHJzVwGOH8tdjD43352D364646312D344439412D423430462D383142344346424631433730nXIDRwfHJzVwGOH8tdjD', '2587-07-26 20:55:55', 2, 'FD9A66C5-6FF1-4D9A-B40F-81B4CFBF1C70', 1, 'epxqeUUVNqw:APA91bHfAjePVW0XmQSo-HJ9E5zRK10wYshMNr1dvfUx6FqlcxuNzs0vpYoHTO3qzCeCXfrl2tuRGI8X0eNJQmm28RO3RvFmvV_9PWmsxW3hooZ36k5XVJ8ztEdyTw0V8Z12Bun0Ny2t', '2017-03-03 12:55:55', 1, '1.0', '9.3.5', 'iPad'),
(31, 1, '36304439423643332D463231352D344134356xXJ2Gmnk7GUGvQv6diM2D383845332D3437343231323542313944366xXJ2Gmnk7GUGvQv6diM', '2587-07-27 14:28:06', 2, '60D9B6C3-F215-4A45-88E3-4742125B19D6', 1, 'garbagevalue', '2017-03-04 06:28:06', 2, '1.0', '9.2', 'iPhone Simulator'),
(32, 4, '36304439423643332D463231352D344134352D388YSPhvUSdpQ7N0kxRVsd3845332D3437343231323542313944368YSPhvUSdpQ7N0kxRVsd', '2587-07-27 14:30:34', 2, '60D9B6C3-F215-4A45-88E3-4742125B19D6', 1, 'garbagevalue', '2017-03-04 06:30:34', 1, '1.0', '9.2', 'iPhone Simulator');

-- --------------------------------------------------------

--
-- Table structure for table `vechiledoc`
--

DROP TABLE IF EXISTS `vechiledoc`;
CREATE TABLE IF NOT EXISTS `vechiledoc` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `doctype` int(11) DEFAULT NULL COMMENT '1-rc,2-insurance,3-carriage',
  `vechileid` int(11) DEFAULT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vechiledoc`
--

INSERT INTO `vechiledoc` (`docid`, `url`, `expirydate`, `doctype`, `vechileid`) VALUES
(1, '14569880465088.', '1970-01-01', 2, 1),
(2, '2178339971496.', '1970-01-01', 1, 1),
(3, '4353704068714.', '1970-01-01', 3, 1),
(4, '2679789443877.', '1970-01-01', 2, 2),
(5, '11961592081803.', '1970-01-01', 1, 2),
(6, '6773126900904.', '1970-01-01', 3, 2),
(7, '2586633790994.', '1970-01-01', 2, 3),
(8, '10287003891456.', '1970-01-01', 1, 3),
(9, '8899925241740.', '1970-01-01', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vehiclemodel`
--

DROP TABLE IF EXISTS `vehiclemodel`;
CREATE TABLE IF NOT EXISTS `vehiclemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicletypeid` int(11) DEFAULT NULL,
  `vehiclemodel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vehiclemodel`
--

INSERT INTO `vehiclemodel` (`id`, `vehicletypeid`, `vehiclemodel`) VALUES
(1, 1, 'City');

-- --------------------------------------------------------

--
-- Table structure for table `vehicleType`
--

DROP TABLE IF EXISTS `vehicleType`;
CREATE TABLE IF NOT EXISTS `vehicleType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicletype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vehicleType`
--

INSERT INTO `vehicleType` (`id`, `vehicletype`) VALUES
(1, 'Honda');

-- --------------------------------------------------------

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
CREATE TABLE IF NOT EXISTS `workplace` (
  `workplace_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Workplace/vehicle id',
  `uniq_identity` varchar(20) NOT NULL,
  `type_id` int(3) NOT NULL COMMENT 'Workplace type id',
  `Title` varchar(150) DEFAULT NULL COMMENT 'workplace title',
  `Status` tinyint(1) DEFAULT NULL COMMENT '1 - assign, 2 - accept , 4- reject, 5 - created',
  `unique_id` varchar(250) DEFAULT NULL COMMENT 'Unique id for the vehicle',
  `Vehicle_Make` varchar(100) DEFAULT NULL COMMENT 'vehicle manufacturer',
  `Vehicle_Model` varchar(100) DEFAULT NULL COMMENT 'vehicle model',
  `Vehicle_Type` varchar(100) DEFAULT NULL COMMENT 'type of vehicle',
  `Vehicle_Reg_No` varchar(40) DEFAULT NULL COMMENT 'registration no',
  `License_Plate_No` varchar(40) DEFAULT NULL COMMENT 'plate no',
  `Vehicle_Seating` int(3) DEFAULT NULL COMMENT 'no of seating',
  `Vehicle_Color` varchar(15) DEFAULT NULL COMMENT 'color of vehicle',
  `Accept_Credit_Card` tinyint(1) DEFAULT NULL COMMENT '1 - yes, 2 - no',
  `Accept_Debit_Card` tinyint(1) DEFAULT NULL COMMENT '1 - yes, 2 - no',
  `Accept_Cash` tinyint(1) DEFAULT NULL COMMENT '1 - yes, 2 - no',
  `Radio_Taxi_Rate` float DEFAULT NULL COMMENT 'radio taxi rate',
  `Fixed_Minimum_Rate` float DEFAULT NULL COMMENT 'minimum rate',
  `Charge_Type` tinyint(1) DEFAULT NULL COMMENT 'charge type',
  `Rate_per_kilometer` float DEFAULT NULL COMMENT 'rate per km',
  `Rate_per_min` float DEFAULT NULL COMMENT 'rate per min',
  `Vehicle_Insurance_No` varchar(40) DEFAULT NULL COMMENT 'vehicle insurance number',
  `Vehicle_Insurance_Dt` datetime DEFAULT NULL COMMENT 'vehicle insurance datetime',
  `vehicle_insurance_expiry_dt` datetime DEFAULT NULL COMMENT 'expiration date for vehicle insurance',
  `Cancellation_Charges_Fixed` float DEFAULT NULL COMMENT 'cancellation charges per minute',
  `Waiting_Charges_per_minute` float DEFAULT NULL COMMENT 'waiting charges per minute',
  `last_login_lat` double DEFAULT NULL COMMENT 'last login latitude',
  `last_login_long` double DEFAULT NULL COMMENT 'last login longitude',
  `last_logout_lat` double DEFAULT NULL COMMENT 'last logout latitude',
  `last_logout_long` double DEFAULT NULL COMMENT 'last logout longitude',
  `company` int(11) DEFAULT NULL,
  `Vehicle_Image` varchar(250) NOT NULL,
  `build_year` varchar(1000) DEFAULT NULL,
  `mas_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`workplace_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='workplace/vehicle details' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `workplace`
--

INSERT INTO `workplace` (`workplace_id`, `uniq_identity`, `type_id`, `Title`, `Status`, `unique_id`, `Vehicle_Make`, `Vehicle_Model`, `Vehicle_Type`, `Vehicle_Reg_No`, `License_Plate_No`, `Vehicle_Seating`, `Vehicle_Color`, `Accept_Credit_Card`, `Accept_Debit_Card`, `Accept_Cash`, `Radio_Taxi_Rate`, `Fixed_Minimum_Rate`, `Charge_Type`, `Rate_per_kilometer`, `Rate_per_min`, `Vehicle_Insurance_No`, `Vehicle_Insurance_Dt`, `vehicle_insurance_expiry_dt`, `Cancellation_Charges_Fixed`, `Waiting_Charges_per_minute`, `last_login_lat`, `last_login_long`, `last_logout_lat`, `last_logout_long`, `company`, `Vehicle_Image`, `build_year`, `mas_id`) VALUES
(1, 'trigma', 1, '1', 1, NULL, NULL, '1', NULL, '', '123123123', NULL, 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 77.589498, 77.589498, 1, '1487937139000.jpg', '2006', '0'),
(2, 'tragma1', 1, '1', 1, NULL, NULL, '1', NULL, '', 'KA 05 AB 1234', NULL, 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 77.589501, 77.589501, 1, '1487945277000.jpg', '2003', '0'),
(3, '287229', 1, '1', 1, NULL, NULL, '1', NULL, '', '123456', NULL, 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 77.589501, 77.589501, 1, '1488281813000.png', '2015', '0');

-- --------------------------------------------------------

--
-- Table structure for table `workplace_types`
--

DROP TABLE IF EXISTS `workplace_types`;
CREATE TABLE IF NOT EXISTS `workplace_types` (
  `type_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Type id for the workplace',
  `type_name` varchar(100) NOT NULL COMMENT 'Name for workplace',
  `max_size` int(2) NOT NULL COMMENT 'Maximum size of people',
  `basefare` float NOT NULL COMMENT 'basefare for the workplace',
  `min_fare` float NOT NULL COMMENT 'Minimum fare for workplace',
  `price_per_min` float NOT NULL COMMENT 'Price per minute',
  `price_per_km` float NOT NULL COMMENT 'Price per km',
  `waiting_charge_per_min` float DEFAULT NULL COMMENT 'waiting charge per minute',
  `type_desc` varchar(300) DEFAULT NULL COMMENT 'Description for type',
  `city_id` int(11) NOT NULL DEFAULT '18833' COMMENT 'City id for the vehicle',
  `type_icon` varchar(250) DEFAULT NULL COMMENT 'Type icon',
  `cancilation_fee` double NOT NULL DEFAULT '0',
  `vehicle_img` varchar(300) DEFAULT NULL,
  `MapIcon` varchar(300) DEFAULT NULL,
  `vehicle_img_off` varchar(300) DEFAULT NULL,
  `vehicle_order` int(20) NOT NULL,
  `Comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Types of workplaces' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `workplace_types`
--

INSERT INTO `workplace_types` (`type_id`, `type_name`, `max_size`, `basefare`, `min_fare`, `price_per_min`, `price_per_km`, `waiting_charge_per_min`, `type_desc`, `city_id`, `type_icon`, `cancilation_fee`, `vehicle_img`, `MapIcon`, `vehicle_img_off`, `vehicle_order`, `Comment`) VALUES
(1, 'CAR', 5, 5, 6, 6, 6, 5, 'services', 1, NULL, 5, '3561473615364.png', '14406562444104.png', '8872443041784.png', 1, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
