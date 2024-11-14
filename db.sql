/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - yuangongxinxiguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuangongxinxiguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yuangongxinxiguanli`;

/*Table structure for table `chuqin` */

DROP TABLE IF EXISTS `chuqin`;

CREATE TABLE `chuqin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `today` varchar(200) DEFAULT NULL COMMENT '打卡日期',
  `on_time` timestamp NULL DEFAULT NULL COMMENT '上班打卡时间',
  `down_time` timestamp NULL DEFAULT NULL COMMENT '下班打卡时间',
  `chuqin_types` int(11) DEFAULT NULL COMMENT '打卡类型  Search111',
  `overtimeNumber` int(11) DEFAULT NULL COMMENT '加班时间(小时)',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='考勤';

/*Data for the table `chuqin` */

insert  into `chuqin`(`id`,`yonghu_id`,`today`,`on_time`,`down_time`,`chuqin_types`,`overtimeNumber`,`create_time`) values (5,26,'2021-05-06','2021-05-06 19:24:44','2021-05-06 19:24:46',6,NULL,'2021-05-06 19:24:44'),(6,25,'2021-05-06','2021-05-06 19:29:19','2021-05-06 19:29:22',6,NULL,'2021-05-06 19:29:19');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别类型名称',1,'男',NULL,'2021-05-06 15:01:18'),(2,'sex_types','性别类型名称',2,'女',NULL,'2021-05-06 15:01:18'),(3,'bumen_types','部门类型名称',1,'财务部',NULL,'2021-05-06 15:01:18'),(4,'bumen_types','部门类型名称',2,'人事部',NULL,'2021-05-06 15:01:18'),(5,'bumen_types','部门类型名称',3,'研发部',NULL,'2021-05-06 15:01:18'),(6,'zhiwei_types','职位类型名称',1,'员工',NULL,'2021-05-06 15:01:18'),(7,'zhiwei_types','职位类型名称',2,'小组长',NULL,'2021-05-06 15:01:18'),(8,'zhiwei_types','职位类型名称',3,'经理',NULL,'2021-05-06 15:01:18'),(9,'chuqin_types','打卡类型',1,'正常打卡',NULL,'2021-05-06 15:01:18'),(10,'chuqin_types','打卡类型',2,'未打上班卡',NULL,'2021-05-06 15:01:18'),(11,'chuqin_types','打卡类型',3,'未打下班卡',NULL,'2021-05-06 15:01:18'),(12,'chuqin_types','打卡类型',4,'缺勤',NULL,'2021-05-06 15:01:18'),(13,'chuqin_types','打卡类型',5,'加班',NULL,'2021-05-06 15:01:18'),(14,'chuqin_types','打卡类型',6,'迟到',NULL,'2021-05-06 15:01:18'),(15,'chuqin_types','打卡类型',7,'早退',NULL,'2021-05-06 15:01:18'),(16,'xinzi_yesno_types','是否确认',1,'未确认',NULL,'2021-05-06 15:01:18'),(17,'xinzi_yesno_types','是否确认',2,'已确认',NULL,'2021-05-06 15:01:18'),(18,'gonggao_types','公告类型名称',1,'日常公告',NULL,'2021-05-06 15:01:18'),(19,'gonggao_types','公告类型名称',2,'紧急公告',NULL,'2021-05-06 15:01:18'),(20,'jianyi_types','建议类型名称',1,'流程建议',NULL,'2021-05-06 19:20:57'),(21,'jianyi_types','建议类型名称',2,'工作建议',NULL,'2021-05-06 19:20:57'),(22,'jianyi_types','建议类型名称',3,'建议类型3',NULL,'2021-05-06 19:28:51');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111 ',
  `gonggao_types` int(11) DEFAULT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `gonggao_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (3,'公告1',1,'2021-05-06 19:16:36','公告1的详情\r\n','2021-05-06 19:16:36'),(4,'公告2',2,'2021-05-06 19:16:46','公告2的详情\r\n','2021-05-06 19:16:46'),(5,'公告3',1,'2021-05-06 19:27:08','公告3的详情\r\n','2021-05-06 19:27:08');

/*Table structure for table `jianyi` */

DROP TABLE IF EXISTS `jianyi`;

CREATE TABLE `jianyi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '员工',
  `jianyi_name` varchar(200) DEFAULT NULL COMMENT '建议名称 Search111 ',
  `jianyi_types` int(11) DEFAULT NULL COMMENT '建议类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '建议时间',
  `jianyi_content` text COMMENT '建议详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='建议';

/*Data for the table `jianyi` */

insert  into `jianyi`(`id`,`yonghu_id`,`jianyi_name`,`jianyi_types`,`insert_time`,`jianyi_content`,`create_time`) values (3,26,'建议名称1',1,'2021-05-06 19:24:32','建议内容1\r\n','2021-05-06 19:24:32'),(4,25,'建议2',3,'2021-05-06 19:32:43','建议2的详情\r\n','2021-05-06 19:32:43');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','dtxixbvvf7j3o6u1bqc7kqvfm2fd1qvt','2021-05-06 17:31:14','2021-05-06 20:25:16'),(2,25,'a1','yonghu','用户','g9pt9wbja2dq2rcl8qfyxph4ae72358k','2021-05-06 19:17:24','2021-05-06 20:29:00'),(3,26,'a2','yonghu','用户','82k90bmc1719yh9u57v21fa0h5b0pkwi','2021-05-06 19:17:41','2021-05-06 20:23:48');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','123456','管理员','2021-04-27 14:51:13');

/*Table structure for table `xinzi` */

DROP TABLE IF EXISTS `xinzi`;

CREATE TABLE `xinzi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '员工',
  `month` varchar(200) DEFAULT NULL COMMENT '月份  Search111',
  `jiben_money` decimal(10,4) DEFAULT NULL COMMENT '工资',
  `xinzi_content` text COMMENT '备注',
  `xinzi_yesno_types` int(11) DEFAULT NULL COMMENT '是否确认 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发放时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='薪资';

/*Data for the table `xinzi` */

insert  into `xinzi`(`id`,`yonghu_id`,`month`,`jiben_money`,`xinzi_content`,`xinzi_yesno_types`,`insert_time`,`create_time`) values (5,26,'2021-01','2000.0000','无\r\n',2,'2021-05-06 19:15:21','2021-05-06 19:15:21'),(6,25,'2021-01','2100.0000','无\r\n',2,'2021-05-06 19:26:48','2021-05-06 19:26:48');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `bumen_types` int(11) DEFAULT NULL COMMENT '部门 Search111 ',
  `zhiwei_types` int(11) DEFAULT NULL COMMENT '职位 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='员工';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`bumen_types`,`zhiwei_types`,`create_time`) values (25,'a1','123456','张1','17703786901','410224199610232001','http://localhost:8080/yuangongxinxiguanli/file/download?fileName=1620298071037.jpg',2,2,1,'2021-05-06 18:47:57'),(26,'a2','123456','张2','17703786902','410224199610232002','http://localhost:8080/yuangongxinxiguanli/file/download?fileName=1620299484882.jpg',1,2,2,'2021-05-06 19:11:30'),(27,'a3','123456','涨3','17703786903','410224199610232003','http://localhost:8080/yuangongxinxiguanli/file/download?fileName=1620300336177.jpg',1,1,3,'2021-05-06 19:25:49');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
