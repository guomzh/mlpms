/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : pms

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-02-06 17:41:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advicetable
-- ----------------------------
DROP TABLE IF EXISTS `advicetable`;
CREATE TABLE `advicetable` (
  `adviceId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(18) NOT NULL,
  `adviceDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `adviceContent` text NOT NULL,
  `adviceState` int(11) NOT NULL,
  `adviceResponse` text,
  PRIMARY KEY (`adviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advicetable
-- ----------------------------
INSERT INTO `advicetable` VALUES ('1', '440882199602270616', '2017-09-27 17:42:25', '1号楼电梯坏了', '0', null);
INSERT INTO `advicetable` VALUES ('2', '440882199602270616', '2017-09-27 17:42:27', '小区里卫生太差', '1', '管理员已派人维修');
INSERT INTO `advicetable` VALUES ('3', '440882199602270616', '2017-09-27 17:42:28', '公共运动设施损坏', '0', '管理员已经派人修好');
INSERT INTO `advicetable` VALUES ('4', '440882199602270616', '2017-09-27 17:42:29', '隔壁203太吵了晚上', '1', '正在协调');
INSERT INTO `advicetable` VALUES ('5', '440882199602270616', '2017-09-27 17:58:50', '有人故意破坏小区健身器材', '0', null);
INSERT INTO `advicetable` VALUES ('6', '440882199602270616', '2017-09-27 18:11:08', '\r\n有人故意破坏小区健身器材', '0', null);
INSERT INTO `advicetable` VALUES ('7', '440882199602270616', '2017-09-27 19:21:39', '有人故意破坏小区健身器材', '1', '已处理');

-- ----------------------------
-- Table structure for carinfo
-- ----------------------------
DROP TABLE IF EXISTS `carinfo`;
CREATE TABLE `carinfo` (
  `carNum` char(8) NOT NULL,
  `userId` char(18) NOT NULL,
  `color` varchar(10) NOT NULL,
  `brand` varchar(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`carNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carinfo
-- ----------------------------
INSERT INTO `carinfo` VALUES ('湘A-K1234', '440882199602270616', '黑', '奔驰', '敞篷跑车');
INSERT INTO `carinfo` VALUES ('湘A-M2499', '440882199602270616', '白', '宝马', '豪华轿车');

-- ----------------------------
-- Table structure for consumeinfo
-- ----------------------------
DROP TABLE IF EXISTS `consumeinfo`;
CREATE TABLE `consumeinfo` (
  `consumeId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingNum` int(11) NOT NULL,
  `roomNum` int(11) NOT NULL,
  `userId` char(18) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `consumeDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `consumeType` int(11) NOT NULL,
  `unitPrice` double(8,2) NOT NULL,
  `count` double(8,2) NOT NULL,
  `price` double(8,2) NOT NULL,
  `consumeState` int(11) NOT NULL,
  PRIMARY KEY (`consumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumeinfo
-- ----------------------------
INSERT INTO `consumeinfo` VALUES ('1', '1', '101', '440882199602270616', '2017-09-27 18:34:38', '2017-01-27 18:09:22', '0', '0.50', '50.00', '25.00', '1');
INSERT INTO `consumeinfo` VALUES ('2', '1', '101', '440882199602270616', '2017-09-27 19:14:54', '2017-09-27 19:14:54', '1', '0.60', '150.00', '90.00', '1');
INSERT INTO `consumeinfo` VALUES ('3', '1', '101', '440882199602270616', '2017-09-27 18:34:45', '2017-03-20 17:48:25', '2', '1.00', '200.00', '200.00', '1');
INSERT INTO `consumeinfo` VALUES ('4', '1', '101', '440882199602270616', '2017-09-27 18:35:38', '2017-09-27 18:35:38', '1', '1.00', '108.00', '108.00', '1');
INSERT INTO `consumeinfo` VALUES ('6', '1', '101', '440882199602270616', '2017-09-27 19:14:54', '2017-09-27 19:14:54', '0', '0.50', '40.00', '20.00', '1');
INSERT INTO `consumeinfo` VALUES ('7', '1', '101', '440882199602270616', '2017-09-27 18:34:50', '2016-02-27 18:34:28', '1', '0.60', '100.00', '60.00', '0');
INSERT INTO `consumeinfo` VALUES ('8', '1', '101', '440882199602270616', '2017-09-27 18:34:57', '2016-03-27 17:42:08', '1', '0.50', '200.00', '100.00', '0');
INSERT INTO `consumeinfo` VALUES ('9', '1', '101', '440882199602270616', '2017-09-27 17:51:52', '2017-09-01 00:00:00', '0', '1.00', '100.00', '100.00', '0');
INSERT INTO `consumeinfo` VALUES ('10', '1', '102', '331125198805145053', '2017-09-27 18:06:06', '2017-12-07 17:52:59', '1', '0.50', '100.00', '50.00', '0');
INSERT INTO `consumeinfo` VALUES ('11', '1', '101', '440882199602270616', '2017-09-27 18:35:18', '2017-11-07 00:00:00', '0', '2.00', '10.00', '20.00', '0');

-- ----------------------------
-- Table structure for houseinfo
-- ----------------------------
DROP TABLE IF EXISTS `houseinfo`;
CREATE TABLE `houseinfo` (
  `buildingNum` int(11) NOT NULL,
  `roomNum` int(11) NOT NULL,
  `userId` char(18) DEFAULT NULL,
  `houseType` int(11) NOT NULL,
  PRIMARY KEY (`buildingNum`,`roomNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of houseinfo
-- ----------------------------
INSERT INTO `houseinfo` VALUES ('1', '101', '440882199602270616', '1');
INSERT INTO `houseinfo` VALUES ('1', '102', '440882199602270616', '2');
INSERT INTO `houseinfo` VALUES ('1', '103', '440882199602270616', '3');
INSERT INTO `houseinfo` VALUES ('1', '104', '440882199602270616', '4');

-- ----------------------------
-- Table structure for housetypeinfo
-- ----------------------------
DROP TABLE IF EXISTS `housetypeinfo`;
CREATE TABLE `housetypeinfo` (
  `houseType` int(11) NOT NULL,
  `area` double(8,2) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`houseType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of housetypeinfo
-- ----------------------------
INSERT INTO `housetypeinfo` VALUES ('1', '200.00', '土豪别墅');
INSERT INTO `housetypeinfo` VALUES ('2', '108.00', '四室两厅');
INSERT INTO `housetypeinfo` VALUES ('3', '98.00', '三室一厅');

-- ----------------------------
-- Table structure for noticetable
-- ----------------------------
DROP TABLE IF EXISTS `noticetable`;
CREATE TABLE `noticetable` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT,
  `noticeType` int(11) NOT NULL,
  `noticeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `changeDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `noticeTitle` varchar(50) NOT NULL,
  `noticeContent` text NOT NULL,
  `pictureAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noticetable
-- ----------------------------
INSERT INTO `noticetable` VALUES ('1', '0', '2017-09-24 19:27:23', '2017-09-24 19:27:23', '热烈庆祝梅岭服务信息网全新改版上线', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic02.jpg');
INSERT INTO `noticetable` VALUES ('2', '1', '2017-09-24 12:47:59', '2017-09-24 12:47:59', '停水公告', '由于明天全小区换水管，明天停水，请大家提前做好准备，对此给大家造成的麻烦敬请见谅。', '');
INSERT INTO `noticetable` VALUES ('3', '2', '2017-09-24 13:21:02', '2017-09-24 13:21:02', '寻找钱包', '我是小王，7月20日在小区b栋附近丢了一部iphone 8,请捡到的联系我18755634895，必重酬！', 'images/1.jpg');
INSERT INTO `noticetable` VALUES ('4', '0', '2017-09-27 17:33:43', '2017-09-27 17:33:43', '日前谷歌联合中国棋院举行发布会', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic01.jpg');
INSERT INTO `noticetable` VALUES ('5', '0', '2017-09-24 19:27:27', '2017-09-24 19:27:27', '高端技术：Jigsaw 和 JPMS', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic03.jpg');
INSERT INTO `noticetable` VALUES ('6', '0', '2017-09-24 19:27:28', '2017-09-24 19:27:28', '继承与合成基本概念', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic03.jpg');
INSERT INTO `noticetable` VALUES ('7', '0', '2017-09-27 17:33:37', '2017-09-27 17:33:37', '美女程序员访谈', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic01.jpg');
INSERT INTO `noticetable` VALUES ('8', '0', '2017-09-27 17:31:28', '2017-09-27 17:31:28', '没有身份证号的人工智能小冰出诗集了', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic03.jpg');
INSERT INTO `noticetable` VALUES ('9', '1', '2017-09-24 13:40:57', '2017-09-24 13:40:57', '电费提升通知', '由于近期物价上涨，从明天其电费调整为8毛一度，还请大家做好心理准备。', '');
INSERT INTO `noticetable` VALUES ('10', '0', '2017-09-27 17:31:18', '2017-09-27 17:31:18', '《深圳经济特区物业管理条例》实施若干规定', '这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲。这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n    你是人间的苦人\r\n    其说是落花的清闲，这孤立从悬崖深谷之青色\r\n    寂寞将无限虚空\r\n    我恋着我的青春\r\n    你是这世界你不绝其理\r\n    梦在悬崖上一片苍空\r\n    寂寞之夜已如火焰的宝星\r\n', 'images/pic02.jpg');
INSERT INTO `noticetable` VALUES ('15', '0', '2017-09-27 19:20:08', '2017-09-27 19:20:08', '习近平为破解安全挑战贡献中国方案', '国家主席习近平26日在北京出席国际刑警组织第86届全体大会开幕式并发表题为《坚持合作创新法治共赢　携手开展全球安全治理》的主旨演讲，强调中国愿同各国政府及其执法机构、各国际组织一道，高举合作、创新、法治、共赢的旗帜，共同构建普遍安全的人类命运共同体。\r\n\r\n　　对此，海外专家学者接受新华社记者采访时指出，安全问题事关人类前途命运，面对安全问题联动性、跨国性、多样性日益突出的形势，习近平主席提出的“共同构建普遍安全的人类命运共同体”以及就加强国际执法安全合作提出的四点主张，是为有效破解安全领域挑战贡献的中国方案。\r\n\r\n　　印度尼西亚智库亚洲创新研究中心主席班邦·苏尔约诺认为，习主席的四点主张务实深刻，对当前全球安全治理面临的重大问题以及呈现的趋势做到了准确把脉，为实现全球共同治理的路径与方法给出了中国方案，“持久安全”“共同治理”“公平正义”与“平衡普惠”更是体现了中国领导人对构建人类命运共同体的深刻思考。\r\n\r\n　　澳大利亚迪斯考恩大学安全研究所负责人、网络犯罪国际刑警组织专家小组成员克雷格·瓦利表示完全同意习主席提出的“共同构建普遍安全的人类命运共同体”的理念。他说，犯罪行为已经全球化，并且在网络空间找到滋生空间，然而各国执法体系普遍调整不够，应对不力。面对安全问题联动性、跨国性、多样性日益突出的挑战，合作是各国唯一的选择。\r\n\r\n　　在新加坡国立大学法学院副教授王江雨看来，习主席提出的“坚持合作共建”“坚持改革创新”“坚持法治精神”“坚持互利共赢”中，体现了平等与合作。他认为，“平等”强调各国在国际执法合作体系中的平等参与、共同协商，尤其是发展中国家在这一体系中的广泛平等参与。在仍为西方所主导的国际执法合作体系中，强调这一点尤为重要，中国是在这个问题上为广大发展中国家发声。另一方面，“合作”更为必要，因为当今世界所面临的安全问题，几乎涉及每一个国家，如果各国不能通力合作，这些问题根本无从解决。\r\n\r\n　　马来西亚太平洋研究中心首席顾问胡逸山对习主席在演讲中谈到的中国将在未来5年内积极参与发展中国家执法能力建设印象深刻。他说，各国警方之间的情报信息交流和培训是国际刑警组织最重要的任务，中国承诺帮助发展中国家培训执法人员、援建升级国际刑警组织通信系统和刑事调查实验室，以实际行动推动全球警方执法能力均衡发展，一定会受到各国欢迎。\r\n\r\n　　俄罗斯国防与安全问题专家格里戈里·特罗菲姆丘克赞同习主席对世界安全问题新态势的判断，并认为中国对国际刑警组织的支持意义重大。他说，长期以来，中国积极参与国际反恐斗争，致力于加强与各国执法机构合作，在打击恐怖主义、网络犯罪、腐败及各种有组织犯罪方面经验丰富，中国支持国际刑警组织的行动将受到国际社会热烈欢迎，中国将在保障国际安全、完善国际治理方面发挥更大作用。\r\n\r\n　　泰国大拓律师事务所主任史大佗认为，习主席提出的“坚持合作共建”“坚持改革创新”“坚持法治精神”“坚持互利共赢”体现了国际刑事司法协助的精髓。新型跨国犯罪需要多个国家协助才可予以阻止或破案，这就需要根据国与国之间签署的刑事司法协助条约，让请求国和被请求国有法可依，提高办案效率，保护当事人合法权益。（参与记者：梁辉、许经麟、何嘉悦、王丽丽、刘彤、林昊、魏良磊、明大军）', 'images/news.jpg');

-- ----------------------------
-- Table structure for repairtable
-- ----------------------------
DROP TABLE IF EXISTS `repairtable`;
CREATE TABLE `repairtable` (
  `repairId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingNum` int(11) NOT NULL,
  `roomNum` int(11) NOT NULL,
  `userId` char(18) NOT NULL,
  `repairDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `repairContent` text NOT NULL,
  `repairState` int(11) NOT NULL,
  `repairResponse` text,
  PRIMARY KEY (`repairId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repairtable
-- ----------------------------
INSERT INTO `repairtable` VALUES ('1', '1', '101', '440882199602270616', '2017-09-27 17:41:29', '下水道堵住了', '0', null);
INSERT INTO `repairtable` VALUES ('2', '1', '101', '440882199602270616', '2017-09-27 17:41:30', '阳台玻璃碎了', '1', '管理员已派人上门服务');
INSERT INTO `repairtable` VALUES ('3', '1', '101', '440882199602270616', '2017-09-27 17:41:32', '水龙头坏了', '2', '管理员以派人解决');
INSERT INTO `repairtable` VALUES ('4', '1', '101', '440882199602270616', '2017-09-27 17:41:34', '厕所堵了', '1', '已经派人去维修了');
INSERT INTO `repairtable` VALUES ('5', '1', '101', '440882199602270616', '2017-09-27 17:41:36', '下水道很臭', '2', '已处理');
INSERT INTO `repairtable` VALUES ('6', '1', '101', '440882199602270616', '2017-09-27 17:56:16', '我家水管坏了', '0', null);
INSERT INTO `repairtable` VALUES ('7', '1', '101', '440882199602270616', '2017-09-27 18:10:20', '我家水管坏了', '0', null);
INSERT INTO `repairtable` VALUES ('8', '1', '101', '440882199602270616', '2017-09-27 19:21:23', '我家水管坏了', '1', '正在派人修');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` char(18) NOT NULL,
  `password` varchar(18) NOT NULL,
  `userName` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `roleType` int(11) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('111111111111111111', '123456', '邓紫棋', '女', '987654321', '2');
INSERT INTO `userinfo` VALUES ('111111111111222222', '123456', '王俊凯', '男', '3163515315', '2');
INSERT INTO `userinfo` VALUES ('111122222222222222', '123456', '梅西', '男', '4455621262', '2');
INSERT INTO `userinfo` VALUES ('153653213232222222', '123456', '露娜', '女', '3453643545', '2');
INSERT INTO `userinfo` VALUES ('255555555222222222', '123456', '迪丽热巴', '女', '1234568899', '2');
INSERT INTO `userinfo` VALUES ('434343434343434344', '123456', '罗纳尔多', '男', '6856565656', '2');
INSERT INTO `userinfo` VALUES ('440882199602270616', '123456', '隔壁老王', '男', '2531161365', '2');
INSERT INTO `userinfo` VALUES ('445555555555555554', '123456', '陈经理', '女', '1233445666', '2');
INSERT INTO `userinfo` VALUES ('563868438484848678', '123456', '雪诺', '男', '6535635686', '2');
INSERT INTO `userinfo` VALUES ('565635363684863468', '123456', '貂蝉', '女', '1213156165', '2');
INSERT INTO `userinfo` VALUES ('565655865646848654', '123456', '涛妹', '女', '5534534354', '2');
INSERT INTO `userinfo` VALUES ('565656656556565555', '123456', '卡丽熙', '女', '2356131651', '2');
INSERT INTO `userinfo` VALUES ('653684646468486486', '123456', 'C罗', '男', '56332256325', '1');
INSERT INTO `userinfo` VALUES ('888888888888888888', '123456', 'Admin', '男', '13100250227', '0');