/*
 Navicat MySQL Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : maskmanage

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/05/2020 20:12:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(11) NOT NULL COMMENT '管理员ID',
  `adminUserId` int(11) NOT NULL COMMENT '管理员用户名',
  `adminStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员状态',
  PRIMARY KEY (`adminId`) USING BTREE,
  INDEX `16`(`adminUserId`) USING BTREE,
  INDEX `adminId`(`adminId`) USING BTREE,
  INDEX `adminId_2`(`adminId`) USING BTREE,
  CONSTRAINT `16` FOREIGN KEY (`adminUserId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column`  (
  `columnId` int(11) NOT NULL COMMENT '专栏ID',
  `columnTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专栏标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专栏作者',
  `columnAdminId` int(11) NULL DEFAULT NULL COMMENT '专栏发布者用户ID',
  `columnContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专栏内容',
  `columnInterviewee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专栏专家名字',
  `columnPubTime` datetime(0) NULL DEFAULT NULL COMMENT '新闻发布时间',
  PRIMARY KEY (`columnId`) USING BTREE,
  INDEX `5`(`columnAdminId`) USING BTREE,
  CONSTRAINT `5` FOREIGN KEY (`columnAdminId`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `dataId` int(11) NOT NULL COMMENT '数据展示ID',
  `dataTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据展示标题',
  `dataLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据存储位置',
  `dataAdminId` int(11) NOT NULL COMMENT '数据展示发布者ID',
  `dataPubTime` datetime(0) NULL DEFAULT NULL COMMENT '数据展示发布时间',
  PRIMARY KEY (`dataId`) USING BTREE,
  INDEX `6`(`dataAdminId`) USING BTREE,
  CONSTRAINT `6` FOREIGN KEY (`dataAdminId`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for donation
-- ----------------------------
DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation`  (
  `donationId` int(11) NOT NULL COMMENT '捐赠ID',
  `donationName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠名',
  `resourceId` int(11) NULL DEFAULT NULL COMMENT '捐赠物资类型：1为口罩，2为防护服',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠物资数量',
  `fromDonatorId` int(11) NULL DEFAULT NULL COMMENT '捐赠者ID',
  `donationTime` datetime(0) NOT NULL COMMENT '捐赠时间',
  PRIMARY KEY (`donationId`) USING BTREE,
  INDEX `1`(`fromDonatorId`) USING BTREE,
  INDEX `13`(`resourceId`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`fromDonatorId`) REFERENCES `donator` (`donatorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `13` FOREIGN KEY (`resourceId`) REFERENCES `resource` (`resid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for donator
-- ----------------------------
DROP TABLE IF EXISTS `donator`;
CREATE TABLE `donator`  (
  `donatorId` int(11) NOT NULL COMMENT '捐赠者ID',
  `donatorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠者姓名',
  `donatorTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠者手机号',
  `donatorUserId` int(11) NOT NULL COMMENT '捐赠者用户ID',
  `donatorSignDate` datetime(0) NULL DEFAULT NULL COMMENT '捐赠者注册日期',
  `donatorIDnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠者身份证号',
  PRIMARY KEY (`donatorId`) USING BTREE,
  INDEX `11`(`donatorUserId`) USING BTREE,
  INDEX `donatorId`(`donatorId`) USING BTREE,
  INDEX `donatorId_2`(`donatorId`) USING BTREE,
  INDEX `donatorId_3`(`donatorId`) USING BTREE,
  INDEX `donatorId_4`(`donatorId`) USING BTREE,
  CONSTRAINT `11` FOREIGN KEY (`donatorUserId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express`  (
  `expressId` int(11) NOT NULL COMMENT '快递信息ID',
  `expressTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递信息标题',
  `type` int(11) NOT NULL COMMENT '运送物资种类：1为口罩，2为防护服',
  `amount` int(11) NOT NULL COMMENT '物资数量',
  `expressApi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递详情查询接口地址',
  `reqrId` int(11) NOT NULL COMMENT '对应的需求ID',
  PRIMARY KEY (`expressId`) USING BTREE,
  INDEX `9`(`reqrId`) USING BTREE,
  CONSTRAINT `9` FOREIGN KEY (`reqrId`) REFERENCES `requirement` (`reqrId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `hosId` int(11) NOT NULL COMMENT '医院ID',
  `hosLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院地址',
  `hosName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院名',
  `hosUserId` int(11) NOT NULL COMMENT '医院用户ID',
  `hosTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院电话号',
  `hosSignDate` datetime(0) NULL DEFAULT NULL COMMENT '医院注册日期',
  `hosIDnum` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医院号（国家提供的每个医院的ID，类似个人的身份证号）',
  PRIMARY KEY (`hosId`) USING BTREE,
  INDEX `10`(`hosUserId`) USING BTREE,
  INDEX `hosId`(`hosId`) USING BTREE,
  INDEX `hosId_2`(`hosId`) USING BTREE,
  INDEX `hosId_3`(`hosId`) USING BTREE,
  INDEX `hosId_4`(`hosId`) USING BTREE,
  CONSTRAINT `10` FOREIGN KEY (`hosUserId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newsId` int(11) NOT NULL COMMENT '新闻ID',
  `newsTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `newsAdminId` int(11) NOT NULL COMMENT '新闻发布者用户ID',
  `newsContent` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻内容',
  `authorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻作者',
  `newsPubTime` datetime(0) NULL DEFAULT NULL COMMENT '新闻发布时间',
  PRIMARY KEY (`newsId`) USING BTREE,
  INDEX `4`(`newsAdminId`) USING BTREE,
  CONSTRAINT `4` FOREIGN KEY (`newsAdminId`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for requirement
-- ----------------------------
DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement`  (
  `reqrId` int(11) NOT NULL COMMENT '医院需求ID',
  `reqrName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求名',
  `type` int(11) NULL DEFAULT NULL COMMENT '需求物资类型：1为口罩，2为防护服',
  `reqrTime` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `reqrStatus` int(11) NULL DEFAULT NULL COMMENT '状态：0为未供应物资，1为已供应物资',
  `reqrHosId` int(11) NOT NULL COMMENT '发出需求医院ID',
  `check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态：0为未审核，1为审核通过，2为审核未通过',
  PRIMARY KEY (`reqrId`) USING BTREE,
  INDEX `reqrId`(`reqrId`) USING BTREE,
  INDEX `reqrId_2`(`reqrId`) USING BTREE,
  INDEX `reqrId_3`(`reqrId`) USING BTREE,
  INDEX `reqrId_4`(`reqrId`) USING BTREE,
  INDEX `reqrId_5`(`reqrId`) USING BTREE,
  INDEX `reqrId_6`(`reqrId`) USING BTREE,
  INDEX `reqrId_7`(`reqrId`) USING BTREE,
  INDEX `reqrId_8`(`reqrId`) USING BTREE,
  INDEX `3`(`reqrHosId`) USING BTREE,
  INDEX `reqrId_9`(`reqrId`) USING BTREE,
  INDEX `reqrId_10`(`reqrId`) USING BTREE,
  CONSTRAINT `3` FOREIGN KEY (`reqrHosId`) REFERENCES `hospital` (`hosid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `resId` int(11) NOT NULL COMMENT '资源ID',
  `resName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  PRIMARY KEY (`resId`) USING BTREE,
  INDEX `resId`(`resId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '口罩');
INSERT INTO `resource` VALUES (2, '防护服');

-- ----------------------------
-- Table structure for supervision
-- ----------------------------
DROP TABLE IF EXISTS `supervision`;
CREATE TABLE `supervision`  (
  `supervisionId` int(11) NOT NULL,
  `supId` int(11) NULL DEFAULT NULL,
  `hosId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`supervisionId`) USING BTREE,
  INDEX `14`(`supId`) USING BTREE,
  INDEX `15`(`hosId`) USING BTREE,
  CONSTRAINT `14` FOREIGN KEY (`supId`) REFERENCES `supervisor` (`supid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `15` FOREIGN KEY (`hosId`) REFERENCES `hospital` (`hosid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervisor
-- ----------------------------
DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE `supervisor`  (
  `supId` int(11) NOT NULL COMMENT '监督人员ID',
  `supName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督人员姓名',
  `supSubjection` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督人员隶属单位',
  `supIDnum` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督人员身份证号',
  `supUserId` int(255) NOT NULL COMMENT '监督人员用户ID',
  PRIMARY KEY (`supId`) USING BTREE,
  INDEX `12`(`supUserId`) USING BTREE,
  INDEX `supId`(`supId`) USING BTREE,
  INDEX `supId_2`(`supId`) USING BTREE,
  CONSTRAINT `12` FOREIGN KEY (`supUserId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usage
-- ----------------------------
DROP TABLE IF EXISTS `usage`;
CREATE TABLE `usage`  (
  `usageId` int(11) NOT NULL COMMENT '使用情况ID',
  `usageTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用情况标题',
  `reqrId` int(11) NOT NULL COMMENT '对应的需求ID',
  `usageDesc` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用情况描述',
  `check` int(11) NULL DEFAULT NULL COMMENT '审核状态：0为未审核，1为审核通过，2为审核未通过',
  `usageHosId` int(11) NOT NULL COMMENT '使用情况发布者ID',
  PRIMARY KEY (`usageId`) USING BTREE,
  INDEX `7`(`reqrId`) USING BTREE,
  INDEX `8`(`usageHosId`) USING BTREE,
  CONSTRAINT `7` FOREIGN KEY (`reqrId`) REFERENCES `requirement` (`reqrid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `8` FOREIGN KEY (`usageHosId`) REFERENCES `hospital` (`hosid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱',
  PRIMARY KEY (`userid`, `username`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
