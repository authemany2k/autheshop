/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : autheshop_db

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-08-18 16:55:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `province_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_record` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `addresses_city_id_index` (`city_id`),
  KEY `addresses_province_id_index` (`province_id`),
  KEY `addresses_country_id_index` (`country_id`),
  KEY `addresses_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('45', 'Home', '1 idowu estate first gate Okeria NLA Addo road beside skins beside', '1 idowu estate first gate okeria NLA addo road opposite  beside akins bustop', '09078664670', '101222', '15', '1', '156', '29', '1', null, '2018-03-30 19:09:37', '2018-03-30 19:09:37', '0');
INSERT INTO `addresses` VALUES ('46', 'No 115b Macaulay bus/stop igbogbo bayeku road ikorodu lagos', 'Polo junction ribadu awolowo road ikoyi lagos', null, '+2347037155997', null, '8', '1', '156', '31', '1', null, '2018-04-02 20:09:08', '2018-04-02 20:09:08', '0');
INSERT INTO `addresses` VALUES ('47', 'Cornerstone Estate', 'House No:10 Cornerstone Estate', 'Alausa', '08033947044', '2341', '1', '1', '156', '14', '1', null, '2018-04-07 09:54:16', '2018-04-07 09:54:16', '0');
INSERT INTO `addresses` VALUES ('48', 'Cornerstone Estate', 'House No:10 Cornerstone Estate', 'Alausa', '8033947044', '2341', '1', '1', '156', '28', '1', null, '2018-04-07 21:03:23', '2018-04-07 21:03:23', '0');

-- ----------------------------
-- Table structure for admin_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`(191)),
  KEY `admin_password_resets_token_index` (`token`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES ('1', 'Size', '2018-04-11 01:48:01', '2018-04-11 01:48:01');
INSERT INTO `attributes` VALUES ('2', 'Colour', '2018-04-11 01:48:11', '2018-04-11 01:48:11');
INSERT INTO `attributes` VALUES ('4', 'Month', '2018-04-20 17:24:20', '2018-04-20 17:24:20');

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
INSERT INTO `attribute_values` VALUES ('1', '10', '1', '2018-04-11 01:48:24', '2018-04-11 01:48:24');
INSERT INTO `attribute_values` VALUES ('2', '11', '1', '2018-04-11 01:48:32', '2018-04-11 01:48:32');
INSERT INTO `attribute_values` VALUES ('3', 'Red', '2', '2018-04-11 01:48:45', '2018-04-11 01:48:45');
INSERT INTO `attribute_values` VALUES ('4', 'Blue', '2', '2018-04-11 01:48:52', '2018-04-11 01:48:52');
INSERT INTO `attribute_values` VALUES ('9', '12', '1', '2018-04-20 17:02:03', '2018-04-20 17:02:03');
INSERT INTO `attribute_values` VALUES ('10', '14', '1', '2018-04-20 17:02:11', '2018-04-20 17:02:11');
INSERT INTO `attribute_values` VALUES ('11', '16', '1', '2018-04-20 17:02:17', '2018-04-20 17:02:17');
INSERT INTO `attribute_values` VALUES ('12', '18', '1', '2018-04-20 17:02:57', '2018-04-20 17:02:57');
INSERT INTO `attribute_values` VALUES ('16', '0-2', '4', '2018-04-20 17:26:04', '2018-04-20 17:26:04');
INSERT INTO `attribute_values` VALUES ('17', '3-6', '4', '2018-04-20 17:26:15', '2018-04-20 17:26:15');
INSERT INTO `attribute_values` VALUES ('18', '7-9', '4', '2018-04-20 17:26:25', '2018-04-20 17:26:25');

-- ----------------------------
-- Table structure for attribute_value_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_product_attribute`;
CREATE TABLE `attribute_value_product_attribute` (
  `attribute_value_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned NOT NULL,
  KEY `attribute_value_product_attribute_attribute_value_id_foreign` (`attribute_value_id`),
  KEY `attribute_value_product_attribute_product_attribute_id_foreign` (`product_attribute_id`),
  CONSTRAINT `attribute_value_product_attribute_ibfk_1` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`),
  CONSTRAINT `attribute_value_product_attribute_ibfk_2` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_value_product_attribute
-- ----------------------------
INSERT INTO `attribute_value_product_attribute` VALUES ('9', '4');
INSERT INTO `attribute_value_product_attribute` VALUES ('10', '5');
INSERT INTO `attribute_value_product_attribute` VALUES ('11', '6');
INSERT INTO `attribute_value_product_attribute` VALUES ('12', '7');
INSERT INTO `attribute_value_product_attribute` VALUES ('16', '8');
INSERT INTO `attribute_value_product_attribute` VALUES ('17', '9');
INSERT INTO `attribute_value_product_attribute` VALUES ('18', '10');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', 'Ajiga Olugbenga', '2018-07-06 13:57:59', '2018-07-06 13:57:59');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Uncategorized', 'uncategorized', 'Sunt fugit earum earum dolor fuga deleniti. Omnis corrupti quam ut atque veritatis soluta harum. Id quasi eos id recusandae. Repudiandae suscipit odio et architecto.', null, '0', '0', null, '2017-11-28 16:30:16', '2017-11-28 16:30:16');
INSERT INTO `categories` VALUES ('2', 'Electronics', 'electronics', 'best electronics deal you can find in town in right here', 'categories/kwkpge0KPvgWg9aFIqcfEn8kY.png', '0', '0', null, '2017-11-28 16:30:16', '2018-03-04 05:56:59');
INSERT INTO `categories` VALUES ('3', 'Household', 'household', 'Household items for the entire family', 'categories/4vxhfKjSXDuOXZucbidbAUOXZ.png', '0', '0', null, '2017-11-28 16:30:16', '2017-12-09 22:49:18');
INSERT INTO `categories` VALUES ('4', 'New Arrivals', 'new-arrivals', 'This where you find the newest product in town', 'categories/IgBNz8d2lrHVIwL3OpvOYNJJR.png', '1', '0', null, '2017-11-28 16:30:16', '2018-04-07 22:22:47');
INSERT INTO `categories` VALUES ('5', 'Shoes', 'shoes', 'Shoes for both gentlemen and ladies', 'categories/ttijHD17bBnXBcGbyxYRGaTWQ.png', '1', '1', null, '2017-11-28 16:30:16', '2018-04-06 22:59:19');
INSERT INTO `categories` VALUES ('6', 'Men', 'men', 'Men clothing, Shoes, Bets, Cap etc', 'categories/bOb1hBw9BJNfDoeWaCamoJs8P.png', '1', '1', null, '2017-11-28 16:30:16', '2018-03-21 18:59:40');
INSERT INTO `categories` VALUES ('9', 'JudahBoutique', 'judahboutique', 'Female wears', 'categories/1FFUs3LpLf4685B5rCbWsRti7.png', '0', '0', null, '2017-12-03 10:09:09', '2017-12-09 22:42:56');
INSERT INTO `categories` VALUES ('10', 'JehovahNisi Boutique', 'jehovahnisi-boutique', 'Female Wears', 'categories/vYuMnwIo8aXMHcg7am2PEShos.png', '0', '0', null, '2017-12-03 10:10:20', '2017-12-09 22:42:32');
INSERT INTO `categories` VALUES ('11', 'Features', 'features', 'Other categories', 'categories/VzN4kqQpjwKFIfFmwqmvkVXL8.png', '1', '0', null, '2018-02-03 05:10:36', '2018-04-07 22:22:29');
INSERT INTO `categories` VALUES ('12', 'Ladies', 'ladies', 'Ladies clothing\'s, Shoes, Beads etc', 'categories/PLnT6O8hSfCBn3bfdWqtDabBY.png', '1', '1', null, '2018-03-04 03:04:13', '2018-04-06 22:12:03');
INSERT INTO `categories` VALUES ('16', 'Children', 'children', 'Best gift for your children', 'categories/Gl3TPyTyvE54c7lxYMcbb3sov.png', '1', '1', null, '2018-03-04 08:03:34', '2018-03-07 02:15:48');
INSERT INTO `categories` VALUES ('17', 'Phones', 'phones', 'Phones, tablets, smart watches', 'categories/Cl6445EBPsJHTd2kOY4ngB3S7.png', '1', '1', null, '2018-03-07 07:09:13', '2018-03-07 07:09:13');
INSERT INTO `categories` VALUES ('18', 'Bedroom', 'bedroom', 'Bed sheet, Duvet, Pillow Case', 'categories/tPtHgYBGEhnmx1bmXfb6ae9xK.png', '1', '0', null, '2018-04-03 21:32:53', '2018-04-03 21:39:04');

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES ('79', '12', '42');
INSERT INTO `category_product` VALUES ('80', '12', '43');
INSERT INTO `category_product` VALUES ('81', '12', '45');
INSERT INTO `category_product` VALUES ('82', '12', '44');
INSERT INTO `category_product` VALUES ('88', '12', '46');
INSERT INTO `category_product` VALUES ('94', '5', '47');
INSERT INTO `category_product` VALUES ('98', '12', '49');
INSERT INTO `category_product` VALUES ('100', '12', '50');
INSERT INTO `category_product` VALUES ('102', '12', '51');
INSERT INTO `category_product` VALUES ('103', '12', '52');
INSERT INTO `category_product` VALUES ('104', '12', '53');
INSERT INTO `category_product` VALUES ('106', '5', '54');
INSERT INTO `category_product` VALUES ('107', '5', '55');
INSERT INTO `category_product` VALUES ('108', '5', '56');
INSERT INTO `category_product` VALUES ('113', '17', '60');
INSERT INTO `category_product` VALUES ('114', '17', '61');
INSERT INTO `category_product` VALUES ('115', '17', '62');
INSERT INTO `category_product` VALUES ('116', '17', '63');
INSERT INTO `category_product` VALUES ('117', '6', '64');
INSERT INTO `category_product` VALUES ('118', '6', '65');
INSERT INTO `category_product` VALUES ('120', '6', '67');
INSERT INTO `category_product` VALUES ('121', '6', '66');
INSERT INTO `category_product` VALUES ('122', '5', '68');
INSERT INTO `category_product` VALUES ('124', '5', '70');
INSERT INTO `category_product` VALUES ('125', '5', '71');
INSERT INTO `category_product` VALUES ('126', '5', '72');
INSERT INTO `category_product` VALUES ('127', '5', '73');
INSERT INTO `category_product` VALUES ('128', '5', '74');
INSERT INTO `category_product` VALUES ('129', '5', '75');
INSERT INTO `category_product` VALUES ('130', '6', '76');
INSERT INTO `category_product` VALUES ('132', '17', '79');
INSERT INTO `category_product` VALUES ('133', '17', '78');
INSERT INTO `category_product` VALUES ('134', '17', '80');
INSERT INTO `category_product` VALUES ('135', '17', '81');
INSERT INTO `category_product` VALUES ('136', '5', '82');
INSERT INTO `category_product` VALUES ('137', '5', '83');
INSERT INTO `category_product` VALUES ('138', '5', '84');
INSERT INTO `category_product` VALUES ('139', '5', '85');
INSERT INTO `category_product` VALUES ('140', '5', '86');
INSERT INTO `category_product` VALUES ('141', '5', '87');
INSERT INTO `category_product` VALUES ('142', '5', '88');
INSERT INTO `category_product` VALUES ('143', '5', '89');
INSERT INTO `category_product` VALUES ('144', '12', '90');
INSERT INTO `category_product` VALUES ('145', '12', '91');
INSERT INTO `category_product` VALUES ('155', '6', '92');
INSERT INTO `category_product` VALUES ('157', '11', '86');
INSERT INTO `category_product` VALUES ('158', '5', '93');
INSERT INTO `category_product` VALUES ('159', '5', '94');
INSERT INTO `category_product` VALUES ('160', '5', '95');
INSERT INTO `category_product` VALUES ('161', '5', '96');
INSERT INTO `category_product` VALUES ('163', '5', '99');
INSERT INTO `category_product` VALUES ('164', '5', '101');
INSERT INTO `category_product` VALUES ('165', '1', '98');
INSERT INTO `category_product` VALUES ('166', '5', '102');
INSERT INTO `category_product` VALUES ('167', '5', '103');
INSERT INTO `category_product` VALUES ('168', '5', '104');
INSERT INTO `category_product` VALUES ('169', '6', '104');
INSERT INTO `category_product` VALUES ('170', '6', '103');
INSERT INTO `category_product` VALUES ('171', '12', '105');
INSERT INTO `category_product` VALUES ('172', '5', '105');
INSERT INTO `category_product` VALUES ('176', '5', '92');
INSERT INTO `category_product` VALUES ('177', '6', '107');
INSERT INTO `category_product` VALUES ('178', '5', '107');
INSERT INTO `category_product` VALUES ('179', '6', '108');
INSERT INTO `category_product` VALUES ('180', '5', '108');
INSERT INTO `category_product` VALUES ('181', '6', '99');
INSERT INTO `category_product` VALUES ('182', '6', '100');
INSERT INTO `category_product` VALUES ('183', '5', '100');
INSERT INTO `category_product` VALUES ('184', '6', '109');
INSERT INTO `category_product` VALUES ('185', '5', '109');
INSERT INTO `category_product` VALUES ('186', '6', '110');
INSERT INTO `category_product` VALUES ('187', '5', '110');
INSERT INTO `category_product` VALUES ('188', '12', '111');
INSERT INTO `category_product` VALUES ('189', '5', '111');
INSERT INTO `category_product` VALUES ('190', '12', '112');
INSERT INTO `category_product` VALUES ('191', '5', '112');
INSERT INTO `category_product` VALUES ('192', '12', '113');
INSERT INTO `category_product` VALUES ('193', '5', '113');
INSERT INTO `category_product` VALUES ('194', '6', '114');
INSERT INTO `category_product` VALUES ('195', '5', '114');
INSERT INTO `category_product` VALUES ('196', '17', '115');
INSERT INTO `category_product` VALUES ('197', '17', '116');
INSERT INTO `category_product` VALUES ('198', '17', '117');
INSERT INTO `category_product` VALUES ('200', '17', '118');
INSERT INTO `category_product` VALUES ('201', '11', '116');
INSERT INTO `category_product` VALUES ('206', '11', '101');
INSERT INTO `category_product` VALUES ('211', '4', '92');
INSERT INTO `category_product` VALUES ('219', '5', '119');
INSERT INTO `category_product` VALUES ('220', '4', '119');
INSERT INTO `category_product` VALUES ('221', '5', '120');
INSERT INTO `category_product` VALUES ('222', '5', '121');
INSERT INTO `category_product` VALUES ('224', '5', '123');
INSERT INTO `category_product` VALUES ('226', '5', '125');
INSERT INTO `category_product` VALUES ('227', '5', '126');
INSERT INTO `category_product` VALUES ('228', '5', '127');
INSERT INTO `category_product` VALUES ('229', '4', '127');
INSERT INTO `category_product` VALUES ('231', '5', '128');
INSERT INTO `category_product` VALUES ('232', '4', '129');
INSERT INTO `category_product` VALUES ('233', '5', '129');
INSERT INTO `category_product` VALUES ('234', '5', '130');
INSERT INTO `category_product` VALUES ('235', '5', '131');
INSERT INTO `category_product` VALUES ('236', '5', '132');
INSERT INTO `category_product` VALUES ('238', '5', '133');
INSERT INTO `category_product` VALUES ('239', '5', '134');
INSERT INTO `category_product` VALUES ('240', '4', '135');
INSERT INTO `category_product` VALUES ('241', '5', '135');
INSERT INTO `category_product` VALUES ('242', '5', '136');
INSERT INTO `category_product` VALUES ('243', '4', '137');
INSERT INTO `category_product` VALUES ('244', '5', '137');
INSERT INTO `category_product` VALUES ('245', '5', '138');
INSERT INTO `category_product` VALUES ('248', '12', '139');
INSERT INTO `category_product` VALUES ('249', '12', '140');
INSERT INTO `category_product` VALUES ('250', '12', '141');
INSERT INTO `category_product` VALUES ('252', '12', '143');
INSERT INTO `category_product` VALUES ('253', '12', '144');
INSERT INTO `category_product` VALUES ('254', '12', '146');
INSERT INTO `category_product` VALUES ('255', '12', '147');
INSERT INTO `category_product` VALUES ('256', '11', '148');
INSERT INTO `category_product` VALUES ('257', '12', '148');
INSERT INTO `category_product` VALUES ('258', '5', '149');
INSERT INTO `category_product` VALUES ('259', '6', '150');
INSERT INTO `category_product` VALUES ('260', '5', '150');
INSERT INTO `category_product` VALUES ('261', '6', '149');
INSERT INTO `category_product` VALUES ('264', '6', '152');
INSERT INTO `category_product` VALUES ('265', '5', '152');
INSERT INTO `category_product` VALUES ('266', '11', '154');
INSERT INTO `category_product` VALUES ('267', '5', '154');
INSERT INTO `category_product` VALUES ('268', '6', '155');
INSERT INTO `category_product` VALUES ('269', '5', '155');
INSERT INTO `category_product` VALUES ('270', '6', '154');
INSERT INTO `category_product` VALUES ('271', '6', '156');
INSERT INTO `category_product` VALUES ('272', '5', '156');
INSERT INTO `category_product` VALUES ('273', '6', '157');
INSERT INTO `category_product` VALUES ('275', '5', '157');
INSERT INTO `category_product` VALUES ('276', '6', '158');
INSERT INTO `category_product` VALUES ('277', '5', '158');
INSERT INTO `category_product` VALUES ('278', '6', '159');
INSERT INTO `category_product` VALUES ('279', '5', '159');
INSERT INTO `category_product` VALUES ('281', '5', '160');
INSERT INTO `category_product` VALUES ('282', '6', '160');
INSERT INTO `category_product` VALUES ('283', '6', '161');
INSERT INTO `category_product` VALUES ('284', '5', '161');
INSERT INTO `category_product` VALUES ('285', '6', '162');
INSERT INTO `category_product` VALUES ('286', '5', '162');
INSERT INTO `category_product` VALUES ('287', '6', '163');
INSERT INTO `category_product` VALUES ('288', '5', '163');
INSERT INTO `category_product` VALUES ('289', '6', '165');
INSERT INTO `category_product` VALUES ('290', '5', '165');
INSERT INTO `category_product` VALUES ('291', '6', '164');
INSERT INTO `category_product` VALUES ('292', '5', '164');
INSERT INTO `category_product` VALUES ('293', '6', '168');
INSERT INTO `category_product` VALUES ('294', '5', '168');
INSERT INTO `category_product` VALUES ('295', '6', '169');
INSERT INTO `category_product` VALUES ('296', '5', '169');
INSERT INTO `category_product` VALUES ('297', '6', '151');
INSERT INTO `category_product` VALUES ('298', '5', '151');
INSERT INTO `category_product` VALUES ('299', '6', '170');
INSERT INTO `category_product` VALUES ('300', '5', '170');
INSERT INTO `category_product` VALUES ('303', '11', '170');
INSERT INTO `category_product` VALUES ('322', '11', '43');
INSERT INTO `category_product` VALUES ('326', '4', '138');
INSERT INTO `category_product` VALUES ('329', '17', '172');
INSERT INTO `category_product` VALUES ('330', '4', '172');
INSERT INTO `category_product` VALUES ('331', '12', '173');
INSERT INTO `category_product` VALUES ('332', '12', '174');
INSERT INTO `category_product` VALUES ('333', '12', '175');
INSERT INTO `category_product` VALUES ('334', '12', '176');
INSERT INTO `category_product` VALUES ('335', '12', '177');
INSERT INTO `category_product` VALUES ('336', '12', '178');
INSERT INTO `category_product` VALUES ('337', '11', '178');
INSERT INTO `category_product` VALUES ('341', '6', '179');
INSERT INTO `category_product` VALUES ('342', '5', '179');
INSERT INTO `category_product` VALUES ('343', '6', '180');
INSERT INTO `category_product` VALUES ('344', '5', '180');
INSERT INTO `category_product` VALUES ('345', '6', '181');
INSERT INTO `category_product` VALUES ('346', '5', '181');
INSERT INTO `category_product` VALUES ('347', '6', '182');
INSERT INTO `category_product` VALUES ('348', '5', '182');
INSERT INTO `category_product` VALUES ('350', '6', '183');
INSERT INTO `category_product` VALUES ('352', '5', '183');
INSERT INTO `category_product` VALUES ('353', '6', '184');
INSERT INTO `category_product` VALUES ('354', '5', '184');
INSERT INTO `category_product` VALUES ('355', '6', '185');
INSERT INTO `category_product` VALUES ('356', '5', '185');
INSERT INTO `category_product` VALUES ('357', '6', '186');
INSERT INTO `category_product` VALUES ('358', '5', '186');
INSERT INTO `category_product` VALUES ('359', '6', '187');
INSERT INTO `category_product` VALUES ('360', '5', '187');
INSERT INTO `category_product` VALUES ('362', '4', '49');
INSERT INTO `category_product` VALUES ('363', '6', '188');
INSERT INTO `category_product` VALUES ('364', '5', '188');
INSERT INTO `category_product` VALUES ('365', '6', '189');
INSERT INTO `category_product` VALUES ('366', '5', '189');
INSERT INTO `category_product` VALUES ('367', '6', '190');
INSERT INTO `category_product` VALUES ('368', '5', '190');
INSERT INTO `category_product` VALUES ('369', '6', '191');
INSERT INTO `category_product` VALUES ('370', '5', '191');
INSERT INTO `category_product` VALUES ('371', '6', '192');
INSERT INTO `category_product` VALUES ('372', '5', '192');
INSERT INTO `category_product` VALUES ('373', '6', '193');
INSERT INTO `category_product` VALUES ('374', '5', '193');
INSERT INTO `category_product` VALUES ('375', '6', '194');
INSERT INTO `category_product` VALUES ('376', '5', '194');
INSERT INTO `category_product` VALUES ('377', '6', '195');
INSERT INTO `category_product` VALUES ('378', '5', '195');
INSERT INTO `category_product` VALUES ('379', '6', '196');
INSERT INTO `category_product` VALUES ('380', '5', '196');
INSERT INTO `category_product` VALUES ('382', '4', '196');
INSERT INTO `category_product` VALUES ('383', '6', '128');
INSERT INTO `category_product` VALUES ('384', '6', '197');
INSERT INTO `category_product` VALUES ('385', '5', '197');
INSERT INTO `category_product` VALUES ('386', '6', '199');
INSERT INTO `category_product` VALUES ('387', '5', '199');
INSERT INTO `category_product` VALUES ('388', '6', '200');
INSERT INTO `category_product` VALUES ('389', '5', '200');
INSERT INTO `category_product` VALUES ('390', '6', '201');
INSERT INTO `category_product` VALUES ('391', '5', '201');
INSERT INTO `category_product` VALUES ('392', '6', '202');
INSERT INTO `category_product` VALUES ('393', '5', '202');
INSERT INTO `category_product` VALUES ('394', '6', '203');
INSERT INTO `category_product` VALUES ('395', '5', '203');
INSERT INTO `category_product` VALUES ('396', '6', '204');
INSERT INTO `category_product` VALUES ('397', '5', '204');
INSERT INTO `category_product` VALUES ('398', '6', '205');
INSERT INTO `category_product` VALUES ('399', '5', '205');
INSERT INTO `category_product` VALUES ('400', '6', '206');
INSERT INTO `category_product` VALUES ('401', '5', '206');
INSERT INTO `category_product` VALUES ('402', '6', '208');
INSERT INTO `category_product` VALUES ('403', '5', '208');
INSERT INTO `category_product` VALUES ('404', '6', '209');
INSERT INTO `category_product` VALUES ('405', '5', '209');
INSERT INTO `category_product` VALUES ('407', '6', '210');
INSERT INTO `category_product` VALUES ('408', '5', '210');
INSERT INTO `category_product` VALUES ('409', '6', '211');
INSERT INTO `category_product` VALUES ('410', '5', '211');
INSERT INTO `category_product` VALUES ('411', '6', '212');
INSERT INTO `category_product` VALUES ('412', '5', '212');
INSERT INTO `category_product` VALUES ('413', '6', '213');
INSERT INTO `category_product` VALUES ('414', '5', '213');
INSERT INTO `category_product` VALUES ('415', '6', '214');
INSERT INTO `category_product` VALUES ('416', '5', '214');
INSERT INTO `category_product` VALUES ('417', '6', '215');
INSERT INTO `category_product` VALUES ('418', '5', '215');
INSERT INTO `category_product` VALUES ('419', '6', '216');
INSERT INTO `category_product` VALUES ('420', '5', '216');
INSERT INTO `category_product` VALUES ('421', '4', '216');
INSERT INTO `category_product` VALUES ('422', '6', '217');
INSERT INTO `category_product` VALUES ('423', '5', '217');
INSERT INTO `category_product` VALUES ('424', '6', '218');
INSERT INTO `category_product` VALUES ('425', '5', '218');
INSERT INTO `category_product` VALUES ('426', '6', '219');
INSERT INTO `category_product` VALUES ('427', '5', '219');
INSERT INTO `category_product` VALUES ('428', '6', '220');
INSERT INTO `category_product` VALUES ('429', '5', '220');
INSERT INTO `category_product` VALUES ('430', '6', '221');
INSERT INTO `category_product` VALUES ('431', '5', '221');
INSERT INTO `category_product` VALUES ('432', '6', '222');
INSERT INTO `category_product` VALUES ('433', '5', '222');
INSERT INTO `category_product` VALUES ('434', '6', '223');
INSERT INTO `category_product` VALUES ('435', '5', '223');
INSERT INTO `category_product` VALUES ('436', '6', '224');
INSERT INTO `category_product` VALUES ('437', '5', '224');
INSERT INTO `category_product` VALUES ('438', '6', '225');
INSERT INTO `category_product` VALUES ('439', '5', '225');
INSERT INTO `category_product` VALUES ('440', '4', '225');
INSERT INTO `category_product` VALUES ('441', '6', '226');
INSERT INTO `category_product` VALUES ('442', '5', '226');
INSERT INTO `category_product` VALUES ('443', '6', '227');
INSERT INTO `category_product` VALUES ('444', '5', '227');
INSERT INTO `category_product` VALUES ('446', '6', '228');
INSERT INTO `category_product` VALUES ('447', '5', '228');
INSERT INTO `category_product` VALUES ('449', '6', '229');
INSERT INTO `category_product` VALUES ('450', '5', '229');
INSERT INTO `category_product` VALUES ('451', '6', '230');
INSERT INTO `category_product` VALUES ('452', '5', '230');
INSERT INTO `category_product` VALUES ('453', '4', '230');
INSERT INTO `category_product` VALUES ('454', '6', '231');
INSERT INTO `category_product` VALUES ('455', '5', '231');
INSERT INTO `category_product` VALUES ('456', '4', '231');
INSERT INTO `category_product` VALUES ('457', '6', '232');
INSERT INTO `category_product` VALUES ('458', '5', '232');
INSERT INTO `category_product` VALUES ('459', '12', '233');
INSERT INTO `category_product` VALUES ('460', '5', '233');
INSERT INTO `category_product` VALUES ('461', '4', '233');
INSERT INTO `category_product` VALUES ('462', '6', '234');
INSERT INTO `category_product` VALUES ('463', '5', '234');
INSERT INTO `category_product` VALUES ('464', '6', '235');
INSERT INTO `category_product` VALUES ('465', '5', '235');
INSERT INTO `category_product` VALUES ('466', '6', '236');
INSERT INTO `category_product` VALUES ('467', '5', '236');
INSERT INTO `category_product` VALUES ('468', '6', '237');
INSERT INTO `category_product` VALUES ('469', '5', '237');
INSERT INTO `category_product` VALUES ('470', '6', '238');
INSERT INTO `category_product` VALUES ('471', '5', '238');
INSERT INTO `category_product` VALUES ('472', '6', '239');
INSERT INTO `category_product` VALUES ('473', '5', '239');
INSERT INTO `category_product` VALUES ('474', '6', '240');
INSERT INTO `category_product` VALUES ('475', '5', '240');
INSERT INTO `category_product` VALUES ('476', '6', '241');
INSERT INTO `category_product` VALUES ('477', '5', '241');
INSERT INTO `category_product` VALUES ('478', '4', '241');
INSERT INTO `category_product` VALUES ('479', '6', '242');
INSERT INTO `category_product` VALUES ('480', '5', '242');
INSERT INTO `category_product` VALUES ('481', '6', '243');
INSERT INTO `category_product` VALUES ('482', '5', '243');
INSERT INTO `category_product` VALUES ('484', '6', '244');
INSERT INTO `category_product` VALUES ('485', '5', '244');
INSERT INTO `category_product` VALUES ('486', '6', '245');
INSERT INTO `category_product` VALUES ('487', '5', '245');
INSERT INTO `category_product` VALUES ('488', '6', '246');
INSERT INTO `category_product` VALUES ('489', '5', '246');
INSERT INTO `category_product` VALUES ('490', '6', '247');
INSERT INTO `category_product` VALUES ('491', '5', '247');
INSERT INTO `category_product` VALUES ('492', '6', '248');
INSERT INTO `category_product` VALUES ('493', '5', '248');
INSERT INTO `category_product` VALUES ('494', '6', '249');
INSERT INTO `category_product` VALUES ('495', '5', '249');
INSERT INTO `category_product` VALUES ('496', '11', '249');
INSERT INTO `category_product` VALUES ('497', '6', '250');
INSERT INTO `category_product` VALUES ('498', '5', '250');
INSERT INTO `category_product` VALUES ('499', '6', '251');
INSERT INTO `category_product` VALUES ('500', '5', '251');
INSERT INTO `category_product` VALUES ('501', '6', '252');
INSERT INTO `category_product` VALUES ('502', '5', '252');
INSERT INTO `category_product` VALUES ('503', '6', '253');
INSERT INTO `category_product` VALUES ('504', '5', '253');
INSERT INTO `category_product` VALUES ('505', '6', '254');
INSERT INTO `category_product` VALUES ('506', '5', '254');
INSERT INTO `category_product` VALUES ('507', '6', '255');
INSERT INTO `category_product` VALUES ('508', '5', '255');
INSERT INTO `category_product` VALUES ('509', '6', '256');
INSERT INTO `category_product` VALUES ('510', '5', '256');
INSERT INTO `category_product` VALUES ('511', '6', '257');
INSERT INTO `category_product` VALUES ('512', '5', '257');
INSERT INTO `category_product` VALUES ('513', '6', '258');
INSERT INTO `category_product` VALUES ('514', '5', '258');
INSERT INTO `category_product` VALUES ('516', '5', '259');
INSERT INTO `category_product` VALUES ('517', '12', '259');
INSERT INTO `category_product` VALUES ('518', '6', '260');
INSERT INTO `category_product` VALUES ('519', '5', '260');
INSERT INTO `category_product` VALUES ('520', '6', '261');
INSERT INTO `category_product` VALUES ('521', '5', '261');
INSERT INTO `category_product` VALUES ('522', '12', '262');
INSERT INTO `category_product` VALUES ('523', '12', '263');
INSERT INTO `category_product` VALUES ('524', '12', '264');
INSERT INTO `category_product` VALUES ('525', '12', '265');
INSERT INTO `category_product` VALUES ('526', '12', '266');
INSERT INTO `category_product` VALUES ('528', '12', '267');
INSERT INTO `category_product` VALUES ('529', '12', '268');
INSERT INTO `category_product` VALUES ('530', '12', '269');
INSERT INTO `category_product` VALUES ('532', '12', '270');
INSERT INTO `category_product` VALUES ('533', '11', '270');
INSERT INTO `category_product` VALUES ('535', '12', '271');
INSERT INTO `category_product` VALUES ('536', '12', '272');
INSERT INTO `category_product` VALUES ('537', '12', '273');
INSERT INTO `category_product` VALUES ('539', '12', '274');
INSERT INTO `category_product` VALUES ('540', '12', '275');
INSERT INTO `category_product` VALUES ('542', '12', '276');
INSERT INTO `category_product` VALUES ('544', '12', '277');
INSERT INTO `category_product` VALUES ('545', '12', '278');
INSERT INTO `category_product` VALUES ('546', '11', '279');
INSERT INTO `category_product` VALUES ('547', '12', '279');
INSERT INTO `category_product` VALUES ('548', '11', '280');
INSERT INTO `category_product` VALUES ('549', '12', '280');
INSERT INTO `category_product` VALUES ('550', '12', '281');
INSERT INTO `category_product` VALUES ('551', '5', '281');
INSERT INTO `category_product` VALUES ('552', '6', '282');
INSERT INTO `category_product` VALUES ('553', '5', '282');
INSERT INTO `category_product` VALUES ('554', '6', '283');
INSERT INTO `category_product` VALUES ('555', '5', '283');
INSERT INTO `category_product` VALUES ('556', '6', '284');
INSERT INTO `category_product` VALUES ('557', '5', '284');
INSERT INTO `category_product` VALUES ('558', '6', '285');
INSERT INTO `category_product` VALUES ('559', '5', '285');
INSERT INTO `category_product` VALUES ('560', '11', '285');
INSERT INTO `category_product` VALUES ('561', '18', '286');
INSERT INTO `category_product` VALUES ('563', '18', '287');
INSERT INTO `category_product` VALUES ('564', '18', '288');
INSERT INTO `category_product` VALUES ('565', '12', '289');
INSERT INTO `category_product` VALUES ('567', '12', '290');
INSERT INTO `category_product` VALUES ('569', '12', '291');
INSERT INTO `category_product` VALUES ('570', '12', '292');
INSERT INTO `category_product` VALUES ('571', '12', '293');
INSERT INTO `category_product` VALUES ('572', '12', '294');
INSERT INTO `category_product` VALUES ('573', '12', '295');
INSERT INTO `category_product` VALUES ('574', '12', '296');
INSERT INTO `category_product` VALUES ('577', '12', '309');
INSERT INTO `category_product` VALUES ('578', '12', '308');
INSERT INTO `category_product` VALUES ('579', '12', '307');
INSERT INTO `category_product` VALUES ('581', '12', '306');
INSERT INTO `category_product` VALUES ('584', '12', '299');
INSERT INTO `category_product` VALUES ('586', '12', '298');
INSERT INTO `category_product` VALUES ('587', '12', '305');
INSERT INTO `category_product` VALUES ('588', '12', '304');
INSERT INTO `category_product` VALUES ('589', '12', '302');
INSERT INTO `category_product` VALUES ('590', '12', '301');
INSERT INTO `category_product` VALUES ('591', '12', '297');
INSERT INTO `category_product` VALUES ('592', '12', '300');
INSERT INTO `category_product` VALUES ('593', '12', '310');
INSERT INTO `category_product` VALUES ('594', '12', '312');
INSERT INTO `category_product` VALUES ('595', '12', '311');
INSERT INTO `category_product` VALUES ('596', '12', '303');
INSERT INTO `category_product` VALUES ('597', '12', '313');
INSERT INTO `category_product` VALUES ('598', '12', '314');
INSERT INTO `category_product` VALUES ('599', '12', '315');
INSERT INTO `category_product` VALUES ('600', '12', '316');
INSERT INTO `category_product` VALUES ('601', '12', '317');
INSERT INTO `category_product` VALUES ('603', '11', '316');
INSERT INTO `category_product` VALUES ('604', '12', '320');
INSERT INTO `category_product` VALUES ('607', '4', '182');
INSERT INTO `category_product` VALUES ('609', '12', '321');
INSERT INTO `category_product` VALUES ('610', '12', '322');
INSERT INTO `category_product` VALUES ('611', '12', '323');
INSERT INTO `category_product` VALUES ('612', '12', '324');
INSERT INTO `category_product` VALUES ('614', '12', '325');
INSERT INTO `category_product` VALUES ('615', '12', '326');
INSERT INTO `category_product` VALUES ('616', '12', '327');
INSERT INTO `category_product` VALUES ('617', '12', '328');
INSERT INTO `category_product` VALUES ('618', '12', '329');
INSERT INTO `category_product` VALUES ('619', '12', '330');
INSERT INTO `category_product` VALUES ('620', '12', '331');
INSERT INTO `category_product` VALUES ('621', '12', '332');
INSERT INTO `category_product` VALUES ('625', '17', '336');
INSERT INTO `category_product` VALUES ('626', '17', '337');
INSERT INTO `category_product` VALUES ('627', '16', '338');
INSERT INTO `category_product` VALUES ('628', '16', '339');
INSERT INTO `category_product` VALUES ('629', '16', '340');
INSERT INTO `category_product` VALUES ('632', '16', '341');
INSERT INTO `category_product` VALUES ('635', '16', '342');
INSERT INTO `category_product` VALUES ('636', '16', '343');
INSERT INTO `category_product` VALUES ('637', '11', '343');
INSERT INTO `category_product` VALUES ('639', '16', '344');
INSERT INTO `category_product` VALUES ('640', '16', '345');
INSERT INTO `category_product` VALUES ('641', '16', '346');
INSERT INTO `category_product` VALUES ('642', '16', '347');
INSERT INTO `category_product` VALUES ('643', '16', '348');
INSERT INTO `category_product` VALUES ('644', '16', '349');
INSERT INTO `category_product` VALUES ('645', '16', '350');
INSERT INTO `category_product` VALUES ('647', '5', '350');
INSERT INTO `category_product` VALUES ('648', '5', '349');
INSERT INTO `category_product` VALUES ('649', '16', '351');
INSERT INTO `category_product` VALUES ('650', '16', '352');
INSERT INTO `category_product` VALUES ('651', '16', '353');
INSERT INTO `category_product` VALUES ('652', '16', '354');
INSERT INTO `category_product` VALUES ('653', '16', '355');
INSERT INTO `category_product` VALUES ('654', '16', '356');
INSERT INTO `category_product` VALUES ('655', '16', '357');
INSERT INTO `category_product` VALUES ('656', '16', '358');
INSERT INTO `category_product` VALUES ('657', '16', '359');
INSERT INTO `category_product` VALUES ('658', '16', '360');
INSERT INTO `category_product` VALUES ('659', '16', '361');
INSERT INTO `category_product` VALUES ('660', '16', '362');
INSERT INTO `category_product` VALUES ('661', '16', '363');
INSERT INTO `category_product` VALUES ('664', '11', '359');
INSERT INTO `category_product` VALUES ('665', '16', '364');
INSERT INTO `category_product` VALUES ('667', '16', '365');
INSERT INTO `category_product` VALUES ('668', '16', '366');
INSERT INTO `category_product` VALUES ('670', '16', '367');
INSERT INTO `category_product` VALUES ('671', '16', '368');
INSERT INTO `category_product` VALUES ('672', '16', '369');
INSERT INTO `category_product` VALUES ('673', '16', '370');
INSERT INTO `category_product` VALUES ('674', '16', '371');
INSERT INTO `category_product` VALUES ('675', '16', '372');
INSERT INTO `category_product` VALUES ('676', '16', '373');
INSERT INTO `category_product` VALUES ('677', '16', '374');
INSERT INTO `category_product` VALUES ('678', '16', '375');
INSERT INTO `category_product` VALUES ('679', '16', '376');
INSERT INTO `category_product` VALUES ('680', '16', '377');
INSERT INTO `category_product` VALUES ('681', '16', '378');
INSERT INTO `category_product` VALUES ('682', '16', '379');
INSERT INTO `category_product` VALUES ('683', '16', '380');
INSERT INTO `category_product` VALUES ('684', '16', '381');
INSERT INTO `category_product` VALUES ('685', '16', '382');
INSERT INTO `category_product` VALUES ('686', '16', '383');
INSERT INTO `category_product` VALUES ('687', '16', '384');
INSERT INTO `category_product` VALUES ('688', '16', '385');
INSERT INTO `category_product` VALUES ('689', '16', '386');
INSERT INTO `category_product` VALUES ('690', '16', '387');
INSERT INTO `category_product` VALUES ('691', '16', '388');
INSERT INTO `category_product` VALUES ('692', '16', '389');
INSERT INTO `category_product` VALUES ('693', '16', '390');
INSERT INTO `category_product` VALUES ('694', '4', '141');
INSERT INTO `category_product` VALUES ('704', '4', '67');
INSERT INTO `category_product` VALUES ('707', '4', '381');
INSERT INTO `category_product` VALUES ('709', '4', '384');
INSERT INTO `category_product` VALUES ('710', '11', '366');
INSERT INTO `category_product` VALUES ('712', '4', '268');
INSERT INTO `category_product` VALUES ('713', '12', '391');
INSERT INTO `category_product` VALUES ('714', '4', '391');
INSERT INTO `category_product` VALUES ('715', '12', '392');
INSERT INTO `category_product` VALUES ('716', '11', '392');
INSERT INTO `category_product` VALUES ('717', '12', '393');
INSERT INTO `category_product` VALUES ('718', '12', '394');
INSERT INTO `category_product` VALUES ('719', '12', '395');
INSERT INTO `category_product` VALUES ('720', '12', '396');
INSERT INTO `category_product` VALUES ('721', '4', '396');
INSERT INTO `category_product` VALUES ('722', '4', '273');
INSERT INTO `category_product` VALUES ('723', '4', '290');
INSERT INTO `category_product` VALUES ('724', '4', '298');
INSERT INTO `category_product` VALUES ('725', '4', '341');
INSERT INTO `category_product` VALUES ('726', '4', '347');
INSERT INTO `category_product` VALUES ('727', '4', '345');
INSERT INTO `category_product` VALUES ('728', '4', '346');
INSERT INTO `category_product` VALUES ('729', '12', '397');
INSERT INTO `category_product` VALUES ('730', '12', '398');
INSERT INTO `category_product` VALUES ('731', '11', '261');
INSERT INTO `category_product` VALUES ('732', '11', '131');
INSERT INTO `category_product` VALUES ('736', '11', '349');
INSERT INTO `category_product` VALUES ('737', '11', '332');
INSERT INTO `category_product` VALUES ('738', '11', '340');
INSERT INTO `category_product` VALUES ('740', '11', '295');
INSERT INTO `category_product` VALUES ('741', '11', '371');
INSERT INTO `category_product` VALUES ('743', '11', '354');
INSERT INTO `category_product` VALUES ('744', '11', '287');
INSERT INTO `category_product` VALUES ('745', '11', '263');
INSERT INTO `category_product` VALUES ('746', '12', '399');
INSERT INTO `category_product` VALUES ('747', '12', '400');
INSERT INTO `category_product` VALUES ('748', '12', '401');
INSERT INTO `category_product` VALUES ('749', '12', '402');
INSERT INTO `category_product` VALUES ('750', '12', '403');
INSERT INTO `category_product` VALUES ('751', '12', '404');
INSERT INTO `category_product` VALUES ('752', '12', '405');
INSERT INTO `category_product` VALUES ('753', '12', '406');
INSERT INTO `category_product` VALUES ('754', '12', '407');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', 'Ikeja', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('2', 'Alimosho', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('3', 'Ajeromi-Ifelodun', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('4', '	Kosofe', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('5', '	Mushin', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('6', 'Oshodi-Isolo', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('7', '	Ojo', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('8', '	Ikorodu', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('9', '	Surulere', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('10', '	Agege', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('11', '	Ifako-Ijaiye', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('12', '	Shomolu', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('13', '	Amuwo-Odofin', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('14', 'Lagos Mainland	', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('15', '	Eti-Osa', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('16', '	Badagry', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('17', '	Apapa', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('18', '	Lagos Island', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('19', '	Epe', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `cities` VALUES ('20', '	Ibeju-Lekki', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` int(11) DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'AFGHANISTAN', 'AF', 'AFG', '4', '93', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('2', 'ALBANIA', 'AL', 'ALB', '8', '355', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('3', 'ALGERIA', 'DZ', 'DZA', '12', '213', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('4', 'AMERICAN SAMOA', 'AS', 'ASM', '16', '1684', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('5', 'ANDORRA', 'AD', 'AND', '20', '376', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('6', 'ANGOLA', 'AO', 'AGO', '24', '244', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('7', 'ANGUILLA', 'AI', 'AIA', '660', '1264', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('8', 'ANTARCTICA', 'AQ', null, null, '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('9', 'ANTIGUA AND BARBUDA', 'AG', 'ATG', '28', '1268', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('10', 'ARGENTINA', 'AR', 'ARG', '32', '54', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('11', 'ARMENIA', 'AM', 'ARM', '51', '374', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('12', 'ARUBA', 'AW', 'ABW', '533', '297', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('13', 'AUSTRALIA', 'AU', 'AUS', '36', '61', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('14', 'AUSTRIA', 'AT', 'AUT', '40', '43', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('15', 'AZERBAIJAN', 'AZ', 'AZE', '31', '994', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('16', 'BAHAMAS', 'BS', 'BHS', '44', '1242', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('17', 'BAHRAIN', 'BH', 'BHR', '48', '973', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('18', 'BANGLADESH', 'BD', 'BGD', '50', '880', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('19', 'BARBADOS', 'BB', 'BRB', '52', '1246', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('20', 'BELARUS', 'BY', 'BLR', '112', '375', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('21', 'BELGIUM', 'BE', 'BEL', '56', '32', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('22', 'BELIZE', 'BZ', 'BLZ', '84', '501', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('23', 'BENIN', 'BJ', 'BEN', '204', '229', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('24', 'BERMUDA', 'BM', 'BMU', '60', '1441', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('25', 'BHUTAN', 'BT', 'BTN', '64', '975', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('26', 'BOLIVIA', 'BO', 'BOL', '68', '591', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('27', 'BOSNIA AND HERZEGOVINA', 'BA', 'BIH', '70', '387', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('28', 'BOTSWANA', 'BW', 'BWA', '72', '267', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('29', 'BOUVET ISLAND', 'BV', null, null, '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('30', 'BRAZIL', 'BR', 'BRA', '76', '55', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('31', 'BRITISH INDIAN OCEAN TERRITORY', 'IO', null, null, '246', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('32', 'BRUNEI DARUSSALAM', 'BN', 'BRN', '96', '673', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('33', 'BULGARIA', 'BG', 'BGR', '100', '359', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('34', 'BURKINA FASO', 'BF', 'BFA', '854', '226', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('35', 'BURUNDI', 'BI', 'BDI', '108', '257', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('36', 'CAMBODIA', 'KH', 'KHM', '116', '855', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('37', 'CAMEROON', 'CM', 'CMR', '120', '237', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('38', 'CANADA', 'CA', 'CAN', '124', '1', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('39', 'CAPE VERDE', 'CV', 'CPV', '132', '238', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('40', 'CAYMAN ISLANDS', 'KY', 'CYM', '136', '1345', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('41', 'CENTRAL AFRICAN REPUBLIC', 'CF', 'CAF', '140', '236', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('42', 'CHAD', 'TD', 'TCD', '148', '235', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('43', 'CHILE', 'CL', 'CHL', '152', '56', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('44', 'CHINA', 'CN', 'CHN', '156', '86', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('45', 'CHRISTMAS ISLAND', 'CX', null, null, '61', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('46', 'COCOS (KEELING) ISLANDS', 'CC', null, null, '672', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('47', 'COLOMBIA', 'CO', 'COL', '170', '57', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('48', 'COMOROS', 'KM', 'COM', '174', '269', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('49', 'CONGO', 'CG', 'COG', '178', '242', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('50', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', 'COD', '180', '242', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('51', 'COOK ISLANDS', 'CK', 'COK', '184', '682', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('52', 'COSTA RICA', 'CR', 'CRI', '188', '506', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('53', 'COTE D\'IVOIRE', 'CI', 'CIV', '384', '225', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('54', 'CROATIA', 'HR', 'HRV', '191', '385', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('55', 'CUBA', 'CU', 'CUB', '192', '53', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('56', 'CYPRUS', 'CY', 'CYP', '196', '357', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('57', 'CZECH REPUBLIC', 'CZ', 'CZE', '203', '420', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('58', 'DENMARK', 'DK', 'DNK', '208', '45', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('59', 'DJIBOUTI', 'DJ', 'DJI', '262', '253', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('60', 'DOMINICA', 'DM', 'DMA', '212', '1767', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('61', 'DOMINICAN REPUBLIC', 'DO', 'DOM', '214', '1809', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('62', 'ECUADOR', 'EC', 'ECU', '218', '593', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('63', 'EGYPT', 'EG', 'EGY', '818', '20', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('64', 'EL SALVADOR', 'SV', 'SLV', '222', '503', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('65', 'EQUATORIAL GUINEA', 'GQ', 'GNQ', '226', '240', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('66', 'ERITREA', 'ER', 'ERI', '232', '291', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('67', 'ESTONIA', 'EE', 'EST', '233', '372', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('68', 'ETHIOPIA', 'ET', 'ETH', '231', '251', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('69', 'FALKLAND ISLANDS (MALVINAS)', 'FK', 'FLK', '238', '500', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('70', 'FAROE ISLANDS', 'FO', 'FRO', '234', '298', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('71', 'FIJI', 'FJ', 'FJI', '242', '679', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('72', 'FINLAND', 'FI', 'FIN', '246', '358', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('73', 'FRANCE', 'FR', 'FRA', '250', '33', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('74', 'FRENCH GUIANA', 'GF', 'GUF', '254', '594', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('75', 'FRENCH POLYNESIA', 'PF', 'PYF', '258', '689', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('76', 'FRENCH SOUTHERN TERRITORIES', 'TF', null, null, '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('77', 'GABON', 'GA', 'GAB', '266', '241', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('78', 'GAMBIA', 'GM', 'GMB', '270', '220', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('79', 'GEORGIA', 'GE', 'GEO', '268', '995', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('80', 'GERMANY', 'DE', 'DEU', '276', '49', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('81', 'GHANA', 'GH', 'GHA', '288', '233', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('82', 'GIBRALTAR', 'GI', 'GIB', '292', '350', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('83', 'GREECE', 'GR', 'GRC', '300', '30', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('84', 'GREENLAND', 'GL', 'GRL', '304', '299', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('85', 'GRENADA', 'GD', 'GRD', '308', '1473', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('86', 'GUADELOUPE', 'GP', 'GLP', '312', '590', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('87', 'GUAM', 'GU', 'GUM', '316', '1671', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('88', 'GUATEMALA', 'GT', 'GTM', '320', '502', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('89', 'GUINEA', 'GN', 'GIN', '324', '224', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('90', 'GUINEA-BISSAU', 'GW', 'GNB', '624', '245', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('91', 'GUYANA', 'GY', 'GUY', '328', '592', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('92', 'HAITI', 'HT', 'HTI', '332', '509', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('93', 'HEARD ISLAND AND MCDONALD ISLANDS', 'HM', null, null, '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('94', 'HOLY SEE (VATICAN CITY STATE)', 'VA', 'VAT', '336', '39', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('95', 'HONDURAS', 'HN', 'HND', '340', '504', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('96', 'HONG KONG', 'HK', 'HKG', '344', '852', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('97', 'HUNGARY', 'HU', 'HUN', '348', '36', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('98', 'ICELAND', 'IS', 'ISL', '352', '354', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('99', 'INDIA', 'IN', 'IND', '356', '91', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('100', 'INDONESIA', 'ID', 'IDN', '360', '62', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('101', 'IRAN, ISLAMIC REPUBLIC OF', 'IR', 'IRN', '364', '98', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('102', 'IRAQ', 'IQ', 'IRQ', '368', '964', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('103', 'IRELAND', 'IE', 'IRL', '372', '353', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('104', 'ISRAEL', 'IL', 'ISR', '376', '972', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('105', 'ITALY', 'IT', 'ITA', '380', '39', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('106', 'JAMAICA', 'JM', 'JAM', '388', '1876', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('107', 'JAPAN', 'JP', 'JPN', '392', '81', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('108', 'JORDAN', 'JO', 'JOR', '400', '962', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('109', 'KAZAKHSTAN', 'KZ', 'KAZ', '398', '7', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('110', 'KENYA', 'KE', 'KEN', '404', '254', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('111', 'KIRIBATI', 'KI', 'KIR', '296', '686', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('112', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'KP', 'PRK', '408', '850', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('113', 'KOREA, REPUBLIC OF', 'KR', 'KOR', '410', '82', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('114', 'KUWAIT', 'KW', 'KWT', '414', '965', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('115', 'KYRGYZSTAN', 'KG', 'KGZ', '417', '996', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('116', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'LA', 'LAO', '418', '856', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('117', 'LATVIA', 'LV', 'LVA', '428', '371', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('118', 'LEBANON', 'LB', 'LBN', '422', '961', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('119', 'LESOTHO', 'LS', 'LSO', '426', '266', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('120', 'LIBERIA', 'LR', 'LBR', '430', '231', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('121', 'LIBYAN ARAB JAMAHIRIYA', 'LY', 'LBY', '434', '218', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('122', 'LIECHTENSTEIN', 'LI', 'LIE', '438', '423', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('123', 'LITHUANIA', 'LT', 'LTU', '440', '370', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('124', 'LUXEMBOURG', 'LU', 'LUX', '442', '352', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('125', 'MACAO', 'MO', 'MAC', '446', '853', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('126', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', 'MKD', '807', '389', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('127', 'MADAGASCAR', 'MG', 'MDG', '450', '261', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('128', 'MALAWI', 'MW', 'MWI', '454', '265', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('129', 'MALAYSIA', 'MY', 'MYS', '458', '60', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('130', 'MALDIVES', 'MV', 'MDV', '462', '960', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('131', 'MALI', 'ML', 'MLI', '466', '223', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('132', 'MALTA', 'MT', 'MLT', '470', '356', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('133', 'MARSHALL ISLANDS', 'MH', 'MHL', '584', '692', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('134', 'MARTINIQUE', 'MQ', 'MTQ', '474', '596', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('135', 'MAURITANIA', 'MR', 'MRT', '478', '222', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('136', 'MAURITIUS', 'MU', 'MUS', '480', '230', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('137', 'MAYOTTE', 'YT', null, null, '269', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('138', 'MEXICO', 'MX', 'MEX', '484', '52', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('139', 'MICRONESIA, FEDERATED STATES OF', 'FM', 'FSM', '583', '691', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('140', 'MOLDOVA, REPUBLIC OF', 'MD', 'MDA', '498', '373', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('141', 'MONACO', 'MC', 'MCO', '492', '377', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('142', 'MONGOLIA', 'MN', 'MNG', '496', '976', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('143', 'MONTSERRAT', 'MS', 'MSR', '500', '1664', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('144', 'MOROCCO', 'MA', 'MAR', '504', '212', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('145', 'MOZAMBIQUE', 'MZ', 'MOZ', '508', '258', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('146', 'MYANMAR', 'MM', 'MMR', '104', '95', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('147', 'NAMIBIA', 'NA', 'NAM', '516', '264', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('148', 'NAURU', 'NR', 'NRU', '520', '674', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('149', 'NEPAL', 'NP', 'NPL', '524', '977', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('150', 'NETHERLANDS', 'NL', 'NLD', '528', '31', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('151', 'NETHERLANDS ANTILLES', 'AN', 'ANT', '530', '599', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('152', 'NEW CALEDONIA', 'NC', 'NCL', '540', '687', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('153', 'NEW ZEALAND', 'NZ', 'NZL', '554', '64', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('154', 'NICARAGUA', 'NI', 'NIC', '558', '505', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('155', 'NIGER', 'NE', 'NER', '562', '227', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('156', 'NIGERIA', 'NG', 'NGA', '566', '234', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('157', 'NIUE', 'NU', 'NIU', '570', '683', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('158', 'NORFOLK ISLAND', 'NF', 'NFK', '574', '672', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('159', 'NORTHERN MARIANA ISLANDS', 'MP', 'MNP', '580', '1670', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('160', 'NORWAY', 'NO', 'NOR', '578', '47', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('161', 'OMAN', 'OM', 'OMN', '512', '968', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('162', 'PAKISTAN', 'PK', 'PAK', '586', '92', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('163', 'PALAU', 'PW', 'PLW', '585', '680', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('164', 'PALESTINIAN TERRITORY, OCCUPIED', 'PS', null, null, '970', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('165', 'PANAMA', 'PA', 'PAN', '591', '507', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('166', 'PAPUA NEW GUINEA', 'PG', 'PNG', '598', '675', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('167', 'PARAGUAY', 'PY', 'PRY', '600', '595', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('168', 'PERU', 'PE', 'PER', '604', '51', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('169', 'PHILIPPINES', 'PH', 'PHL', '608', '63', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('170', 'PITCAIRN', 'PN', 'PCN', '612', '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('171', 'POLAND', 'PL', 'POL', '616', '48', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('172', 'PORTUGAL', 'PT', 'PRT', '620', '351', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('173', 'PUERTO RICO', 'PR', 'PRI', '630', '1787', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('174', 'QATAR', 'QA', 'QAT', '634', '974', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('175', 'REUNION', 'RE', 'REU', '638', '262', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('176', 'ROMANIA', 'RO', 'ROM', '642', '40', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('177', 'RUSSIAN FEDERATION', 'RU', 'RUS', '643', '70', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('178', 'RWANDA', 'RW', 'RWA', '646', '250', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('179', 'SAINT HELENA', 'SH', 'SHN', '654', '290', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('180', 'SAINT KITTS AND NEVIS', 'KN', 'KNA', '659', '1869', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('181', 'SAINT LUCIA', 'LC', 'LCA', '662', '1758', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('182', 'SAINT PIERRE AND MIQUELON', 'PM', 'SPM', '666', '508', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('183', 'SAINT VINCENT AND THE GRENADINES', 'VC', 'VCT', '670', '1784', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('184', 'SAMOA', 'WS', 'WSM', '882', '684', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('185', 'SAN MARINO', 'SM', 'SMR', '674', '378', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('186', 'SAO TOME AND PRINCIPE', 'ST', 'STP', '678', '239', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('187', 'SAUDI ARABIA', 'SA', 'SAU', '682', '966', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('188', 'SENEGAL', 'SN', 'SEN', '686', '221', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('189', 'SERBIA AND MONTENEGRO', 'CS', null, null, '381', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('190', 'SEYCHELLES', 'SC', 'SYC', '690', '248', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('191', 'SIERRA LEONE', 'SL', 'SLE', '694', '232', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('192', 'SINGAPORE', 'SG', 'SGP', '702', '65', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('193', 'SLOVAKIA', 'SK', 'SVK', '703', '421', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('194', 'SLOVENIA', 'SI', 'SVN', '705', '386', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('195', 'SOLOMON ISLANDS', 'SB', 'SLB', '90', '677', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('196', 'SOMALIA', 'SO', 'SOM', '706', '252', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('197', 'SOUTH AFRICA', 'ZA', 'ZAF', '710', '27', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('198', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'GS', null, null, '0', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('199', 'SPAIN', 'ES', 'ESP', '724', '34', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('200', 'SRI LANKA', 'LK', 'LKA', '144', '94', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('201', 'SUDAN', 'SD', 'SDN', '736', '249', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('202', 'SURINAME', 'SR', 'SUR', '740', '597', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('203', 'SVALBARD AND JAN MAYEN', 'SJ', 'SJM', '744', '47', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('204', 'SWAZILAND', 'SZ', 'SWZ', '748', '268', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('205', 'SWEDEN', 'SE', 'SWE', '752', '46', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('206', 'SWITZERLAND', 'CH', 'CHE', '756', '41', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('207', 'SYRIAN ARAB REPUBLIC', 'SY', 'SYR', '760', '963', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('208', 'TAIWAN, PROVINCE OF CHINA', 'TW', 'TWN', '158', '886', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('209', 'TAJIKISTAN', 'TJ', 'TJK', '762', '992', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('210', 'TANZANIA, UNITED REPUBLIC OF', 'TZ', 'TZA', '834', '255', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('211', 'THAILAND', 'TH', 'THA', '764', '66', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('212', 'TIMOR-LESTE', 'TL', null, null, '670', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('213', 'TOGO', 'TG', 'TGO', '768', '228', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('214', 'TOKELAU', 'TK', 'TKL', '772', '690', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('215', 'TONGA', 'TO', 'TON', '776', '676', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('216', 'TRINIDAD AND TOBAGO', 'TT', 'TTO', '780', '1868', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('217', 'TUNISIA', 'TN', 'TUN', '788', '216', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('218', 'TURKEY', 'TR', 'TUR', '792', '90', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('219', 'TURKMENISTAN', 'TM', 'TKM', '795', '7370', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('220', 'TURKS AND CAICOS ISLANDS', 'TC', 'TCA', '796', '1649', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('221', 'TUVALU', 'TV', 'TUV', '798', '688', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('222', 'UGANDA', 'UG', 'UGA', '800', '256', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('223', 'UKRAINE', 'UA', 'UKR', '804', '380', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('224', 'UNITED ARAB EMIRATES', 'AE', 'ARE', '784', '971', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('225', 'UNITED KINGDOM', 'GB', 'GBR', '826', '44', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('226', 'UNITED STATES', 'US', 'USA', '840', '1', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('227', 'UNITED STATES MINOR OUTLYING ISLANDS', 'UM', null, null, '1', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('228', 'URUGUAY', 'UY', 'URY', '858', '598', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('229', 'UZBEKISTAN', 'UZ', 'UZB', '860', '998', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('230', 'VANUATU', 'VU', 'VUT', '548', '678', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('231', 'VENEZUELA', 'VE', 'VEN', '862', '58', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('232', 'VIET NAM', 'VN', 'VNM', '704', '84', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('233', 'VIRGIN ISLANDS, BRITISH', 'VG', 'VGB', '92', '1284', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('234', 'VIRGIN ISLANDS, U.S.', 'VI', 'VIR', '850', '1340', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('235', 'WALLIS AND FUTUNA', 'WF', 'WLF', '876', '681', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('236', 'WESTERN SAHARA', 'EH', 'ESH', '732', '212', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('237', 'YEMEN', 'YE', 'YEM', '887', '967', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('238', 'ZAMBIA', 'ZM', 'ZMB', '894', '260', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `countries` VALUES ('239', 'ZIMBABWE', 'ZW', 'ZWE', '716', '263', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');

-- ----------------------------
-- Table structure for couriers
-- ----------------------------
DROP TABLE IF EXISTS `couriers`;
CREATE TABLE `couriers` (
  `id` int(9) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` int(11) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT '0.00',
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of couriers
-- ----------------------------
INSERT INTO `couriers` VALUES ('1', 'PickUp by Self', 'To be picked up by yourself', 'authemanshop.com', '1', '0.00', '1', '2018-03-19 16:33:56', '2018-03-19 16:33:56');
INSERT INTO `couriers` VALUES ('2', 'Standard Shipping', 'To be delivered at your given address', 'authemanshop.com', '0', '500.00', '1', '2017-11-28 17:16:13', '2018-03-23 01:56:09');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `phone_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('14', 'Superadministrator', 'superadmin@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, null, 'vfotLV5ohPKjoSJiGeZdyXe73WYCr5GeBiibNkc7TWSZljZNzW2iZsEuC2cg', '2018-01-04 20:49:22', '2018-01-04 20:49:22');
INSERT INTO `customers` VALUES ('15', 'Administrator', 'admin@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, null, 'fpZUTMMWB4XBx6S5HUyci4Q1fotun8T4aOZF0wCwb83FjvvHse2JfUvXxBf5', '2018-01-04 20:49:22', '2018-01-04 20:49:22');
INSERT INTO `customers` VALUES ('17', 'Vendor', 'vendor@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, null, 'qwgXQ9QtYA', '2018-01-04 20:49:23', '2018-01-04 20:49:23');
INSERT INTO `customers` VALUES ('18', 'Customer', 'customer@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, null, 'JHk0pmflf8Zvf73p9L8igYOJIV6oiWK0qdtV2Q1QLigJhsdCH59K5gIK6m5m', '2018-01-04 20:49:23', '2018-01-04 20:49:23');
INSERT INTO `customers` VALUES ('20', 'Lanre', 'lanre_alao14@yahoo.com', '$2y$10$Z8KYAuKh3wyTM8RmSIzJMOylyxeIxHS0pY6Tk245ElMFK/wOfYKVa', '1', '08055287272', null, '0JURzZ20UcpK2ybqZPIIhOZTbpxceGYP9W0blLuHHTbtH0gAmXh5GhU7g4uH', '2018-02-02 08:54:55', '2018-02-02 08:54:55');
INSERT INTO `customers` VALUES ('22', 'Darrylboalo', 'monicalee923@yahoo.com', '$2y$10$Z1F7eeKCcrBYFSYeETMhhuX.Gk6vxnLfGFGKxkNuVkkfNVnM6xURe', '1', '82521181754', null, null, '2018-02-12 14:28:49', '2018-02-12 14:28:49');
INSERT INTO `customers` VALUES ('26', 'Jerry Jude', 'egwuemijerryjude@gmail.com', '$2y$10$OOM60m67bG/SNwGENSpPg.8gfbeIg4Wn0LYlr5EipdSwCxwNt4mPm', '1', '08065783475', null, null, '2018-02-21 01:54:35', '2018-02-21 01:54:35');
INSERT INTO `customers` VALUES ('27', 'Ttt', 'ttt@ttt.cn', '$2y$10$LJ/.JwYshZ1.EgaV2Q0u0.mvizmi4TMHMUwLSVCtXlc82Mtd9vRRK', '1', '4555555', null, null, '2018-03-07 11:49:23', '2018-03-07 11:49:23');
INSERT INTO `customers` VALUES ('28', 'Authemany2k Felix', 'authemany2k@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', '08026156237', null, 'IkEKlYsO87lXglDGbU4F72gspMoLfP0E3R6CFenseNJYos88beQrpKJX1xpS', '2018-03-11 20:08:26', '2018-03-11 20:08:26');
INSERT INTO `customers` VALUES ('29', 'Francisca Onome', 'franciscaanna30@gmail.com', '$2y$10$eqcCTjXtmYgWTspA2dN5H.uelw9wP4pUqSgzFvYcnYv6QOrRtyFZC', '1', '08186950612', null, null, '2018-03-30 19:02:14', '2018-03-30 19:02:14');
INSERT INTO `customers` VALUES ('30', 'AjLina', 'odopaulina@gmail.com', '$2y$10$jmFNMdkBCG.yejvZXVk4yekLVo07Cv281fGrSTIR1dBWE5bg91EYa', '1', '2349021133766', null, null, '2018-04-02 19:36:31', '2018-04-02 19:36:31');
INSERT INTO `customers` VALUES ('31', 'Adekunle abimbola posh', 'laurenposh123@gmail.com', '$2y$10$gfeKtsQOJKnIC5LfMjgpRu2npnqWHk6XwQoUj4m0dgwwK2ZWQclfa', '1', '+234703715599', null, null, '2018-04-02 20:03:23', '2018-04-02 20:03:23');
INSERT INTO `customers` VALUES ('32', 'Dennis abimbola', 'laurenposh123@icloud.com', '$2y$10$JBi2wvZ74Iao56TF/TRNau41tPujZd2LGCShOyTdE7qXwaQiEFhlW', '1', '07037155997', null, null, '2018-05-07 07:07:15', '2018-05-07 07:07:15');
INSERT INTO `customers` VALUES ('33', 'Dennis abimbola', 'laureposh123@gmail.com', '$2y$10$/i4vTApOWHm8cwDE4EYOBedEcKkw6TlneVdYnWXP2/fbszt1pdXym', '1', '07037155997', null, null, '2018-06-03 06:13:16', '2018-06-03 06:13:16');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'Superadministrator', 'superadmin@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, '8R8MXnU4Oc6J1mHsphPCFdVXXvSOPbsUkpmG1GadY47qTrhpgUIy5Na1DZDp', '2018-01-04 20:49:22', '2018-03-11 18:33:22');
INSERT INTO `employees` VALUES ('2', 'Administrator', 'admin@gmail.com', '$2y$10$ek7R77yPScf8Ydfh77sJku1pUTgCw5RdBGsxbZ/nzdQ5tbaUuvWfe', '1', null, 'Amz11icW7hLMNFcCdITVT3jgxMLbFSmmLTRgRRK1twPke6pVIKJM9WfZt9IE', '2018-01-04 20:49:22', '2018-01-04 20:49:22');
INSERT INTO `employees` VALUES ('3', 'Vendor', 'vendor@gmail.com', '$2y$10$ek7R77yPScf8Ydfh77sJku1pUTgCw5RdBGsxbZ/nzdQ5tbaUuvWfe', '1', null, 'Q8k6NI18Eic6guVX04ItpmETG6IXckNvVUZuOA9UMdIWRciQuYlXWPPpU8cR', '2018-01-04 20:49:23', '2018-01-04 20:49:23');
INSERT INTO `employees` VALUES ('4', 'Temitope Whwnayon Segbenu', 'temitope.segbenu@aun.edu.ng', '$2y$10$J3fle2Kr72EcqKthgJeg7eqvI7sBoHe.geJZZYBLlzW41JZ3RkC..', '1', null, '', '2018-03-11 12:44:59', '2018-03-11 18:32:35');
INSERT INTO `employees` VALUES ('6', 'Temitope Segbenu', 'topsegx@gmail.com', '$2y$10$LbHybxxqYx2t4doniVh.xeBvLWhGZKrToQl7SQ4YwXkoiziHBiNTu', '1', null, '', '2018-03-11 18:10:18', '2018-03-11 18:35:30');
INSERT INTO `employees` VALUES ('7', 'authemany2k Felix', 'authemany2k@gmail.com', '$2y$10$ek7R77yPScf8Ydfh77sJku1pUTgCw5RdBGsxbZ/nzdQ5tbaUuvWfe', '1', null, '', '2018-03-11 19:07:56', '2018-03-11 19:09:49');

-- ----------------------------
-- Table structure for employee_permission
-- ----------------------------
DROP TABLE IF EXISTS `employee_permission`;
CREATE TABLE `employee_permission` (
  `permission_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employee_permission
-- ----------------------------
INSERT INTO `employee_permission` VALUES ('9', '4', 'admins');
INSERT INTO `employee_permission` VALUES ('10', '4', 'admins');
INSERT INTO `employee_permission` VALUES ('11', '4', 'admins');

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role` (
  `role_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES ('1', '1', 'admins');
INSERT INTO `employee_role` VALUES ('2', '2', 'admins');
INSERT INTO `employee_role` VALUES ('3', '3', 'admins');
INSERT INTO `employee_role` VALUES ('2', '6', 'admins');
INSERT INTO `employee_role` VALUES ('1', '7', 'admins');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_customers_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_000010_create_employees_table', '1');
INSERT INTO `migrations` VALUES ('3', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_05_26_020731_create_country_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_05_26_035202_create_provinces_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_05_26_051502_create_cities_table', '1');
INSERT INTO `migrations` VALUES ('7', '2017_06_10_225235_create_products_table', '1');
INSERT INTO `migrations` VALUES ('8', '2017_06_11_015526_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('9', '2017_06_11_033553_create_category_product_table', '1');
INSERT INTO `migrations` VALUES ('10', '2017_06_11_073305_create_address_table', '1');
INSERT INTO `migrations` VALUES ('11', '2017_06_12_225546_create_order_status_table', '1');
INSERT INTO `migrations` VALUES ('12', '2017_06_13_005248_create_payment_methods', '1');
INSERT INTO `migrations` VALUES ('13', '2017_06_13_044714_create_couriers_table', '1');
INSERT INTO `migrations` VALUES ('14', '2017_06_13_053346_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('15', '2017_06_13_091740_create_order_products_table', '1');
INSERT INTO `migrations` VALUES ('16', '2017_06_17_011245_create_shoppingcart_table', '1');
INSERT INTO `migrations` VALUES ('25', '2017_11_30_154327_entrust_setup_tables', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(9) unsigned NOT NULL DEFAULT '2',
  `customer_id` int(9) unsigned NOT NULL,
  `address_id` int(9) unsigned NOT NULL,
  `order_status_id` int(9) unsigned NOT NULL,
  `payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discounts` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_reference_unique` (`reference`) USING BTREE,
  KEY `orders_courier_id_index` (`courier_id`) USING BTREE,
  KEY `orders_customer_id_index` (`customer_id`) USING BTREE,
  KEY `orders_address_id_index` (`address_id`) USING BTREE,
  KEY `orders_order_status_id_index` (`order_status_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '65iy7RQIbkUS1mCNS2C9ge8ey', '2', '14', '47', '2', 'paystack', '0.00', '37000.00', '0.00', '37500.00', '0.00', null, '2018-07-29 02:11:57', '2018-07-29 02:11:57');
INSERT INTO `orders` VALUES ('3', 'Ks1UrbMbtmQMwkRvNkrsuejcr', '2', '14', '47', '2', 'paystack', '0.00', '45700.00', '0.00', '46200.00', '0.00', null, '2018-07-29 02:17:37', '2018-07-29 02:17:37');
INSERT INTO `orders` VALUES ('4', 'DeA8zt3CBtmT0QfrgFQOy2P3F', '2', '14', '47', '2', 'paystack', '0.00', '31000.00', '0.00', '31000.00', '0.00', null, '2018-07-29 02:32:53', '2018-07-29 02:32:53');
INSERT INTO `orders` VALUES ('5', 'DcF9aL538Titkbqrkjyj1CC1x', '2', '14', '47', '2', 'paystack', '0.00', '48700.00', '0.00', '48700.00', '0.00', null, '2018-07-29 02:33:51', '2018-07-29 02:33:51');
INSERT INTO `orders` VALUES ('6', 'K3bmvNkcxRj4n5ybAMECNJfW1', '2', '14', '47', '2', 'paystack', '0.00', '18500.00', '0.00', '18500.00', '0.00', null, '2018-07-29 02:38:38', '2018-07-29 02:38:38');
INSERT INTO `orders` VALUES ('7', '9uoga61gCOmuMlHpvng42gCb3', '2', '14', '47', '2', 'paystack', '0.00', '5700.00', '0.00', '5700.00', '0.00', null, '2018-07-29 02:43:18', '2018-07-29 02:43:18');
INSERT INTO `orders` VALUES ('9', 'G2HdOCIyoZhPDBOSxPdW4NaT9', '2', '14', '47', '2', 'paystack', '0.00', '18500.00', '0.00', '18500.00', '0.00', null, '2018-07-29 02:55:03', '2018-07-29 02:55:03');
INSERT INTO `orders` VALUES ('10', '9L0FccdvvweK16pcY9xoXZGwm', '2', '14', '47', '2', 'paystack', '0.00', '5700.00', '0.00', '5700.00', '0.00', null, '2018-07-29 02:58:20', '2018-07-29 02:58:20');
INSERT INTO `orders` VALUES ('11', 'fxlWIlKtyxaWxsDeMqQoPgKqs', '2', '14', '47', '2', 'paystack', '0.00', '45700.00', '0.00', '45700.00', '0.00', null, '2018-07-29 03:24:15', '2018-07-29 03:24:15');
INSERT INTO `orders` VALUES ('12', '4dZVhaArRWMdyEZXUZtp9giYV', '2', '14', '47', '2', 'paystack', '0.00', '30000.00', '0.00', '30000.00', '0.00', null, '2018-07-29 03:48:49', '2018-07-29 03:48:49');
INSERT INTO `orders` VALUES ('14', 'xpHvGr4QTRKILsdoPXZdpmdAh', '2', '14', '47', '2', 'paystack', '0.00', '31000.00', '0.00', '31000.00', '0.00', null, '2018-07-29 03:51:10', '2018-07-29 03:51:10');
INSERT INTO `orders` VALUES ('15', 'IRNcyjVbwP1VgHRBzGwfkhtXX', '2', '14', '47', '2', 'paystack', '0.00', '45700.00', '0.00', '45700.00', '0.00', null, '2018-07-29 04:02:05', '2018-07-29 04:02:05');
INSERT INTO `orders` VALUES ('16', 'A5zzSGFtpzzS94nTalGROAAds', '2', '14', '47', '2', 'paystack', '0.00', '5700.00', '0.00', '5700.00', '0.00', null, '2018-07-29 04:08:13', '2018-07-29 04:08:13');
INSERT INTO `orders` VALUES ('17', '95bSgNws6xNJA5FakXMpzDVPU', '2', '14', '47', '2', 'paystack', '0.00', '33000.00', '0.00', '33000.00', '0.00', null, '2018-07-29 04:09:09', '2018-07-29 04:09:09');
INSERT INTO `orders` VALUES ('19', 'byiNu1xHMQvQLzwskQc256ccO', '2', '14', '47', '2', 'paystack', '0.00', '45700.00', '0.00', '45700.00', '0.00', null, '2018-07-29 04:25:27', '2018-07-29 04:25:27');
INSERT INTO `orders` VALUES ('20', 'dXqdtGNxhPJYxM7TLIoePZgX4', '2', '14', '47', '2', 'paystack', '0.00', '30000.00', '0.00', '30000.00', '0.00', null, '2018-07-29 04:30:38', '2018-07-29 04:30:38');
INSERT INTO `orders` VALUES ('21', 'RHI3gNaXhCAPrhNGbohmhQL6f', '2', '14', '47', '2', 'paystack', '0.00', '15300.00', '0.00', '15300.00', '0.00', null, '2018-07-29 04:31:38', '2018-07-29 04:31:38');
INSERT INTO `orders` VALUES ('22', 'JUiBHNYYQrgEM7CDevnj7ojIP', '2', '14', '47', '2', 'paystack', '0.00', '14000.00', '0.00', '14000.00', '0.00', null, '2018-07-29 04:42:34', '2018-07-29 04:42:34');
INSERT INTO `orders` VALUES ('23', 'RgMXRFOo9Dv7q0TXKYmr0ksLU', '2', '14', '47', '2', 'paystack', '0.00', '45700.00', '0.00', '45700.00', '0.00', null, '2018-07-29 04:48:00', '2018-07-29 04:48:00');
INSERT INTO `orders` VALUES ('25', 'CZW6M0snfYKT4DbZC58heuAK8', '2', '14', '47', '2', 'paystack', '0.00', '5700.00', '0.00', '5700.00', '0.00', null, '2018-07-29 04:51:05', '2018-07-29 04:51:05');
INSERT INTO `orders` VALUES ('26', 'd6tibCpK9eXxn49FJBAmzq9H5', '2', '14', '47', '2', 'paystack', '0.00', '7500.00', '0.00', '7500.00', '0.00', null, '2018-07-29 04:52:13', '2018-07-29 04:52:13');
INSERT INTO `orders` VALUES ('27', '4w3ZRufSnKsvEOEoLd4o2r7tH', '2', '14', '47', '2', 'paystack', '0.00', '7000.00', '0.00', '7000.00', '0.00', null, '2018-07-29 04:54:22', '2018-07-29 04:54:22');
INSERT INTO `orders` VALUES ('28', 'u7gOGWoV3dc6mPmOysKsbqDHk', '2', '14', '47', '2', 'paystack', '0.00', '30000.00', '0.00', '30000.00', '0.00', null, '2018-07-29 04:56:36', '2018-07-29 04:56:36');
INSERT INTO `orders` VALUES ('29', 'fkOScboZ7G5lwzZpdVtqTTLgy', '2', '14', '47', '2', 'paystack', '0.00', '180000.00', '0.00', '180000.00', '0.00', null, '2018-07-29 04:58:35', '2018-07-29 04:58:35');
INSERT INTO `orders` VALUES ('30', '3vyGGHeAYx0GAwBgoLtNnRVWB', '2', '14', '47', '2', 'paystack', '0.00', '31000.00', '0.00', '31000.00', '0.00', null, '2018-07-29 04:59:41', '2018-07-29 04:59:41');
INSERT INTO `orders` VALUES ('32', 'wiIKtVuBtcncjKtKI9B8HEOh4', '2', '14', '47', '2', 'paystack', '0.00', '5700.00', '0.00', '5700.00', '0.00', null, '2018-07-29 06:10:03', '2018-07-29 06:10:03');
INSERT INTO `orders` VALUES ('33', 'AexolAr1TrbPg3dcMfbu1L2ZO', '2', '14', '47', '2', 'paystack', '0.00', '4700.00', '0.00', '4700.00', '0.00', null, '2018-07-29 06:11:04', '2018-07-29 06:11:04');
INSERT INTO `orders` VALUES ('34', 'rPSSXddlzBx1a2PAci8RhU7Lr', '2', '14', '47', '2', 'paystack', '0.00', '280000.00', '0.00', '280000.00', '0.00', null, '2018-07-29 06:12:43', '2018-07-29 06:12:43');
INSERT INTO `orders` VALUES ('35', 'jp70OhuA8nYy7ACzB2q4mfOuL', '2', '14', '47', '2', 'paystack', '0.00', '3500.00', '0.00', '3500.00', '0.00', null, '2018-07-29 06:19:36', '2018-07-29 06:19:36');
INSERT INTO `orders` VALUES ('36', 'T39c1No9IuJtnI9miLmgfFwHJ', '2', '14', '47', '2', 'paystack', '0.00', '31000.00', '0.00', '31000.00', '0.00', null, '2018-07-29 15:56:26', '2018-07-29 15:56:26');
INSERT INTO `orders` VALUES ('38', 'DVACYSng4CwLGWFs4ELgUdHzX', '2', '14', '47', '2', 'paystack', '0.00', '31000.00', '0.00', '31000.00', '0.00', null, '2018-07-29 15:57:12', '2018-07-29 15:57:12');
INSERT INTO `orders` VALUES ('39', 'XogNftM9A1COMWosCVdn9PtpP', '2', '14', '47', '2', 'paystack', '0.00', '7000.00', '0.00', '7000.00', '0.00', null, '2018-07-29 15:59:05', '2018-07-29 15:59:05');
INSERT INTO `orders` VALUES ('40', 'RighKjHKtv6bDVNAQJWFQEDi3', '2', '14', '47', '2', 'paystack', '0.00', '7500.00', '0.00', '7500.00', '0.00', null, '2018-07-29 16:09:16', '2018-07-29 16:09:16');
INSERT INTO `orders` VALUES ('42', 'MbeRZKRQ156s4ExIxiakNMsCZ', '2', '14', '47', '2', 'paystack', '0.00', '7500.00', '0.00', '7500.00', '0.00', null, '2018-07-29 16:11:06', '2018-07-29 16:11:06');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '406', '2');
INSERT INTO `order_product` VALUES ('2', '3', '336', '1');
INSERT INTO `order_product` VALUES ('3', '4', '285', '1');
INSERT INTO `order_product` VALUES ('4', '5', '388', '1');
INSERT INTO `order_product` VALUES ('5', '5', '336', '1');
INSERT INTO `order_product` VALUES ('6', '6', '406', '1');
INSERT INTO `order_product` VALUES ('7', '7', '350', '1');
INSERT INTO `order_product` VALUES ('8', '9', '406', '1');
INSERT INTO `order_product` VALUES ('9', '10', '349', '1');
INSERT INTO `order_product` VALUES ('10', '11', '336', '1');
INSERT INTO `order_product` VALUES ('11', '12', '390', '1');
INSERT INTO `order_product` VALUES ('12', '14', '285', '1');
INSERT INTO `order_product` VALUES ('13', '15', '336', '1');
INSERT INTO `order_product` VALUES ('14', '16', '349', '1');
INSERT INTO `order_product` VALUES ('15', '17', '60', '1');
INSERT INTO `order_product` VALUES ('16', '19', '336', '1');
INSERT INTO `order_product` VALUES ('17', '20', '390', '1');
INSERT INTO `order_product` VALUES ('18', '21', '405', '1');
INSERT INTO `order_product` VALUES ('19', '22', '391', '2');
INSERT INTO `order_product` VALUES ('20', '23', '336', '1');
INSERT INTO `order_product` VALUES ('21', '25', '349', '1');
INSERT INTO `order_product` VALUES ('22', '26', '396', '1');
INSERT INTO `order_product` VALUES ('23', '27', '391', '1');
INSERT INTO `order_product` VALUES ('24', '28', '390', '1');
INSERT INTO `order_product` VALUES ('25', '29', '363', '1');
INSERT INTO `order_product` VALUES ('26', '30', '285', '1');
INSERT INTO `order_product` VALUES ('27', '32', '349', '1');
INSERT INTO `order_product` VALUES ('28', '33', '296', '1');
INSERT INTO `order_product` VALUES ('29', '34', '172', '1');
INSERT INTO `order_product` VALUES ('30', '35', '345', '1');
INSERT INTO `order_product` VALUES ('31', '36', '285', '1');
INSERT INTO `order_product` VALUES ('32', '38', '284', '1');
INSERT INTO `order_product` VALUES ('33', '39', '391', '1');
INSERT INTO `order_product` VALUES ('34', '40', '396', '1');
INSERT INTO `order_product` VALUES ('35', '42', '396', '1');

-- ----------------------------
-- Table structure for order_statuses
-- ----------------------------
DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE `order_statuses` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_statuses
-- ----------------------------
INSERT INTO `order_statuses` VALUES ('1', 'Delivered', '#11F530', '2017-11-28 16:30:25', '2017-12-24 05:53:00');
INSERT INTO `order_statuses` VALUES ('2', 'Processing', '#2919FF', '2017-11-29 23:06:24', '2017-11-29 23:06:24');
INSERT INTO `order_statuses` VALUES ('3', 'Shipped', '#8578FF', '2017-11-29 23:06:45', '2017-12-24 05:53:38');
INSERT INTO `order_statuses` VALUES ('4', 'Returned', '#FF2D0D', '2017-11-29 23:07:08', '2017-11-29 23:07:08');
INSERT INTO `order_statuses` VALUES ('5', 'PSpaymentSuccessful', '#006400', '2017-12-20 21:26:45', '2017-12-24 02:50:38');
INSERT INTO `order_statuses` VALUES ('6', 'PaymentFail', '#FF2D0D', '2017-12-22 04:35:22', '2017-12-22 04:35:33');
INSERT INTO `order_statuses` VALUES ('7', 'PayOnDelivery', '#FF91DE', '2017-12-23 04:46:40', '2017-12-24 05:52:23');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('authemany2k@gmail.com', '$2y$10$Cll062kDrZweg6/Zoszg7eurCc/fMjxuEalLv9VdMISSNq4oJx1cu', '2018-01-11 09:31:42');
INSERT INTO `password_resets` VALUES ('customer@gmail.com', '$2y$10$UklNInQQDUDGK0FK6UfJqOj48/R2aYNkAuGH.JPy5DIUYTFf0TiFi', '2018-01-12 05:29:50');

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES ('1', 'OnlinePayment', 'paystack', 'Online Payment by Paystack', '1', '2017-11-28 17:14:35', '2017-11-28 17:47:31', '455335', '333', 'sk_test_60a13a2a82f8045d55c56be3d6480a5b6abd8177', 'https://dashboard.paystack.com', 'http://localhost/autheonlineshop/public/checkout/success', 'http://localhost/autheonlineshop/public/checkout/cancel', 'http://localhost/autheonlineshop/public/checkout/cancel');
INSERT INTO `payment_methods` VALUES ('2', 'PayOnDelivery', 'payondelivery', 'Pay on Delivery', '1', '2017-11-28 17:14:35', '2017-11-28 17:47:31', '455', '3', 'sk_test_60a13a2a82f8045d55c56be3d6480a5b6abd8177', 'https://dashboard.paystack.com', 'http://autheonlineshop.dev/payment/callback', 'http://autheonlineshop.dev/payment/callback', 'http://autheonlineshop.dev/payment/callback');
INSERT INTO `payment_methods` VALUES ('3', 'PayPal', 'paypal', 'PayPal payment method', '0', '2017-11-28 17:14:35', '2017-11-28 17:47:31', '455335', '333', 'sk_test_60a13a2a82f8045d55c56be3d6480a5b6abd8177', 'https://dashboard.paystack.com', 'http://localhost/autheonlineshop/public/checkout/success', 'http://autheonlineshop.dev/payment/callback', 'http://localhost/autheonlineshop/public/checkout/cancel');
INSERT INTO `payment_methods` VALUES ('4', 'Stripe', 'stripe', 'Stripe payment method', '1', '2017-11-28 17:14:35', '2017-11-28 17:47:31', '455335', '333', 'sk_test_60a13a2a82f8045d55c56be3d6480a5b6abd8177', 'https://dashboard.paystack.com', 'http://localhost/autheonlineshop/public/checkout/success', 'http://autheonlineshop.dev/payment/callback', 'http://localhost/autheonlineshop/public/checkout/cancel');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'create-users', 'Create Users', 'Create Users', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('2', 'read-users', 'Read Users', 'Read Users', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('3', 'update-users', 'Update Users', 'Update Users', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('4', 'delete-users', 'Delete Users', 'Delete Users', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('5', 'create-acl', 'Create Acl', 'Create Acl', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('6', 'read-acl', 'Read Acl', 'Read Acl', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('7', 'update-acl', 'Update Acl', 'Update Acl', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('8', 'delete-acl', 'Delete Acl', 'Delete Acl', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('9', 'read-profile', 'Read Profile', 'Read Profile', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('10', 'update-profile', 'Update Profile', 'Update Profile', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `permissions` VALUES ('11', 'create-profile', 'Create Profile', 'Create Profile', '2018-01-08 04:46:30', '2018-01-08 04:46:30');
INSERT INTO `permissions` VALUES ('12', 'status-enable', 'status-enable', 'status-enable', '2018-02-03 06:59:10', '2018-02-03 06:59:14');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('9', '3');
INSERT INTO `permission_role` VALUES ('10', '3');
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('2', '2');
INSERT INTO `permission_role` VALUES ('3', '2');
INSERT INTO `permission_role` VALUES ('6', '2');
INSERT INTO `permission_role` VALUES ('9', '2');
INSERT INTO `permission_role` VALUES ('10', '2');
INSERT INTO `permission_role` VALUES ('12', '2');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` int(10) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  `brand_id` int(10) unsigned DEFAULT NULL,
  `length` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `distance_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT '0.00',
  `mass_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_product_index` (`seller_id`) USING BTREE,
  KEY `products_brand_id_foreign` (`brand_id`) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('42', '0000001', 'Ladies\' Wear', 'ladies-wear', '14', 'Ladies\' Wear', null, 'products/1520677011/cover.png', null, '100', '5500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:16:51', '2018-03-24 05:10:05', null);
INSERT INTO `products` VALUES ('43', '0000002', 'Ladies\' Wear-2', 'ladies-wear-2', '14', 'Ladies\' Wear', null, 'products/1520676195/cover.png', null, '100', '5500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 08:19:10', '2018-03-24 05:10:51', null);
INSERT INTO `products` VALUES ('44', '0000003', 'Ladies\' Wear-3', 'ladies-wear-3', '12', 'Ladies\' Wear', null, 'products/1520676652/cover.png', null, '100', '5500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:10:52', '2018-03-11 03:10:52', null);
INSERT INTO `products` VALUES ('45', '0000004', 'Ladies\' Wear-4', 'ladies-wear-4', '12', 'Ladies\' Wear', null, 'products/1520676282/cover.png', null, '100', '5500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:04:43', '2018-03-11 03:04:43', null);
INSERT INTO `products` VALUES ('46', '0000005', 'Turban', 'turban', '12', 'Turban', null, 'products/1520074248/cover.png', null, '100', '1500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-04 03:52:04', '2018-03-04 03:52:04', null);
INSERT INTO `products` VALUES ('47', '0000006', 'Unisex Shoe', 'unisex-shoe', '12', 'Unisex Shoe', null, 'products/1520677500/cover.png', null, '100', '8500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:25:00', '2018-03-11 03:25:00', null);
INSERT INTO `products` VALUES ('48', '0000007', 'Baby\'s Gown', 'babys-gown', '14', 'Baby\'s Gown', null, 'products/1520677440/cover.png', null, '100', '4500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:24:00', '2018-04-10 01:37:22', '2018-04-10 01:37:22');
INSERT INTO `products` VALUES ('49', '0000007', 'Free Native', 'free-native', '14', 'Free Native', null, 'products/1520675732/cover.png', null, '100', '4500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 02:55:32', '2018-04-01 17:38:25', null);
INSERT INTO `products` VALUES ('50', '0000008', 'Body Cone', 'body-cone', '12', 'Body Cone', null, 'products/1520675891/cover.png', null, '100', '4500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 02:58:11', '2018-03-11 02:58:11', null);
INSERT INTO `products` VALUES ('51', '0000009', 'Blue Jeans', 'blue-jeans', '14', 'Blue Jeans', null, 'products/1520675816/cover.png', null, '100', '4000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 02:56:56', '2018-03-24 22:57:16', null);
INSERT INTO `products` VALUES ('52', '0000010', 'Short With Top', 'short-with-top', '12', 'Short With Top', null, 'products/1520675593/cover.png', null, '100', '3500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 02:53:14', '2018-03-11 02:53:14', null);
INSERT INTO `products` VALUES ('53', '0000011', 'Female Dress', 'female-dress', '12', 'Female Dress', null, 'products/1520676879/cover.png', null, '100', '7500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:14:41', '2018-03-11 03:14:41', null);
INSERT INTO `products` VALUES ('54', '0000012', 'Female Low Shoe', 'female-low-shoe', '12', 'Female Low Shoe', null, 'products/1520677932/cover.png', null, '100', '5500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:32:12', '2018-03-11 03:32:12', null);
INSERT INTO `products` VALUES ('55', '0000013', 'Prada shoe', 'prada-shoe', '12', 'Prada shoe', null, 'products/1520678093/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:34:54', '2018-03-11 03:34:54', null);
INSERT INTO `products` VALUES ('56', '0000014', 'Men\'s shoe', 'mens-shoe', '12', 'Men\'s shoe', null, 'products/1520677871/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:31:11', '2018-03-11 03:31:11', null);
INSERT INTO `products` VALUES ('57', '0000015', 'Children School Bag', 'children-school-bag', '12', 'Children School Bag', null, 'products/1520090565/cover.png', null, '100', '13000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-04 08:22:45', '2018-04-10 01:10:03', '2018-04-10 01:10:03');
INSERT INTO `products` VALUES ('58', '0000016', 'Children Wear', 'children-wear', '12', 'Children Wear', null, 'products/1520090783/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-04 08:26:23', '2018-04-10 01:09:31', '2018-04-10 01:09:31');
INSERT INTO `products` VALUES ('59', '0000017', 'Children Dress', 'children-dress', '12', 'Children Dress', null, 'products/1520092240/cover.png', null, '100', '13500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-04 08:50:40', '2018-04-10 01:09:26', '2018-04-10 01:09:26');
INSERT INTO `products` VALUES ('60', '0000018', 'Tecno K7 Spark (1g)', 'tecno-k7-spark-1g', '12', 'Tecno K7 Spark', 'OS: HiOS 2.0 Based on Android 7.0 (Nougat)\r\nSIM Type: Dual SIM (Micro)\r\n4G LTE: NO\r\nScreen Size : 5.5 Inches HD IPS Touchscreen\r\nScreen Resolution: 720 x 1280 pixels\r\nProcessor Type: 1.3 GHz Quad-core CPU\r\nRAM: 1GB\r\nInternal Storage: 16 GB.\r\nExternal Storage: microSD, up to 32 GB\r\nBack / Rear Camera: 13MP camera & single LED Flash\r\nFront Camera: 5MP with flash\r\nBack-placed Fingerprint scanner\r\nBattery: 3000 mAh Non-Removable', 'products/1520345569/cover.png', null, '99', '33000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-07 09:36:19', '2018-07-29 04:09:09', null);
INSERT INTO `products` VALUES ('61', '0000020', 'Tecno K7 Spark (2g)', 'tecno-k7-spark-2g', '12', 'Tecno K7 Spark (2g)', 'OS: HiOS 2.0 Based on Android 7.0 (Nougat) SIM Type: Dual SIM (Micro) 4G LTE: NO Screen Size : 5.5 Inches HD IPS Touchscreen Screen Resolution: 720 x 1280 pixels Processor Type: 1.3 GHz Quad-core CPU RAM: 2GB Internal Storage: 16 GB. External Storage: microSD, up to 32 GB Back / Rear Camera: 13MP camera & single LED Flash Front Camera: 5MP with flash Back-placed Fingerprint scanner Battery: 3000 mAh Non-Removable.', 'products/1520346341/cover.png', null, '100', '37000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-07 09:32:41', '2018-03-07 09:32:41', null);
INSERT INTO `products` VALUES ('62', '0000021', 'Tecno W2', 'tecno-w2', '12', 'Tecno W2', 'Operating System – Android 6.0 (Marshmallow)\r\nScreen Size – 4.5-inch Touch Display, 480 x 854 pixels (217ppi)\r\nProcessor – 1.3GHz quad-core Processor\r\nCamera – 8MP Rear Camera and 0.3MP Front Camera\r\nMemory – 1GB RAM, 8GB Storage with support for memory card up to 32GB\r\nBattery –  2500 mAh polymer battery\r\nFinger Print – No\r\nOther Feature(s) – Wifi: Yes, Bluetooth: Yes', 'products/1520347358/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-07 07:42:38', '2018-03-07 07:42:38', null);
INSERT INTO `products` VALUES ('63', '0000022', 'Tecno Y2', 'tecno-y2', '12', 'Tecno Y2', 'Operating System – Android KitKat 4.4\r\nScreen Size – 4″ IPS capacitive LCD (480 x 800 pixels)\r\nProcessor – 1.3GHz dual-core Cortex-A7, MediaTek MT6572\r\nCamera – 2 MP (Back), 0.3 MP (Front)\r\nMemory – 8 GB ROM, 512 MB RAM\r\nColour –\r\nBattery – 2000 mAh battery\r\nFinger Print – No', 'products/1520353930/cover.png', null, '100', '16000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-07 09:32:10', '2018-03-07 09:32:10', null);
INSERT INTO `products` VALUES ('64', '0000023', 'G G Belt', 'g-g-belt', '10', 'G G Belt', 'Gucci Belt', 'products/1520508794/cover.png', null, '100', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:53:37', '2018-03-23 17:20:30', null);
INSERT INTO `products` VALUES ('65', '0000024', 'Belt', 'belt', '9', 'Snake belt', 'Snake belt', 'products/1520679110/cover.png', null, '100', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:51:50', '2018-03-23 17:22:20', null);
INSERT INTO `products` VALUES ('66', '0000025', 'Givenchy', 'givenchy', '12', 'Givenchy wear', 'Givenchy wear', 'products/1520679357/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:55:57', '2018-03-11 03:55:57', null);
INSERT INTO `products` VALUES ('67', '0000026', 'Givenchy wears', 'givenchy-wears', '12', 'Givenchy wears', 'Givenchy wears', 'products/1520508672/cover.png', null, '100', '12000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 04:31:12', '2018-03-09 04:31:12', null);
INSERT INTO `products` VALUES ('68', '0000027', 'Casual Slippers', 'casual-slippers', '9', 'Casual Slippers', 'Casual Slippers shoe', 'products/1520508353/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 05:53:05', '2018-04-21 20:22:52', null);
INSERT INTO `products` VALUES ('69', '0000028', 'Moncler', 'moncler', '9', 'Moncler Shoe', 'Moncler Shoe', 'products/1520612446/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:20:46', '2018-08-15 09:10:00', '2018-08-15 09:10:00');
INSERT INTO `products` VALUES ('70', '0000029', 'leather shoe', 'leather-shoe', '12', 'leather shoe', 'leather shoe', 'products/1520511752/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 05:22:32', '2018-03-09 05:22:32', null);
INSERT INTO `products` VALUES ('71', '0000030', 'Soul mate', 'soul-mate', '12', 'Soul mate Shoe', 'Soul mate', 'products/1520512907/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 05:42:52', '2018-03-09 05:42:52', null);
INSERT INTO `products` VALUES ('72', '0000031', 'Nike sneaker', 'nike-sneaker', '12', 'Original Nike sneaker shoe', 'Nike sneaker shoe', 'products/1520513368/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 05:52:22', '2018-03-09 05:52:22', null);
INSERT INTO `products` VALUES ('73', '0000032', 'Ballenciaga Slippers', 'ballenciaga-slippers', '12', 'Ballenciaga Slippers', 'Ballenciaga Slippers shoe', 'products/1520513750/cover.png', null, '100', '25000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 06:04:48', '2018-03-09 06:04:48', null);
INSERT INTO `products` VALUES ('74', '0000033', 'Pam Slippers', 'pam-slippers', '12', 'Pam Slippers', 'Pam Slippers', 'products/1520514233/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 06:03:53', '2018-03-09 06:03:53', null);
INSERT INTO `products` VALUES ('75', '0000034', 'Gucci Sneaker', 'gucci-sneaker', '12', 'Original Gucci Sneaker shoe', 'Original Gucci Sneaker', 'products/1520514643/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 06:10:43', '2018-03-09 06:10:43', null);
INSERT INTO `products` VALUES ('76', '0000035', 'Gucci Wears', 'gucci-wears', '12', 'Original Gucci Wears', 'Original Gucci Wears', 'products/1520677734/cover.png', null, '100', '25000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:28:54', '2018-03-11 03:28:54', null);
INSERT INTO `products` VALUES ('77', '0000037', 'Gucci Shoe', 'gucci-shoe', '12', 'Gucci Sneaker Shoe', 'Gucci Sneaker Shoe', 'products/1520524315/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-09 08:51:55', '2018-03-09 08:51:55', null);
INSERT INTO `products` VALUES ('78', '0000038', 'ITEL A11', 'itel-a11', '12', 'ITEL A11  Android Phone', 'Network: 2G / 3G\r\nDisplay: 4.0 inches, TFT Touchscreen display — (480 x 800 px)\r\nSoftware: Android v6.0 (Marshmallow)\r\nProcessor: 1.2 GHz Quad-core CPU\r\nMemory: 512 MB RAM | 8GB ROM\r\nCameras: Front — VGA | Rear — 2 MP (LED flash)\r\nBattery: 1500 mAh', 'products/1520610833/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 08:59:32', '2018-03-10 08:59:32', null);
INSERT INTO `products` VALUES ('79', '0000039', 'ITEL P12', 'itel-p12', '12', 'ITEL P12 Android Phone', 'Network\r\n2G: GSM 850/900/1800/1900\r\n3G: WCDMA 2100\r\n4G: NO\r\nSIM CARD: Dual SIM\r\nCamera\r\nBack/Primary: 5MP with LED flash\r\nFront/Secondary: 2 MP\r\nFeatures: Geo-tagging, AutoFocus\r\nPlatform\r\nOS: Android 6.0 marshmallow\r\nChipSet: MediaTek\r\nProcessor(CPU): 1.2 GHz quad-core Cortex-A7 CPU\r\nGPU: Mali-400\r\nDisplay\r\nType: IPS  Capacitive touch screen\r\nSize: 5.0 inches\r\nResolution: 480 * 854 pixels\r\nMemory\r\nInternal + RAM: 8GB,\r\nRAM: 512 MB\r\nExternal: SD card up to 32GB\r\nConnectivity\r\nWLAN: Wi-Fi 802.11 /b/g/n, Wifi hotspot\r\nBluetooth: YES, 3.2\r\nGPS: YES\r\nRadio: YES\r\nUSB: Yes, Usb 2.0\r\n3.5mm Headphone jack: Yes\r\nBody\r\nWeight: –\r\ndimension: 145 * 72.9 * 9.9mm\r\nColor: Grey\r\nBattery\r\nCapacity: 5000 mAh lithium Battery\r\nStandby Time: up to 3 days\r\nTalk Time: N/A\r\nFeatures\r\nSensors: Light sensor, Proximity sensor\r\nMessaging: SMS (Threaded View), MMS, E-MAIL, PUSH MAIL, IM\r\nBrowser: Supports HTML5\r\nJAVA: No\r\nMusic: MP3, MP2, OGG, AAC, M4A, AMR, FLAC, APE, MAV\r\nVideo: AVI, MOV, TS, M2TS, RM/RMVB, FLV, 3GP, MPEG, DAT, MKV(XVID/px/H.264), MP4.\r\nPicture: photo / Video editor\r\nFiles: Document Viewer, file manager', 'products/1520611138/cover.png', null, '100', '18000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 08:58:58', '2018-03-10 08:58:58', null);
INSERT INTO `products` VALUES ('80', '0000040', 'Tecno WX3', 'tecno-wx3', '12', 'Tecno WX3 Android phone', 'Tecno WX3 Key Specs & Features\r\n5-inch Touch Display, 480 x 854 pixels (196ppi)\r\n1.3GHz quad-core CPU with 1GB RAM\r\nAndroid 7.0 (Nougat)\r\n8GB Storage with support up to 32GB memory card\r\n5MP Rear Camera and 5MP Front Camera\r\n3G Data\r\n2500 mAh Removable Battery', 'products/1520611431/cover.png', null, '100', '24000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:03:51', '2018-03-10 09:03:51', null);
INSERT INTO `products` VALUES ('81', '0000041', 'Tecno WX3 (pro)', 'tecno-wx3-pro', '12', 'Tecno WX3 (pro) Android Phone', 'Display Size: 5 inch\r\nType: FWVGA display\r\nMaterial:\r\nResolution: 854 x 480 pixels\r\n\r\nTechnology\r\nNETWORKS:\r\nGSM: GSM 850 / 900 / 1800\r\n3G: HSDPA 900 / 1900/ 2100\r\n4G: No\r\nSIM Type: Dual-SIM (Micro-SIM, dual standby)\r\n\r\nSoftware\r\nOS: Android OS v7.0 Nougat\r\n\r\nDesign\r\nDimensions: 145 x 73 x 10.29 mm\r\nWeight:\r\nSensors: Accelerometer, Compass, Proximity\r\nBuild:\r\nColours: Champagne Gold, Anthracite Grey, Elegant Blue\r\n\r\nCamera\r\nRear: 5MP 2592 x 1944 pixels, autofocus, LED flash\r\nVideo recording: 1080p @ 30fps\r\nFront-facing: 5MP with LED flash\r\n\r\nHardware\r\nProcessor Type: Quad-core,1.3GHz\r\nProcessor Name: Mediatek MTK6737\r\nGraphics Processor:\r\nRAM: 1 GB\r\nInternal Storage: 8 GB\r\nExternal Storage: microSD, up to 32 GB\r\n\r\nMultimedia\r\nMusic Support: MP3/WAV/AMR/AWB\r\nLoudspeaker: Yes\r\nVideo Support: 3GP/MPEG4\r\nFM Radio: Yes\r\nEarphone Port: 3.5mm\r\n\r\nConnectivity\r\nBluetooth: v4.0\r\nWiFi: IEEE802.11 a/b/g/n\r\nGPS: Yes\r\nUSB: microUSB v2.0, USB Host/Charging\r\n\r\nMiscellaneous\r\nCharging: Normal Charge\r\nBattery: 5000 mAh\r\nAnnouncement: July, 2017\r\nAvailability: July 2017', 'products/1520611734/cover.png', null, '100', '27000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:11:42', '2018-03-10 09:11:42', null);
INSERT INTO `products` VALUES ('82', '0000042', 'Gucci', 'gucci', '9', 'Gucci  Shoe', 'All sizes available', 'products/1520612084/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:14:44', '2018-03-23 19:54:20', null);
INSERT INTO `products` VALUES ('83', '0000043', 'Gucci leather shoe', 'gucci-leather-shoe', '9', 'Gucci Shoe', 'Original Gucci', 'products/1520612924/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:29:01', '2018-03-23 19:56:10', null);
INSERT INTO `products` VALUES ('84', '0000044', 'Gucci shoe 004', 'gucci-shoe-004', '12', 'Gucci Brown', 'Black or brown  shoe for men. All sizes available', 'products/1520613169/cover.png', null, '100', '16000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:52:34', '2018-03-10 09:52:34', null);
INSERT INTO `products` VALUES ('85', '0000045', 'Great model 001', 'great-model-001', '12', 'Great model shoe', 'Black or brown  shoe for men. all sizes available', 'products/1520613303/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:52:04', '2018-03-10 09:52:04', null);
INSERT INTO `products` VALUES ('86', '0000046', 'Ferragamo', 'ferragamo', '12', 'Black or brown', 'Black or brown  shoe for men. All sizes available', 'products/1520613500/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:51:41', '2018-03-10 09:51:41', null);
INSERT INTO `products` VALUES ('87', '0000047', 'Fad-fine 0001', 'fad-fine-0001', '12', 'Fad-fine shoe', 'Black or Brown leather  all sizes available', 'products/1520613800/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:50:38', '2018-03-10 09:50:38', null);
INSERT INTO `products` VALUES ('88', '0000048', 'Clark', 'clark', '9', 'Mens shoe', 'Black or Brown  all sizes available', 'products/1520613914/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:50:02', '2018-03-23 19:38:49', null);
INSERT INTO `products` VALUES ('89', '0000050', 'Boss 001', 'boss-001', '9', 'Boss wear', 'Black and brown all sizes available', 'products/1520614136/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-10 09:49:34', '2018-03-23 19:38:15', null);
INSERT INTO `products` VALUES ('90', '0000055', 'Ladies\' Wear 004', 'ladies-wear-004', '14', 'Ladies\'s wear', 'Ladies\'s wear', 'products/1520676068/cover.png', null, '100', '4000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:01:10', '2018-03-23 19:53:44', null);
INSERT INTO `products` VALUES ('91', '0000056', 'Chiffon top', 'chiffon-top', '14', 'Free top female wear', 'free on body', 'products/1520677283/cover.png', null, '100', '4500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-11 03:21:23', '2018-03-24 22:57:49', null);
INSERT INTO `products` VALUES ('92', '0000057', 'Christian louboutin', 'christian-louboutin', '12', 'Beautiful mens\' shoe', 'All sizes of the Shoe are available.', 'products/1520679678/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 09:50:34', '2018-03-13 09:50:34', null);
INSERT INTO `products` VALUES ('93', '0000049', 'Bally Shoe', 'bally-shoe', '12', 'Bally Designer Shoe', 'All sizes are available', 'products/1520850146/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:22:26', '2018-04-25 22:41:14', null);
INSERT INTO `products` VALUES ('94', '0000051', 'Jordan Shoe', 'jordan-shoe', '12', 'Jordan Shoe', 'all sizes available', 'products/1520850407/cover.png', null, '100', '40000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:26:47', '2018-03-13 03:26:47', null);
INSERT INTO `products` VALUES ('95', '0000052', 'leather shoe 002', 'leather-shoe-002', '12', 'leather shoe', 'All sizes are available', 'products/1520851336/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:42:16', '2018-03-13 03:42:16', null);
INSERT INTO `products` VALUES ('96', '0000053', 'leather shoe 003', 'leather-shoe-003', '12', 'leather shoe', 'all sizes are available', 'products/1520851619/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:46:59', '2018-03-13 03:46:59', null);
INSERT INTO `products` VALUES ('97', '0000054', 'Nike sneaker 002', 'nike-sneaker-002', '12', 'Nike shoe', 'All sizes are available', 'products/1520851811/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:50:11', '2018-03-24 22:59:48', '2018-03-24 22:59:48');
INSERT INTO `products` VALUES ('98', '0000058', 'Gucci Collections', 'gucci-collections', '12', 'Gucci Sneakers', 'All sizes are available', 'products/1520852000/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 03:53:20', '2018-03-13 03:53:20', null);
INSERT INTO `products` VALUES ('99', '0000059', 'Gucci Shoe 002', 'gucci-shoe-002', '12', 'Gucci Sneaker', 'all sizes are available', 'products/1520852891/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:08:11', '2018-03-13 04:08:11', null);
INSERT INTO `products` VALUES ('100', '0000060', 'Louis Vuitton 001', 'louis-vuitton-001', '12', 'Louis Vuitton Shoe', 'all sizes available', 'products/1520853201/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:13:21', '2018-03-13 04:13:21', null);
INSERT INTO `products` VALUES ('101', '0000061', 'Louis Vuitton 002', 'louis-vuitton-002', '12', 'Louis Vuitton', 'all sizes are available', 'products/1520854290/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:31:30', '2018-03-13 04:31:30', null);
INSERT INTO `products` VALUES ('102', '0000062', 'leather shoe 004', 'leather-shoe-004', '12', 'leather shoe', 'all sizes are available', 'products/1520854391/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:33:27', '2018-03-13 04:33:27', null);
INSERT INTO `products` VALUES ('103', '0000063', 'leather shoe 005', 'leather-shoe-005', '12', 'leather shoe', 'all sizes are available', 'products/1520854691/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:38:11', '2018-03-13 04:38:11', null);
INSERT INTO `products` VALUES ('104', '0000064', 'Nike Air Shoe', 'nike-air-shoe', '12', 'Nike Sneakers', 'All sizes available', 'products/1520855074/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 04:44:34', '2018-03-13 04:44:34', null);
INSERT INTO `products` VALUES ('105', '0000065', 'Bellini Suede', 'bellini-suede', '14', 'BELLINI SUEDE LEATHER SHOE', 'SIZE 10 USA', 'products/1520870730/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-16 02:12:20', '2018-03-24 22:55:12', null);
INSERT INTO `products` VALUES ('107', '0000067', 'Nike Wear', 'nike-wear', '12', 'Nike footwear', 'Nike Wear', 'products/1520873613/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 09:53:33', '2018-04-24 21:10:16', null);
INSERT INTO `products` VALUES ('108', '0000068', 'Christian louboutin 002', 'christian-louboutin-002', '12', 'Christian louboutin', 'All sizes availlable', 'products/1520873812/cover.png', null, '100', '35000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 09:56:52', '2018-03-13 09:56:52', null);
INSERT INTO `products` VALUES ('109', '0000069', 'Gbx LEATHER sandal', 'gbx-leather-sandal', '12', 'Gbx LEATHER sandal', 'SIZE 8 USA', 'products/1520892964/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-13 15:16:04', '2018-03-13 15:16:04', null);
INSERT INTO `products` VALUES ('110', '0000070', 'Memory-tech Giorgio brutini', 'memory-tech-giorgio-brutini', '12', 'Memory-tech Giorgio brutini LEATHER SHOE', 'SIZE 15 USA', 'products/1520941025/cover.png', null, '100', '12000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 04:37:06', '2018-03-14 04:37:06', null);
INSERT INTO `products` VALUES ('111', '0000071', 'Seven dials', 'seven-dials', '15', 'Seven dials LEATHER SHOE', 'SIZE 7', 'products/1520943163/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 05:12:43', '2018-03-24 22:56:16', null);
INSERT INTO `products` VALUES ('112', '0000072', 'ROS HOMMERSON 001', 'ros-hommerson-001', '9', 'LEATHER SHOE', 'LEATHER SHOE-SIZE 7 USA', 'products/1520947527/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 06:25:28', '2018-03-14 06:25:28', null);
INSERT INTO `products` VALUES ('113', '0000073', 'Rockport', 'rockport', '9', 'LEATHER SHOE', 'LEATHER SHOE, SIZE 10 USA', 'products/1520951039/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 07:23:59', '2018-03-14 07:23:59', null);
INSERT INTO `products` VALUES ('114', '0000074', 'Giorgio brutini', 'giorgio-brutini', '9', 'LEATHER sandal', 'Size 9.5 USA', 'products/1520952367/cover.png', null, '100', '18000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 07:46:07', '2018-03-14 07:46:07', null);
INSERT INTO `products` VALUES ('115', '0000075', 'TECNO-DroiPad-7D', 'tecno-droipad-7d', '12', 'Android OS TECNO-Pad-7D', 'Details	Specs\r\nOperating System	Android 7.0 Nougat\r\nSIM	Dual Micro SIM\r\nBattery Capacity	3000mAh\r\nCamera	2MP Front Camera with Flash, \r\n5MP back camera with Flash\r\nRAM	1GB RAM\r\nConnectivity	GPS, WiFi, BT 4.0, USB 2.0, FM\r\nColours	Sky Gray, Champagne Gold, Shiny Blue\r\nDisplay	7\'\' 600*1024 IPS\r\nMemory	16GB ROM Expandable via SD card up to 256GB\r\nNetwork	2G/3G\r\nProcessor	1.3GHz Quadcore\r\nDimensions	192 x 106 x 9.9 mm\r\nSensor	G-sensor, Hall, P-sensor, L-sensor GPS\r\nAccessories	Power Adapter, Earphone, USB Cable, Smart Cover', 'products/1523115191/cover.png', null, '100', '32000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 08:39:21', '2018-04-08 00:33:11', null);
INSERT INTO `products` VALUES ('116', '0000076', 'Infinix hot 5', 'infinix-hot-5', '12', 'Infinix hot 5, Android OS', 'OS: Android 7.0 Nougat with XOS\r\nSIM Type: Dual SIM (Micro)\r\n4G LTE: NO\r\nScreen Size : 5.5 Inches HD IPS Touchscreen\r\nScreen Resolution: 720 x 1280 pixels (264 PPI)\r\nProcessor Type: Octa-core 1.3 GHz Cortex, Mediatek MT6580\r\nRAM: 2GB\r\nInternal Storage: 16GB.\r\nExternal Storage: microSD, up to 32 GB\r\nBack / Rear Camera: 8MP camera & LED Flash\r\nFront Camera: 5MP with LED flash\r\nBattery: 4000 mAh', 'products/1523115926/cover.png', null, '99', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 09:31:31', '2018-04-08 00:45:26', null);
INSERT INTO `products` VALUES ('117', '0000077', 'Infinix note 4', 'infinix-note-4', '12', 'Infinix note 4 Android OS', 'OS: XOS Based on Android 7.0 (Nougat)\r\nSIM Type: Dual SIM (Micro)\r\n4G LTE: YES\r\nScreen Size : 5.7 Inches FHD IPS Touchscreen\r\nScreen Resolution: 1080 x 1920 pixels\r\nProcessor Type: Octa-core CPU, MediaTek MT6753 Chipset\r\nRAM: 2GB\r\nInternal Storage: 16 GB.\r\nExternal Storage: microSD, up to 128 GB\r\nBack / Rear Camera: 13MP camera & Dual LED Flash\r\nFront Camera: 8MP\r\nFront-placed Fingerprint scanner\r\nBattery: 4300 mAh Non-Removable', 'products/1523116047/cover.png', null, '100', '53000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-14 09:13:50', '2018-04-08 00:47:27', null);
INSERT INTO `products` VALUES ('118', '0000078', 'ITel s11', 'itel-s11', '12', 'ITel s11 Android OS', '5.0-inch IPS Display, 480 x 854 pixels (186 ppi)\r\n1.3GHz quad-core Processor with 1GB RAM\r\nAndroid 6.0 (Marshmallow)\r\n8GB Storage, up to 32GB memory card support\r\n5MP Rear Camera and 5MP Front Camera\r\n3G Data\r\nDual Micro SIM\r\n2400 mAh Li-ion Battery', 'products/1523116010/cover.png', null, '98', '21000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-22 17:15:14', '2018-04-08 00:46:50', null);
INSERT INTO `products` VALUES ('119', '0000081', 'Nike Sneaker 007', 'nike-sneaker-007', '10', 'Nike Sneaker', null, 'products/1521792979/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:16:21', '2018-03-23 17:16:21', null);
INSERT INTO `products` VALUES ('120', '0000082', 'Nike Sneaker 008', 'nike-sneaker-008', '10', 'Nike Sneaker', null, 'products/1521793098/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:18:19', '2018-03-23 17:18:19', null);
INSERT INTO `products` VALUES ('121', '0000083', 'Nike Sneaker 009', 'nike-sneaker-009', '10', 'Nike Sneaker', null, 'products/1521793487/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:24:30', '2018-03-23 17:24:48', null);
INSERT INTO `products` VALUES ('123', '0000085', 'Nike Sneaker 011', 'nike-sneaker-011', '10', 'Nike Sneaker', null, 'products/1521793602/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:26:42', '2018-03-23 17:26:42', null);
INSERT INTO `products` VALUES ('125', '0000087', 'Nike Sneaker 013', 'nike-sneaker-013', '10', 'Nike Sneaker', null, 'products/1521793895/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:31:36', '2018-03-23 17:31:36', null);
INSERT INTO `products` VALUES ('126', '0000087', 'Nike Sneaker 014', 'nike-sneaker-014', '10', 'Nike Sneaker', null, 'products/1521793956/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:32:01', '2018-03-23 17:32:36', null);
INSERT INTO `products` VALUES ('127', '0000088', 'Nike Sneaker 015', 'nike-sneaker-015', '10', 'Nike Sneaker', null, 'products/1521794040/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:34:00', '2018-03-23 17:34:00', null);
INSERT INTO `products` VALUES ('128', '0000089', 'Nike Sneaker 016', 'nike-sneaker-016', '10', 'Nike Sneaker', null, 'products/1521794121/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:35:06', '2018-03-23 17:35:21', null);
INSERT INTO `products` VALUES ('129', '0000090', 'Fila Sneaker 017', 'fila-sneaker-017', '10', 'Fila Sneaker', null, 'products/1521794204/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:36:26', '2018-03-23 17:37:14', null);
INSERT INTO `products` VALUES ('130', '0000091', 'Nike Sneaker 018', 'nike-sneaker-018', '10', 'Nike Sneaker', null, 'products/1521794337/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 17:38:57', '2018-03-23 17:38:57', null);
INSERT INTO `products` VALUES ('131', '0000092', 'Nike Sneaker 012', 'nike-sneaker-012', '10', 'Nike Sneaker', null, 'products/1521799311/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 18:59:51', '2018-03-23 19:01:51', null);
INSERT INTO `products` VALUES ('132', '0000093', 'Nike Sneaker 010', 'nike-sneaker-010', '10', 'Nike Sneaker', null, 'products/1521800242/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:17:22', '2018-03-23 19:17:22', null);
INSERT INTO `products` VALUES ('133', '0000094', 'Nike Sneaker 019', 'nike-sneaker-019', '10', 'Nike Sneaker', null, 'products/1521800448/cover.png', null, '99', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:20:48', '2018-03-30 01:02:07', null);
INSERT INTO `products` VALUES ('134', '0000095', 'Nike Sneaker 024', 'nike-sneaker-024', '10', 'Nike Sneaker', null, 'products/1521800580/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:23:00', '2018-03-23 19:23:00', null);
INSERT INTO `products` VALUES ('135', '0000095', 'Nike Sneaker 020', 'nike-sneaker-020', '10', 'Nike Sneaker', null, 'products/1521801023/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:29:55', '2018-03-23 19:30:23', null);
INSERT INTO `products` VALUES ('136', '0000096', 'Nike Sneaker 021', 'nike-sneaker-021', '10', 'Nike Sneaker', null, 'products/1521801147/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:32:27', '2018-03-23 19:32:27', null);
INSERT INTO `products` VALUES ('137', '0000096', 'Nike Sneaker 022', 'nike-sneaker-022', '10', 'Nike Sneaker', null, 'products/1521801233/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:33:53', '2018-03-23 19:33:53', null);
INSERT INTO `products` VALUES ('138', '0000097', 'Nike Sneaker 023', 'nike-sneaker-023', '10', 'Nike Sneaker', null, 'products/1521801349/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 19:35:49', '2018-03-23 19:35:49', null);
INSERT INTO `products` VALUES ('139', '0000098', 'Bead 001', 'bead-001', '11', 'Bead', 'Bead for all your occasions', 'products/1521803039/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:03:59', '2018-03-23 20:04:48', null);
INSERT INTO `products` VALUES ('140', '0000099', 'Bead 002', 'bead-002', '11', 'Bead for your occasions', null, 'products/1521803167/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:06:07', '2018-03-23 20:06:07', null);
INSERT INTO `products` VALUES ('141', '000100', 'Bead 003', 'bead-003', '11', 'Bead for your occasion', null, 'products/1521803627/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:13:47', '2018-03-23 20:13:47', null);
INSERT INTO `products` VALUES ('142', '000101', 'Bead 004', 'bead-004', '11', 'Bead for your occasion', null, 'products/1521803851/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:17:31', '2018-03-23 20:17:31', null);
INSERT INTO `products` VALUES ('143', '000102', 'Bead 005', 'bead-005', '11', 'Bead for your occasion', null, 'products/1521803909/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:18:29', '2018-03-23 20:18:29', null);
INSERT INTO `products` VALUES ('144', '000103', 'Bead 006', 'bead-006', '11', 'Bead for your occasion', null, 'products/1521803994/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:19:54', '2018-03-23 20:19:54', null);
INSERT INTO `products` VALUES ('145', '000104', 'Bead 007', 'bead-007', '11', 'Bead for your occasion', null, 'products/1521804093/cover.png', null, '100', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:21:33', '2018-03-23 20:21:33', null);
INSERT INTO `products` VALUES ('146', '000105', 'Bead 008', 'bead-008', '11', 'Bead for your occasion', null, 'products/1521804149/cover.png', null, '100', '12000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:22:29', '2018-03-23 20:22:29', null);
INSERT INTO `products` VALUES ('147', '000106', 'Bead 009', 'bead-009', '11', 'Bead for your occasion', null, 'products/1521804340/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:25:40', '2018-03-23 20:25:40', null);
INSERT INTO `products` VALUES ('148', '000107', 'Bead 010', 'bead-010', '11', 'Bead for your occasion', null, 'products/1521804439/cover.png', null, '100', '25000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-23 20:27:19', '2018-03-23 20:27:19', null);
INSERT INTO `products` VALUES ('149', '000108', 'balenciaga', 'balenciaga', '10', 'balenciaga shoe', null, 'products/1521822418/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:26:59', '2018-03-24 01:28:54', null);
INSERT INTO `products` VALUES ('150', '000109', 'Dolce Giovanni 001', 'dolce-giovanni-001', '10', 'Dolce Giovanni shoe', null, 'products/1521823192/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:30:31', '2018-03-24 01:39:52', null);
INSERT INTO `products` VALUES ('151', '000110', 'Pacoitti', 'pacoitti', '10', 'Pacoitti Shoe', 'All sizes available', 'products/1521886539/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:42:26', '2018-03-24 19:15:42', null);
INSERT INTO `products` VALUES ('152', '000111', 'Givenchy Sneaker', 'givenchy-sneaker', '10', 'Givenchy Sneaker Shoe', 'All sizes available', 'products/1521823551/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:45:51', '2018-03-24 18:07:47', null);
INSERT INTO `products` VALUES ('154', '000112', 'Gucci Sneaker 001', 'gucci-sneaker-001', '10', 'Gucci Sneaker', 'All sizes available', 'products/1521824064/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:54:24', '2018-03-24 18:09:06', null);
INSERT INTO `products` VALUES ('155', '000113', 'Gucci Sneaker 002', 'gucci-sneaker-002', '10', 'Gucci Sneaker', 'All sizes available', 'products/1521824122/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:55:22', '2018-03-24 18:11:31', null);
INSERT INTO `products` VALUES ('156', '000114', 'Gucci Leather', 'gucci-leather', '10', 'Gucci Leather Shoe', 'All sizes available', 'products/1521824141/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:55:41', '2018-03-24 18:15:08', null);
INSERT INTO `products` VALUES ('157', '000115', 'Louis Vuitton Sneaker', 'louis-vuitton-sneaker', '10', 'Louis Vuitton Sneaker Shoe', 'All sizes available', 'products/1521824169/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:56:09', '2018-03-24 18:17:46', null);
INSERT INTO `products` VALUES ('158', '000116', 'Louis Vuitton Sneaker 001', 'louis-vuitton-sneaker-001', '10', 'Louis Vuitton Sneaker Shoe', 'All sizes available', 'products/1521824219/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:56:59', '2018-03-24 18:19:38', null);
INSERT INTO `products` VALUES ('159', '6764', 'Christian Louboutin 003', 'christian-louboutin-003', '11', 'Christian Louboutin Sneaker Shoe', 'All sizes available', 'products/1521824247/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:57:27', '2018-03-24 18:21:46', null);
INSERT INTO `products` VALUES ('160', '000117', 'Louis Vuitton Leather', 'louis-vuitton-leather', '10', 'Louis Vuitton Leather Shoe', 'All sizes available', 'products/1521824275/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:57:55', '2018-03-24 18:23:57', null);
INSERT INTO `products` VALUES ('161', '000118', 'Balenciaga 001', 'balenciaga-001', '10', 'Balenciaga Shoe', 'All sizes available', 'products/1521824337/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:58:43', '2018-03-24 18:27:03', null);
INSERT INTO `products` VALUES ('162', '000119', 'Balenciaga 002', 'balenciaga-002', '10', 'Balenciaga Shoe', 'All sizes available', 'products/1521824358/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:59:18', '2018-03-24 18:28:32', null);
INSERT INTO `products` VALUES ('163', '000120', 'Christian Louboutin 004', 'christian-louboutin-004', '10', 'Christian Louboutin Shoe', 'All sizes available', 'products/1521824385/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 01:59:45', '2018-03-24 18:31:10', null);
INSERT INTO `products` VALUES ('164', '000122', 'Louis Vuitton 008', 'louis-vuitton-008', '10', 'Louis Vuitton Shoe', 'All sizes available', 'products/1521824407/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 02:00:07', '2018-03-24 18:40:15', null);
INSERT INTO `products` VALUES ('165', '000121', 'Louis Vuitton 007', 'louis-vuitton-007', '10', 'Louis Vuitton Shoe', 'All sizes available', 'products/1521824430/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 02:00:30', '2018-03-24 18:35:06', null);
INSERT INTO `products` VALUES ('166', '453563', '544', '544', '12', '44', null, 'products/1521824449/cover.png', null, '444', '4666.00', null, '0', null, null, null, null, null, '0.00', null, '2018-03-24 02:00:49', '2018-03-24 18:11:49', '2018-03-24 18:11:49');
INSERT INTO `products` VALUES ('168', '000123', 'Valentino', 'valentino', '10', 'Valentino Shoe', 'All sizes available', 'products/1521824551/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 02:02:31', '2018-03-24 18:42:33', null);
INSERT INTO `products` VALUES ('169', '000124', 'Louis Vuitton 009', 'louis-vuitton-009', '10', 'Louis Vuitton Shoe', 'All sizes available', 'products/1521886077/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 19:07:57', '2018-03-24 19:07:57', null);
INSERT INTO `products` VALUES ('170', '000126', 'Thom Browne', 'thom-browne', '10', 'Thom Browne Shoe', 'All sizes available', 'products/1521886856/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 19:20:56', '2018-03-24 19:20:56', null);
INSERT INTO `products` VALUES ('171', '000125', 'Thom Browne 001', 'thom-browne-001', '10', 'Thom Browne Shoe', 'All sizes available', 'products/1521886923/cover.png', null, '100', '38000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-24 19:22:03', '2018-03-24 19:22:52', '2018-03-24 19:22:52');
INSERT INTO `products` VALUES ('172', '000127', 'Samsung S8', 'samsung-s8', '12', 'Android Samsung Smart Phone', 'http://www.samsung.com/global/galaxy/galaxy-s8/', 'products/1523115971/cover.png', null, '99', '280000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-25 00:02:05', '2018-07-29 06:12:43', null);
INSERT INTO `products` VALUES ('173', '000128', 'Bead 011', 'bead-011', '11', 'Bead for every occassion', null, 'products/1521960144/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-25 15:42:24', '2018-03-25 15:42:24', null);
INSERT INTO `products` VALUES ('174', '000130', 'Bead 012', 'bead-012', '11', 'Bead for every occasion', null, 'products/1521960254/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-25 15:44:14', '2018-03-26 05:25:24', null);
INSERT INTO `products` VALUES ('175', '000131', 'Bead 013', 'bead-013', '11', 'Bead for every occasion', null, 'products/1521960605/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-25 15:50:05', '2018-03-26 05:24:57', null);
INSERT INTO `products` VALUES ('176', '000132', 'Bead 0010', 'bead-0010', '11', 'Bead for every occasion', null, 'products/1522138412/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-27 16:55:55', '2018-03-27 17:13:32', null);
INSERT INTO `products` VALUES ('177', '000133', 'Bead 0011', 'bead-0011', '11', 'Bead for every ocassion', null, 'products/1522138504/cover.png', null, '100', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-27 16:58:47', '2018-03-27 17:15:04', null);
INSERT INTO `products` VALUES ('178', '000135', 'Bead 015', 'bead-015', '11', 'Bead for every  ocasssion', null, 'products/1522139067/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-03-27 17:24:27', '2018-03-27 17:24:27', null);
INSERT INTO `products` VALUES ('179', '000136', 'John Foster', 'john-foster', '16', 'John Foster shoe', 'Size 41 to 45 Available', 'products/1522570780/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:19:40', '2018-04-01 17:19:40', null);
INSERT INTO `products` VALUES ('180', '000137', 'John Foster 001', 'john-foster-001', '16', 'John Foster shoe', 'Size 41 to 45 available', 'products/1522570898/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:21:38', '2018-04-01 17:21:38', null);
INSERT INTO `products` VALUES ('181', '000138', 'John Foster 002', 'john-foster-002', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522570984/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:23:04', '2018-04-01 17:23:04', null);
INSERT INTO `products` VALUES ('182', '000138', 'John Foster 003', 'john-foster-003', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571088/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:24:48', '2018-04-01 17:25:35', null);
INSERT INTO `products` VALUES ('183', '000139', 'John Foster 004', 'john-foster-004', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571401/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:30:01', '2018-04-01 17:30:01', null);
INSERT INTO `products` VALUES ('184', '000140', 'John Foster 005', 'john-foster-005', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571551/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:32:32', '2018-04-01 17:32:32', null);
INSERT INTO `products` VALUES ('185', '000141', 'John Foster 007', 'john-foster-007', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571633/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:33:53', '2018-04-01 17:33:53', null);
INSERT INTO `products` VALUES ('186', '000142', 'John Foster 008', 'john-foster-008', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571730/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:35:30', '2018-04-01 17:35:30', null);
INSERT INTO `products` VALUES ('187', '000143', 'John Foster 009', 'john-foster-009', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522571826/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:37:06', '2018-04-01 17:37:06', null);
INSERT INTO `products` VALUES ('188', '000144', 'John Foster 010', 'john-foster-010', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572025/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:40:25', '2018-04-01 17:40:25', null);
INSERT INTO `products` VALUES ('189', '000145', 'John Foster 011', 'john-foster-011', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572103/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:41:43', '2018-04-01 17:41:43', null);
INSERT INTO `products` VALUES ('190', '000146', 'John Foster 012', 'john-foster-012', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572234/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:43:54', '2018-04-01 17:43:54', null);
INSERT INTO `products` VALUES ('191', '000147', 'John Foster 013', 'john-foster-013', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572340/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:45:40', '2018-04-01 17:45:40', null);
INSERT INTO `products` VALUES ('192', '000148', 'John Foster 014', 'john-foster-014', '16', 'John Foster shoe', 'size 41 to 45 avaialble', 'products/1522572438/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:47:18', '2018-04-01 17:47:18', null);
INSERT INTO `products` VALUES ('193', '000149', 'John Foster 015', 'john-foster-015', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572550/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:49:10', '2018-04-01 17:49:10', null);
INSERT INTO `products` VALUES ('194', '000150', 'John Foster 016', 'john-foster-016', '16', 'John Foster shoe', 'size 41 to 45 avaialable', 'products/1522572625/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:50:25', '2018-04-01 17:50:25', null);
INSERT INTO `products` VALUES ('195', '000151', 'John Foster 017', 'john-foster-017', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572732/cover.png', null, '100', '20000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:52:12', '2018-04-01 17:52:12', null);
INSERT INTO `products` VALUES ('196', '000152', 'John Foster 018', 'john-foster-018', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522572816/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 17:53:36', '2018-04-01 17:53:36', null);
INSERT INTO `products` VALUES ('197', '000153', 'John Foster 019', 'john-foster-019', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573351/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:01:22', '2018-04-01 18:02:31', null);
INSERT INTO `products` VALUES ('198', '000154', 'John Foster 021', 'john-foster-021', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573429/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:03:49', '2018-04-01 18:03:49', null);
INSERT INTO `products` VALUES ('199', '000155', 'John Foster 022', 'john-foster-022', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573511/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:05:11', '2018-04-01 18:05:11', null);
INSERT INTO `products` VALUES ('200', '000156', 'John Foster 023', 'john-foster-023', '16', 'John Foster shoe', 'size 41 to 45 avaialable', 'products/1522573588/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:06:28', '2018-04-01 18:06:28', null);
INSERT INTO `products` VALUES ('201', '000157', 'John Foster 024', 'john-foster-024', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573707/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:08:27', '2018-04-01 18:08:27', null);
INSERT INTO `products` VALUES ('202', '000158', 'John Foster 025', 'john-foster-025', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573800/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:10:00', '2018-04-01 18:10:00', null);
INSERT INTO `products` VALUES ('203', '000159', 'John Foster 026', 'john-foster-026', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573896/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:11:37', '2018-04-01 18:11:37', null);
INSERT INTO `products` VALUES ('204', '000160', 'John Foster 027', 'john-foster-027', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522573981/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:13:01', '2018-04-01 18:13:01', null);
INSERT INTO `products` VALUES ('205', '000161', 'John Foster 028', 'john-foster-028', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574063/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:14:23', '2018-04-01 18:14:23', null);
INSERT INTO `products` VALUES ('206', '000162', 'John Foster 029', 'john-foster-029', '16', 'John Foster shoe', 'size 41 to 45 avaialable', 'products/1522574155/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:15:55', '2018-04-01 18:15:55', null);
INSERT INTO `products` VALUES ('207', '000163', 'John Foster 030', 'john-foster-030', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574226/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:17:06', '2018-04-01 18:17:06', null);
INSERT INTO `products` VALUES ('208', '000164', 'John Foster 031', 'john-foster-031', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574308/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:18:28', '2018-04-01 18:18:28', null);
INSERT INTO `products` VALUES ('209', '000165', 'John Foster 032', 'john-foster-032', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574407/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:20:07', '2018-04-01 18:20:07', null);
INSERT INTO `products` VALUES ('210', '000166', 'John Foster 033', 'john-foster-033', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574599/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:23:19', '2018-04-01 18:23:19', null);
INSERT INTO `products` VALUES ('211', '000167', 'John Foster 034', 'john-foster-034', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574720/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:25:20', '2018-04-01 18:25:20', null);
INSERT INTO `products` VALUES ('212', '000168', 'John Foster 035', 'john-foster-035', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574839/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:27:19', '2018-04-20 00:24:47', null);
INSERT INTO `products` VALUES ('213', '000169', 'John Foster 036', 'john-foster-036', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522574935/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:28:55', '2018-04-01 18:28:55', null);
INSERT INTO `products` VALUES ('214', '000170', 'John Foster 037', 'john-foster-037', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575022/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:30:22', '2018-04-01 18:30:22', null);
INSERT INTO `products` VALUES ('215', '000172', 'John Foster 038', 'john-foster-038', '16', 'John Foster shoe', 'size 41 to 45 availabe', 'products/1522575244/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:34:04', '2018-04-01 18:34:04', null);
INSERT INTO `products` VALUES ('216', '000173', 'John Foster 039', 'john-foster-039', '16', 'John Foster shoe', 'size 41 to 45 avaialable', 'products/1522575352/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:35:52', '2018-04-01 18:35:52', null);
INSERT INTO `products` VALUES ('217', '000174', 'John Foster 040', 'john-foster-040', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575524/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:38:44', '2018-04-01 18:38:44', null);
INSERT INTO `products` VALUES ('218', '000175', 'John Foster 041', 'john-foster-041', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575601/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:40:01', '2018-04-01 18:40:01', null);
INSERT INTO `products` VALUES ('219', '000176', 'John Foster 042', 'john-foster-042', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575726/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:42:06', '2018-04-01 18:42:06', null);
INSERT INTO `products` VALUES ('220', '000177', 'John Foster 043', 'john-foster-043', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575802/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:43:22', '2018-04-01 18:43:22', null);
INSERT INTO `products` VALUES ('221', '000178', 'John Foster 044', 'john-foster-044', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522575886/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:44:46', '2018-04-01 18:44:46', null);
INSERT INTO `products` VALUES ('222', '000179', 'John Foster 045', 'john-foster-045', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576005/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:46:45', '2018-04-01 18:46:45', null);
INSERT INTO `products` VALUES ('223', '000180', 'John Foster 046', 'john-foster-046', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576098/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:48:18', '2018-04-01 18:48:18', null);
INSERT INTO `products` VALUES ('224', '000181', 'John Foster 047', 'john-foster-047', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576243/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:50:43', '2018-04-01 18:50:43', null);
INSERT INTO `products` VALUES ('225', '000182', 'John Foster 048', 'john-foster-048', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576331/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:52:11', '2018-04-01 18:52:11', null);
INSERT INTO `products` VALUES ('226', '000183', 'John Foster 049', 'john-foster-049', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576496/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:54:56', '2018-04-01 18:54:56', null);
INSERT INTO `products` VALUES ('227', '000184', 'John Foster 050', 'john-foster-050', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576570/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:56:10', '2018-04-01 18:56:10', null);
INSERT INTO `products` VALUES ('228', '000185', 'John Foster 051', 'john-foster-051', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576694/cover.png', null, '99', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 18:58:14', '2018-04-09 07:25:38', null);
INSERT INTO `products` VALUES ('229', '000186', 'John Foster 052', 'john-foster-052', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576811/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:00:11', '2018-04-01 19:00:11', null);
INSERT INTO `products` VALUES ('230', '000187', 'John Foster 053', 'john-foster-053', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522576921/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:02:01', '2018-04-01 19:02:01', null);
INSERT INTO `products` VALUES ('231', '000188', 'John Foster 054', 'john-foster-054', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522577119/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:05:19', '2018-04-01 19:05:19', null);
INSERT INTO `products` VALUES ('232', '000189', 'John Foster 055', 'john-foster-055', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522577258/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:07:38', '2018-04-01 19:07:38', null);
INSERT INTO `products` VALUES ('233', '000190', 'Sulphur wide heels', 'sulphur-wide-heels', '17', 'Sulphur wide fit point heels', 'UK size 5', 'products/1522577851/cover.png', null, '100', '12500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:12:26', '2018-04-01 20:10:48', null);
INSERT INTO `products` VALUES ('234', '000191', 'John Foster 057', 'john-foster-057', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522578002/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:20:02', '2018-04-01 19:20:02', null);
INSERT INTO `products` VALUES ('235', '000192', 'John Foster 058', 'john-foster-058', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522579486/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:44:47', '2018-04-01 19:44:47', null);
INSERT INTO `products` VALUES ('236', '000193', 'John Foster 059', 'john-foster-059', '16', 'John Foster shoe', 'size 41 to 45 avaialable', 'products/1522579643/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:47:23', '2018-04-01 19:47:23', null);
INSERT INTO `products` VALUES ('237', '000194', 'John Foster 060', 'john-foster-060', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522579716/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:48:36', '2018-04-01 19:48:36', null);
INSERT INTO `products` VALUES ('238', '000195', 'John Foster 061', 'john-foster-061', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522579815/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:50:15', '2018-04-01 19:50:15', null);
INSERT INTO `products` VALUES ('239', '000196', 'John Foster 062', 'john-foster-062', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522579926/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:52:06', '2018-04-01 19:52:06', null);
INSERT INTO `products` VALUES ('240', '000197', 'John Foster 063', 'john-foster-063', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522580035/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:53:55', '2018-04-01 19:53:55', null);
INSERT INTO `products` VALUES ('241', '000198', 'John Foster 064', 'john-foster-064', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522580119/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 19:55:19', '2018-04-01 19:55:19', null);
INSERT INTO `products` VALUES ('242', '000199', 'John Foster 065', 'john-foster-065', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522580494/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:01:34', '2018-04-01 20:01:34', null);
INSERT INTO `products` VALUES ('243', '000200', 'John Foster 066', 'john-foster-066', '16', 'John Foster shoe', 'size 41 to 45 is available', 'products/1522581152/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:12:32', '2018-04-01 20:12:32', null);
INSERT INTO `products` VALUES ('244', '000201', 'John Foster 067', 'john-foster-067', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522581263/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:14:23', '2018-04-01 20:14:23', null);
INSERT INTO `products` VALUES ('245', '000202', 'John Foster 068', 'john-foster-068', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522581435/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:17:15', '2018-04-01 20:17:15', null);
INSERT INTO `products` VALUES ('246', '000203', 'John Foster 069', 'john-foster-069', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522581536/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:18:56', '2018-04-01 20:18:56', null);
INSERT INTO `products` VALUES ('247', '000204', 'John Foster 070', 'john-foster-070', '16', 'John Foster shoe', 'size 41 to 42 available', 'products/1522581757/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:22:37', '2018-04-01 20:22:37', null);
INSERT INTO `products` VALUES ('248', '000205', 'John Foster 071', 'john-foster-071', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522581842/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:24:02', '2018-04-01 20:24:02', null);
INSERT INTO `products` VALUES ('249', '000206', 'John Foster 072', 'john-foster-072', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522581943/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:25:43', '2018-04-01 20:25:43', null);
INSERT INTO `products` VALUES ('250', '000207', 'John Foster 073', 'john-foster-073', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582137/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:28:57', '2018-04-01 20:28:57', null);
INSERT INTO `products` VALUES ('251', '000208', 'John Foster 074', 'john-foster-074', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582219/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:30:19', '2018-04-01 20:30:19', null);
INSERT INTO `products` VALUES ('252', '000209', 'John Foster 075', 'john-foster-075', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582320/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:32:00', '2018-04-01 20:32:00', null);
INSERT INTO `products` VALUES ('253', '000210', 'John Foster 076', 'john-foster-076', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582413/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:33:33', '2018-04-01 20:33:33', null);
INSERT INTO `products` VALUES ('254', '000211', 'John Foster 077', 'john-foster-077', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582528/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:35:28', '2018-04-01 20:35:28', null);
INSERT INTO `products` VALUES ('255', '00212', 'John Foster 078', 'john-foster-078', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582619/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:36:59', '2018-04-01 20:36:59', null);
INSERT INTO `products` VALUES ('256', '000212', 'John Foster 079', 'john-foster-079', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582705/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:38:25', '2018-04-01 20:38:25', null);
INSERT INTO `products` VALUES ('257', '000213', 'John Foster 80', 'john-foster-80', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522582790/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-01 20:39:50', '2018-04-01 20:39:50', null);
INSERT INTO `products` VALUES ('258', '000214', 'John Foster 081', 'john-foster-081', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522604617/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 02:43:37', '2018-04-02 02:43:37', null);
INSERT INTO `products` VALUES ('259', '000215', 'Soulful  heel', 'soulful-heel', '16', 'Soulful wide fit mid heel Lady shoe', 'size 7 & 8 UK available', 'products/1522605109/cover.png', null, '100', '13000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 02:46:15', '2018-04-02 02:51:49', null);
INSERT INTO `products` VALUES ('260', '000216', 'John Foster 083', 'john-foster-083', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522605245/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 02:54:05', '2018-04-02 02:54:05', null);
INSERT INTO `products` VALUES ('261', '000217', 'John Foster 84', 'john-foster-84', '16', 'John Foster shoe', 'size 41 to 45 available', 'products/1522605352/cover.png', null, '100', '26000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 02:55:52', '2018-04-02 02:55:52', null);
INSERT INTO `products` VALUES ('262', '000218', '6 in 1 Studs', '6-in-1-studs', '17', '6 in 1 studs  ear ring', null, 'products/1522605656/cover.png', null, '100', '2000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 02:59:16', '2018-04-02 03:00:56', null);
INSERT INTO `products` VALUES ('263', '000219', 'Chatties Flat', 'chatties-flat', '17', 'Chatties Flat shoe', 'Size 41 available', 'products/1522606239/cover.png', null, '100', '6000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:10:39', '2018-04-02 03:10:39', null);
INSERT INTO `products` VALUES ('264', '000220', 'Court Shoe', 'court-shoe', '17', 'Court Shoe', 'Size 39 & 40 available', 'products/1522606967/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:22:47', '2018-04-25 22:40:53', null);
INSERT INTO `products` VALUES ('265', '000221', 'Earrings', 'earrings', '17', 'Earrings', null, 'products/1522607167/cover.png', null, '100', '2000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:26:07', '2018-04-02 03:26:07', null);
INSERT INTO `products` VALUES ('266', '000222', 'Head over heels', 'head-over-heels', '17', 'Head over heels by Dunes', 'size 41 available', 'products/1522607412/cover.png', null, '100', '17500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:30:12', '2018-04-02 03:30:12', null);
INSERT INTO `products` VALUES ('267', '000223', 'High Waist Jeans size 12 10 5500.fw.png', 'high-waist-jeans-size-12-10-5500fwpng', '17', 'High Waist Jeans', 'Size 10 & 12 UK Available', 'products/1522607785/cover.png', null, '100', '6000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:36:25', '2018-04-02 03:36:25', null);
INSERT INTO `products` VALUES ('268', '000224', 'Primark  Bag', 'primark-bag', '17', 'Primark  Bag', 'Dark Green Primark  Bag', 'products/1522608077/cover.png', null, '100', '13000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:41:17', '2018-04-02 03:41:17', null);
INSERT INTO `products` VALUES ('269', '000225', 'Sexy Body Cons', 'sexy-body-cons', '17', 'Sexy Body Cons one size fits all', 'Sexy Body Cons one size fits all red and black available', 'products/1522608263/cover.png', null, '100', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:44:23', '2018-04-02 03:44:23', null);
INSERT INTO `products` VALUES ('270', '000226', 'Sulphur Cone Heels', 'sulphur-cone-heels', '17', 'Sulphur Cone Heels  Shoe', 'Sulphur Cone Heels', 'products/1522608675/cover.png', null, '100', '13000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:51:15', '2018-04-02 03:51:15', null);
INSERT INTO `products` VALUES ('271', '000227', 'Vintage Side Bag', 'vintage-side-bag', '17', 'Vintage Side Bag', 'Different colors available', 'products/1522608987/cover.png', null, '100', '4000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 03:56:30', '2018-04-02 03:56:30', null);
INSERT INTO `products` VALUES ('272', '000228', 'Loafer', 'loafer', '18', 'Women Loafer', 'Size 11 to 13 (US) Available', 'products/1522609448/cover.png', null, '100', '13000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:04:08', '2018-04-02 04:04:08', null);
INSERT INTO `products` VALUES ('273', '000229', 'Foldable Dolly Shoe', 'foldable-dolly-shoe', '18', 'Foldable Dolly Shoe', 'Size 11 to 13 Available', 'products/1522609836/cover.png', null, '100', '8500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:10:37', '2018-04-25 22:37:15', null);
INSERT INTO `products` VALUES ('274', '000230', 'Low Heel', 'low-heel', '18', 'Low Heel Shoe', 'US Size 37 to 41', 'products/1522610082/cover.png', null, '100', '9000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:14:42', '2018-04-02 04:14:42', null);
INSERT INTO `products` VALUES ('275', '000231', 'Rhinestone Liliana Sandal', 'rhinestone-liliana-sandal', '18', 'Rhinestone Liliana Ankle Strap Sandal', null, 'products/1522610911/cover.png', null, '100', '13500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:28:31', '2018-04-02 04:28:31', null);
INSERT INTO `products` VALUES ('276', '000232', 'Liliana Low Block Heel', 'liliana-low-block-heel', '18', 'Liliana Low Block Heel ankle strap  sandal shoe', 'Size  37 to 41 Available', 'products/1522611257/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:34:17', '2018-04-02 04:34:17', null);
INSERT INTO `products` VALUES ('277', '000233', 'Flat T-Strap Slip Rhinestone', 'flat-t-strap-slip-rhinestone', '18', 'Flat T-Strap Slip Rhinestone', null, 'products/1522611604/cover.png', null, '100', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:40:04', '2018-04-02 04:40:04', null);
INSERT INTO `products` VALUES ('278', '000234', 'Lace up Sandal', 'lace-up-sandal', '18', 'Lace up Sandal with frills', 'Size 37 to 41 available', 'products/1522611874/cover.png', null, '100', '8000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:44:34', '2018-04-02 04:44:34', null);
INSERT INTO `products` VALUES ('279', '000235', 'Bamboo Low Heel', 'bamboo-low-heel', '18', 'Bamboo Low Heel mules', 'Size 37 to 41 Available', 'products/1522612169/cover.png', null, '100', '12000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:49:29', '2018-04-02 04:49:29', null);
INSERT INTO `products` VALUES ('280', '000236', 'Qupid Ballet flats', 'qupid-ballet-flats', '18', 'Qupid Ballet flats with floral details Shoe', 'Size 37 to 39 available', 'products/1522612522/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 04:55:22', '2018-04-02 04:55:22', null);
INSERT INTO `products` VALUES ('281', '000237', 'Vans Sneakers', 'vans-sneakers', '18', 'Vans Sneakers shoe', 'SIze 37 to 39 Available', 'products/1522614416/cover.png', null, '100', '9000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 05:26:56', '2018-04-02 05:26:56', null);
INSERT INTO `products` VALUES ('282', '000238', 'GEF Italian 001', 'gef-italian-001', '16', 'GEF Italian Shoe', 'Size 41 to 45 Available', 'products/1522614640/cover.png', null, '100', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 05:30:40', '2018-04-02 05:30:40', null);
INSERT INTO `products` VALUES ('283', '000239', 'GEF Italian 002', 'gef-italian-002', '16', 'GEF Italian shoe', 'size 41 to 45 Available', 'products/1522615119/cover.png', null, '100', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 05:38:39', '2018-04-02 05:38:39', null);
INSERT INTO `products` VALUES ('284', '000240', 'GEF Italian 003', 'gef-italian-003', '16', 'GEF Italian shoe', 'Size 41 to 45 available', 'products/1522615231/cover.png', null, '97', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 05:40:31', '2018-07-29 15:57:12', null);
INSERT INTO `products` VALUES ('285', '000241', 'GEF Italian 004', 'gef-italian-004', '16', 'GEF Italian Shoe', 'Size 41 to 45 Available', 'products/1522615421/cover.png', null, '96', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-02 05:43:41', '2018-07-29 15:56:26', null);
INSERT INTO `products` VALUES ('286', '00242', 'Culture Bed Sheet 6 by 6 with 4 pillow cases', 'culture-bed-sheet-6-by-6-with-4-pillow-cases', '19', 'Culture Bed Sheet 6 by 6 with 4 pillow cases', 'Culture Bed Sheet 6 by 6 with 4 pillow cases', 'products/1523103808/cover.png', null, '10', '5000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 04:21:07', '2018-04-07 21:23:28', null);
INSERT INTO `products` VALUES ('287', '00243', 'Manchester United quality Bed Sheet with 4 pillow case and 1 duvet', 'manchester-united-quality-bed-sheet-with-4-pillow-case-and-1-duvet', '19', 'Manchester United quality Bed Sheet with 4 pillow case and 1 duvet', 'Manchester United quality Bed Sheet with 4 pillow case and 1 duvet', 'products/1523103180/cover.png', null, '10', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 04:28:03', '2018-04-07 21:13:00', null);
INSERT INTO `products` VALUES ('288', '00244', 'Louis Vuitton  6 by 6 Bedsheet with 4 pillow case and 1 duvet', 'louis-vuitton-6-by-6-bedsheet-with-4-pillow-case-and-1-duvet', '19', 'Louis Vuitton  6 by 6 Bed Sheet with 4 pillow case and 1 duvet', 'Louis Vuitton  6 by 6 Bed Sheet with 4 pillow case and 1 duvet', 'products/1523103506/cover.png', null, '9', '15000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 04:30:52', '2018-04-07 21:18:26', null);
INSERT INTO `products` VALUES ('289', '000245', 'Women Wristwatch 001', 'women-wristwatch-001', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849879/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:06:17', '2018-04-04 22:51:19', null);
INSERT INTO `products` VALUES ('290', '000246', 'Women Wristwatch', 'women-wristwatch', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849849/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:11:19', '2018-04-04 22:50:49', null);
INSERT INTO `products` VALUES ('291', '000247', 'Women Wristwatch 003', 'women-wristwatch-003', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849814/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:18:44', '2018-04-04 22:50:14', null);
INSERT INTO `products` VALUES ('292', '000248', 'Women Wristwatch 004', 'women-wristwatch-004', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849770/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:20:10', '2018-04-04 22:49:30', null);
INSERT INTO `products` VALUES ('293', '000249', 'Women Wristwatch 005', 'women-wristwatch-005', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849747/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:24:04', '2018-04-04 22:49:07', null);
INSERT INTO `products` VALUES ('294', '000250', 'Women Wristwatch 006', 'women-wristwatch-006', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849685/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:26:37', '2018-04-04 22:48:05', null);
INSERT INTO `products` VALUES ('295', '000251', 'Women Wristwatch 007', 'women-wristwatch-007', '20', 'Women Casual Fashion Wristwatches', 'Band width...20 mm\r\n\r\nWomen Casual Fashion Wristwatches Silicone Relogio feminino.\r\n\r\nMovement. .Quartz \r\n\r\nStyle. .Fashion and Casual \r\n\r\nCase thickness. ..10 mm\r\n\r\nDial diameter. ..40 mm\r\n\r\nBand length. .22 cm\r\n\r\nCase material. ..Alloy\r\n\r\nCase shape...Round', 'products/1522849666/cover.png', null, '100', '2700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 17:28:10', '2018-04-04 22:47:46', null);
INSERT INTO `products` VALUES ('296', '000252', 'Clutch Purse', 'clutch-purse', '18', 'Clutch purse available in silver', 'Silver Colour', 'products/1522850464/cover.png', null, '99', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:01:04', '2018-07-29 06:11:04', null);
INSERT INTO `products` VALUES ('297', '000253', 'Braided Wig', 'braided-wig', '21', 'Braid 30 inches long', '30 inches long', 'products/1522851442/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:17:22', '2018-04-05 17:55:51', null);
INSERT INTO `products` VALUES ('298', '000254', 'Braided Wig 001', 'braided-wig-001', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852006/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:26:46', '2018-04-05 17:55:34', null);
INSERT INTO `products` VALUES ('299', '000255', 'Braided Wig 003', 'braided-wig-003', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852125/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:28:45', '2018-04-05 17:55:12', null);
INSERT INTO `products` VALUES ('300', '000256', 'Braid Wig 004', 'braid-wig-004', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852209/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:30:09', '2018-04-05 00:41:38', null);
INSERT INTO `products` VALUES ('301', '000257', 'Braided Wig 005', 'braided-wig-005', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852470/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:34:30', '2018-04-05 17:54:42', null);
INSERT INTO `products` VALUES ('302', '000258', 'Braided Wig 006', 'braided-wig-006', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852616/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:36:56', '2018-04-05 17:54:23', null);
INSERT INTO `products` VALUES ('303', '000259', 'Braided Wig 007', 'braided-wig-007', '21', 'Braid 30 inches long', '30 inches long', 'products/1522852728/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:38:48', '2018-04-05 17:53:51', null);
INSERT INTO `products` VALUES ('304', '000260', 'Braided Wig 008', 'braided-wig-008', '21', 'Braid 30 inches long', '30 inches long', 'products/1522853129/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:45:29', '2018-04-05 17:53:38', null);
INSERT INTO `products` VALUES ('305', '000261', 'Braided Wig 009', 'braided-wig-009', '21', 'Braid 30 inches long', '30 inches long', 'products/1522853310/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:48:30', '2018-04-05 17:53:20', null);
INSERT INTO `products` VALUES ('306', '000262', 'Braided Wig 010', 'braided-wig-010', '21', 'Braid 30 inches long', '30 inches long', 'products/1522853470/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-04 23:51:10', '2018-04-05 17:52:59', null);
INSERT INTO `products` VALUES ('307', '000263', 'Braided Wig 011', 'braided-wig-011', '21', 'Braid 30 inches long', '30 inches long', 'products/1522854448/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 00:07:28', '2018-04-05 17:52:29', null);
INSERT INTO `products` VALUES ('308', '000264', 'Braided Wig 012', 'braided-wig-012', '21', 'Braid 30 inches long', '30 inches long', 'products/1522854605/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 00:10:05', '2018-04-05 17:52:10', null);
INSERT INTO `products` VALUES ('309', '000265', 'Braided Wig 013', 'braided-wig-013', '21', 'Braid 30 inches long', '30 inches long', 'products/1522855361/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 00:22:41', '2018-04-05 17:51:54', null);
INSERT INTO `products` VALUES ('310', '000267', 'Braided Wig 014', 'braided-wig-014', '21', 'Braid 30 inches long', '30 inches long', 'products/1522857116/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 00:51:56', '2018-04-05 17:51:35', null);
INSERT INTO `products` VALUES ('311', '000268', 'Braided Wig 015', 'braided-wig-015', '21', 'Braid 30 inches long', '30 inches long', 'products/1522857720/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 01:02:00', '2018-04-05 17:50:52', null);
INSERT INTO `products` VALUES ('312', '000269', 'Braided Wig 016', 'braided-wig-016', '21', 'Braid 30 inches long', '30 inches long', 'products/1522857810/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 01:03:30', '2018-04-05 17:50:39', null);
INSERT INTO `products` VALUES ('313', '000270', 'Braided Wig 017', 'braided-wig-017', '21', 'Braid 30 inches long', '30 inches long', 'products/1522918761/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 17:58:30', '2018-04-05 17:59:21', null);
INSERT INTO `products` VALUES ('314', '000271', 'Braided Wig 018', 'braided-wig-018', '21', 'Braid 30 inches long', '30 inches long', 'products/1522918855/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:00:56', '2018-04-05 18:00:56', null);
INSERT INTO `products` VALUES ('315', '000272', 'Braided Wig 019', 'braided-wig-019', '21', 'Braid 30 inches long', '30 inches long', 'products/1522919052/cover.png', null, '99', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:03:20', '2018-04-07 11:35:53', null);
INSERT INTO `products` VALUES ('316', '000273', 'Braided Wig 020', 'braided-wig-020', '21', 'Braid 30 inches long', '30 inches long', 'products/1522919144/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:05:44', '2018-04-05 18:05:44', null);
INSERT INTO `products` VALUES ('317', '000274', 'Braided Wig 021', 'braided-wig-021', '21', 'Braid 30 inches long', '30 inches long', 'products/1522919226/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:07:06', '2018-04-05 18:07:06', null);
INSERT INTO `products` VALUES ('318', '000275', 'Braided Wig 022', 'braided-wig-022', '21', 'Braid 30 inches long', '30 inches long', 'products/1522919316/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:08:36', '2018-04-05 18:08:36', null);
INSERT INTO `products` VALUES ('319', '000276', 'Braided Wig 023', 'braided-wig-023', '21', 'Braid 30 inches long', '30 inches long', 'products/1522919455/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-05 18:10:55', '2018-04-05 18:12:15', '2018-04-05 18:12:15');
INSERT INTO `products` VALUES ('320', '000276', 'Bead 016', 'bead-016', '11', 'Bead for all occasions', null, 'products/1523011666/cover.png', null, '100', '35700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 19:47:46', '2018-04-06 19:47:46', null);
INSERT INTO `products` VALUES ('321', '000277', 'Bead 017', 'bead-017', '11', 'Bead for all occassions', null, 'products/1523012265/cover.png', null, '100', '10200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 19:57:45', '2018-04-06 19:57:45', null);
INSERT INTO `products` VALUES ('322', '000278', 'Bead 018', 'bead-018', '11', 'Bead for all occasions', null, 'products/1523012340/cover.png', null, '100', '15200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 19:59:00', '2018-04-06 19:59:00', null);
INSERT INTO `products` VALUES ('323', '000279', 'Bead 019', 'bead-019', '11', 'Bead for all occassions', null, 'products/1523012433/cover.png', null, '100', '20500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 20:00:33', '2018-04-06 20:00:33', null);
INSERT INTO `products` VALUES ('324', '000280', 'original Chanel Slipper', 'original-chanel-slipper', '22', 'original Chanel Slippers shoe', 'Size 9', 'products/1523015502/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 20:51:42', '2018-04-06 20:56:17', null);
INSERT INTO `products` VALUES ('325', '000281', 'original Chanel Sandal 001', 'original-chanel-sandal-001', '22', 'original Chanel Slippers', 'Size 10 Available', 'products/1523015742/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 20:55:42', '2018-04-06 21:17:01', null);
INSERT INTO `products` VALUES ('326', '000282', 'Original Chanel Slipper 002', 'original-chanel-slipper-002', '22', 'Original Chanel Slippers', 'Size 10', 'products/1523015912/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 20:58:32', '2018-04-06 20:58:32', null);
INSERT INTO `products` VALUES ('327', '000283', 'Original Chanel Slipper 003', 'original-chanel-slipper-003', '22', 'Original Chanel Slippers', 'Size 38', 'products/1523016053/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:00:53', '2018-04-06 21:01:40', null);
INSERT INTO `products` VALUES ('328', '000284', 'Original Y & O Collection Sandal', 'original-y-o-collection-sandal', '22', 'Original Y & O Collection Sandals', 'Size 40', 'products/1523016204/cover.png', null, '100', '3700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:03:24', '2018-04-06 21:04:32', null);
INSERT INTO `products` VALUES ('329', '000285', 'Original Chanel Slipper 005', 'original-chanel-slipper-005', '22', 'Original Chanel Slippers', 'Size 8', 'products/1523016373/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:06:13', '2018-04-06 21:06:57', null);
INSERT INTO `products` VALUES ('330', '000286', 'Original Chanel Slipper 006', 'original-chanel-slipper-006', '22', 'Original Chanel Slippers', 'Size 40', 'products/1523016756/cover.png', null, '100', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:12:36', '2018-04-06 21:13:16', null);
INSERT INTO `products` VALUES ('331', '000287', 'Original Chanel Sandal', 'original-chanel-sandal', '22', 'Original Chanel Sandals', 'Size 9', 'products/1523016973/cover.png', null, '97', '4700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:16:13', '2018-04-07 11:38:04', null);
INSERT INTO `products` VALUES ('332', '000288', 'Original Y & O Collection 001', 'original-y-o-collection-001', '22', 'Original Y & O Collection', 'Size 38', 'products/1523017204/cover.png', null, '100', '3700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:19:38', '2018-04-06 21:21:29', null);
INSERT INTO `products` VALUES ('333', '000289', 'Original Y & O Collection 002', 'original-y-o-collection-002', '22', 'Original Y & O Collection. Size 38 #3500', 'Original Y & O Collection. Size 38 #3500', 'products/1523017357/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-06 21:22:37', '2018-04-06 21:22:51', '2018-04-06 21:22:51');
INSERT INTO `products` VALUES ('336', '000289', 'Tecno-camon-cx-air', 'tecno-camon-cx-air', '12', 'tecno-camon-cx-air android phone', 'TECNO Camon CX Air\r\nTECNO Camon CX Air was released after a hyped series of ads and wait. Initially we expected this phone to be named the Camon 10, given its predecessors bore the Camon prefix and a number, like the Camon 9 and Camon 7. That really was a nice twist from TECNO not to be so predictable. All the same, the X is still 10, in Roman Numbering. Enough said. This however is the review for the CX Air, the lite version of the CX.\r\n\r\nDesign and Build\r\nThe  Tecno camon CX Air features a build that is same to the CX’s, of course. It has a full metal body design which if you ask me looks really good on the CX Air. Comes with a fingerprint sensor at the back which is placed right above the TECNO branding that looks really nice when viewed from different angles. Almost at the bottom of the phone is a Camon brand too. The primary camera sits at sits top left corner with the Qual LED flash right beneath it. It is quite thin and rather light too. Its front part has this circle at the top bezel which we shall talk about. The design is the best from TECNO ever since. At least in my opinion.\r\n\r\n \r\n\r\nDisplay\r\n\r\nOkay, I’ll keep saying this in every step of this review. This is TECNO’s best phone ever, yet. At 5.5 inches the 720 x 1280 pixels resolution on this phone which is lower than the CX’s but still, does a great job in color representation, visibility and viewing angles too. It is of course better looking than previous displays we may have seen from earlier TECNO phones. It is protected with a 2D display glass with Gorilla Glass. I love how TECNO hasn’t lost a lot with the  Tecno camon CX Air’s display with comparison to the CX. Unless you see them side by side, you may not see the difference. \r\n\r\nCamera\r\nThis Air’s camera, selfie camera is also its main selling point. A keep observer would note that the ‘O’ on Camon is a camera shutter. That alone should say it all. One surely can’t miss seeing CX’s 13 MP front facing camera. The selfie picture samples I have seen and taken using the CX are still outstanding just like in the CX! My quick question here again, how many times will you get a good 13 MP Selfie camera this good? And at this price?\r\n\r\nIts primary camera is yet another 13 MP shooter with a LED flash. Although the main camera focus for the both the CX’s is on the selfie camera, the primary one is also a detailed and decent shooter on the Air.\r\n\r\nPerformance and Memory\r\nThe CX comes with a 1.25GHz quad-core Mediatek MT6737 CPU, 16 GB of internal memory which can be expanded up to 128 GB using an SD card runs on 2GB of RAM and ships with Android Nougat 7.0 with TECNO’s HiOS version 2.0 skin. \r\n\r\nBattery\r\nThe Tecno Camon CX air packs a 3200 mAh battery just like the CX which is 200mAh improvement from its predecessor the C9. More power packed with the CX Air and you should last a full day of usage here. It also supports quick charging. I also love have TECNO chose not to sacrifice the battery capacity with the CX Air.\r\n\r\n \r\n\r\n \r\n\r\nSound\r\n\r\nAll TECNO phones have a loud and audible loud speaker. The case is the same with the CX. It has 3.5mm jack and quality of calls is also great. Its speakers just like the CX’s are on the bottom part of the phone.\r\n\r\n \r\n\r\nThis is TECNO’s best phone ever, yet. After reviewing it I’m tempted to declare the Camon series TECNO’s flagship line except for, it is the only mid-high end line TECNO has. It is a good solid phone that’s nailed it on its design and its main selling point, the camera.\r\n\r\nIt comes in four colors Gold, Elegant Blue, Grey and ahem! Rose Gold.', 'products/1523116270/cover.png', null, '94', '45700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-08 00:51:10', '2018-07-29 04:48:00', null);
INSERT INTO `products` VALUES ('337', '000290', 'Tecno-camon-cm', 'tecno-camon-cm', '12', 'tecno-camon-cm android phone', 'Tecno Camon CM Key features\r\nOS: Android 7.0 Nougat with HiOS 2.0\r\nSIM Type: Dual SIM (Micro)\r\n4G LTE: YES, LTE\r\nScreen Size : 5.7 Inches HD IPS Touchscreen\r\nScreen Resolution: 720 x 1440 pixels (364 PPI)\r\nProcessor Type: Quad-core 1.25 GHz Cortex, Mediatek chipset\r\nRAM: 2GB\r\nInternal Storage: 16GB.\r\nExternal Storage: microSD, up to 128GB\r\nBack / Rear Camera: 13MP camera & LED Flash\r\nFront Camera: 13MP with LED flash\r\nBattery: 3000 mAh (non-removable)', 'products/1523116419/cover.png', null, '100', '4900.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-08 00:53:39', '2018-04-08 00:59:03', null);
INSERT INTO `products` VALUES ('338', '000291', 'Diaper Bag set', 'diaper-bag-set', '23', 'Children bag,\r\nDiaper Bag set', '1 Big size tote bag 1 Small size tote bag A thermal bottle holder A Changing Mat', 'products/1523288903/cover.png', null, '100', '8700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 00:42:38', '2018-04-11 00:42:08', null);
INSERT INTO `products` VALUES ('339', '000292', 'Polka Stripe Cotton Children dress', 'polka-stripe-cotton-children-dress', '23', 'Children Dress,\r\nGirls Love to Dress up, stylish and Comfortable.\r\nThis Short sleeve dress is with 100% Cotton Lining that will soothe the skin of your Adorable.\r\nMade from Cotton mixed with Satin for Durability and Comfort.\r\nPerfect for All Occasion\r\nHidden Back zip, Back belt for perfect fit\r\nEasy Wash', 'sizes: 2, 3,5 yrs', 'products/1523289539/cover.png', null, '100', '7200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 00:58:59', '2018-04-10 01:29:41', null);
INSERT INTO `products` VALUES ('340', '000293', 'Glittery pearly band ball dress', 'glittery-pearly-band-ball-dress', '23', 'Children Wear \r\nThis Beautiful Elegant Chic Ball Gown Is Perfect for Weddings, Graduation, Family Photoshoot and All Occasion.\r\nIts Made from Mesh Glittery Fabric  \r\n A Gathered and Pearly Band for Waistline Definition.\r\n Your Adorable Cant Go Wrong In This Outfit', 'Sizes; 4, 5, 6 7, 8, 10\r\nColour is Cream & Silver Glitters', 'products/1523289782/cover.png', null, '100', '7500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 01:03:02', '2018-04-21 20:19:52', null);
INSERT INTO `products` VALUES ('341', '000294', 'Polka Stripe Cotton Dress', 'polka-stripe-cotton-dress', '23', 'Children Dress,\r\nGirls Love to Dress up, stylish and Comfortable.\r\nThis Short sleeve dress is with 100% Cotton Lining that will soothe the skin of your Adorable.\r\nMade from Cotton mixed with Satin for Durability and Comfort.\r\nPerfect for All Occasion\r\nHidden Back zip, Back belt for perfect fit\r\nEasy Wash', 'sizes: 2, 3,5 yrs', 'products/1523291789/cover.png', null, '100', '7200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 01:36:29', '2018-04-10 01:36:29', null);
INSERT INTO `products` VALUES ('342', '000295', 'Floral Navy Children Dress', 'floral-navy-children-dress', '23', 'An All Occasion Dress for your Adorable\r\n.Cotton Lining  to soothe all skin types for all weather\r\nBig Bow across Chest.\r\nHidden Zip.\r\nEasy Wash Due to Fabric\r\n N.B: Shantung  is a type of   with irregular surface, best fabric for bridal outfits', 'Sizes: 4, 5yrs', 'products/1523292507/cover.png', null, '100', '6700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 01:48:27', '2018-04-10 01:48:27', null);
INSERT INTO `products` VALUES ('343', '000296', 'Frozen 14 inches backpack for girls', 'frozen-14-inches-backpack-for-girls', '23', 'Children bag\r\nMade of Jute and EVA(Elastic Polymer material) which has excellent toughness that is eco friendly.\r\nInsulated and partitions for books and pencils\r\nSide mesh for water bottles\r\nPerfect for a whole session', 'Dimension : 38*29*14', 'products/1523292895/cover.png', null, '100', '5000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 01:54:55', '2018-04-10 02:52:31', null);
INSERT INTO `products` VALUES ('344', '000296', 'Boys Slim Chinos with Cargo Belt -Blue', 'boys-slim-chinos-with-cargo-belt-blue', '23', 'Children wear,\r\n100% Cotton Chinos Adjustable Waistband Machine Washable', 'Colour: Blue, \r\nSizes: 4-5, 7 yrs', 'products/1523349443/cover.png', null, '100', '3500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:19:13', '2018-04-11 00:41:22', null);
INSERT INTO `products` VALUES ('345', '000297', 'Boy\'s Polo Shirt -Green', 'boys-polo-shirt-green', '23', 'Children wear,\r\ncotton\r\nshort sleeve\r\nHedges Badge for Style', 'Sizes: 4, 6, 8 yrs', 'products/1523349416/cover.png', null, '99', '3500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:22:54', '2018-07-29 06:19:36', null);
INSERT INTO `products` VALUES ('346', '0002978', 'Big Boy\'s Classic Jeans -Blue', 'big-boys-classic-jeans-blue', '23', 'Children wear,\r\nSlim Straight Jeans\r\nDenim Cotton\r\nAdjustable Waistband', 'Sizes: 8- 9, 9-10, 13-14yrs', 'products/1523349352/cover.png', null, '100', '4200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:25:13', '2018-04-11 00:40:53', null);
INSERT INTO `products` VALUES ('347', '000298', 'Dorissa Floral Shantung Ball Dress', 'dorissa-floral-shantung-ball-dress', '23', 'Children wear,\r\nBack Belt for Fit Shantung with Cotton Lining \r\nCrinoline for Ball Effect', 'Colour: Multicolour,\r\nSizes: 3, 4, 5, 6', 'products/1523349621/cover.png', null, '100', '7200.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:40:21', '2018-04-11 00:39:40', null);
INSERT INTO `products` VALUES ('348', '000299', 'Boys Slim Chinos with Cargo Belt - Brown', 'boys-slim-chinos-with-cargo-belt-brown', '23', 'Children wear,\r\n100% Cotton Chinos Cargo Belt Included Adjustable Waist band Perfect gentleman\'s wear  Machine washable', 'Sizes: 4-5, 7 yrs', 'products/1523349918/cover.png', null, '100', '3500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:43:41', '2018-04-11 00:39:24', null);
INSERT INTO `products` VALUES ('349', '000300', 'wedge shoe -Gold', 'wedge-shoe-gold', '23', 'Children shoe,\r\nThese adorable Wedge Shoe with glitters petals cut outs are a must have for every girl\'s closet as they never fade in fashion but rather remain the most elegant and stylish choice for girls. The classy yet unique style', 'Sizes  1, 2', 'products/1523350223/cover.png', null, '96', '5700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:50:23', '2018-07-29 06:10:04', null);
INSERT INTO `products` VALUES ('350', '000301', 'Girl\'s ankle strap Wedge Shoe - Black', 'girls-ankle-strap-wedge-shoe-black', '23', 'Children shoe,\r\nThese adorable Wedge Shoe with glitters petals cut outs are a must have for every girl\'s closet as they never fade in fashion but rather remain the most elegant and stylish choice for girls. The classy yet unique style', '10, 11, 12, 1, 2, 3', 'products/1523350473/cover.png', null, '99', '5700.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-10 17:53:28', '2018-07-29 02:43:18', null);
INSERT INTO `products` VALUES ('351', '000302', 'Universal double large swing', 'universal-double-large-swing', '24', 'Universal double large swing with seasaw 3 in 1', '3 in 1', 'products/1523545173/cover.png', null, '100', '290000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-12 23:56:15', '2018-04-13 00:00:47', null);
INSERT INTO `products` VALUES ('352', '000303', 'Nursery Swing Set', 'nursery-swing-set', '24', 'Great for both indoors and outdoors, kids can enjoy it all year round! Indoor or Outdoor use. Frame and Seat fold for easy storage. \r\nThis swing is for domestic family use only - For use under adult supervision \r\nFrame included', 'Recommended Age: 9-36 months - Maximum user weight: 55lbs', 'products/1523545454/cover.png', null, '100', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:04:14', '2018-04-13 00:04:14', null);
INSERT INTO `products` VALUES ('353', '000304', 'Nursery Swing Set 2', 'nursery-swing-set-2', '24', 'Great for both indoors and outdoors, kids can enjoy it all year round! Indoor or Outdoor use. \r\nFrame and Seat fold for easy storage. \r\nThis swing is for domestic family use only - For use under adult supervision \r\nFrame included', 'Recommended Age: 9-36 months - Maximum user weight: 55lbs', 'products/1523545650/cover.png', null, '100', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:07:30', '2018-04-13 00:07:30', null);
INSERT INTO `products` VALUES ('354', '000305', 'Universal Race car', 'universal-race-car', '24', 'Universal Race car Children', 'For children', 'products/1523545834/cover.png', null, '100', '72000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:10:34', '2018-04-13 00:11:00', null);
INSERT INTO `products` VALUES ('355', '000306', 'Volvo kids ride-on', 'volvo-kids-ride-on', '24', 'Volvo kid car', 'for children', 'products/1523546007/cover.png', null, '100', '91000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:13:28', '2018-04-13 00:13:28', null);
INSERT INTO `products` VALUES ('356', '000307', 'MINI-PARK', 'mini-park', '24', 'MINI-PARK IN THE BACK GARDEN OR SOMEWHERE IN HOUSE WITH OUTDOOR/INDOOR PLAY SET FOR ULTIMATE FUN.\r\nThis colourful kids indoor/outdoor slide, swing and basketball set will provide your children hours of fun. It includes a slide and a basketball hoop all in one! It is easy to assemble and is perfect for use both indoors and outdoors. Perfect for your little one to practice climbing or throwing a ball into the basketball goal. Most importantly, it is made of non-toxic material providing your little one a safe environment to play.', 'FEATURES INCLUDE :\r\nVibrate Multi-coloursPerfect opportunity for your child to practice their gross motor skills. \r\nNon-toxic material and smooth finishEasy assembly2 in1 design: slide and basketball hoopSuitable for 1 year+Overall: 138cm H x 170cm W x 170cm DOverall Product Weight: 25 KilogramChildren should always be supervised when using this product.', 'products/1523546682/cover.png', null, '100', '51000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:19:02', '2018-04-13 00:24:42', null);
INSERT INTO `products` VALUES ('357', '000307', 'Universal-Triple Swing Set', 'universal-triple-swing-set', '24', '2-Seater glider- 2 Swings', 'N.W.:48.6lbsG.W.:52.4lbsRetail Box Dimension:49\"L x 5.7\"W x 18.5\"HProduct Dimension:126.8\"W x 63.8\"D x 72.4\"H', 'products/1523547007/cover.png', null, '100', '100000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:30:07', '2018-04-13 00:30:07', null);
INSERT INTO `products` VALUES ('358', '000308', 'The Little Tikes Easy Store Giant Play Slide', 'the-little-tikes-easy-store-giant-play-slide', '24', 'Features easy steps for climbing, a gentle slope, and a wide base for stability. \r\nSet this slide in your backyard and let your little one enjoy the fun of climbing and sliding. \r\nThe Easy Store Slide unlocks and folds for convenient storage.', 'For children', 'products/1523548456/cover.png', null, '100', '98000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:33:48', '2018-04-13 00:54:16', null);
INSERT INTO `products` VALUES ('359', '000309', 'Children Playground', 'children-playground', '24', 'We aim to please! We know how to make out customers happy! Thanks', null, 'products/1523547636/cover.png', null, '100', '100000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:40:36', '2018-04-13 00:40:36', null);
INSERT INTO `products` VALUES ('360', '000400', 'Rocking Horse', 'rocking-horse', '24', 'This children’s toy rocking horse has been designed in a bright blue color with smoothed corners and edges. \r\nChildren will learn balance and coordination.', 'Durable enough to last for generations!\r\nThis is one happy horse that loves to rock, of course! \r\nHis sturdy construction and unique design will keep your kids in the saddle for hours!', 'products/1523547905/cover.png', null, '100', '13500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:45:05', '2018-04-13 00:45:05', null);
INSERT INTO `products` VALUES ('361', '000401', 'Play House', 'play-house', '24', 'Application: Home, Coffee bars, Park,Kindergartens,School,Commercial center, etc', 'Model: AP-PH0004\r\nSize: 230*101*122cm\r\nVolume: 0.5cbm\r\nAge: 2-8 age\r\nCapacity: 2-4 kids\r\nCertificate: GS,CE,CCC,ISO9001,ISO14000\r\nMaterial: HDPE\r\nPacking: Carton, Woven bag.\r\nDifferent color available', 'products/1523548363/cover.png', null, '100', '82000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:52:43', '2018-04-13 00:52:43', null);
INSERT INTO `products` VALUES ('362', '000402', 'The classic COZY COUPE', 'the-classic-cozy-coupe', '24', 'The classic COZY COUPE comes to life in this friendly-faced 30th Anniversay Edition. \r\nNow this classic kid powered car has a whole new look.', 'New features include removable floor and handle on back for parent controlled push rides.', 'products/1523548603/cover.png', null, '100', '59000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 00:56:43', '2018-04-14 07:00:57', null);
INSERT INTO `products` VALUES ('363', '000403', 'Spiral Slides', 'spiral-slides', '24', 'Unlike our spiral tube slides, this unique design allows for spiraling down from your play set in the open air! \r\nThe sectional pieces allow for easy assembly and delivery. \r\nInjection molded from structural foam.', 'Comes complete with hardware and assembly instructions.', 'products/1523548800/cover.png', null, '99', '180000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:00:00', '2018-07-29 04:58:35', null);
INSERT INTO `products` VALUES ('364', '000404', 'Double Swing', 'double-swing', '24', 'his double swing provides your children with hours of outdoor/indoor fun and is a great way to encourage exercise through play. The green and Yellow frame would look great in any garden and the set strictly confirms to the safety standards. This swing set is quick and easy to assemble. It also comes with safety belts to ensure your children’s safety.', 'Key Features \r\nA very good outdoor/indoor play for your child \r\nEncourages exercise through play \r\nSwing set is quick and easy to assemble \r\nComes with safety belts to ensure your children’s safety Specification \r\nProduct Code- SB-BGSWG-058 \r\nDimensions- 125*87*120 cm \r\nAge Group- 2 to 5years \r\nMaterial- Plastic', 'products/1523549192/cover.png', null, '100', '41500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:06:32', '2018-04-13 01:06:32', null);
INSERT INTO `products` VALUES ('365', '000405', 'The BIG Sammy rocker', 'the-big-sammy-rocker', '24', 'Whether swinging parties alone, in pairs or threes: \r\nthe ingenious rocking and seating area with the low center of gravity guarantees safety and optimum fun in every line-up. \r\nSturdy handles ensure a secure grip even in the wildest rides, and the back dandruff reliably stops stormy rocking fun. \r\nThe BIG Sammy rocker made of environmentally friendly, highly stable plastic is suitable for use in the nursery as in the garden.\r\n Like all BIG toys, the BIG Sammy rocker shines with design at its best: his sympathetic look quickly turns the smiling Dino into a beloved family member.', 'For Children', 'products/1523549390/cover.png', null, '100', '31500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:09:50', '2018-04-13 01:10:14', null);
INSERT INTO `products` VALUES ('366', '000406', 'Minnie Mouse Ride', 'minnie-mouse-ride', '24', 'Disney products are best know for their quality and this Minnie Mouse Ride On is not an exception. It is built to ensure maximum comfort and safety when your child is having fun.', 'Suitable for ages 1-3years\r\nIt is Highly Efficient and Durable. \r\nSuitable for ages 1-3years\r\nAlso available in red and blue.', 'products/1523549617/cover.png', null, '100', '14500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:13:37', '2018-04-13 01:13:37', null);
INSERT INTO `products` VALUES ('367', '000407', 'ANGERY BIRD KID RIDE', 'angery-bird-kid-ride', '24', 'ANGERY BIRD KID RIDE ON CAR WITH MUSIC', 'PACKING：COLOR BOX\r\nG./N.：17.5/15.5 KGS\r\nQTY：6 PCS left.', 'products/1523550738/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:32:18', '2018-04-13 01:32:18', null);
INSERT INTO `products` VALUES ('368', '000408', 'IC function equipment', 'ic-function-equipment', '24', 'IC function equipment. \r\nmelody, engine sound and turn signal sound will be. arm moving \r\nis possible to retrofit Gurappa and shovel. \r\nDozer part, moves from side to side. \r\narm portion moves to left, right, up, and down. \r\nhelmet included.', 'Size: W290 x H495 x D830mm \r\nWeight: 3.5kg', 'products/1523550946/cover.png', null, '100', '13500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:35:46', '2018-04-13 01:35:46', null);
INSERT INTO `products` VALUES ('369', '000409', 'Merry go Round', 'merry-go-round', '24', 'Merry go Round where for children can sit and enjoy the ride on toy', 'For Children', 'products/1523551535/cover.png', null, '100', '192500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-13 01:45:35', '2018-04-13 01:45:35', null);
INSERT INTO `products` VALUES ('370', '000410', 'Nisan Toy Car', 'nisan-toy-car', '24', 'Radio control, battery operated mode Nisan toy car', 'Radio control, battery operated mode, MP3 input, Lauched with emulational key, 10 selective songhs, Lead-acid rechargeable battery included, 4 ways with front lights', 'products/1523982958/cover.png', null, '100', '85900.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-18 01:35:59', '2018-04-19 04:39:17', null);
INSERT INTO `products` VALUES ('371', '000411', 'Kids Wardrobe', 'kids-wardrobe', '24', 'Wardrobe for kids', 'for kids', 'products/1524137980/cover.png', null, '100', '45100.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 20:39:41', '2018-04-19 20:39:41', null);
INSERT INTO `products` VALUES ('372', '000412', 'Tall Kids Wardrobe', 'tall-kids-wardrobe', '24', 'tall Kids wardrobe, with 3- step drawers available on sale for', '6ft with 3- step drawers', 'products/1524138234/cover.png', null, '100', '49000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 20:43:54', '2018-04-19 20:43:54', null);
INSERT INTO `products` VALUES ('373', '000413', 'MINI-PARK 001', 'mini-park-001', '24', 'LET YOUR KIDS HAVE THEIR VERY OWN MINI-PARK IN THE BACK GARDEN OR SOMEWHERE IN HOUSE WITH OUTDOOR/INDOOR PLAY SET FOR ULTIMATE FUN.\r\nIndoor / Outdoor Kids Slide Swing and Basketball Set,\r\n\r\nThis colourful kids indoor/outdoor slide, swing and basketball set will provide your children hours of fun. It includes a slide, a swing and a basketball hoop all in one! It is easy to assemble and is perfect for use both indoors and outdoors. Perfect for your little one to practice climbing or throwing a ball into the basketball goal. Most importantly, it is made of non-toxic material providing your little one a safe environment to play.', 'Vibrate Multi-coloursPerfect opportunity for your child to practice their gross motor skills. Non-toxic material and smooth finishEasy assembly3 in1 design: slide, swing and basketball hoopSuitable for 1 year+Overall: 138cm H x 170cm W x 170cm DOverall Product Weight: 30 KilogramChildren should always be supervised when using this product.', 'products/1524138543/cover.png', null, '100', '94650.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 20:49:03', '2018-04-19 20:49:03', null);
INSERT INTO `products` VALUES ('374', '000414', 'Dear Rocker', 'dear-rocker', '24', 'Indoor Play Equipments', '200 × 202 - Bike Rideon', 'products/1524139706/cover.png', null, '100', '12500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:08:26', '2018-04-19 21:08:26', null);
INSERT INTO `products` VALUES ('375', '000415', 'Giraffe Seesaw', 'giraffe-seesaw', '24', 'This children\'s toy rocking horse has been designed in a bright color with smoothed corners and edges. Children will learn balance and coordination. Durable enough to last for generations!', 'The durable plastic different sizes available', 'products/1524139957/cover.png', null, '100', '16900.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:12:37', '2018-04-19 21:31:31', null);
INSERT INTO `products` VALUES ('376', '000416', 'plastic rocking horse', 'plastic-rocking-horse', '24', 'Dive right into school-inspired fun with munchkin\'s school of fish, a bath toy set for those who love squirting, scooping and pouring water. Meanwhile, the floating school bus boat doubles as a shampoo rinse, too', 'The three fish students float, squirt water, and are sized just right for little hands to grasp and squeeze', 'products/1524140343/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:19:03', '2018-04-19 21:31:08', null);
INSERT INTO `products` VALUES ('377', '000417', 'Sammy horse Rocker', 'sammy-horse-rocker', '24', 'double plastic rocking horse', 'double plastic rocking horse', 'products/1524141674/cover.png', null, '100', '30500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:41:14', '2018-04-19 21:42:05', null);
INSERT INTO `products` VALUES ('378', '000418', 'Sammy elephant ticket', 'sammy-elephant-ticket', '24', 'Rocker', 'Sammy elephant ticket', 'products/1524141922/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:45:22', '2018-04-19 21:45:22', null);
INSERT INTO `products` VALUES ('379', '000419', 'Sammy whale rocker', 'sammy-whale-rocker', '24', 'whale rocker', 'Rocker', 'products/1524142229/cover.png', null, '100', '31500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:50:29', '2018-04-19 21:50:29', null);
INSERT INTO `products` VALUES ('380', '000420', 'Sammy Horse ride', 'sammy-horse-ride', '24', 'Sammy Horse ride', 'Sammy Horse ride', 'products/1524143467/cover.png', null, '100', '17500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 21:56:39', '2018-04-19 22:11:07', null);
INSERT INTO `products` VALUES ('381', '000421', 'Sammy horse 2 in 1 rocker', 'sammy-horse-2-in-1-rocker', '24', 'Sammy horse 2 in 1 rocker', '2 in 1 rocker', 'products/1524143208/cover.png', null, '100', '17500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:06:48', '2018-04-19 22:06:48', null);
INSERT INTO `products` VALUES ('382', '000422', 'Hoverboard', 'hoverboard', '24', 'Cruise with swag on your hoverboard boasting an 8 mph top speed and 11 mile range', 'Boasting an 8 mph top speed and 11 mile range - weight up to 220 lbsUL 2272 certified - the SWAGTRON 2-wheel self-balancing scooter excelled in all electrical safety testsThis swag motorized scooter’s new features include: LED headlights, battery indicators, rubber bumpers, and two riding modesPatented SWAGTRON SentryShield smart battery management system provides multi layered hover skate-board protectionThis balance scooter features an upgraded 250 Watt motor and gear stabilization for tighter control and downhill tractionRange: Up to 7 – 12 miles Charging Time: 1 HourNOTE: Refer the User Manual before use.', 'products/1524143923/cover.png', null, '100', '103000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:18:43', '2018-04-19 22:18:43', null);
INSERT INTO `products` VALUES ('383', '000423', 'Portable six speed spacesaver swing', 'portable-six-speed-spacesaver-swing', '24', 'It’s a portable six speed spacesaver swing with music, soothing nature sounds, and a deluxe, ultra-soft, removable newborn insert. And it’s a stationary baby seat with soothing sounds, music and calming vibrations for newborns and babies up to 25 lbs too! It’s Fisher-Price Deluxe Take-Along Swing & Seat—two mom and baby-favorite babygear solutions in one for double the use…and less clutter in your home!', 'SmartSwing Technology offers 6 distinct swinging speeds from low to high so you can find the motion to suit baby’s mood. It actually senses baby’s weight (so speeds won’t slow as baby grows)—and it starts without a push! Easily converts to a stationary seat with calming vibrations for soothing and snoozing. And in either mode, two little birdies on the overhead canopy help keep baby entertained', 'products/1524144298/cover.png', null, '100', '82000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:23:55', '2018-04-19 22:24:58', null);
INSERT INTO `products` VALUES ('384', '000424', 'Sport bike for boys and girls', 'sport-bike-for-boys-and-girls', '24', 'Sport bike for boys and girls. Coming with bell,tools,water bottle and training wheels,owner\'s manual included. ● Easy to put together! 95% of the bike is assembled, only need install training wheels, pedals,handlebar and saddle. Almost anyone can make it.', 'Size 12, 14, 16, 18 are available\r\n\r\n● Sturdy steel frame,wide knobby 2.4\" aired tyres.A sportive,durable and comfortable real bike. ● Front caliper brake, rear coaster brake.18 inch - dual hand brake The combination of brakes gives many options for learning to stop. ● Heavy duty long last training wheels.Royalbaby patented design with side support, never bent. ● Quick release seatpost, easy to adjust the seat height for fast growing kids. ● One piece crank,ball bearing drive shaft,full enclosed chainguard(18 inch half enclosed).Easy rolling and more protection in details. 【How to choose the right size?】 ●12 inch suitable for child, whose height 33\"-41\", age 2-4 yr old. ●14 inch suitable for child, whose height 36\" - 47\", age 3-5 yr old. ●16 inch suitable for child, whose height 41\" - 53\", age 4-7 yr old. ●18 inch suitable for child, whose height 43\" - 59\", age 5-9 yr old.', 'products/1524144735/cover.png', null, '400', '21500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:32:15', '2018-04-20 17:10:31', null);
INSERT INTO `products` VALUES ('385', '000425', 'Colourful Moses basket', 'colourful-moses-basket', '24', 'Colourful Moses basket available for kids from 0 to 11 months.', 'kids from 0 to 11 months.', 'products/1524145571/cover.png', null, '100', '17000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:46:11', '2018-04-19 22:46:11', null);
INSERT INTO `products` VALUES ('386', '000426', 'Tauki Kid Tricycle', 'tauki-kid-tricycle', '24', 'Give your kid Tauki Kid Tricycle, Give your kid Safe and Fun! \r\nThe two-step shaped rubber tire makes the stress scatter equally, thus ensuring smooth and comfortable riding, and longer service life. \r\nThe streamline soft seat, especially made for kids \r\nStable \r\nComfortable \r\nThe wide handle bar of this model is especially designed for extra stable and safe in direction steering.', 'Specifications \r\nWeight:10.34 pounds \r\nFrame: Durable welded high grade steel \r\nWeight Capacity: 55 pounds \r\nAdjustable seat(safe line to ground): 14.2 inches \r\nAdjustable seat(safe line to pedal):19.7 inches \r\nAdjustable Handlebars(safe line to ground):19.84 inches \r\nRecommend for kids from 2 to 5 years old, 25 inches to 34 inches height. \r\nLimited assembly required. Easy assembly \r\nFree tools included. \r\nTricycle available in diffrent colours. \r\nAge : 2+', 'products/1524145810/cover.png', null, '100', '21500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:50:10', '2018-04-19 22:50:10', null);
INSERT INTO `products` VALUES ('387', '000427', 'Baby Bag 3 in 1 - Diaper Bag, Travel Bed & Change Station', 'baby-bag-3-in-1-diaper-bag-travel-bed-change-station', '24', 'Travel Smart with this revolutionary travel bed! This is the ultimate travel bassinet for baby, combining a comfortable sleep with the convenience of a change station and the storage space of a diaper bag A three in one system for travelling with your baby. Mom and Dad will love a single bag for all of baby\'s needs on your next vacation, or even just a trip to the mall. The travel system measures 30 x 15.5 x 7.5 inches open, making it appropriate for babies 0 - 12 months old. The bed folds in half to close, making it easy to stow away.', '0 to 9 months are available with different prices', 'products/1524146050/cover.png', null, '300', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:54:10', '2018-04-20 17:30:39', null);
INSERT INTO `products` VALUES ('388', '000428', 'Do IT Yourself', 'do-it-yourself', '24', 'This is a great DIY joy when you place these butterflies anywhere. You can use them to decor your living room, bedroom, your kids’ room, wall art, Wall Decals, even anyplace you can think of. \r\nThe children always love butterflies. They often make out incredible works with the butterflies even better than you. This is a good way to develop the thinking ability and the practical ability of your children.', 'Different shapes and sizes colorful stickers will make your life more colorful and beautiful', 'products/1524146298/cover.png', null, '99', '3000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 22:58:18', '2018-07-29 02:33:51', null);
INSERT INTO `products` VALUES ('389', '000429', 'Beautiful reading table', 'beautiful-reading-table', '24', 'Beautiful reading table for children', 'for kids', 'products/1524146514/cover.png', null, '100', '18000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 23:01:05', '2018-04-19 23:01:54', null);
INSERT INTO `products` VALUES ('390', '000430', 'Sammy dinosaurs rocker', 'sammy-dinosaurs-rocker', '24', 'Sammy dinosaurs rocker', 'rocker', 'products/1524148454/cover.png', null, '97', '30000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-19 23:27:08', '2018-07-29 04:56:37', null);
INSERT INTO `products` VALUES ('391', '000431', 'Aria mini bag', 'aria-mini-bag', '25', 'The opposite bag are different colors, it’s almost like having two bags in one', 'Aria mini bag  it’s almost like having two bags in one', 'products/1524568792/cover.png', null, '96', '7000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:17:28', '2018-07-29 15:59:05', null);
INSERT INTO `products` VALUES ('392', '000432', 'Gucci Bag', 'gucci-bag', '25', 'Gucci bag', 'Gucci bag available in black, red and blue', 'products/1524568924/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:22:04', '2018-04-24 20:22:04', null);
INSERT INTO `products` VALUES ('393', '000433', 'GUCCI INSPIRED', 'gucci-inspired', '25', 'GUCCI INSPIRED', 'Available in red black and white Dimensions L: 24cm H: 17cm W: 10cm', 'products/1524569150/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:25:50', '2018-04-24 20:25:50', null);
INSERT INTO `products` VALUES ('394', '000434', 'GUCCI SIDE CHAIN BAG', 'gucci-side-chain-bag', '25', 'GUCCI SIDE CHAIN BAG', null, 'products/1524569390/cover.png', null, '100', '11000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:27:48', '2018-04-24 20:29:50', null);
INSERT INTO `products` VALUES ('395', '000435', 'Louis Vuitton bag', 'louis-vuitton-bag', '25', 'louis vuitton handbag', 'Hangbag', 'products/1524569620/cover.png', null, '100', '10000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:33:40', '2018-04-24 20:33:40', null);
INSERT INTO `products` VALUES ('396', '000436', 'Mini Bag', 'mini-bag', '25', 'Mini Bag', null, 'products/1524569714/cover.png', null, '97', '7500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:35:14', '2018-07-29 16:11:07', null);
INSERT INTO `products` VALUES ('397', '000437', 'Mini Tote Bag', 'mini-tote-bag', '25', 'Mini Tote Bag', null, 'products/1524570896/cover.png', null, '100', '8500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:51:26', '2018-04-24 20:54:56', null);
INSERT INTO `products` VALUES ('398', '000439', 'Side chain bag', 'side-chain-bag', '25', 'Side chain bag', 'Available in silver, gold, rainbow and black', 'products/1524571050/cover.png', null, '100', '5400.00', null, '1', null, null, null, null, null, '0.00', null, '2018-04-24 20:57:30', '2018-04-24 20:57:30', null);
INSERT INTO `products` VALUES ('399', '000440', 'Bead 025', 'bead-025', '11', 'Bead', 'Bead for all your occasion', 'products/1525106481/cover.png', null, '100', '12300.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:41:22', '2018-05-01 01:41:22', null);
INSERT INTO `products` VALUES ('400', '000441', 'Bead 026', 'bead-026', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106592/cover.png', null, '100', '15500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:43:12', '2018-05-01 01:43:12', null);
INSERT INTO `products` VALUES ('401', '000442', 'Bead 027', 'bead-027', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106658/cover.png', null, '100', '31000.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:44:18', '2018-05-01 01:44:18', null);
INSERT INTO `products` VALUES ('402', '000443', 'Bead 028', 'bead-028', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106721/cover.png', null, '100', '10300.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:45:21', '2018-05-01 01:45:21', null);
INSERT INTO `products` VALUES ('403', '000444', 'Bead 029', 'bead-029', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106774/cover.png', null, '100', '15400.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:46:15', '2018-05-01 01:46:15', null);
INSERT INTO `products` VALUES ('404', '000445', 'Bead 030', 'bead-030', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106825/cover.png', null, '100', '15300.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:47:05', '2018-05-01 01:47:05', null);
INSERT INTO `products` VALUES ('405', '000446', 'Bead 031', 'bead-031', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106885/cover.png', null, '99', '15300.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:48:05', '2018-07-29 04:31:38', null);
INSERT INTO `products` VALUES ('406', '000447', 'Bead 032', 'bead-032', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525106949/cover.png', null, '96', '18500.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:49:09', '2018-07-29 02:55:03', null);
INSERT INTO `products` VALUES ('407', '000448', 'Bead 033', 'bead-033', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525107025/cover.png', null, '100', '20500.00', null, '1', '1', null, null, null, null, '0.00', null, '2018-05-01 01:50:25', '2018-07-06 13:58:13', null);
INSERT INTO `products` VALUES ('408', '000449', 'Bead 034', 'bead-034', '11', 'Bead for all occasion', 'Bead for all occasion', 'products/1525107345/cover.png', null, '100', '15300.00', null, '1', null, null, null, null, null, '0.00', null, '2018-05-01 01:55:45', '2018-05-01 01:56:09', '2018-05-01 01:56:09');
INSERT INTO `products` VALUES ('409', '54645', 'Ajiga Olugbenga', 'ajiga-olugbenga', '25', 'tytytr', 'trtr', 'products/1534606386/cover.jpeg', null, '2', '5.00', null, '1', '1', null, null, null, null, '0.00', null, '2018-08-18 16:33:07', '2018-08-18 16:33:07', null);

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attributes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_attributes
-- ----------------------------
INSERT INTO `product_attributes` VALUES ('4', '100', '21500.00', '384', '2018-04-20 17:06:51', '2018-04-20 17:06:51');
INSERT INTO `product_attributes` VALUES ('5', '100', '23700.00', '384', '2018-04-20 17:07:30', '2018-04-20 17:07:30');
INSERT INTO `product_attributes` VALUES ('6', '100', '25700.00', '384', '2018-04-20 17:08:00', '2018-04-20 17:08:00');
INSERT INTO `product_attributes` VALUES ('7', '100', '31500.00', '384', '2018-04-20 17:08:37', '2018-04-20 17:08:37');
INSERT INTO `product_attributes` VALUES ('8', '100', '10000.00', '387', '2018-04-20 17:28:49', '2018-04-20 17:28:49');
INSERT INTO `product_attributes` VALUES ('9', '100', '11000.00', '387', '2018-04-20 17:29:07', '2018-04-20 17:29:07');
INSERT INTO `product_attributes` VALUES ('10', '100', '12000.00', '387', '2018-04-20 17:29:35', '2018-04-20 17:29:35');

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_index` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES ('61', '42', 'products/1520072693/gkjQSnx9nN6yK6wRSLCSMLwYx.png', null, null);
INSERT INTO `product_images` VALUES ('68', '43', 'products/1520073052/H6foGFLWZbgeR4FUA8oHtYfYM.png', null, null);
INSERT INTO `product_images` VALUES ('69', '44', 'products/1520073359/0rWkESFVpwmJ07Yv3QKlsJLuX.png', null, null);
INSERT INTO `product_images` VALUES ('70', '45', 'products/1520073484/1QoCaFXhuhUdpqxxL6cZzyAGo.png', null, null);
INSERT INTO `product_images` VALUES ('74', '47', 'products/1520075873/ANT1QGKFTd2rodacqCju7s23D.png', null, null);
INSERT INTO `product_images` VALUES ('75', '48', 'products/1520076219/BmWiKQN2TklJUfhgHMHrJdc9B.jpeg', null, null);
INSERT INTO `product_images` VALUES ('76', '49', 'products/1520083904/Q8xrerPMh7hUf30bjsFx6HPJt.png', null, null);
INSERT INTO `product_images` VALUES ('77', '50', 'products/1520084128/phxE3J4sWMfewtHmgOQBemkRp.png', null, null);
INSERT INTO `product_images` VALUES ('78', '51', 'products/1520085313/zpoKa1nYghovlz0byhTFoQRyR.png', null, null);
INSERT INTO `product_images` VALUES ('79', '52', 'products/1520085598/gzohWWeopGtCQIGPSOCbdypQK.png', null, null);
INSERT INTO `product_images` VALUES ('82', '54', 'products/1520087190/NTVvaJOERX63vZzkfxVGTasPU.png', null, null);
INSERT INTO `product_images` VALUES ('90', '57', 'products/1520090565/uUvvOAdZ6GpQBszf754lcjhD9.png', null, null);
INSERT INTO `product_images` VALUES ('91', '58', 'products/1520090783/KqpciaZU6bm4hnbHL0epbgV1a.png', null, null);
INSERT INTO `product_images` VALUES ('92', '59', 'products/1520091030/konfVl6Bv8QhpQew5iJuWWFkN.png', null, null);
INSERT INTO `product_images` VALUES ('93', '59', 'products/1520091030/pFoou81v0ubjF9d9DWHOPn8KV.png', null, null);
INSERT INTO `product_images` VALUES ('94', '46', 'products/1520092319/KyWeUSMZHJr67DNAcKhgE9LaE.jpeg', null, null);
INSERT INTO `product_images` VALUES ('95', '46', 'products/1520092319/BTgIsz8klPDSmcC7OzvdxthMS.jpeg', null, null);
INSERT INTO `product_images` VALUES ('96', '60', 'products/1520345619/4FxPYpZodmfDx1czIVEGZkAZZ.png', null, null);
INSERT INTO `product_images` VALUES ('97', '60', 'products/1520345619/8dtH8iXMS2o73RU1PWfLOFgqI.png', null, null);
INSERT INTO `product_images` VALUES ('101', '61', 'products/1520346296/do7YfSi9PaJEynNpNeXQ4QrzM.png', null, null);
INSERT INTO `product_images` VALUES ('103', '61', 'products/1520346325/Fj2dAKjCRzgZmNR7kHrNMHofy.png', null, null);
INSERT INTO `product_images` VALUES ('104', '62', 'products/1520347358/QJfCeTG9BoAZ3W1Jzuy5cYuRf.png', null, null);
INSERT INTO `product_images` VALUES ('105', '62', 'products/1520347358/gKCaJmNuGgSxMl4LwcPrfwoF5.png', null, null);
INSERT INTO `product_images` VALUES ('106', '63', 'products/1520353930/4HslCXfpyFHx4NOITi37ngdIC.png', null, null);
INSERT INTO `product_images` VALUES ('108', '65', 'products/1520506012/CzFWtxBQIaARq8thu3zbhsPvQ.png', null, null);
INSERT INTO `product_images` VALUES ('109', '65', 'products/1520506012/l2BziNOzBby8yehLnKHuoIOlG.png', null, null);
INSERT INTO `product_images` VALUES ('114', '67', 'products/1520506986/cc1rICvjVgQUcUXnetpqh8AlG.png', null, null);
INSERT INTO `product_images` VALUES ('115', '66', 'products/1520507074/IQVN33XzSotkbCb6uufGuEomd.png', null, null);
INSERT INTO `product_images` VALUES ('116', '64', 'products/1520507235/vOgZgy8LBRGNsBfhlz37MeZ4t.png', null, null);
INSERT INTO `product_images` VALUES ('117', '64', 'products/1520507235/fpoaPnKgQYaaen38KXSxwf7nK.png', null, null);
INSERT INTO `product_images` VALUES ('118', '64', 'products/1520507235/Adnd6BHAb7yWxD2SlMAy1Lj3H.png', null, null);
INSERT INTO `product_images` VALUES ('120', '69', 'products/1520509318/8ymjlgWc7RS5FOTq2FgtvCaKe.jpg', null, null);
INSERT INTO `product_images` VALUES ('121', '86', 'products/1520613593/IP54r6Qt0KRgzHnhV6ekMhWG9.png', null, null);
INSERT INTO `product_images` VALUES ('122', '53', 'products/1520676879/ZaApn2fkMTcWL7OIFtt9zfh1s.png', null, null);
INSERT INTO `product_images` VALUES ('123', '53', 'products/1520676879/DqMSZtwDjVicE9AbSpkAH70sH.png', null, null);
INSERT INTO `product_images` VALUES ('124', '55', 'products/1520678093/XEdcFatVaSGK99vtvLdTKZIIe.png', null, null);
INSERT INTO `product_images` VALUES ('125', '55', 'products/1520678093/ut978drxZtubh187k3G1uQbqy.png', null, null);
INSERT INTO `product_images` VALUES ('126', '55', 'products/1520678093/w7AFH3RjPDQJW6aiLesxCZZ3j.png', null, null);
INSERT INTO `product_images` VALUES ('127', '55', 'products/1520678093/4dLyYdcARFkpQlU5vc2NAufd6.png', null, null);
INSERT INTO `product_images` VALUES ('128', '55', 'products/1520678093/yZQbaZi0JT28WWZSiHKl8Epsy.png', null, null);
INSERT INTO `product_images` VALUES ('129', '55', 'products/1520678093/XHSmDwXZzgXwlGstGEa9UCes8.png', null, null);
INSERT INTO `product_images` VALUES ('130', '55', 'products/1520678093/zgcPKq3kC02gNZYad0892oxpG.png', null, null);
INSERT INTO `product_images` VALUES ('131', '55', 'products/1520678093/IIkiU2LdvKkjUNmUvXGY9GJBL.png', null, null);
INSERT INTO `product_images` VALUES ('132', '55', 'products/1520678093/5o3o7KfWhqEMKIAlWdN2s4Gdo.png', null, null);
INSERT INTO `product_images` VALUES ('133', '105', 'products/1520870730/XiVCjgw2A91yngfVV75cBeLM2.png', null, null);
INSERT INTO `product_images` VALUES ('134', '105', 'products/1520870730/9HwZz5X2EKH9mH7JxLFuZPAH6.png', null, null);
INSERT INTO `product_images` VALUES ('135', '105', 'products/1520870730/QyCxwK3GbnZj3nkPrkB4WDCNj.png', null, null);
INSERT INTO `product_images` VALUES ('142', '109', 'products/1520892914/k02aabLR3knLRVagpZw0cvE1y.png', null, null);
INSERT INTO `product_images` VALUES ('145', '109', 'products/1520892914/BYdOkwItHmOLbWeC0zrLITQ4O.png', null, null);
INSERT INTO `product_images` VALUES ('146', '110', 'products/1520941025/E6StpRNIVkp9Rs7ApAep8xJqA.png', null, null);
INSERT INTO `product_images` VALUES ('147', '110', 'products/1520941025/50tHdebpl7tRBjfSUtKTxWSIC.png', null, null);
INSERT INTO `product_images` VALUES ('148', '110', 'products/1520941025/RoOQTvT9Mzyf3ZsrINt33B3J7.png', null, null);
INSERT INTO `product_images` VALUES ('149', '110', 'products/1520941025/bBF7qUzTQVzNalkU5Or7pNWQE.png', null, null);
INSERT INTO `product_images` VALUES ('150', '110', 'products/1520941025/8yRztff22b3fF1xNUVsRCXonS.png', null, null);
INSERT INTO `product_images` VALUES ('151', '110', 'products/1520941025/7oBeqvjwpTAlp5wGw62HU3Kvr.png', null, null);
INSERT INTO `product_images` VALUES ('153', '111', 'products/1520943163/Qkxrvt1dghKF7K6PQ7FHU16UX.png', null, null);
INSERT INTO `product_images` VALUES ('154', '112', 'products/1520947527/GTSh6NvHBj7dHUcqJ0GS2klIk.png', null, null);
INSERT INTO `product_images` VALUES ('155', '112', 'products/1520947527/JOl9Sml9v2ZZtHQZTmNsizlCf.png', null, null);
INSERT INTO `product_images` VALUES ('156', '112', 'products/1520947527/t7FEVhZIDenAZtdPZOOPl5tuY.png', null, null);
INSERT INTO `product_images` VALUES ('157', '113', 'products/1520951039/zk9MQAIJfECACA6WwSO4MLPsx.png', null, null);
INSERT INTO `product_images` VALUES ('158', '113', 'products/1520951039/rNunqIsCxZhL1Uno7IQ1nNqxx.png', null, null);
INSERT INTO `product_images` VALUES ('160', '114', 'products/1520952367/iYNa692sDwJFD0Pf6g6dUoC9f.png', null, null);
INSERT INTO `product_images` VALUES ('161', '114', 'products/1520952367/DjdXb4xbuySfnPZcGIPuUYvya.png', null, null);
INSERT INTO `product_images` VALUES ('162', '115', 'products/1520955376/IyVXZyigKLuoHp4mLYj96OLWb.png', null, null);
INSERT INTO `product_images` VALUES ('165', '115', 'products/1520955544/g4Scs0bC0ta49BxSM0d3FxJ0n.png', null, null);
INSERT INTO `product_images` VALUES ('167', '116', 'products/1520956604/rJWQQ5CWjaa332fhvjRSzDwqY.png', null, null);
INSERT INTO `product_images` VALUES ('168', '116', 'products/1520956647/iErDGdSh2Sy5NrTASO7CW6Qdj.png', null, null);
INSERT INTO `product_images` VALUES ('169', '117', 'products/1520957630/vURxWhDNR5yNCnJ1dXDFo4aRR.png', null, null);
INSERT INTO `product_images` VALUES ('171', '118', 'products/1520958452/GFEMtIUnszuCu2da9FWexmr4M.png', null, null);
INSERT INTO `product_images` VALUES ('173', '151', 'products/1521886539/lkUReX0l4xjl5uQLguxXLPS7N.png', null, null);
INSERT INTO `product_images` VALUES ('175', '154', 'products/1521886624/7kTObWLYKYvSGUmVYCXvDPuY9.png', null, null);
INSERT INTO `product_images` VALUES ('177', '170', 'products/1521886949/WR7JdL9lS0FyiwESbEH2esKaW.png', null, null);
INSERT INTO `product_images` VALUES ('178', '172', 'products/1521903725/jGLiwp4rEwXuUdq3ihtT3sANb.png', null, null);
INSERT INTO `product_images` VALUES ('181', '172', 'products/1521903725/wttwhnByUtroz0QfE47sRZaCC.png', null, null);
INSERT INTO `product_images` VALUES ('182', '271', 'products/1522608987/XyQAounfpiZ4F4BvD4UDhuYEe.png', null, null);
INSERT INTO `product_images` VALUES ('183', '271', 'products/1522608987/aes72Eg4xRXqXazNYmBHUQZk9.png', null, null);
INSERT INTO `product_images` VALUES ('187', '274', 'products/1522610591/3eyxfCNvDQ2OU3Qx2eu7pjheE.png', null, null);
INSERT INTO `product_images` VALUES ('190', '278', 'products/1522611943/Bsa2t92NJDZagRlWfOnefF8tJ.png', null, null);
INSERT INTO `product_images` VALUES ('191', '278', 'products/1522611943/LXbypeCqjrtqQHDIHwVo6vdIK.png', null, null);
INSERT INTO `product_images` VALUES ('198', '289', 'products/1522829177/aymnkYFcFxQOx5XGdsOemtEvc.png', null, null);
INSERT INTO `product_images` VALUES ('199', '312', 'products/kBfHUL9MSK3lkEpOapEcnwv47Jf1fH3Zg6s6Tc1b.png', '2018-04-05 17:58:51', '2018-04-05 17:58:51');
INSERT INTO `product_images` VALUES ('200', '312', 'products/1522918731/eIIM8TLWwpe2Lzp3GIAMegmIS.png', null, null);
INSERT INTO `product_images` VALUES ('202', '313', 'products/1522918761/KUgRjfbFYPbDuKuyjQW2u7nKM.png', null, null);
INSERT INTO `product_images` VALUES ('203', '314', 'products/1522918855/WdMoKj1Cyremg2iZBpJ63jz04.png', null, null);
INSERT INTO `product_images` VALUES ('204', '314', 'products/1522918855/nZKaXSabJOdvzpwc7CnKE23BO.png', null, null);
INSERT INTO `product_images` VALUES ('207', '315', 'products/1522919000/M1PEnuFcay7UHpaJypRX1xQCY.png', null, null);
INSERT INTO `product_images` VALUES ('208', '315', 'products/1522919000/34eDyoeQPnb8irNw9JNkjgVIm.png', null, null);
INSERT INTO `product_images` VALUES ('212', '315', 'products/1522919052/lxCE14ZZBKqBYwXYkHepS3o4c.png', null, null);
INSERT INTO `product_images` VALUES ('213', '317', 'products/1522919226/DIDTwqOmATR69Z2xWPbAmt0dN.png', null, null);
INSERT INTO `product_images` VALUES ('214', '317', 'products/1522919226/Xx0nBwGPUiXMfZFvYHQLRPyeU.png', null, null);
INSERT INTO `product_images` VALUES ('215', '317', 'products/1522919226/rK5vKZkzGnSTS5wsTQvpFwNwy.png', null, null);
INSERT INTO `product_images` VALUES ('224', '318', 'products/1522919364/t4iu4Ry2TNd9Vuvrqxer90zfV.png', null, null);
INSERT INTO `product_images` VALUES ('225', '318', 'products/1522919364/UpboktJwLvlSTuyXxSiw6bHFG.png', null, null);
INSERT INTO `product_images` VALUES ('226', '318', 'products/1522919364/yliudruToUp7hY6yBCjfERmxp.png', null, null);
INSERT INTO `product_images` VALUES ('227', '319', 'products/1522919455/yez7vi70kQuRpq4AvflGhEEk9.png', null, null);
INSERT INTO `product_images` VALUES ('228', '319', 'products/1522919455/vmDkOQgb0sDPLFksFUQj2CQam.png', null, null);
INSERT INTO `product_images` VALUES ('229', '319', 'products/1522919455/2bEH3PG3ZLtaFQGolGMJ4Dekh.png', null, null);
INSERT INTO `product_images` VALUES ('230', '319', 'products/E3AG5STuDDnTftzFn8YNJp2T0l6Aes90HM8liIwG.png', '2018-04-05 18:10:55', '2018-04-05 18:10:55');
INSERT INTO `product_images` VALUES ('231', '319', 'products/kUc0PPqkfeVamZ3MOsdMJBAoYFFTqFl9jRlpdsPT.png', '2018-04-05 18:10:55', '2018-04-05 18:10:55');
INSERT INTO `product_images` VALUES ('232', '319', 'products/xgkTlYckg0tAr9HYTR67pTNJ5X3PJi7tT7rnjezA.png', '2018-04-05 18:10:55', '2018-04-05 18:10:55');
INSERT INTO `product_images` VALUES ('233', '320', 'products/1523011666/8JTtXzNH52Z1ruWZx27XETT6F.png', null, null);
INSERT INTO `product_images` VALUES ('235', '321', 'products/1523012265/VRvLF9QS4kZS7zQQPtK0elcoc.png', null, null);
INSERT INTO `product_images` VALUES ('236', '321', 'products/flbdIGBDthfATBst6IIYEms5nlExedPEZoRc5JeO.png', '2018-04-06 19:57:45', '2018-04-06 19:57:45');
INSERT INTO `product_images` VALUES ('237', '322', 'products/1523012340/F76dq4Fl1AOMdMjnz5mcnRuSy.png', null, null);
INSERT INTO `product_images` VALUES ('238', '322', 'products/RIRLezTnCff7lKuOJwm4HTph3wttukPfWXhCbDWM.png', '2018-04-06 19:59:00', '2018-04-06 19:59:00');
INSERT INTO `product_images` VALUES ('239', '323', 'products/1523012433/01V23IlIe3FY0aT4KbxajMviI.png', null, null);
INSERT INTO `product_images` VALUES ('240', '323', 'products/Z4ZNXBt87iSCmexbPtkHfigiOSw7wVIUA7XhlMam.png', '2018-04-06 20:00:33', '2018-04-06 20:00:33');
INSERT INTO `product_images` VALUES ('245', '332', 'products/1523033126/eI2AbAB0GjFrQoAiKYDVy5HQa.png', null, null);
INSERT INTO `product_images` VALUES ('246', '332', 'products/1523033126/SzyDbszZSRwkwnxHjquSgyuto.png', null, null);
INSERT INTO `product_images` VALUES ('261', '172', 'products/1523115120/Cwu7lU1UAWVnvdIKdnzxvBJ71.png', null, null);
INSERT INTO `product_images` VALUES ('262', '339', 'products/1523289539/8noKSWmGxCVGyVLMC07uEFFU4.png', null, null);
INSERT INTO `product_images` VALUES ('263', '340', 'products/1523289782/KKusrJ7qODm50PBXtFeWpziR3.png', null, null);
INSERT INTO `product_images` VALUES ('265', '349', 'products/1523350223/2PxAco1Re8O1bLoHUxDVL2GaT.png', null, null);
INSERT INTO `product_images` VALUES ('266', '350', 'products/1523350443/blSB87Jm1omAiSA3vBdgWZLae.png', null, null);
INSERT INTO `product_images` VALUES ('267', '367', 'products/1523550738/yZ99ofIE0OmMPWi8XWyYXgkVi.png', null, null);
INSERT INTO `product_images` VALUES ('268', '370', 'products/1523982958/uDSsGeolsGCcQXHZsL7URXEyT.png', null, null);
INSERT INTO `product_images` VALUES ('269', '370', 'products/1523982958/pSUT0Lw9tXtl2h9oRxk9u14N0.png', null, null);
INSERT INTO `product_images` VALUES ('270', '380', 'products/1524143467/4G8uAjPZQvSttsRzwqxb7qFb7.png', null, null);
INSERT INTO `product_images` VALUES ('271', '391', 'products/1524568692/9py4GC3P7r7nsaVQHHg0eNNIB.png', null, null);
INSERT INTO `product_images` VALUES ('273', '391', 'products/1524568792/dZ3KZ0RPH3njBpyaXxGPsq2tK.png', null, null);
INSERT INTO `product_images` VALUES ('274', '393', 'products/1524569150/dmpf13a66sd2BYfPtcRiGUu2g.png', null, null);
INSERT INTO `product_images` VALUES ('275', '393', 'products/1524569150/lsbFxUjzvMrMnm1u17WLPINO5.png', null, null);
INSERT INTO `product_images` VALUES ('277', '397', 'products/1524570772/8mUHO09X996WCPtrhqYBprmYX.png', null, null);
INSERT INTO `product_images` VALUES ('278', '397', 'products/1524570772/iheMLHXPCJIjo65e4xeWsZtQp.png', null, null);
INSERT INTO `product_images` VALUES ('279', '397', 'products/1524570772/q1iyYzqMyxLFsbmlcf3MsTjco.png', null, null);
INSERT INTO `product_images` VALUES ('280', '397', 'products/1524570772/AGGPx8xntKnZl1tfBujT08F3G.png', null, null);
INSERT INTO `product_images` VALUES ('281', '397', 'products/1524570772/6dnEoeaGAOoRds9DPMDnoHlNS.png', null, null);
INSERT INTO `product_images` VALUES ('283', '397', 'products/1524570896/86cFtPfdWwUcqmzDxEvGkGHBz.png', null, null);
INSERT INTO `product_images` VALUES ('284', '398', 'products/1524571050/T7QF9PPyKeYmuq8AKjmAwvGWo.png', null, null);

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', 'Lagos', '156', '1', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('2', 'Adamawa', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('3', 'Akwa Ibom', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('4', 'Anambra', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('5', 'Bauchi', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('6', 'Bayelsa ', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('7', 'Abia', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('8', 'Benue', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('9', 'Borno', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('10', 'Cross River', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('11', 'Delta', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('12', 'Ebonyi', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('13', 'Edo', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('14', 'Ekiti', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('15', 'Enugu', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('16', 'Gombe', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('17', 'Imo', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('18', 'Jigawa', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('19', 'Kaduna', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('20', 'Kano', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('21', 'Katsina', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('22', 'Kebbi', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('23', 'Kogi', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('24', 'Kwara', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('25', 'Nasarawa', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('26', 'Niger', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('27', 'Ogun', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('28', 'Ondo', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('29', 'Osun', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('30', 'Oyo', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('31', 'Plateau', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('32', 'Rivers', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('33', 'Sokoto', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('34', 'Taraba', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('35', 'Yobe', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('36', 'Zamfara', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');
INSERT INTO `provinces` VALUES ('37', 'FCT', '156', '0', '2017-11-28 16:30:21', '2017-11-28 16:30:21');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `star` double(8,2) unsigned DEFAULT '0.00',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_review_id_index` (`customer_id`) USING BTREE,
  KEY `product_review_id_index` (`product_id`) USING BTREE,
  KEY `category_review_id_index` (`category_id`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES ('16', '28', '384', null, '4.70', 'This is a lovely Bicycle', '1', '2018-04-25 20:58:06', '2018-04-25 20:58:06');
INSERT INTO `reviews` VALUES ('17', '28', '388', null, '4.50', null, '1', '2018-05-05 01:59:08', '2018-05-05 01:59:08');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'superadmin', 'Superadmin', 'Superadmin', '2018-01-08 04:46:28', '2018-01-08 04:46:28');
INSERT INTO `roles` VALUES ('2', 'admin', 'Admin', 'Admin', '2018-01-08 04:46:29', '2018-01-08 04:46:29');
INSERT INTO `roles` VALUES ('3', 'user', 'User', 'User', '2018-01-08 04:46:30', '2018-01-08 04:46:30');

-- ----------------------------
-- Table structure for sellers
-- ----------------------------
DROP TABLE IF EXISTS `sellers`;
CREATE TABLE `sellers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(25) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '0',
  `category_name` text,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sellers
-- ----------------------------
INSERT INTO `sellers` VALUES ('9', 'Deemoney', '08125572170', '0', '1', 'Men; Shoes', '2018-04-25 09:50:55', '2018-04-25 09:50:55');
INSERT INTO `sellers` VALUES ('10', 'Sam', '08130805595', '0', '1', 'Men; Shoes', '2018-04-25 09:50:56', '2018-04-25 09:50:56');
INSERT INTO `sellers` VALUES ('11', 'Tomike', '08169741509', '1', '1', 'Ladies', '2018-04-25 09:50:56', '2018-04-25 09:50:56');
INSERT INTO `sellers` VALUES ('12', 'Cliff Dumebi', '08165027541', '0', '1', 'Phones', '2018-04-25 09:50:56', '2018-04-25 09:50:56');
INSERT INTO `sellers` VALUES ('14', 'Princess', '07030179917', '1', '1', 'Ladies; Shoes', '2018-04-25 09:50:57', '2018-04-25 09:50:57');
INSERT INTO `sellers` VALUES ('15', 'Gemade Woman', null, '1', '1', 'Ladies; Shoes', '2018-04-25 09:50:57', '2018-04-25 09:50:57');
INSERT INTO `sellers` VALUES ('16', 'Innovation Fashion', '08181163579', '0', '1', 'Men; Shoes', '2018-04-25 09:50:57', '2018-04-25 09:50:57');
INSERT INTO `sellers` VALUES ('17', 'Ayomikun Sh\'moneh', '08025923961', '1', '1', 'Ladies', '2018-04-25 09:50:58', '2018-04-25 09:50:58');
INSERT INTO `sellers` VALUES ('18', 'Oluwaseun Ogunleye', '08035785724', '1', '1', 'Ladies; Shoes', '2018-04-25 09:50:58', '2018-04-25 09:50:58');
INSERT INTO `sellers` VALUES ('19', 'Kateashan Beddings', '08039287187', '1', '1', 'Ladies; Men', '2018-04-25 09:50:58', '2018-04-25 09:50:58');
INSERT INTO `sellers` VALUES ('20', 'Eucharia', '08169822561', '1', '1', 'Ladies', '2018-04-25 09:50:59', '2018-04-25 09:50:59');
INSERT INTO `sellers` VALUES ('21', 'TeeGold', '08126677935', '1', '1', 'Ladies', '2018-04-25 09:50:59', '2018-04-25 09:50:59');
INSERT INTO `sellers` VALUES ('22', 'Oke-Blue', '07063376606', '1', '1', 'Ladies; Shoes', '2018-04-25 09:51:00', '2018-04-25 09:51:00');
INSERT INTO `sellers` VALUES ('23', 'Glam WareHouse', '08023061500', '1', '1', 'Children', '2018-04-25 09:51:00', '2018-04-25 09:51:00');
INSERT INTO `sellers` VALUES ('24', 'BabiesWorld', '08169827758', '1', '1', 'Children', '2018-04-25 09:51:00', '2018-04-25 09:51:00');
INSERT INTO `sellers` VALUES ('25', 'Abimbola', '+234 703 715 5997', '1', '1', 'Ladies', '2018-04-25 09:51:45', '2018-04-25 09:51:45');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_header` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `site_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'AutheOnlineShop', 'authonline', '172.16.3.17/dangote_refinery_bizcenter', 'authemany2k@outlook.com', 'authemany2k@gmail.com', '2017-06-29 21:42:19', '2017-10-21 20:45:07');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_wishlist_id_index` (`customer_id`) USING BTREE,
  KEY `product_wishlist_id_index` (`product_id`) USING BTREE,
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wishlists
-- ----------------------------
INSERT INTO `wishlists` VALUES ('1', '14', '76', '2018-03-11 08:16:47', '2018-03-11 08:16:47');
INSERT INTO `wishlists` VALUES ('2', '28', '92', '2018-03-11 20:09:17', '2018-03-11 20:09:17');
INSERT INTO `wishlists` VALUES ('3', '28', '138', '2018-03-24 03:44:51', '2018-03-24 03:44:51');
INSERT INTO `wishlists` VALUES ('4', '28', '280', '2018-04-02 18:36:43', '2018-04-02 18:36:43');
INSERT INTO `wishlists` VALUES ('5', '28', '367', '2018-04-16 01:43:13', '2018-04-16 01:43:13');
INSERT INTO `wishlists` VALUES ('6', '28', '384', '2018-04-21 05:18:19', '2018-04-21 05:18:19');
