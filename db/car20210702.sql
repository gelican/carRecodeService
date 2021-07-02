/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.21 : Database - car_record
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`car_record` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `car_record`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '账单',
  `type` int DEFAULT '1' COMMENT '1支出 2收入',
  `much` float DEFAULT NULL COMMENT '多少钱',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `carid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `bill` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '车牌',
  `model` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '款式',
  `buydate` time DEFAULT NULL COMMENT '购买日期',
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `car` */

/*Table structure for table `oil_consume` */

DROP TABLE IF EXISTS `oil_consume`;

CREATE TABLE `oil_consume` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '油耗记录',
  `date` time DEFAULT NULL COMMENT '日期',
  `distance` float DEFAULT NULL COMMENT '行驶距离km',
  `residual` float DEFAULT NULL COMMENT '剩余油量%',
  `average_consume` float DEFAULT NULL COMMENT '平均油耗',
  `after_refueling_average_consume` float DEFAULT NULL COMMENT '加油后平均油耗',
  `consume` float DEFAULT NULL COMMENT '本次油耗',
  `carid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `oil_consume` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nick` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
