/*
MySQL Backup
Source Server Version: 5.6.17
Source Database: oc
Date: 2015/6/27 16:31:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `attribute`
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `attribute_description`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_description`;
CREATE TABLE `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `attribute_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_description`;
CREATE TABLE `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `lazyload_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `banner_image`
-- ----------------------------
DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `banner_image_description`
-- ----------------------------
DROP TABLE IF EXISTS `banner_image_description`;
CREATE TABLE `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `whether` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_description`
-- ----------------------------
DROP TABLE IF EXISTS `category_description`;
CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_filter`
-- ----------------------------
DROP TABLE IF EXISTS `category_filter`;
CREATE TABLE `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_path`
-- ----------------------------
DROP TABLE IF EXISTS `category_path`;
CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `category_to_layout`;
CREATE TABLE `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_to_position`
-- ----------------------------
DROP TABLE IF EXISTS `category_to_position`;
CREATE TABLE `category_to_position` (
  `category_position_id` int(1) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(14) CHARACTER SET utf8 NOT NULL,
  `position_value` int(1) NOT NULL,
  PRIMARY KEY (`category_position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `category_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `category_to_store`;
CREATE TABLE `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon_category`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_category`;
CREATE TABLE `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon_history`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_history`;
CREATE TABLE `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coupon_product`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `permission` text,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_activity`
-- ----------------------------
DROP TABLE IF EXISTS `customer_activity`;
CREATE TABLE `customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_ban_ip`
-- ----------------------------
DROP TABLE IF EXISTS `customer_ban_ip`;
CREATE TABLE `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `permission` text,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `customer_group_description`;
CREATE TABLE `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_history`
-- ----------------------------
DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_ip`
-- ----------------------------
DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_login`
-- ----------------------------
DROP TABLE IF EXISTS `customer_login`;
CREATE TABLE `customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_online`
-- ----------------------------
DROP TABLE IF EXISTS `customer_online`;
CREATE TABLE `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_reward`
-- ----------------------------
DROP TABLE IF EXISTS `customer_reward`;
CREATE TABLE `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customer_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `customer_transaction`;
CREATE TABLE `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `custom_field_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_customer_group`;
CREATE TABLE `custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `custom_field_description`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_description`;
CREATE TABLE `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `custom_field_value`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_value`;
CREATE TABLE `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `custom_field_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_value_description`;
CREATE TABLE `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `download_description`
-- ----------------------------
DROP TABLE IF EXISTS `download_description`;
CREATE TABLE `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `event`
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `extension`
-- ----------------------------
DROP TABLE IF EXISTS `extension`;
CREATE TABLE `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `filter`
-- ----------------------------
DROP TABLE IF EXISTS `filter`;
CREATE TABLE `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `filter_description`
-- ----------------------------
DROP TABLE IF EXISTS `filter_description`;
CREATE TABLE `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `filter_group`
-- ----------------------------
DROP TABLE IF EXISTS `filter_group`;
CREATE TABLE `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `filter_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `filter_group_description`;
CREATE TABLE `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `geo_zone`;
CREATE TABLE `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `information`
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `information_description`
-- ----------------------------
DROP TABLE IF EXISTS `information_description`;
CREATE TABLE `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `information_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `information_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `layout`
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `layout_module`
-- ----------------------------
DROP TABLE IF EXISTS `layout_module`;
CREATE TABLE `layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(20) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `layout_route`
-- ----------------------------
DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `length_class`
-- ----------------------------
DROP TABLE IF EXISTS `length_class`;
CREATE TABLE `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `length_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `length_class_description`;
CREATE TABLE `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `location`
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manufacturer_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer_to_store`;
CREATE TABLE `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketing`
-- ----------------------------
DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `modification`
-- ----------------------------
DROP TABLE IF EXISTS `modification`;
CREATE TABLE `modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `option`
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `option_description`
-- ----------------------------
DROP TABLE IF EXISTS `option_description`;
CREATE TABLE `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `option_value`
-- ----------------------------
DROP TABLE IF EXISTS `option_value`;
CREATE TABLE `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `option_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `option_value_description`;
CREATE TABLE `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `order_custom_field`;
CREATE TABLE `order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_fraud`
-- ----------------------------
DROP TABLE IF EXISTS `order_fraud`;
CREATE TABLE `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_history`
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_option`
-- ----------------------------
DROP TABLE IF EXISTS `order_option`;
CREATE TABLE `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_recurring`
-- ----------------------------
DROP TABLE IF EXISTS `order_recurring`;
CREATE TABLE `order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_recurring_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `order_recurring_transaction`;
CREATE TABLE `order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_total`
-- ----------------------------
DROP TABLE IF EXISTS `order_total`;
CREATE TABLE `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_description`
-- ----------------------------
DROP TABLE IF EXISTS `product_description`;
CREATE TABLE `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_discount`
-- ----------------------------
DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_filter`
-- ----------------------------
DROP TABLE IF EXISTS `product_filter`;
CREATE TABLE `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2545 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_option`
-- ----------------------------
DROP TABLE IF EXISTS `product_option`;
CREATE TABLE `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `product_option_value`;
CREATE TABLE `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_recurring`
-- ----------------------------
DROP TABLE IF EXISTS `product_recurring`;
CREATE TABLE `product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_related`
-- ----------------------------
DROP TABLE IF EXISTS `product_related`;
CREATE TABLE `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_reward`
-- ----------------------------
DROP TABLE IF EXISTS `product_reward`;
CREATE TABLE `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=549 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_special`
-- ----------------------------
DROP TABLE IF EXISTS `product_special`;
CREATE TABLE `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=504 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_to_download`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_download`;
CREATE TABLE `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_layout`;
CREATE TABLE `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `product_to_store`;
CREATE TABLE `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `recurring`
-- ----------------------------
DROP TABLE IF EXISTS `recurring`;
CREATE TABLE `recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `recurring_description`
-- ----------------------------
DROP TABLE IF EXISTS `recurring_description`;
CREATE TABLE `recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `return`
-- ----------------------------
DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `return_action`
-- ----------------------------
DROP TABLE IF EXISTS `return_action`;
CREATE TABLE `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `return_history`
-- ----------------------------
DROP TABLE IF EXISTS `return_history`;
CREATE TABLE `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `return_reason`
-- ----------------------------
DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `return_status`
-- ----------------------------
DROP TABLE IF EXISTS `return_status`;
CREATE TABLE `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `search_key`
-- ----------------------------
DROP TABLE IF EXISTS `search_key`;
CREATE TABLE `search_key` (
  `search_id` int(128) NOT NULL AUTO_INCREMENT COMMENT '搜索ID',
  `search_key` varchar(128) NOT NULL COMMENT '搜索关键词',
  `search_date` datetime NOT NULL COMMENT '搜索时间',
  `account_id` varchar(128) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `seller_verified`
-- ----------------------------
DROP TABLE IF EXISTS `seller_verified`;
CREATE TABLE `seller_verified` (
  `verified_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `verified_type` int(1) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `paperwork_type` int(1) NOT NULL,
  `paperwork_number` varchar(20) CHARACTER SET utf8 NOT NULL,
  `validity_start` date NOT NULL,
  `validity_end` date NOT NULL,
  `positive_card` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `back_card` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `holding_card` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bank` varchar(40) CHARACTER SET utf8 NOT NULL,
  `bank_address` varchar(128) CHARACTER SET utf8 NOT NULL,
  `bank_number` varchar(18) CHARACTER SET utf8 NOT NULL,
  `add_date` datetime NOT NULL,
  `by_time` datetime NOT NULL,
  `additional` text CHARACTER SET utf8,
  PRIMARY KEY (`verified_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9099 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `stock_status`
-- ----------------------------
DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `upload`
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `url_alias`
-- ----------------------------
DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=964 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voucher_history`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voucher_theme`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_theme`;
CREATE TABLE `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voucher_theme_description`
-- ----------------------------
DROP TABLE IF EXISTS `voucher_theme_description`;
CREATE TABLE `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weight_class`
-- ----------------------------
DROP TABLE IF EXISTS `weight_class`;
CREATE TABLE `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weight_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `weight_class_description`;
CREATE TABLE `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zone`
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zone_to_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `zone_to_geo_zone`;
CREATE TABLE `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `address` VALUES ('9','9','我是测试一','龙江xc','','25','13','');
INSERT INTO `attribute` VALUES ('1','6','1'), ('2','6','5'), ('3','6','3'), ('4','3','1'), ('5','3','2'), ('6','3','3'), ('7','3','4'), ('8','3','5'), ('9','3','6'), ('10','3','7'), ('11','3','8');
INSERT INTO `attribute_description` VALUES ('1','1','Description'), ('2','1','No. of Cores'), ('4','1','test 1'), ('5','1','test 2'), ('6','1','test 3'), ('7','1','test 4'), ('8','1','test 5'), ('9','1','test 6'), ('10','1','test 7'), ('11','1','test 8'), ('3','1','Clockspeed'), ('1','2','Description'), ('2','2','No. of Cores'), ('4','2','test 1'), ('5','2','test 2'), ('6','2','test 3'), ('7','2','test 4'), ('8','2','test 5'), ('9','2','test 6'), ('10','2','test 7'), ('11','2','test 8'), ('3','2','Clockspeed');
INSERT INTO `attribute_group` VALUES ('3','2'), ('4','1'), ('5','3'), ('6','4');
INSERT INTO `attribute_group_description` VALUES ('3','1','Memory'), ('4','1','Technical'), ('5','1','Motherboard'), ('6','1','Processor'), ('3','2','Memory'), ('4','2','Technical'), ('5','2','Motherboard'), ('6','2','Processor');
INSERT INTO `banner` VALUES ('6','HP Products','1',NULL), ('7','首页幻灯片','1',NULL), ('8','品牌模块首页','1','catalog/lazyload/ajax-loader130x100.gif'), ('12','用户登陆','1',NULL), ('10','首页001','1',NULL), ('11','首页右栏','1',NULL), ('13','用户注册','1',NULL), ('14','首页右栏1小','1',NULL), ('15','首页600x250中间','1',NULL), ('16','首页585400','1','catalog/lazyload/ajax-loader585x400.gif'), ('17','首页285400左','1','catalog/lazyload/ajax-loader285x400.gif');
INSERT INTO `banner_image` VALUES ('119','10','','catalog/zuopin/1.jpg','0'), ('273','8','','catalog/banner/1258888/21307064332015043009442351555.jpg','0'), ('272','8','','catalog/banner/1258888/21307064332015043009443359424.jpg','0'), ('271','8','','catalog/banner/1258888/21307064332015043009444194484.jpg','0'), ('270','8','','catalog/banner/1258888/21307064332015043009445116506.jpg','0'), ('269','8','','catalog/banner/1258888/21307064332015043009450187975.jpg','0'), ('258','16','','catalog/banner/585400/2483313632015060810301131543.jpg','0'), ('257','16','','catalog/banner/585400/2483313632015060810302798569.jpg','0'), ('256','16','','catalog/banner/585400/2483313632015060810295363704.JPG','0'), ('268','8','','catalog/banner/1258888/21307064332015043009451197294.jpg','0'), ('267','8','','catalog/banner/1258888/21307064332015043009462223672.jpg','0'), ('266','8','','catalog/banner/1258888/21307064332015043009452332423.jpg','0'), ('265','8','','catalog/banner/1258888/21307064332015043009453452398.jpg','0'), ('264','8','','catalog/banner/1258888/21307064332015043009454468364.jpg','0'), ('263','8','','catalog/banner/1258888/21307064332015043009455887926.jpg','0'), ('262','8','','catalog/banner/1258888/21307064332015043009461194718.jpg','0'), ('180','11','','catalog/banner/225/21307064332015043010040468570.jpg','0'), ('181','11','','catalog/banner/225/21307064332015043010040731099.jpg','0'), ('182','11','','catalog/banner/225/21307064332015043010041123411.jpg','0'), ('198','12','','catalog/banner/21307064332015050206095293941.jpg','0'), ('197','12','','catalog/banner/21307064332015050206094248092.jpg','0'), ('233','13','','catalog/banner/21307064332015050206045877964.jpg','80'), ('232','13','','catalog/banner/21307064332015050206043711175.jpg','50'), ('231','13','','catalog/banner/21307064332015050206051370595.jpg','11'), ('215','6','index.php?route=product/manufacturer/info&amp;manufacturer_id=7','catalog/product/21307064332015051303254349116.jpg','0'), ('255','7','','catalog/banner/870400/2483304622015060809574571357.jpg','720'), ('229','14','','catalog/zuopin/21307064332015051407433981177.jpg','0'), ('230','14','','catalog/zuopin/21307064332015051407435458054.jpg','0'), ('254','7','','catalog/banner/870400/2483304622015060809584071038.JPG','225'), ('240','15','','catalog/banner/600x250/21307064332015060205161554741.jpg','0'), ('241','15','','catalog/banner/600x250/21307064332015060205161193971.jpg','0'), ('242','15','','catalog/banner/600x250/21307064332015060205161935452.jpg','0'), ('243','15','','catalog/banner/600x250/21307064332015060205160258930.jpg','0'), ('244','15','','catalog/banner/600x250/21307064332015060205160768721.jpg','0'), ('261','17','','catalog/banner/285400/2483313632015060810372029732.jpg','0'), ('260','17','','catalog/banner/285400/2483313632015060810370934211.jpg','0'), ('259','17','','catalog/banner/285400/2483313632015060810370217255.jpg','0');
INSERT INTO `banner_image_description` VALUES ('215','1','6','HP Banner'), ('271','2','8','Coca Cola'), ('270','1','8','Sony'), ('270','2','8','Sony'), ('269','1','8','RedBull'), ('269','2','8','RedBull'), ('268','1','8','NFL'), ('258','2','16','1111111111111111'), ('215','2','6','HP Banner'), ('268','2','8','NFL'), ('267','1','8','又双双'), ('267','2','8','999999'), ('266','1','8','Harley Davidson'), ('119','2','10','2222222222222222'), ('119','1','10','44444444444444444444444'), ('266','2','8','Harley Davidson'), ('265','1','8','Dell'), ('265','2','8','Dell'), ('264','1','8','Disney'), ('264','2','8','Disney'), ('263','1','8','Starbucks'), ('263','2','8','Starbucks'), ('262','1','8','Nintendo'), ('262','2','8','Nintendo'), ('181','2','11','777777777777'), ('180','1','11','99999999999999'), ('180','2','11','88888888888'), ('181','1','11','33333333333333333'), ('182','2','11','88888888888888'), ('182','1','11','55555555555555555'), ('198','2','12','ggggggggggg'), ('197','1','12','bbbbbbbbbbbbbbb'), ('197','2','12','大厦大厦大厦大厦d'), ('232','1','13','wwwwwwwwwwwwwwwwwwwwwwwwww'), ('232','2','13','大厦大厦大厦大厦大厦大厦dc'), ('231','1','13','kkkkkkkkkkkkkkk'), ('231','2','13','ttttttttt'), ('198','1','12','fffffffffffffffff'), ('255','2','7','66666666666666'), ('255','1','7','999999999999999999999999999'), ('229','1','14','月月月月月有'), ('229','2','14','木木木森'), ('230','2','14','7777777777777777'), ('230','1','14','2222222222222222'), ('233','2','13','6666666666666'), ('233','1','13','7777777777777777777'), ('254','1','7','8888888888888888888888'), ('254','2','7','9999999999999999'), ('240','2','15','rrrrrrrrrrrrrrrrrrrr'), ('240','1','15','rrrrrrrrrrrrrrrrrrrr'), ('241','2','15','rrrrrrrrrrrrrrrrrrrr'), ('241','1','15','rrrrrrrrrrrrrrrrrrrr'), ('242','2','15','rrrrrrrrrrrrrrrrrrrr'), ('242','1','15','rrrrrrrrrrrrrrrrrrrr'), ('243','2','15','rrrrrrrrrrrrrrrrrrrr'), ('243','1','15','rrrrrrrrrrrrrrrrrrrr'), ('244','2','15','rrrrrrrrrrrrrrrrrrrr'), ('244','1','15','rrrrrrrrrrrrrrrrrrrr'), ('257','1','16','大厦大厦大厦'), ('257','2','16','药材大'), ('256','1','16','这是一块神奇的表'), ('256','2','16','这是一块神奇的表'), ('261','2','17','火狐狸'), ('260','1','17','魔力天使'), ('260','2','17','魔力天使'), ('259','1','17','天使之泪'), ('259','2','17','天使之泪'), ('258','1','16','大厦大厦大厦大厦磊'), ('261','1','17','火狐狸'), ('271','1','8','Coca Cola'), ('272','2','8','Burger King'), ('272','1','8','Burger King'), ('273','2','8','Canon'), ('273','1','8','Canon');
INSERT INTO `category` VALUES ('25','','0','1','1','3','1','a:9:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}i:4;a:1:{i:0;s:1:\"5\";}i:5;a:1:{i:0;s:1:\"6\";}i:6;a:1:{i:0;s:1:\"7\";}i:7;a:1:{i:0;s:1:\"8\";}i:8;a:1:{i:0;s:1:\"9\";}}','2009-01-31 01:04:25','2015-05-27 10:04:56'), ('27','','20','0','0','2','1','a:4:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-01-31 01:55:34','2010-08-22 06:32:15'), ('20','catalog/demo/compaq_presario.jpg','0','1','1','1','1','a:3:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-01-05 21:49:43','2015-05-27 11:01:25'), ('24','','0','1','1','5','1','a:2:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}}','2009-01-20 02:36:26','2015-05-27 09:49:21'), ('18','catalog/demo/hp_2.jpg','0','1','0','2','1','a:3:{i:0;a:1:{i:0;s:1:\"1\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-01-05 21:49:15','2015-05-27 10:52:40'), ('17','','0','1','1','4','1','a:5:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}i:8;a:1:{i:0;s:1:\"9\";}}','2009-01-03 21:08:57','2015-05-27 12:17:53'), ('28','','25','0','0','1','1','a:4:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-02-02 13:11:12','2010-08-22 06:32:46'), ('26','','20','0','0','1','1','a:4:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-01-31 01:55:14','2015-05-05 11:15:50'), ('29','','25','0','0','1','1','a:4:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}}','2009-02-02 13:11:37','2015-04-22 09:51:22'), ('30','','25','0','0','1','1','0','2009-02-02 13:11:59','2010-08-22 06:33:00'), ('31','','25','0','0','1','1','0','2009-02-03 14:17:24','2010-08-22 06:33:06'), ('32','','25','0','0','1','1','0','2009-02-03 14:17:34','2010-08-22 06:33:12'), ('33','catalog/demo/canon_eos_5d_2.jpg','0','1','8','6','1','a:7:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:5;a:1:{i:0;s:1:\"6\";}i:6;a:1:{i:0;s:1:\"7\";}i:7;a:1:{i:0;s:1:\"8\";}i:8;a:1:{i:0;s:1:\"9\";}}','2009-02-03 14:17:55','2015-05-27 12:17:36'), ('34','catalog/product/21307064332015043009104178153.jpg','0','1','4','7','1','a:3:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}}','2009-02-03 14:18:11','2015-05-27 11:02:37'), ('35','','28','0','0','0','1','0','2010-09-17 10:06:48','2010-09-18 14:02:42'), ('36','','28','0','0','0','1','0','2010-09-17 10:07:13','2010-09-18 14:02:55'), ('37','','34','0','0','0','1','0','2010-09-18 14:03:39','2011-04-22 01:55:08'), ('38','','34','0','0','0','1','0','2010-09-18 14:03:51','2010-09-18 14:03:51'), ('39','','34','0','0','0','1','0','2010-09-18 14:04:17','2011-04-22 01:55:20'), ('40','','34','0','0','0','1','0','2010-09-18 14:05:36','2010-09-18 14:05:36'), ('41','','34','0','0','0','1','0','2010-09-18 14:05:49','2011-04-22 01:55:30'), ('42','','34','0','0','0','1','0','2010-09-18 14:06:34','2010-11-07 20:31:04'), ('43','','34','0','0','0','1','0','2010-09-18 14:06:49','2011-04-22 01:55:40'), ('44','','34','0','0','0','1','0','2010-09-21 15:39:21','2010-11-07 20:30:55'), ('45','','18','0','0','0','1','0','2010-09-24 18:29:16','2011-04-26 08:52:11'), ('46','','33','0','0','0','1','','2010-09-24 18:29:31','2015-05-27 10:15:02'), ('47','','34','0','0','0','1','0','2010-11-07 11:13:16','2010-11-07 11:13:16'), ('48','','34','0','0','0','1','0','2010-11-07 11:13:33','2010-11-07 11:13:33'), ('49','','34','0','0','0','1','0','2010-11-07 11:14:04','2010-11-07 11:14:04'), ('50','','34','0','0','0','1','0','2010-11-07 11:14:23','2011-04-22 01:16:01'), ('51','','34','0','0','0','1','0','2010-11-07 11:14:38','2011-04-22 01:16:13'), ('52','','34','0','0','0','1','0','2010-11-07 11:16:09','2011-04-22 01:54:57'), ('53','','34','0','0','0','1','0','2010-11-07 11:28:53','2011-04-22 01:14:36'), ('54','','34','0','0','0','1','0','2010-11-07 11:29:16','2011-04-22 01:16:50'), ('55','','34','0','0','0','1','0','2010-11-08 10:31:32','2010-11-08 10:31:32'), ('56','','34','0','0','0','1','0','2010-11-08 10:31:50','2011-04-22 01:16:37'), ('57','','0','1','1','3','1','a:7:{i:0;a:1:{i:0;s:1:\"1\";}i:1;a:1:{i:0;s:1:\"2\";}i:2;a:1:{i:0;s:1:\"3\";}i:3;a:1:{i:0;s:1:\"4\";}i:4;a:1:{i:0;s:1:\"5\";}i:5;a:1:{i:0;s:1:\"6\";}i:6;a:1:{i:0;s:1:\"7\";}}','2011-04-26 08:53:16','2015-05-27 12:06:01'), ('58','','52','0','0','0','1','0','2011-05-08 13:44:16','2011-05-08 13:44:16'), ('59','','0','1','1','0','1','a:8:{i:3;a:1:{i:0;s:1:\"4\";}i:4;a:1:{i:0;s:1:\"5\";}i:5;a:1:{i:0;s:1:\"6\";}i:6;a:1:{i:0;s:1:\"7\";}i:7;a:1:{i:0;s:1:\"8\";}i:8;a:1:{i:0;s:1:\"9\";}i:9;a:1:{i:0;s:1:\"1\";}s:175:\"&lt;b&gt;Notice&lt;/b&gt;: Undefined index: category_position_id in &lt;b&gt;E:\\wamp\\www\\admin\\view\\template\\catalog\\category_form.tpl&lt;/b&gt; on line &lt;b&gt;176&lt;/b&gt;\";a:2:{i:0;s:169:\"&lt;b&gt;Notice&lt;/b&gt;: Undefined index: position_value in &lt;b&gt;E:\\wamp\\www\\admin\\view\\template\\catalog\\category_form.tpl&lt;/b&gt; on line &lt;b&gt;176&lt;/b&gt;\";i:1;s:169:\"&lt;b&gt;Notice&lt;/b&gt;: Undefined index: position_value in &lt;b&gt;E:\\wamp\\www\\admin\\view\\template\\catalog\\category_form.tpl&lt;/b&gt; on line &lt;b&gt;176&lt;/b&gt;\";}}','2015-05-27 12:11:32','2015-06-13 09:11:10');
INSERT INTO `category_description` VALUES ('28','1','Monitors','','',NULL,'',''), ('32','1','Web Cameras','','',NULL,'',''), ('31','1','Scanners','','',NULL,'',''), ('30','1','Printers','','',NULL,'',''), ('27','1','Mac','','',NULL,'',''), ('25','1','Components','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Components','','',''), ('20','1','Desktops','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','Desktops','','Example of category description',''), ('35','1','test 1','','',NULL,'',''), ('36','1','test 2','','',NULL,'',''), ('37','1','test 5','','',NULL,'',''), ('38','1','test 4','','',NULL,'',''), ('39','1','test 6','','',NULL,'',''), ('40','1','test 7','','',NULL,'',''), ('41','1','test 8','','',NULL,'',''), ('42','1','test 9','','',NULL,'',''), ('43','1','test 11','','',NULL,'',''), ('34','1','MP3 Players','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3 Players','','',''), ('18','1','Laptops &amp; Notebooks','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','Laptops &amp; Notebooks','','',''), ('44','1','test 12','','',NULL,'',''), ('45','1','Windows','','',NULL,'',''), ('47','1','test 15','','',NULL,'',''), ('48','1','test 16','','',NULL,'',''), ('49','1','test 17','','',NULL,'',''), ('50','1','test 18','','',NULL,'',''), ('51','1','test 19','','',NULL,'',''), ('52','1','test 20','','',NULL,'',''), ('53','1','test 21','','',NULL,'',''), ('54','1','test 22','','',NULL,'',''), ('55','1','test 23','','',NULL,'',''), ('56','1','test 24','','',NULL,'',''), ('58','1','test 25','','',NULL,'',''), ('28','2','Monitors','','',NULL,'',''), ('33','2','相机','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','单反相机','','',''), ('32','2','Web Cameras','','',NULL,'',''), ('31','2','Scanners','','',NULL,'',''), ('30','2','Printers','','',NULL,'',''), ('29','2','鼠标/键盘','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','鼠标/键盘',NULL,'',''), ('27','2','Mac','','',NULL,'',''), ('17','2','软件','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','电脑软件','','',''), ('24','2','手机和平板','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','手机和平板','','',''), ('20','2','台式电脑','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','台式电脑','Example of category description','Example of category description',''), ('35','2','test 1','','',NULL,'',''), ('36','2','test 2','','',NULL,'',''), ('37','2','test 5','','',NULL,'',''), ('38','2','test 4','','',NULL,'',''), ('39','2','test 6','','',NULL,'',''), ('40','2','test 7','','',NULL,'',''), ('41','2','test 8','','',NULL,'',''), ('42','2','test 9','','',NULL,'',''), ('43','2','test 11','','',NULL,'',''), ('34','2','MP3音乐播放器','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3音乐播放器','','',''), ('18','2','笔记本电脑','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','笔记本电脑','','',''), ('44','2','test 12','','',NULL,'',''), ('45','2','Windows','','',NULL,'',''), ('46','2','Macs','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','555555555555555','','',''), ('47','2','test 15','','',NULL,'',''), ('48','2','test 16','','',NULL,'',''), ('49','2','test 17','','',NULL,'',''), ('50','2','test 18','','',NULL,'',''), ('51','2','test 19','','',NULL,'',''), ('52','2','test 20','','',NULL,'',''), ('53','2','test 21','','',NULL,'',''), ('54','2','test 22','','',NULL,'',''), ('55','2','test 23','','',NULL,'',''), ('56','2','test 24','','',NULL,'',''), ('57','2','平板电脑','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','平板电脑','','',''), ('58','2','test 25','','',NULL,'',''), ('33','1','Cameras','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Cameras','','',''), ('29','1','Mice and Trackballs','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Mice and Trackballs',NULL,'',''), ('25','2','电脑配件','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','电脑配件','','',''), ('57','1','Tablets','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Tablets','','',''), ('17','1','Software','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Software','','',''), ('24','1','Phones &amp; PDAs','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Phones &amp; PDAs','','',''), ('26','2','PC','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','555555555555555555555555555','http://www.baidu.com/','',''), ('26','1','PC','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','http://www.baidu.com/','http://www.baidu.com/','',''), ('46','1','Macs','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','大厦dddd','','',''), ('59','2','首页','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','首页d ','http://www.lvxingtoc.com/index.php?route=common/home','',''), ('59','1','home','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','home','http://www.lvxingtoc.com/index.php?route=common/home','','');
INSERT INTO `category_path` VALUES ('25','25','0'), ('28','28','1'), ('28','25','0'), ('35','35','2'), ('35','28','1'), ('35','25','0'), ('36','36','2'), ('36','28','1'), ('36','25','0'), ('29','29','1'), ('29','25','0'), ('30','30','1'), ('30','25','0'), ('31','31','1'), ('31','25','0'), ('32','32','1'), ('32','25','0'), ('20','20','0'), ('27','27','1'), ('27','20','0'), ('26','26','1'), ('26','20','0'), ('24','24','0'), ('18','18','0'), ('45','45','1'), ('45','18','0'), ('46','46','1'), ('46','33','0'), ('17','17','0'), ('33','33','0'), ('34','34','0'), ('37','37','1'), ('37','34','0'), ('38','38','1'), ('38','34','0'), ('39','39','1'), ('39','34','0'), ('40','40','1'), ('40','34','0'), ('41','41','1'), ('41','34','0'), ('42','42','1'), ('42','34','0'), ('43','43','1'), ('43','34','0'), ('44','44','1'), ('44','34','0'), ('47','47','1'), ('47','34','0'), ('48','48','1'), ('48','34','0'), ('49','49','1'), ('49','34','0'), ('50','50','1'), ('50','34','0'), ('51','51','1'), ('51','34','0'), ('52','52','1'), ('52','34','0'), ('58','58','2'), ('58','52','1'), ('58','34','0'), ('53','53','1'), ('53','34','0'), ('54','54','1'), ('54','34','0'), ('55','55','1'), ('55','34','0'), ('56','56','1'), ('56','34','0'), ('57','57','0'), ('59','59','0');
INSERT INTO `category_to_layout` VALUES ('33','0','0'), ('29','0','0'), ('25','0','0'), ('57','0','0'), ('17','0','0'), ('24','0','0'), ('46','0','0'), ('20','0','1'), ('18','0','0'), ('26','0','0'), ('34','0','0'), ('59','0','0');
INSERT INTO `category_to_position` VALUES ('1','首页分类','2'), ('2','分类显示','3'), ('3','商家后台导航','4'), ('4','商家后台分类','5'), ('5','用户后台导航','6'), ('6','用户后台分类','7'), ('7','店铺导航','8'), ('8','店铺分类','9'), ('9','首页导航','1');
INSERT INTO `category_to_store` VALUES ('17','0'), ('18','0'), ('20','0'), ('24','0'), ('25','0'), ('26','0'), ('27','0'), ('28','0'), ('29','0'), ('30','0'), ('31','0'), ('32','0'), ('33','0'), ('34','0'), ('35','0'), ('36','0'), ('37','0'), ('38','0'), ('39','0'), ('40','0'), ('41','0'), ('42','0'), ('43','0'), ('44','0'), ('45','0'), ('46','0'), ('47','0'), ('48','0'), ('49','0'), ('50','0'), ('51','0'), ('52','0'), ('53','0'), ('54','0'), ('55','0'), ('56','0'), ('57','0'), ('58','0'), ('59','0');
INSERT INTO `country` VALUES ('1','北京市','','','','0','1'), ('2','天津市','','','','0','1'), ('3','河北省','','','','0','1'), ('4','山西省','','','','0','1'), ('5','内蒙古自治区','','','','0','1'), ('6','辽宁省','','','','0','1'), ('7','吉林省','','','','0','1'), ('8','黑龙江省','','','','0','1'), ('9','上海市','','','','0','1'), ('10','江苏省','','','','0','1'), ('11','浙江省','','','','0','1'), ('12','安徽省','','','','0','1'), ('13','福建省','','','','0','1'), ('14','江西省','','','','0','1'), ('15','山东省','','','','0','1'), ('16','河南省','','','','0','1'), ('17','湖北省','','','','0','1'), ('18','湖南省','','','','0','1'), ('19','广东省','','','','0','1'), ('20','广西壮族自治区','','','','0','1'), ('21','海南省','','','','0','1'), ('22','重庆市','','','','0','1'), ('23','四川省','','','','0','1'), ('24','贵州省','','','','0','1'), ('25','云南省','','','','0','1'), ('26','西藏自治区','','','','0','1'), ('27','陕西省','','','','0','1'), ('28','甘肃省','','','','0','1'), ('29','青海省','','','','0','1'), ('30','宁夏回族自治区','','','','0','1'), ('31','新疆维吾尔自治区','','','','0','1'), ('32','香港特别行政区','','','','0','1'), ('33','澳门特别行政区','','','','0','1'), ('34','台湾省','','','','0','1');
INSERT INTO `coupon` VALUES ('5','Free Shipping','3333','P','0.0000','0','1','100.0000','2014-01-01','2014-02-01','10','10','0','2009-03-14 21:13:53'), ('6','-10.00 Discount','1111','F','10.0000','0','0','10.0000','2014-01-01','2020-01-01','100000','10000','0','2009-03-14 21:15:18');
INSERT INTO `currency` VALUES ('4','人民币','RMB','¥','','2','1.00000000','1','2015-06-27 05:05:09'), ('2','US Dollar','USD','$','','2','0.16140001','1','2015-04-24 12:14:47');
INSERT INTO `customer` VALUES ('9','1','0','我是测试一','demo@demo.com','12345678911','af13b7427a5da57b8c62c3ed156f1c8d092b2fde','11dcd2c24','a:0:{}','a:2:{i:0;i:50;i:1;i:52;}','1','9','','127.0.0.1','1','1','0','','2015-06-06 10:47:01','a:2:{s:6:\"access\";a:4:{i:0;s:15:\"account/account\";i:1;s:15:\"account/address\";i:2;s:16:\"account/download\";i:3;s:12:\"account/edit\";}s:6:\"modify\";a:6:{i:0;s:15:\"account/account\";i:1;s:15:\"account/address\";i:2;s:16:\"account/download\";i:3;s:12:\"account/edit\";i:4;s:12:\"account/file\";i:5;s:17:\"account/forgotten\";}}');
INSERT INTO `customer_activity` VALUES ('1','1','register','a:2:{s:11:\"customer_id\";i:1;s:4:\"name\";s:13:\"1252522 10210\";}','127.0.0.1','2015-04-08 17:59:06'), ('2','1','order_account','a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:13:\"1252522 10210\";s:8:\"order_id\";i:1;}','127.0.0.1','2015-04-08 18:01:56'), ('3','2','register','a:2:{s:11:\"customer_id\";i:2;s:4:\"name\";s:4:\"dddd\";}','127.0.0.1','2015-04-18 16:51:54'), ('4','2','order_account','a:3:{s:11:\"customer_id\";s:1:\"2\";s:4:\"name\";s:4:\"dddd\";s:8:\"order_id\";i:2;}','127.0.0.1','2015-04-18 16:55:47'), ('5','3','register','a:2:{s:11:\"customer_id\";i:3;s:4:\"name\";s:6:\"李三\";}','127.0.0.1','2015-04-25 16:54:14'), ('6','3','login','a:2:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:6:\"李三\";}','127.0.0.1','2015-04-25 19:50:31'), ('7','3','forgotten','a:2:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:6:\"李三\";}','127.0.0.1','2015-04-27 11:38:32'), ('8','0','order_guest','a:2:{s:4:\"name\";s:9:\"大人物\";s:8:\"order_id\";i:0;}','127.0.0.1','2015-04-28 16:01:10'), ('9','3','address_add','a:2:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";}','127.0.0.1','2015-04-28 16:08:28'), ('10','3','address_add','a:2:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";}','127.0.0.1','2015-04-28 16:08:42'), ('11','3','address_add','a:2:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";}','127.0.0.1','2015-04-28 16:27:53'), ('12','3','order_account','a:3:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";s:8:\"order_id\";i:0;}','127.0.0.1','2015-04-28 16:28:16'), ('13','3','order_account','a:3:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";s:8:\"order_id\";i:0;}','127.0.0.1','2015-04-28 16:40:18'), ('14','3','order_account','a:3:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";s:8:\"order_id\";i:3;}','127.0.0.1','2015-04-28 16:51:25'), ('15','3','order_account','a:3:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";s:8:\"order_id\";i:4;}','127.0.0.1','2015-04-28 17:20:00'), ('16','1','order_account','a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:7:\"1252522\";s:8:\"order_id\";i:5;}','127.0.0.1','2015-04-28 17:22:13'), ('17','3','order_account','a:3:{s:11:\"customer_id\";s:1:\"3\";s:4:\"name\";s:9:\"李大三\";s:8:\"order_id\";i:6;}','127.0.0.1','2015-05-02 18:52:38'), ('18','5','login','a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:4:\"1211\";}','127.0.0.1','2015-05-23 11:57:06'), ('19','5','address_edit','a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:4:\"1211\";}','127.0.0.1','2015-05-23 11:59:08'), ('20','5','login','a:2:{s:11:\"customer_id\";s:1:\"5\";s:4:\"name\";s:4:\"1211\";}','127.0.0.1','2015-05-23 12:00:17'), ('21','6','login','a:2:{s:11:\"customer_id\";s:1:\"6\";s:4:\"name\";s:0:\"\";}','127.0.0.1','2015-05-25 10:48:57'), ('22','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','222.219.170.196','2015-06-06 10:47:39'), ('23','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 10:41:36'), ('24','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 10:54:26'), ('25','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 11:21:59'), ('26','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 11:24:51'), ('27','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 16:59:15'), ('28','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-12 17:11:19'), ('29','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-13 09:05:09'), ('30','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-13 11:36:50'), ('31','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-15 08:41:05'), ('32','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-15 08:47:46'), ('33','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-15 08:54:11'), ('34','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-15 08:54:57'), ('35','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-15 16:19:15'), ('36','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-16 09:50:42'), ('37','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-16 11:52:56'), ('38','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-16 17:57:30'), ('39','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-17 10:38:20'), ('40','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','222.219.164.6','2015-06-18 23:04:12'), ('41','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','222.219.164.178','2015-06-21 14:07:48'), ('42','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-22 17:19:16'), ('43','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-23 09:52:22'), ('44','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-24 09:15:47'), ('45','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:7;}','127.0.0.1','2015-06-24 09:29:05'), ('46','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:8;}','127.0.0.1','2015-06-24 10:04:22'), ('47','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:9;}','127.0.0.1','2015-06-24 10:20:38'), ('48','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:18;}','127.0.0.1','2015-06-24 10:45:32'), ('49','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:19;}','127.0.0.1','2015-06-24 11:23:53'), ('50','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-26 11:22:46'), ('51','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:20;}','127.0.0.1','2015-06-26 11:25:33'), ('52','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:21;}','127.0.0.1','2015-06-26 11:33:23'), ('53','9','login','a:2:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";}','127.0.0.1','2015-06-27 14:53:11'), ('54','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:22;}','127.0.0.1','2015-06-27 14:53:23'), ('55','9','order_account','a:3:{s:11:\"customer_id\";s:1:\"9\";s:4:\"name\";s:15:\"我是测试一\";s:8:\"order_id\";i:23;}','127.0.0.1','2015-06-27 16:29:38');
INSERT INTO `customer_group` VALUES ('1','0','1','a:2:{s:6:\"access\";a:11:{i:0;s:15:\"account/account\";i:1;s:15:\"account/address\";i:2;s:16:\"account/download\";i:3;s:12:\"account/edit\";i:4;s:12:\"account/file\";i:5;s:17:\"account/forgotten\";i:6;s:13:\"account/login\";i:7;s:14:\"account/logout\";i:8;s:15:\"account/success\";i:9;s:19:\"account/transaction\";i:10;s:15:\"product/product\";}s:6:\"modify\";a:7:{i:0;s:15:\"account/account\";i:1;s:15:\"account/address\";i:2;s:16:\"account/download\";i:3;s:12:\"account/edit\";i:4;s:12:\"account/file\";i:5;s:17:\"account/forgotten\";i:6;s:18:\"account/newsletter\";}}'), ('2','1','2','a:1:{s:6:\"access\";a:2:{i:0;s:15:\"account/account\";i:1;s:15:\"account/address\";}}');
INSERT INTO `customer_group_description` VALUES ('1','2','普通客户','test'), ('2','2','商家用户',''), ('2','1','Business',''), ('1','1','Default','test');
INSERT INTO `customer_ip` VALUES ('6','9','222.219.170.196','2015-06-06 10:47:39'), ('7','9','222.219.164.49','2015-06-08 09:00:47'), ('8','9','127.0.0.1','2015-06-12 10:12:41'), ('9','9','222.219.164.6','2015-06-18 23:04:12'), ('10','9','222.219.164.178','2015-06-21 14:07:48');
INSERT INTO `customer_online` VALUES ('127.0.0.1','9','http://www.lvxingtoc.com/index.php?route=store/index&amp;store_id=0','http://www.lvxingtoc.com/index.php?route=product/search&amp;search=%E5%A5%B3','2015-06-27 10:29:01');
INSERT INTO `customer_transaction` VALUES ('1','9','0','','0.0000','2015-06-26 09:24:56');
INSERT INTO `extension` VALUES ('23','payment','cod'), ('22','total','shipping'), ('57','total','sub_total'), ('59','total','total'), ('410','module','banner'), ('426','module','carousel'), ('390','total','credit'), ('387','shipping','flat'), ('349','total','handling'), ('350','total','low_order_fee'), ('389','total','coupon'), ('413','module','category'), ('408','module','account'), ('393','total','reward'), ('398','total','voucher'), ('407','payment','free_checkout'), ('427','module','featured'), ('419','module','slideshow'), ('428','module','html'), ('430','module','store'), ('431','module','latest'), ('432','module','bestseller'), ('433','module','special'), ('434','module','filter'), ('435','module','information'), ('441','module','block_layout'), ('442','payment','bank_transfer'), ('443','payment','cheque');
INSERT INTO `geo_zone` VALUES ('3','UK VAT Zone','UK VAT','2010-02-26 22:33:24','2009-01-06 23:26:25'), ('4','UK Shipping','UK Shipping Zones','2010-12-15 15:18:13','2009-06-23 01:14:53');
INSERT INTO `information` VALUES ('3','1','3','1'), ('4','1','1','1'), ('5','1','4','1'), ('6','1','2','1');
INSERT INTO `information_description` VALUES ('4','2','关于我们','&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;一起走过的日子&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;翻书的时候,一片银杏叶悄然滑落,我弯腰拾起,惊觉,这是毕业时同桌送给我的,背面写着“珍重朋友”.不记得当时是否有种想哭的冲动,只是现在枯黄的叶片上,早已是滴滴泪痕.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;望着这片枯黄的银杏叶,眼前浮现出同桌灿烂的笑容,豪爽的话语,想起了我们之间的深厚友谊,想起了我们曾一起走过的日子.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;初中毕业前夕,依依不舍的他,唱起了我熟悉的歌曲：“如何面对,曾一起走过的日子,现在剩我独行……”勇敢的他留下了离别之泪.他缓慢从口袋中拿出一片树叶,递给我,沉默一会儿,对我说：“天下无不散之筵席,相处之后终有离别,一起走过的日子,如夕阳,夕阳无限好,只是近黄昏.”他顿了顿,接着说到,“一起走过的日子愿成为我们美好的回忆,青翠欲滴的银杏叶愿成为我们永久的纪念……”他没有说下去了,只是叫我珍重,千言万语道不尽的友谊,让我们彼此珍惜.我含泪高唱：&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;“朋友一生一起走,那些日子不再有,一句话,一辈子,一声情,一杯酒,朋友不曾孤单过……”&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;就这样,光阴一去不复返,朋友一去不相见,或许,现在,他也正静静的回忆着我们一起走过的日子.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;缘分让我们相识,或许上天早有安排,让我如此幸运,使我结识了一位真诚的朋友.的确,我是在一次偶然的机会认识的他.那是一个下雨天的在早晨,我们同在一家屋檐下躲雨,只因为这个缘故,我们成了好朋友,此后,我们在一起玩耍,一起学习,一起共度难关,一起讨论社会之事,每天形影不离,留下美好的回忆.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;还记得我们一起走过的日子,甜蜜之中稍有酸意,欢乐之中稍有伤感,幸福之中颇有不顺.但是,我们互相帮助,齐头并进,使我们走过的日子永远充满欢声笑语,永远幸福甜蜜.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;“世界上最宝贵的东西莫过于真挚的友谊,最幸福的事莫过于静静的回忆甜蜜的往事.”真诚的他、率真的我,坦然的走过、勇敢的面对、乐观的生活.只是往日嘻嘻哈哈的我们已不复存在,你不知在何方,也不知何时才能相逢,只有这几滴晶莹剔透泪水,寄托着我无比的思念.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;“喂,你在想什么?”同桌推了我一下.&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;“哦!没什么.”我从回忆中醒来,重新夹好那片银杏叶,心里默默地念道；&amp;nbsp;&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, \'Microsoft Yahei\', 宋体, sans-serif; font-size: 16px; line-height: 32px;&quot;&gt;“一起走过的日子,有你亦有我,亦有绚丽的彩虹”&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\r\n','关于我们','关于我们','关于我们'), ('5','2','条款和条件','&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;向戴尔采购产品及服务的行为将受到如下相关条款与条件的约束。请点击下列相关链接以获取适用于您的条款与条件。请仔细阅读相关条款与条件。如您不能通过下列链接获取您所适用的相关条款与条件，或希望在获取您所适用的相关的条款与条件上得到帮助，请联系戴尔的销售代表。&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-conditions-of-sale-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;硬件、软件和服务的商业销售条款&lt;/a&gt;(公司客户适用) - 适用于戴尔供应的硬件、软件和服务&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-consumer-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术支持条款和条件&lt;/a&gt;（消费者客户适用）- 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-non-consumer-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术支持条款和条件&lt;/a&gt;（非消费者客户适用） - 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-reseller-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术条款和条件&lt;/a&gt;（经销商适用） - 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-service-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;技术支持服务条款和条件&lt;/a&gt;&amp;nbsp;- 适用于为戴尔产品提供的修理和技术支持服务&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-customer-agreement-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;客户服务总协议&lt;/a&gt;&amp;nbsp;( 同样被称作戴尔专业服务标准条款和条件 )&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Purchases of Dell products and services are governed by the relevant terms and conditions as indicated below. Clicking on the relevant link below will take you to your relevant terms and conditions. Please review the relevant terms and conditions carefully. If you are unable to access the relevant terms and conditions from your relevant link or for assistance in obtaining a copy of your the relevant terms and conditions applicable to you, please contact your Dell sales representative .&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-of-sales-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Commercial Terms of Sales for the Sale of hardware, software and services&lt;/a&gt;&amp;nbsp;(FOR CORPORATE CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to hardware, software and services supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-consumer-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHNICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR CONSUMER CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-non-consumer-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHNICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR NON-CONSUMER CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-reseller-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHINICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR RESELLERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-services-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SERVICE AND SUPPORT&lt;/a&gt;&lt;br style=&quot;clear: both;&quot;&gt;- applicable to repair or technical support services provided for Dell products&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-customer-agreement-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Customer Master Services Agreement&lt;/a&gt;&lt;br style=&quot;clear: both;&quot;&gt;(also known as Dell Professional Services Standard terms and conditions)&lt;/p&gt;\r\n','条款和条件','条款和条件','条款和条件'), ('3','2','隐私政策','&lt;h2 id=&quot;q1&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;引言&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;腾讯重视用户的隐私。您在使用我们的服务时，我们可能会收集和使用您的相关信息。我们希望通过本《隐私政策》向您说明，在使用我们的服务时，我们如何收集、使用、储存和分享这些信息，以及我们为您提供的访问、更新、控制和保护这些信息的方式。本《隐私政策》与您所使用的腾讯服务息息相关，希望您仔细阅读，在需要时，按照本《隐私政策》的指引，作出您认为适当的选择。本《隐私政策》中涉及的相关技术词汇，我们尽量以简明扼要的表述，并提供进一步说明的链接，以便您的理解。&lt;/p&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;您使用或继续使用我们的服务，即意味着同意我们按照本《隐私政策》收集、使用、储存和分享您的相关信息。&lt;/h3&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;如对本《隐私政策》或相关事宜有任何问题，请通过&lt;a href=&quot;http://kf.qq.com/&quot; target=&quot;_blank&quot; style=&quot;outline: none; color: rgb(0, 0, 0);&quot;&gt;http://kf.qq.com/&lt;/a&gt;与我们联系。&lt;/p&gt;&lt;h2 id=&quot;q2&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;我们可能收集的信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们提供服务时，可能会收集、储存和使用下列与您有关的信息。如果您不提供相关信息，可能无法注册成为我们的用户或无法享受我们提供的某些服务，或者无法达到相关服务拟达到的效果。&lt;/p&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;您提供的信息&lt;/h3&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;您在注册账户或使用我们的服务时，向我们提供的相关个人信息，例如电话号码、电子邮件或银行卡号等；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;您通过我们的服务向其他方提供的共享信息，以及您使用我们的服务时所储存的信息。&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;其他方分享的您的信息&lt;/h3&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;其他方使用我们的服务时所提供有关您的共享信息。&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们获取的您的信息&lt;/h3&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;您使用服务时我们可能收集如下信息：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;日志信息，&lt;/strong&gt;指您使用我们的服务时，系统可能通过cookies、web beacon或其他方式自动采集的技术信息，包括：&lt;/li&gt;&lt;ul class=&quot;inner&quot; style=&quot;margin: 10px 10px 10px 0px; padding: 0px; list-style: none;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;设备或软件信息，例如您的移动设备、网页浏览器或用于接入我们服务的其他程序所提供的配置信息、您的IP地址和移动设备所用的版本和设备识别码；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;在使用我们服务时搜索或浏览的信息，例如您使用的网页搜索词语、访问的社交媒体页面url地址，以及您在使用我们服务时浏览或要求提供的其他信息和内容详情；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;有关您曾使用的移动应用（APP）和其他软件的信息，以及您曾经使用该等移动应用和软件的信息；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;您通过我们的服务进行通讯的信息，例如曾通讯的账号，以及通讯时间、数据和时长；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;您通过我们的服务分享的内容所包含的信息（元数据），例如拍摄或上传的共享照片或录像的日期、时间或地点等。&lt;/li&gt;&lt;/ul&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;位置信息，&lt;/strong&gt;指您开启设备定位功能并使用我们基于位置提供的相关服务时，收集的有关您位置的信息，包括：&lt;/li&gt;&lt;ul class=&quot;inner&quot; style=&quot;margin: 10px 10px 10px 0px; padding: 0px; list-style: none;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;您通过具有定位功能的移动设备使用我们的服务时，通过GPS或WiFi等方式收集的您的地理位置信息；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;您或其他用户提供的包含您所处地理位置的实时信息，例如您提供的账户信息中包含的您所在地区信息，您或其他人上传的显示您当前或曾经所处地理位置的共享信息，您或其他人共享的照片包含的地理标记信息；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;您可以通过关闭定位功能，停止对您的地理位置信息的收集。&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;h2 id=&quot;q3&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;我们可能如何使用信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们可能将在向您提供服务的过程之中所收集的信息用作下列用途：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;向您提供服务；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;在我们提供服务时，用于身份验证、客户服务、安全防范、诈骗监测、存档和备份用途，确保我们向您提供的产品和服务的安全性；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;帮助我们设计新服务，改善我们现有服务；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;使我们更加了解您如何接入和使用我们的服务，从而针对性地回应您的个性化需求，例如语言设定、位置设定、个性化的帮助服务和指示，或对您和其他用户作出其他方面的回应；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;向您提供与您更加相关的广告以替代普遍投放的广告；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;评估我们服务中的广告和其他促销及推广活动的效果，并加以改善；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;软件认证或管理软件升级；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;让您参与有关我们产品和服务的调查。&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;为了让您有更好的体验、改善我们的服务或您同意的其他用途，在符合相关法律法规的前提下，我们可能将通过某一项服务所收集的信息，以汇集信息或者个性化的方式，用于我们的其他服务。例如，在您使用我们的一项服务时所收集的信息，可能在另一服务中用于向您提供特定内容，或向您展示与您相关的、非普遍推送的信息。如果我们在相关服务中提供了相应选项，您也可以授权我们将该服务所提供和储存的信息用于我们的其他服务。&lt;/p&gt;&lt;h2 id=&quot;q4&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;您如何访问和控制自己的个人信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们将尽一切可能采取适当的技术手段，保证您可以访问、更新和更正自己的注册信息或使用我们的服务时提供的其他个人信息。在访问、更新、更正和删除前述信息时，我们可能会要求您进行身份验证，以保障账户安全。&lt;/p&gt;&lt;h2 id=&quot;q5&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;我们可能分享的信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;除以下情形外，&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;未经您同意&lt;/strong&gt;，我们以及我们的关联公司不会与任何第三方分享您的个人信息：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;我们以及我们的关联公司，可能将您的个人信息与我们的关联公司、合作伙伴及第三方服务供应商、承包商及代理（例如代表我们发出电子邮件或推送通知的通讯服务提供商、为我们提供位置数据的地图服务供应商）分享（他们可能并非位于您所在的法域），用作下列用途：&lt;/li&gt;&lt;ul class=&quot;inner&quot; style=&quot;margin: 10px 10px 10px 0px; padding: 0px; list-style: none;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;向您提供我们的服务；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;实现“我们可能如何使用信息”部分所述目的；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;履行我们在《腾讯服务协议》或本《隐私政策》中的义务和行使我们的权利；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;理解、维护和改善我们的服务。&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;如我们或我们的关联公司与任何上述第三方分享您的个人信息，我们将努力确保该等第三方在使用您的个人信息时遵守本《隐私政策》及我们要求其遵守的其他适当的保密和安全措施。&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;随着我们业务的持续发展，我们以及我们的关联公司有可能进行合并、收购、资产转让或类似的交易，您的个人信息有可能作为此类交易的一部分而被转移。我们将在转移前通知您。&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;我们或我们的关联公司还可能为以下需要而保留、保存或披露您的个人信息：&lt;/li&gt;&lt;ul class=&quot;inner&quot; style=&quot;margin: 10px 10px 10px 0px; padding: 0px; list-style: none;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;遵守适用的法律法规；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;遵守法院命令或其他法律程序的规定；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;遵守相关政府机关的要求；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% -482px no-repeat;&quot;&gt;为遵守适用的法律法规、维护社会公共利益，或保护我们的客户、我们或我们的集团公司、其他用户或雇员的人身和财产安全或合法权益所合理必需的用途。&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;h2 id=&quot;q6&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;信息安全&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们仅在本《隐私政策》所述目的所必需的期间和法律法规要求的时限内保留您的个人信息。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们使用各种安全技术和程序，以防信息的丢失、不当使用、未经授权阅览或披露。例如，在某些服务中，我们将利用加密技术（例如SSL）来保护您提供的个人信息。但请您理解，由于技术的限制以及可能存在的各种恶意手段，在互联网行业，即便竭尽所能加强安全措施，也不可能始终保证信息百分之百的安全。您需要了解，您接入我们的服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。&lt;/p&gt;&lt;h2 id=&quot;q7&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;您分享的信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们的多项服务，可让您不仅与自己的社交网络，也与使用该服务的所有用户公开分享您的相关信息，例如，您在我们的服务中所上传或发布的信息（包括您公开的个人信息、您建立的名单）、您对其他人上传或发布的信息作出的回应，以及包括与这些信息有关的位置数据和日志信息。使用我们服务的其他用户也有可能分享与您有关的信息（包括位置数据和日志信息）。特别是，我们的社交媒体服务，是专为使您与世界各地的用户共享信息而设计，您可以使共享信息实时、广泛地传递。只要您不删除共享信息，有关信息会一直留存在公共领域；即使您删除共享信息，有关信息仍可能由其他用户或不受我们控制的非关联第三方独立地缓存、复制或储存，或由其他用户或该等第三方在公共领域保存。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;因此，请您谨慎考虑通过我们的服务上传、发布和交流的信息内容。&lt;/strong&gt;在一些情况下，您可通过我们某些服务的隐私设定来控制有权浏览您共享信息的用户范围。如要求从我们的服务中删除您的相关信息，请通过该等特别服务条款提供的方式操作。&lt;/p&gt;&lt;h2 id=&quot;q8&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;您分享的敏感个人信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;某些个人信息因其特殊性可能被认为是敏感个人信息，例如您的种族、宗教、个人健康和医疗信息等。相比其他个人信息，敏感个人信息受到更加严格的保护。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;请注意，您在使用我们的服务时所提供、上传或发布的内容和信息（例如有关您社交活动的照片等信息），可能会泄露您的敏感个人信息。您需要谨慎地考虑，是否在使用我们的服务时披露相关敏感个人信息。&lt;/p&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;您同意按本《隐私政策》所述的目的和方式来处理您的敏感个人信息。&lt;/h3&gt;&lt;h2 id=&quot;q9&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;我们可能如何收集信息&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们或我们的第三方合作伙伴，可能通过cookies和web beacon收集和使用您的信息，并将该等信息储存为日志信息。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们使用自己的cookies和web beacon，目的是为您提供更个性化的用户体验和服务，并用于以下用途：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;记住您的身份。例如：cookies和web beacon有助于我们辨认您作为我们的注册用户的身份，或保存您向我们提供的有关您的喜好或其他信息；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;分析您使用我们服务的情况。例如，我们可利用cookies和web beacon来了解您使用我们的服务进行什么活动，或哪些网页或服务最受您的欢迎；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;广告优化。Cookies和web beacon有助于我们根据您的信息，向您提供与您相关的广告而非进行普遍的广告投放。&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们为上述目的使用cookies和web beacon的同时，可能将通过cookies和web beacon收集的非个人身份信息，经统计加工后提供给广告商或其他合作伙伴，用于分析用户如何使用我们的服务，并用于广告服务。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们的产品和服务上可能会有广告商或其他合作方放置的cookies和web beacon。这些cookies和web beacon可能会收集与您相关的非个人身份信息，以用于分析用户如何使用该等服务、向您发送您可能感兴趣的广告，或用于评估广告服务的效果。这些第三方cookies和web beacon收集和使用该等信息，不受本《隐私政策》约束，而是受相关使用者的隐私政策约束，我们不对第三方的cookies或web beacon承担责任。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;您可以通过浏览器设置拒绝或管理cookies或web beacon。但请注意，如果停用cookies或web beacon，您有可能无法享受最佳的服务体验，某些服务也可能无法正常使用。同时，您还会收到同样数量的广告，但这些广告与您的相关性会降低。&lt;/p&gt;&lt;h2 id=&quot;q10&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;广告服务&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们可能使用您的相关信息，向您提供与您更加相关的广告。&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们也可能使用您的信息，通过我们的服务、电子邮件或其他方式向您发送营销信息，提供或推广我们或第三方的如下商品和服务：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;我们的商品或服务，我们的关联公司和合作伙伴的商品或服务，包括即时通讯服务、网上媒体服务、互动娱乐服务、社交网络服务、付款服务、互联网搜索服务、位置和地图服务、应用软件和服务、数据管理软件和服务、网上广告服务、互联网金融，以及其他社交媒体、娱乐、电子商务、资讯和通讯软件或服务（统称“&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;互联网服务&lt;/strong&gt;”）；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;第三方互联网服务供应商，以及与下列有关的第三方商品或服务：食物和餐饮、体育、音乐、电影、电视、现场表演及其他艺术和娱乐、书册、杂志和其他刊物、服装和配饰、珠宝、化妆品、个人健康和卫生、电子、收藏品、家用器皿、电器、家居装饰和摆设、宠物、汽车、酒店、交通和旅游、银行、保险及其他金融服务、会员积分和奖励计划，以及我们认为可能与您相关的其他商品或服务。&lt;/li&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px;&quot;&gt;如您不希望我们将您的个人信息用作前述广告用途，您可以通过我们在广告中提供的相关提示，或在特定服务中提供的指引，要求我们停止为上述用途使用您的个人信息。&lt;/p&gt;&lt;/ul&gt;&lt;h2 id=&quot;q11&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;我们可能向您发送的邮件和信息&lt;/h2&gt;&lt;h4 style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 12px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;邮件和信息推送&lt;/h4&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;您在使用我们的服务时，我们可能使用您的信息向您的设备发送电子邮件、新闻或推送通知。如您不希望收到这些信息，可以按照我们的相关提示，在设备上选择取消订阅。&lt;/p&gt;&lt;h4 style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 12px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;与服务有关的公告&lt;/h4&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们可能在必要时（例如因系统维护而暂停某一项服务时）向您发出与服务有关的公告。您可能无法取消这些与服务有关、性质不属于推广的公告。&lt;/p&gt;&lt;h2 id=&quot;q12&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;隐私政策的适用例外&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们的服务可能包括或链接至第三方提供的社交媒体或其他服务（包括网站）。例如：&lt;/p&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;您利用 “分享”键将某些内容分享到我们的服务，或您利用第三方连线服务登录我们的服务。这些功能可能会收集您的相关信息（包括您的日志信息），并可能在您的电脑装置cookies，从而正常运行上述功能；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;我们通过广告或我们服务的其他方式向您提供链接，使您可以接入第三方的服务或网站。&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;该等第三方社交媒体或其他服务可能由相关的第三方或我们运营。您使用该等第三方的社交媒体服务或其他服务（包括您向该等第三方提供的任何个人信息），须受该第三方的服务条款及隐私政策（而非《通用服务条款》或本《隐私政策》）约束，您需要仔细阅读其条款。&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;本《隐私政策》仅适用于我们所收集的信息，并不适用于任何第三方提供的服务或第三方的信息使用规则，我们对任何第三方使用由您提供的信息不承担任何责任。&lt;/strong&gt;&lt;/p&gt;&lt;h2 id=&quot;q13&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;未成年人使用我们的服务&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们鼓励父母或监护人指导未满十八岁的未成年人使用我们的服务。我们建议未成年人鼓励他们的父母或监护人阅读本《隐私政策》，并建议未成年人在提交的个人信息之前寻求父母或监护人的同意和指导。&lt;/p&gt;&lt;h2 id=&quot;q14&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;隐私政策的适用范围&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;除某些特定服务外，我们所有的服务均适用本《隐私政策》。这些特定服务将适用特定的隐私政策。&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;针对某些特定服务的特定隐私政策，将更具体地说明我们在该等服务中如何使用您的信息。&lt;/strong&gt;该特定服务的隐私政策构成本《隐私政策》的一部分。&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;如相关特定服务的隐私政策与本《隐私政策》有不一致之处，适用该特定服务的隐私政策。&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;除本《隐私政策》另有规定外，本《隐私条款》所用词语将与《腾讯服务协议》所定义的词语具有相同的涵义。&lt;/p&gt;&lt;h3 style=&quot;margin: 20px 0px 10px; padding: 0px; font-size: 14px; font-weight: bold; line-height: 18px; color: rgb(53, 90, 119); font-family: 宋体, Arial, sans-serif;&quot;&gt;请您注意，本《隐私政策》不适用于以下情况：&lt;/h3&gt;&lt;ul style=&quot;margin: 10px 10px 10px 30px; padding: 0px; list-style: none; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif; line-height: 21px;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;通过我们的服务而接入的第三方服务（包括任何第三方网站）收集的信息；&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px 0px 0px 17px; font-size: 14px; line-height: 32px; background: url(http://mat1.gtimg.com/www/images/qq2012/privacyIcon.png) 0% 12px no-repeat;&quot;&gt;通过在我们服务中进行广告服务的其他公司或机构所收集的信息。&lt;/li&gt;&lt;/ul&gt;&lt;h2 id=&quot;q15&quot; style=&quot;margin: 38px 0px 10px; padding: 0px; font-size: 18px; font-family: 微软雅黑; height: 38px; line-height: 38px; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(24, 122, 199); text-indent: 16px; color: rgb(24, 122, 199); background: rgb(234, 241, 250);&quot;&gt;变更&lt;/h2&gt;&lt;p style=&quot;margin-top: 20px; margin-bottom: 10px; padding: 0px; font-size: 14px; line-height: 32px; color: rgb(0, 0, 0); font-family: 宋体, Arial, sans-serif;&quot;&gt;我们可能适时修订本《隐私政策》的条款，该等修订构成本《隐私政策》的一部分。&lt;strong style=&quot;color: rgb(53, 90, 119);&quot;&gt;如该等修订造成您在本《隐私政策》下权利的实质减少，我们将在修订生效前通过在主页上显著位置提示或向您发送电子邮件或以其他方式通知您。在该种情况下，若您继续使用我们的服务，即表示同意受经修订的本《隐私政策》的约束。&lt;/strong&gt;&lt;/p&gt;\r\n','隐私政策','隐私政策','隐私政策'), ('6','2','配送信息','&lt;div style=&quot;padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma, 宋体; font-size: 13px; line-height: 40px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; font-family: 宋体;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px;&quot;&gt;亲爱的用户您好，&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;font size=&quot;3&quot; style=&quot;padding: 0px; margin: 0px;&quot;&gt;&lt;span lang=&quot;EN-US&quot; style=&quot;padding: 0px; margin: 0px;&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/font&gt;&lt;/div&gt;&lt;div style=&quot;padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: Arial, Tahoma, 宋体; font-size: 13px; line-height: 40px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; font-size: 14px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; font-family: 宋体;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 由于产地直送商品是从原产地直接发货，故每一个地方运费均不相同，详细运费规则请查看相应店铺公告。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;\r\n','配送信息','配送信息','配送信息'), ('4','1','About Us','&lt;p&gt;As Time Goes By&lt;/p&gt;&lt;p&gt;Open book when a ginkgo leaf fall quietly, I bent down to pick up, shocked to find that this was given to me when I graduate at the same table, the back says &quot;treasure friends.&quot; Do not remember whether burst into tears, yellow leaves on just now, is already a bit of tears.&lt;/p&gt;&lt;p&gt;Looking at this piece of yellow leaves, emerged out of the same table in front of a bright smile, bold words, think of the deep friendship between us, I think we had together through the day.&lt;/p&gt;&lt;p&gt;On the eve of junior high school, reluctantly, he sang the song I am familiar: &quot;How to face the day had traveled together, and now I\'m left alone ......&quot; brave he left the tears of parting from him slowly. a leaf out of the pocket and handed it to me, for a moment of silence, said to me:. &quot;All good things banquet, after parting eventually get along together through the day, as the sunset, sunset is magnificent, it is almost dusk,&quot; he paused, then said, &quot;As Time Goes By is willing to become our memories, verdant Ginkgo biloba is willing to become our permanent memorial ......&quot; He did not say anymore, just told me to treasure, a thousand words undying friendship, let us cherish each other in tears, I sang:&lt;/p&gt;&lt;p&gt;&quot;My friends go with his life, those days are no longer there, in a word, life, love soon, a glass of wine, friends, never alone over ......&quot;&lt;/p&gt;&lt;p&gt;In this way, time gone, do not go to meet a friend, perhaps, now, he is also quietly memories with us through the day.&lt;/p&gt;&lt;p&gt;Fate let us know, maybe God already arranged, let me be so lucky that I met a sincere friend. Yes, I was in a chance to know him. It was a rainy day in the morning, we work with Under the shelter of a roof, just because of this reason, we became good friends, then, we play together, learn together, hard times together, discuss the social thing, inseparable day memories.&lt;/p&gt;&lt;p&gt;Remember the day we traveled together, being slightly sour sweet meaning, joy a little sad, quite ring true happiness, but we help each other, go hand in hand, so we walked the day is always full of laughter , always happy and sweet.&lt;/p&gt;&lt;p&gt;&quot;The most precious thing in the world than sincere friendship, the happiest thing in the sweet memories of the past quietly.&quot; His sincere, frank, I, frankly walked brave face, optimistic life. but we have gone past laughing, you do not know where, do not know when we can meet, and only a few drops of crystal clear that tears the hands of my very thoughts.&lt;/p&gt;&lt;p&gt;&quot;Hey, what are you thinking?&quot; At the same table pushed me.&lt;/p&gt;&lt;p&gt;! &quot;Oh no,&quot; I woke up from the memories and re-clamped piece of Ginkgo biloba, silently read the road;&lt;/p&gt;&lt;p&gt;&quot;Together through the day, I had you there, some beautiful rainbow.&quot;&lt;/p&gt;\r\n','About Us','',''), ('6','1','Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','',''), ('3','1','Privacy Policy','&lt;p&gt;Introduction&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Tencent emphasis on user privacy. When you use our services, we may collect and use information about you. We hope that through this &quot;Privacy Policy&quot; to show you, when you use our services, how we collect, use, store and share information, and we provide you access, update, control, and protection of such information. This &quot;Privacy Policy&quot; and you use the service Tencent closely, I hope you read carefully, if necessary, in accordance with this &quot;Privacy Policy&quot; guidelines, make you think appropriate choice. Related technical terms used in this &quot;Privacy Policy&quot; involved, we try to be concise presentation, and provides links for further instructions so that your understanding.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Your use or continued use of our services, which means that we agree in accordance with this &quot;Privacy Policy&quot; collect, use, store and share your information.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;As of this &quot;Privacy Policy&quot; or related matters have any questions, please contact us by http://kf.qq.com/.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may collect information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We provide services, may collect, store and use the following information about you. If you do not provide relevant information, we may not be able to register as a user or can not enjoy some of the services we provide, or can not meet the relevant services intended to achieve.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The information you provide&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;When you register an account or use our services, we provide the relevant personal information, such as phone numbers, e-mail or bank card number, etc;&lt;/p&gt;&lt;p&gt;Share the information you provide through our service to others, and when you use our services to store information.&lt;/p&gt;&lt;p&gt;Other parties to share your information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Offered to share information about your use of our services to other parties.&lt;/p&gt;&lt;p&gt;Your information we have obtained&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;When you use the services we may collect the following information:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Log information, refer to technical information when you use our services, the system may through cookies, web beacon or otherwise collected automatically, including:&lt;/p&gt;&lt;p&gt;Equipment or software information, such as your mobile device, web browser or other programs for access to configuration information provided by our services, your IP address and the version used in mobile devices and equipment identification code;&lt;/p&gt;&lt;p&gt;Search or browse in the use of our services, such as Web search words you use, social media page url address access, and your use of other information and details visit us or request a service provided;&lt;/p&gt;&lt;p&gt;You have to use the relevant mobile application (APP) and other software, and information you have to use such mobile applications and software;&lt;/p&gt;&lt;p&gt;Communicate your message through our service, for example, the account had communications, and communication time, data and duration;&lt;/p&gt;&lt;p&gt;Information (metadata) to share with you through our services included, such as shooting or upload photos or videos to share a date, time or place and so on.&lt;/p&gt;&lt;p&gt;Location information, refer you turn on the device positioning and use information about your location we provide location-based services, the collection includes:&lt;/p&gt;&lt;p&gt;When you use our services through mobile devices with positioning by GPS or WiFi, etc. to collect your location information;&lt;/p&gt;&lt;p&gt;You or other users with real-time information includes your geographic location, such as your location information you provide account information contained in, or else you upload or share information displays your current geographical location once you or geotag information about other people to share photos included;&lt;/p&gt;&lt;p&gt;You can turn off positioning, stop your location information collection.&lt;/p&gt;&lt;p&gt;How we may use information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may be in the process of providing services to you among the collected information is used for the following purposes:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Providing services to you;&lt;/p&gt;&lt;p&gt;When we provide services for authentication, customer service, security, fraud monitoring, archiving and backup purposes, to ensure the safety of products and services we provide to you;&lt;/p&gt;&lt;p&gt;Help us design new services, improve our existing services;&lt;/p&gt;&lt;p&gt;Make us more aware of how you access and use our services to targeted response to your individual needs, such as language settings, position setting, personalized service and help instruct, or to you and other users to make other response areas;&lt;/p&gt;&lt;p&gt;To provide you with more relevant your ad to replace commonly targeted ads;&lt;/p&gt;&lt;p&gt;Assess the effectiveness of our service in advertising and other promotional and marketing activities and improvements;&lt;/p&gt;&lt;p&gt;Software Certification or manage software upgrades;&lt;/p&gt;&lt;p&gt;Allow you to participate on our products and services survey.&lt;/p&gt;&lt;p&gt;To give you a better experience and to improve our services or for other purposes you agree that, in accordance with the relevant laws and regulations, we will adopt a particular service may collect information in order to bring together information or a personalized way , used in our other services. For example, when you use one of our services information collected may be used to provide you with specific content in another service, or to show you, the non-universal push information relevant to you. If we provide the appropriate options related services, you can also authorize us to provide the service and store information for our other services.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;How do you access and control your own personal information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We will do everything possible to take appropriate technical means to ensure that you can access, update and correct other personal information provided during their registration information or use our services. When access, update, correct and delete the preceding information, we may ask you to authenticate in order to protect account security.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may share information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Except in the following situations without your consent, we and our affiliates will not share your personal information with any third party:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We and our affiliates may use your personal information with our affiliates, partners and third-party service providers, contractors and agents (for example, we send out an e-mail or on behalf of Push Notification communications service providers, for us provide location data map service providers) to share (they may not be located in your jurisdictions), used for the following purposes:&lt;/p&gt;&lt;p&gt;To provide you with our services;&lt;/p&gt;&lt;p&gt;Realize &quot;how we may use the information,&quot; the purpose of the section;&lt;/p&gt;&lt;p&gt;To fulfill our obligations, &quot;Tencent services agreement&quot; or the &quot;Privacy Policy&quot; in the exercise of our rights and;&lt;/p&gt;&lt;p&gt;Understand, maintain, and improve our services.&lt;/p&gt;&lt;p&gt;As we or our affiliates to share your personal information with any of these third parties, we will strive to ensure that such third parties to comply with this &quot;Privacy Policy&quot; and we ask other appropriate confidentiality and compliance in the use of your personal information security measures.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;With the continued development of our business, we and our affiliates have a possible merger, acquisition, transfer of assets or a similar transaction, your personal information may be used as part of such transactions are transferred. We will notify you before the transfer.&lt;/p&gt;&lt;p&gt;We or our affiliates may also retain, preserve or disclose your personal information for the following needs:&lt;/p&gt;&lt;p&gt;Compliance with applicable laws and regulations;&lt;/p&gt;&lt;p&gt;Comply with an order or other legal provisions of the court;&lt;/p&gt;&lt;p&gt;Comply with the requirements of relevant government agencies;&lt;/p&gt;&lt;p&gt;To comply with applicable laws and regulations, safeguard the public interest, or to protect our customers, we or our company, personal and property safety of other users or employees or legitimate interests are reasonably necessary purpose.&lt;/p&gt;&lt;p&gt;Information Security&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We only keep your personal information within the time limits required by laws and regulations during the purpose of this &quot;Privacy Policy&quot; required.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We use a variety of security technologies and procedures to prevent information loss, misuse, unauthorized viewing or disclosure. For example, in certain services, we will use encryption techniques (eg SSL) to protect the personal information you provide. But please understand that due to technical limitations and malicious means may exist in the Internet industry, even though every effort to strengthen security measures to ensure that the information can not always be one hundred percent secure. You need to understand that you access systems and communications networks used our services, may be due to factors outside the scope of our controllable and problems.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Share your information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Our wide range of services, allowing you not only with its own social network, has also publicly share your information with all users of the service, for example, that you upload or publish the information (including your public service in our personal information, you build a list), you upload or distribute information to respond to others, and includes information about the location of the data and log information. Use our service to other users may also share information about you (including location data and log information). In particular, our social media service, is designed to allow you to share information with users around the world designed to share information in real time, you can make widely delivered. As long as you do not delete the shared information, information would have been retained in the public domain; even if you delete the shared information, independent third-party information may still be cached by other users or non-related beyond our control, copy or store, or by other Users or such third party save in the public domain.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Therefore, please carefully consider our service to upload, publish and exchange of information content. In some cases, you can set the privacy of some of our services to control the right to browse your range of users to share information. Such as the requirement to remove your information from our services, make special provisions by way of such services operations.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Share your sensitive personal information&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Because of the special nature of certain personal information may be considered sensitive personal information, such as your race, religion, personal health and medical information. Compared to other personal information, sensitive personal information subject to more stringent protection.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Note that when you use our services offered, upload or publish content and information (such as photos about your social activities and other information) may disclose your sensitive personal information. You need to carefully consider whether the disclosure of sensitive personal information when using our services.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;You agree that by purpose and manner of the &quot;Privacy Policy&quot; to the processing of your sensitive personal information.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may collect information about how&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Us or our third-party partners, possibly through cookies and web beacon to collect and use your information, and store such information as log information.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We use their own cookies and web beacon, the purpose is to provide you with a more personalized user experience and service, and for the following purposes:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Remember who you are. For example: cookies and web beacon will help us identify you as a registered user of our identity, or save about your preferences or other information you provide to us;&lt;/p&gt;&lt;p&gt;Analyze your usage of our services. For example, we may use cookies and web beacon to understand your use of our services in any activities, or which pages or services you are most welcome;&lt;/p&gt;&lt;p&gt;Advertising optimization. Cookies and web beacon helps us your information to provide you with relevant advertising rather than carry out your general advertising.&lt;/p&gt;&lt;p&gt;We use cookies for these purposes and web beacon, while possible non-personally identifiable information collected by cookies and web beacon, after statistical processing to provide to advertisers or other partners, to analyze how users use our services, and with advertising services.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;There may be an advertiser or other partner cookies and web beacon placed on our products and services. These cookies and web beacon may collect non-personally identifiable information about you in order to analyze how users use these services, you may be interested in advertising sent to you, or to evaluate the effect of advertising services. These third-party cookies and web beacon to collect and use such information, are not subject to the &quot;Privacy Policy&quot; constraint, but by the relevant user\'s privacy policy, we are not third-party cookies or web beacon responsibility.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;You can set up or manage reject cookies or web beacon through the browser. However, please note that if you disable cookies or web beacon, you may not be able to enjoy the best service experience, some services may not work properly. At the same time, you also receive the same number of ads, but the ads and you will reduce the correlation.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Advertising Services&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may use your information to provide you with more relevant your ad.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may also use your information through our services, e-mail or otherwise send marketing information to you, or a third party to provide or promote our goods and services as follows:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Our goods or services, our affiliates and partners, goods or services, including instant messaging services, online media services, interactive entertainment services, social networking services, payment services, Internet search service, location and map services, applications, and services, data management software and services, online advertising services, Internet banking, and other social media, entertainment, e-commerce, information and communication software or services (collectively, the &quot;Internet services&quot;);&lt;/p&gt;&lt;p&gt;Third-party Internet service providers, as well as the following information about third-party products or services: food and dining, sports, music, movies, television, live performances, and other arts and entertainment, books, magazines and other publications, clothing and accessories, jewelry , cosmetics, personal health and hygiene, electronics, collectibles, housewares, appliances, home decor and furnishings, pets, cars, hotels, transport and tourism, banking, insurance and other financial services, membership points and reward programs, and we believe other goods or services may be relevant to you.&lt;/p&gt;&lt;p&gt;If you do not want us to use your personal information as aforesaid advertising purposes, you can know that we offer in the advertisement, or the guidelines provided in a particular service, we are required to stop using your personal information for these purposes.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Messages and information we may send you&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Push mail and information&lt;/p&gt;&lt;p&gt;When you use our services, we may use your information to your device to send e-mail, news, or push notifications. If you do not wish to receive this information, you can follow our related tips on equipment selection unsubscribe.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Service-related announcement&lt;/p&gt;&lt;p&gt;(For example due to system maintenance and suspend a particular service), if necessary, we may issue a service-related announcement to you. You may not be able to remove these and related services, does not belong to the nature of the promotion announcement.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Exceptions applicable privacy policy&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Our services may include or be linked to social media or other services provided by third parties (including websites). For example:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;You use the &quot;Share&quot; button to share some content to our services, or if you use a third-party connection service access our services. These features may collect information about you (including your log information), and possibly your computer equipment cookies, so that the normal operation of these functions;&lt;/p&gt;&lt;p&gt;We provide links to you through advertising or other means of our service that allows you to access third-party services or websites.&lt;/p&gt;&lt;p&gt;These third-party social media or other services may be operated by the relevant third party or us. Your use of such third-party social media or other services (including any personal information you provide to such third party), subject to the third party\'s privacy policy and terms of service (instead of &quot;General Terms of Service&quot; or the &quot; Privacy Policy &quot;) constraint, you need to read the terms carefully. This &quot;Privacy Policy&quot; applies only to information collected by us, does not apply to any services or third party information provided by third parties to use the rules, we use the information provided by you to any third party does not assume any responsibility.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Minors to use our service&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We encourage parents or guardians to instruct minors under eighteen years of age to use our services. We recommend that minors are encouraged by their parents or guardians to read this &quot;privacy policy&quot; and suggested minors before personal information submitted to seek parental or guardian consent and guidance.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Scope Privacy Policy&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;In addition to certain services, all of our services are applicable to the &quot;Privacy Policy.&quot; These specific service-specific privacy policies will apply. For certain services specific privacy policy, more specifically how we use your information in these services. This particular service\'s privacy policy forms part of this &quot;Privacy Policy&quot;. Related to specific services, such as the privacy policy of this &quot;Privacy Policy&quot; There are inconsistencies, the application of the specific service privacy policy.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;In addition to this &quot;Privacy Policy&quot; as otherwise provided herein, this &quot;Privacy Policy&quot; and the words used words to &quot;Tencent Service Agreement&quot; has the same meaning as defined.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Please note that this &quot;Privacy Policy&quot; does not apply to the following:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Third-party services through our service and access (including any third-party sites) information collected;&lt;/p&gt;&lt;p&gt;Other company or advertising agency services in our service, information collected through.&lt;/p&gt;&lt;p&gt;Change&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;We may timely revision of the &quot;Privacy Policy&quot; clause, the amendments constitute a part of this &quot;Privacy Policy&quot;. As the substance of the amendments under this cause you to the &quot;Privacy Policy&quot; right to reduce, we will enter into force before the revision by a prominent position on the home page or send an email to your prompt or otherwise notify you. In this case, if you continue to use our services, you agree to be bound by the revised this &quot;Privacy Policy&quot;.&lt;/p&gt;\r\n','Privacy Policy','Privacy Policy','Privacy Policy'), ('5','1','Terms &amp; Conditions','&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;向戴尔采购产品及服务的行为将受到如下相关条款与条件的约束。请点击下列相关链接以获取适用于您的条款与条件。请仔细阅读相关条款与条件。如您不能通过下列链接获取您所适用的相关条款与条件，或希望在获取您所适用的相关的条款与条件上得到帮助，请联系戴尔的销售代表。&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-conditions-of-sale-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;硬件、软件和服务的商业销售条款&lt;/a&gt;(公司客户适用) - 适用于戴尔供应的硬件、软件和服务&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-consumer-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术支持条款和条件&lt;/a&gt;（消费者客户适用）- 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-non-consumer-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术支持条款和条件&lt;/a&gt;（非消费者客户适用） - 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-reseller-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;销售、服务和技术条款和条件&lt;/a&gt;（经销商适用） - 适用于戴尔供应的产品&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-service-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;技术支持服务条款和条件&lt;/a&gt;&amp;nbsp;- 适用于为戴尔产品提供的修理和技术支持服务&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-customer-agreement-cn&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;客户服务总协议&lt;/a&gt;&amp;nbsp;( 同样被称作戴尔专业服务标准条款和条件 )&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Purchases of Dell products and services are governed by the relevant terms and conditions as indicated below. Clicking on the relevant link below will take you to your relevant terms and conditions. Please review the relevant terms and conditions carefully. If you are unable to access the relevant terms and conditions from your relevant link or for assistance in obtaining a copy of your the relevant terms and conditions applicable to you, please contact your Dell sales representative .&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-of-sales-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Commercial Terms of Sales for the Sale of hardware, software and services&lt;/a&gt;&amp;nbsp;(FOR CORPORATE CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to hardware, software and services supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-consumer-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHNICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR CONSUMER CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-non-consumer-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHNICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR NON-CONSUMER CUSTOMERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-technical-reseller-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SALE, SERVICE AND TECHINICAL SUPPORT&lt;/a&gt;&amp;nbsp;(FOR RESELLERS)&lt;br style=&quot;clear: both;&quot;&gt;- applicable to products supplied by Dell&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0.769em; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-terms-services-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;TERMS AND CONDITIONS OF SERVICE AND SUPPORT&lt;/a&gt;&lt;br style=&quot;clear: both;&quot;&gt;- applicable to repair or technical support services provided for Dell products&lt;/p&gt;&lt;p style=&quot;margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; color: rgb(51, 51, 51); line-height: 1.385em; font-family: \'Trebuchet MS\', \'Microsoft YaHei\', 微软雅黑, \'Hiragino Sans GB\', \'Arial Unicode\', sans-serif; font-size: 15px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;a href=&quot;http://www.dell.com/learn/cn/zh/cncorp1/spredir.ashx/solutions/html-customer-agreement-en&quot; target=&quot;_blank&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: none; vertical-align: baseline; color: rgb(0, 51, 102); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Customer Master Services Agreement&lt;/a&gt;&lt;br style=&quot;clear: both;&quot;&gt;(also known as Dell Professional Services Standard terms and conditions)&lt;/p&gt;\r\n','Terms &amp; Conditions','Terms &amp; Conditions','Terms &amp; Conditions');
INSERT INTO `information_to_layout` VALUES ('4','0','0'), ('6','0','0'), ('3','0','0'), ('5','0','0');
INSERT INTO `information_to_store` VALUES ('3','0'), ('4','0'), ('5','0'), ('6','0');
INSERT INTO `language` VALUES ('1','English','en','en_US.UTF-8,en_US,en-gb,english','gb.png','english','1','1'), ('2','简体中文','cn','zh,zh-hk,zh-cn,zh-cn.UTF-8,cn-gb,chinese','cn.png','chinese','0','1');
INSERT INTO `layout` VALUES ('1','网站首页'), ('2','Product'), ('3','Category'), ('4','Default'), ('5','Manufacturer'), ('6','用户登陆'), ('7','Checkout-查看'), ('8','联系我们'), ('9','Sitemap'), ('10','Affiliate'), ('11','Information'), ('12','Compare'), ('13','产品搜索'), ('14','用户注册'), ('15','商品退换'), ('16','查看品牌'), ('17','特别优惠'), ('18','用户中心'), ('19','修改帐户信息'), ('20','修改密码'), ('21','地址管理'), ('22','收藏列表'), ('23','订单管理'), ('24','下载商品管理'), ('25','分期管理'), ('26','积分管理'), ('27','退换商品管理'), ('28','余额管理'), ('29','订阅管理'), ('30','成功退出'), ('31','订单历史'), ('32','店铺首页'), ('33','商家后台');
INSERT INTO `layout_module` VALUES ('2','4','0','content_top','0'), ('3','4','0','content_top','1'), ('20','5','0','column_left','2'), ('84','6','slideshow.31','content_top','0'), ('336','2','category','column_left','1'), ('335','2','latest.39','column_left','0'), ('361','13','banner.35','column_right','5'), ('360','13','carousel.29','content_top','0'), ('120','11','featured.28','column_left','0'), ('122','8','featured.28','column_left','0'), ('131','15','account','column_left','0'), ('132','16','featured.28','column_left','0'), ('133','17','featured.28','column_left','0'), ('341','18','category','column_left','0'), ('150','19','account','column_left','0'), ('151','20','account','column_left','0'), ('152','21','account','column_left','0'), ('153','22','account','column_left','0'), ('155','24','account','column_left','0'), ('156','25','account','column_left','0'), ('157','26','account','column_left','0'), ('158','27','account','column_left','0'), ('160','29','account','column_left','0'), ('333','2','banner.35','column_right','0'), ('163','30','carousel.29','content_top','0'), ('334','2','slideshow.27','content_top','0'), ('382','33','category','column_left','0'), ('338','14','slideshow.32','content_top','0'), ('381','33','carousel.29','content_top','0'), ('383','32','category','column_left','0'), ('379','1','block_layout.41','content_top','3'), ('380','1','block_layout.44','content_top','1'), ('378','1','block_layout.42','content_top','5'), ('384','32','special.48','column_left','0');
INSERT INTO `layout_route` VALUES ('17','10','0','affiliate/%'), ('44','3','0','product/category'), ('256','2','0','product/product'), ('87','11','0','information/information'), ('89','8','0','information/contact'), ('32','9','0','information/sitemap'), ('34','4','0',''), ('45','5','0','product/manufacturer'), ('52','12','0','product/compare'), ('265','13','0','product/search'), ('258','14','0','account/register'), ('69','6','0','account/login'), ('98','15','0','account/return_add'), ('99','16','0','product/manufacturer/info'), ('100','17','0','product/special'), ('260','18','0','account/account'), ('105','19','0','account/edit'), ('106','20','0','account/password'), ('107','21','0','account/address'), ('108','22','0','account/wishlist'), ('109','23','0','account/order'), ('110','24','0','account/download'), ('111','25','0','account/recurring'), ('112','26','0','account/reward'), ('113','27','0','account/return'), ('114','28','0','account/transaction'), ('115','29','0','account/newsletter'), ('117','30','0','account/logout'), ('182','31','0','account/order/info'), ('242','7','0','checkout/%'), ('273','1','0','common/home'), ('275','32','0','store/index'), ('274','33','0','seller/admin');
INSERT INTO `length_class` VALUES ('1','1.00000000'), ('2','10.00000000'), ('3','0.39370000');
INSERT INTO `length_class_description` VALUES ('1','1','Centimeter','cm'), ('2','1','Millimeter','mm'), ('3','1','Inch','in'), ('1','2','Centimeter','cm'), ('2','2','Millimeter','mm'), ('3','2','Inch','in');
INSERT INTO `manufacturer` VALUES ('5','HTC','catalog/demo/htc_logo.jpg','0'), ('6','Palm','catalog/demo/palm_logo.jpg','0'), ('7','Hewlett-Packard','catalog/demo/hp_logo.jpg','0'), ('8','Apple','catalog/demo/apple_logo.jpg','0'), ('9','Canon','catalog/demo/canon_logo.jpg','0'), ('10','Sony','catalog/demo/sony_logo.jpg','0');
INSERT INTO `manufacturer_to_store` VALUES ('5','0'), ('6','0'), ('7','0'), ('8','0'), ('9','0'), ('10','0');
INSERT INTO `module` VALUES ('30','Category','banner','a:5:{s:4:\"name\";s:17:\"Banner - Category\";s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";s:6:\"status\";s:1:\"1\";}'), ('29','首页品牌模块','carousel','a:5:{s:4:\"name\";s:18:\"首页品牌模块\";s:9:\"banner_id\";s:1:\"8\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"100\";s:6:\"status\";s:1:\"1\";}'), ('28','Featured - Home Page','featured','a:6:{s:4:\"name\";s:20:\"Featured - Home Page\";s:7:\"product\";a:3:{i:0;s:2:\"52\";i:1;s:2:\"50\";i:2;s:2:\"51\";}s:5:\"limit\";s:1:\"4\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('27','首页幻灯片','slideshow','a:5:{s:4:\"name\";s:15:\"首页幻灯片\";s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:3:\"870\";s:6:\"height\";s:3:\"400\";s:6:\"status\";s:1:\"1\";}'), ('31','用户登陆','slideshow','a:5:{s:4:\"name\";s:12:\"用户登陆\";s:9:\"banner_id\";s:2:\"12\";s:5:\"width\";s:3:\"500\";s:6:\"height\";s:3:\"400\";s:6:\"status\";s:1:\"1\";}'), ('32','用户注册','slideshow','a:5:{s:4:\"name\";s:12:\"用户注册\";s:9:\"banner_id\";s:2:\"13\";s:5:\"width\";s:3:\"430\";s:6:\"height\";s:3:\"450\";s:6:\"status\";s:1:\"1\";}'), ('33','当期热卖','bestseller','a:5:{s:4:\"name\";s:12:\"当期热卖\";s:5:\"limit\";s:2:\"20\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('34','特价商品','special','a:5:{s:4:\"name\";s:12:\"特价商品\";s:5:\"limit\";s:1:\"5\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('35','首页001','banner','a:5:{s:4:\"name\";s:9:\"首页001\";s:9:\"banner_id\";s:2:\"11\";s:5:\"width\";s:3:\"280\";s:6:\"height\";s:3:\"428\";s:6:\"status\";s:1:\"1\";}'), ('36','首页html','html','a:3:{s:4:\"name\";s:10:\"首页html\";s:18:\"module_description\";a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:190:\"&lt;p&gt;&lt;img src=&quot;http://www.lvxingtoc.com/image/catalog/banner/21307064332015060803141581850.jpg&quot; width=&quot;185&quot; style=&quot;width: 996px;&quot;&gt;&lt;br&gt;&lt;/p&gt;\";}i:1;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:6:\"status\";s:1:\"1\";}'), ('37','首页右栏1小','banner','a:5:{s:4:\"name\";s:16:\"首页右栏1小\";s:9:\"banner_id\";s:2:\"14\";s:5:\"width\";s:3:\"590\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('38','首页2左','html','a:3:{s:4:\"name\";s:10:\"首页2左\";s:18:\"module_description\";a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}i:1;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:6:\"status\";s:1:\"1\";}'), ('39','首页005','latest','a:5:{s:4:\"name\";s:9:\"首页005\";s:5:\"limit\";s:1:\"5\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('40','首页600x250','slideshow','a:5:{s:4:\"name\";s:13:\"首页600x250\";s:9:\"banner_id\";s:2:\"15\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"250\";s:6:\"status\";s:1:\"1\";}'), ('41','首页块布局1','block_layout','a:4:{s:4:\"name\";s:16:\"首页块布局1\";s:5:\"title\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:13:\"layout_module\";a:1:{i:0;a:3:{s:4:\"code\";s:7:\"html.36\";s:8:\"position\";s:11:\"content_top\";s:10:\"sort_order\";s:0:\"\";}}}'), ('42','首页块布局2','block_layout','a:4:{s:4:\"name\";s:16:\"首页块布局2\";s:5:\"title\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:13:\"layout_module\";a:5:{i:0;a:3:{s:4:\"code\";s:12:\"slideshow.27\";s:8:\"position\";s:11:\"content_top\";s:10:\"sort_order\";s:0:\"\";}i:1;a:3:{s:4:\"code\";s:9:\"latest.43\";s:8:\"position\";s:12:\"column_right\";s:10:\"sort_order\";s:0:\"\";}i:2;a:3:{s:4:\"code\";s:10:\"special.48\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:0:\"\";}i:3;a:3:{s:4:\"code\";s:11:\"featured.28\";s:8:\"position\";s:11:\"content_top\";s:10:\"sort_order\";s:0:\"\";}i:4;a:3:{s:4:\"code\";s:13:\"bestseller.33\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:0:\"\";}}}'), ('43','最新新产品','latest','a:5:{s:4:\"name\";s:15:\"最新新产品\";s:5:\"limit\";s:1:\"5\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}'), ('44','首页横幅-幻灯片-横幅','block_layout','a:4:{s:4:\"name\";s:29:\"首页横幅-幻灯片-横幅\";s:5:\"title\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:13:\"layout_module\";a:3:{i:0;a:3:{s:4:\"code\";s:12:\"slideshow.45\";s:8:\"position\";s:11:\"content_top\";s:10:\"sort_order\";s:0:\"\";}i:1;a:3:{s:4:\"code\";s:9:\"banner.46\";s:8:\"position\";s:11:\"column_left\";s:10:\"sort_order\";s:0:\"\";}i:2;a:3:{s:4:\"code\";s:7:\"html.47\";s:8:\"position\";s:12:\"column_right\";s:10:\"sort_order\";s:0:\"\";}}}'), ('45','首页585400','slideshow','a:5:{s:4:\"name\";s:12:\"首页585400\";s:9:\"banner_id\";s:2:\"16\";s:5:\"width\";s:3:\"585\";s:6:\"height\";s:3:\"400\";s:6:\"status\";s:1:\"1\";}'), ('46','首页285400左','banner','a:5:{s:4:\"name\";s:15:\"首页285400左\";s:9:\"banner_id\";s:2:\"17\";s:5:\"width\";s:3:\"285\";s:6:\"height\";s:3:\"400\";s:6:\"status\";s:1:\"1\";}'), ('47','首页右285400','html','a:3:{s:4:\"name\";s:15:\"首页右285400\";s:18:\"module_description\";a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:163:\"&lt;p&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/banner/285400/2483313632015060810411925725.jpg&quot; width=&quot;285&quot;&gt;&lt;br&gt;&lt;/p&gt;\";}i:1;a:2:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:6:\"status\";s:1:\"1\";}'), ('48','首页特价1','special','a:5:{s:4:\"name\";s:13:\"首页特价1\";s:5:\"limit\";s:1:\"5\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `option` VALUES ('1','radio','1'), ('2','checkbox','2'), ('4','text','3'), ('5','select','4'), ('6','textarea','5'), ('7','file','6'), ('8','date','7'), ('9','time','8'), ('10','datetime','9'), ('11','select','10'), ('12','date','11');
INSERT INTO `option_description` VALUES ('1','1','Radio'), ('2','1','Checkbox'), ('4','1','Text'), ('6','1','Textarea'), ('8','1','Date'), ('7','1','File'), ('5','1','Select'), ('9','1','Time'), ('10','1','Date &amp; Time'), ('12','1','Delivery Date'), ('11','1','Size'), ('1','2','Radio'), ('2','2','Checkbox'), ('4','2','Text'), ('6','2','Textarea'), ('8','2','Date'), ('7','2','File'), ('5','2','Select'), ('9','2','Time'), ('10','2','Date &amp; Time'), ('12','2','Delivery Date'), ('11','2','Size');
INSERT INTO `option_value` VALUES ('43','1','','3'), ('32','1','','1'), ('45','2','','4'), ('44','2','','3'), ('42','5','','4'), ('41','5','','3'), ('39','5','','1'), ('40','5','','2'), ('31','1','','2'), ('23','2','','1'), ('24','2','','2'), ('46','11','','1'), ('47','11','','2'), ('48','11','','3');
INSERT INTO `option_value_description` VALUES ('43','1','1','Large'), ('32','1','1','Small'), ('45','1','2','Checkbox 4'), ('44','1','2','Checkbox 3'), ('31','1','1','Medium'), ('42','1','5','Yellow'), ('41','1','5','Green'), ('39','1','5','Red'), ('40','1','5','Blue'), ('23','1','2','Checkbox 1'), ('24','1','2','Checkbox 2'), ('48','1','11','Large'), ('47','1','11','Medium'), ('46','1','11','Small'), ('43','2','1','Large'), ('32','2','1','Small'), ('45','2','2','Checkbox 4'), ('44','2','2','Checkbox 3'), ('31','2','1','Medium'), ('42','2','5','Yellow'), ('41','2','5','Green'), ('39','2','5','Red'), ('40','2','5','Blue'), ('23','2','2','Checkbox 1'), ('24','2','2','Checkbox 2'), ('48','2','11','Large'), ('47','2','11','Medium'), ('46','2','11','Small');
INSERT INTO `order` VALUES ('3','0','INV-2013-00','0','旅行兔','http://127.0.0.1/','3','1','李大三','576228830@qq.com','15125783319','a:0:{}','1111','222222222222','','上海市','9','崇明县','50','','b:0;','货到付款','cod','1111','222222222222','','上海市','9','崇明县','50','','b:0;','固定运费费率','flat.flat','','205.0000','1','0','0.0000','0','','2','2','USD','0.16140001','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','zh-CN,zh;q=0.8','2015-04-28 16:51:20','2015-04-28 16:51:25'), ('4','0','INV-2013-00','0','旅行兔','http://127.0.0.1/','3','1','李大三','576228830@qq.com','15125783319','a:0:{}','1111','222222222222','','上海市','9','崇明县','50','','b:0;','货到付款','cod','1111','222222222222','','上海市','9','崇明县','50','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','zh-CN,zh;q=0.8','2015-04-28 17:19:58','2015-04-28 17:20:00'), ('5','1','INV-2013-00','0','旅行兔','http://127.0.0.1/','1','1','1252522','0000@xx.com','123456','b:0;','1252522','45855','45855','','222','','3522','','b:0;','货到付款','cod','1252522','45855','45855','','222','','3522','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36','zh-CN,zh;q=0.8','2015-04-28 17:22:11','2015-04-28 17:22:12'), ('6','0','INV-2013-00','0','旅行兔','http://127.0.0.1/','3','1','李大三','576228830@qq.com','15125783319','a:0:{}','1111','222222222222','','上海市','9','崇明县','50','','b:0;','货到付款','cod','1111','222222222222','','上海市','9','崇明县','50','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36','zh-CN,zh;q=0.8','2015-05-02 18:52:36','2015-05-02 18:52:38'), ('7','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 09:27:53','2015-06-24 09:29:04'), ('8','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:00:48','2015-06-24 10:04:22'), ('9','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:20:35','2015-06-24 10:20:38'), ('10','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:29:12','2015-06-24 10:29:12'), ('11','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:33:49','2015-06-24 10:33:49'), ('12','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:36:17','2015-06-24 10:36:17'), ('13','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:37:44','2015-06-24 10:37:44'), ('14','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:40:54','2015-06-24 10:40:54'), ('15','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:41:48','2015-06-24 10:41:48'), ('16','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:43:13','2015-06-24 10:43:13'), ('17','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','0','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:44:10','2015-06-24 10:44:10'), ('18','2','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','405.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 10:45:07','2015-06-24 10:45:32'), ('19','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','605.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36','zh-CN,zh;q=0.8','2015-06-24 11:23:52','2015-06-24 11:23:53'), ('20','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','605.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36','zh-CN,zh;q=0.8','2015-06-26 11:25:30','2015-06-26 11:25:33'), ('21','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36','zh-CN,zh;q=0.8','2015-06-26 11:33:21','2015-06-26 11:33:23'), ('22','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','205.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36','zh-CN,zh;q=0.8','2015-06-27 14:53:21','2015-06-27 14:53:23'), ('23','0','INV-2013-00','0','旅行兔','http://www.lvxingtoc.com/','9','1','我是测试一','demo@demo.com','12345678911','b:0;','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','货到付款','cod','我是测试一','龙江xc','','云南省','25','楚雄市','13','','b:0;','固定运费费率','flat.flat','','105.0000','1','0','0.0000','0','','2','4','RMB','1.00000000','127.0.0.1','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36','zh-CN,zh;q=0.8','2015-06-27 16:29:33','2015-06-27 16:29:37');
INSERT INTO `order_history` VALUES ('7','4','1','0','','2015-04-28 17:20:00'), ('6','3','1','0','','2015-04-28 16:51:25'), ('8','5','1','0','','2015-04-28 17:22:12'), ('9','6','1','0','','2015-05-02 18:52:38'), ('10','7','1','0','','2015-06-24 09:29:04'), ('11','8','1','0','','2015-06-24 10:04:22'), ('12','9','1','0','','2015-06-24 10:20:38'), ('13','18','1','0','','2015-06-24 10:45:32'), ('14','19','1','0','','2015-06-24 11:23:53'), ('15','20','1','0','','2015-06-26 11:25:33'), ('16','21','1','0','','2015-06-26 11:33:23'), ('17','22','1','0','','2015-06-27 14:53:23'), ('18','23','1','0','','2015-06-27 16:29:37');
INSERT INTO `order_product` VALUES ('3','0','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','1','100.0000','100.0000','0',NULL), ('4','0','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','1','100.0000','100.0000','0',NULL), ('5','0','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','4','100.0000','400.0000','0',NULL), ('6','0','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','2','100.0000','200.0000','0',NULL), ('7','0','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','2','100.0000','200.0000','0',NULL), ('8','3','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','2','100.0000','200.0000','0',NULL), ('9','4','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','1','100.0000','100.0000','0',NULL), ('10','5','50','七十二变时尚屋[SY9678]2015新品夏装韩版条纹印花修身短袖T恤女','120D','1','100.0000','100.0000','0',NULL), ('11','6','50','七十二变时尚屋[SY9678]2015      新品夏装韩版条纹印花修身短袖T恤女','120D','1','100.0000','100.0000','0',NULL), ('12','7','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0',NULL), ('13','8','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','1','100.0000','100.0000','0',NULL), ('14','9','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('15','10','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('16','11','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('17','12','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('18','13','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('19','14','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('20','15','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('21','16','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('22','17','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('23','18','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','4','100.0000','400.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('24','19','51','平板电脑女','qwdfg','1','600.0000','600.0000','0','catalog/product/21307064332015051306193783517.jpg'), ('25','20','51','平板电脑女','qwdfg','1','600.0000','600.0000','0','catalog/product/21307064332015051306193783517.jpg'), ('26','21','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','1','100.0000','100.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('27','22','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','2','100.0000','200.0000','0','catalog/product/21307064332015051306175952327.jpg'), ('28','23','50','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','120D','1','100.0000','100.0000','0','catalog/product/21307064332015051306175952327.jpg');
INSERT INTO `order_status` VALUES ('2','1','Processing'), ('3','1','Shipped'), ('7','1','Canceled'), ('5','1','Complete'), ('8','1','Denied'), ('9','1','Canceled Reversal'), ('10','1','Failed'), ('11','1','Refunded'), ('12','1','Reversed'), ('13','1','Chargeback'), ('1','1','Pending'), ('16','1','Voided'), ('15','1','Processed'), ('14','1','Expired'), ('2','2','Processing'), ('3','2','Shipped'), ('7','2','Canceled'), ('5','2','Complete'), ('8','2','Denied'), ('9','2','Canceled Reversal'), ('10','2','Failed'), ('11','2','Refunded'), ('12','2','Reversed'), ('13','2','Chargeback'), ('1','2','Pending'), ('16','2','Voided'), ('15','2','Processed'), ('14','2','Expired');
INSERT INTO `order_total` VALUES ('14','0','total','订单总额','0.0000','9'), ('13','0','shipping','固定运费费率','5.0000','3'), ('12','0','sub_total','商品总额','100.0000','1'), ('11','0','total','订单总额','0.0000','9'), ('9','0','sub_total','商品总额','100.0000','1'), ('10','0','shipping','固定运费费率','5.0000','3'), ('15','0','sub_total','商品总额','400.0000','1'), ('16','0','shipping','固定运费费率','5.0000','3'), ('17','0','total','订单总额','0.0000','9'), ('18','0','sub_total','商品总额','200.0000','1'), ('19','0','shipping','固定运费费率','5.0000','3'), ('20','0','total','订单总额','0.0000','9'), ('21','0','sub_total','商品总额','200.0000','1'), ('22','0','shipping','固定运费费率','5.0000','3'), ('23','0','total','订单总额','205.0000','9'), ('24','3','sub_total','商品总额','200.0000','1'), ('25','3','shipping','固定运费费率','5.0000','3'), ('26','3','total','订单总额','205.0000','9'), ('27','4','sub_total','商品总额','100.0000','1'), ('28','4','shipping','固定运费费率','5.0000','3'), ('29','4','total','订单总额','105.0000','9'), ('30','5','sub_total','商品总额','100.0000','1'), ('31','5','shipping','固定运费费率','5.0000','3'), ('32','5','total','订单总额','105.0000','9'), ('33','6','sub_total','商品总额','100.0000','1'), ('34','6','shipping','固定运费费率','5.0000','3'), ('35','6','total','订单总额','105.0000','9'), ('36','7','sub_total','商品总额','400.0000','1'), ('37','7','shipping','固定运费费率','5.0000','3'), ('38','7','total','订单总额','405.0000','9'), ('39','8','sub_total','商品总额','100.0000','1'), ('40','8','shipping','固定运费费率','5.0000','3'), ('41','8','total','订单总额','105.0000','9'), ('42','9','sub_total','商品总额','400.0000','1'), ('43','9','shipping','固定运费费率','5.0000','3'), ('44','9','total','订单总额','405.0000','9'), ('45','10','sub_total','商品总额','400.0000','1'), ('46','10','shipping','固定运费费率','5.0000','3'), ('47','10','total','订单总额','405.0000','9'), ('48','11','sub_total','商品总额','400.0000','1'), ('49','11','shipping','固定运费费率','5.0000','3'), ('50','11','total','订单总额','405.0000','9'), ('51','12','sub_total','商品总额','400.0000','1'), ('52','12','shipping','固定运费费率','5.0000','3'), ('53','12','total','订单总额','405.0000','9'), ('54','13','sub_total','商品总额','400.0000','1'), ('55','13','shipping','固定运费费率','5.0000','3'), ('56','13','total','订单总额','405.0000','9'), ('57','14','sub_total','商品总额','400.0000','1'), ('58','14','shipping','固定运费费率','5.0000','3'), ('59','14','total','订单总额','405.0000','9'), ('60','15','sub_total','商品总额','400.0000','1'), ('61','15','shipping','固定运费费率','5.0000','3'), ('62','15','total','订单总额','405.0000','9'), ('63','16','sub_total','商品总额','400.0000','1'), ('64','16','shipping','固定运费费率','5.0000','3'), ('65','16','total','订单总额','405.0000','9'), ('66','17','sub_total','商品总额','400.0000','1'), ('67','17','shipping','固定运费费率','5.0000','3'), ('68','17','total','订单总额','405.0000','9'), ('69','18','sub_total','商品总额','400.0000','1'), ('70','18','shipping','固定运费费率','5.0000','3'), ('71','18','total','订单总额','405.0000','9'), ('72','19','sub_total','商品总额','600.0000','1'), ('73','19','shipping','固定运费费率','5.0000','3'), ('74','19','total','订单总额','605.0000','9'), ('75','20','sub_total','商品总额','600.0000','1'), ('76','20','shipping','固定运费费率','5.0000','3'), ('77','20','total','订单总额','605.0000','9'), ('78','21','sub_total','商品总额','100.0000','1'), ('79','21','shipping','固定运费费率','5.0000','3'), ('80','21','total','订单总额','105.0000','9'), ('81','22','sub_total','商品总额','200.0000','1'), ('82','22','shipping','固定运费费率','5.0000','3'), ('83','22','total','订单总额','205.0000','9'), ('84','23','sub_total','商品总额','100.0000','1'), ('85','23','shipping','固定运费费率','5.0000','3'), ('86','23','total','订单总额','105.0000','9');
INSERT INTO `product` VALUES ('50','120D','件','中国云南','100','6','catalog/product/21307064332015051306175952327.jpg','0','1','2000.0000','10','2015-04-28','0.00000000','1','0.00000000','0.00000000','0.00000000','1','1','1','1','1','3094','2015-04-28 09:18:09','2015-06-26 16:03:44'), ('51','qwdfg','','','100','6','catalog/product/21307064332015051306193783517.jpg','0','1','900.0000','0','2015-05-02','0.00000000','1','0.00000000','0.00000000','0.00000000','1','1','1','1','1','282','2015-05-02 14:50:48','2015-05-26 10:11:44'), ('52','klkk','','','89','6','catalog/product/21307064332015051306184574643.jpg','0','1','700.0000','0','2015-05-02','0.00000000','1','0.00000000','0.00000000','0.00000000','1','1','1','1','1','1556','2015-05-03 00:40:37','2015-06-17 14:24:40');
INSERT INTO `product_attribute` VALUES ('52','4','2',''), ('52','4','1','');
INSERT INTO `product_description` VALUES ('51','2','平板电脑女','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','','6666666666666666666','777777777777777777777777777',''), ('51','1','dddddddddddddddd','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','','llllllllllllllllllllllllllllllll','',''), ('52','2','七十二变时尚屋[SY9678]2015 新品夏装韩版条纹印花修身短袖T恤女','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','','cvvhhhtt','cvvhhhtt',''), ('52','1','cvvhhhtt','&lt;p&gt;cvvhhhtt&lt;br&gt;&lt;/p&gt;','','cvvhhhtt','',''), ('50','2','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','&lt;p&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306090147438.jpg&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(247, 252, 255);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25.2000007629395px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(247, 252, 255);&quot;&gt;上面两种方法中jquery比较简单，实现起来比较快，第二种比较复杂些，但是执行起来比jquery要快!&lt;/span&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306093219876.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306094268592.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306101522244.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306102981968.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306104299274.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306105566120.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306110873429.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306112219291.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306113423106.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306114526910.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306115680142.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞'), ('50','1','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306090147438.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306093219876.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306094268592.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306101522244.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306102981968.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306104299274.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306105566120.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306110873429.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306112219291.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306113423106.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306114526910.jpg&quot;&gt;&lt;img src=&quot;http://www.lvxingto.com/image/catalog/product/21307064332015051306115680142.jpg&quot;&gt;&lt;br&gt;','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞','女两用晴雨伞折叠小清新插画创意伞防紫外线太阳伞文艺防晒遮阳伞');
INSERT INTO `product_image` VALUES ('2544','50','catalog/product/21307064332015051306184574643.jpg','0'), ('2543','50','catalog/product/21307064332015051306185792554.jpg','0'), ('2542','50','catalog/product/21307064332015051306190940888.jpg','0'), ('2541','50','catalog/product/21307064332015051306193783517.jpg','0'), ('2535','52','catalog/product/21307064332015051306093219876.jpg','0'), ('2536','52','','0');
INSERT INTO `product_option` VALUES ('228','52','8','2015-06-30','1'), ('229','52','7','','1');
INSERT INTO `product_related` VALUES ('50','50');
INSERT INTO `product_special` VALUES ('503','50','1','0','100.0000','0000-00-00','0000-00-00'), ('490','51','1','2','600.0000','0000-00-00','0000-00-00');
INSERT INTO `product_to_category` VALUES ('51','34');
INSERT INTO `product_to_layout` VALUES ('50','0','0'), ('51','0','0'), ('52','0','0');
INSERT INTO `product_to_store` VALUES ('50','0'), ('51','0'), ('52','0');
INSERT INTO `return_action` VALUES ('1','1','Refunded'), ('2','1','Credit Issued'), ('3','1','Replacement Sent'), ('1','2','Refunded'), ('2','2','Credit Issued'), ('3','2','Replacement Sent');
INSERT INTO `return_reason` VALUES ('1','1','Dead On Arrival'), ('2','1','Received Wrong Item'), ('3','1','Order Error'), ('4','1','Faulty, please supply details'), ('5','1','Other, please supply details'), ('1','2','Dead On Arrival'), ('2','2','Received Wrong Item'), ('3','2','Order Error'), ('4','2','Faulty, please supply details'), ('5','2','Other, please supply details');
INSERT INTO `return_status` VALUES ('1','1','Pending'), ('3','1','Complete'), ('2','1','Awaiting Products'), ('1','2','Pending'), ('3','2','Complete'), ('2','2','Awaiting Products');
INSERT INTO `review` VALUES ('1','50','0','85456','7777果您对本商品有什么问题或经验，请在此留下问题或经验，请在此留问题或经验，请在此留问题或经验，请在此留','5','1','2015-04-29 15:47:38','2015-04-29 15:47:57'), ('2','50','0','89652123564','6585425您对本商品有什么问题或经验，请在此留下您的意见和建','3','1','2015-04-29 15:48:37','2015-04-29 15:48:53'), ('3','50','0','rrrrrrrrrrrrrr','jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','4','1','2015-05-02 20:15:53','2015-05-02 20:16:22'), ('4','50','0','44444','11444444444444444444444444444444444444444444444444','1','1','2015-05-22 16:33:43','2015-06-11 14:24:13');
INSERT INTO `search_key` VALUES ('1','777777','2015-06-22 17:09:56','0'), ('2','545885','2015-06-22 17:09:56','0'), ('3','女装','2015-06-22 17:11:44','0'), ('4','女','2015-06-22 17:11:44','0'), ('5','女士','2015-06-22 17:11:44','0'), ('6','女装','2015-06-22 17:18:37','0'), ('7','女','2015-06-22 17:18:37','0'), ('8','女士','2015-06-22 17:18:37','0'), ('9','女','2015-06-23 09:01:51','0'), ('10','女','2015-06-23 09:05:37','0'), ('11','女','2015-06-23 09:11:38','0'), ('12','女','2015-06-23 09:11:53','0'), ('13','女','2015-06-23 09:42:26','0'), ('14','女','2015-06-24 11:19:28','9'), ('15','女','2015-06-26 09:35:43','0'), ('16','女','2015-06-26 09:43:30','0'), ('17','女','2015-06-26 09:44:23','0'), ('18','女','2015-06-26 09:45:40','0'), ('19','女','2015-06-26 09:45:43','0'), ('20','女','2015-06-26 09:52:19','0'), ('21','女','2015-06-26 09:53:04','0'), ('22','女','2015-06-26 09:56:55','0'), ('23','女','2015-06-26 09:58:55','0'), ('24','女','2015-06-26 10:01:57','0'), ('25','女','2015-06-26 10:03:30','0'), ('26','女','2015-06-26 10:06:30','0'), ('27','女','2015-06-26 10:06:43','0'), ('28','女','2015-06-26 10:07:13','0'), ('29','女','2015-06-26 10:09:33','0'), ('30','女','2015-06-26 10:10:59','0'), ('31','女','2015-06-26 10:11:13','0'), ('32','女','2015-06-26 10:12:07','0'), ('33','女','2015-06-26 10:13:00','0'), ('34','女','2015-06-26 10:14:14','0'), ('35','女','2015-06-26 10:14:18','0'), ('36','女','2015-06-26 10:14:40','0'), ('37','女','2015-06-26 10:14:44','0'), ('38','女','2015-06-26 10:16:03','0'), ('39','女','2015-06-26 10:16:33','0'), ('40','女','2015-06-26 10:16:51','0'), ('41','女','2015-06-26 10:17:20','0'), ('42','女','2015-06-26 10:17:24','0'), ('43','女','2015-06-26 10:17:58','0'), ('44','女','2015-06-26 10:18:13','0'), ('45','女','2015-06-26 10:18:34','0'), ('46','女','2015-06-26 10:23:40','0'), ('47','女','2015-06-26 10:23:58','0'), ('48','女','2015-06-26 10:24:52','0'), ('49','女','2015-06-26 10:25:29','0'), ('50','女','2015-06-26 10:26:21','0'), ('51','女','2015-06-26 10:27:37','0'), ('52','女','2015-06-26 10:58:00','0'), ('53','女','2015-06-26 11:08:05','0'), ('54','女','2015-06-26 11:17:37','0'), ('55','女','2015-06-26 11:18:16','0'), ('56','女','2015-06-26 11:19:19','0'), ('57','女','2015-06-26 11:19:40','0'), ('58','女','2015-06-26 11:19:53','0'), ('59','女','2015-06-26 11:25:39','9'), ('60','女','2015-06-26 11:25:44','9'), ('61','女','2015-06-26 11:25:47','9'), ('62','女','2015-06-26 11:29:39','9'), ('63','女','2015-06-26 11:29:54','9'), ('64','女','2015-06-26 11:33:27','9'), ('65','女','2015-06-26 14:01:13','0'), ('66','女','2015-06-26 14:06:47','0'), ('67','女','2015-06-26 14:06:50','0'), ('68','女','2015-06-26 14:10:07','0'), ('69','女','2015-06-26 14:10:39','0'), ('70','女','2015-06-26 14:11:54','0'), ('71','女','2015-06-26 14:12:03','0'), ('72','女','2015-06-26 14:13:54','0'), ('73','女','2015-06-26 14:16:06','0'), ('74','女','2015-06-26 14:25:44','0'), ('75','女','2015-06-26 14:27:08','0'), ('76','女','2015-06-26 14:30:55','0'), ('77','女','2015-06-26 14:32:36','0'), ('78','女','2015-06-26 14:34:32','0'), ('79','女','2015-06-26 14:37:45','0'), ('80','女','2015-06-26 14:40:01','0'), ('81','女','2015-06-26 14:42:36','0'), ('82','女','2015-06-26 14:45:26','0'), ('83','女','2015-06-26 14:46:13','0'), ('84','女','2015-06-26 14:47:52','0'), ('85','女','2015-06-26 14:49:07','0'), ('86','女','2015-06-26 14:50:04','0'), ('87','女','2015-06-26 14:52:41','0'), ('88','女','2015-06-26 14:53:24','0'), ('89','女','2015-06-26 14:54:29','0'), ('90','女','2015-06-26 14:55:18','0'), ('91','女','2015-06-26 14:56:04','0'), ('92','女','2015-06-26 14:57:10','0'), ('93','女','2015-06-26 14:59:00','0'), ('94','女','2015-06-26 15:04:38','0'), ('95','女','2015-06-26 15:15:49','0'), ('96','女','2015-06-26 15:18:04','0'), ('97','女','2015-06-26 15:18:07','0'), ('98','女','2015-06-26 15:19:52','0'), ('99','女','2015-06-26 15:20:58','0'), ('100','女','2015-06-26 15:22:56','0');
INSERT INTO `search_key` VALUES ('101','女','2015-06-26 15:23:06','0'), ('102','女','2015-06-26 15:23:35','0'), ('103','女','2015-06-26 15:30:08','0'), ('104','女','2015-06-26 15:32:51','0'), ('105','女','2015-06-26 15:34:33','0'), ('106','女','2015-06-26 15:45:57','0'), ('107','女','2015-06-26 15:46:50','0'), ('108','女','2015-06-26 15:48:09','0'), ('109','女','2015-06-26 15:51:13','0'), ('110','女','2015-06-26 15:52:02','0'), ('111','女','2015-06-26 15:52:58','0'), ('112','女','2015-06-26 15:54:18','0'), ('113','女','2015-06-26 15:55:03','0'), ('114','女','2015-06-26 15:55:27','0'), ('115','女','2015-06-26 15:56:00','0'), ('116','女','2015-06-26 16:03:46','0'), ('117','女','2015-06-26 16:18:28','0'), ('118','女','2015-06-26 16:21:12','0'), ('119','女','2015-06-26 16:21:52','0'), ('120','女','2015-06-26 16:21:55','0'), ('121','女','2015-06-26 16:22:25','0'), ('122','女','2015-06-26 16:23:05','0'), ('123','女','2015-06-26 16:24:27','0'), ('124','女','2015-06-26 16:27:40','0'), ('125','女','2015-06-26 16:28:11','0'), ('126','女','2015-06-26 16:28:35','0'), ('127','女','2015-06-26 16:29:05','0'), ('128','女','2015-06-26 16:30:10','0'), ('129','女','2015-06-26 16:30:41','0'), ('130','女','2015-06-26 16:31:03','0'), ('131','女','2015-06-26 16:48:20','0'), ('132','女','2015-06-26 16:54:44','0'), ('133','女','2015-06-26 17:02:06','0'), ('134','女','2015-06-26 18:01:34','0'), ('135','女','2015-06-27 09:05:33','0'), ('136','女','2015-06-27 09:50:47','0'), ('137','女','2015-06-27 10:03:43','0'), ('138','女','2015-06-27 10:10:32','0'), ('139','女','2015-06-27 10:13:00','0'), ('140','女','2015-06-27 10:33:09','0'), ('141','女','2015-06-27 10:34:45','0'), ('142','女','2015-06-27 10:52:49','0'), ('143','女','2015-06-27 10:53:29','0'), ('144','女','2015-06-27 10:55:20','0'), ('145','女','2015-06-27 10:55:55','0'), ('146','女','2015-06-27 11:01:15','0'), ('147','女','2015-06-27 11:19:23','0'), ('148','女','2015-06-27 11:30:47','0'), ('149','女','2015-06-27 12:41:42','0'), ('150','女','2015-06-27 13:01:14','0'), ('151','女','2015-06-27 14:09:51','0'), ('152','女','2015-06-27 14:21:47','0'), ('153','女','2015-06-27 14:27:43','0'), ('154','女','2015-06-27 14:27:52','0'), ('155','女','2015-06-27 14:28:23','0'), ('156','女','2015-06-27 14:28:41','0'), ('157','女','2015-06-27 14:29:24','0'), ('158','女','2015-06-27 14:49:54','0'), ('159','女','2015-06-27 14:53:47','9'), ('160','女','2015-06-27 15:30:57','9'), ('161','女','2015-06-27 15:31:39','9'), ('162','女','2015-06-27 15:31:47','9'), ('163','女','2015-06-27 15:32:32','9'), ('164','女','2015-06-27 15:33:31','9'), ('165','女','2015-06-27 15:49:54','9'), ('166','女','2015-06-27 15:52:46','9'), ('167','女','2015-06-27 15:56:20','9'), ('168','女','2015-06-27 15:56:52','9'), ('169','女','2015-06-27 15:58:15','9'), ('170','女','2015-06-27 16:00:08','9'), ('171','女','2015-06-27 16:00:36','9'), ('172','女','2015-06-27 16:02:03','9'), ('173','女','2015-06-27 16:02:12','9'), ('174','女','2015-06-27 16:02:31','9'), ('175','女','2015-06-27 16:02:35','9'), ('176','女','2015-06-27 16:02:47','9'), ('177','女','2015-06-27 16:08:17','9'), ('178','女','2015-06-27 16:09:39','9'), ('179','女','2015-06-27 16:12:30','9');
INSERT INTO `seller_verified` VALUES ('6','9','1','李白','0','','0000-00-00','0000-00-00',NULL,NULL,NULL,'','','','2015-06-15 18:01:05','0000-00-00 00:00:00',NULL);
INSERT INTO `setting` VALUES ('1','0','shipping','shipping_sort_order','3','0'), ('2','0','sub_total','sub_total_sort_order','1','0'), ('3','0','sub_total','sub_total_status','1','0'), ('4','0','tax','tax_status','1','0'), ('5','0','total','total_sort_order','9','0'), ('6','0','total','total_status','1','0'), ('7','0','tax','tax_sort_order','5','0'), ('8','0','free_checkout','free_checkout_sort_order','1','0'), ('9','0','cod','cod_sort_order','5','0'), ('10','0','cod','cod_total','0.01','0'), ('11','0','cod','cod_order_status_id','1','0'), ('12','0','cod','cod_geo_zone_id','0','0'), ('13','0','cod','cod_status','1','0'), ('14','0','shipping','shipping_status','1','0'), ('15','0','shipping','shipping_estimator','1','0'), ('27','0','coupon','coupon_sort_order','4','0'), ('28','0','coupon','coupon_status','1','0'), ('34','0','flat','flat_sort_order','1','0'), ('35','0','flat','flat_status','1','0'), ('36','0','flat','flat_geo_zone_id','0','0'), ('37','0','flat','flat_tax_class_id','9','0'), ('41','0','flat','flat_cost','5.00','0'), ('42','0','credit','credit_sort_order','7','0'), ('43','0','credit','credit_status','1','0'), ('53','0','reward','reward_sort_order','2','0'), ('54','0','reward','reward_status','1','0'), ('146','0','category','category_status','1','0'), ('158','0','account','account_status','1','0'), ('159','0','affiliate','affiliate_status','1','0'), ('94','0','voucher','voucher_sort_order','8','0'), ('95','0','voucher','voucher_status','1','0'), ('103','0','free_checkout','free_checkout_status','1','0'), ('104','0','free_checkout','free_checkout_order_status_id','1','0'), ('1402','0','store','store_admin','1','0'), ('1403','0','store','store_status','1','0'), ('9076','0','config','config_mail_smtp_username','','0'), ('9077','0','config','config_mail_smtp_password','','0'), ('9078','0','config','config_mail_smtp_port','','0'), ('9079','0','config','config_mail_smtp_timeout','','0'), ('9080','0','config','config_mail_alert','','0'), ('9081','0','config','config_fraud_detection','0','0'), ('9082','0','config','config_fraud_key','','0'), ('9083','0','config','config_fraud_score','','0'), ('9084','0','config','config_fraud_status_id','7','0'), ('9085','0','config','config_secure','0','0'), ('9086','0','config','config_shared','0','0'), ('9087','0','config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg','0'), ('9088','0','config','config_seo_url','0','0'), ('9089','0','config','config_file_max_size','1048576','0'), ('9090','0','config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc','0'), ('9091','0','config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf','0'), ('9092','0','config','config_maintenance','0','0'), ('9093','0','config','config_password','1','0'), ('9094','0','config','config_encryption','3da6e1435b570983f017f5bc3f8fd4c2','0'), ('9095','0','config','config_compression','0','0'), ('9096','0','config','config_error_display','1','0'), ('9097','0','config','config_error_log','1','0'), ('9098','0','config','config_error_filename','error.log','0'), ('9075','0','config','config_mail_smtp_hostname','','0'), ('9074','0','config','config_mail_parameter','','0'), ('9073','0','config','config_mail_protocol','smtp','0'), ('9072','0','config','config_ftp_status','0','0'), ('9071','0','config','config_ftp_root','','0'), ('9070','0','config','config_ftp_password','','0'), ('9069','0','config','config_ftp_username','','0'), ('9068','0','config','config_ftp_port','21','0'), ('9067','0','config','config_ftp_hostname','127.0.0.1','0'), ('9066','0','config','config_full_screen','0','0'), ('9062','0','config','config_image_cart_height','100','0'), ('9063','0','config','config_image_location_width','268','0'), ('9065','0','config','config_home_nvgap','0px','0'), ('9064','0','config','config_image_location_height','50','0'), ('9059','0','config','config_image_wishlist_width','47','0'), ('9060','0','config','config_image_wishlist_height','47','0'), ('9061','0','config','config_image_cart_width','100','0'), ('9056','0','config','config_image_additional_height','74','0'), ('9057','0','config','config_image_related_width','260','0'), ('9058','0','config','config_image_related_height','260','0'), ('9055','0','config','config_image_additional_width','74','0'), ('9054','0','config','config_image_product_height','260','0'), ('9053','0','config','config_image_product_width','260','0'), ('9052','0','config','config_image_popup_height','800','0'), ('9051','0','config','config_image_popup_width','800','0'), ('9050','0','config','config_image_thumb_height','330','0'), ('9049','0','config','config_image_thumb_width','330','0'), ('9048','0','config','config_image_category_height','80','0'), ('9047','0','config','config_image_category_width','80','0'), ('9046','0','config','config_price_background','catalog/zuopin/21307064332015051407435458054.jpg','0'), ('9045','0','config','config_mbqr','catalog/tools/21307064332015050706473468787.png','0'), ('9043','0','config','config_icon','catalog/tools/21307064332015050706215127080.jpg','0'), ('9044','0','config','config_wxqr','catalog/tools/21307064332015050706451978271.jpg','0'), ('9042','0','config','config_logo','catalog/tools/logo.png','0'), ('9041','0','config','config_return_status_id','2','0'), ('9040','0','config','config_return_id','5','0'), ('9034','0','config','config_processing_status','a:1:{i:0;s:1:\"2\";}','1'), ('9035','0','config','config_complete_status','a:1:{i:0;s:1:\"5\";}','1'), ('9039','0','config','config_stock_checkout','0','0'), ('9038','0','config','config_stock_warning','0','0'), ('9037','0','config','config_stock_display','0','0'), ('9036','0','config','config_order_mail','0','0');
INSERT INTO `setting` VALUES ('9033','0','config','config_order_status_id','1','0'), ('9032','0','config','config_checkout_id','5','0'), ('9031','0','config','config_checkout_guest','1','0'), ('9030','0','config','config_cart_weight','1','0'), ('9029','0','config','config_invoice_prefix','INV-2013-00','0'), ('9028','0','config','config_account_mail','0','0'), ('9027','0','config','config_account_id','3','0'), ('9026','0','config','config_login_attempts','5','0'), ('9024','0','config','config_customer_group_display','a:1:{i:0;s:1:\"1\";}','1'), ('9025','0','config','config_customer_price','0','0'), ('9023','0','config','config_customer_group_id','1','0'), ('9022','0','config','config_customer_online','1','0'), ('9021','0','config','config_voucher_max','1000','0'), ('9020','0','config','config_voucher_min','1','0'), ('9019','0','config','config_review_mail','0','0'), ('9018','0','config','config_review_guest','1','0'), ('9017','0','config','config_review_status','1','0'), ('9016','0','config','config_limit_admin','20','0'), ('9015','0','config','config_product_description_length','70','0'), ('9014','0','config','config_product_limit','15','0'), ('9013','0','config','config_product_count','1','0'), ('9012','0','config','config_weight_class_id','1','0'), ('9011','0','config','config_length_class_id','1','0'), ('9002','0','config','config_meta_keyword','旅行兔 细分市场 开源 GUN许可 多用户电商平台 微信公众号管理 支付接口 opencart','0'), ('9010','0','config','config_currency_auto','1','0'), ('9009','0','config','config_currency','RMB','0'), ('9008','0','config','config_admin_language','cn','0'), ('9003','0','config','config_template','default','0'), ('9004','0','config','config_layout_id','4','0'), ('9005','0','config','config_country_id','25','0'), ('9006','0','config','config_zone_id','13','0'), ('9007','0','config','config_language','cn','0'), ('9001','0','config','config_meta_description','旅行兔是一个针对细分市场发起的、遵循GUN许可的、开源的、多用户（商家）电商平台系统框架。整合了微信网站一键接入、wap手机端自动适配、国内主流支付接口、奖金托管（可以选择商家的资金月结或是即时到帐、退款积分方式还是退现）。基于《OpenCart》在原有的用户基础上扩展了商家功能，可以审核用户资料批准创立自己的店铺，常用的社区功能。方便的VQMOD插件式扩展！','0'), ('9000','0','config','config_meta_title','旅行兔','0'), ('8999','0','config','config_comment','','0'), ('8996','0','config','config_telephone','123456789','0'), ('8997','0','config','config_image','catalog/logo.png','0'), ('8998','0','config','config_open','','0'), ('8995','0','config','config_email','xcalder@foxmail.com','0'), ('8994','0','config','config_geocode','','0'), ('8993','0','config','config_address','Address 1','0'), ('8992','0','config','config_owner','代智敏','0'), ('8991','0','config','config_name','旅行兔','0');
INSERT INTO `stock_status` VALUES ('7','1','In Stock'), ('8','1','Pre-Order'), ('5','1','Out Of Stock'), ('6','1','2-3 Days'), ('7','2','In Stock'), ('8','2','Pre-Order'), ('5','2','Out Of Stock'), ('6','2','2-3 Days');
INSERT INTO `upload` VALUES ('2','logo.png','logo.png.2bf6b1e6670e459fd2669538ec5e7bf8','9095bdd7ca7c80fa3456bd14d17fccb2f9e6c2e9','2015-06-17 14:24:54');
INSERT INTO `url_alias` VALUES ('942','category_id=20','desktops'), ('870','category_id=26','pc'), ('835','category_id=27','mac'), ('730','manufacturer_id=8','apple'), ('865','information_id=4','about_us'), ('943','category_id=34','mp3-players'), ('781','category_id=36','test2'), ('939','category_id=18','laptop-notebook'), ('936','category_id=46','macs'), ('776','category_id=45','windows'), ('933','category_id=25','component'), ('852','category_id=29','mouse'), ('779','category_id=28','monitor'), ('780','category_id=35','test1'), ('782','category_id=30','printer'), ('783','category_id=31','scanner'), ('784','category_id=32','web-camera'), ('946','category_id=57','tablet'), ('950','category_id=17','software'), ('928','category_id=24','smartphone'), ('949','category_id=33','camera'), ('790','category_id=43','test11'), ('791','category_id=44','test12'), ('792','category_id=47','test15'), ('793','category_id=48','test16'), ('794','category_id=49','test17'), ('795','category_id=50','test18'), ('796','category_id=51','test19'), ('797','category_id=52','test20'), ('798','category_id=58','test25'), ('799','category_id=53','test21'), ('800','category_id=54','test22'), ('801','category_id=55','test23'), ('802','category_id=56','test24'), ('803','category_id=38','test4'), ('804','category_id=37','test5'), ('805','category_id=39','test6'), ('806','category_id=40','test7'), ('807','category_id=41','test8'), ('808','category_id=42','test9'), ('828','manufacturer_id=9','canon'), ('829','manufacturer_id=5','htc'), ('830','manufacturer_id=7','hewlett-packard'), ('831','manufacturer_id=6','palm'), ('832','manufacturer_id=10','sony'), ('845','information_id=6','delivery'), ('846','information_id=3','privacy'), ('847','information_id=5','terms'), ('963','product_id=50','55');
INSERT INTO `user` VALUES ('1','1','xcalder','f57a0027e217d15eae8786ae9f11bd685f378fe1','2577ab8c2','John','xcalder@foxmail.com','catalog/banner/21307064332015050206043711175.jpg','','127.0.0.1','1','2015-06-06 09:27:34'), ('2','10','demo','c03dbe5dd502259025b1292bcaf20f32f87a06c4','f280fa6e8','demo','','catalog/banner/21307064332015050206051370595.jpg','','222.219.170.196','1','2015-06-06 10:26:02');
INSERT INTO `user_group` VALUES ('1','最高权限管理','a:2:{s:6:\"access\";a:105:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:17:\"catalog/recurring\";i:10;s:14:\"catalog/review\";i:11;s:18:\"common/column_left\";i:12;s:18:\"common/filemanager\";i:13;s:11:\"common/menu\";i:14;s:14:\"common/profile\";i:15;s:12:\"common/stats\";i:16;s:13:\"design/banner\";i:17;s:13:\"design/layout\";i:18;s:14:\"extension/feed\";i:19;s:19:\"extension/installer\";i:20;s:22:\"extension/modification\";i:21;s:16:\"extension/module\";i:22;s:17:\"extension/payment\";i:23;s:18:\"extension/shipping\";i:24;s:15:\"extension/total\";i:25;s:20:\"localisation/country\";i:26;s:21:\"localisation/currency\";i:27;s:21:\"localisation/geo_zone\";i:28;s:21:\"localisation/language\";i:29;s:25:\"localisation/length_class\";i:30;s:21:\"localisation/location\";i:31;s:25:\"localisation/order_status\";i:32;s:26:\"localisation/return_action\";i:33;s:26:\"localisation/return_reason\";i:34;s:26:\"localisation/return_status\";i:35;s:25:\"localisation/stock_status\";i:36;s:25:\"localisation/weight_class\";i:37;s:17:\"localisation/zone\";i:38;s:17:\"marketing/contact\";i:39;s:16:\"marketing/coupon\";i:40;s:19:\"marketing/marketing\";i:41;s:14:\"module/account\";i:42;s:13:\"module/banner\";i:43;s:17:\"module/bestseller\";i:44;s:19:\"module/block_layout\";i:45;s:15:\"module/carousel\";i:46;s:15:\"module/category\";i:47;s:15:\"module/featured\";i:48;s:13:\"module/filter\";i:49;s:11:\"module/html\";i:50;s:18:\"module/information\";i:51;s:13:\"module/latest\";i:52;s:16:\"module/slideshow\";i:53;s:14:\"module/special\";i:54;s:12:\"module/store\";i:55;s:21:\"payment/bank_transfer\";i:56;s:14:\"payment/cheque\";i:57;s:11:\"payment/cod\";i:58;s:21:\"payment/free_checkout\";i:59;s:24:\"report/customer_activity\";i:60;s:22:\"report/customer_credit\";i:61;s:21:\"report/customer_login\";i:62;s:22:\"report/customer_online\";i:63;s:21:\"report/customer_order\";i:64;s:22:\"report/customer_reward\";i:65;s:16:\"report/marketing\";i:66;s:24:\"report/product_purchased\";i:67;s:21:\"report/product_viewed\";i:68;s:18:\"report/sale_coupon\";i:69;s:17:\"report/sale_order\";i:70;s:18:\"report/sale_return\";i:71;s:20:\"report/sale_shipping\";i:72;s:17:\"sale/custom_field\";i:73;s:13:\"sale/customer\";i:74;s:20:\"sale/customer_ban_ip\";i:75;s:19:\"sale/customer_group\";i:76;s:10:\"sale/order\";i:77;s:14:\"sale/recurring\";i:78;s:11:\"sale/return\";i:79;s:12:\"sale/voucher\";i:80;s:18:\"sale/voucher_theme\";i:81;s:26:\"setting/officialstoresigns\";i:82;s:15:\"setting/setting\";i:83;s:13:\"setting/store\";i:84;s:13:\"shipping/flat\";i:85;s:13:\"shipping/free\";i:86;s:13:\"shipping/item\";i:87;s:15:\"shipping/pickup\";i:88;s:15:\"shipping/weight\";i:89;s:11:\"tool/backup\";i:90;s:14:\"tool/error_log\";i:91;s:18:\"tool/image_manager\";i:92;s:12:\"tool/sysinfo\";i:93;s:11:\"tool/upload\";i:94;s:12:\"total/coupon\";i:95;s:12:\"total/credit\";i:96;s:14:\"total/handling\";i:97;s:19:\"total/low_order_fee\";i:98;s:12:\"total/reward\";i:99;s:14:\"total/shipping\";i:100;s:15:\"total/sub_total\";i:101;s:11:\"total/total\";i:102;s:13:\"total/voucher\";i:103;s:9:\"user/user\";i:104;s:20:\"user/user_permission\";}s:6:\"modify\";a:105:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:17:\"catalog/recurring\";i:10;s:14:\"catalog/review\";i:11;s:18:\"common/column_left\";i:12;s:18:\"common/filemanager\";i:13;s:11:\"common/menu\";i:14;s:14:\"common/profile\";i:15;s:12:\"common/stats\";i:16;s:13:\"design/banner\";i:17;s:13:\"design/layout\";i:18;s:14:\"extension/feed\";i:19;s:19:\"extension/installer\";i:20;s:22:\"extension/modification\";i:21;s:16:\"extension/module\";i:22;s:17:\"extension/payment\";i:23;s:18:\"extension/shipping\";i:24;s:15:\"extension/total\";i:25;s:20:\"localisation/country\";i:26;s:21:\"localisation/currency\";i:27;s:21:\"localisation/geo_zone\";i:28;s:21:\"localisation/language\";i:29;s:25:\"localisation/length_class\";i:30;s:21:\"localisation/location\";i:31;s:25:\"localisation/order_status\";i:32;s:26:\"localisation/return_action\";i:33;s:26:\"localisation/return_reason\";i:34;s:26:\"localisation/return_status\";i:35;s:25:\"localisation/stock_status\";i:36;s:25:\"localisation/weight_class\";i:37;s:17:\"localisation/zone\";i:38;s:17:\"marketing/contact\";i:39;s:16:\"marketing/coupon\";i:40;s:19:\"marketing/marketing\";i:41;s:14:\"module/account\";i:42;s:13:\"module/banner\";i:43;s:17:\"module/bestseller\";i:44;s:19:\"module/block_layout\";i:45;s:15:\"module/carousel\";i:46;s:15:\"module/category\";i:47;s:15:\"module/featured\";i:48;s:13:\"module/filter\";i:49;s:11:\"module/html\";i:50;s:18:\"module/information\";i:51;s:13:\"module/latest\";i:52;s:16:\"module/slideshow\";i:53;s:14:\"module/special\";i:54;s:12:\"module/store\";i:55;s:21:\"payment/bank_transfer\";i:56;s:14:\"payment/cheque\";i:57;s:11:\"payment/cod\";i:58;s:21:\"payment/free_checkout\";i:59;s:24:\"report/customer_activity\";i:60;s:22:\"report/customer_credit\";i:61;s:21:\"report/customer_login\";i:62;s:22:\"report/customer_online\";i:63;s:21:\"report/customer_order\";i:64;s:22:\"report/customer_reward\";i:65;s:16:\"report/marketing\";i:66;s:24:\"report/product_purchased\";i:67;s:21:\"report/product_viewed\";i:68;s:18:\"report/sale_coupon\";i:69;s:17:\"report/sale_order\";i:70;s:18:\"report/sale_return\";i:71;s:20:\"report/sale_shipping\";i:72;s:17:\"sale/custom_field\";i:73;s:13:\"sale/customer\";i:74;s:20:\"sale/customer_ban_ip\";i:75;s:19:\"sale/customer_group\";i:76;s:10:\"sale/order\";i:77;s:14:\"sale/recurring\";i:78;s:11:\"sale/return\";i:79;s:12:\"sale/voucher\";i:80;s:18:\"sale/voucher_theme\";i:81;s:26:\"setting/officialstoresigns\";i:82;s:15:\"setting/setting\";i:83;s:13:\"setting/store\";i:84;s:13:\"shipping/flat\";i:85;s:13:\"shipping/free\";i:86;s:13:\"shipping/item\";i:87;s:15:\"shipping/pickup\";i:88;s:15:\"shipping/weight\";i:89;s:11:\"tool/backup\";i:90;s:14:\"tool/error_log\";i:91;s:18:\"tool/image_manager\";i:92;s:12:\"tool/sysinfo\";i:93;s:11:\"tool/upload\";i:94;s:12:\"total/coupon\";i:95;s:12:\"total/credit\";i:96;s:14:\"total/handling\";i:97;s:19:\"total/low_order_fee\";i:98;s:12:\"total/reward\";i:99;s:14:\"total/shipping\";i:100;s:15:\"total/sub_total\";i:101;s:11:\"total/total\";i:102;s:13:\"total/voucher\";i:103;s:9:\"user/user\";i:104;s:20:\"user/user_permission\";}}'), ('10','普通客户','a:1:{s:6:\"access\";a:107:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:17:\"catalog/recurring\";i:10;s:14:\"catalog/review\";i:11;s:18:\"common/column_left\";i:12;s:18:\"common/filemanager\";i:13;s:11:\"common/menu\";i:14;s:14:\"common/profile\";i:15;s:12:\"common/stats\";i:16;s:13:\"design/banner\";i:17;s:13:\"design/layout\";i:18;s:14:\"extension/feed\";i:19;s:19:\"extension/installer\";i:20;s:22:\"extension/modification\";i:21;s:16:\"extension/module\";i:22;s:17:\"extension/payment\";i:23;s:18:\"extension/shipping\";i:24;s:15:\"extension/total\";i:25;s:20:\"localisation/country\";i:26;s:21:\"localisation/currency\";i:27;s:21:\"localisation/geo_zone\";i:28;s:21:\"localisation/language\";i:29;s:25:\"localisation/length_class\";i:30;s:21:\"localisation/location\";i:31;s:25:\"localisation/order_status\";i:32;s:26:\"localisation/return_action\";i:33;s:26:\"localisation/return_reason\";i:34;s:26:\"localisation/return_status\";i:35;s:25:\"localisation/stock_status\";i:36;s:25:\"localisation/weight_class\";i:37;s:17:\"localisation/zone\";i:38;s:19:\"marketing/affiliate\";i:39;s:17:\"marketing/contact\";i:40;s:16:\"marketing/coupon\";i:41;s:19:\"marketing/marketing\";i:42;s:14:\"module/account\";i:43;s:16:\"module/affiliate\";i:44;s:13:\"module/banner\";i:45;s:17:\"module/bestseller\";i:46;s:15:\"module/carousel\";i:47;s:15:\"module/category\";i:48;s:15:\"module/featured\";i:49;s:13:\"module/filter\";i:50;s:11:\"module/html\";i:51;s:18:\"module/information\";i:52;s:13:\"module/latest\";i:53;s:16:\"module/slideshow\";i:54;s:14:\"module/special\";i:55;s:12:\"module/store\";i:56;s:21:\"payment/bank_transfer\";i:57;s:14:\"payment/cheque\";i:58;s:11:\"payment/cod\";i:59;s:21:\"payment/free_checkout\";i:60;s:16:\"report/affiliate\";i:61;s:25:\"report/affiliate_activity\";i:62;s:22:\"report/affiliate_login\";i:63;s:24:\"report/customer_activity\";i:64;s:22:\"report/customer_credit\";i:65;s:21:\"report/customer_login\";i:66;s:22:\"report/customer_online\";i:67;s:21:\"report/customer_order\";i:68;s:22:\"report/customer_reward\";i:69;s:16:\"report/marketing\";i:70;s:24:\"report/product_purchased\";i:71;s:21:\"report/product_viewed\";i:72;s:18:\"report/sale_coupon\";i:73;s:17:\"report/sale_order\";i:74;s:18:\"report/sale_return\";i:75;s:20:\"report/sale_shipping\";i:76;s:17:\"sale/custom_field\";i:77;s:13:\"sale/customer\";i:78;s:20:\"sale/customer_ban_ip\";i:79;s:19:\"sale/customer_group\";i:80;s:10:\"sale/order\";i:81;s:14:\"sale/recurring\";i:82;s:11:\"sale/return\";i:83;s:12:\"sale/voucher\";i:84;s:18:\"sale/voucher_theme\";i:85;s:15:\"setting/setting\";i:86;s:13:\"setting/store\";i:87;s:13:\"shipping/flat\";i:88;s:13:\"shipping/free\";i:89;s:13:\"shipping/item\";i:90;s:15:\"shipping/pickup\";i:91;s:15:\"shipping/weight\";i:92;s:11:\"tool/backup\";i:93;s:14:\"tool/error_log\";i:94;s:12:\"tool/sysinfo\";i:95;s:11:\"tool/upload\";i:96;s:12:\"total/coupon\";i:97;s:12:\"total/credit\";i:98;s:14:\"total/handling\";i:99;s:19:\"total/low_order_fee\";i:100;s:12:\"total/reward\";i:101;s:14:\"total/shipping\";i:102;s:15:\"total/sub_total\";i:103;s:11:\"total/total\";i:104;s:13:\"total/voucher\";i:105;s:9:\"user/user\";i:106;s:20:\"user/user_permission\";}}');
INSERT INTO `voucher` VALUES ('1','0','5688','1211','xx@kk.com','576228830@qq.com','576228830@qq.com','7','信天是个好日子','20.0000','1','2015-05-07 16:36:17');
INSERT INTO `voucher_theme` VALUES ('8','catalog/demo/canon_eos_5d_2.jpg'), ('7','catalog/demo/gift-voucher-birthday.jpg'), ('6','catalog/demo/apple_logo.jpg');
INSERT INTO `voucher_theme_description` VALUES ('6','1','Christmas'), ('7','1','Birthday'), ('8','1','General'), ('6','2','Christmas'), ('7','2','Birthday'), ('8','2','General');
INSERT INTO `weight_class` VALUES ('1','1.00000000'), ('2','1000.00000000'), ('5','2.20460000'), ('6','35.27400000');
INSERT INTO `weight_class_description` VALUES ('1','1','Kilogram','kg'), ('2','1','Gram','g'), ('5','1','Pound ','lb'), ('6','1','Ounce','oz'), ('1','2','Kilogram','kg'), ('2','2','Gram','g'), ('5','2','Pound ','lb'), ('6','2','Ounce','oz');
INSERT INTO `zone` VALUES ('1','25','昆明市','','1'), ('2','25','安宁市','','1'), ('3','25','曲靖市','','1'), ('4','25','宣威市','','1'), ('5','25','玉溪市','','1'), ('6','25','保山市','','1'), ('7','25','昭通市','','1'), ('8','25','思茅市','','1'), ('9','25','临沧市','','1'), ('10','25','个旧市','','1'), ('11','25','开远市','','1'), ('12','25','景洪市','','1'), ('13','25','楚雄市','','1'), ('14','25','大理市','','1'), ('15','25','潞西市','','1'), ('16','25','瑞丽市','','1'), ('17','1','东城区','','1'), ('18','1','西城区','','1'), ('19','1','朝阳区','','1'), ('20','1','海淀区','','1'), ('21','1','丰台区','','1'), ('22','1','石景山区','','1'), ('23','1','门头沟区','','1'), ('24','1','房山区','','1'), ('34','9','黄浦区','','1'), ('26','1','大兴区','','1'), ('27','1','通州区','','1'), ('28','1','顺义区','','1'), ('29','1','昌平区','','1'), ('30','1','平谷区','','1'), ('31','1','怀柔区','','1'), ('32','1','密云县','','1'), ('33','1','延庆县','','1'), ('35','9','徐汇区','','1'), ('36','9','长宁区','','1'), ('37','9','静安区','','1'), ('38','9','普陀区','','1'), ('39','9','闸北区','','1'), ('40','9','虹口区','','1'), ('41','9','杨浦区','','1'), ('42','9','闵行区','','1'), ('43','9','宝山区','','1'), ('44','9','嘉定区','','1'), ('45','9','浦东新区','','1'), ('46','9','金山区','','1'), ('47','9','松江区','','1'), ('48','9','青浦区','','1'), ('49','9','奉贤区','','1'), ('50','9','崇明县','','1'), ('51','2','和平区','','1'), ('52','2','河东区','','1'), ('53','2','河西区','','1'), ('54','2','南开区','','1'), ('55','2','河北区','','1'), ('56','2','红桥区','','1'), ('57','2','东丽区','','1'), ('58','2','西青区','','1'), ('59','2','津南区','','1'), ('60','2','北辰区','','1'), ('61','2','武清区','','1'), ('62','2','宝坻区','','1'), ('63','2','滨海新区','','1'), ('64','2','宁河县','','1'), ('65','2','静海县','','1'), ('66','2','蓟　县','','1'), ('67','3','石家庄市','','1'), ('68','3','唐山市','','1'), ('69','3','秦皇岛市','','1'), ('70','3','邯郸市','','1'), ('71','3','邢台市','','1'), ('72','3','保定市','','1'), ('73','3','张家口市','','1'), ('74','3','承德市','','1'), ('75','3','沧州市','','1'), ('76','3','廊坊市','','1'), ('77','3','衡水市','','1');
