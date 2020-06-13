/*
 Navicat Premium Data Transfer

 Source Server         : MySQL56
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 08/02/2020 21:48:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy`  (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` float(10, 2) NOT NULL,
  `number` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('admin', '666666', '', '', '', 2019.66);
INSERT INTO `customers` VALUES ('user1', '666666', '李四', '上海', '10086', 0.00);
INSERT INTO `customers` VALUES ('user2', '666666', '李四', '北京市', '10086', 0.00);
INSERT INTO `customers` VALUES ('user3', '666666', '', '', '', 0.00);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` float(10, 2) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `brand` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpu_brand` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpu_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `memory_capacity` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hd_capacity` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `card_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '荣耀MagicBook 2019', 3899.00, '荣耀MagicBook 2019 14英寸轻薄窄边框笔记本电脑（AMD锐龙5 3500U 8G 512G FHD IPS 指纹解锁）冰河银', '荣耀', 'AMD', 'AMD锐龙5 3500U移动处理器', '8GB', '512GB', '集成显卡', './img/01.png');
INSERT INTO `goods` VALUES (2, '华为HUAWEI MateBook', 5999.00, '华为HUAWEI MateBook 14 全面屏轻薄性能笔记本电脑(英特尔酷睿i5 8G 512G MX250 office 2K 一碰传)灰', '华为', 'Intel', 'i5 8265U', '8GB', '512GB', 'Nvidia GeForce MX250', './img/02.png');
INSERT INTO `goods` VALUES (3, '联想(Lenovo)拯救者Y7000P', 9299.00, '联想(Lenovo)拯救者Y7000P 2019英特尔酷睿i715.6英寸游戏笔记本电脑(i7-9750H 8G 1T SSD GTX1660Ti 144Hz)', '联想', 'Intel', 'i7-9750H', '8GB', '1TB', 'NVIDIA GeForce GTX 1660Ti', './img/03.png');
INSERT INTO `goods` VALUES (4, '戴尔(DELL)成就3470', 3099.00, '戴尔(DELL)成就3470 英特尔酷睿i3 高性能 商用办公 台式电脑整机(i3-8100 8G 1T 键鼠 WIFI 蓝牙)21.5英寸', '戴尔', 'Intel', 'i3-8100', '8GB', '1TB', '集成显卡', './img/04.png');
INSERT INTO `goods` VALUES (5, 'Apple Macbook Air 13.3', 6488.00, 'Apple Macbook Air 13.3 | Core i5 8G 128G SSD 苹果笔记本电脑 轻薄本 银色 MQD32CH/A', '苹果', 'Intel', 'i5', '8GB', '128GB', '集成显卡', './img/05.png');
INSERT INTO `goods` VALUES (6, '惠普(HP)暗影精灵5', 8499.00, '惠普(HP)暗影精灵5 15.6英寸游戏笔记本电脑(i7-9750H 8G 512GSSD RTX2060 6G独显 144Hz)', '惠普', 'Intel', 'i7-9750H', '8GB', '512GB', 'RTX2060', './img/06.png');
INSERT INTO `goods` VALUES (7, '小米 (MI)Ruby 2019款', 3898.00, '小米 (MI)Ruby 2019款 15.6英寸金属轻薄笔记本电脑(第八代英特尔酷睿i5-8250U 8G 512G SSD 2G GDDR5独显', '小米', 'Intel', 'i5-8250U', '8GB', '512GB', 'NVIDIA GeForce MX110', './img/07.png');
INSERT INTO `goods` VALUES (8, '机械革命(MECHREVO)X8Ti Plus', 6966.00, '机械革命(MECHREVO)Z2 Air 九代英特尔酷睿i7 15.6英寸轻薄游戏笔记本电脑(i7-9750H 8G 512G SSD GTX1650）', '机械革命', 'Intel', 'i5-8300H', '8GB', '1T', 'GTX1060', './img/08.png');
INSERT INTO `goods` VALUES (9, '外星人', 13998.00, '外星人17.3英寸游戏笔记本电脑(i7-8750H 16G 256G固态 1T GTX1060 6G独显 QHD)黑', '外星人', 'Intel', 'i7-8750H', '16GB', '1T', 'GTX1060', './img/09.png');
INSERT INTO `goods` VALUES (10, '神舟(HASEE)战神Z7-CT7NA', 6699.00, '神舟(HASEE)战神Z7-CT7NA 英特尔酷睿i7-9750H GTX1660Ti 6G独显15.6英寸窄边框游戏笔记本电脑(8G 512G SSD)', '神舟战神', 'Intel', 'i7-9750H', '8GB', '512GB ', 'GTX1660Ti', './img/10.png');
INSERT INTO `goods` VALUES (11, '联想ThinkPad X390', 7999.00, '联想ThinkPad X390（00CD）英特尔酷睿i5 13.3英寸轻薄笔记本电脑（i5-8265U 8G 512GSSD FHD 指纹识别）', '联想ThinkPad', 'Intel', 'i5-8265U', '8GB', '512GB ', '英特尔 UHD 620显示芯片', './img/11.png');

SET FOREIGN_KEY_CHECKS = 1;
