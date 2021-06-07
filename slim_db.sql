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

 Date: 07/06/2021 23:56:58
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
INSERT INTO `categories` VALUES (14096, '14100', 'Kleding', 137, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14098, '14096', 'Badmode', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14100, '0', 'Dames', 136, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14101, '14096', 'Broeken', 17, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14104, '14096', 'Jassen en Mantels', 5, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14105, '14096', 'Jurken', 32, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14106, '14096', 'Lingerie en nachtmode', 5, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14107, '14096', 'Shirts en Tops', 41, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14108, '14096', 'Truien en Vesten', 15, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14114, '14100', 'Accessoires', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14126, '0', 'Kids', 154, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14212, '14096', 'Jeans', 9, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14213, '14212', 'Straight', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14214, '14212', 'Skinny', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14215, '14212', 'Slim', 9, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14216, '14107', 'Tops', 38, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14217, '14108', 'Sweaters', 6, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14219, '14114', 'Riemen', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14220, '14107', 'Longsleeves', 15, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14221, '14107', 'T-shirts', 28, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14223, '16935', 'Blouses', 9, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14224, '14105', 'Casual jurken', 31, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14226, '14096', 'Joggingbroeken', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14228, '14105', 'Maxi jurken', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14230, '14101', 'Leggings', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14231, '16891', 'Mini Rokken', 5, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14232, '14105', 'Mouwloze jurken', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14234, '14101', 'Shorts', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14236, '14105', 'Jurken lange mouw', 10, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14237, '14101', 'Jumpsuits en Playsuits', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14239, '14101', 'Pantalons', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14240, '14105', 'Jurken korte mouw', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14559, '14100', 'Sport', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14665, '14126', 'Boys', 69, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (14666, '14126', 'Girls', 93, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16861, '14212', 'Bootcut', 5, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16877, '14212', 'Relaxed', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16891, '14096', 'Rokken', 12, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16909, '14105', 'Cocktail jurken', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16915, '14105', 'Blousejurken', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16919, '14105', 'Overige jurken', 31, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16935, '14096', 'Blouses', 13, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16942, '14096', 'Overhemden', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16948, '16935', 'Overige blouses', 10, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16968, '14101', 'Overige broeken', 12, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (16976, '16891', 'Kokerrok', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17002, '14104', 'Spijkerjassen', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17012, '14104', 'Winterjassen', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17016, '14104', 'Overige Jassen en Mantels', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17071, '14096', 'Badpakken', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17091, '14098', 'Overige Badmode', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17106, '14559', 'Broeken', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17131, '14106', 'BH\'s', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17137, '14106', 'Slipjes', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17241, '14114', 'Mutsen en Hoeden', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (17290, '16891', 'Overige Rokken', 12, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21249, '21251', 'Shoes', 0, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21250, '14665', 'Jassen', 15, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21251, '0', 'Heren', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21252, '14449', 'Shirts', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21253, '21251', 'T-shirts', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21258, '14665', 'T-shirts', 15, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21260, '14665', 'Broeken', 20, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21268, '14665', 'Sportkleding', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21274, '14665', 'Zwemkleding', 5, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21276, '14665', 'Overige', 28, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21284, '14666', 'Spijkerbroeken', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21290, '14666', 'Shirts', 9, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21292, '14666', 'T-shirts', 15, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21298, '14666', 'Broeken', 27, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21306, '14666', 'Sportkleding', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21308, '14666', 'Zwemkleding', 2, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21316, '14666', 'Overige', 27, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21320, '14666', 'Baby rompers', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21326, '14666', 'Rompers', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21336, '14666', 'Jassen', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21338, '14666', 'Rokken', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21340, '14666', 'Jurken', 14, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21408, '14108', 'Cardigans', 9, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21410, '16891', 'Korte Rok', 8, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21459, '14104', 'Bomberjassen', 4, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21464, '16891', 'Lange Rok', 4, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21585, '17131', 'Voorgevormde BH\'s', 3, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21601, '17137', 'Slips', 1, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (21609, '14106', 'Hipsters', 1, NULL, NULL, NULL);

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
