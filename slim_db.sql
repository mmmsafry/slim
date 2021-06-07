/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : slim_db

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 07/06/2021 19:58:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '0', 'root Element', 137, NULL, '2021-06-02 15:33:57', NULL);
INSERT INTO `categories` VALUES (2, '0', 'seondRoot', 50, NULL, '2021-06-02 15:33:57', NULL);
INSERT INTO `categories` VALUES (3, '1', 'sub 1', 75, NULL, '2021-06-02 15:33:57', NULL);
INSERT INTO `categories` VALUES (4, '1', 'sub 2', 35, NULL, '2021-06-02 15:33:57', NULL);
INSERT INTO `categories` VALUES (5, '2', 'sub 1 of 2', 60, NULL, '2021-06-02 15:33:57', NULL);
INSERT INTO `categories` VALUES (6, '2', 'sub 2 of 2', 10, NULL, '2021-06-03 16:52:03', NULL);
INSERT INTO `categories` VALUES (7, '3', 'sub sub category ', 6, NULL, '2021-06-03 16:52:03', NULL);
INSERT INTO `categories` VALUES (9, '0', 'category root 3', 56, '2021-06-02 16:53:20', '2021-06-02 16:53:20', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'alax', 'alax@mail.com', '$2y$10$6Rc/kbJMSKV6LhSm/3NubOz7VXj9nEtApVCR5.YHKwKUGulAmIvZW', '2021-06-02 22:09:44', NULL);

SET FOREIGN_KEY_CHECKS = 1;
