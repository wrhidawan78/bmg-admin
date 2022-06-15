/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.29-0ubuntu0.20.04.3 : Database - bmg-main
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bmg-main` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bmg-main`;

/*Table structure for table `app_version` */

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_version` varchar(10) DEFAULT NULL,
  `inactive` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `app_version` */

insert  into `app_version`(`id`,`app_version`,`inactive`) values 
(1,'1.0.0',0);

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `area` */

insert  into `area`(`id`,`area`,`name`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Head Office','Head Office',0,'2022-04-11 10:39:49',NULL,NULL),
(2,'Jababeka','Jababeka',1,'2022-04-11 10:34:19',NULL,NULL),
(3,'SCBD','SCBD Jakarta 1',1,'2022-04-11 10:40:23',NULL,NULL);

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `id` int NOT NULL,
  `full_path` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attachment` */

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `site_id` int NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `check_in_long` varchar(100) DEFAULT NULL,
  `check_in_lat` varchar(100) DEFAULT NULL,
  `check_out_long` varchar(100) DEFAULT NULL,
  `check_out_lat` varchar(100) DEFAULT NULL,
  `remark` text,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted_by` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`id`,`user_id`,`site_id`,`check_in`,`check_out`,`check_in_long`,`check_in_lat`,`check_out_long`,`check_out_lat`,`remark`,`deleted_at`,`deleted_by`) values 
(16,9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,17,22,'2022-06-14 17:00:55','2022-06-14 17:04:05','106.9177186','-6.1668339','106.9177136','-6.1668289',NULL,NULL,NULL),
(18,17,22,'2022-06-15 08:59:07','2022-06-15 09:01:00','106.9177155','-6.1668298','106.9177121','-6.166832',NULL,NULL,NULL),
(19,17,22,'2022-06-15 09:01:00','2022-06-15 09:06:07','106.9177155','-6.1668298','106.9177226','-6.1668331',NULL,NULL,NULL);

/*Table structure for table `attendance_attachment` */

DROP TABLE IF EXISTS `attendance_attachment`;

CREATE TABLE `attendance_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_id` int NOT NULL,
  `type` smallint NOT NULL DEFAULT '1',
  `full_path` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `attendance_attachment` */

insert  into `attendance_attachment`(`id`,`attendance_id`,`type`,`full_path`,`created_at`,`created_by`,`deleted_at`,`deleted_by`) values 
(23,17,1,'http://127.0.0.1:8000/storage/attendance/images/888699189.jpg',NULL,17,NULL,NULL),
(24,17,2,'http://127.0.0.1:8000/storage/attendance/images/223232499.jpg',NULL,17,NULL,NULL),
(25,18,1,'http://127.0.0.1:8000/storage/attendance/images/8779426.jpg',NULL,17,NULL,NULL),
(26,18,2,'http://127.0.0.1:8000/storage/attendance/images/853282390.jpg',NULL,17,NULL,NULL),
(27,18,2,'http://127.0.0.1:8000/storage/attendance/images/487162035.jpg',NULL,17,NULL,NULL),
(28,19,1,'http://127.0.0.1:8000/storage/attendance/images/873626066.jpg',NULL,17,NULL,NULL),
(29,19,2,'http://127.0.0.1:8000/storage/attendance/images/178227977.jpg',NULL,17,NULL,NULL);

/*Table structure for table `attendance_details` */

DROP TABLE IF EXISTS `attendance_details`;

CREATE TABLE `attendance_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` int NOT NULL,
  `radius` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attendance_details` */

/*Table structure for table `attendance_logs` */

DROP TABLE IF EXISTS `attendance_logs`;

CREATE TABLE `attendance_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  `site_no` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attendance_logs` */

insert  into `attendance_logs`(`id`,`lat`,`long`,`site_no`,`address`,`city`,`province`,`user_id`,`created_at`) values 
(1,-6.1605092,106.9197036,16,NULL,NULL,NULL,0,'2022-06-14 16:31:39'),
(2,-6.1668329,106.9177181,16,NULL,NULL,NULL,0,'2022-06-14 16:34:09'),
(3,-6.1668329,106.9177181,22,NULL,NULL,NULL,0,'2022-06-14 16:34:14'),
(4,-6.1668329,106.9177181,16,NULL,NULL,NULL,0,'2022-06-14 16:34:15'),
(5,-6.1668329,106.9177181,20,NULL,NULL,NULL,0,'2022-06-14 16:34:16'),
(6,-6.1668328,106.9177157,16,NULL,NULL,NULL,0,'2022-06-14 16:34:40'),
(7,-6.1668328,106.9177157,22,NULL,NULL,NULL,0,'2022-06-14 16:34:48'),
(8,-6.1668328,106.9177157,16,NULL,NULL,NULL,0,'2022-06-14 16:34:50'),
(9,-6.1668328,106.9177157,22,NULL,NULL,NULL,0,'2022-06-14 16:34:52'),
(10,-6.1668306,106.9177201,22,NULL,NULL,NULL,0,'2022-06-14 16:35:00'),
(11,-6.1668396,106.9177357,22,NULL,NULL,NULL,0,'2022-06-14 16:35:33'),
(12,-6.166831,106.917717,22,NULL,NULL,NULL,0,'2022-06-14 16:36:06'),
(13,-6.1671423,106.917468,22,NULL,NULL,NULL,0,'2022-06-14 16:36:46'),
(14,-6.1668341,106.9177214,22,NULL,NULL,NULL,0,'2022-06-14 16:37:14'),
(15,-6.1668341,106.9177214,22,NULL,NULL,NULL,0,'2022-06-14 16:37:17'),
(16,-6.1668341,106.9177214,22,NULL,NULL,NULL,0,'2022-06-14 16:37:28'),
(17,-6.1668249,106.9177221,22,NULL,NULL,NULL,0,'2022-06-14 16:37:31'),
(18,-6.1668146,106.9177243,22,NULL,NULL,NULL,0,'2022-06-14 16:37:41'),
(19,-6.166828,106.9177139,22,NULL,NULL,NULL,0,'2022-06-14 16:38:23'),
(20,-6.1668349,106.9177196,22,NULL,NULL,NULL,0,'2022-06-14 16:38:58'),
(21,-6.1668304,106.9177205,22,NULL,NULL,NULL,0,'2022-06-14 16:39:31'),
(22,-6.1668331,106.9177158,22,NULL,NULL,NULL,0,'2022-06-14 16:41:31'),
(23,-6.1668359,106.9177176,22,NULL,NULL,NULL,0,'2022-06-14 16:42:32'),
(24,-6.1668281,106.9177175,22,NULL,NULL,NULL,0,'2022-06-14 16:43:04'),
(25,-6.1668291,106.9177133,22,NULL,NULL,NULL,0,'2022-06-14 16:43:37'),
(26,-6.1666717,106.917789,22,NULL,NULL,NULL,0,'2022-06-14 16:44:00'),
(27,-6.1668325,106.9177157,22,NULL,NULL,NULL,0,'2022-06-14 16:44:38'),
(28,-6.1668325,106.9177157,22,NULL,NULL,NULL,0,'2022-06-14 16:44:52'),
(29,-6.1668106,106.9177768,22,NULL,NULL,NULL,0,'2022-06-14 16:45:04'),
(30,-6.1668106,106.9177768,22,NULL,NULL,NULL,0,'2022-06-14 16:45:19'),
(31,-6.1668309,106.9177172,22,NULL,NULL,NULL,0,'2022-06-14 16:45:42'),
(32,-6.1668309,106.9177172,22,NULL,NULL,NULL,0,'2022-06-14 16:46:10'),
(33,-6.1668294,106.9177141,22,NULL,NULL,NULL,0,'2022-06-14 16:46:14'),
(34,-6.1668131,106.9177136,22,NULL,NULL,NULL,0,'2022-06-14 16:46:47'),
(35,-6.1668347,106.9177169,22,NULL,NULL,NULL,0,'2022-06-14 16:46:50'),
(36,-6.166834,106.9177209,22,NULL,NULL,NULL,0,'2022-06-14 16:47:11'),
(37,-6.166834,106.9177209,22,NULL,NULL,NULL,0,'2022-06-14 16:47:28'),
(38,-6.1668301,106.9177191,22,NULL,NULL,NULL,0,'2022-06-14 16:47:32'),
(39,-6.1668372,106.9177188,22,NULL,NULL,NULL,0,'2022-06-14 16:48:31'),
(40,-6.1668284,106.9177156,22,NULL,NULL,NULL,0,'2022-06-14 16:49:03'),
(41,-6.1668284,106.9177156,22,NULL,NULL,NULL,0,'2022-06-14 16:49:19'),
(42,-6.1668289,106.9177036,22,NULL,NULL,NULL,0,'2022-06-14 16:49:22'),
(43,-6.1668344,106.9177258,22,NULL,NULL,NULL,0,'2022-06-14 16:50:00'),
(44,-6.1668302,106.9177198,22,NULL,NULL,NULL,0,'2022-06-14 16:50:33'),
(45,-6.1668302,106.9177198,22,NULL,NULL,NULL,0,'2022-06-14 16:50:39'),
(46,-6.1667772,106.917776,22,NULL,NULL,NULL,0,'2022-06-14 16:51:00'),
(47,-6.167078,106.9177291,22,NULL,NULL,NULL,0,'2022-06-14 16:51:35'),
(48,-6.1668393,106.9177236,22,NULL,NULL,NULL,0,'2022-06-14 16:52:03'),
(49,-6.1668314,106.9177087,22,NULL,NULL,NULL,0,'2022-06-14 16:52:36'),
(50,-6.1668314,106.9177087,22,NULL,NULL,NULL,0,'2022-06-14 16:52:39'),
(51,-6.1668314,106.9177087,22,NULL,NULL,NULL,0,'2022-06-14 16:53:07'),
(52,-6.1668318,106.9177171,22,NULL,NULL,NULL,0,'2022-06-14 16:53:09'),
(53,-6.1668319,106.9177175,22,NULL,NULL,NULL,0,'2022-06-14 16:53:47'),
(54,-6.1668342,106.9177213,22,NULL,NULL,NULL,0,'2022-06-14 16:54:28'),
(55,-6.1668342,106.9177213,22,NULL,NULL,NULL,0,'2022-06-14 16:54:47'),
(56,-6.1668419,106.9177393,22,NULL,NULL,NULL,0,'2022-06-14 16:54:50'),
(57,-6.1668321,106.9177166,22,NULL,NULL,NULL,0,'2022-06-14 16:55:28'),
(58,-6.1669778,106.9177217,22,NULL,NULL,NULL,0,'2022-06-14 16:56:12'),
(59,-6.1668315,106.9177146,22,NULL,NULL,NULL,0,'2022-06-14 16:56:36'),
(60,-6.1668377,106.9177233,22,NULL,NULL,NULL,0,'2022-06-14 16:57:09'),
(61,-6.1668479,106.9177279,22,NULL,NULL,NULL,0,'2022-06-14 16:57:41'),
(62,-6.1668479,106.9177279,22,NULL,NULL,NULL,0,'2022-06-14 16:58:05'),
(63,-6.1668325,106.9177149,22,NULL,NULL,NULL,0,'2022-06-14 16:58:09'),
(64,-6.1668338,106.9177258,22,NULL,NULL,NULL,0,'2022-06-14 16:58:47'),
(65,-6.1668364,106.9177198,22,NULL,NULL,NULL,0,'2022-06-14 16:59:49'),
(66,-6.1668306,106.9177206,22,NULL,NULL,NULL,0,'2022-06-14 16:59:52'),
(67,-6.1668339,106.9177186,22,NULL,NULL,NULL,0,'2022-06-14 17:00:30'),
(68,-6.1668339,106.9177186,22,NULL,NULL,NULL,0,'2022-06-14 17:00:46'),
(69,-6.1670058,106.9177343,22,NULL,NULL,NULL,0,'2022-06-14 17:01:09'),
(70,-6.1668296,106.917714,22,NULL,NULL,NULL,0,'2022-06-14 17:01:38'),
(71,-6.1668326,106.9177194,22,NULL,NULL,NULL,0,'2022-06-14 17:02:11'),
(72,-6.1668339,106.9177126,22,NULL,NULL,NULL,0,'2022-06-14 17:02:43'),
(73,-6.166832,106.9177131,22,NULL,NULL,NULL,0,'2022-06-14 17:03:16'),
(74,-6.1668289,106.9177136,22,NULL,NULL,NULL,0,'2022-06-14 17:03:49'),
(75,-6.166833,106.9177103,22,NULL,NULL,NULL,0,'2022-06-14 17:04:22'),
(76,-6.1668335,106.9177156,22,NULL,NULL,NULL,0,'2022-06-14 17:04:55'),
(77,-6.1668317,106.9177176,22,NULL,NULL,NULL,0,'2022-06-14 17:05:27'),
(78,-6.1667398,106.9177133,22,NULL,NULL,NULL,0,'2022-06-14 17:06:05'),
(79,-6.1668324,106.9177179,22,NULL,NULL,NULL,0,'2022-06-14 17:07:31'),
(80,-6.1668389,106.9177239,22,NULL,NULL,NULL,0,'2022-06-14 17:08:04'),
(81,-6.1668316,106.9177174,22,NULL,NULL,NULL,0,'2022-06-14 17:08:37'),
(82,-6.1668393,106.9177224,22,NULL,NULL,NULL,0,'2022-06-14 17:09:10'),
(83,-6.166841,106.9177218,22,NULL,NULL,NULL,0,'2022-06-14 17:09:43'),
(84,-6.1668367,106.9177133,22,NULL,NULL,NULL,0,'2022-06-14 17:10:15'),
(85,-6.1668128,106.9177226,22,NULL,NULL,NULL,0,'2022-06-14 17:10:53'),
(86,-6.1668331,106.9177185,22,NULL,NULL,NULL,0,'2022-06-14 17:11:47'),
(87,-6.1668291,106.9177226,22,NULL,NULL,NULL,0,'2022-06-14 17:12:20'),
(88,-6.1668293,106.9177219,22,NULL,NULL,NULL,0,'2022-06-14 17:12:53'),
(89,-6.1668284,106.9177154,22,NULL,NULL,NULL,0,'2022-06-14 17:13:25'),
(90,-6.1668289,106.9177154,22,NULL,NULL,NULL,0,'2022-06-14 17:13:58'),
(91,-6.1668378,106.9177231,22,NULL,NULL,NULL,0,'2022-06-14 17:14:31'),
(92,-6.1668364,106.9177251,22,NULL,NULL,NULL,0,'2022-06-14 17:15:04'),
(93,-6.1668306,106.9177211,22,NULL,NULL,NULL,0,'2022-06-14 17:15:37'),
(94,-6.1665405,106.9177335,22,NULL,NULL,NULL,0,'2022-06-14 17:16:10'),
(95,-6.1668298,106.9177144,22,NULL,NULL,NULL,0,'2022-06-14 17:16:42'),
(96,-6.1668319,106.9177213,22,NULL,NULL,NULL,0,'2022-06-15 08:58:20'),
(97,-6.1668545,106.91777,22,NULL,NULL,NULL,0,'2022-06-15 08:58:42'),
(98,-6.1668545,106.91777,22,NULL,NULL,NULL,0,'2022-06-15 08:59:07'),
(99,-6.166832,106.9177121,22,NULL,NULL,NULL,0,'2022-06-15 08:59:11'),
(100,-6.1668453,106.9177303,22,NULL,NULL,NULL,0,'2022-06-15 08:59:49'),
(101,-6.1668345,106.9177236,22,NULL,NULL,NULL,0,'2022-06-15 09:00:22'),
(102,-6.1668329,106.9177181,22,NULL,NULL,NULL,0,'2022-06-15 09:00:54'),
(103,-6.1668329,106.9177181,22,NULL,NULL,NULL,0,'2022-06-15 09:01:00'),
(104,-6.1668341,106.9177153,22,NULL,NULL,NULL,0,'2022-06-15 09:01:27'),
(105,-6.1668295,106.9177225,22,NULL,NULL,NULL,0,'2022-06-15 09:02:00'),
(106,-6.1668391,106.9177166,22,NULL,NULL,NULL,0,'2022-06-15 09:02:33'),
(107,-6.16683,106.9177196,22,NULL,NULL,NULL,0,'2022-06-15 09:03:05'),
(108,-6.166832,106.9177091,22,NULL,NULL,NULL,0,'2022-06-15 09:03:55'),
(109,-6.166832,106.9177091,22,NULL,NULL,NULL,0,'2022-06-15 09:04:24'),
(110,-6.166833,106.9177201,22,NULL,NULL,NULL,0,'2022-06-15 09:04:28'),
(111,-6.1668442,106.9177285,22,NULL,NULL,NULL,0,'2022-06-15 09:05:06'),
(112,-6.1668442,106.9177285,22,NULL,NULL,NULL,0,'2022-06-15 09:05:23'),
(113,-6.1668327,106.9177215,22,NULL,NULL,NULL,0,'2022-06-15 09:05:27'),
(114,-6.1668344,106.9177216,22,NULL,NULL,NULL,0,'2022-06-15 09:06:13'),
(115,-6.1668459,106.9177478,22,NULL,NULL,NULL,0,'2022-06-15 09:06:45'),
(116,-6.1668526,106.9177394,22,NULL,NULL,NULL,0,'2022-06-15 09:06:58'),
(117,-6.1668409,106.91772,22,NULL,NULL,NULL,0,'2022-06-15 09:07:31'),
(118,-6.1668335,106.9177195,22,NULL,NULL,NULL,0,'2022-06-15 09:08:05'),
(119,-6.166831,106.9177191,22,NULL,NULL,NULL,0,'2022-06-15 09:08:37'),
(120,-6.1668417,106.9177213,22,NULL,NULL,NULL,0,'2022-06-15 09:09:09'),
(121,-6.1668316,106.9177086,22,NULL,NULL,NULL,0,'2022-06-15 09:09:42'),
(122,-6.1668325,106.9177136,22,NULL,NULL,NULL,0,'2022-06-15 09:10:14'),
(123,-6.166836,106.9177275,22,NULL,NULL,NULL,0,'2022-06-15 09:11:16'),
(124,-6.1668314,106.917721,22,NULL,NULL,NULL,0,'2022-06-15 09:11:48'),
(125,-6.1668414,106.9177136,22,NULL,NULL,NULL,0,'2022-06-15 09:12:21'),
(126,-6.1668403,106.9177227,22,NULL,NULL,NULL,0,'2022-06-15 09:12:54'),
(127,-6.1666395,106.9178474,22,NULL,NULL,NULL,0,'2022-06-15 09:32:16'),
(128,-6.1668284,106.9177143,22,NULL,NULL,NULL,0,'2022-06-15 09:32:52'),
(129,-6.1668272,106.9177154,22,NULL,NULL,NULL,0,'2022-06-15 09:53:18'),
(130,-6.1668272,106.9177154,22,NULL,NULL,NULL,0,'2022-06-15 09:53:53'),
(131,-6.1669864,106.9177021,22,NULL,NULL,NULL,0,'2022-06-15 09:53:55'),
(132,-6.1668098,106.9177266,22,NULL,NULL,NULL,0,'2022-06-15 10:04:57'),
(133,-6.1668275,106.9177103,22,NULL,NULL,NULL,0,'2022-06-15 10:05:22'),
(134,-6.1668294,106.9177147,22,NULL,NULL,NULL,0,'2022-06-15 10:05:55'),
(135,-6.166827,106.9177113,22,NULL,NULL,NULL,0,'2022-06-15 10:06:28'),
(136,-6.1668377,106.9177365,22,NULL,NULL,NULL,0,'2022-06-15 10:10:11'),
(137,-6.1668277,106.917714,22,NULL,NULL,NULL,0,'2022-06-15 10:11:52'),
(138,-6.1668277,106.917714,22,NULL,NULL,NULL,0,'2022-06-15 10:12:09'),
(139,-6.1668179,106.9177242,22,NULL,NULL,NULL,0,'2022-06-15 10:19:22'),
(140,-6.1668458,106.9177503,22,NULL,NULL,NULL,0,'2022-06-15 10:20:17'),
(141,-6.1668281,106.9177141,22,NULL,NULL,NULL,0,'2022-06-15 10:20:50'),
(142,-6.1668297,106.9177146,22,NULL,NULL,NULL,0,'2022-06-15 10:21:22'),
(143,-6.1668269,106.9177124,22,NULL,NULL,NULL,0,'2022-06-15 10:21:54'),
(144,-6.1669756,106.9176401,22,NULL,NULL,NULL,0,'2022-06-15 10:22:29'),
(145,-6.166826,106.9177137,22,NULL,NULL,NULL,0,'2022-06-15 10:23:00'),
(146,-6.1668277,106.9177124,22,NULL,NULL,NULL,0,'2022-06-15 10:23:33'),
(147,-6.1668246,106.9177146,22,NULL,NULL,NULL,0,'2022-06-15 10:24:05'),
(148,-6.1668265,106.9177115,22,NULL,NULL,NULL,0,'2022-06-15 10:24:38'),
(149,-6.1668256,106.9177135,22,NULL,NULL,NULL,0,'2022-06-15 10:25:11'),
(150,-6.1668283,106.9177125,22,NULL,NULL,NULL,0,'2022-06-15 10:25:43'),
(151,-6.1668306,106.9177141,22,NULL,NULL,NULL,0,'2022-06-15 10:26:17'),
(152,-6.166826,106.9177154,22,NULL,NULL,NULL,0,'2022-06-15 10:26:49'),
(153,-6.166826,106.9177154,22,NULL,NULL,NULL,0,'2022-06-15 10:26:58'),
(154,-6.1668299,106.9177151,22,NULL,NULL,NULL,0,'2022-06-15 10:28:09'),
(155,-6.1668273,106.9177128,22,NULL,NULL,NULL,0,'2022-06-15 10:28:43'),
(156,-6.1668271,106.9177101,22,NULL,NULL,NULL,0,'2022-06-15 10:30:03'),
(157,-6.1668311,106.9177171,22,NULL,NULL,NULL,0,'2022-06-15 10:39:07'),
(158,-6.1668271,106.9177142,22,NULL,NULL,NULL,0,'2022-06-15 10:39:40'),
(159,-6.1671865,106.9175912,22,'Jalan Pegangsaan Dua 64, Pegangsaan Dua, Kecamatan Kelapa Gading','Kota Jakarta Utara','Daerah Khusus Ibukota Jakarta',0,'2022-06-15 11:03:42');

/*Table structure for table `clusters` */

DROP TABLE IF EXISTS `clusters`;

CREATE TABLE `clusters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `clusters` */

insert  into `clusters`(`id`,`area`,`area_id`,`name`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Jakarta',1,'Jakarta Raya',1,'2022-03-26 09:29:40',NULL,NULL),
(2,'Jababeka',2,'Cikarang',1,'2022-04-10 11:33:09','2022-04-11 11:30:02',NULL),
(3,'SCBD Jakarta 1',3,'Bursa Efek Indonesia',1,'2022-04-11 11:30:47',NULL,NULL);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `param_code` varchar(255) DEFAULT NULL,
  `param_title` varchar(25) DEFAULT NULL,
  `param_value` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `inactive` smallint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `config` */

insert  into `config`(`id`,`param_code`,`param_title`,`param_value`,`message`,`inactive`) values 
(1,'max_radius_m','max_radius_m','2000','maksimum radius',0);

/*Table structure for table `division` */

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `division_id` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `division` */

insert  into `division`(`id`,`division_id`,`name`,`created_at`,`deleted_at`) values 
(1,'IT','IT','2022-03-26 09:27:34',NULL),
(2,'Finance Accounting','Finance Accounting','2022-03-26 09:28:34',NULL),
(3,'HRD/GA','HRD/GA','2022-04-02 12:39:37',NULL),
(4,'ICT','Information Communication and Technology','2022-04-10 22:18:44',NULL),
(5,'Marketing','Marketing','2022-04-12 08:39:15',NULL);

/*Table structure for table `employment` */

DROP TABLE IF EXISTS `employment`;

CREATE TABLE `employment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthday_date` date NOT NULL,
  `refference_no` varchar(255) DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `cluster_id` int DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `resign_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `supervisor_id` int DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `employment` */

insert  into `employment`(`id`,`name`,`birthday_date`,`refference_no`,`division_id`,`cluster_id`,`mobile_phone`,`gender`,`religion`,`address`,`status`,`join_date`,`resign_date`,`created_at`,`deleted_at`,`supervisor_id`) values 
(3,'Yos','1998-06-10','100-001',1,NULL,NULL,'1','1',NULL,'1',NULL,NULL,NULL,NULL,NULL),
(1,'Admin','1998-06-10','100-000',1,NULL,NULL,'1','1',NULL,'1',NULL,NULL,NULL,NULL,NULL),
(2,'Rian','1998-06-10','100-002',1,1,'081918291218','1','1',NULL,'1',NULL,NULL,'2022-04-02 12:31:58',NULL,1);

/*Table structure for table `logs_api` */

DROP TABLE IF EXISTS `logs_api`;

CREATE TABLE `logs_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `province` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `logs_api` */

insert  into `logs_api`(`id`,`ip`,`method`,`url`,`headers`,`body`,`address`,`city`,`province`,`created_at`,`updated_at`) values 
(1,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','ABC123','','','','2022-06-13 15:13:46','2022-06-13 15:13:46'),
(2,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','ABC123','','','','2022-06-13 15:15:17','2022-06-13 15:15:17'),
(3,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/reimburstment','ReimbursmentController','ABC123','','','','2022-06-13 16:03:45','2022-06-13 16:03:45'),
(4,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/site','SiteController','ABC123','','','','2022-06-13 16:03:52','2022-06-13 16:03:52'),
(5,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','ABC123','','','','2022-06-13 16:04:00','2022-06-13 16:04:00'),
(6,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/employee/show','EmployeeController','ABC123, 123','','','','2022-06-13 16:04:52','2022-06-13 16:04:52'),
(7,'127.0.0.1(user:9)','GET','http://127.0.0.1:8000/api/employee/show','EmployeeController','ABC123, 9','','','','2022-06-13 16:05:14','2022-06-13 16:05:14'),
(8,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/employee/show','EmployeeController','9','','','','2022-06-13 16:05:35','2022-06-13 16:05:35'),
(9,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:09:56','2022-06-14 14:09:56'),
(10,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:17:36','2022-06-14 14:17:36'),
(11,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:17:52','2022-06-14 14:17:52'),
(12,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:19:56','2022-06-14 14:19:56'),
(13,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:20:12','2022-06-14 14:20:12'),
(14,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:20:48','2022-06-14 14:20:48'),
(15,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:20:56','2022-06-14 14:20:56'),
(16,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:38:06','2022-06-14 14:38:06'),
(17,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 14:39:02','2022-06-14 14:39:02'),
(18,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 15:06:46','2022-06-14 15:06:46'),
(19,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:04:02','2022-06-14 16:04:02'),
(20,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:05:28','2022-06-14 16:05:28'),
(21,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:11:09','2022-06-14 16:11:09'),
(22,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:15:02','2022-06-14 16:15:02'),
(23,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:15:57','2022-06-14 16:15:57'),
(24,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','0ae717583a742be8','','','','2022-06-14 16:17:10','2022-06-14 16:17:10'),
(25,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','0ae717583a742be8','','','','2022-06-14 16:20:01','2022-06-14 16:20:01'),
(26,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668286, 106.9177147','','','','2022-06-14 16:20:01','2022-06-14 16:20:01'),
(27,'192.168.8.12(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:21:59','2022-06-14 16:21:59'),
(28,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:22:48','2022-06-14 16:22:48'),
(29,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668353, 106.9177222','','','','2022-06-14 16:22:48','2022-06-14 16:22:48'),
(30,'192.168.8.12(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','','','','','2022-06-14 16:24:23','2022-06-14 16:24:23'),
(31,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:26:50','2022-06-14 16:26:50'),
(32,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668295, 106.9177158','','','','2022-06-14 16:26:50','2022-06-14 16:26:50'),
(33,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:28:10','2022-06-14 16:28:10'),
(34,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668299, 106.9177155','','','','2022-06-14 16:28:10','2022-06-14 16:28:10'),
(35,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:31:17','2022-06-14 16:31:17'),
(36,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668306, 106.9177175','','','','2022-06-14 16:31:17','2022-06-14 16:31:17'),
(37,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:32:19','2022-06-14 16:32:19'),
(38,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24','','','','2022-06-14 16:33:35','2022-06-14 16:33:35'),
(39,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:33:50','2022-06-14 16:33:50'),
(40,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668329, 106.9177181','','','','2022-06-14 16:33:50','2022-06-14 16:33:50'),
(41,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:34:22','2022-06-14 16:34:22'),
(42,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668328, 106.9177157','','','','2022-06-14 16:34:22','2022-06-14 16:34:22'),
(43,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:38:07','2022-06-14 16:38:07'),
(44,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668286, 106.917712','','','','2022-06-14 16:38:07','2022-06-14 16:38:07'),
(45,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:39:32','2022-06-14 16:39:32'),
(46,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668304, 106.9177205','','','','2022-06-14 16:39:33','2022-06-14 16:39:33'),
(47,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:39:58','2022-06-14 16:39:58'),
(48,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668299, 106.917716','','','','2022-06-14 16:39:59','2022-06-14 16:39:59'),
(49,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:40:38','2022-06-14 16:40:38'),
(50,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668284, 106.9177141','','','','2022-06-14 16:40:38','2022-06-14 16:40:38'),
(51,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:41:19','2022-06-14 16:41:19'),
(52,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668331, 106.9177158','','','','2022-06-14 16:41:20','2022-06-14 16:41:20'),
(53,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:41:54','2022-06-14 16:41:54'),
(54,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668309, 106.9177149','','','','2022-06-14 16:41:54','2022-06-14 16:41:54'),
(55,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:43:43','2022-06-14 16:43:43'),
(56,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668291, 106.9177133','','','','2022-06-14 16:43:43','2022-06-14 16:43:43'),
(57,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:44:00','2022-06-14 16:44:00'),
(58,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1666717, 106.917789','','','','2022-06-14 16:44:00','2022-06-14 16:44:00'),
(59,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:44:40','2022-06-14 16:44:40'),
(60,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668325, 106.9177157','','','','2022-06-14 16:44:40','2022-06-14 16:44:40'),
(61,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:46:25','2022-06-14 16:46:25'),
(62,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668131, 106.9177136','','','','2022-06-14 16:46:25','2022-06-14 16:46:25'),
(63,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:47:53','2022-06-14 16:47:53'),
(64,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668329, 106.9177235','','','','2022-06-14 16:47:54','2022-06-14 16:47:54'),
(65,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:53:51','2022-06-14 16:53:51'),
(66,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668319, 106.9177175','','','','2022-06-14 16:53:51','2022-06-14 16:53:51'),
(67,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 16:59:17','2022-06-14 16:59:17'),
(68,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668364, 106.9177198','','','','2022-06-14 16:59:17','2022-06-14 16:59:17'),
(69,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/in','AttendanceController','22, -6.1668339, 106.9177186, 0ae717583a742be8, /tmp/php5dqchs','','','','2022-06-14 17:00:55','2022-06-14 17:00:55'),
(70,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24','','','','2022-06-14 17:00:56','2022-06-14 17:00:56'),
(71,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24','','','','2022-06-14 17:01:30','2022-06-14 17:01:30'),
(72,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24','','','','2022-06-14 17:02:04','2022-06-14 17:02:04'),
(73,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:02:58','2022-06-14 17:02:58'),
(74,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:04','2022-06-14 17:03:04'),
(75,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:11','2022-06-14 17:03:11'),
(76,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:16','2022-06-14 17:03:16'),
(77,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-05-27?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:38','2022-06-14 17:03:38'),
(78,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:44','2022-06-14 17:03:44'),
(79,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:03:52','2022-06-14 17:03:52'),
(80,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/out','AttendanceController','17, 22, -6.1668289, 106.9177136, 0ae717583a742be8, /tmp/phpPivG7r','','','','2022-06-14 17:04:05','2022-06-14 17:04:05'),
(81,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:04:06','2022-06-14 17:04:06'),
(82,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:04:41','2022-06-14 17:04:41'),
(83,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 17:06:29','2022-06-14 17:06:29'),
(84,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668306, 106.9177138','','','','2022-06-14 17:06:29','2022-06-14 17:06:29'),
(85,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 17:06:53','2022-06-14 17:06:53'),
(86,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668337, 106.9177112','','','','2022-06-14 17:06:53','2022-06-14 17:06:53'),
(87,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:07:41','2022-06-14 17:07:41'),
(88,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 17:11:07','2022-06-14 17:11:07'),
(89,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668382, 106.9177241','','','','2022-06-14 17:11:07','2022-06-14 17:11:07'),
(90,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24?uniq_id=0ae717583a742be8','','','','2022-06-14 17:15:51','2022-06-14 17:15:51'),
(91,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24','','','','2022-06-14 17:15:54','2022-06-14 17:15:54'),
(92,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-14 17:16:46','2022-06-14 17:16:46'),
(93,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-14 17:17:03','2022-06-14 17:17:03'),
(94,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-14 17:17:14','2022-06-14 17:17:14'),
(95,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668284, 106.9177134','','','','2022-06-14 17:17:14','2022-06-14 17:17:14'),
(96,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 08:57:47','2022-06-15 08:57:47'),
(97,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668298, 106.9177155','','','','2022-06-15 08:57:47','2022-06-15 08:57:47'),
(98,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/in','AttendanceController','22, -6.1668298, 106.9177155, 0ae717583a742be8, /tmp/phpDBNgSO','','','','2022-06-15 08:59:07','2022-06-15 08:59:07'),
(99,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 08:59:08','2022-06-15 08:59:08'),
(100,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/out','AttendanceController','18, 22, -6.166832, 106.9177121, 0ae717583a742be8, /tmp/phpfUTKXO','','','','2022-06-15 08:59:34','2022-06-15 08:59:34'),
(101,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 08:59:35','2022-06-15 08:59:35'),
(102,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:00:52','2022-06-15 09:00:52'),
(103,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:01:00','2022-06-15 09:01:00'),
(104,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/out','AttendanceController','18, 22, -6.166832, 106.9177121, 0ae717583a742be8, /tmp/php6u7RyO','','','','2022-06-15 09:01:00','2022-06-15 09:01:00'),
(105,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/in','AttendanceController','22, -6.1668298, 106.9177155, 0ae717583a742be8, /tmp/phpZ7HBFN','','','','2022-06-15 09:01:00','2022-06-15 09:01:00'),
(106,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:01:09','2022-06-15 09:01:09'),
(107,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:03:16','2022-06-15 09:03:16'),
(108,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668298, 106.9177207','','','','2022-06-15 09:03:16','2022-06-15 09:03:16'),
(109,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:05:35','2022-06-15 09:05:35'),
(110,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668331, 106.9177226','','','','2022-06-15 09:05:36','2022-06-15 09:05:36'),
(111,'10.42.0.204(user:17)','POST','http://192.168.8.12:7777/api/attendance/out','AttendanceController','19, 22, -6.1668331, 106.9177226, 0ae717583a742be8, /tmp/php8kDPrM','','','','2022-06-15 09:06:07','2022-06-15 09:06:07'),
(112,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController','1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:06:08','2022-06-15 09:06:08'),
(113,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:06:51','2022-06-15 09:06:51'),
(114,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668526, 106.9177394','','','','2022-06-15 09:06:52','2022-06-15 09:06:52'),
(115,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:10:29','2022-06-15 09:10:29'),
(116,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668293, 106.9177194','','','','2022-06-15 09:10:29','2022-06-15 09:10:29'),
(117,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:10:38','2022-06-15 09:10:38'),
(118,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.166829, 106.9177239','','','','2022-06-15 09:10:38','2022-06-15 09:10:38'),
(119,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:11:45','2022-06-15 09:11:45'),
(120,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:12:49','2022-06-15 09:12:49'),
(121,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 09:31:03','2022-06-15 09:31:03'),
(122,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:31:48','2022-06-15 09:31:48'),
(123,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668301, 106.9177226','','','','2022-06-15 09:31:48','2022-06-15 09:31:48'),
(124,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:52:40','2022-06-15 09:52:40'),
(125,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668289, 106.9177163','','','','2022-06-15 09:52:40','2022-06-15 09:52:40'),
(126,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:54:57','2022-06-15 09:54:57'),
(127,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.166825, 106.9177133','','','','2022-06-15 09:54:57','2022-06-15 09:54:57'),
(128,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:55:14','2022-06-15 09:55:14'),
(129,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668268, 106.9177134','','','','2022-06-15 09:55:14','2022-06-15 09:55:14'),
(130,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 09:55:36','2022-06-15 09:55:36'),
(131,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668243, 106.9177187','','','','2022-06-15 09:55:36','2022-06-15 09:55:36'),
(132,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:00:01','2022-06-15 10:00:01'),
(133,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668266, 106.917717','','','','2022-06-15 10:00:02','2022-06-15 10:00:02'),
(134,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:00:34','2022-06-15 10:00:34'),
(135,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668284, 106.9177121','','','','2022-06-15 10:00:34','2022-06-15 10:00:34'),
(136,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:04:30','2022-06-15 10:04:30'),
(137,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.166826, 106.9177121','','','','2022-06-15 10:04:30','2022-06-15 10:04:30'),
(138,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:09:57','2022-06-15 10:09:57'),
(139,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668377, 106.9177365','','','','2022-06-15 10:09:57','2022-06-15 10:09:57'),
(140,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:10:21','2022-06-15 10:10:21'),
(141,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1671767, 106.9176749','','','','2022-06-15 10:10:22','2022-06-15 10:10:22'),
(142,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:10:43','2022-06-15 10:10:43'),
(143,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1667006, 106.9178643','','','','2022-06-15 10:10:43','2022-06-15 10:10:43'),
(144,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:10:53','2022-06-15 10:10:53'),
(145,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1667006, 106.9178643','','','','2022-06-15 10:10:53','2022-06-15 10:10:53'),
(146,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:11:12','2022-06-15 10:11:12'),
(147,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668862, 106.917751','','','','2022-06-15 10:11:12','2022-06-15 10:11:12'),
(148,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:19:10','2022-06-15 10:19:10'),
(149,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668261, 106.9177172','','','','2022-06-15 10:19:11','2022-06-15 10:19:11'),
(150,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:19:37','2022-06-15 10:19:37'),
(151,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668179, 106.9177242','','','','2022-06-15 10:19:37','2022-06-15 10:19:37'),
(152,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:27:08','2022-06-15 10:27:08'),
(153,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668405, 106.9177072','','','','2022-06-15 10:27:09','2022-06-15 10:27:09'),
(154,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:27:32','2022-06-15 10:27:32'),
(155,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668341, 106.9177163','','','','2022-06-15 10:27:32','2022-06-15 10:27:32'),
(156,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:28:58','2022-06-15 10:28:58'),
(157,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668423, 106.9177109','','','','2022-06-15 10:28:58','2022-06-15 10:28:58'),
(158,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:29:25','2022-06-15 10:29:25'),
(159,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668402, 106.9177579','','','','2022-06-15 10:29:26','2022-06-15 10:29:26'),
(160,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:30:33','2022-06-15 10:30:33'),
(161,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668276, 106.917715','','','','2022-06-15 10:30:34','2022-06-15 10:30:34'),
(162,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:30:38','2022-06-15 10:30:38'),
(163,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668262, 106.9177139','','','','2022-06-15 10:30:39','2022-06-15 10:30:39'),
(164,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 10:38:27','2022-06-15 10:38:27'),
(165,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.166834, 106.9177156','','','','2022-06-15 10:38:27','2022-06-15 10:38:27'),
(166,'10.42.0.204(user:17)','GET','http://192.168.8.12:7777/api/reimburstment','ReimbursmentController','1, 1, 20, 2022-05-25, 2022-06-24, 0ae717583a742be8','','','','2022-06-15 10:38:49','2022-06-15 10:38:49'),
(167,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-15 10:46:12','2022-06-15 10:46:12'),
(168,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:46:13','2022-06-15 10:46:13'),
(169,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:18','2022-06-15 10:46:18'),
(170,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:46:18','2022-06-15 10:46:18'),
(171,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController','3, 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:22','2022-06-15 10:46:22'),
(172,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController','2, 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:24','2022-06-15 10:46:24'),
(173,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController','1, 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:25','2022-06-15 10:46:25'),
(174,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-15 10:46:30','2022-06-15 10:46:30'),
(175,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:46:30','2022-06-15 10:46:30'),
(176,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:46:32','2022-06-15 10:46:32'),
(177,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:32','2022-06-15 10:46:32'),
(178,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:46:54','2022-06-15 10:46:54'),
(179,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:46:54','2022-06-15 10:46:54'),
(180,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:48:27','2022-06-15 10:48:27'),
(181,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/site','SiteController',', 1, 20','','','','2022-06-15 10:48:27','2022-06-15 10:48:27'),
(182,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:48:27','2022-06-15 10:48:27'),
(183,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:49:54','2022-06-15 10:49:54'),
(184,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:49:54','2022-06-15 10:49:54'),
(185,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-15 10:53:11','2022-06-15 10:53:11'),
(186,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:53:11','2022-06-15 10:53:11'),
(187,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:53:12','2022-06-15 10:53:12'),
(188,'192.168.8.12(user:0)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController','','','','','2022-06-15 10:55:43','2022-06-15 10:55:43'),
(189,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:57:02','2022-06-15 10:57:02'),
(190,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:57:02','2022-06-15 10:57:02'),
(191,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 2, 20','','','','2022-06-15 10:57:09','2022-06-15 10:57:09'),
(192,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 3, 20','','','','2022-06-15 10:57:11','2022-06-15 10:57:11'),
(193,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 4, 20','','','','2022-06-15 10:57:12','2022-06-15 10:57:12'),
(194,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 3, 20','','','','2022-06-15 10:57:20','2022-06-15 10:57:20'),
(195,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-15 10:57:28','2022-06-15 10:57:28'),
(196,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:57:28','2022-06-15 10:57:28'),
(197,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:57:32','2022-06-15 10:57:32'),
(198,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/attendance/view/logs','AttendanceController',', 2022-06-15, 2022-06-15, 1, 20','','','','2022-06-15 10:57:32','2022-06-15 10:57:32'),
(199,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:57:59','2022-06-15 10:57:59'),
(200,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/site','SiteController',', 1, 20','','','','2022-06-15 10:57:59','2022-06-15 10:57:59'),
(201,'192.168.8.1(user:21)','GET','http://192.168.8.12:7777/api/employee','EmployeeController','','','','','2022-06-15 10:57:59','2022-06-15 10:57:59'),
(202,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-15 11:03:14','2022-06-15 11:03:14'),
(203,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668283, 106.9177184','','','','2022-06-15 11:03:14','2022-06-15 11:03:14');

/*Table structure for table `master_site` */

DROP TABLE IF EXISTS `master_site`;

CREATE TABLE `master_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `metadata` text,
  `address` text,
  `status` varchar(255) DEFAULT NULL,
  `pic` varchar(200) DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `image_attachment` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `approved_by` (`approved_by`),
  KEY `deleted_by` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `master_site` */

insert  into `master_site`(`id`,`site_id`,`name`,`long`,`lat`,`metadata`,`address`,`status`,`pic`,`created_at`,`created_by`,`approved_at`,`approved_by`,`deleted_at`,`deleted_by`,`image_attachment`) values 
(16,'CBT-123','Pasar Cibitung','106.9153422','-6.1668048',NULL,'Cibitung','1','','2022-03-30 17:05:41',3,NULL,NULL,NULL,NULL,383315742),
(20,'MONAS1','Monumen Nasional','106.8271528','-6.1753924',NULL,'Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta','1','','2022-04-03 12:25:49',3,NULL,NULL,NULL,NULL,696981876),
(21,'MONAS2','Monumen Nasional','106.8271528','-6.1753924',NULL,'Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta','1','','2022-04-03 12:51:20',3,NULL,NULL,NULL,NULL,356586011),
(22,'WRTG021','Warteg Mamake','106.91774418577552','-6.166827705353052',NULL,'Jl. Pegangsaan Dua No.64, RT.3/RW.19, Pegangsaan Dua, Kec. Klp. Gading, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14250, Indonesia','1','','2022-04-07 09:16:46',4,NULL,NULL,NULL,NULL,500634978),
(23,'WRTGRZK01','Warteg Rizky','106.85916842892766','-6.246260362507156',NULL,'No. Pancoran, Jl. Cikoko Timur Raya No.8, RT.4/RW.1, Cikoko, Kec. Pancoran, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12770, Indonesia','1','','2022-04-08 18:10:36',4,NULL,NULL,NULL,NULL,263164576),
(24,'MRGCTY021','Margo City','106.8346462','-6.3730259',NULL,'Jl. Margonda Raya No.358, Kemiri Muka, Kecamatan Beji, Kota Depok, Jawa Barat 16423','1','','2022-04-10 13:31:50',4,NULL,NULL,NULL,NULL,619950091),
(25,'MRGCTY021','Margo City 2','106.8346462','-6.3730259',NULL,'Jl. Margonda Raya No.358, Kemiri Muka, Kecamatan Beji, Kota Depok, Jawa Barat 16423','1','','2022-04-10 14:38:11',4,NULL,NULL,NULL,NULL,888044279);

/*Table structure for table `master_site_attachment` */

DROP TABLE IF EXISTS `master_site_attachment`;

CREATE TABLE `master_site_attachment` (
  `id` int NOT NULL,
  `site_id` int NOT NULL,
  `full_path` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `master_site_attachment` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2021_10_01_221530_create_my_table_migration',1),
(2,'2021_11_16_064344_add_cluster',1),
(3,'2021_11_16_064422_add_area_table',1),
(4,'2021_11_16_230014_add_cluster_area_in_employment',1),
(5,'2021_11_17_210048_add_site_employe_table',1),
(6,'2021_11_17_235113_create_attendance_details_table',1),
(7,'2021_11_21_100619_add_site_id_master_site',1),
(8,'2021_11_21_100940_add_division_id_division',1),
(9,'2021_11_21_131347_add_status_in_site_employees',1),
(10,'2021_11_22_103436_change_id_attendance_auto_inc',1),
(12,'2021_10_01_221530_create_my_table_migration',1);

/*Table structure for table `reimburstment` */

DROP TABLE IF EXISTS `reimburstment`;

CREATE TABLE `reimburstment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_no` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `reimburstment_date` date DEFAULT NULL,
  `image_attachment` int DEFAULT NULL,
  `status` smallint DEFAULT '0',
  `submited_by` int DEFAULT NULL,
  `submited_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `confirm_by` int DEFAULT NULL,
  `confirm_at` datetime DEFAULT NULL,
  `reject_by` int DEFAULT NULL,
  `reject_at` datetime DEFAULT NULL,
  `reject_reason` text,
  `metadata` text,
  `genset_start` varchar(50) DEFAULT '',
  `genset_end` varchar(50) DEFAULT '',
  `genset_total` varchar(50) DEFAULT '',
  `no_genset` varchar(50) DEFAULT '',
  `km_mobil` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_no` (`document_no`),
  KEY `submited_by` (`submited_by`),
  KEY `approved_by` (`approved_by`),
  KEY `confirm_by` (`confirm_by`),
  KEY `reject_by` (`reject_by`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `reimburstment` */

insert  into `reimburstment`(`id`,`document_no`,`title`,`total`,`note`,`reimburstment_date`,`image_attachment`,`status`,`submited_by`,`submited_at`,`approved_by`,`approved_at`,`confirm_by`,`confirm_at`,`reject_by`,`reject_at`,`reject_reason`,`metadata`,`genset_start`,`genset_end`,`genset_total`,`no_genset`,`km_mobil`) values 
(11,'2022061519012','bbm_ops',20000,'tes','2022-06-15',NULL,0,17,'2022-06-15 09:12:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','',565789);

/*Table structure for table `reimburstment_attachment` */

DROP TABLE IF EXISTS `reimburstment_attachment`;

CREATE TABLE `reimburstment_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reimburse_no` varchar(255) NOT NULL,
  `full_path` text,
  `remark` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Data for the table `reimburstment_attachment` */

insert  into `reimburstment_attachment`(`id`,`reimburse_no`,`full_path`,`remark`,`created_at`,`created_by`) values 
(75,'2022061519012','http://127.0.0.1:8000/storage/reimburstment/images/R20220615398875124.jpg',NULL,'2022-06-15 09:12:48',NULL),
(76,'2022061519012','http://127.0.0.1:8000/storage/reimburstment/images/R202206158629513983.jpg',NULL,'2022-06-15 09:12:48',NULL),
(77,'2022061519012','http://127.0.0.1:8000/storage/reimburstment/images/R202206154989665436.jpg',NULL,'2022-06-15 09:12:48',NULL),
(78,'2022061519012','http://127.0.0.1:8000/storage/reimburstment/images/R202206157118769628.jpg',NULL,'2022-06-15 09:12:48',NULL),
(79,'2022061519012','http://127.0.0.1:8000/storage/reimburstment/images/RS202206156287240204.png.jpg',NULL,'2022-06-15 09:12:48',NULL);

/*Table structure for table `reimburstment_type` */

DROP TABLE IF EXISTS `reimburstment_type`;

CREATE TABLE `reimburstment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `header_id` int DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `url_title` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remark` text,
  `status` int NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `reimburstment_type` */

insert  into `reimburstment_type`(`id`,`header_id`,`code`,`url_title`,`name`,`remark`,`status`,`created_at`,`created_by`,`updated_at`,`updated_by`,`deleted_at`,`deleted_by`) values 
(1,NULL,NULL,'bbm_ops','BBM Kendaraan Operasional',NULL,1,'2021-09-13 07:45:03',-1,NULL,NULL,NULL,NULL),
(2,NULL,'GNT','bbm_genset','BBM Portable Genset',NULL,1,'2021-09-13 07:45:23',-1,NULL,NULL,NULL,NULL),
(3,NULL,'OPV','vehicle_ops','Operasional Kendaraan','Parkir/Tol/Tambal Ban/Isi Angin',1,'2021-09-13 07:46:22',-1,NULL,NULL,NULL,NULL),
(4,NULL,'COO','coordinate_fee','Biaya Koordinasi','Preman/Ormas/SK/LL/Access Site',1,'2021-09-13 07:46:48',-1,NULL,NULL,NULL,NULL),
(5,NULL,'MAT','material_fee','Alat Kerja dan Material','Tools/Consumable Material/ATK',1,'2021-09-13 07:47:12',-1,NULL,NULL,NULL,NULL),
(6,3,NULL,'parkir','Parkir','',1,'2021-09-13 20:25:56',-1,NULL,NULL,NULL,NULL),
(7,4,NULL,'ormas','Ormas','',1,'2021-09-13 20:52:26',-1,NULL,NULL,NULL,NULL),
(8,5,NULL,'atk','ATK','',1,'2021-09-13 20:53:02',-1,NULL,NULL,NULL,NULL);

/*Table structure for table `religion` */

DROP TABLE IF EXISTS `religion`;

CREATE TABLE `religion` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `religion` */

insert  into `religion`(`id`,`name`) values 
(1,'ISLAM'),
(2,'KRISTEN'),
(3,'HINDU'),
(4,'BUDDHA'),
(5,'KATHOLIK'),
(6,'KATHOLIK');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`created_at`,`deleted_at`) values 
(1,'Admin','2021-08-05 20:21:01',NULL),
(2,'Supervisor','2021-08-05 20:21:33',NULL),
(3,'User','2021-08-05 20:21:47',NULL);

/*Table structure for table `site_employees` */

DROP TABLE IF EXISTS `site_employees`;

CREATE TABLE `site_employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `employe_id` int NOT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `site_employees` */

insert  into `site_employees`(`id`,`site_id`,`employe_id`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(27,21,2,1,'2022-04-03 12:27:33',NULL,NULL),
(28,21,3,1,'2022-04-03 12:27:33',NULL,NULL),
(29,22,3,1,'2022-04-07 09:16:46',NULL,NULL),
(30,23,3,1,'2022-04-08 18:10:36',NULL,NULL),
(31,24,1,1,'2022-04-10 13:31:50',NULL,NULL),
(32,24,2,1,'2022-04-10 13:31:50',NULL,NULL),
(33,24,3,1,'2022-04-10 13:31:50',NULL,NULL),
(34,25,1,1,'2022-04-10 13:33:50',NULL,NULL),
(35,25,2,1,'2022-04-10 13:33:50',NULL,NULL),
(36,25,3,1,'2022-04-10 13:33:50',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `role_id` int DEFAULT NULL,
  `employe_id` int DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_id` (`uniq_id`),
  KEY `employe_id` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`uniq_id`,`email`,`password`,`token`,`is_active`,`role_id`,`employe_id`,`last_login`,`created_at`,`updated_at`,`deleted_at`) values 
(9,'0ae717583a742be9','rian@admin.com','$2y$10$JrD79VJ.VhQ.XzsVFTHnNOkkbH3p56ut75QyPNz/rCjx3xPpJ45LG',NULL,1,NULL,123,NULL,'2022-06-13 13:53:55','2022-06-14 11:36:23',NULL),
(12,'ENGAS123','admin@admin.com','$2y$10$.PbPoGuvdeBxVDZ0hpJgb.aZS7LLo5JVvYli1d7Hr8yc8pRbfHxti',NULL,1,NULL,NULL,NULL,'2022-06-13 16:17:27','2022-06-13 16:17:27',NULL),
(17,'0ae717583a742be8','yossularko@dev.com','',NULL,1,NULL,48260091,NULL,'2022-06-14 16:03:58','2022-06-15 10:09:53',NULL),
(21,'','yos@admin.com','$2y$10$BfCiG0oke8mFS5v3/b/1GeZmjCd5oUN9wU4bgyok8DHl/9DMW8lY.',NULL,1,1,3,NULL,'2022-06-15 10:45:55','2022-06-15 10:45:55',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
