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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bmg-main-local` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bmg-main-local`;

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `activity` */

insert  into `activity`(`id`,`name`) values 
(1,'First PM'),
(2,'Closing Reject PM'),
(3,'Corrective Maintance'),
(4,'Backup Power');

/*Table structure for table `app_version` */

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
<<<<<<< HEAD
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_version` VARCHAR(10) DEFAULT NULL,
  `inactive` INT(11) DEFAULT '0',
=======
  `id` int NOT NULL AUTO_INCREMENT,
  `app_version` varchar(10) DEFAULT NULL,
  `inactive` int DEFAULT '0',
>>>>>>> ac0ffc22d5c49b76b8abe58b604150565c0bd65a
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
  `activity_id` int DEFAULT '0',
  `remark` text,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted_by` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`id`,`user_id`,`site_id`,`check_in`,`check_out`,`check_in_long`,`check_in_lat`,`check_out_long`,`check_out_lat`,`activity_id`,`remark`,`deleted_at`,`deleted_by`) values 
(16,9,1,'2022-06-27 13:41:24',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
(17,50,22,'2022-06-27 13:41:27','2022-06-14 17:04:05','106.9177186','-6.1668339','106.9177136','-6.1668289',0,NULL,NULL,NULL),
(18,50,22,'2022-06-27 13:41:29','2022-06-15 09:01:00','106.9177155','-6.1668298','106.9177121','-6.166832',0,NULL,NULL,NULL),
(19,50,22,'2022-06-27 13:41:31','2022-06-15 09:06:07','106.9177155','-6.1668298','106.9177226','-6.1668331',0,NULL,NULL,NULL);

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
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attendance_logs` */

insert  into `attendance_logs`(`id`,`lat`,`long`,`site_no`,`user_id`,`created_at`,`address`,`city`,`province`) values 
(3,-6.1605092,106.9197036,22,49,'2022-06-27 03:07:25','Bekasi','Bekasi','Bekasi'),
(4,-6.1605092,106.9197036,22,49,'2022-06-27 10:08:15','Bekasi','Bekasi','Bekasi');

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
  `type` smallint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `config` */

insert  into `config`(`id`,`param_code`,`param_title`,`param_value`,`message`,`inactive`,`type`) values 
(1,'max_radius_m','max_radius_m','2000','maksimum radius',0,0),
(8,'max_radius_m','max_radius_m','200','radius1',1,1),
(9,'max_radius_m','test','1000','test',0,1);

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
(2,'Rian','1998-06-10','100-0001',1,1,'081918291218','1','1',NULL,'1',NULL,NULL,'2022-04-02 12:31:58',NULL,1);

/*Table structure for table `logs_api` */

DROP TABLE IF EXISTS `logs_api`;

CREATE TABLE `logs_api` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(203,'10.42.0.204(user:0)','GET','http://192.168.8.12:7777/api/site/check_distance','SiteController','-6.1668283, 106.9177184','','','','2022-06-15 11:03:14','2022-06-15 11:03:14'),
(204,'192.168.8.12(user:0)','GET','http://192.168.8.12:7777/api/site/current_radius','SiteController','','','','','2022-06-17 14:24:15','2022-06-17 14:24:15'),
(205,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 10:36:19','2022-06-27 10:36:19'),
(206,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:36:19','2022-06-27 10:36:19'),
(207,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:39:09','2022-06-27 10:39:09'),
(208,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:39:09','2022-06-27 10:39:09'),
(209,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:40:26','2022-06-27 10:40:26'),
(210,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:40:26','2022-06-27 10:40:26'),
(211,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:40:52','2022-06-27 10:40:52'),
(212,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:40:52','2022-06-27 10:40:52'),
(213,'127.0.0.1(user:50)','PUT','http://127.0.0.1:8000/api/site/update_current_radius','SiteController','8','','','','2022-06-27 10:40:54','2022-06-27 10:40:54'),
(214,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:40:55','2022-06-27 10:40:55'),
(215,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:40:55','2022-06-27 10:40:55'),
(216,'127.0.0.1(user:50)','POST','http://127.0.0.1:8000/api/site/radius','SiteController','test, 1000, test','','','','2022-06-27 10:41:11','2022-06-27 10:41:11'),
(217,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:41:12','2022-06-27 10:41:12'),
(218,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:41:12','2022-06-27 10:41:12'),
(219,'127.0.0.1(user:50)','PUT','http://127.0.0.1:8000/api/site/update_current_radius','SiteController','9','','','','2022-06-27 10:41:18','2022-06-27 10:41:18'),
(220,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:41:18','2022-06-27 10:41:18'),
(221,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:41:18','2022-06-27 10:41:18'),
(222,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:41:26','2022-06-27 10:41:26'),
(223,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:41:26','2022-06-27 10:41:26'),
(224,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:41:27','2022-06-27 10:41:27'),
(225,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:41:36','2022-06-27 10:41:36'),
(226,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee/division/list','EmployeeController','','','','','2022-06-27 10:41:36','2022-06-27 10:41:36'),
(227,'127.0.0.1(user:1)','GET','http://127.0.0.1:8000/api/area/cluster','','','','','','2022-06-27 10:41:36','2022-06-27 10:41:36'),
(228,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee/religion/list','EmployeeController','','','','','2022-06-27 10:41:36','2022-06-27 10:41:36'),
(229,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','1, 20','','','','2022-06-27 10:41:36','2022-06-27 10:41:36'),
(230,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:41:40','2022-06-27 10:41:40'),
(231,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/reimburstment','ReimbursmentController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 10:41:40','2022-06-27 10:41:40'),
(232,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee/division/list','EmployeeController','','','','','2022-06-27 10:41:42','2022-06-27 10:41:42'),
(233,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:41:45','2022-06-27 10:41:45'),
(234,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:41:45','2022-06-27 10:41:45'),
(235,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:41:45','2022-06-27 10:41:45'),
(236,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:42:01','2022-06-27 10:42:01'),
(237,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:42:01','2022-06-27 10:42:01'),
(238,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:42:02','2022-06-27 10:42:02'),
(239,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:42:08','2022-06-27 10:42:08'),
(240,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:43:05','2022-06-27 10:43:05'),
(241,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:50:17','2022-06-27 10:50:17'),
(242,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:50:17','2022-06-27 10:50:17'),
(243,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:50:49','2022-06-27 10:50:49'),
(244,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:50:49','2022-06-27 10:50:49'),
(245,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:56:23','2022-06-27 10:56:23'),
(246,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:56:24','2022-06-27 10:56:24'),
(247,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:56:24','2022-06-27 10:56:24'),
(248,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/list_radius','SiteController','','','','','2022-06-27 10:57:30','2022-06-27 10:57:30'),
(249,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site/current_radius','SiteController','','','','','2022-06-27 10:57:30','2022-06-27 10:57:30'),
(250,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:57:32','2022-06-27 10:57:32'),
(251,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:57:32','2022-06-27 10:57:32'),
(252,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:57:32','2022-06-27 10:57:32'),
(253,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:58:14','2022-06-27 10:58:14'),
(254,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:58:14','2022-06-27 10:58:14'),
(255,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:58:26','2022-06-27 10:58:26'),
(256,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 10:58:26','2022-06-27 10:58:26'),
(257,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 10:58:26','2022-06-27 10:58:26'),
(258,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/reimburstment','ReimbursmentController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 10:58:41','2022-06-27 10:58:41'),
(259,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 10:58:41','2022-06-27 10:58:41'),
(260,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:03:43','2022-06-27 11:03:43'),
(261,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:03:43','2022-06-27 11:03:43'),
(262,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','2, 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:18','2022-06-27 11:09:18'),
(263,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','1, 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:19','2022-06-27 11:09:19'),
(264,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','3, 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:21','2022-06-27 11:09:21'),
(265,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','1, 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:23','2022-06-27 11:09:23'),
(266,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','2, 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:25','2022-06-27 11:09:25'),
(267,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:09:45','2022-06-27 11:09:45'),
(268,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:09:46','2022-06-27 11:09:46'),
(269,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:14:20','2022-06-27 11:14:20'),
(270,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:14:20','2022-06-27 11:14:20'),
(271,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:15:09','2022-06-27 11:15:09'),
(272,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:15:09','2022-06-27 11:15:09'),
(273,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','','','','','2022-06-27 11:15:29','2022-06-27 11:15:29'),
(274,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController','','','','','2022-06-27 11:15:32','2022-06-27 11:15:32'),
(275,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:15:43','2022-06-27 11:15:43'),
(276,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:15:44','2022-06-27 11:15:44'),
(277,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:15:52','2022-06-27 11:15:52'),
(278,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:16:31','2022-06-27 11:16:31'),
(279,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:16:40','2022-06-27 11:16:40'),
(280,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:16:40','2022-06-27 11:16:40'),
(281,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 11:19:30','2022-06-27 11:19:30'),
(282,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 11:19:30','2022-06-27 11:19:30'),
(283,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 13:21:41','2022-06-27 13:21:41'),
(284,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/site','SiteController',', 1, 20','','','','2022-06-27 13:21:41','2022-06-27 13:21:41'),
(285,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 13:21:41','2022-06-27 13:21:41'),
(286,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 13:21:45','2022-06-27 13:21:45'),
(287,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/attendance','AttendanceController',', 2022-05-25, 2022-06-24, 1, 20','','','','2022-06-27 13:21:45','2022-06-27 13:21:45'),
(288,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/employee','EmployeeController','','','','','2022-06-27 13:33:42','2022-06-27 13:33:42'),
(289,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users/role','ProfileController','','','','','2022-06-27 13:33:42','2022-06-27 13:33:42'),
(290,'127.0.0.1(user:50)','GET','http://127.0.0.1:8000/api/users','ProfileController','1, 20','','','','2022-06-27 13:33:42','2022-06-27 13:33:42'),
(291,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/users','ProfileController','','','','','2022-06-27 13:33:51','2022-06-27 13:33:51'),
(292,'127.0.0.1(user:0)','GET','http://127.0.0.1:8000/api/users','ProfileController','forte','','','','2022-06-27 13:36:50','2022-06-27 13:36:50');

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

/*Table structure for table `user_detail` */

DROP TABLE IF EXISTS `user_detail`;

CREATE TABLE `user_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `picture_profile` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `employe_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `employe_ktp` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `picture_ktp` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `project_customer` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `cluster` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `sertificate` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user_detail` */

insert  into `user_detail`(`id`,`user_id`,`name`,`picture_profile`,`gender`,`employe_id`,`employe_ktp`,`picture_ktp`,`phone_number`,`project_customer`,`position`,`region`,`area`,`cluster`,`sertificate`,`created_at`,`updated_at`) values 
(9,50,'Rian Fajar Pambudi','http://127.0.0.1:8000/storage/profile/images/P5091229.jpg','Laki-laki','100-0001','31213818318811','http://127.0.0.1:8000/storage/profile/images/31213818318811.jpg','081291992121','iForte','Area Manager','Jakarta','Jakarta','Jakarta','13198471391','2022-06-27 10:35:58',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `role_id` int DEFAULT NULL,
  `employe_id` varchar(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_id` (`uniq_id`),
  KEY `employe_id` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`uniq_id`,`email`,`password`,`token`,`is_active`,`role_id`,`employe_id`,`last_login`,`created_at`,`updated_at`,`deleted_at`) values 
(50,'0ae717583a742be8','rian@admin.com','$2y$10$FwZW/Zqo1U7RmlB6RiOv9eQMkkyOJP2kyyRTzwpNfsV/TeWcXlTzK',NULL,1,1,'2',NULL,'2022-06-27 10:35:58','2022-06-27 10:35:58',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
