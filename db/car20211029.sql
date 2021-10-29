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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `carid` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `bill` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '车牌',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '款式',
  `buydate` time DEFAULT NULL COMMENT '购买日期',
  `userid` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `car` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL COMMENT '0为一级菜单',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `root` int DEFAULT NULL COMMENT '1基础菜单，前端无法删除等',
  `remark` text CHARACTER SET utf8 COLLATE utf8_bin,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `menu` */

insert  into `menu`(`id`,`parentId`,`title`,`code`,`sort`,`path`,`root`,`remark`,`createdAt`,`updatedAt`,`deletedAt`) values 
(1,0,'菜单管理',NULL,0,'menu',1,NULL,NULL,NULL,NULL),
(2,0,'人员管理',NULL,2,'user',NULL,NULL,NULL,'2021-07-23 14:32:45',NULL),
(3,0,'角色管理',NULL,1,'role',NULL,NULL,NULL,'2021-07-27 11:26:51',NULL),
(4,0,'测试',NULL,4,'3',NULL,NULL,NULL,'2021-10-24 10:52:16',NULL),
(5,2,'1-1',NULL,1,'1-1',NULL,NULL,NULL,'2021-07-23 14:31:33','2021-07-23 14:31:33'),
(6,2,'1-2',NULL,2,'1-2',NULL,NULL,NULL,'2021-07-23 14:31:25','2021-07-23 14:31:25'),
(7,4,'3-1',NULL,1,'3-1',NULL,NULL,NULL,NULL,NULL),
(8,7,'3-1-1',NULL,1,'3-1-1',NULL,NULL,NULL,NULL,NULL),
(9,7,'3-1-2',NULL,2,'3-1-2',NULL,NULL,NULL,NULL,NULL),
(10,9,'3-1-2-1',NULL,1,'3-1-2-1',NULL,NULL,NULL,NULL,NULL),
(11,6,'1-2-1',NULL,1,'1',NULL,NULL,'2021-07-21 15:35:01','2021-07-22 15:20:50','2021-07-22 15:20:50'),
(12,6,'1-2-2',NULL,2,'2',NULL,NULL,'2021-07-21 15:38:17','2021-07-22 15:17:10','2021-07-22 15:17:10'),
(13,6,'1-2-3',NULL,3,'1-2-3',NULL,NULL,'2021-07-21 15:39:17','2021-07-22 14:02:12','2021-07-22 14:02:12'),
(14,6,'1-2-1',NULL,1,'1-2-1',NULL,NULL,'2021-07-22 16:59:19','2021-07-23 14:31:12','2021-07-23 14:31:12'),
(15,6,'1-2-2',NULL,0,'1-2-2',NULL,NULL,'2021-07-22 17:01:13','2021-07-23 14:31:17','2021-07-23 14:31:17'),
(16,6,'1-2-33',NULL,3,'1-2-3',NULL,NULL,'2021-07-22 17:03:43','2021-07-23 14:31:08','2021-07-23 14:31:08'),
(17,0,'资源',NULL,3,'resource',NULL,NULL,'2021-10-24 10:52:06','2021-10-24 10:52:23',NULL),
(18,17,'日志列表',NULL,1,'resource/log',NULL,NULL,'2021-10-24 10:52:53','2021-10-24 10:52:53',NULL),
(19,17,'监控',NULL,2,'resource/monitor',NULL,NULL,'2021-10-24 10:53:30','2021-10-24 10:53:30',NULL);

/*Table structure for table `menu_role` */

DROP TABLE IF EXISTS `menu_role`;

CREATE TABLE `menu_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单角色中间表',
  `roleId` int DEFAULT NULL,
  `menuId` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `menu_role` */

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
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `oil_consume` */

/*Table structure for table `oilconsume` */

DROP TABLE IF EXISTS `oilconsume`;

CREATE TABLE `oilconsume` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '油耗记录',
  `date` time DEFAULT NULL COMMENT '日期',
  `distance` float DEFAULT NULL COMMENT '行驶距离km',
  `residual` float DEFAULT NULL COMMENT '剩余油量%',
  `average_consume` float DEFAULT NULL COMMENT '平均油耗',
  `after_refueling_average_consume` float DEFAULT NULL COMMENT '加油后平均油耗',
  `consume` float DEFAULT NULL COMMENT '本次油耗',
  `carid` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `oilconsume` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`status`,`createdAt`,`updatedAt`,`deletedAt`) values 
(1,'超级管理员',1,'2021-07-28 15:46:53','2021-07-28 17:09:14',NULL),
(2,'普通用户',1,'2021-07-28 15:50:24','2021-07-28 15:50:24',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `isAdmin` int DEFAULT '0' COMMENT '0 非 1 是',
  `status` int DEFAULT '1' COMMENT '1启用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`nick`,`createdAt`,`updatedAt`,`deletedAt`,`isAdmin`,`status`) values 
(1,'admin','123','超级管理员','2021-07-08 14:45:11','2021-07-08 14:45:13',NULL,1,1),
(2,'gelc','123456','葛理参','2021-07-07 14:56:01','2021-07-08 14:43:36',NULL,0,1);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户角色中间表',
  `roleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`roleId`,`userId`,`createdAt`,`updatedAt`,`deletedAt`) values 
(1,1,1,'2021-10-25 09:41:22','2021-10-25 09:41:24',NULL),
(2,2,2,'2021-10-25 09:41:35','2021-10-25 09:41:37',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
