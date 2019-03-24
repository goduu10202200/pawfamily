/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : myback

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-24 21:53:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `no` int(10) NOT NULL,
  `id` char(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` char(10) NOT NULL,
  `phone` int(20) NOT NULL,
  `sex` char(10) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO manager VALUES ('1', 'jsp', '123', 'server', '123', 'boy');
