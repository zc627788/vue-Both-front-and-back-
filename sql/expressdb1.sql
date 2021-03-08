/*
 Navicat Premium Data Transfer

 Source Server         : 留言
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : expressdb

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 08/03/2021 20:05:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `Book_num` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Writer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sort_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Price` int(11) NULL DEFAULT NULL,
  `Pub_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Pub_date` datetime(0) NULL DEFAULT NULL,
  `Total_num` int(11) NULL DEFAULT NULL,
  `Current_num` int(11) NULL DEFAULT NULL,
  `Buy_date` datetime(0) NULL DEFAULT NULL,
  `Brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Book_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, '并发编程实战1', '../../../static/images/book/', '高洪岩', '6', 98, '东软集团', '2018-12-28 00:00:00', 200, 197, '2017-10-08 00:00:00', 'Java高并发编程详解：多线程与架构设计+Java并发编程：核心方法与框架');
INSERT INTO `t_book` VALUES (2, '深入理解Java虚拟机', 'http://img13.360buyimg.com/n1/s200x200_jfs/t6130/167/771989293/235186/608d0264/592bf167Naf49f7f6.jpg', '周志明', '5', 89, '机械出版社', '2013-01-01 14:12:29', 100, 89, '2018-12-12 14:12:51', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）');
INSERT INTO `t_book` VALUES (3, 'Java多线程编程核心技术', 'http://img14.360buyimg.com/n1/s200x200_jfs/t1408/343/298344088/165083/8c0b31fa/55726488N4453a762.jpg', '高洪岩', '7', 69, '机械工业出版社', '2011-01-01 00:00:00', 80, 69, '2018-07-01 00:00:00', '　Java多线程无处不在，多线程可以有效提升计算和处理效率，大大提升吞吐量和可伸缩性，深得广大程序员和公司');
INSERT INTO `t_book` VALUES (4, 'JavaScript和JQ程序设计', 'http://file.ryjiaoyu.com/SmallCover/1705499e849f3c8090c5', '陈鹏', '10', 59, '人民邮电出版社', '2015-01-25 16:05:45', 60, 59, '2018-12-16 16:05:58', 'JS和JQ程序设计（慕课版）');
INSERT INTO `t_book` VALUES (5, 'node.js', '../../../static/images/book/1615170107148.jpg', 'zc', 'undefined', 1, '1', '2021-02-28 00:00:00', 40, 39, '2021-03-16 00:00:00', '1');

-- ----------------------------
-- Table structure for t_book_student
-- ----------------------------
DROP TABLE IF EXISTS `t_book_student`;
CREATE TABLE `t_book_student`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_num` int(11) NULL DEFAULT NULL,
  `Student_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `borrow_date` datetime(0) NULL DEFAULT NULL,
  `return_date` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `major_id`(`Book_num`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book_student
-- ----------------------------
INSERT INTO `t_book_student` VALUES (41, 1, NULL, '2021-03-08 00:00:00', '2021-04-08 00:00:00', '0112180141');
INSERT INTO `t_book_student` VALUES (42, 2, NULL, '2021-03-08 00:00:00', '2021-04-08 00:00:00', '0112180141');
INSERT INTO `t_book_student` VALUES (43, 1, NULL, '2021-03-08 00:00:00', '2021-04-08 00:00:00', '1234567890');
INSERT INTO `t_book_student` VALUES (44, 2, NULL, '2021-03-08 00:00:00', '2021-04-08 00:00:00', '1234567890');
INSERT INTO `t_book_student` VALUES (45, 3, NULL, '2021-03-08 00:00:00', '2021-04-08 00:00:00', '1234567890');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `Student_num` int(11) NOT NULL AUTO_INCREMENT,
  `Student_code` int(255) NULL DEFAULT NULL COMMENT '学生学号',
  `Student_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Academy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `Class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Student_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES (81, 112180141, '小成', '软件', '1班', '男', '123@123.com', '0112180141');
INSERT INTO `t_student` VALUES (82, 1234567890, 'user', '移动互联', '1班', '男', '123@5435.com', '1234567890');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '123');
INSERT INTO `user` VALUES ('0112180141', 'zc627788');
INSERT INTO `user` VALUES ('1234567890', '123');

SET FOREIGN_KEY_CHECKS = 1;
