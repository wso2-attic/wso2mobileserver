-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2013 at 11:58 AM
-- Server version: 5.5.25
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wso2mobile-mdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `reg_id` longtext,
  `os_version` varchar(45) DEFAULT NULL,
  `properties` text,
  `created_date` varchar(45) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL COMMENT 'enroll',
  `byod` smallint(6) DEFAULT '1',
  `deleted` int(11) DEFAULT '0',
  `vendor` varchar(11) DEFAULT NULL,
  `udid` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `featuregroup`
--

CREATE TABLE IF NOT EXISTS `featuregroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='MAM,MDM' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `featuregroup`
--

INSERT INTO `featuregroup` (`id`, `name`, `description`) VALUES
(1, 'MDM', 'mobile device management '),
(2, 'MAM', 'mobile application management'),
(3, 'MMM', 'mobile messaging management');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE IF NOT EXISTS `features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(45) NOT NULL,
  `deleted` smallint(6) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkgroupid` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `code`, `description`, `deleted`, `group_id`, `type_id`) VALUES
(1, 'LOCK', '503A', 'Device Lock', 0, 1, 1),
(2, 'WIPE', '504A', 'Wipe', 0, 1, 1),
(3, 'CLEARPASSWORD', '505A', 'Clear', 0, 1, 1),
(4, 'APPLIST', '502A', 'Get All Applications', 0, 2, 2),
(5, 'LOCATION', '501A', 'Location', 0, 1, 2),
(6, 'INFO', '500A', 'Device Information', 0, 1, 2),
(7, 'NOTIFICATION', '506A', 'Message', 0, 3, 1),
(8, 'WIFI', '507A', 'Wifi', 0, 1, 1),
(9, 'CAMERA', '508A', 'Camera', 0, 1, 1),
(12, 'MUTE', '513A', 'Mute Device', 0, 1, 1),
(13, 'INSTALLAPP', '509A', 'Install Application', 0, 2, 3),
(14, 'UNINSTALLAPP', '510A', 'Uninstall Application', 0, 2, 3),
(15, 'ENCRYPT', '511A', 'Encrypt Storage', 0, 1, 1),
(16, 'APN', '512A', 'APN', 0, 1, 1),
(17, 'TRACKCALLS', '514A', 'Track Call Log', 0, 1, 2),
(18, 'TRACKSMS', '515A', 'Track SMS', 0, 1, 2),
(19, 'DATAUSAGE', '516A', 'Track Data Usage', 0, 1, 2),
(20, 'STATUS', '517A', 'Get Device Status', 0, 1, 2),
(21, 'WEBCLIP', '518A', 'Create Webclips', 0, 1, 3),
(22, 'PASSWORDPOLICY', '519A', 'Password Policy', 0, 1, 1),
(23, 'EMAIL', '520A', 'Email Configuration', 0, 1, 1),
(24, 'GOOGLECALENDAR', '521A', 'Sync Google Calendar', 0, 1, 1),
(26, 'VPN', '513A', 'VPN', 0, 1, 1),
(27, 'LDAP', '524A', 'LDAP', 0, 1, 1),
(28, 'CALENDERSUBSCRIPTION', '525A', 'Calender ', 0, 1, 1),
(29, 'CHANGEPASSWORD', '526A', 'Change Password', 0, 1, 1),
(30, 'ENTERPRISEWIPE', '527A', 'Enterprise Wipe', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `featuretype`
--

CREATE TABLE IF NOT EXISTS `featuretype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Critical,Working' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `featuretype`
--

INSERT INTO `featuretype` (`id`, `name`, `description`, `deleted`) VALUES
(1, 'OPERATION', 'Can do groups, users, devices', 0),
(2, 'INFO', 'Only for devices', 0),
(3, 'APPLICATION', 'application related stuff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `message` text,
  `status` varchar(1) DEFAULT NULL,
  `sent_date` varchar(45) DEFAULT NULL,
  `received_date` varchar(45) DEFAULT NULL,
  `received_data` longtext CHARACTER SET utf8,
  `feature_code` varchar(45) DEFAULT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8230 ;

-- --------------------------------------------------------

--
-- Table structure for table `platformfeatures`
--

CREATE TABLE IF NOT EXISTS `platformfeatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `min_version` varchar(45) DEFAULT NULL,
  `max_version` varchar(45) DEFAULT NULL,
  `template` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `platformfeatures`
--

INSERT INTO `platformfeatures` (`id`, `platform_id`, `feature_id`, `min_version`, `max_version`, `template`) VALUES
(1, 1, 1, '2.2', '', ''),
(2, 1, 2, '2.2', '', 'wipe'),
(3, 1, 3, '2.2', '', ''),
(4, 1, 4, '2.2', '', ''),
(5, 1, 5, '2.2', '', ''),
(6, 1, 6, '2.2', '', ''),
(7, 1, 7, '2.2', '', 'notifications'),
(8, 1, 8, '2.2', '', 'wifi'),
(9, 1, 9, '4.0', '', 'camera'),
(12, 1, 12, '2.2', '', ''),
(13, 2, 1, '4.0', '5.0', NULL),
(15, 2, 3, '4.0', '5.0', ''),
(16, 2, 4, '4.0', '5.0', NULL),
(17, 2, 6, '4.0', '5.0', NULL),
(18, 2, 8, '4.0', '5.0', 'wifi'),
(19, 2, 9, '4.0', '5.0', 'camera'),
(21, 3, 1, '4.0', '5.0', NULL),
(23, 3, 3, '4.0', '5.0', ''),
(24, 3, 4, '4.0', '5.0', NULL),
(25, 3, 6, '4.0', '5.0', NULL),
(26, 3, 8, '4.0', '5.0', 'wifi'),
(28, 3, 9, '4.0', '5.0', 'camera'),
(30, 4, 1, '4.0', '5.0', NULL),
(32, 4, 3, '4.0', '5.0', ''),
(33, 4, 4, '4.0', '5.0', NULL),
(34, 4, 6, '4.0', '5.0', NULL),
(35, 4, 8, '4.0', '5.0', 'wifi'),
(36, 4, 9, '4.0', '5.0', 'camera'),
(37, 1, 15, '3.0', NULL, 'encrypt'),
(38, 1, 17, '2.2', NULL, NULL),
(39, 1, 18, '2.2', NULL, NULL),
(43, 1, 19, '2.2', NULL, NULL),
(44, 1, 20, '2.2', NULL, NULL),
(45, 1, 21, '2.2', NULL, 'webclip'),
(46, 1, 22, '2.2', NULL, 'password_policy'),
(49, 2, 21, '4.0', '5.0', 'webclip'),
(50, 2, 22, '4.0', '5.0', 'password_policy'),
(51, 3, 23, '4.0', '5.0', 'email'),
(52, 3, 24, '4.0', '5.0', 'google_calendar'),
(53, 3, 21, '4.0', '5.0', 'webclip'),
(54, 3, 22, '4.0', '5.0', 'password_policy'),
(55, 2, 23, '4.0', '5.0', 'email'),
(56, 2, 24, '4.0', '5.0', 'google_calendar'),
(57, 1, 25, '2.2', NULL, NULL),
(58, 1, 29, '2.2', NULL, 'change-password'),
(59, 2, 30, '4.0', '5.0', NULL),
(60, 3, 30, '4.0', '5.0', NULL),
(61, 2, 16, '4.0', '5.0', 'apn'),
(62, 3, 16, '4.0', '5.0', 'apn'),
(63, 2, 26, '4.0', '5.0', 'vpn'),
(64, 3, 26, '4.0', '5.0', 'vpn'),
(65, 2, 27, '4.0', '5.0', 'ldap'),
(66, 3, 27, '4.0', '5.0', 'ldap');

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

CREATE TABLE IF NOT EXISTS `platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `description`, `type`, `type_name`, `color`) VALUES
(1, 'Android', 'android phones and tabs', '1', 'Android', '#028482'),
(2, 'iPhone', 'iphone', '2', 'iOS', '#CCCCCC'),
(3, 'iPad', 'ipad', '2', 'iOS', '#CCCCCC'),
(4, 'iPod', 'ipod', '2', 'iOS', '#CCCCCC');

-- --------------------------------------------------------

--
-- Table structure for table `tenantplatformfeatures`
--

CREATE TABLE IF NOT EXISTS `tenantplatformfeatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(45) DEFAULT NULL,
  `platformFeature_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `tenantplatformfeatures`
--

INSERT INTO `tenantplatformfeatures` (`id`, `tenant_id`, `platformFeature_Id`) VALUES
(1, '1', 1),
(2, '1', 2),
(3, '1', 3),
(4, '1', 4),
(5, '1', 5),
(6, '1', 6),
(7, '1', 7),
(8, '1', 8),
(9, '1', 9),
(10, '1', 10),
(11, '1', 11),
(12, '1', 12),
(13, '2', 1),
(14, '2', 2),
(15, '2', 3),
(16, '2', 4),
(17, '2', 6),
(18, '2', 8),
(19, '2', 9),
(20, '2', 12),
(21, '3', 1),
(22, '3', 2),
(23, '3', 3),
(24, '3', 4),
(25, '3', 6),
(26, '3', 8),
(27, '3', 9),
(28, '4', 1),
(29, '4', 2),
(30, '4', 3),
(31, '4', 6),
(32, '4', 8),
(33, '4', 9),
(34, '4', 12);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `fkgroupid` FOREIGN KEY (`group_id`) REFERENCES `featuregroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
