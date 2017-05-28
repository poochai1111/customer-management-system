/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `customer_care` */

DROP TABLE IF EXISTS `customer_care`;

CREATE TABLE `customer_care` (
  `care_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `care_theme` varchar(50) DEFAULT NULL,
  `care_way` varchar(50) DEFAULT NULL,
  `care_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `care_remark` varchar(1000) DEFAULT NULL,
  `care_nexttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `care_people` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`care_id`),
  KEY `FK_Reference_15` (`customer_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customer_care` */

insert  into `customer_care`(`care_id`,`customer_id`,`care_theme`,`care_way`,`care_time`,`care_remark`,`care_nexttime`,`care_people`,`is_used`) values (1,1,'纪念日','送礼品','2013-05-23 23:12:29','节日纪念','2013-05-28 23:12:34','孙悟空','1'),(2,2,'生日','上门拜访','2013-05-23 23:14:00','过生日','2013-06-12 23:14:15','猪八戒','1');

/*Table structure for table `customer_condition` */

DROP TABLE IF EXISTS `customer_condition`;

CREATE TABLE `customer_condition` (
  `condition_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(50) DEFAULT NULL,
  `condition_explain` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customer_condition` */

insert  into `customer_condition`(`condition_id`,`condition_name`,`condition_explain`,`is_used`) values (1,'潜在客户','可能成为客户的人','1'),(2,'意向客户','有意愿车成为客户的人','1'),(3,'交易客户','正在交易的客户','1');

/*Table structure for table `customer_info` */

DROP TABLE IF EXISTS `customer_info`;

CREATE TABLE `customer_info` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_id` int(10) DEFAULT NULL,
  `source_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `type_id` int(10) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_sex` varchar(10) DEFAULT NULL,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `customer_qq` varchar(20) DEFAULT NULL,
  `customer_address` varchar(500) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_remark` varchar(1000) DEFAULT NULL,
  `customer_job` varchar(100) DEFAULT NULL,
  `customer_blog` varchar(100) DEFAULT NULL,
  `customer_tel` varbinary(20) DEFAULT NULL,
  `customer_msn` varchar(50) DEFAULT NULL,
  `birth_day` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_addman` varchar(50) DEFAULT NULL,
  `customer_changtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `change_man` varchar(20) DEFAULT NULL,
  `customer_company` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`customer_id`),
  KEY `FK_Reference_16` (`condition_id`),
  KEY `FK_Reference_17` (`source_id`),
  KEY `FK_Reference_18` (`type_id`),
  KEY `FK_Reference_23` (`user_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`condition_id`) REFERENCES `customer_condition` (`condition_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`source_id`) REFERENCES `customer_source` (`source_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`type_id`) REFERENCES `customer_type` (`type_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `customer_info` */

insert  into `customer_info`(`customer_id`,`condition_id`,`source_id`,`user_id`,`type_id`,`customer_name`,`customer_sex`,`customer_mobile`,`customer_qq`,`customer_address`,`customer_email`,`customer_remark`,`customer_job`,`customer_blog`,`customer_tel`,`customer_msn`,`birth_day`,`customer_addtime`,`customer_addman`,`customer_changtime`,`change_man`,`customer_company`,`is_used`) values (1,2,1,1,2,'李四','男','13725425426','2334343','重庆','379727687@qq.com','									你好\r\n		\r\n		\r\n		\r\n		\r\n		','老板','3434322','54545433','23234465','2013-05-01 15:40:52','2013-05-08 22:30:40','张三','2013-05-25 09:25:43','张三','思科','1'),(2,1,1,1,1,'华纳','女','13924452345','23456','重庆三峡','379727687@qq.com','						反反复复\r\n		\r\n		','学生','6576','85858584','45454555','2013-05-01 15:40:53','2013-05-23 23:05:44','张三','2013-05-25 09:31:47','二位','天天','1'),(3,1,1,1,1,'刘欢','男','13854545454','23245','重庆','379727687@qq.com','			如同仁堂\r\n		','学生','6567','52454789','53423134','2013-05-21 15:40:54','2013-05-23 23:08:52','张三','2013-05-25 09:32:48','热热热','微微','1'),(4,1,1,1,1,'阿黄','男','13544455544','454578','重庆三峡学院','379727687@qq.com','			法国风格\r\n		','学生','6565','25478547','45444455','2013-05-01 15:40:54','2013-05-23 23:10:17','张三','2013-05-25 09:33:24','恒河','三峡学院','1'),(7,1,1,NULL,3,'黄晓军','男','15111866066','909239200','重庆云阳','909239200@qq.com','这个客户很水','屌丝','guanzhuwo@blog.com','42232323','2323232','1992-09-10 16:21:00','2013-05-25 16:20:38','蒋大爷','2013-05-25 16:20:38','','敏军网络科技有限公司','1'),(8,3,1,NULL,1,'温庆心','男','13652354533','','爱上对方','123156@qq.com','						\r\n		\r\n		','','','','','1991-11-03 16:50:38','2013-05-25 16:49:28','admin','2013-05-25 16:52:07','','','1'),(9,1,1,6,2,'刘老师','男','15111866066','','重庆丰都','379727687@qq.com','			\r\n		这是个好老师','程序猿','','58105789','','1987-05-13 20:02:29','2013-05-25 20:00:42','蒋元征','2013-05-25 20:04:57','蒋元征','中软国际','1');

/*Table structure for table `customer_linkman` */

DROP TABLE IF EXISTS `customer_linkman`;

CREATE TABLE `customer_linkman` (
  `linkman_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `linkman_name` varchar(50) DEFAULT NULL,
  `linkman_sex` varchar(20) DEFAULT NULL,
  `linkman_job` varchar(100) DEFAULT NULL,
  `linkman_mobile` varchar(20) DEFAULT NULL,
  `linkman_age` int(10) DEFAULT NULL,
  `linkman_relation` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`linkman_id`),
  KEY `FK_Reference_20` (`customer_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `customer_linkman` */

insert  into `customer_linkman`(`linkman_id`,`customer_id`,`linkman_name`,`linkman_sex`,`linkman_job`,`linkman_mobile`,`linkman_age`,`linkman_relation`,`is_used`) values (1,2,'合格','男','老板','35667',34,'上下属','1');

/*Table structure for table `customer_linkreord` */

DROP TABLE IF EXISTS `customer_linkreord`;

CREATE TABLE `customer_linkreord` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `link_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `who_link` varchar(50) DEFAULT NULL,
  `link_type` varchar(50) DEFAULT NULL,
  `link_theme` varchar(200) DEFAULT NULL,
  `link_nexttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_remark` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`record_id`),
  KEY `FK_Reference_19` (`customer_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customer_linkreord` */

insert  into `customer_linkreord`(`record_id`,`customer_id`,`link_time`,`who_link`,`link_type`,`link_theme`,`link_nexttime`,`link_remark`,`is_used`) values (1,1,'2013-05-23 23:15:11','张三','打电话','过来买房','2013-05-28 23:15:14','很好','1');

/*Table structure for table `customer_source` */

DROP TABLE IF EXISTS `customer_source`;

CREATE TABLE `customer_source` (
  `source_id` int(10) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customer_source` */

insert  into `customer_source`(`source_id`,`source_name`,`is_used`) values (1,'自己上门','1'),(2,'朋友推荐','1'),(3,'百度网','1');

/*Table structure for table `customer_type` */

DROP TABLE IF EXISTS `customer_type`;

CREATE TABLE `customer_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `customer_type` */

insert  into `customer_type`(`type_id`,`type_name`,`is_used`) values (1,'客户','1'),(2,'合作伙伴','1'),(3,'供应商','1'),(4,'合作伙伴','1');

/*Table structure for table `department_info` */

DROP TABLE IF EXISTS `department_info`;

CREATE TABLE `department_info` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_desc` varchar(500) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `department_info` */

insert  into `department_info`(`department_id`,`department_name`,`department_desc`,`is_used`) values (1,'财务部','很有钱','1'),(3,'销售部','搞销售的','1');

/*Table structure for table `email_info` */

DROP TABLE IF EXISTS `email_info`;

CREATE TABLE `email_info` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `email_content` varchar(2000) DEFAULT NULL,
  `email_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email_state` varchar(50) DEFAULT NULL,
  `email_theme` varchar(200) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`email_id`),
  KEY `FK_Reference_14` (`user_id`),
  KEY `FK_Reference_21` (`customer_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `email_info` */

insert  into `email_info`(`email_id`,`customer_id`,`user_id`,`email_content`,`email_time`,`email_state`,`email_theme`,`is_used`) values (21,4,1,'第三代是的大多数都是','2013-05-25 19:48:27','1','地地道道是','1'),(22,4,4,'反对反对','2013-05-25 19:49:15','0','风格大方的','0'),(23,4,4,'反对反对','2013-05-25 19:49:28','1','风格大方的','1'),(24,2,1,'刚刚','2013-05-25 19:50:38','1','123','1'),(25,9,1,'祝你生日快乐！身体健康！','2013-05-25 20:22:31','0','生日快乐','1');

/*Table structure for table `house_info` */

DROP TABLE IF EXISTS `house_info`;

CREATE TABLE `house_info` (
  `house_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `house_address` varchar(500) DEFAULT NULL,
  `house_price` int(20) DEFAULT NULL,
  `house_ambient` varchar(1000) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`house_id`),
  KEY `FK_Reference_13` (`user_id`),
  KEY `FK_Reference_26` (`type_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`type_id`) REFERENCES `house_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `house_info` */

insert  into `house_info`(`house_id`,`type_id`,`user_id`,`house_address`,`house_price`,`house_ambient`,`is_used`) values (6,2,3,'滨江路',10000,'很好啦！都来看看啊！','1'),(7,1,1,'三峡学院',500,'你猜！','1'),(8,1,4,'2000',500,'gh ','1'),(9,1,1,'重庆云烟',111,'这里是结婚生子的好地方','1'),(10,1,6,'重庆万州',1200,'案发大发第三方','1'),(11,1,1,'重庆万州',234,'','1'),(12,1,6,'重庆万州',1200,'5555','1');

/*Table structure for table `house_type` */

DROP TABLE IF EXISTS `house_type`;

CREATE TABLE `house_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `house_type` */

insert  into `house_type`(`type_id`,`type_name`,`is_used`) values (1,'三室一厅','1'),(2,'三室两厅','1'),(3,'两室一厅','1'),(4,'四室两厅','1');

/*Table structure for table `notice_info` */

DROP TABLE IF EXISTS `notice_info`;

CREATE TABLE `notice_info` (
  `notice_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `notice_item` varchar(100) DEFAULT NULL,
  `notice_content` varchar(2000) DEFAULT NULL,
  `notice_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notice_endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`notice_id`),
  KEY `FK_Reference_12` (`user_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `notice_info` */

insert  into `notice_info`(`notice_id`,`user_id`,`notice_item`,`notice_content`,`notice_time`,`notice_endtime`,`is_used`) values (3,4,'最近要开会','记得带钱','2013-05-23 23:22:12','2013-05-30 23:22:29','1');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  `user_num` varchar(100) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_tel` varchar(20) DEFAULT NULL,
  `user_idnum` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_addman` varchar(50) DEFAULT NULL,
  `user_changetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_changeman` varchar(50) DEFAULT NULL,
  `user_intest` varchar(1000) DEFAULT NULL,
  `user_diploma` varchar(20) DEFAULT NULL,
  `user_bankcard` varchar(20) DEFAULT NULL,
  `user_nation` varchar(20) DEFAULT NULL,
  `is_married` varchar(10) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `FK_Reference_22` (`department_id`),
  KEY `FK_Reference_24` (`role_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`department_id`) REFERENCES `department_info` (`department_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`user_id`,`department_id`,`role_id`,`user_name`,`user_sex`,`user_mobile`,`user_age`,`user_address`,`user_num`,`user_pw`,`user_tel`,`user_idnum`,`user_email`,`user_addtime`,`user_addman`,`user_changetime`,`user_changeman`,`user_intest`,`user_diploma`,`user_bankcard`,`user_nation`,`is_married`,`is_used`) values (1,1,1,'张三','男','13525452584',20,'万州','admin','123456','52000112','500234154545745474','3797687@qq.com','2013-05-25 09:37:18','肉骨粉','2013-05-25 16:43:05','未修改','很多','本科','5442232327863358787','汉','已婚','1'),(3,1,2,'王五','男','13254545454',22,'重庆三峡学院','123','123','22323244','522141444514744547','87592@qq.com','2013-05-25 09:37:07','张三','2013-05-25 09:29:05','未修改','斗地主','本科','2323232345555555522','汉','未婚','1'),(4,1,2,'孙悟空','男','13545454545',55,'花果山','456','456','54584785','524147444584574554','39547@qq.com','2013-05-25 09:37:04','张三','2013-05-25 09:30:14','未修改','吃桃子','初中','3535355488676754578','汉','离异','1'),(5,1,2,'猪八戒','男','13544477747',2,'高老庄','789','789','52000112','524154655895854744','3963547@qq.com','2013-05-25 09:36:59','张三','2013-05-25 09:29:33','未修改','吃西瓜','初中','3535355555454787887','汉','已婚','1'),(6,3,1,'蒋元征','男','15923219017',20,'重庆双桥','jiang','jiang1314','58105789','500111199205191111','253507692@qq.com','2013-05-25 16:18:31','admin','2013-05-25 16:20:27','未修改','上网、玩游戏','本科','6222023100045180177','汉族','未婚','1'),(7,3,1,'黄建新','男','15923219011',21,'重庆开县','huang','123456','58105744','500111199205191114','253507692@qq.com','2013-05-25 19:55:29','蒋元征','2013-05-25 19:58:04','未修改','上网、DNF','初中','6222023100045180111','汉族','已婚','1');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_power` int(10) DEFAULT NULL,
  `is_used` varchar(10) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`role_id`,`role_name`,`role_power`,`is_used`) values (1,'管理员',3,'1'),(2,'员工',2,'1'),(3,'老板',1,'1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
