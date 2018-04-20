/*
Navicat MySQL Data Transfer

Source Server         : zhou
Source Server Version : 50540
Source Host           : 192.168.100.136:3306
Source Database       : jiafuyun_api

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-20 09:48:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jfy_channel`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel`;
CREATE TABLE `jfy_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL,
  `login_password` varchar(64) NOT NULL COMMENT '管理员密码',
  `salt` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `is_enable` enum('y','n') NOT NULL DEFAULT 'y',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel
-- ----------------------------
INSERT INTO `jfy_channel` VALUES ('5', '15516517307', 'e0de46dc0a858b776acc67baeeb886e1da3b078e', 'eYxh0mZ7', '张伟', '15516517307', 'y', '1523602394', '192.168.100.190', '1523602394', '1514274959');
INSERT INTO `jfy_channel` VALUES ('6', '18818223461', 'ecf9f50cae0162c8b1c84f6d654a0ff09f9a2a61', '7Fqux1Jg', '大毛1', '18818223461', 'y', '1523602394', '192.168.100.190', '1523602394', '1514444337');
INSERT INTO `jfy_channel` VALUES ('8', '18817733333', '51b8d8ff03e07e84a1021ee0a54b2f8cb3363d52', 'YzOxYyLk', '测试', '18817733333', 'y', '1523602394', '192.168.100.190', '1523602394', '1523868554');
INSERT INTO `jfy_channel` VALUES ('9', '11111111111', 'bf5a270b262edb91efe5b4696c2da41444dd0678', 'fMlbsu', '11111111111', '11111111111', 'y', '0', null, '1524020902', '1524020902');
INSERT INTO `jfy_channel` VALUES ('10', '1515151111', 'a0ef1fca93e9eeed26da07095c5e76f58c7d3145', 'BgR6L4', '1515151111', '1515151111', 'y', '0', null, '1524039770', '1524039770');

-- ----------------------------
-- Table structure for `jfy_channel_contract`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_contract`;
CREATE TABLE `jfy_channel_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` varchar(255) NOT NULL COMMENT '渠道商id',
  `bn` varchar(255) NOT NULL COMMENT '编号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '合同金额',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `status` enum('close','finish','active') NOT NULL DEFAULT 'active',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_contract
-- ----------------------------
INSERT INTO `jfy_channel_contract` VALUES ('3', '5', 'O171226155527112', '2000.00', '', 'finish', '1514274959', '1514276735');
INSERT INTO `jfy_channel_contract` VALUES ('4', '5', 'O171226162292548', '2000.00', '', 'active', '1514276523', '1514276523');
INSERT INTO `jfy_channel_contract` VALUES ('5', '5', 'O171227110716773', '1000.00', '', 'active', '1514344022', '1514344022');
INSERT INTO `jfy_channel_contract` VALUES ('6', '5', 'O171227110777683', '3000.00', '', 'active', '1514344025', '1514344025');
INSERT INTO `jfy_channel_contract` VALUES ('7', '5', 'O171227110732828', '4000.00', '', 'active', '1514344027', '1514344027');
INSERT INTO `jfy_channel_contract` VALUES ('8', '5', 'O171227110784168', '5000.00', '', 'active', '1514344029', '1514344029');
INSERT INTO `jfy_channel_contract` VALUES ('9', '6', 'O171228144088016', '0.00', '', 'finish', '1514443235', '1524017524');
INSERT INTO `jfy_channel_contract` VALUES ('10', '5', 'O171228180771796', '1999.00', '', 'active', '1514455637', '1514455637');
INSERT INTO `jfy_channel_contract` VALUES ('11', '10', 'O171228185676444', '1999.00', '', 'active', '1514458560', '1514458560');
INSERT INTO `jfy_channel_contract` VALUES ('12', '5', 'O180102180242667', '1000.00', '', 'active', '1514887320', '1514887320');
INSERT INTO `jfy_channel_contract` VALUES ('13', '5', 'O180103102848484', '10000.00', '', 'active', '1514946491', '1514946491');
INSERT INTO `jfy_channel_contract` VALUES ('15', '8', 'O180412142415421', '10000.00', '', 'active', '1523514244', '1523514244');
INSERT INTO `jfy_channel_contract` VALUES ('16', '9', 'O180412152557211', '19.00', '', 'finish', '1523517955', '1524020916');

-- ----------------------------
-- Table structure for `jfy_channel_contract_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_contract_log`;
CREATE TABLE `jfy_channel_contract_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '编号',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_contract_log
-- ----------------------------
INSERT INTO `jfy_channel_contract_log` VALUES ('1', '4', '创建合同!', '1514276523');
INSERT INTO `jfy_channel_contract_log` VALUES ('2', '3', '作废合同!', '1514276727');
INSERT INTO `jfy_channel_contract_log` VALUES ('3', '3', '完成合同!', '1514276735');
INSERT INTO `jfy_channel_contract_log` VALUES ('4', '5', '创建合同!', '1514344022');
INSERT INTO `jfy_channel_contract_log` VALUES ('5', '6', '创建合同!', '1514344025');
INSERT INTO `jfy_channel_contract_log` VALUES ('6', '7', '创建合同!', '1514344027');
INSERT INTO `jfy_channel_contract_log` VALUES ('7', '8', '创建合同!', '1514344029');
INSERT INTO `jfy_channel_contract_log` VALUES ('8', '9', '创建合同!', '1514443235');
INSERT INTO `jfy_channel_contract_log` VALUES ('9', '10', '创建合同!', '1514455638');
INSERT INTO `jfy_channel_contract_log` VALUES ('10', '11', '创建合同!', '1514458560');
INSERT INTO `jfy_channel_contract_log` VALUES ('11', '12', '创建合同!', '1514887320');
INSERT INTO `jfy_channel_contract_log` VALUES ('12', '13', '创建合同!', '1514946491');
INSERT INTO `jfy_channel_contract_log` VALUES ('14', '15', '创建合同!', '1523514244');
INSERT INTO `jfy_channel_contract_log` VALUES ('15', '16', '创建合同!', '1523517955');
INSERT INTO `jfy_channel_contract_log` VALUES ('16', '18', '创建合同!', '1523846227');
INSERT INTO `jfy_channel_contract_log` VALUES ('17', '19', '创建合同!', '1523846254');
INSERT INTO `jfy_channel_contract_log` VALUES ('18', '20', '创建合同!', '1523846308');
INSERT INTO `jfy_channel_contract_log` VALUES ('19', '21', '创建合同!', '1523846345');
INSERT INTO `jfy_channel_contract_log` VALUES ('20', '23', '创建合同!', '1523846387');
INSERT INTO `jfy_channel_contract_log` VALUES ('21', '24', '创建合同!', '1523846397');
INSERT INTO `jfy_channel_contract_log` VALUES ('22', '25', '创建合同!', '1523846416');
INSERT INTO `jfy_channel_contract_log` VALUES ('23', '26', '创建合同!', '1523846425');
INSERT INTO `jfy_channel_contract_log` VALUES ('24', '27', '创建合同!', '1523846458');
INSERT INTO `jfy_channel_contract_log` VALUES ('25', '28', '创建合同!', '1523846520');
INSERT INTO `jfy_channel_contract_log` VALUES ('26', '29', '创建合同!', '1523846589');
INSERT INTO `jfy_channel_contract_log` VALUES ('27', '30', '创建合同!', '1523846628');
INSERT INTO `jfy_channel_contract_log` VALUES ('28', '31', '创建合同!', '1523846701');
INSERT INTO `jfy_channel_contract_log` VALUES ('29', '32', '创建合同!', '1523846837');
INSERT INTO `jfy_channel_contract_log` VALUES ('30', '33', '创建合同!', '1523846949');
INSERT INTO `jfy_channel_contract_log` VALUES ('31', '34', '创建合同!', '1523846959');
INSERT INTO `jfy_channel_contract_log` VALUES ('32', '35', '创建合同!', '1523846967');
INSERT INTO `jfy_channel_contract_log` VALUES ('33', '36', '创建合同!', '1523846979');
INSERT INTO `jfy_channel_contract_log` VALUES ('34', '37', '创建合同!', '1523846990');
INSERT INTO `jfy_channel_contract_log` VALUES ('35', '38', '创建合同!', '1523847007');
INSERT INTO `jfy_channel_contract_log` VALUES ('36', '39', '创建合同!', '1523847042');
INSERT INTO `jfy_channel_contract_log` VALUES ('37', '40', '创建合同!', '1523847082');
INSERT INTO `jfy_channel_contract_log` VALUES ('38', '41', '创建合同!', '1523847119');
INSERT INTO `jfy_channel_contract_log` VALUES ('39', '42', '创建合同!', '1523847218');
INSERT INTO `jfy_channel_contract_log` VALUES ('40', '43', '创建合同!', '1523847328');
INSERT INTO `jfy_channel_contract_log` VALUES ('41', '44', '创建合同!', '1523847349');
INSERT INTO `jfy_channel_contract_log` VALUES ('42', '45', '创建合同!', '1523847379');
INSERT INTO `jfy_channel_contract_log` VALUES ('43', '46', '创建合同!', '1523847393');
INSERT INTO `jfy_channel_contract_log` VALUES ('44', '47', '创建合同!', '1523847410');
INSERT INTO `jfy_channel_contract_log` VALUES ('45', '48', '创建合同!', '1523847450');
INSERT INTO `jfy_channel_contract_log` VALUES ('46', '49', '创建合同!', '1523847481');
INSERT INTO `jfy_channel_contract_log` VALUES ('47', '50', '创建合同!', '1523847509');
INSERT INTO `jfy_channel_contract_log` VALUES ('48', '51', '创建合同!', '1523847573');
INSERT INTO `jfy_channel_contract_log` VALUES ('49', '52', '创建合同!', '1523847609');
INSERT INTO `jfy_channel_contract_log` VALUES ('50', '53', '创建合同!', '1523847707');
INSERT INTO `jfy_channel_contract_log` VALUES ('51', '54', '创建合同!', '1523847857');
INSERT INTO `jfy_channel_contract_log` VALUES ('52', '55', '创建合同!', '1523847901');
INSERT INTO `jfy_channel_contract_log` VALUES ('53', '56', '创建合同!', '1523848080');
INSERT INTO `jfy_channel_contract_log` VALUES ('54', '57', '创建合同!', '1523848148');
INSERT INTO `jfy_channel_contract_log` VALUES ('55', '58', '创建合同!', '1523848189');
INSERT INTO `jfy_channel_contract_log` VALUES ('56', '59', '创建合同!', '1523848214');
INSERT INTO `jfy_channel_contract_log` VALUES ('57', '60', '创建合同!', '1523848245');
INSERT INTO `jfy_channel_contract_log` VALUES ('58', '61', '创建合同!', '1523848314');
INSERT INTO `jfy_channel_contract_log` VALUES ('59', '62', '创建合同!', '1523848364');
INSERT INTO `jfy_channel_contract_log` VALUES ('60', '63', '创建合同!', '1523848396');
INSERT INTO `jfy_channel_contract_log` VALUES ('61', '64', '创建合同!', '1523848477');
INSERT INTO `jfy_channel_contract_log` VALUES ('62', '65', '创建合同!', '1523848568');
INSERT INTO `jfy_channel_contract_log` VALUES ('63', '66', '创建合同!', '1523848598');
INSERT INTO `jfy_channel_contract_log` VALUES ('64', '67', '创建合同!', '1523848656');
INSERT INTO `jfy_channel_contract_log` VALUES ('65', '68', '创建合同!', '1523848764');
INSERT INTO `jfy_channel_contract_log` VALUES ('66', '69', '创建合同!', '1523848848');
INSERT INTO `jfy_channel_contract_log` VALUES ('67', '70', '创建合同!', '1523848870');
INSERT INTO `jfy_channel_contract_log` VALUES ('68', '71', '创建合同!', '1523848898');
INSERT INTO `jfy_channel_contract_log` VALUES ('69', '72', '创建合同!', '1523848936');
INSERT INTO `jfy_channel_contract_log` VALUES ('70', '73', '创建合同!', '1523848979');
INSERT INTO `jfy_channel_contract_log` VALUES ('71', '74', '创建合同!', '1523849396');
INSERT INTO `jfy_channel_contract_log` VALUES ('72', '75', '创建合同!', '1523866761');
INSERT INTO `jfy_channel_contract_log` VALUES ('73', '76', '创建合同!', '1523866881');
INSERT INTO `jfy_channel_contract_log` VALUES ('74', '77', '创建合同!', '1523948566');
INSERT INTO `jfy_channel_contract_log` VALUES ('75', '9', '完成合同!', '1524017524');
INSERT INTO `jfy_channel_contract_log` VALUES ('76', '75', '完成合同!', '1524017577');
INSERT INTO `jfy_channel_contract_log` VALUES ('77', '75', '完成合同!', '1524017609');
INSERT INTO `jfy_channel_contract_log` VALUES ('78', '76', '完成合同!', '1524017613');
INSERT INTO `jfy_channel_contract_log` VALUES ('79', '77', '作废合同!', '1524017991');
INSERT INTO `jfy_channel_contract_log` VALUES ('80', '77', '作废合同!', '1524017998');
INSERT INTO `jfy_channel_contract_log` VALUES ('81', '78', '创建合同!', '1524020902');
INSERT INTO `jfy_channel_contract_log` VALUES ('82', '16', '完成合同!', '1524020916');
INSERT INTO `jfy_channel_contract_log` VALUES ('83', '78', '完成合同!', '1524020920');
INSERT INTO `jfy_channel_contract_log` VALUES ('84', '79', '创建合同!', '1524020928');
INSERT INTO `jfy_channel_contract_log` VALUES ('85', '80', '创建合同!', '1524020945');
INSERT INTO `jfy_channel_contract_log` VALUES ('86', '81', '创建合同!', '1524021013');
INSERT INTO `jfy_channel_contract_log` VALUES ('87', '82', '创建合同!', '1524021043');
INSERT INTO `jfy_channel_contract_log` VALUES ('88', '83', '创建合同!', '1524021122');
INSERT INTO `jfy_channel_contract_log` VALUES ('89', '84', '创建合同!', '1524039770');

-- ----------------------------
-- Table structure for `jfy_channel_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_coupon`;
CREATE TABLE `jfy_channel_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠卷ID',
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '合约ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠卷名称',
  `total` int(10) NOT NULL DEFAULT '0' COMMENT '发放总数',
  `receive_num` int(10) NOT NULL DEFAULT '0' COMMENT '已领取数量',
  `lave_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `face_value` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '面值 cart_type为money时使用 ',
  `limit_num` int(11) NOT NULL DEFAULT '0' COMMENT '每人限领数量 0为不限制',
  `begin_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '优惠券状态:y 正常, n 失效',
  `fail_time` int(10) NOT NULL DEFAULT '0' COMMENT '优惠券失效时间',
  `attribute_type` varchar(50) NOT NULL DEFAULT 'all' COMMENT '针对服务',
  `description` text COMMENT '使用说明',
  `is_delete` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否删除:y 是 n 否',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `cart_type` enum('number','money') NOT NULL DEFAULT 'money' COMMENT 'money 金额 number次数',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '详细地址',
  `limit_type` enum('month','all','day') NOT NULL DEFAULT 'all' COMMENT 'day 一天内限领几张 month一个月内限领几张 all 一批内限领几张',
  `service_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一张卡服务多少次 cart_type为number时使用',
  `hours` int(255) NOT NULL DEFAULT '0' COMMENT '家服卡规定的服务时长  只有在临时保洁时使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_coupon
-- ----------------------------
INSERT INTO `jfy_channel_coupon` VALUES ('1', '5', '4', '周末大酬宾', '10', '9', '2', '20.00', '0', '1514277072', '0', 'y', '1514721600', 'all', '周末大酬宾', 'n', '0', '1514277072', '1514430248', '1', '310000', '', '310100', '310152', '120号花园小区', '', '0', '0');
INSERT INTO `jfy_channel_coupon` VALUES ('2', '5', '10', '喵神网络', '10', '3', '7', '1999.00', '0', '1514458818', '0', 'y', '1514981543', 'all', '暂无', 'n', '0', '1514458818', '1514945911', '1', '210000', '', '210200', '210203', '上海', '', '0', '0');
INSERT INTO `jfy_channel_coupon` VALUES ('3', '5', '10', '喵神网络', '10', '0', '10', '1999.00', '0', '1514458831', '0', 'y', '1514458529', 'all', '暂无', 'n', '0', '1514458831', '1514458831', '1', '210000', '', '210200', '210203', '上海', '', '0', '0');
INSERT INTO `jfy_channel_coupon` VALUES ('4', '5', '12', '活动', '10', '1', '9', '100.00', '0', '1514887382', '0', 'y', '1515686400', 'all', '发射东方红根本', 'n', '0', '1514887382', '1514888122', '1', '310000', '', '310100', '310104', '长达上课', '', '0', '0');
INSERT INTO `jfy_channel_coupon` VALUES ('5', '5', '13', '促销活动', '10', '1', '9', '50.00', '0', '1514946615', '0', 'y', '1517241600', 'all', '打发时间搞飞机啊', 'n', '0', '1514946615', '1514946760', '1', '310000', '', '310100', '310105', '新华路365弄', '', '0', '0');
INSERT INTO `jfy_channel_coupon` VALUES ('17', '10', '11', '家服卡', '10', '3', '7', '0.00', '1', '1524105963', '0', 'y', '1555603200', 'single_cleaning', '111', 'n', '0', '1524105963', '1524106994', '1', '310000', 'number', '310100', '310152', '', 'day', '12', '3');

-- ----------------------------
-- Table structure for `jfy_channel_coupon_details`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_coupon_details`;
CREATE TABLE `jfy_channel_coupon_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠卷ID',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户ID',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '合约ID',
  `partner_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券类型ID',
  `bn` varchar(255) NOT NULL COMMENT '优惠卷名称',
  `cdk` varchar(255) NOT NULL COMMENT '发放总数',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用人ID',
  `mobile` varchar(11) DEFAULT NULL COMMENT '使用人手机号码',
  `status` enum('y','used','get','n') NOT NULL DEFAULT 'y' COMMENT '家服卡状态:y 正常, n 失效 used已领取还有剩余次数 get已领取未使用',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `service_num` int(11) NOT NULL DEFAULT '0' COMMENT '家服卡剩余的优惠次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_coupon_details
-- ----------------------------
INSERT INTO `jfy_channel_coupon_details` VALUES ('1', '5', '4', '1', 'U00000001', 'QU0sMxT497', '0', null, 'y', '1514277072', '1514277072', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('2', '5', '4', '1', 'U00000002', 'uhIdvCX1rQ', '0', null, 'y', '1514277072', '1514277072', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('3', '5', '4', '1', 'U00000003', 'hyeJRVLn8v', '46', '18272878105', 'used', '1514277072', '1514518657', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('4', '5', '4', '1', 'U00000004', 'CBvk0aIxws', '46', '18272878105', 'get', '1514277072', '1514430232', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('5', '5', '4', '1', 'U00000005', 'RHU75KMmK1', '46', '18272878105', 'get', '1514277072', '1514430240', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('6', '5', '4', '1', 'U00000006', 'f7umZb89dx', '46', '18272878105', 'get', '1514277072', '1514430248', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('7', '5', '4', '1', 'U00000007', '5t6k4mfs7I', '46', '18272878105', 'used', '1514277072', '1514427564', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('8', '5', '4', '1', 'U00000008', 'TAfpcTiD1f', '435', '18522229999', 'get', '1514277072', '1514281760', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('9', '5', '4', '1', 'U00000009', 'Xtz0ik8vhs', '46', '18272878105', 'get', '1514277072', '1514281519', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('10', '5', '4', '1', 'U00000010', 'J0a91Ak8pT', '435', '18522229999', 'used', '1514277072', '1514366713', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('11', '5', '10', '2', 'U00000011', 'I928w914q3', '435', '18522229999', 'get', '1514458818', '1514874325', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('12', '5', '10', '2', 'U00000012', 'Qv7q9tq0CZ', '46', '18272878105', 'used', '1514458818', '1514876135', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('13', '5', '10', '2', 'U00000013', 'wlrIMzLA4f', '46', '18272878105', 'used', '1514458818', '1514945983', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1332', '10', '11', '17', 'U000000014', '4fKwOue3d', '1', '15516517307', 'used', '1524105963', '1524106953', '0');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1333', '10', '11', '17', 'U000000015', 'snezrnAzU', '1', '15516517307', 'used', '1524105963', '1524106994', '9');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1334', '10', '11', '17', 'U000000016', 'LtPkL8fSu', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1335', '10', '11', '17', 'U000000017', 'x9X4vklTX', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1336', '10', '11', '17', 'U000000018', 'vjPpFxOCi', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1337', '10', '11', '17', 'U000000019', 'zxFoO1Typ', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1338', '10', '11', '17', 'U000000020', 'UIeKMHq6o', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1339', '10', '11', '17', 'U000000021', 'PdHPOPH83', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1340', '10', '11', '17', 'U000000022', 'RadFFRYQo', '0', null, 'y', '1524105963', '1524105963', '12');
INSERT INTO `jfy_channel_coupon_details` VALUES ('1341', '10', '11', '17', 'U000000023', 'K3nxz9E2f', '1', '15516517307', 'get', '1524105963', '1524105981', '12');

-- ----------------------------
-- Table structure for `jfy_channel_coupon_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_coupon_log`;
CREATE TABLE `jfy_channel_coupon_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券使用记录',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '家服卡id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_coupon_log
-- ----------------------------
INSERT INTO `jfy_channel_coupon_log` VALUES ('1', '1', '1332', '1524132090');
INSERT INTO `jfy_channel_coupon_log` VALUES ('2', '1', '1332', '1524133303');
INSERT INTO `jfy_channel_coupon_log` VALUES ('3', '1', '1332', '1524133366');
INSERT INTO `jfy_channel_coupon_log` VALUES ('4', '1', '1332', '1524133376');
INSERT INTO `jfy_channel_coupon_log` VALUES ('5', '1', '1332', '1524133410');
INSERT INTO `jfy_channel_coupon_log` VALUES ('6', '1', '1332', '1524133434');
INSERT INTO `jfy_channel_coupon_log` VALUES ('7', '1', '1332', '1524133473');
INSERT INTO `jfy_channel_coupon_log` VALUES ('8', '1', '1332', '1524133588');
INSERT INTO `jfy_channel_coupon_log` VALUES ('9', '1', '1332', '1524133602');
INSERT INTO `jfy_channel_coupon_log` VALUES ('10', '1', '1332', '1524133603');
INSERT INTO `jfy_channel_coupon_log` VALUES ('11', '1', '1332', '1524133603');
INSERT INTO `jfy_channel_coupon_log` VALUES ('12', '1', '1332', '1524133708');
INSERT INTO `jfy_channel_coupon_log` VALUES ('13', '1', '1332', '1524133718');
INSERT INTO `jfy_channel_coupon_log` VALUES ('14', '1', '1332', '1524133772');
INSERT INTO `jfy_channel_coupon_log` VALUES ('15', '1', '1332', '1524133773');
INSERT INTO `jfy_channel_coupon_log` VALUES ('16', '1', '1332', '1524133840');
INSERT INTO `jfy_channel_coupon_log` VALUES ('17', '1', '1332', '1524133898');
INSERT INTO `jfy_channel_coupon_log` VALUES ('18', '1', '1332', '1524133899');
INSERT INTO `jfy_channel_coupon_log` VALUES ('19', '1', '1332', '1524133900');
INSERT INTO `jfy_channel_coupon_log` VALUES ('20', '1', '1332', '1524133944');
INSERT INTO `jfy_channel_coupon_log` VALUES ('21', '1', '1333', '1524134005');
INSERT INTO `jfy_channel_coupon_log` VALUES ('22', '1', '1333', '1524134081');
INSERT INTO `jfy_channel_coupon_log` VALUES ('23', '1', '1333', '1524134257');
INSERT INTO `jfy_channel_coupon_log` VALUES ('24', '1', '1333', '1524134281');
INSERT INTO `jfy_channel_coupon_log` VALUES ('25', '1', '1333', '1524134780');

-- ----------------------------
-- Table structure for `jfy_channel_login_data`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_login_data`;
CREATE TABLE `jfy_channel_login_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `times` int(11) NOT NULL COMMENT '登录次数',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_login_data
-- ----------------------------
INSERT INTO `jfy_channel_login_data` VALUES ('1', '144', '15737927799', '10', '1493367936');
INSERT INTO `jfy_channel_login_data` VALUES ('2', '153', '18201869634', '238', '1493370244');
INSERT INTO `jfy_channel_login_data` VALUES ('3', '92', '18272878105', '116', '1493363716');
INSERT INTO `jfy_channel_login_data` VALUES ('4', '47', '15737928808', '17', '1493366706');
INSERT INTO `jfy_channel_login_data` VALUES ('5', '173', '15512346578', '7', '1493367915');
INSERT INTO `jfy_channel_login_data` VALUES ('6', '138', '15737928899', '18', '1493367143');
INSERT INTO `jfy_channel_login_data` VALUES ('7', '56', '15737928782', '1', '1493367448');
INSERT INTO `jfy_channel_login_data` VALUES ('8', '65', '15536985212', '5', '1493367922');
INSERT INTO `jfy_channel_login_data` VALUES ('9', '21', '15516517307', '234', '1493707192');
INSERT INTO `jfy_channel_login_data` VALUES ('10', '174', '17512345678', '3', '1493715327');
INSERT INTO `jfy_channel_login_data` VALUES ('11', '175', '15712345678', '11', '1493717517');
INSERT INTO `jfy_channel_login_data` VALUES ('12', '25', '15516517306', '70', '1493718870');
INSERT INTO `jfy_channel_login_data` VALUES ('13', '27', '18521722857', '3', '1493727248');
INSERT INTO `jfy_channel_login_data` VALUES ('14', '93', '18521722888', '2', '1493727333');
INSERT INTO `jfy_channel_login_data` VALUES ('15', '167', '18812345678', '3', '1493775544');
INSERT INTO `jfy_channel_login_data` VALUES ('16', '161', '17612345678', '29', '1493879295');
INSERT INTO `jfy_channel_login_data` VALUES ('17', '154', '13312345678', '178', '1493880080');
INSERT INTO `jfy_channel_login_data` VALUES ('18', '55', '15737928816', '1', '1493893864');
INSERT INTO `jfy_channel_login_data` VALUES ('19', '145', '15737929977', '7', '1493952244');
INSERT INTO `jfy_channel_login_data` VALUES ('20', '116', '15737928809', '5', '1494208968');
INSERT INTO `jfy_channel_login_data` VALUES ('21', '38', '13917771100', '6', '1494214830');
INSERT INTO `jfy_channel_login_data` VALUES ('22', '84', '18818223461', '3', '1494215796');
INSERT INTO `jfy_channel_login_data` VALUES ('23', '78', '18272878100', '4', '1494313366');
INSERT INTO `jfy_channel_login_data` VALUES ('24', '177', '15516517317', '3', '1494835784');
INSERT INTO `jfy_channel_login_data` VALUES ('25', '179', '15516517311', '1', '1494836040');
INSERT INTO `jfy_channel_login_data` VALUES ('26', '158', '15512345678', '4', '1495164231');
INSERT INTO `jfy_channel_login_data` VALUES ('27', '94', '18722761560', '14', '1497510827');
INSERT INTO `jfy_channel_login_data` VALUES ('28', '195', '18272878107', '2', '1507622871');
INSERT INTO `jfy_channel_login_data` VALUES ('29', '196', '15812345678', '1', '1510218827');
INSERT INTO `jfy_channel_login_data` VALUES ('30', '169', '15612346578', '6', '1510370745');
INSERT INTO `jfy_channel_login_data` VALUES ('31', '197', '18272878109', '4', '1510645009');
INSERT INTO `jfy_channel_login_data` VALUES ('32', '160', '17712345678', '2', '1510738258');
INSERT INTO `jfy_channel_login_data` VALUES ('33', '172', '18612346578', '2', '1510824149');
INSERT INTO `jfy_channel_login_data` VALUES ('34', '163', '17712345677', '1', '1511167483');
INSERT INTO `jfy_channel_login_data` VALUES ('35', '203', '18817800000', '171', '1512443716');
INSERT INTO `jfy_channel_login_data` VALUES ('36', '205', '17611110000', '2', '1512467225');
INSERT INTO `jfy_channel_login_data` VALUES ('37', '215', '18817700000', '23', '1513048744');
INSERT INTO `jfy_channel_login_data` VALUES ('38', '216', '17811110000', '17', '1513051800');
INSERT INTO `jfy_channel_login_data` VALUES ('39', '219', '17811114444', '1', '1513070983');
INSERT INTO `jfy_channel_login_data` VALUES ('40', '218', '17811113333', '33', '1513071322');
INSERT INTO `jfy_channel_login_data` VALUES ('41', '217', '17811112222', '1', '1513072357');
INSERT INTO `jfy_channel_login_data` VALUES ('42', '251', '13671742189', '4', '1513080997');
INSERT INTO `jfy_channel_login_data` VALUES ('43', '253', '18721235580', '1', '1513239459');
INSERT INTO `jfy_channel_login_data` VALUES ('44', '256', '18721235581', '2', '1513239536');
INSERT INTO `jfy_channel_login_data` VALUES ('45', '263', '15516517000', '2', '1513761419');
INSERT INTO `jfy_channel_login_data` VALUES ('46', '5', '15516517307', '13', null);

-- ----------------------------
-- Table structure for `jfy_channel_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_login_log`;
CREATE TABLE `jfy_channel_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1282 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_login_log
-- ----------------------------
INSERT INTO `jfy_channel_login_log` VALUES ('1', '144', '15737927799', '', '1493358832', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('2', '153', '18201869634', '', '1493360530', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('3', '92', '18272878105', '', '1493363716', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('4', '47', '15737928808', '', '1493364889', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('5', '144', '15737927799', '', '1493365675', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('6', '173', '15512346578', '', '1493366098', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('7', '173', '15512346578', '', '1493366497', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('8', '47', '15737928808', '', '1493366706', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('9', '173', '15512346578', '', '1493367016', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('10', '138', '15737928899', '', '1493367143', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('11', '144', '15737927799', '', '1493367236', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('12', '56', '15737928782', '', '1493367448', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('13', '65', '15536985212', '', '1493367511', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('14', '144', '15737927799', '', '1493367622', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('15', '173', '15512346578', '', '1493367648', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('16', '65', '15536985212', '', '1493367712', '127.0.0.1');
INSERT INTO `jfy_channel_login_log` VALUES ('17', '65', '15536985212', '', '1493367790', '127.0.0.1');
INSERT INTO `jfy_channel_login_log` VALUES ('18', '65', '15536985212', '', '1493367818', '127.0.0.1');
INSERT INTO `jfy_channel_login_log` VALUES ('19', '173', '15512346578', '', '1493367852', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('20', '173', '15512346578', '', '1493367915', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('21', '65', '15536985212', '', '1493367922', '127.0.0.1');
INSERT INTO `jfy_channel_login_log` VALUES ('22', '144', '15737927799', '', '1493367936', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('23', '153', '18201869634', '', '1493370244', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('24', '144', '15737927799', '', '1493370708', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('25', '153', '18201869634', '', '1493690692', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('26', '47', '15737928808', '', '1493691000', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('27', '92', '18272878105', '', '1493691505', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('28', '92', '18272878105', '', '1493691528', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('29', '153', '18201869634', '', '1493691928', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('30', '21', '15516517307', '', '1493707192', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('31', '92', '18272878105', '', '1493714452', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('32', '92', '18272878105', '', '1493714477', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('33', '92', '18272878105', '', '1493714505', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('34', '92', '18272878105', '', '1493714693', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('35', '174', '17512345678', '', '1493715327', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('36', '174', '17512345678', '', '1493715347', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('37', '174', '17512345678', '', '1493715485', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('38', '175', '15712345678', '', '1493717517', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('39', '92', '18272878105', '', '1493718206', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('40', '175', '15712345678', '', '1493718522', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('41', '175', '15712345678', '', '1493718549', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('42', '25', '15516517306', '', '1493718870', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('43', '25', '15516517306', '', '1493718874', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('44', '25', '15516517306', '', '1493718887', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('45', '25', '15516517306', '', '1493718901', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('46', '153', '18201869634', '', '1493718908', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('47', '47', '15737928808', '', '1493718938', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('48', '21', '15516517307', '', '1493718970', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('49', '21', '15516517307', '', '1493718970', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('50', '21', '15516517307', '', '1493719011', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('51', '47', '15737928808', '', '1493719054', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('52', '25', '15516517306', '', '1493719060', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('53', '25', '15516517306', '', '1493719081', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('54', '138', '15737928899', '', '1493719101', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('55', '138', '15737928899', '', '1493719128', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('56', '175', '15712345678', '', '1493719644', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('57', '175', '15712345678', '', '1493719695', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('58', '175', '15712345678', '', '1493719742', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('59', '175', '15712345678', '15712345678', '1493720356', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('60', '175', '15712345678', '15712345678', '1493720384', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('61', '92', '18272878105', 'chenM', '1493721180', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('62', '27', '18521722857', '', '1493727248', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('63', '93', '18521722888', 'admin', '1493727333', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('64', '153', '18201869634', 'chenM6', '1493728294', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('65', '167', '18812345678', 'test(4/24)', '1493775544', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('66', '153', '18201869634', 'chenM6', '1493775669', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('67', '138', '15737928899', '138企业', '1493775691', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('68', '21', '15516517307', '', '1493776139', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('69', '21', '15516517307', '', '1493776537', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('70', '21', '15516517307', '', '1493783437', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('71', '21', '15516517307', '', '1493783802', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('72', '93', '18521722888', 'admin', '1493797907', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('73', '25', '15516517306', '张飞', '1493800426', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('74', '21', '15516517307', '', '1493801820', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('75', '153', '18201869634', 'chenM6', '1493868334', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('76', '153', '18201869634', 'chenM6', '1493869720', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('77', '161', '17612345678', '', '1493879295', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('78', '154', '13312345678', 'test-通用版', '1493880080', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('79', '153', '18201869634', 'chenM6', '1493882148', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('80', '153', '18201869634', 'chenM6', '1493882274', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('81', '154', '13312345678', 'test-通用版', '1493882346', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('82', '154', '13312345678', 'test-通用版', '1493892744', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('83', '154', '13312345678', 'test-通用版', '1493892812', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('84', '154', '13312345678', 'test-通用版', '1493892816', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('85', '154', '13312345678', 'test-通用版', '1493892823', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('86', '154', '13312345678', 'test-通用版', '1493892860', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('87', '21', '15516517307', '', '1493892905', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('88', '154', '13312345678', 'test-通用版', '1493892963', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('89', '21', '15516517307', '', '1493892963', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('90', '21', '15516517307', '', '1493892980', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('91', '47', '15737928808', '信通社123111', '1493893772', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('92', '55', '15737928816', '', '1493893864', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('93', '47', '15737928808', '信通社123111', '1493893988', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('94', '21', '15516517307', '', '1493950508', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('95', '92', '18272878105', 'chenM', '1493950884', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('96', '21', '15516517307', '', '1493951114', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('97', '21', '15516517307', '', '1493951142', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('98', '21', '15516517307', '', '1493951499', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('99', '145', '15737929977', '自由-分', '1493952244', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('100', '92', '18272878105', 'chenM', '1493968867', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('101', '21', '15516517307', '', '1494208139', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('102', '21', '15516517307', '', '1494208416', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('103', '92', '18272878105', 'chenM', '1494208858', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('104', '116', '15737928809', 'zhouzhou', '1494208968', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('105', '21', '15516517307', '', '1494209119', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('106', '21', '15516517307', '', '1494209993', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('107', '21', '15516517307', '', '1494210731', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('108', '92', '18272878105', 'chenM', '1494212751', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('109', '92', '18272878105', 'chenM', '1494213224', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('110', '21', '15516517307', '', '1494213514', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('111', '92', '18272878105', 'chenM', '1494213844', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('112', '21', '15516517307', '', '1494214528', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('113', '153', '18201869634', 'chenM6', '1494214571', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('114', '92', '18272878105', 'chenM', '1494214582', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('115', '153', '18201869634', 'chenM6', '1494214589', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('116', '153', '18201869634', 'chenM6', '1494214595', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('117', '154', '13312345678', 'test-通用版', '1494214636', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('118', '21', '15516517307', '', '1494214648', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('119', '154', '13312345678', 'test-通用版', '1494214706', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('120', '153', '18201869634', 'chenM6', '1494214712', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('121', '21', '15516517307', '', '1494214784', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('122', '38', '13917771100', '泰山', '1494214830', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('123', '153', '18201869634', 'chenM6', '1494214850', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('124', '21', '15516517307', '', '1494214912', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('125', '153', '18201869634', 'chenM6', '1494214945', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('126', '21', '15516517307', '', '1494215056', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('127', '153', '18201869634', 'chenM6', '1494215216', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('128', '153', '18201869634', 'chenM6', '1494215270', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('129', '47', '15737928808', '信通社123111', '1494215547', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('130', '21', '15516517307', '', '1494215506', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('131', '47', '15737928808', '信通社123111', '1494215574', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('132', '154', '13312345678', 'test-通用版', '1494215704', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('133', '21', '15516517307', '', '1494215690', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('134', '84', '18818223461', '', '1494215796', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('135', '153', '18201869634', 'chenM6', '1494216031', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('136', '47', '15737928808', '信通社123111', '1494216058', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('137', '84', '18818223461', '', '1494216086', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('138', '21', '15516517307', '', '1494216109', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('139', '154', '13312345678', 'test-通用版', '1494216191', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('140', '153', '18201869634', 'chenM6', '1494216200', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('141', '92', '18272878105', 'chenM', '1494217473', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('142', '92', '18272878105', 'chenM', '1494217528', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('143', '92', '18272878105', 'chenM', '1494217952', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('144', '21', '15516517307', '', '1494224165', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('145', '116', '15737928809', 'zhouzhou', '1494225946', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('146', '92', '18272878105', 'chenM', '1494228666', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('147', '92', '18272878105', 'chenM', '1494238765', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('148', '92', '18272878105', 'chenM', '1494239135', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('149', '27', '18521722857', '', '1494239364', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('150', '145', '15737929977', '自由-分', '1494239402', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('151', '153', '18201869634', 'chenM6', '1494239636', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('152', '21', '15516517307', '', '1494248048', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('153', '21', '15516517307', '', '1494248051', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('154', '21', '15516517307', '', '1494248064', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('155', '21', '15516517307', '', '1494248375', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('156', '92', '18272878105', 'chenM', '1494293749', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('157', '21', '15516517307', '', '1494295425', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('158', '145', '15737929977', '自由-分', '1494296170', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('159', '92', '18272878105', 'chenM', '1494301387', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('160', '153', '18201869634', 'chenM6', '1494301396', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('161', '153', '18201869634', 'chenM6', '1494310461', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('162', '153', '18201869634', 'chenM6', '1494310598', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('163', '138', '15737928899', '138企业', '1494311520', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('164', '92', '18272878105', 'chenM', '1494313014', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('165', '153', '18201869634', 'chenM6', '1494313109', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('166', '116', '15737928809', 'zhouzhou', '1494313202', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('167', '153', '18201869634', 'chenM6', '1494313257', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('168', '153', '18201869634', 'chenM6', '1494313334', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('169', '47', '15737928808', '信通社123111', '1494313354', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('170', '78', '18272878100', '', '1494313366', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('171', '153', '18201869634', 'chenM6', '1494313404', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('172', '78', '18272878100', '', '1494313451', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('173', '161', '17612345678', '', '1494313490', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('174', '161', '17612345678', '', '1494313545', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('175', '161', '17612345678', '', '1494313604', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('176', '153', '18201869634', 'chenM6', '1494313628', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('177', '161', '17612345678', '', '1494313688', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('178', '92', '18272878105', 'chenM', '1494314177', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('179', '153', '18201869634', 'chenM6', '1494314316', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('180', '25', '15516517306', '张飞', '1494315040', '192.168.199.25');
INSERT INTO `jfy_channel_login_log` VALUES ('181', '21', '15516517307', '', '1494317660', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('182', '21', '15516517307', '', '1494317699', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('183', '21', '15516517307', '', '1494317709', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('184', '21', '15516517307', '', '1494317782', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('185', '21', '15516517307', '', '1494317800', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('186', '153', '18201869634', 'chenM6', '1494319877', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('187', '154', '13312345678', 'test-通用版', '1494320335', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('188', '153', '18201869634', 'chenM6', '1494322027', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('189', '153', '18201869634', 'chenM6', '1494323198', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('190', '116', '15737928809', 'zhouzhou', '1494323241', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('191', '116', '15737928809', 'zhouzhou', '1494323254', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('192', '154', '13312345678', 'test-通用版', '1494323281', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('193', '153', '18201869634', 'chenM6', '1494325775', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('194', '25', '15516517306', '张飞', '1494400325', '192.168.199.25');
INSERT INTO `jfy_channel_login_log` VALUES ('195', '92', '18272878105', 'chenM', '1494401138', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('196', '161', '17612345678', '', '1494404517', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('197', '154', '13312345678', 'test-通用版', '1494404527', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('198', '92', '18272878105', 'chenM', '1494467851', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('199', '92', '18272878105', 'chenM', '1494467867', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('200', '154', '13312345678', 'test-通用版', '1494467906', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('201', '153', '18201869634', 'chenM6', '1494467958', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('202', '153', '18201869634', 'chenM6', '1494467977', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('203', '153', '18201869634', 'chenM6', '1494468668', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('204', '92', '18272878105', 'chenM', '1494468730', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('205', '92', '18272878105', 'chenM', '1494469237', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('206', '92', '18272878105', 'chenM', '1494469279', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('207', '153', '18201869634', 'chenM6', '1494469502', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('208', '161', '17612345678', '', '1494469581', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('209', '161', '17612345678', '', '1494469589', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('210', '154', '13312345678', 'test-通用版', '1494469659', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('211', '92', '18272878105', 'chenM', '1494473947', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('212', '145', '15737929977', '自由-分', '1494474374', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('213', '92', '18272878105', 'chenM', '1494476466', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('214', '153', '18201869634', 'chenM6', '1494485697', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('215', '153', '18201869634', 'chenM6', '1494485761', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('216', '47', '15737928808', '信通社123111', '1494485776', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('217', '153', '18201869634', 'chenM6', '1494485876', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('218', '153', '18201869634', 'chenM6', '1494485905', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('219', '154', '13312345678', 'test-通用版', '1494485938', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('220', '153', '18201869634', 'chenM6', '1494485955', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('221', '154', '13312345678', 'test-通用版', '1494486031', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('222', '153', '18201869634', 'chenM6', '1494486058', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('223', '161', '17612345678', '', '1494486272', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('224', '25', '15516517306', '张飞', '1494487165', '192.168.199.25');
INSERT INTO `jfy_channel_login_log` VALUES ('225', '154', '13312345678', 'test-通用版', '1494487375', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('226', '154', '13312345678', 'test-通用版', '1494490641', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('227', '92', '18272878105', 'chenM', '1494496258', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('228', '92', '18272878105', 'chenM', '1494496282', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('229', '92', '18272878105', 'chenM', '1494498401', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('230', '92', '18272878105', 'chenM', '1494498460', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('231', '153', '18201869634', 'chenM6', '1494554815', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('232', '154', '13312345678', 'test-通用版', '1494555317', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('233', '154', '13312345678', 'test-通用版', '1494574997', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('234', '21', '15516517307', '', '1494582414', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('235', '21', '15516517307', '', '1494582599', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('236', '21', '15516517307', '', '1494814208', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('237', '21', '15516517307', '', '1494814243', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('238', '21', '15516517307', '', '1494814281', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('239', '92', '18272878105', 'chenM', '1494825960', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('240', '92', '18272878105', 'chenM', '1494827367', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('241', '92', '18272878105', 'chenM', '1494827634', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('242', '92', '18272878105', 'chenM', '1494827673', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('243', '154', '13312345678', 'test-通用版', '1494829750', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('244', '144', '15737927799', '周凯-分', '1494829943', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('245', '177', '15516517317', '张伟', '1494835784', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('246', '177', '15516517317', '张伟', '1494835797', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('247', '177', '15516517317', '张伟', '1494835808', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('248', '21', '15516517307', '', '1494835892', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('249', '179', '15516517311', '张伟', '1494836040', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('250', '153', '18201869634', 'chenM6', '1494838446', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('251', '21', '15516517307', '', '1494843398', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('252', '138', '15737928899', '138企业', '1494843539', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('253', '21', '15516517307', '', '1494843439', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('254', '21', '15516517307', '', '1494843445', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('255', '138', '15737928899', '138企业', '1494843625', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('256', '144', '15737927799', '周凯-分', '1494843667', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('257', '145', '15737929977', '自由-分', '1494844051', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('258', '138', '15737928899', '138企业', '1494844764', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('259', '92', '18272878105', 'chenM', '1494908432', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('260', '92', '18272878105', 'chenM', '1494908795', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('261', '92', '18272878105', 'chenM', '1494908862', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('262', '154', '13312345678', 'test-通用版', '1494917154', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('263', '153', '18201869634', 'chenM6', '1494917766', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('264', '21', '15516517307', '', '1494923157', '192.168.199.25');
INSERT INTO `jfy_channel_login_log` VALUES ('265', '21', '15516517307', '', '1494923245', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('266', '21', '15516517307', '', '1494923320', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('267', '21', '15516517307', '', '1494923486', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('268', '21', '15516517307', '', '1494923490', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('269', '92', '18272878105', 'chenM', '1494926149', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('270', '92', '18272878105', 'chenM', '1494926157', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('271', '92', '18272878105', 'chenM', '1494926174', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('272', '153', '18201869634', 'chenM6', '1494927026', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('273', '47', '15737928808', '信通社123111', '1494927668', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('274', '153', '18201869634', 'chenM6', '1494938367', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('275', '21', '15516517307', '', '1494938811', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('276', '154', '13312345678', 'test-通用版', '1494986903', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('277', '154', '13312345678', 'test-通用版', '1494988427', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('278', '92', '18272878105', 'chenM', '1494991686', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('279', '153', '18201869634', 'chenM6', '1494991938', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('280', '92', '18272878105', 'chenM', '1494992894', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('281', '21', '15516517307', '', '1494994029', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('282', '21', '15516517307', '', '1494994120', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('283', '154', '13312345678', 'test-通用版', '1495005898', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('284', '153', '18201869634', 'chenM6', '1495008245', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('285', '38', '13917771100', '泰山', '1495009269', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('286', '21', '15516517307', '', '1495009337', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('287', '21', '15516517307', '', '1495012390', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('288', '38', '13917771100', '泰山', '1495012881', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('289', '38', '13917771100', '泰山', '1495014435', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('290', '154', '13312345678', 'test-通用版', '1495016563', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('291', '154', '13312345678', 'test-通用版', '1495016714', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('292', '21', '15516517307', '', '1495016841', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('293', '21', '15516517307', '', '1495016854', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('294', '21', '15516517307', '', '1495016791', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('295', '92', '18272878105', 'chenM', '1495017048', '192.168.199.145');
INSERT INTO `jfy_channel_login_log` VALUES ('296', '153', '18201869634', 'chenM6', '1495072912', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('297', '153', '18201869634', 'chenM6', '1495075914', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('298', '154', '13312345678', 'test-通用版', '1495075921', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('299', '47', '15737928808', '信通社123111', '1495076263', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('300', '153', '18201869634', 'chenM6', '1495088270', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('301', '154', '13312345678', 'test-通用版', '1495162964', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('302', '21', '15516517307', '', '1495164140', '192.168.199.190');
INSERT INTO `jfy_channel_login_log` VALUES ('303', '158', '15512345678', 'chen', '1495164231', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('304', '47', '15737928808', '信通社123111', '1495164284', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('305', '92', '18272878105', 'chenM', '1495167065', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('306', '175', '15712345678', '15712345678', '1495167116', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('307', '92', '18272878105', 'chenM', '1495167153', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('308', '78', '18272878100', '', '1495167245', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('309', '21', '15516517307', '', '1495167268', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('310', '21', '15516517307', '', '1495176089', '192.168.199.190');
INSERT INTO `jfy_channel_login_log` VALUES ('311', '21', '15516517307', '', '1495176626', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('312', '21', '15516517307', '', '1495418866', '192.168.199.190');
INSERT INTO `jfy_channel_login_log` VALUES ('313', '92', '18272878105', 'chenM', '1495424654', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('314', '153', '18201869634', 'chenM6', '1495436787', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('315', '21', '15516517307', '', '1495436927', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('316', '153', '18201869634', 'chenM6', '1495436955', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('317', '21', '15516517307', '', '1495437062', '192.168.199.190');
INSERT INTO `jfy_channel_login_log` VALUES ('318', '154', '13312345678', 'test-通用版', '1495440690', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('319', '92', '18272878105', 'chenM', '1495505085', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('320', '21', '15516517307', '', '1495505064', '192.168.199.190');
INSERT INTO `jfy_channel_login_log` VALUES ('321', '92', '18272878105', 'chenM', '1495505144', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('322', '92', '18272878105', 'chenM', '1495506797', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('323', '153', '18201869634', 'chenM6', '1495507155', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('324', '154', '13312345678', 'test-通用版', '1495508415', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('325', '153', '18201869634', 'chenM61', '1495510693', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('326', '154', '13312345678', 'test-通用版', '1495522062', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('327', '154', '13312345678', 'test-通用版', '1495524010', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('328', '154', '13312345678', 'test-通用版', '1495530369', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('329', '21', '15516517307', '', '1495530558', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('330', '154', '13312345678', 'test-通用版', '1495591535', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('331', '21', '15516517307', '', '1495592279', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('332', '92', '18272878105', 'chenM', '1495592580', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('333', '153', '18201869634', 'chenM61', '1495592589', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('334', '153', '18201869634', 'chenM61', '1495597387', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('335', '92', '18272878105', 'chenM', '1495601746', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('336', '154', '13312345678', 'test-通用版', '1495605504', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('337', '21', '15516517307', '', '1495605585', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('338', '21', '15516517307', '', '1495606084', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('339', '153', '18201869634', 'chenM61', '1495606467', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('340', '154', '13312345678', 'test-通用版', '1495606766', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('341', '154', '13312345678', 'test-通用版', '1495606931', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('342', '21', '15516517307', '', '1495607047', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('343', '154', '13312345678', 'test-通用版', '1495607536', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('344', '21', '15516517307', '', '1495607892', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('345', '153', '18201869634', 'chenM61', '1495607923', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('346', '21', '15516517307', '', '1495608049', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('347', '21', '15516517307', '', '1495608070', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('348', '154', '13312345678', 'test-通用版', '1495612555', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('349', '92', '18272878105', 'chenM', '1495613296', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('350', '153', '18201869634', 'chenM61', '1495613527', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('351', '154', '13312345678', 'test-通用版', '1495614446', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('352', '92', '18272878105', 'chenM', '1495618448', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('353', '153', '18201869634', 'chenM61', '1495618511', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('354', '153', '18201869634', 'chenM61', '1495618866', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('355', '21', '15516517307', '', '1495618932', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('356', '21', '15516517307', '', '1495678854', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('357', '153', '18201869634', 'chenM61', '1495680394', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('358', '92', '18272878105', 'chenM', '1495680691', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('359', '153', '18201869634', 'chenM61', '1495684583', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('360', '153', '18201869634', 'chenM61', '1495684918', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('361', '153', '18201869634', 'chenM61', '1495691448', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('362', '21', '15516517307', '', '1495692015', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('363', '154', '13312345678', 'test-通用版', '1495693467', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('364', '21', '15516517307', '', '1495695387', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('365', '21', '15516517307', '', '1495696004', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('366', '153', '18201869634', 'chenM61', '1495762297', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('367', '153', '18201869634', 'chenM61', '1495763202', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('368', '92', '18272878105', 'chenM', '1495763239', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('369', '161', '17612345678', '', '1495763249', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('370', '38', '13917771100', '泰山', '1495763260', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('371', '21', '15516517307', '', '1495782529', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('372', '154', '13312345678', 'test-通用版', '1495785907', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('373', '92', '18272878105', 'chenM', '1495789136', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('374', '92', '18272878105', 'chenM', '1495791371', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('375', '153', '18201869634', 'chenM61', '1495851345', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('376', '153', '18201869634', 'chenM61', '1495859730', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('377', '153', '18201869634', 'chenM61', '1495860628', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('378', '153', '18201869634', 'chenM61', '1495860641', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('379', '153', '18201869634', 'chenM61', '1495861432', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('380', '153', '18201869634', 'chenM61', '1495867646', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('381', '21', '15516517307', '', '1495867669', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('382', '27', '18521722857', '', '1495867726', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('383', '154', '13312345678', 'test-通用版', '1495867765', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('384', '21', '15516517307', '', '1495867803', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('385', '154', '13312345678', 'test-通用版', '1495867847', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('386', '21', '15516517307', '', '1495867879', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('387', '153', '18201869634', 'chenM61', '1495868155', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('388', '21', '15516517307', '', '1495869372', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('389', '153', '18201869634', 'chenM61', '1495869802', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('390', '154', '13312345678', 'test-通用版', '1495870597', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('391', '21', '15516517307', '', '1496195162', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('392', '153', '18201869634', 'chenM61', '1496199358', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('393', '154', '13312345678', 'test-通用版', '1496200925', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('394', '92', '18272878105', 'chenM', '1496203416', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('395', '153', '18201869634', 'chenM61', '1496203515', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('396', '153', '18201869634', 'chenM61', '1496214411', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('397', '154', '13312345678', 'test-通用版', '1496215723', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('398', '21', '15516517307', '', '1496281814', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('399', '92', '18272878105', 'chenM', '1496284196', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('400', '21', '15516517307', '', '1496299004', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('401', '21', '15516517307', '', '1496299128', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('402', '25', '15516517306', '张飞', '1496299337', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('403', '154', '13312345678', 'test-通用版', '1496307021', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('404', '92', '18272878105', 'chenM', '1496370976', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('405', '153', '18201869634', 'chenM61', '1496386203', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('406', '21', '15516517307', '', '1496389427', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('407', '25', '15516517306', '张飞', '1496534031', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('408', '25', '15516517306', '张飞', '1496626518', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('409', '92', '18272878105', 'chenM', '1496628321', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('410', '21', '15516517307', '', '1496628447', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('411', '153', '18201869634', 'chenM61', '1496628688', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('412', '154', '13312345678', 'test-通用版', '1496629430', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('413', '154', '13312345678', 'test-通用版', '1496632178', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('414', '21', '15516517307', '', '1496633565', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('415', '153', '18201869634', 'chenM61', '1496633590', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('416', '21', '15516517307', '', '1496634174', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('417', '92', '18272878105', 'chenM', '1496648782', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('418', '138', '15737928899', '138企业', '1496649014', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('419', '92', '18272878105', 'chenM', '1496649111', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('420', '138', '15737928899', '138企业', '1496649159', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('421', '92', '18272878105', 'chenM', '1496649093', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('422', '25', '15516517306', '张飞', '1496713428', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('423', '92', '18272878105', 'chenM', '1496716600', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('424', '92', '18272878105', 'chenM', '1496717963', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('425', '154', '13312345678', 'test-通用版', '1496728525', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('426', '21', '15516517307', '', '1496740494', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('427', '25', '15516517306', '张飞', '1496800267', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('428', '92', '18272878105', 'chenM', '1496801542', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('429', '154', '13312345678', 'test-通用版', '1496815494', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('430', '153', '18201869634', 'chenM61', '1496816071', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('431', '92', '18272878105', 'chenM', '1496816398', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('432', '153', '18201869634', 'chenM61', '1496816406', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('433', '154', '13312345678', 'test-通用版', '1496816431', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('434', '153', '18201869634', 'chenM61', '1496816469', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('435', '138', '15737928899', '138企业', '1496818301', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('436', '154', '13312345678', 'test-通用版', '1496825452', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('437', '21', '15516517307', '', '1496828121', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('438', '92', '18272878105', 'chenM', '1496886395', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('439', '92', '18272878105', 'chenM', '1496891379', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('440', '153', '18201869634', 'chenM61', '1496892824', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('441', '153', '18201869634', 'chenM61', '1496892911', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('442', '153', '18201869634', 'chenM61', '1496892973', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('443', '153', '18201869634', 'chenM61', '1496893216', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('444', '153', '18201869634', 'chenM61', '1496893497', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('445', '153', '18201869634', 'chenM61', '1496893677', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('446', '21', '15516517307', '', '1496907999', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('447', '154', '13312345678', 'test-通用版', '1496912630', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('448', '92', '18272878105', 'chenM', '1496917513', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('449', '92', '18272878105', 'chenM', '1496918022', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('450', '92', '18272878105', 'chenM', '1496972767', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('451', '153', '18201869634', 'chenM61', '1496973790', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('452', '21', '15516517307', '', '1496990543', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('453', '138', '15737928899', '138企业', '1496990563', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('454', '154', '13312345678', 'test-通用版', '1496990725', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('455', '21', '15516517307', '', '1496990713', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('456', '138', '15737928899', '138企业', '1496991035', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('457', '153', '18201869634', 'chenM61', '1496993223', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('458', '153', '18201869634', 'chenM61', '1496993795', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('459', '92', '18272878105', 'chenM', '1496995317', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('460', '153', '18201869634', 'chenM61', '1496995332', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('461', '154', '13312345678', 'test-通用版', '1496995814', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('462', '153', '18201869634', 'chenM61', '1496995823', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('463', '153', '18201869634', 'chenM61', '1496996596', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('464', '21', '15516517307', '', '1497233128', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('465', '154', '13312345678', 'test-通用版', '1497236263', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('466', '153', '18201869634', 'chenM61', '1497238991', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('467', '92', '18272878105', 'chenM', '1497252543', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('468', '154', '13312345678', 'test-通用版', '1497255400', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('469', '154', '13312345678', 'test-通用版', '1497255932', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('470', '161', '17612345678', '', '1497259462', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('471', '153', '18201869634', 'chenM61', '1497259471', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('472', '21', '15516517307', '', '1497259888', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('473', '153', '18201869634', 'chenM61', '1497260662', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('474', '92', '18272878105', 'chenM', '1497261724', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('475', '92', '18272878105', 'chenM', '1497262245', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('476', '153', '18201869634', 'chenM61', '1497262251', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('477', '47', '15737928808', '信通社123111', '1497262294', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('478', '153', '18201869634', 'chenM61', '1497262433', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('479', '21', '15516517307', '', '1497263319', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('480', '153', '18201869634', 'chenM61', '1497263507', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('481', '25', '15516517306', '张飞', '1497320200', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('482', '154', '13312345678', 'test-通用版', '1497325455', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('483', '153', '18201869634', 'chenM61', '1497334062', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('484', '21', '15516517307', '', '1497334845', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('485', '153', '18201869634', 'chenM61', '1497336643', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('486', '21', '15516517307', '', '1497342542', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('487', '92', '18272878105', 'chenM', '1497347086', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('488', '154', '13312345678', 'test-通用版', '1497348841', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('489', '21', '15516517307', '', '1497406432', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('490', '154', '13312345678', 'test-通用版', '1497411563', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('491', '25', '15516517306', '张飞', '1497423568', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('492', '154', '13312345678', 'test-通用版', '1497426248', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('493', '21', '15516517307', '', '1497426252', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('494', '154', '13312345678', 'test-通用版', '1497426412', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('495', '154', '13312345678', 'test-通用版', '1497434541', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('496', '145', '15737929977', '自由-分', '1497435276', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('497', '138', '15737928899', '138企业', '1497435312', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('498', '154', '13312345678', 'test-通用版', '1497435555', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('499', '25', '15516517306', '张飞', '1497436196', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('500', '154', '13312345678', 'test-通用版', '1497436208', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('501', '154', '13312345678', 'test-通用版', '1497436216', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('502', '161', '17612345678', '', '1497436223', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('503', '153', '18201869634', 'chenM61', '1497436232', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('504', '153', '18201869634', 'chenM61', '1497436246', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('505', '153', '18201869634', 'chenM61', '1497437179', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('506', '92', '18272878105', 'chenM', '1497439922', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('507', '153', '18201869634', 'chenM61', '1497497444', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('508', '154', '13312345678', 'test-通用版', '1497497494', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('509', '25', '15516517306', '张飞', '1497510225', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('510', '94', '18722761560', '夏小冬', '1497510827', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('511', '161', '17612345678', '', '1497514469', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('512', '21', '15516517307', '', '1497517485', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('513', '92', '18272878105', 'chenM', '1497521163', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('514', '92', '18272878105', 'chenM', '1497521255', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('515', '92', '18272878105', 'chenM', '1497521274', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('516', '154', '13312345678', 'test-通用版', '1497525958', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('517', '153', '18201869634', 'chenM61', '1497530636', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('518', '21', '15516517307', '', '1497533506', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('519', '153', '18201869634', 'chenM61', '1497603842', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('520', '153', '18201869634', 'chenM61', '1497839852', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('521', '154', '13312345678', 'test-通用版', '1497841690', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('522', '25', '15516517306', '张飞', '1497843115', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('523', '21', '15516517307', '', '1497843364', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('524', '154', '13312345678', 'test-通用版', '1497864627', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('525', '154', '13312345678', 'test-通用版', '1497924091', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('526', '153', '18201869634', 'chenM61', '1497924287', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('527', '21', '15516517307', '', '1497930473', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('528', '92', '18272878105', 'chenM', '1497930812', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('529', '138', '15737928899', '138企业', '1497931274', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('530', '94', '18722761560', '夏小冬', '1497939383', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('531', '25', '15516517306', '张飞', '1497939395', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('532', '92', '18272878105', 'chenM', '1497940220', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('533', '92', '18272878105', 'chenM', '1497940350', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('534', '92', '18272878105', 'chenM', '1497940440', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('535', '92', '18272878105', 'chenM', '1497940456', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('536', '92', '18272878105', 'chenM', '1497941196', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('537', '92', '18272878105', 'chenM', '1497941271', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('538', '92', '18272878105', 'chenM', '1497942389', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('539', '92', '18272878105', 'chenM', '1497943112', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('540', '94', '18722761560', '夏小冬', '1497943325', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('541', '25', '15516517306', '张飞', '1497943335', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('542', '144', '15737927799', '周凯-分', '1497943849', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('543', '145', '15737929977', '自由-分', '1497943886', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('544', '153', '18201869634', 'chenM61', '1498011948', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('545', '21', '15516517307', '', '1498027046', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('546', '25', '15516517306', '张飞', '1498034685', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('547', '25', '15516517306', '张飞', '1498034747', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('548', '153', '18201869634', 'chenM61', '1498098431', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('549', '154', '13312345678', 'test-通用版', '1498101247', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('550', '21', '15516517307', '', '1498114131', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('551', '21', '15516517307', '', '1498122104', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('552', '21', '15516517307', '', '1498122364', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('553', '25', '15516517306', '张飞', '1498125273', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('554', '25', '15516517306', '张飞', '1498126422', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('555', '92', '18272878105', 'chenM', '1498190433', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('556', '92', '18272878105', 'chenM', '1498190625', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('557', '92', '18272878105', 'chenM', '1498191002', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('558', '154', '13312345678', 'test-通用版', '1498198118', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('559', '153', '18201869634', 'chenM61', '1498204071', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('560', '21', '15516517307', '', '1498208800', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('561', '21', '15516517307', '', '1498211067', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('562', '21', '15516517307', '', '1498211110', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('563', '21', '15516517307', '', '1498442024', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('564', '154', '13312345678', 'test-通用版', '1498442591', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('565', '153', '18201869634', 'chenM61', '1498445611', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('566', '25', '15516517306', '张飞', '1498456928', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('567', '94', '18722761560', '夏小冬', '1498456970', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('568', '94', '18722761560', '夏小冬', '1498457011', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('569', '21', '15516517307', '', '1498457021', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('570', '21', '15516517307', '', '1498457041', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('571', '94', '18722761560', '夏小冬', '1498457160', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('572', '94', '18722761560', '夏小冬', '1498457177', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('573', '94', '18722761560', '夏小冬', '1498457184', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('574', '94', '18722761560', '夏小冬', '1498457195', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('575', '94', '18722761560', '夏小冬', '1498457200', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('576', '94', '18722761560', '夏小冬', '1498457205', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('577', '94', '18722761560', '夏小冬', '1498457209', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('578', '94', '18722761560', '夏小冬', '1498457219', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('579', '94', '18722761560', '夏小冬', '1498457241', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('580', '25', '15516517306', '张飞', '1498457248', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('581', '25', '15516517306', '张飞', '1498468128', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('582', '25', '15516517306', '张飞', '1498471235', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('583', '25', '15516517306', '张飞', '1498472699', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('584', '154', '13312345678', 'test-通用版', '1498530780', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('585', '153', '18201869634', 'chenM61', '1498535597', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('586', '21', '15516517307', '', '1498544172', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('587', '21', '15516517307', '', '1498547830', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('588', '21', '15516517307', '', '1498548280', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('589', '21', '15516517307', '', '1498616566', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('590', '154', '13312345678', 'test-通用版', '1498617362', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('591', '153', '18201869634', 'chenM61', '1498622131', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('592', '154', '13312345678', 'test-通用版', '1498639692', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('593', '154', '13312345678', 'test-通用版', '1498642972', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('594', '154', '13312345678', 'test-通用版', '1498700521', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('595', '153', '18201869634', 'chenM61', '1498701130', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('596', '25', '15516517306', '张飞', '1498702524', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('597', '25', '15516517306', '张飞', '1498702740', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('598', '21', '15516517307', '', '1498702992', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('599', '154', '13312345678', 'test-通用版', '1498703701', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('600', '21', '15516517307', '', '1498704774', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('601', '153', '18201869634', 'chenM61', '1498706129', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('602', '154', '13312345678', 'test-通用版', '1498731106', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('603', '21', '15516517307', '', '1498791177', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('604', '153', '18201869634', 'chenM61', '1498793368', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('605', '92', '18272878105', 'chenM', '1498793875', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('606', '25', '15516517306', '张飞', '1498806522', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('607', '21', '15516517307', '', '1499046822', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('608', '153', '18201869634', 'chenM61', '1499047138', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('609', '154', '13312345678', 'test-通用版', '1499047791', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('610', '25', '15516517306', '张飞', '1499070402', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('611', '25', '15516517306', '张飞', '1499070426', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('612', '21', '15516517307', '', '1499070650', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('613', '25', '15516517306', '张飞', '1499070743', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('614', '21', '15516517307', '', '1499071042', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('615', '138', '15737928899', '138企业', '1499074772', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('616', '144', '15737927799', '周凯-分', '1499075730', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('617', '154', '13312345678', 'test-通用版', '1499076756', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('618', '153', '18201869634', 'chenM61', '1499134385', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('619', '21', '15516517307', '', '1499162078', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('620', '154', '13312345678', 'test-通用版', '1499164227', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('621', '153', '18201869634', 'chenM61', '1499221437', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('622', '92', '18272878105', 'chenM', '1499248841', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('623', '153', '18201869634', 'chenM61', '1499248850', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('624', '21', '15516517307', '', '1499248961', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('625', '21', '15516517307', '', '1499249037', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('626', '153', '18201869634', 'chenM61', '1499249535', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('627', '153', '18201869634', 'chenM61', '1499306458', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('628', '154', '13312345678', 'test-通用版', '1499307353', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('629', '154', '13312345678', 'test-通用版', '1499330546', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('630', '154', '13312345678', 'test-通用版', '1499334498', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('631', '21', '15516517307', '', '1499393131', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('632', '153', '18201869634', 'chenM61', '1499394653', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('633', '154', '13312345678', 'test-通用版', '1499422383', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('634', '153', '18201869634', 'chenM61', '1499653106', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('635', '21', '15516517307', '', '1499654805', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('636', '154', '13312345678', 'test-通用版', '1499659321', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('637', '21', '15516517307', '', '1499680114', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('638', '92', '18272878105', 'chenM', '1499742369', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('639', '154', '13312345678', 'test-通用版', '1499826080', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('640', '153', '18201869634', 'chenM61', '1499840311', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('641', '153', '18201869634', 'chenM61', '1499841082', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('642', '25', '15516517306', '张飞', '1499841424', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('643', '25', '15516517306', '张飞', '1499841473', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('644', '25', '15516517306', '张飞', '1499841575', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('645', '25', '15516517306', '张飞', '1499843150', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('646', '25', '15516517306', '张飞', '1499845073', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('647', '154', '13312345678', 'test-通用版', '1499845005', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('648', '154', '13312345678', 'test-通用版', '1499845009', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('649', '21', '15516517307', '', '1499911120', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('650', '153', '18201869634', 'chenM61', '1499927633', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('651', '25', '15516517306', '张飞', '1499932816', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('652', '21', '15516517307', '', '1499999619', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('653', '153', '18201869634', 'chenM61', '1500015426', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('654', '154', '13312345678', 'test-通用版', '1500017531', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('655', '25', '15516517306', '张飞', '1500020238', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('656', '153', '18201869634', 'chenM61', '1500256682', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('657', '154', '13312345678', 'test-通用版', '1500257894', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('658', '25', '15516517306', '张飞', '1500259436', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('659', '21', '15516517307', '', '1500271898', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('660', '25', '15516517306', '张飞', '1500280182', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('661', '153', '18201869634', 'chenM61', '1500344005', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('662', '154', '13312345678', 'test-通用版', '1500344332', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('663', '25', '15516517306', '张飞', '1500344641', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('664', '25', '15516517306', '张飞', '1500345190', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('665', '21', '15516517307', '', '1500362853', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('666', '25', '15516517306', '张飞', '1500433317', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('667', '154', '13312345678', 'test-通用版', '1500434071', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('668', '154', '13312345678', 'test-通用版', '1500448779', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('669', '21', '15516517307', '', '1500449296', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('670', '153', '18201869634', 'chenM61', '1500458293', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('671', '84', '18818223461', '', '1500517823', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('672', '25', '15516517306', '张飞', '1500517870', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('673', '21', '15516517307', '', '1500536003', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('674', '154', '13312345678', 'test-通用版', '1500537071', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('675', '92', '18272878105', 'chenM', '1500605115', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('676', '153', '18201869634', 'chenM61', '1500605157', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('677', '153', '18201869634', 'chenM61', '1500606882', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('678', '153', '18201869634', 'chenM61', '1500607425', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('679', '153', '18201869634', 'chenM61', '1500621355', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('680', '21', '15516517307', '', '1500862396', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('681', '154', '13312345678', 'test-通用版', '1500862635', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('682', '153', '18201869634', 'chenM61', '1500865306', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('683', '21', '15516517307', '', '1500877828', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('684', '21', '15516517307', '', '1500878135', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('685', '25', '15516517306', '张飞', '1501039480', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('686', '92', '18272878105', 'chenM', '1501059282', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('687', '153', '18201869634', 'chenM61', '1501059290', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('688', '21', '15516517307', '', '1501487375', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('689', '21', '15516517307', '', '1502071502', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('690', '21', '15516517307', '', '1502158182', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('691', '153', '18201869634', 'chenM61', '1502159486', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('692', '154', '13312345678', 'test-通用版', '1502173074', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('693', '154', '13312345678', 'test-通用版', '1502260660', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('694', '92', '18272878105', 'chenM', '1502267148', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('695', '153', '18201869634', 'chenM61', '1502267156', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('696', '21', '15516517307', '', '1502268928', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('697', '154', '13312345678', 'test-通用版', '1502347208', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('698', '153', '18201869634', 'chenM61', '1502350533', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('699', '153', '18201869634', 'chenM61', '1502353838', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('700', '153', '18201869634', 'chenM61', '1502356330', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('701', '154', '13312345678', 'test-通用版', '1502358246', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('702', '153', '18201869634', 'chenM61', '1502358765', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('703', '153', '18201869634', 'chenM61', '1502358785', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('704', '153', '18201869634', 'chenM61', '1502359171', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('705', '153', '18201869634', 'chenM61', '1502359198', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('706', '92', '18272878105', 'chenM', '1502360297', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('707', '153', '18201869634', 'chenM61', '1502360304', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('708', '153', '18201869634', 'chenM61', '1502360386', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('709', '21', '15516517307', '', '1502360538', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('710', '153', '18201869634', 'chenM61', '1502416761', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('711', '154', '13312345678', 'test-通用版', '1502420588', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('712', '153', '18201869634', 'chenM61', '1502434438', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('713', '161', '17612345678', '', '1502434462', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('714', '153', '18201869634', 'chenM61', '1502447211', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('715', '153', '18201869634', 'chenM61', '1502447234', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('716', '153', '18201869634', 'chenM61', '1502447267', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('717', '138', '15737928899', '138企业', '1502447703', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('718', '78', '18272878100', '', '1502447888', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('719', '153', '18201869634', 'chenM61', '1502447902', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('720', '153', '18201869634', 'chenM61', '1502447922', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('721', '153', '18201869634', 'chenM61', '1502448019', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('722', '153', '18201869634', 'chenM61', '1502448039', '192.168.199.236');
INSERT INTO `jfy_channel_login_log` VALUES ('723', '153', '18201869634', 'chenM61', '1502675841', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('724', '21', '15516517307', '', '1502676097', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('725', '153', '18201869634', 'chenM61', '1502678167', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('726', '21', '15516517307', '', '1502763420', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('727', '153', '18201869634', 'chenM61', '1502783040', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('728', '21', '15516517307', '', '1502784503', '192.168.199.129');
INSERT INTO `jfy_channel_login_log` VALUES ('729', '21', '15516517307', '', '1502865996', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('730', '92', '18272878105', 'chenM', '1503301054', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('731', '92', '18272878105', 'chenM', '1503545445', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('732', '92', '18272878105', 'chenM', '1503888344', '192.168.199.160');
INSERT INTO `jfy_channel_login_log` VALUES ('733', '21', '15516517307', '', '1504599500', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('734', '21', '15516517307', '', '1504682723', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('735', '21', '15516517307', '', '1506060688', '192.168.199.243');
INSERT INTO `jfy_channel_login_log` VALUES ('736', '92', '18272878105', 'chenM', '1507621988', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('737', '161', '17612345678', '', '1507622001', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('738', '161', '17612345678', '', '1507622618', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('739', '161', '17612345678', '', '1507622815', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('740', '154', '13312345678', 'test-通用版', '1507622816', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('741', '195', '18272878107', 'zhou', '1507622871', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('742', '154', '13312345678', 'test-通用版', '1507628818', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('743', '154', '13312345678', 'test-通用版', '1507630144', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('744', '154', '13312345678', 'test-通用版', '1507686419', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('745', '161', '17612345678', '', '1507688161', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('746', '154', '13312345678', 'test-通用版', '1507690166', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('747', '158', '15512345678', 'chen', '1507690858', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('748', '153', '18201869634', 'chenM61', '1507691888', '192.168.100.236');
INSERT INTO `jfy_channel_login_log` VALUES ('749', '21', '15516517307', '', '1507860308', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('750', '21', '15516517307', '', '1507860338', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('751', '21', '15516517307', '', '1507860490', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('752', '21', '15516517307', '', '1507860532', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('753', '21', '15516517307', '', '1507860579', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('754', '21', '15516517307', '', '1507860737', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('755', '92', '18272878105', 'chenM', '1509698409', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('756', '92', '18272878105', 'chenM', '1509698419', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('757', '161', '17612345678', '', '1509698431', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('758', '175', '13312345678', 'test-通用版', '1509956129', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('759', '173', '18201869634', 'chenM61', '1510026110', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('760', '153', '18201869634', 'chenM61', '1510123337', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('761', '21', '15516517307', '', '1510128681', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('762', '21', '15516517307', '', '1510128694', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('763', '21', '15516517307', '', '1510128900', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('764', '154', '13312345678', 'test-通用版', '1510133121', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('765', '153', '18201869634', 'chenM61', '1510133935', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('766', '153', '18201869634', 'chenM61', '1510198296', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('767', '153', '18201869634', 'chenM61', '1510198640', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('768', '153', '18201869634', 'chenM61', '1510198642', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('769', '21', '15516517307', '', '1510216305', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('770', '21', '15516517307', '', '1510216462', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('771', '154', '13312345678', 'test-通用版', '1510216792', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('772', '196', '15812345678', '', '1510218827', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('773', '21', '15516517307', '', '1510225310', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('774', '21', '15516517307', '', '1510225605', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('775', '21', '15516517307', '', '1510280311', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('776', '21', '15516517307', '', '1510280387', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('777', '153', '18201869634', 'chenM61', '1510285050', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('778', '153', '18201869634', 'chenM61', '1510298277', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('779', '153', '18201869634', 'chenM61', '1510298328', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('780', '153', '18201869634', 'chenM61', '1510367048', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('781', '21', '15516517307', '', '1510367479', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('782', '154', '13312345678', 'test-通用版', '1510369512', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('783', '154', '13312345678', 'test-通用版', '1510369519', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('784', '154', '13312345678', 'test-通用版', '1510369524', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('785', '154', '13312345678', 'test-通用版', '1510369527', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('786', '154', '13312345678', 'test-通用版', '1510369575', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('787', '154', '13312345678', 'test-通用版', '1510369587', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('788', '169', '15612346578', '', '1510370745', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('789', '169', '15612346578', '', '1510370788', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('790', '169', '15612346578', '', '1510370807', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('791', '169', '15612346578', '', '1510370831', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('792', '169', '15612346578', '', '1510370913', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('793', '169', '15612346578', '', '1510370955', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('794', '167', '18812345678', 'test(4/24)', '1510371489', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('795', '47', '15737928808', '信通社123111', '1510371555', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('796', '161', '17612345678', '', '1510371602', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('797', '161', '17612345678', '', '1510371624', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('798', '153', '18201869634', 'chenM61', '1510371657', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('799', '153', '18201869634', 'chenM61', '1510372296', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('800', '153', '18201869634', 'chenM61', '1510372400', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('801', '153', '18201869634', 'chenM61', '1510372734', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('802', '21', '15516517307', '', '1510376345', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('803', '21', '15516517307', '', '1510376420', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('804', '21', '15516517307', '', '1510383855', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('805', '21', '15516517307', '', '1510383901', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('806', '138', '15737928899', '138企业', '1510384409', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('807', '21', '15516517307', '', '1510550801', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('808', '21', '15516517307', '', '1510551928', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('809', '154', '13312345678', 'test-通用版', '1510554475', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('810', '153', '18201869634', 'chenM61', '1510555677', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('811', '153', '18201869634', 'chenM61', '1510628132', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('812', '153', '18201869634', 'chenM61', '1510631564', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('813', '153', '18201869634', 'chenM61', '1510631758', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('814', '25', '15516517306', '张飞', '1510631997', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('815', '21', '15516517307', '', '1510639348', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('816', '21', '15516517307', '', '1510639400', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('817', '153', '18201869634', 'chenM61', '1510639502', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('818', '153', '18201869634', 'chenM61', '1510642939', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('819', '153', '18201869634', 'chenM61', '1510643088', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('820', '154', '13312345678', 'test-通用版', '1510643309', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('821', '161', '17612345678', '', '1510643314', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('822', '154', '13312345678', 'test-通用版', '1510643336', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('823', '21', '15516517307', '', '1510643620', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('824', '21', '15516517307', '', '1510643643', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('825', '153', '18201869634', 'chenM61', '1510644266', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('826', '153', '18201869634', 'chenM61', '1510644396', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('827', '92', '18272878105', 'chenM', '1510644538', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('828', '161', '17612345678', '', '1510644550', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('829', '153', '18201869634', 'chenM61', '1510644560', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('830', '25', '15516517306', '张飞', '1510644624', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('831', '195', '18272878107', 'zhou', '1510644957', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('832', '197', '18272878109', '', '1510645009', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('833', '153', '18201869634', 'chenM61', '1510645903', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('834', '25', '15516517306', '张飞', '1510650047', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('835', '154', '13312345678', 'test-通用版', '1510650157', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('836', '154', '13312345678', 'test-通用版', '1510651804', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('837', '154', '13312345678', 'test-通用版', '1510651817', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('838', '154', '13312345678', 'test-通用版', '1510652978', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('839', '25', '15516517306', '张飞', '1510654478', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('840', '154', '13312345678', 'test-通用版', '1510654603', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('841', '154', '13312345678', 'test-通用版', '1510654653', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('842', '154', '13312345678', 'test-通用版', '1510716456', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('843', '154', '13312345678', 'test-通用版', '1510730478', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('844', '154', '13312345678', 'test-通用版', '1510732165', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('845', '153', '18201869634', 'chenM61', '1510732348', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('846', '21', '15516517307', '', '1510732612', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('847', '153', '18201869634', 'chenM61', '1510732779', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('848', '160', '17712345678', '', '1510738258', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('849', '160', '17712345678', '', '1510738354', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('850', '158', '15512345678', 'chen', '1510738515', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('851', '161', '17612345678', '', '1510738761', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('852', '161', '17612345678', '', '1510738798', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('853', '161', '17612345678', '', '1510740793', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('854', '154', '13312345678', 'test-通用版', '1510740817', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('855', '25', '15516517306', '张飞', '1510798350', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('856', '154', '13312345678', 'test-通用版', '1510799324', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('857', '154', '13312345678', 'test-通用版', '1510816951', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('858', '154', '13312345678', 'test-通用版', '1510817000', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('859', '154', '13312345678', 'test-通用版', '1510817006', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('860', '154', '13312345678', 'test-通用版', '1510817514', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('861', '154', '13312345678', 'test-通用版', '1510817566', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('862', '154', '13312345678', 'test-通用版', '1510817573', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('863', '154', '13312345678', 'test-通用版', '1510817601', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('864', '154', '13312345678', 'test-通用版', '1510817603', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('865', '153', '18201869634', 'chenM61', '1510819208', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('866', '154', '13312345678', 'test-通用版', '1510822887', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('867', '154', '13312345678', 'test-通用版', '1510822946', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('868', '154', '13312345678', 'test-通用版', '1510822963', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('869', '154', '13312345678', 'test-通用版', '1510823020', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('870', '154', '13312345678', 'test-通用版', '1510823340', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('871', '154', '13312345678', 'test-通用版', '1510823946', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('872', '154', '13312345678', 'test-通用版', '1510824008', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('873', '154', '13312345678', 'test-通用版', '1510824009', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('874', '172', '18612346578', '通用版test005', '1510824149', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('875', '154', '13312345678', 'test-通用版', '1510827376', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('876', '154', '13312345678', 'test-通用版', '1510884559', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('877', '154', '13312345678', 'test-通用版', '1510884562', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('878', '21', '15516517307', '', '1510886499', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('879', '21', '15516517307', '', '1510886510', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('880', '153', '18201869634', 'chenM61', '1510906099', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('881', '153', '18201869634', 'chenM61', '1510909942', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('882', '21', '15516517307', '', '1511144092', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('883', '21', '15516517307', '', '1511144115', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('884', '154', '13312345678', 'test-通用版', '1511144706', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('885', '154', '13312345678', 'test-通用版', '1511155296', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('886', '154', '13312345678', 'test-通用版', '1511157058', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('887', '153', '18201869634', 'chenM61', '1511165920', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('888', '163', '17712345677', '通用-test2威威', '1511167483', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('889', '153', '18201869634', 'chenM61', '1511167628', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('890', '153', '18201869634', 'chenM61', '1511168648', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('891', '153', '18201869634', 'chenM61', '1511172241', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('892', '21', '15516517307', '', '1511232601', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('893', '153', '18201869634', 'chenM61', '1511233133', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('894', '154', '13312345678', 'test-通用版', '1511244444', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('895', '154', '13312345678', 'test-通用版', '1511244577', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('896', '153', '18201869634', 'chenM61', '1511244897', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('897', '154', '13312345678', 'test-通用版', '1511245196', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('898', '154', '13312345678', 'test-通用版', '1511245218', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('899', '154', '13312345678', 'test-通用版', '1511245218', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('900', '153', '18201869634', 'chenM61', '1511245999', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('901', '153', '18201869634', 'chenM61', '1511246257', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('902', '153', '18201869634', 'chenM61', '1511246289', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('903', '153', '18201869634', 'chenM61', '1511246326', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('904', '153', '18201869634', 'chenM61', '1511246366', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('905', '153', '18201869634', 'chenM61', '1511246390', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('906', '153', '18201869634', 'chenM61', '1511246441', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('907', '154', '13312345678', 'test-通用版', '1511246964', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('908', '153', '18201869634', 'chenM61', '1511247081', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('909', '154', '13312345678', 'test-通用版', '1511247177', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('910', '154', '13312345678', 'test-通用版', '1511247334', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('911', '154', '13312345678', 'test-通用版', '1511247354', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('912', '154', '13312345678', 'test-通用版', '1511247543', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('913', '161', '17612345678', '', '1511247648', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('914', '153', '18201869634', 'chenM61', '1511247649', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('915', '167', '18812345678', 'test(4/24)', '1511247785', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('916', '153', '18201869634', 'chenM61', '1511249031', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('917', '153', '18201869634', 'chenM61', '1511249059', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('918', '153', '18201869634', 'chenM61', '1511249105', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('919', '153', '18201869634', 'chenM61', '1511249845', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('920', '154', '13312345678', 'test-通用版', '1511249967', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('921', '154', '13312345678', 'test-通用版', '1511250824', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('922', '21', '15516517307', '', '1511253678', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('923', '21', '15516517307', '', '1511253701', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('924', '21', '15516517307', '', '1511253714', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('925', '21', '15516517307', '', '1511254317', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('926', '161', '17612345678', '', '1511336904', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('927', '154', '13312345678', 'test-通用版', '1511336909', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('928', '153', '18201869634', 'chenM61', '1511337122', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('929', '154', '13312345678', 'test-通用版', '1511337566', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('930', '173', '15512346578', '通用版test006', '1511339715', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('931', '38', '13917771100', '泰山', '1511339766', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('932', '21', '15516517307', '', '1511340773', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('933', '21', '15516517307', '', '1511428689', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('934', '153', '18201869634', 'chenM61', '1511429131', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('935', '153', '18201869634', 'chenM61', '1511429899', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('936', '153', '18201869634', 'chenM61', '1511493480', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('937', '153', '18201869634', 'chenM61', '1511494711', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('938', '153', '18201869634', 'chenM61', '1511495227', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('939', '161', '17612345678', '', '1511496138', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('940', '158', '15512345678', 'chen', '1511496174', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('941', '175', '15712345678', 'xxx', '1511496195', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('942', '175', '15712345678', 'xxx', '1511496200', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('943', '172', '18612346578', '通用版test005', '1511496251', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('944', '21', '15516517307', '', '1511519287', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('945', '153', '18201869634', 'chenM61', '1511766211', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('946', '21', '15516517307', '', '1511833736', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('947', '153', '18201869634', 'chenM61', '1512012335', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('948', '21', '15516517307', '', '1512037522', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('949', '153', '18201869634', 'chenM61', '1512098820', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('950', '21', '15516517307', '', '1512187221', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('951', '153', '18201869634', 'chenM61', '1512354134', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('952', '21', '15516517307', '', '1512356065', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('953', '197', '18272878109', '', '1512358286', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('954', '197', '18272878109', '', '1512360293', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('955', '197', '18272878109', '', '1512360600', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('956', '203', '18817800000', '家政公司', '1512443716', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('957', '203', '18817800000', '家政公司', '1512444351', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('958', '203', '18817800000', '家政公司', '1512444372', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('959', '203', '18817800000', '家政公司', '1512444399', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('960', '203', '18817800000', '家政公司', '1512444495', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('961', '203', '18817800000', '家政公司', '1512444496', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('962', '203', '18817800000', '家政公司', '1512444560', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('963', '154', '13312345678', 'test-通用版', '1512444605', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('964', '154', '13312345678', 'test-通用版', '1512444610', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('965', '21', '15516517307', '', '1512444668', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('966', '21', '15516517307', '', '1512444683', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('967', '21', '15516517307', '', '1512444707', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('968', '21', '15516517307', '', '1512444749', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('969', '203', '18817800000', '家政公司', '1512444885', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('970', '203', '18817800000', '家政公司', '1512444938', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('971', '203', '18817800000', '家政公司', '1512444974', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('972', '203', '18817800000', '家政公司', '1512445046', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('973', '203', '18817800000', '家政公司', '1512445076', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('974', '203', '18817800000', '家政公司', '1512445079', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('975', '203', '18817800000', '家政公司', '1512445112', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('976', '203', '18817800000', '家政公司', '1512445139', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('977', '203', '18817800000', '家政公司', '1512445146', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('978', '203', '18817800000', '家政公司', '1512445160', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('979', '203', '18817800000', '家政公司', '1512445195', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('980', '203', '18817800000', '家政公司', '1512445206', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('981', '203', '18817800000', '家政公司', '1512445211', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('982', '203', '18817800000', '家政公司', '1512445225', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('983', '203', '18817800000', '家政公司', '1512445230', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('984', '203', '18817800000', '家政公司', '1512445238', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('985', '203', '18817800000', '家政公司', '1512445245', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('986', '203', '18817800000', '家政公司', '1512445251', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('987', '203', '18817800000', '家政公司', '1512445300', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('988', '203', '18817800000', '家政公司', '1512445312', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('989', '203', '18817800000', '家政公司', '1512445323', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('990', '203', '18817800000', '家政公司', '1512445449', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('991', '203', '18817800000', '家政公司', '1512445486', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('992', '203', '18817800000', '家政公司', '1512445487', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('993', '203', '18817800000', '家政公司', '1512445487', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('994', '203', '18817800000', '家政公司', '1512445498', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('995', '203', '18817800000', '家政公司', '1512445499', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('996', '203', '18817800000', '家政公司', '1512445542', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('997', '203', '18817800000', '家政公司', '1512445560', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('998', '203', '18817800000', '家政公司', '1512446048', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('999', '203', '18817800000', '家政公司', '1512446088', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1000', '203', '18817800000', '家政公司', '1512446694', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1001', '203', '18817800000', '家政公司', '1512446751', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1002', '203', '18817800000', '家政公司', '1512446869', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1003', '203', '18817800000', '家政公司', '1512447047', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1004', '203', '18817800000', '家政公司', '1512447465', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1005', '203', '18817800000', '家政公司', '1512447507', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1006', '203', '18817800000', '家政公司', '1512456116', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1007', '203', '18817800000', '家政公司', '1512456136', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1008', '203', '18817800000', '家政公司', '1512456198', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1009', '203', '18817800000', '家政公司', '1512456202', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1010', '203', '18817800000', '家政公司', '1512458685', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1011', '203', '18817800000', '家政公司', '1512459339', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1012', '203', '18817800000', '家政公司', '1512460309', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1013', '203', '18817800000', '家政公司', '1512460441', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1014', '203', '18817800000', '家政公司', '1512460832', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('1015', '203', '18817800000', '家政公司', '1512460908', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1016', '203', '18817800000', '家政公司', '1512460913', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1017', '203', '18817800000', '家政公司', '1512460922', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1018', '203', '18817800000', '家政公司', '1512460935', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1019', '203', '18817800000', '家政公司', '1512460959', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1020', '203', '18817800000', '家政公司', '1512460968', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1021', '203', '18817800000', '家政公司', '1512460969', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('1022', '203', '18817800000', '家政公司', '1512461073', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1023', '203', '18817800000', '家政公司', '1512461116', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1024', '203', '18817800000', '家政公司', '1512461163', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1025', '203', '18817800000', '家政公司', '1512461244', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1026', '203', '18817800000', '家政公司', '1512462814', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1027', '203', '18817800000', '家政公司', '1512462890', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1028', '203', '18817800000', '家政公司', '1512462989', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1029', '203', '18817800000', '家政公司', '1512463354', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1030', '203', '18817800000', '家政公司', '1512463379', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1031', '203', '18817800000', '家政公司', '1512464117', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1032', '203', '18817800000', '家政公司', '1512464149', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1033', '203', '18817800000', '家政公司', '1512464169', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1034', '154', '13312345678', 'test-通用版', '1512466285', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1035', '205', '17611110000', '', '1512467225', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1036', '205', '17611110000', '', '1512467594', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1037', '203', '18817800000', '家政公司', '1512467628', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1038', '203', '18817800000', '家政公司', '1512468018', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1039', '203', '18817800000', '家政公司', '1512468152', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1040', '203', '18817800000', '家政公司', '1512468568', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1041', '21', '15516517307', '', '1512524397', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1042', '153', '18201869634', 'chenM61', '1512526520', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1043', '203', '18817800000', '家政公司', '1512528755', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1044', '203', '18817800000', '家政公司', '1512531250', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1045', '203', '18817800000', '家政公司', '1512531459', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1046', '203', '18817800000', '家政公司', '1512531678', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1047', '203', '18817800000', '家政公司', '1512531931', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1048', '203', '18817800000', '家政公司', '1512531982', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1049', '203', '18817800000', '家政公司', '1512532149', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1050', '203', '18817800000', '家政公司', '1512532223', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1051', '203', '18817800000', '家政公司', '1512533386', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1052', '203', '18817800000', '家政公司', '1512534377', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1053', '203', '18817800000', '家政公司', '1512540941', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1054', '203', '18817800000', '家政公司', '1512546807', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1055', '203', '18817800000', '家政公司', '1512553138', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1056', '21', '15516517307', '', '1512613835', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1057', '203', '18817800000', '家政公司', '1512617105', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1058', '203', '18817800000', '家政公司', '1512617954', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1059', '21', '15516517307', '', '1512617985', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1060', '153', '18201869634', 'chenM61', '1512618470', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1061', '203', '18817800000', '家政公司', '1512618550', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1062', '203', '18817800000', '家政公司', '1512619039', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1063', '203', '18817800000', '家政公司', '1512620130', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1064', '203', '18817800000', '家政公司', '1512631401', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1065', '203', '18817800000', '家政公司', '1512632340', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1066', '203', '18817800000', '家政公司', '1512637866', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1067', '203', '18817800000', '家政公司', '1512639818', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1068', '203', '18817800000', '家政公司', '1512641242', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1069', '203', '18817800000', '家政公司', '1512641649', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1070', '153', '18201869634', 'chenM61', '1512701844', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1071', '153', '18201869634', 'chenM61', '1512701853', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1072', '25', '15516517306', '张飞', '1512701953', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1073', '21', '15516517307', '', '1512701967', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1074', '21', '15516517307', '', '1512702084', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1075', '203', '18817800000', '家政公司', '1512702147', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1076', '21', '15516517307', '', '1512702169', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1077', '25', '15516517306', '张飞', '1512702210', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1078', '25', '15516517306', '张飞', '1512702258', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1079', '25', '15516517306', '张飞', '1512702292', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1080', '25', '15516517306', '张飞', '1512702337', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1081', '25', '15516517306', '张飞', '1512702353', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1082', '21', '15516517307', '', '1512702396', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1083', '25', '15516517306', '张飞', '1512702564', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1084', '203', '18817800000', '家政公司', '1512702606', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1085', '153', '18201869634', 'chenM61', '1512703202', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1086', '153', '18201869634', 'chenM61', '1512703504', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1087', '25', '15516517306', '张飞', '1512703598', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1088', '21', '15516517307', '', '1512703870', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1089', '203', '18817800000', '家政公司', '1512704338', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1090', '203', '18817800000', '家政公司', '1512704408', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1091', '203', '18817800000', '家政公司', '1512704755', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1092', '25', '15516517306', '张飞', '1512705499', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1093', '203', '18817800000', '家政公司', '1512705571', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1094', '153', '18201869634', 'chenM61', '1512711770', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1095', '203', '18817800000', '家政公司', '1512713661', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1096', '203', '18817800000', '家政公司', '1512714494', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1097', '203', '18817800000', '家政公司', '1512718043', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1098', '25', '15516517306', '张飞', '1512720027', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1099', '203', '18817800000', '家政公司', '1512720086', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1100', '203', '18817800000', '家政公司', '1512724430', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1101', '25', '15516517306', '张飞', '1512725111', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1102', '203', '18817800000', '家政公司', '1512725132', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1103', '203', '18817800000', '家政公司', '1512725941', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1104', '21', '15516517307', '', '1512726828', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1105', '203', '18817800000', '家政公司', '1512727862', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1106', '21', '15516517307', '', '1512728280', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1107', '203', '18817800000', '家政公司', '1512728378', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1108', '203', '18817800000', '家政公司', '1512730386', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1109', '21', '15516517307', '', '1512732195', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1110', '21', '15516517307', '', '1512960454', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1111', '25', '15516517306', '张飞', '1512960504', '192.168.100.129');
INSERT INTO `jfy_channel_login_log` VALUES ('1112', '203', '18817800000', '家政公司', '1512962979', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1113', '203', '18817800000', '家政公司', '1512963749', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1114', '203', '18817800000', '家政公司', '1512964394', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1115', '203', '18817800000', '家政公司', '1512964458', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1116', '203', '18817800000', '家政公司', '1512964483', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1117', '203', '18817800000', '家政公司', '1512964508', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1118', '203', '18817800000', '家政公司', '1512964533', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1119', '203', '18817800000', '家政公司', '1512964565', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1120', '203', '18817800000', '家政公司', '1512964811', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1121', '203', '18817800000', '家政公司', '1512964894', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1122', '203', '18817800000', '家政公司', '1512965023', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1123', '203', '18817800000', '家政公司', '1512965072', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1124', '203', '18817800000', '家政公司', '1512965220', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1125', '203', '18817800000', '家政公司', '1512965947', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1126', '203', '18817800000', '家政公司', '1512966220', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1127', '203', '18817800000', '家政公司', '1512966518', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1128', '203', '18817800000', '家政公司', '1512966568', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1129', '203', '18817800000', '家政公司', '1512971420', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1130', '21', '15516517307', '', '1512971888', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1131', '21', '15516517307', '', '1512972159', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1132', '203', '18817800000', '家政公司', '1512974030', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1133', '153', '18201869634', 'chenM61', '1512977135', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1134', '203', '18817800000', '家政公司', '1512979142', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1135', '203', '18817800000', '家政公司', '1512979694', '192.168.100.156');
INSERT INTO `jfy_channel_login_log` VALUES ('1136', '203', '18817800000', '家政公司', '1512982519', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1137', '203', '18817800000', '家政公司', '1512982557', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1138', '203', '18817800000', '家政公司', '1512982621', '192.168.100.156');
INSERT INTO `jfy_channel_login_log` VALUES ('1139', '203', '18817800000', '家政公司', '1513046479', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1140', '203', '18817800000', '家政公司', '1513046711', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1141', '203', '18817800000', '家政公司', '1513047171', '192.168.100.156');
INSERT INTO `jfy_channel_login_log` VALUES ('1142', '203', '18817800000', '家政公司', '1513047518', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1143', '203', '18817800000', '家政公司', '1513048372', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1144', '215', '18817700000', '', '1513048744', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1145', '215', '18817700000', '', '1513049036', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1146', '215', '18817700000', '', '1513049133', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1147', '215', '18817700000', '', '1513049783', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1148', '215', '18817700000', '', '1513050255', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1149', '215', '18817700000', '', '1513050388', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1150', '215', '18817700000', '', '1513050458', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1151', '215', '18817700000', '', '1513050532', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1152', '215', '18817700000', '', '1513050620', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1153', '215', '18817700000', '', '1513050645', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1154', '215', '18817700000', '', '1513050706', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1155', '215', '18817700000', '', '1513051207', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1156', '215', '18817700000', '', '1513051234', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1157', '215', '18817700000', '', '1513051275', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1158', '215', '18817700000', '', '1513051298', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1159', '215', '18817700000', '', '1513051381', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1160', '215', '18817700000', '', '1513051411', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1161', '216', '17811110000', '', '1513051800', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1162', '216', '17811110000', '', '1513051830', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1163', '216', '17811110000', '', '1513051855', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1164', '216', '17811110000', '', '1513051891', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1165', '216', '17811110000', '', '1513051926', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1166', '216', '17811110000', '', '1513052579', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1167', '216', '17811110000', '', '1513054391', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1168', '216', '17811110000', '', '1513055134', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1169', '21', '15516517307', '', '1513058201', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1170', '203', '18817800000', '家政公司', '1513058269', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1171', '216', '17811110000', '', '1513058686', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1172', '21', '15516517307', '', '1513058768', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1173', '203', '18817800000', '家政公司', '1513061443', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1174', '203', '18817800000', '家政公司', '1513062089', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1175', '21', '15516517307', '', '1513062410', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1176', '21', '15516517307', '', '1513062728', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1177', '219', '17811114444', '', '1513070983', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1178', '218', '17811113333', '', '1513071322', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1179', '218', '17811113333', '', '1513071372', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1180', '218', '17811113333', '', '1513071388', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1181', '218', '17811113333', '', '1513071510', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1182', '216', '17811110000', '', '1513071601', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1183', '218', '17811113333', '', '1513071647', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1184', '216', '17811110000', '', '1513072090', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1185', '203', '18817800000', '家政公司', '1513072131', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1186', '218', '17811113333', '', '1513072166', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1187', '217', '17811112222', '', '1513072357', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1188', '218', '17811113333', '', '1513072618', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1189', '218', '17811113333', '', '1513072953', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1190', '218', '17811113333', '', '1513073070', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1191', '218', '17811113333', '', '1513073109', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1192', '218', '17811113333', '', '1513073134', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1193', '218', '17811113333', '', '1513073150', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1194', '218', '17811113333', '', '1513073181', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1195', '218', '17811113333', '', '1513073230', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1196', '218', '17811113333', '', '1513073475', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1197', '218', '17811113333', '', '1513073508', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1198', '216', '17811110000', '', '1513073633', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1199', '218', '17811113333', '', '1513073669', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1200', '218', '17811113333', '', '1513073723', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1201', '218', '17811113333', '', '1513073782', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1202', '218', '17811113333', '', '1513073843', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1203', '218', '17811113333', '', '1513073864', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1204', '218', '17811113333', '', '1513073867', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1205', '218', '17811113333', '', '1513073890', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1206', '216', '17811110000', '', '1513073919', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1207', '218', '17811113333', '', '1513073983', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1208', '218', '17811113333', '', '1513074007', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1209', '218', '17811113333', '', '1513074063', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1210', '218', '17811113333', '', '1513074093', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1211', '218', '17811113333', '', '1513074124', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1212', '218', '17811113333', '', '1513074148', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1213', '218', '17811113333', '', '1513074196', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1214', '218', '17811113333', '', '1513074218', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1215', '218', '17811113333', '', '1513074260', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1216', '218', '17811113333', '', '1513074361', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1217', '216', '17811110000', '', '1513074951', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1218', '216', '17811110000', '', '1513075064', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1219', '25', '15516517306', '张飞', '1513076839', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1220', '21', '15516517307', '', '1513077260', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1221', '25', '15516517306', '张飞', '1513078160', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1222', '21', '15516517307', '', '1513078257', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1223', '21', '15516517307', '', '1513078286', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1224', '203', '18817800000', '家政公司', '1513079785', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1225', '203', '18817800000', '家政公司', '1513080108', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1226', '251', '13671742189', '凝璞家政', '1513080997', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1227', '251', '13671742189', '凝璞家政', '1513081341', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1228', '251', '13671742189', '凝璞家政', '1513081351', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1229', '251', '13671742189', '凝璞家政', '1513081453', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1230', '21', '15516517307', '', '1513089199', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1231', '203', '18817800000', '家政公司', '1513090658', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1232', '203', '18817800000', '家政公司', '1513153247', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1233', '203', '18817800000', '家政公司', '1513158543', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1234', '21', '15516517307', '', '1513160300', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1235', '203', '18817800000', '家政公司', '1513221176', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1236', '203', '18817800000', '家政公司', '1513221276', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1237', '203', '18817800000', '家政公司', '1513221295', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1238', '203', '18817800000', '家政公司', '1513223814', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1239', '203', '18817800000', '家政公司', '1513235235', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1240', '253', '18721235580', '上海刘刚', '1513239459', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1241', '256', '18721235581', '上海刘刚', '1513239536', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1242', '256', '18721235581', '上海刘刚', '1513239579', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1243', '216', '17811110000', '', '1513243387', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1244', '203', '18817800000', '家政公司', '1513307075', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1245', '216', '17811110000', '', '1513308214', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1246', '21', '15516517307', '', '1513321860', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1247', '21', '15516517307', '', '1513564601', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1248', '215', '18817700000', '', '1513580166', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1249', '215', '18817700000', '', '1513580178', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1250', '215', '18817700000', '', '1513580201', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1251', '215', '18817700000', '', '1513580222', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1252', '215', '18817700000', '', '1513580243', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1253', '215', '18817700000', '', '1513580275', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1254', '203', '18817800000', '家政公司', '1513580312', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1255', '203', '18817800000', '家政公司', '1513584177', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1256', '203', '18817800000', '家政公司', '1513586806', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1257', '203', '18817800000', '家政公司', '1513589503', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1258', '21', '15516517307', '', '1513651034', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1259', '203', '18817800000', '家政公司', '1513736785', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1260', '203', '18817800000', '家政公司', '1513740447', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1261', '203', '18817800000', '家政公司', '1513740544', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1262', '203', '18817800000', '家政公司', '1513742014', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1263', '203', '18817800000', '家政公司', '1513742106', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1264', '203', '18817800000', '家政公司', '1513752714', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1265', '263', '15516517000', '', '1513761419', '192.168.100.160');
INSERT INTO `jfy_channel_login_log` VALUES ('1266', '263', '15516517000', '', '1513761655', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1267', '21', '15516517307', '', '1513846971', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1268', '203', '18817800000', '家政公司', '1513931282', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1269', '5', '15516517307', '张伟', null, null);
INSERT INTO `jfy_channel_login_log` VALUES ('1270', '5', '15516517307', '张伟', null, null);
INSERT INTO `jfy_channel_login_log` VALUES ('1271', '5', '15516517307', '张伟', '0', null);
INSERT INTO `jfy_channel_login_log` VALUES ('1272', '5', '15516517307', '张伟', '1514275911', '::1');
INSERT INTO `jfy_channel_login_log` VALUES ('1273', '5', '15516517307', '张伟', '1514275922', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1274', '5', '15516517307', '张伟', '1514276311', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1275', '5', '15516517307', '张伟', '1514276345', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1276', '5', '15516517307', '张伟', '1514430531', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1277', '5', '15516517307', '张伟', '1514430640', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1278', '5', '15516517307', '张伟', '1514432823', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1279', '5', '15516517307', '张伟', '1514449204', '192.168.100.190');
INSERT INTO `jfy_channel_login_log` VALUES ('1280', '5', '15516517307', '张伟', '1514887254', '192.168.100.136');
INSERT INTO `jfy_channel_login_log` VALUES ('1281', '5', '15516517307', '张伟', '1514944052', '192.168.100.190');

-- ----------------------------
-- Table structure for `jfy_channel_session`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_channel_session`;
CREATE TABLE `jfy_channel_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sessionId',
  `partner_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=3433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_channel_session
-- ----------------------------
INSERT INTO `jfy_channel_session` VALUES ('126', '37', 'cd73d07a114f66c46cc3033effbb0208', '[]', '', '1482842759');
INSERT INTO `jfy_channel_session` VALUES ('129', '26', '62803180e79fe64491fde6d1625f0a20', '[]', '', '1482910736');
INSERT INTO `jfy_channel_session` VALUES ('138', '39', '336795d7d8de3b26c9d51f6647a3e44f', '[]', '', '1482993527');
INSERT INTO `jfy_channel_session` VALUES ('232', '43', '97f348a578175d2bb3bc0e3e1041eeed', '[]', '', '1483085591');
INSERT INTO `jfy_channel_session` VALUES ('307', '46', 'b821c2ae5b8861c81077e96eb769f430', '[]', '', '1483104755');
INSERT INTO `jfy_channel_session` VALUES ('424', '64', '4dcd80fdb0920bdf9fb2b3575377133d', '[]', '', '1483601810');
INSERT INTO `jfy_channel_session` VALUES ('426', '2', 'd80b6fcb686fd59416a11f4fa35f3632', '[]', '', '1483602506');
INSERT INTO `jfy_channel_session` VALUES ('602', '61', 'dfc14e8a8d9db9593bcf8ad01a61c40e', '[]', '', '1484213958');
INSERT INTO `jfy_channel_session` VALUES ('607', '68', 'df527d420957aa56f917cd12e1c69412', '[]', '', '1484217992');
INSERT INTO `jfy_channel_session` VALUES ('645', '74', '6bfd01b9519b781040c212e120c63943', '[]', '', '1484282188');
INSERT INTO `jfy_channel_session` VALUES ('669', '80', '2fd16afbea4a309db425750507a60085', '[]', '', '1484298195');
INSERT INTO `jfy_channel_session` VALUES ('902', '41', 'bf26f9dc1f67dbe5fe1f3fb6f6daf1a4', '[]', '', '1487573445');
INSERT INTO `jfy_channel_session` VALUES ('978', '91', 'ae4b7ee2ba64e36b79a5a6bf30e4caab', '[]', '', '1488254555');
INSERT INTO `jfy_channel_session` VALUES ('1328', '136', '1e4866de590cd998ae34ee016f1c5a6c', '[]', '', '1490704239');
INSERT INTO `jfy_channel_session` VALUES ('1432', '33', '105bb6222733a0388ceed9011e6a1c97', '[]', '', '1491377406');
INSERT INTO `jfy_channel_session` VALUES ('1465', '76', 'b24cda684ccd105ccfe633b2ec2327ae', '[]', '', '1491471672');
INSERT INTO `jfy_channel_session` VALUES ('1832', '159', 'a46887eb2034967134808ed4248e3b86', '[]', '', '1492675906');
INSERT INTO `jfy_channel_session` VALUES ('1860', '162', 'a6568b518e395063c9093585b98aacbf', '[]', '', '1492748368');
INSERT INTO `jfy_channel_session` VALUES ('1863', '82', 'b6baa8229fec5c146e0435fffbc797bd', '[]', '', '1492748514');
INSERT INTO `jfy_channel_session` VALUES ('1921', '168', 'bf975c0717a4676025aa42e930d9e86d', '[]', '', '1493013110');
INSERT INTO `jfy_channel_session` VALUES ('1932', '160', 'efdebbc6a5304ae6a5ae47f320b940d7', '[]', '', '1493018970');
INSERT INTO `jfy_channel_session` VALUES ('1945', '170', '2db76f48631c97d55df88738d226f79d', '[]', '', '1493023182');
INSERT INTO `jfy_channel_session` VALUES ('2161', '56', '7e6dff94ed36a847d32d6e5cd210680a', '[]', '', '1493367448');
INSERT INTO `jfy_channel_session` VALUES ('2170', '65', 'f7e9b007223758dba4ccbfe70990a451', '[]', '', '1493367922');
INSERT INTO `jfy_channel_session` VALUES ('2186', '174', 'eae8325bc0f46464a02a6f5e1cdc104b', '[]', '', '1493715485');
INSERT INTO `jfy_channel_session` VALUES ('2223', '93', '75a652f2871bb06ec12498f4b0f72544', '[]', '', '1493797907');
INSERT INTO `jfy_channel_session` VALUES ('2243', '55', 'a479c7131d5d061a4387c3dc41a7fe44', '[]', '', '1493893864');
INSERT INTO `jfy_channel_session` VALUES ('2344', '116', '0f8307c3766a54930c35371dcc7c626b', '[]', '', '1494323255');
INSERT INTO `jfy_channel_session` VALUES ('2400', '177', 'd56eca18758e87c0596bb47763343eaa', '[]', '', '1494835808');
INSERT INTO `jfy_channel_session` VALUES ('2402', '178', '74398cb723d827fee7740c433a25be86', '[]', '', '1494835944');
INSERT INTO `jfy_channel_session` VALUES ('2404', '179', '82ca46067ba0995c7b54530a29613195', '[]', '', '1494836040');
INSERT INTO `jfy_channel_session` VALUES ('2698', '145', 'e011277c1155cef2dad5db4eff421e93', '[]', '', '1497943886');
INSERT INTO `jfy_channel_session` VALUES ('2734', '94', '3c39cb19b6b2bb7663f269d95af77bc4', '[]', '', '1498457241');
INSERT INTO `jfy_channel_session` VALUES ('2768', '144', 'c97b55070597519c461d06d23ec83515', '[]', '', '1499075731');
INSERT INTO `jfy_channel_session` VALUES ('2790', '194', 'e555a251678b2195748bf8536eb38461', '[]', '', '1499740891');
INSERT INTO `jfy_channel_session` VALUES ('2825', '84', 'f7f99d12725b38ba367e1272cb56ff86', '[]', '', '1500517823');
INSERT INTO `jfy_channel_session` VALUES ('2872', '78', '837c898c595b49399b05ccf62f6bea02', '[]', '', '1502447888');
INSERT INTO `jfy_channel_session` VALUES ('2925', '196', '9a9a5dc4981e1508f63103f0a9c5b142', '[]', '', '1510218827');
INSERT INTO `jfy_channel_session` VALUES ('2946', '169', '1a486f6b996ad4a8cb4a49f1cfbdfdd5', '[]', '', '1510370955');
INSERT INTO `jfy_channel_session` VALUES ('2980', '92', 'e487400045c51c69b56282d71a619392', '[]', '', '1510644538');
INSERT INTO `jfy_channel_session` VALUES ('2984', '195', 'e3739f7bad6597c1aef6c173971168c3', '[]', '', '1510644957');
INSERT INTO `jfy_channel_session` VALUES ('3002', '160', 'ddbca26031d06acbfaf3c21ebb1d00d4', '[]', '', '1510738354');
INSERT INTO `jfy_channel_session` VALUES ('3091', '161', '3f43a85cfa95a722a225f714952bfb4c', '[]', '', '1511496139');
INSERT INTO `jfy_channel_session` VALUES ('3092', '158', '1a1f0b4e11dd9803a8361b1724db3552', '[]', '', '1511496174');
INSERT INTO `jfy_channel_session` VALUES ('3094', '175', '9077f97720f173d8b21b8b75cb7f001b', '[]', '', '1511496201');
INSERT INTO `jfy_channel_session` VALUES ('3095', '172', '7bbffad16f02bf215f9259efac736b46', '[]', '', '1511496251');
INSERT INTO `jfy_channel_session` VALUES ('3107', '197', 'faede216f7b4b7fb2ad420b92239618e', '[]', '', '1512360600');
INSERT INTO `jfy_channel_session` VALUES ('3188', '205', '38dead4d660c66633d7fff511dbbf337', '[]', '', '1512467594');
INSERT INTO `jfy_channel_session` VALUES ('3338', '217', 'e612c036356fb1123a627963bdc194d4', '[]', '', '1513072357');
INSERT INTO `jfy_channel_session` VALUES ('3367', '218', '2c96dd4da6a5875686c25dd7eac287a8', '[]', '', '1513074362');
INSERT INTO `jfy_channel_session` VALUES ('3375', '203', 'a40a9aa71c78afdddc073d05797904e0', '[]', '', '1513079785');
INSERT INTO `jfy_channel_session` VALUES ('3380', '251', '4ad17f189403036e4a6d86dd54917e47', '[]', '', '1513081453');
INSERT INTO `jfy_channel_session` VALUES ('3392', '256', 'c11e06a206d1967aaaa39891083abb78', '[]', '', '1513239537');
INSERT INTO `jfy_channel_session` VALUES ('3396', '216', 'bdbf1465b9a0f8813078903aea0f9dd6', '[]', '', '1513308215');
INSERT INTO `jfy_channel_session` VALUES ('3404', '215', '3c6488c79c82366ceaea6cc134766409', '[]', '', '1513580275');
INSERT INTO `jfy_channel_session` VALUES ('3417', '263', '16d439d03388ebf9139d57a8bb332b58', '[]', '', '1513761656');
INSERT INTO `jfy_channel_session` VALUES ('3418', '21', 'e2f1fd8938053db503a7ff1ee4e378ed', '[]', '', '1513846971');
INSERT INTO `jfy_channel_session` VALUES ('3419', '203', '8570840cf4d608626c1cf3cad15c11aa', '[]', '', '1513931282');
INSERT INTO `jfy_channel_session` VALUES ('3432', '5', 'b259fe8f7c2046e6238923ff04831819', '[]', '', '1515140092');

-- ----------------------------
-- Table structure for `jfy_check_plan`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_check_plan`;
CREATE TABLE `jfy_check_plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `check_time` int(10) NOT NULL COMMENT '计划检查时间',
  `mark` text COMMENT '备注',
  `summary` text COMMENT '小结',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '检查状态 0:未检查 1:检查中 2:检查完毕',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_check_plan
-- ----------------------------
INSERT INTO `jfy_check_plan` VALUES ('1', '1', '检查计划', '[1]', '1', '', null, '0', '1500979927', '0');
INSERT INTO `jfy_check_plan` VALUES ('2', '1', '检查计划', '[1]', '1500979832', '', null, '0', '1500979974', '0');
INSERT INTO `jfy_check_plan` VALUES ('3', '1', '检查计划', '[1]', '1500979832', null, null, '1', '1500983041', '1500983561');
INSERT INTO `jfy_check_plan` VALUES ('4', '1', '检查计划3', '[1]', '1500979832', null, null, '1', '1500985372', '1501059692');
INSERT INTO `jfy_check_plan` VALUES ('5', '1', '测试', '1', '0', '', null, '0', '1501049696', '0');
INSERT INTO `jfy_check_plan` VALUES ('6', '1', '测试', '1', '1500998400', '', '阿萨德', '2', '1501049761', '1501059670');
INSERT INTO `jfy_check_plan` VALUES ('7', '1', '测试赛', '1', '1501084800', '', '车阿萨德', '2', '1501050545', '1501059598');
INSERT INTO `jfy_check_plan` VALUES ('8', '1', '测试', '[\"1\"]', '1501171200', '测阿萨德', '测试', '2', '1501050732', '1501059471');
INSERT INTO `jfy_check_plan` VALUES ('9', '1', '测试', '[\"5\",\"4\",\"2\"]', '1501084800', '阿萨德', null, '1', '1501071238', '1501242590');
INSERT INTO `jfy_check_plan` VALUES ('10', '1', '测试', '[\"5\",\"4\",\"2\"]', '1501084800', '', '测试', '2', '1501071261', '1501235862');
INSERT INTO `jfy_check_plan` VALUES ('11', '1', '这是我在测试检查', '[\"5\",\"3\",\"4\",\"1\",\"2\"]', '1501084800', '这是我测试备注', '阿什顿发斯蒂芬', '1', '1501122987', '1501244280');
INSERT INTO `jfy_check_plan` VALUES ('12', '5', '123123', '[\"10\",\"11\",\"8\",\"9\"]', '1501171200', '123123', '完毕', '1', '1501242470', '1501244524');
INSERT INTO `jfy_check_plan` VALUES ('13', '4', '测试001', '[\"12\"]', '1501171200', '实打实大说的', null, '1', '1501246357', '1501474955');
INSERT INTO `jfy_check_plan` VALUES ('14', '4', '检查一下医院的灭火器', '[\"12\"]', '1501430400', '灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？灭火器还能用？', null, '1', '1501486007', '1501486030');

-- ----------------------------
-- Table structure for `jfy_check_trouble`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_check_trouble`;
CREATE TABLE `jfy_check_trouble` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0:未处理 1:已处理',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_check_trouble
-- ----------------------------
INSERT INTO `jfy_check_trouble` VALUES ('1', '1', 'trouble', 'trouble', '0', '1500979832', '1500979832');
INSERT INTO `jfy_check_trouble` VALUES ('3', '1', '阿萨德阿萨德是是是', '<p>阿萨德阿萨德阿萨德阿萨德阿萨德阿萨德阿萨德地点</p>', '0', '1501074793', '1501235883');
INSERT INTO `jfy_check_trouble` VALUES ('4', '1', '阿萨德', '<p>阿萨德阿萨德按时</p>', '0', '1501235891', '0');
INSERT INTO `jfy_check_trouble` VALUES ('5', '1', '是是是', '<p>阿萨德</p>', '0', '1501235906', '0');
INSERT INTO `jfy_check_trouble` VALUES ('6', '5', 'werewr', '<p>12312</p>', '0', '1501241901', '0');
INSERT INTO `jfy_check_trouble` VALUES ('7', '5', '123123', '<p>123123213</p>', '0', '1501241910', '0');
INSERT INTO `jfy_check_trouble` VALUES ('8', '4', '这是事故', '<p>这是事故<br></p>', '0', '1501244529', '0');
INSERT INTO `jfy_check_trouble` VALUES ('9', '4', '22', '<p>2222</p>', '0', '1501244606', '0');
INSERT INTO `jfy_check_trouble` VALUES ('10', '4', '测试002', '<p>按时打算打算的</p>', '1', '1501247492', '1501654620');
INSERT INTO `jfy_check_trouble` VALUES ('11', '4', '你有个事故', '<p>上海喵神11上海喵神11上海喵神11上海喵神11上海喵神11<br></p>', '1', '1501471055', '1501839491');
INSERT INTO `jfy_check_trouble` VALUES ('12', '4', '阿打算', '<p>阿萨德</p>', '0', '1501844128', '1501844128');

-- ----------------------------
-- Table structure for `jfy_company`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company`;
CREATE TABLE `jfy_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL,
  `type` enum('hospital','community','hotel','station','colliery','education','building') NOT NULL DEFAULT 'hospital' COMMENT '行业:hospital 医院,community 社区,hotel 酒店,station 加油站,colliery 煤矿,education 教育,building 建筑',
  `source` varchar(255) DEFAULT NULL COMMENT '账户来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company
-- ----------------------------
INSERT INTO `jfy_company` VALUES ('1', '1', '1111', '18521722857', '1500974712', '0', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('2', '21', '2222', '15516517307', '1500974712', '0', 'hospital', 'jfb');
INSERT INTO `jfy_company` VALUES ('3', '196', '上海喵神', '18818223461', '1501038553', '0', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('4', '197', '阳光家政', '18272878105', '1501038553', '0', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('5', '198', '昆山第一人民医院', '13917771101', '1501038553', '0', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('6', '199', '安鑫家政', '18521722837', '1502770677', '1502770677', 'community', null);
INSERT INTO `jfy_company` VALUES ('10', '203', '上海建筑', '18272878100', '1505191392', '1505191392', 'building', null);
INSERT INTO `jfy_company` VALUES ('11', '210', '上海喵神', '18818223462', '1506495453', '1506495453', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('13', '220', '喵神网络', '18818223463', '1510730266', '1510730266', 'hospital', null);
INSERT INTO `jfy_company` VALUES ('14', '221', '测试账号002', '18272878107', '1511409513', '1511409513', 'community', null);
INSERT INTO `jfy_company` VALUES ('15', '222', 'zhou', '15039541345', '1511775068', '1511775068', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('18', '226', '周周', '15039541346', '1512370314', '1512370314', 'community', null);
INSERT INTO `jfy_company` VALUES ('21', '203', '这是家政公司222', '18817800000', '1512374707', '1512374707', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('23', '216', 'staff家政公司', '17811110000', '1513051784', '1513247202', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('57', '251', '这是家政公司11', '13671742189', '1513051784', '1513051784', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('58', '256', '上海刘刚', '18721235581', '1513239331', '1513239331', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('59', '257', '上海刘刚', '18721235583', '1513239423', '1513239423', 'community', 'jfb');
INSERT INTO `jfy_company` VALUES ('60', '263', '家政公司', '15516517000', '1513761402', '1513761402', 'community', 'jfb');

-- ----------------------------
-- Table structure for `jfy_company_gold_apply`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_gold_apply`;
CREATE TABLE `jfy_company_gold_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `company_name` varchar(255) NOT NULL COMMENT '家政公司名称',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `trades` varchar(255) NOT NULL COMMENT '从事工种',
  `experience` int(10) NOT NULL COMMENT '从事家政服务时间',
  `birthday` varchar(255) NOT NULL COMMENT '出生年份',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `house_keep_card` varchar(255) NOT NULL COMMENT '家政卡号',
  `bank_card` varchar(255) NOT NULL COMMENT '银行卡号',
  `cardID` varchar(20) NOT NULL COMMENT '身份证号',
  `skill_level` varchar(255) NOT NULL COMMENT '职业技能等级',
  `education` varchar(255) NOT NULL COMMENT '学历',
  `remark` text COMMENT '备注',
  `years` int(11) NOT NULL COMMENT '申请年份',
  `status` enum('wait','success','refuse') NOT NULL DEFAULT 'wait' COMMENT '状态:wait 等待 success 成功 refuse 拒绝',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_gold_apply
-- ----------------------------
INSERT INTO `jfy_company_gold_apply` VALUES ('2', '14', '测试账号002', '30', '张三', '保姆|长期钟点工|', '10', '1992', '18272878105', '-', '-', '412728199401206020', '高级保姆1', '初中', '这是备注1', '2017', 'success', '1511774581', '1511862588');
INSERT INTO `jfy_company_gold_apply` VALUES ('3', '15', 'zhou', '35', '刘力', '综合家政', '5', '1980', '15512345678', '-', '-', '523121198006241228', '中级家政服务员', '初中', '我是备注我是备注我是备注我是备注我是备注我是备注', '2017', 'success', '1511862105', '1511862513');
INSERT INTO `jfy_company_gold_apply` VALUES ('4', '15', 'zhou', '36', '王丽丽', '母婴保育', '2', '1982', '15712345678', '-', '-', '511123198210061228', '月嫂初级', '高中', '水水水水水水水水水水', '2017', 'wait', '1512025131', '1512025605');

-- ----------------------------
-- Table structure for `jfy_company_house_staff`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_house_staff`;
CREATE TABLE `jfy_company_house_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `name` varchar(255) NOT NULL COMMENT '家政员名称',
  `avatar` varchar(255) NOT NULL COMMENT '员工照片',
  `birthday` varchar(255) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `sex` enum('boy','girl') NOT NULL DEFAULT 'boy' COMMENT '性别',
  `mobile` varchar(11) NOT NULL COMMENT '电话',
  `now_district` text COMMENT '现居住省市区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `cardID` varchar(20) NOT NULL COMMENT '身份证号',
  `learn_experience` text COMMENT '学习经历',
  `work_experience` text COMMENT '工作经历',
  `society_experience` text COMMENT '社会经历',
  `crime_experience` text COMMENT '犯罪经历',
  `is_check` enum('y','n') NOT NULL DEFAULT 'n',
  `online` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '是否线上预约：y 是 n 否',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `nation` varchar(255) NOT NULL COMMENT '民族',
  `education` varchar(255) NOT NULL COMMENT '文化程度',
  `marriage` varchar(255) NOT NULL COMMENT '婚姻状况',
  `industry` varchar(255) DEFAULT NULL COMMENT '专业',
  `native_place` int(10) DEFAULT NULL COMMENT '籍贯',
  `native_place_district` text COMMENT '户籍地区',
  `native_place_address` varchar(255) DEFAULT NULL COMMENT '户籍详细地址',
  `is_dormitory` enum('y','n','unknown') NOT NULL DEFAULT 'unknown' COMMENT '是否住店:y 是;n 否;unknown 不确定',
  `is_post` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '是否上岗:y 是, n 否',
  `idcard_p` varchar(255) NOT NULL COMMENT '身份证正面照片',
  `idcard_n` varchar(255) NOT NULL COMMENT '身份证反面照片',
  `height` varchar(255) NOT NULL COMMENT '身高',
  `weight` varchar(255) NOT NULL COMMENT '体重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_house_staff
-- ----------------------------
INSERT INTO `jfy_company_house_staff` VALUES ('3', '6', '이더해', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\"]', '1501516800', 'girl', '13340330777', '', '发送到发送到', '522121199003115413', '个个人或任何热热大幅度发鬼地方', '个个人或任何热热大幅度发鬼地方', '分手大师单位违规收电费', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502792733', '1504098142', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('5', '4', 'chenM', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\"]', '1502899200', 'boy', '18272878105', '', '上海市', '412728199401206012', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502936520', '1504593985', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('6', '4', 'chenM1', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\"]', '1502899200', 'boy', '18272878105', '', '111111111111111', '412728199401201601', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502937445', '1504593986', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('7', '6', '王二麻子', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\"]', '1501689600', 'boy', '13340330735', '', '发送到发送到发送到', '522121199603022212', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502951511', '1502951511', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('8', '6', '张三', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\"]', '1501516800', 'boy', '13340330736', '', '说的方法上的发送到', '111121199803114512', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502951909', '1502951909', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('9', '6', '刘二腿', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\"]', '1501603200', 'boy', '13340330435', '', '放水电费水电费是', '512121199603145444', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502955349', '1502955349', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('12', '6', '爱新觉', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\"]', '1501603200', 'boy', '13340330735', '', '发生大幅度', '522121199606234567', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1502956949', '1502956949', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('13', '2', 'chenM', '[\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15012066419395.png\"]', '1503590400', 'boy', '18272878105', '', '3333', '412728199401206016', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'n', '1503643982', '1509094957', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('17', '6', '发送到2', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\"]', '1501516800', 'boy', '13004525210', '', '防守打法', '522131199003115412', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\",\"id\":\"39\"}]', 'y', 'y', '1503978449', '1503978883', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('18', '6', '周凯666', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\"]', '1501689600', 'boy', '15501456666', '', '发送到', '522121199202115412', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\",\"id\":\"39\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', 'y', 'y', '1503996820', '1504693439', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('20', '6', '吱吱吱', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\"]', '1504108800', 'boy', '15515515555', '', 'dsadsa', '411123199210104035', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"}]', 'y', 'y', '1504082506', '1504693641', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('21', '1', '萨达22', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\"]', '1504108800', 'boy', '18852123564', '{\"province\":\"360000\",\"city\":\"361000\",\"district\":\"361025\"}', '啊法国地方官大使馆犯得上个', '411123199210104036', null, null, null, 'null', 'y', 'y', '1504092599', '1508826217', '满族', '高中', '未婚', '', '140000', '{\"province\":\"360000\",\"city\":\"361000\",\"district\":\"361025\"}', '打发士大夫盛大官方噶地方', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('22', '1', '的撒旦', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014939774602.jpeg\"]', '1502812800', 'boy', '18521722888', '', '大家ask基督教ask打飞机啊时间', '411123199210104096', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424967679.png\",\"id\":\"35\"}]', 'y', 'y', '1504101095', '1504101467', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('23', '1', 'jkhjhj', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15011379181166.png\"]', '1502208000', 'girl', '18512345678', '', '1321132', '411123199510102356', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\",\"id\":\"36\"}]', 'y', 'y', '1504104318', '1504104352', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('24', '1', '3333', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014939774602.jpeg\"]', '1501603200', 'girl', '13312345678', '', 'fgsdgdfgdfg', '511123199210104034', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424967679.png\",\"id\":\"35\"}]', 'y', 'y', '1504105033', '1504602597', '', '', '', null, '0', '', '', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('25', '1', '蓝蓝', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\"]', '1504368000', 'girl', '15512345678', '{\"province\":\"630000\",\"city\":\"632600\",\"district\":\"632624\"}', '大发噶山豆根', '411123198605122356', '', '', '', 'null', 'y', 'y', '1504601185', '1504673511', '汉族', '本科', '未婚', '计算机', '210000', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210203\"}', '大师傅撒旦发送发噶', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('26', '2', 'chenM', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15012066419395.png\"]', '1504368000', 'boy', '18272878105', '{\"province\":\"420000\",\"city\":\"420600\",\"district\":\"420606\"}', '现居住地区', '412728199401206011', null, null, null, '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15012066419395.png\",\"id\":\"19\"}]', 'y', 'y', '1504601444', '1517454768', '汉族', '初中', '已婚', '', '210000', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210203\"}', '户籍详细地址户籍详细地址', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('27', '4', '222333', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908168421.jpeg\"]', '1504368000', 'boy', '18272878105', '{\"province\":\"360000\",\"city\":\"361100\",\"district\":\"361126\"}', 'whichType', '412728199401206013', '', '', '', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908168421.jpeg\",\"id\":\"31\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908156611.jpeg\",\"id\":\"30\"}]', 'y', 'y', '1504601802', '1504664574', '汉族', '初中', '已婚', '123123123', '210000', '{\"province\":\"420000\",\"city\":\"420600\",\"district\":\"420607\"}', 'whichType', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('28', '4', '张三', '[\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908168421.jpeg\"]', '1504368000', 'boy', '18272878105', '{\"province\":\"630000\",\"city\":\"632600\",\"district\":\"632625\"}', '户籍详细地址', '412728199401201603', null, null, null, 'null', 'y', 'y', '1504665287', '1504835862', '11', '初中', '已婚', '1', '210000', '{\"province\":\"420000\",\"city\":\"420600\",\"district\":\"420606\"}', '户籍详细地址', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('29', '2', '张伟', '[\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15012066419395.png\"]', '725299200', 'boy', '15516517307', '{\"province\":\"310000\",\"city\":\"310100\",\"district\":\"310117\"}', '2121221', '411222199212260531', null, null, null, 'null', 'y', 'y', '1505198988', '1509099455', '汉', '本科', '未婚', '', '410000', '{\"province\":\"410000\",\"city\":\"411200\",\"district\":\"411222\"}', '12121', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('30', '14', '张三', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '725299200', 'boy', '18272878105', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210203\"}', '这是现居住详细地址', '412728199401206020', null, null, null, 'null', 'n', 'y', '1511419081', '1511842715', '汉族', '初中', '已婚', '', '410000', '{\"province\":\"410000\",\"city\":\"411600\",\"district\":\"411624\"}', '这是*户籍详细地址', 'n', 'n', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('32', '14', 'chenM', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '1510156800', 'boy', '18272878105', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210202\"}', '这是联系地址', '412827199401206012', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\",\"id\":\"92\"}]', 'y', 'y', '1511844076', '1511856019', '汉族', '小学', '未婚', '1', '410000', '{\"province\":\"410000\",\"city\":\"411600\",\"district\":\"411624\"}', '这是*户籍详细地址', 'y', 'n', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('33', '14', '李四', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '1510675200', 'boy', '18272878105', '{\"province\":\"420000\",\"city\":\"420600\",\"district\":\"420602\"}', '这是联系地址', '412728199401206032', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"id\":\"93\"}]', 'y', 'y', '1511858586', '1511858586', '汉族', '未知', '未知', '专业', '410000', '{\"province\":\"410000\",\"city\":\"411600\",\"district\":\"411624\"}', '这是*户籍详细地址', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('34', '15', '张严', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347886302.png\",\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347823682.png\"]', '898099200', 'boy', '13312345678', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210202\"}', '高浮雕鬼地方', '512213198006182154', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552526098.jpeg\",\"id\":\"98\"}]', 'y', 'y', '1511855282', '1512117461', '汉族', '初中', '已婚', '', '410000', '{\"province\":\"410000\",\"city\":\"411600\",\"district\":\"411624\"}', '这是*户籍详细地址', 'y', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('35', '15', '刘力', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552225836.png\",\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347886302.png\"]', '330624000', 'girl', '15512345678', '{\"province\":\"140000\",\"city\":\"140800\",\"district\":\"140802\"}', '的发生发射点发生范德萨', '523121198006241228', null, null, null, 'null', 'y', 'y', '1511858310', '1512117459', '满族', '初中', '已婚', '实打实的', '410000', '{\"province\":\"410000\",\"city\":\"411600\",\"district\":\"411624\"}', '这是*户籍详细地址', 'n', 'y', '', '', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('36', '15', '王丽丽', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119247513114.png\"]', '402681600', 'girl', '15712345678', '', '', '511123198210061228', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552526098.jpeg\",\"id\":\"98\"}]', 'y', 'y', '1511925021', '1512117453', '汉族', '高中', '已婚', '', '210000', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210203\"}', '大王村25号', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552788724.png\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552225836.png\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('37', '14', '王二', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119210465970.jpeg\"]', '538070400', 'boy', '18272878105', '', '', '412728198701206012', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119210465970.jpeg\",\"id\":\"101\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"id\":\"93\"}]', 'y', 'y', '1512194967', '1512194967', '汉族', '硕士', '未婚', '', '420000', '{\"province\":\"420000\",\"city\":\"420700\",\"district\":\"420702\"}', '这是户籍详细地址', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('38', '14', '陈', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15121966055593.gif\"]', '-1071388800', 'boy', '18272878106', '', '', '412728193601206012', null, null, null, 'null', 'y', 'y', '1512196765', '1512196765', '汉族', '未知', '未知', '', '210000', '{\"province\":\"210000\",\"city\":\"210200\",\"district\":\"210203\"}', '*户籍详细地址：	', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119210465970.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('39', '15', '刘行', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119247513114.png\"]', '329587200', 'girl', '13312134516', '', '', '511123198006121465', null, null, null, 'null', 'y', 'y', '1512367105', '1512367105', '汉族', '未知', '未知', '', '420000', null, '这是户籍详细地址', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552783802.png\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552788724.png\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('40', '14', '麻子', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15121966055593.gif\"]', '758995200', 'boy', '18565236541', '{\"province\":\"310000\",\"city\":\"310100\",\"district\":\"310110\"}', '的撒实打这是现居住详细地址', '415728199401206038', null, null, null, 'null', 'y', 'y', '1512362566', '1512362566', '汉族', '未知', '未知', '', '0', null, '河南省沈丘县冯营乡', 'n', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119210465970.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('41', '21', '张伟', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15127286236308.png\"]', '-1483776000', 'boy', '15516517307', '', '', '320311770706001122', null, '啥地方梵蒂冈地方', null, 'null', 'n', 'y', '1516686415', '1516686415', '汉族', '未知', '未知', '', '310000', null, '河南', 'unknown', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15127286236308.png\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15127286236308.png\"]', '1', '1');
INSERT INTO `jfy_company_house_staff` VALUES ('42', '21', '王王', '[\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15129846776177.jpeg\"]', '-787305600', 'boy', '18272878106', '', '', '412728194501206012', null, null, null, 'null', 'y', 'y', '1512984698', '1513580644', '汉族', '未知', '未知', '', '0', null, '户籍详细地址', 'y', 'y', '[\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15129846776177.jpeg\"]', '[\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15127286236308.png\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('43', '23', '刘玉', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130558282608.png\"]', '718646400', 'girl', '13312345678', '{\"province\":\"310000\",\"city\":\"310100\",\"district\":\"310110\"}', '的撒旦撒士大夫士大夫地方', '411123199210104034', null, null, null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130566295297.png\",\"id\":\"113\"}]', 'n', 'y', '1513308285', '1513308285', '汉族', '高中', '已婚', '', '410000', null, '河南省漯河市源汇区空中郭乡', 'n', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130565277079.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130565273680.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('44', '23', '张伟', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130567714940.png\"]', '-1483776000', 'boy', '15516517307', '', '', '610523199405190014', null, null, null, 'null', 'n', 'y', '1513058128', '1513058447', '汉族', '大专', '已婚', '', '410000', null, '河南省三门峡市撒士大夫似的', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130567852413.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130567856337.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('45', '21', '麻子', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130804883642.jpeg\"]', '758995200', 'boy', '18956324576', '', '', '412728199401206012', null, '', null, '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805009867.jpeg\",\"id\":\"119\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130804883642.jpeg\",\"id\":\"118\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15127286236308.png\",\"id\":\"106\"}]', 'n', 'y', '1513741541', '1513741541', '汉族', '未知', '未知', '', '420000', null, '户籍详细地址', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805009867.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('47', '21', '张龙', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\"]', '-503308800', 'girl', '18276985412', '', '', '412728195401206012', null, null, null, 'null', 'n', 'y', '1513224388', '1513580529', '汉族', '未知', '未知', '', '0', null, '*户籍详细地址', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('48', '57', '张伟', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130815053332.png\"]', '725299200', 'boy', '15516517307', '', '', '411222199212260531', null, null, null, 'null', 'n', 'y', '1513081525', '1513081525', '汉族', '未知', '未知', '', '0', null, '河南', 'y', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130815053332.png\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130815053332.png\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('49', '23', '李欢', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130558282608.png\"]', '171734400', 'girl', '13312345678', '{\"province\":\"360000\",\"city\":\"360400\",\"district\":\"360402\"}', '官方的公司的发放的', '512123197506122365', null, null, null, 'null', 'n', 'y', '1513245108', '1513245108', '汉族', '初中', '已婚已育', '', '210000', null, '事发地告诉对方嘎发', 'n', 'y', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130567852413.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130567856337.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('50', '21', '张龙', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\"]', '-1197619200', 'boy', '18245651256', '', '', '412728193201206012', null, '1.asdddddddd\n2asdddddddddd\n3ffffffffff', null, 'null', 'n', 'y', '1513741236', '1513741415', '汉族', '未知', '未知', '', '310000', null, '户籍详细地址', 'y', 'n', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805009867.jpeg\"]', '[\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130804883642.jpeg\"]', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('51', '2', '张伟', 'null', '725299200', 'boy', '15516517307', '', '', '411222199212260532', null, '32132132132', null, 'null', 'n', 'y', '1516861055', '1516861055', '汉族', '本科', '未婚', '', '310000', null, '3132132132132', 'unknown', 'y', 'null', 'null', '167', '80');
INSERT INTO `jfy_company_house_staff` VALUES ('52', '58', '张伟', 'null', '725299200', 'boy', '15516517307', '', '', '411222199212260531', null, '', null, 'null', 'n', 'y', '1517801670', '1517801670', '汉族', '未知', '未知', '', '0', null, '321321321', 'unknown', 'y', 'null', 'null', '', '');
INSERT INTO `jfy_company_house_staff` VALUES ('53', '58', '张伟2', 'null', '725299200', 'boy', '15516517307', '', '', '411222199212260532', null, '', null, 'null', 'n', 'y', '1517801706', '1517801706', '汉族', '未知', '未知', '', '0', null, '32132132', 'unknown', 'y', 'null', 'null', '', '');

-- ----------------------------
-- Table structure for `jfy_company_house_staff_card`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_house_staff_card`;
CREATE TABLE `jfy_company_house_staff_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `name` varchar(255) NOT NULL COMMENT '发卡银行',
  `card_bn` varchar(255) NOT NULL COMMENT '卡号',
  `end_time` int(10) NOT NULL COMMENT '截至有效期',
  `is_check` enum('y','n') DEFAULT 'n',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_house_staff_card
-- ----------------------------
INSERT INTO `jfy_company_house_staff_card` VALUES ('34', '6', '20', '121321', '121312131', '1503936000', 'y', '1504088979', '1504088979');
INSERT INTO `jfy_company_house_staff_card` VALUES ('35', '2', '13', '4234', '255555555555', '1504022400', 'y', '1504089788', '1504167558');
INSERT INTO `jfy_company_house_staff_card` VALUES ('36', '1', '21', '建设银行上海支行', '784531321321321', '1502208000', 'y', '1504092738', '1504092795');
INSERT INTO `jfy_company_house_staff_card` VALUES ('37', '1', '22', '上海银行得到', '45121212312121321321', '1502985600', 'y', '1504101268', '1504101275');
INSERT INTO `jfy_company_house_staff_card` VALUES ('38', '1', '25', '洛阳银行', '6121211213211234', '1506441600', 'y', '1504602579', '1504602579');
INSERT INTO `jfy_company_house_staff_card` VALUES ('39', '1', '24', '漯河银行', '2123145213184631', '1506700800', 'y', '1504602597', '1504602597');
INSERT INTO `jfy_company_house_staff_card` VALUES ('40', '6', '18', '北京银行东城区支行', '6214622217771199', '1599321600', 'y', '1504693403', '1504693439');
INSERT INTO `jfy_company_house_staff_card` VALUES ('41', '4', '28', '招商银行', '411465432164631', '1505145600', 'y', '1504835862', '1504835862');
INSERT INTO `jfy_company_house_staff_card` VALUES ('42', '2', '29', '银行', '21321321', '1509033600', 'y', '1509099007', '1509099091');

-- ----------------------------
-- Table structure for `jfy_company_license`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_license`;
CREATE TABLE `jfy_company_license` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `name` varchar(255) NOT NULL COMMENT '执照名称',
  `img_url` text NOT NULL COMMENT '图片路径',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_license
-- ----------------------------
INSERT INTO `jfy_company_license` VALUES ('5', '4', ' 营业执照', '[{\"id\":\"32\",\"url\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\"}]', '1502870646', '1502870646');
INSERT INTO `jfy_company_license` VALUES ('6', '4', '安全证书11', '[{\"id\":\"32\",\"url\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\"},{\"id\":\"31\",\"url\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908168421.jpeg\"},{\"id\":\"30\",\"url\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908156611.jpeg\"}]', '1502870919', '1502870998');
INSERT INTO `jfy_company_license` VALUES ('7', '1', '11', '[{\"id\":\"36\",\"url\":\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15017424964578.png\"}]', '1504089714', '1504089714');
INSERT INTO `jfy_company_license` VALUES ('8', '1', '由于i啊速度不', '[{\"id\":\"18\",\"url\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15011379181166.png\"}]', '1504101732', '1504101732');
INSERT INTO `jfy_company_license` VALUES ('9', '2', 'ddd', '[{\"id\":\"57\",\"url\":\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15090870953055.jpeg\"}]', '1509094627', '1509094627');

-- ----------------------------
-- Table structure for `jfy_company_staff_ability_cert`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_ability_cert`;
CREATE TABLE `jfy_company_staff_ability_cert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `type` enum('society','government') NOT NULL DEFAULT 'society' COMMENT '类型:society 协会  government 政府',
  `img_url` text NOT NULL COMMENT '图片路径',
  `level` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '证书等级: 1专项级 2 初级 3 中级 4 高级',
  `cert_bn` varchar(255) NOT NULL COMMENT '证书编号',
  `issued` varchar(255) NOT NULL COMMENT '发证机关',
  `train_course` varchar(255) NOT NULL COMMENT '培训内容',
  `train_time` int(11) NOT NULL COMMENT '培训时间',
  `train_score` varchar(255) NOT NULL COMMENT '培训成绩',
  `train_organization` varchar(255) NOT NULL COMMENT '培训机构',
  `train_periods` varchar(255) DEFAULT NULL COMMENT '培训课时',
  `skill` varchar(255) DEFAULT NULL COMMENT '所学技能',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态:y 正常 n 作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_check` enum('y','n') NOT NULL DEFAULT 'n',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_ability_cert
-- ----------------------------
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('16', '1', '19', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15011379181166.png\",\"id\":\"18\"}]', '1', '321121312', '卡死了发', '放假撒扩大飞机啊健身房', '1503936000', '90', '手动阀士大夫嘎嘎', '60', null, 'y', '法撒旦发噶士大夫', 'n', '1504007677', '1504007677');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('17', '1', '19', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15011379181166.png\",\"id\":\"18\"}]', '1', '23132132', 'fsdaf', 'fsdfs发士大夫', '1503936000', '80', '打发士大夫', '', '家具保洁，日常烹饪', 'y', '备注', 'n', '1504009677', '1504009677');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('24', '2', '13', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15012066419395.png\",\"id\":\"19\"}]', '1', '2222222', '发送到', '发送到上帝sd', '1503504000', '的发送到', '上帝发送到', null, '浮动上帝', 'y', '上帝发送到水电费', 'y', '1504083422', '1504083422');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('25', '6', '20', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"}]', '2', '22222', '能力人社局', '水电费sdf', '1501516800', '发上帝', '防守打法 ', null, '防守打法上帝', 'y', '发送到', 'y', '1504084160', '1504084160');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('26', '6', '20', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"}]', '1', '444444', '是对方的说法', '浮动上帝第三方', '1502035200', ' 发送到', '地方上帝', '30', null, 'y', '东方闪电', 'y', '1504084271', '1504084271');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('27', '6', '20', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\",\"id\":\"39\"}]', '1', '234234234234234', '上海市人力资源和社会保障局', '东方闪电', '1503244800', '辅导费', '发送到上帝', null, '0000000000000000000000000', 'y', '发送到上帝', 'y', '1504085416', '1504099698');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('28', '6', '20', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"}]', '2', '2222', '上海市家庭服务业行业协会', '浮动上帝第三方', '1504800000', ' 发送到', '地方上帝', '2123123', null, 'y', '东方闪电123123', 'y', '1504093971', '1504099708');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('29', '1', '21', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\",\"id\":\"36\"}]', '2', '12132132', '地方都很贵', '花见花开和', '1501603200', '100', '更好看就看过', null, '100', 'y', '12132', 'y', '1504098550', '1504098550');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('30', '1', '21', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15011379181166.png\",\"id\":\"18\"}]', '4', '的撒旦', '阿三顶顶', '倒萨', '1502208000', '1', '1', '1', null, 'y', '1撒地方', 'y', '1504098684', '1504098684');
INSERT INTO `jfy_company_staff_ability_cert` VALUES ('31', '1', '22', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014939774602.jpeg\",\"id\":\"33\"}]', '2', '45456454465', '上海市人力资源和社会保障局', '倒萨 的阿三', '1502985600', '500', '大苏打', null, '及', 'y', '', 'y', '1504101416', '1504101467');

-- ----------------------------
-- Table structure for `jfy_company_staff_apply_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_apply_log`;
CREATE TABLE `jfy_company_staff_apply_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `apply_id` int(10) NOT NULL COMMENT '申请ID',
  `content` varchar(255) NOT NULL COMMENT '日志内容',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_apply_log
-- ----------------------------
INSERT INTO `jfy_company_staff_apply_log` VALUES ('34', '6', '18', '5', '健康体检申请添加成功', '1504003152', '1504003152');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('35', '6', '18', '5', '健康体检申请更新成功', '1504003273', '1504003273');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('36', '6', '18', '5', '健康体检申请提交成功', '1504003533', '1504003533');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('37', '6', '18', '1', '服务培训报名添加成功', '1504059586', '1504059586');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('38', '6', '18', '1', '服务培训报名提交成功', '1504060080', '1504060080');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('39', '6', '12', '2', '服务培训报名添加成功', '1504066149', '1504066149');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('40', '6', '9', '3', '服务培训报名添加成功', '1504068308', '1504068308');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('41', '6', '8', '4', '服务培训报名添加成功', '1504070991', '1504070991');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('42', '6', '3', '5', '服务培训报名添加成功', '1504073882', '1504073882');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('43', '6', '17', '6', '服务培训报名添加成功', '1504075292', '1504075292');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('44', '6', '17', '6', '服务培训报名申请更新成功', '1504076212', '1504076212');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('45', '6', '3', '5', '服务培训报名申请更新成功', '1504076220', '1504076220');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('46', '6', '17', '6', '服务培训报名申请更新成功', '1504076288', '1504076288');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('47', '6', '17', '6', '服务培训报名申请更新成功', '1504076481', '1504076481');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('48', '1', '21', '6', '健康体检申请添加成功', '1504099124', '1504099124');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('49', '1', '21', '6', '健康体检申请更新成功', '1504099137', '1504099137');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('50', '1', '21', '6', '健康体检申请提交成功', '1504099193', '1504099193');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('51', '1', '21', '6', '健康体检申请已接收，请等待审核处理', '1504099252', '1504099252');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('52', '1', '21', '7', '服务培训报名添加成功', '1504099363', '1504099363');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('53', '1', '21', '7', '服务培训报名申请更新成功', '1504099414', '1504099414');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('54', '1', '21', '7', '服务培训报名提交成功', '1504099422', '1504099422');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('55', '1', '21', '7', '服务培训报名申请已拒绝，理由：2132121311321123121', '1504099924', '1504099924');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('56', '1', '21', '6', '健康体检申请已审核完成', '1504101511', '1504101511');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('57', '1', '21', '7', '服务培训报名申请更新成功', '1504101575', '1504101575');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('58', '1', '21', '7', '服务培训报名提交成功', '1504101578', '1504101578');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('59', '1', '21', '7', '服务培训报名申请已接收，请等待审核处理', '1504101594', '1504101594');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('60', '4', '6', '7', '健康体检申请添加成功', '1504108902', '1504108902');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('61', '4', '5', '8', '服务培训报名添加成功', '1504168189', '1504168189');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('62', '4', '6', '9', '服务培训报名添加成功', '1504168950', '1504168950');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('63', '4', '6', '9', '服务培训报名申请更新成功', '1504168963', '1504168963');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('64', '4', '6', '9', '服务培训报名申请更新成功', '1504233647', '1504233647');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('65', '4', '27', '8', '健康体检申请添加成功', '1504662815', '1504662815');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('66', '4', '27', '8', '健康体检申请更新成功', '1504664631', '1504664631');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('67', '4', '27', '10', '服务培训报名添加成功', '1504665198', '1504665198');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('68', '4', '28', '11', '服务培训报名添加成功', '1504665741', '1504665741');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('69', '4', '28', '11', '服务培训报名申请更新成功', '1504665748', '1504665748');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('70', '1', '21', '12', '服务培训报名添加成功', '1504665838', '1504665838');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('71', '1', '21', '13', '服务培训报名添加成功', '1504666982', '1504666982');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('72', '1', '21', '14', '服务培训报名添加成功', '1504667461', '1504667461');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('73', '1', '25', '9', '健康体检申请添加成功', '1504681882', '1504681882');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('74', '4', '28', '10', '健康体检申请添加成功', '1504749944', '1504749944');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('75', '4', '28', '15', '服务培训报名添加成功', '1504750029', '1504750029');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('76', '4', '28', '15', '服务培训报名申请更新成功', '1504750033', '1504750033');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('77', '2', '29', '11', '健康体检申请添加成功', '1509088831', '1509088831');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('78', '15', '34', '12', '健康体检申请添加成功', '1511861725', '1511861725');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('79', '15', '34', '12', '健康体检申请更新成功', '1511861907', '1511861907');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('80', '15', '34', '16', '服务培训报名添加成功', '1511862006', '1511862006');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('81', '14', '33', '13', '健康体检申请添加成功', '1511863497', '1511863497');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('82', '14', '33', '17', '服务培训报名添加成功', '1511863610', '1511863610');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('83', '15', '36', '14', '健康体检申请添加成功', '1511926724', '1511926724');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('84', '15', '36', '15', '健康体检申请添加成功', '1511926910', '1511926910');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('85', '15', '36', '16', '健康体检申请添加成功', '1511927011', '1511927011');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('86', '15', '36', '18', '服务培训报名添加成功', '1511927048', '1511927048');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('87', '15', '39', '17', '健康体检申请添加成功', '1512363200', '1512363200');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('88', '15', '39', '19', '服务培训报名添加成功', '1512363241', '1512363241');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('89', '23', '44', '18', '健康体检申请添加成功', '1513058645', '1513058645');
INSERT INTO `jfy_company_staff_apply_log` VALUES ('90', '23', '44', '20', '服务培训报名添加成功', '1513058661', '1513058661');

-- ----------------------------
-- Table structure for `jfy_company_staff_demand`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_demand`;
CREATE TABLE `jfy_company_staff_demand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `demand` text NOT NULL COMMENT '工作范围',
  `expected_salary` varchar(255) NOT NULL COMMENT '期望薪酬',
  `good_cuisine` text NOT NULL COMMENT '擅长菜系',
  `cook_taste` varchar(255) DEFAULT NULL COMMENT '做饭口味',
  `is_home` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否住家:y 住家 n 不住家',
  `work_time` text NOT NULL COMMENT '工作时间',
  `is_check` enum('y','n') NOT NULL DEFAULT 'n',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `work_picture` text COMMENT '工作照',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_demand
-- ----------------------------
INSERT INTO `jfy_company_staff_demand` VALUES ('4', '6', '17', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '30000', '[{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"}]', '偏甜', 'n', '{\"full\":\"part\",\"part\":{\"weekTime\":[{\"index\":\"1\",\"value\":\"\\u5468\\u4e8c\"},{\"index\":\"2\",\"value\":\"\\u5468\\u4e09\"},{\"index\":\"1\",\"value\":\"\\u5468\\u4e8c\"},{\"index\":\"2\",\"value\":\"\\u5468\\u4e09\"},{\"index\":\"1\",\"value\":\"\\u5468\\u4e8c\"},{\"index\":\"2\",\"value\":\"\\u5468\\u4e09\"}],\"startTime\":\"06:15\",\"endTime\":\"07:00\"}}', 'n', '1503995212', '1503996715', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('5', '6', '20', '[{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '111', '[{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"}]', '偏咸', 'n', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1504089246', '1504097545', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('6', '2', '13', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '100', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"}]', '偏咸', 'y', '{\"full\":\"part\",\"part\":{\"weekTime\":[{\"index\":\"0\",\"value\":\"\\u5468\\u4e00\"},{\"index\":\"0\",\"value\":\"\\u5468\\u4e00\"}],\"startTime\":\"06:30\",\"endTime\":\"07:00\"}}', 'n', '1504090096', '1504090130', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('8', '1', '21', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"2\",\"value\":\"\\u770b\\u62a4\\u8001\\u4eba\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"2\",\"value\":\"\\u770b\\u62a4\\u8001\\u4eba\"}]', '1000', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"}]', '偏咸', 'y', '{\"full\":\"nopart\",\"part\":{\"weekTime\":[{\"index\":\"0\",\"value\":\"\\u5468\\u4e00\"},{\"index\":\"1\",\"value\":\"\\u5468\\u4e8c\"}],\"startTime\":\"06:00\",\"endTime\":\"11:00\"}}', 'n', '1504095628', '1504095677', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('9', '6', '18', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '11', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"}]', '偏咸', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1504097160', '1504097160', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('10', '6', '3', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"}]', '111', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"7\",\"value\":\"\\u5fbd\\u83dc\"}]', '偏甜', 'y', '{\"full\":\"part\",\"part\":{\"startTime\":\"06:15\",\"endTime\":\"06:30\"},\"weekTime\":[{\"index\":1,\"value\":\"\\u5468\\u4e8c\"},{\"index\":2,\"value\":\"\\u5468\\u4e09\"},{\"index\":3,\"value\":\"\\u5468\\u56db\"},{\"index\":4,\"value\":\"\\u5468\\u4e94\"}]}', 'n', '1504097598', '1504098142', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('11', '1', '22', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '50000', '[{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"1\",\"value\":\"\\u9c81\\u83dc\"},{\"index\":\"2\",\"value\":\"\\u7ca4\\u83dc\"}]', '面食', 'n', '{\"full\":\"part\",\"part\":{\"startTime\":\"06:00\",\"endTime\":\"08:45\"},\"weekTime\":[{\"index\":1,\"value\":\"\\u5468\\u4e8c\"},{\"index\":2,\"value\":\"\\u5468\\u4e09\"},{\"index\":1,\"value\":\"\\u5468\\u4e8c\"},{\"index\":2,\"value\":\"\\u5468\\u4e09\"}]}', 'n', '1504101194', '1504101210', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('12', '4', '28', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"}]', '100', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"}]', '偏咸', 'n', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"},\"weekTime\":[]}', 'n', '1504767412', '1504767421', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('13', '14', '30', '[{\"index\":\"0\",\"value\":\"\\u4fdd\\u59c6\"},{\"index\":\"1\",\"value\":\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"}]', '100', '[{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"},{\"index\":\"0\",\"value\":\"\\u5ddd\\u83dc\"}]', '偏咸', 'n', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"},\"weekTime\":[]}', 'n', '1504767412', '1504767421', null);
INSERT INTO `jfy_company_staff_demand` VALUES ('14', '14', '32', '[\"\\u4fdd\\u59c6\",\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"]', '1000', '[\"\\u9c81\\u83dc\",\"\\u5ddd\\u83dc\"]', '偏辣', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1511844076', '1511844076', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"id\":\"93\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\",\"id\":\"92\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('15', '14', '33', '[\"\\u4fdd\\u59c6\",\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\",\"\\u770b\\u62a4\\u8001\\u4eba\"]', '10000', '[\"\\u5ddd\\u83dc\",\"\\u6e58\\u83dc\"]', '偏甜', 'n', '{\"full\":\"part\",\"part\":{\"startTime\":\"06:00\",\"endTime\":\"06:15\"},\"weekTime\":[\"\\u5468\\u4e00\",\"\\u5468\\u4e8c\"]}', 'n', '1511847935', '1511858586', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"id\":\"93\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('16', '15', '34', '[\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\"]', '6000', '[\"\\u5ddd\\u83dc\",\"\\u9c81\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1511855282', '1511855282', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552225836.png\",\"id\":\"97\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552783802.png\",\"id\":\"100\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552788724.png\",\"id\":\"99\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('17', '15', '35', '[\"\\u4fdd\\u59c6\",\"\\u957f\\u671f\\u949f\\u70b9\\u5de5\",\"\\u770b\\u62a4\\u8001\\u4eba\"]', '6000', '[\"\\u9c81\\u83dc\",\"\\u7ca4\\u83dc\",\"\\u5ddd\\u83dc\"]', '面食', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1511855529', '1511858310', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552783802.png\",\"id\":\"100\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('18', '15', '36', '[\"\\u949f\\u70b9\\u5de5\"]', '5000', '[\"\\u5ddd\\u83dc\",\"\\u9762\\u98df\",\"\\u70b9\\u5fc3\",\"\\u9c81\\u83dc\"]', '', 'y', '{\"full\":\"part\",\"part\":{\"startTime\":\"10:30\",\"endTime\":\"19:30\"},\"weekTime\":[\"\\u5468\\u4e00\",\"\\u5468\\u4e8c\",\"\\u5468\\u56db\",\"\\u5468\\u4e09\",\"\\u5468\\u4e94\"]}', 'n', '1511925021', '1511925021', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347886302.png\",\"id\":\"95\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347823682.png\",\"id\":\"94\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('19', '14', '37', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\",\"\\u80b2\\u513f\\u5ac2\",\"\\u6708\\u5ac2\"]', '8000', '[\"\\u5ddd\\u83dc\",\"\\u9c81\\u83dc\",\"\\u7ca4\\u83dc\"]', '', 'n', '{\"full\":\"part\",\"part\":{\"startTime\":\"06:45\",\"endTime\":\"07:00\"},\"weekTime\":[\"\\u5468\\u4e00\",\"\\u5468\\u4e8c\"]}', 'n', '1511925940', '1512194967', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15119210465970.jpeg\",\"id\":\"101\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114209228587.jpeg\",\"id\":\"93\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15114190737604.jpeg\",\"id\":\"92\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('20', '14', '38', '[\"\\u949f\\u70b9\\u5de5\"]', '1111', '[\"\\u5ddd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"06:15\",\"endTime\":\"06:30\"},\"weekTime\":[\"\\u5468\\u4e8c\",\"\\u5468\\u4e00\",\"\\u5468\\u65e5\"]}', 'n', '1512196234', '1512196765', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('21', '15', '39', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '5000', '[\"\\u5ddd\\u83dc\",\"\\u5fbd\\u83dc\",\"\\u9762\\u98df\",\"\\u6d59\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1512362361', '1512367105', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347886302.png\",\"id\":\"95\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118347823682.png\",\"id\":\"94\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('22', '14', '40', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '1', '[\"\\u5ddd\\u83dc\",\"\\u70b9\\u5fc3\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1512362494', '1512362566', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('23', '21', '41', '[\"\\u949f\\u70b9\\u5de5\",\"\\u80b2\\u513f\\u5ac2\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '20', '[\"\\u5ddd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1512728676', '1516686415', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\",\"id\":\"120\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805009867.jpeg\",\"id\":\"119\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('24', '21', '42', '[\"\\u949f\\u70b9\\u5de5\"]', '123', '[\"\\u5ddd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1512984698', '1512984698', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('25', '23', '43', '[\"\\u80b2\\u513f\\u5ac2\"]', '8000', '[\"\\u5ddd\\u83dc\",\"\\u9c81\\u83dc\",\"\\u82cf\\u83dc\",\"\\u9762\\u98df\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513056635', '1513308285', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130565839768.png\",\"id\":\"112\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130565741272.png\",\"id\":\"111\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('26', '23', '44', '[\"\\u949f\\u70b9\\u5de5\"]', '3000', '[\"\\u9762\\u98df\",\"\\u9c81\\u83dc\",\"\\u5ddd\\u83dc\",\"\\u82cf\\u83dc\",\"\\u6d59\\u83dc\"]', '', 'n', '{\"full\":\"part\",\"part\":{\"startTime\":\"10:00\",\"endTime\":\"20:00\"},\"weekTime\":[\"\\u5468\\u4e00\",\"\\u5468\\u4e8c\",\"\\u5468\\u4e09\",\"\\u5468\\u56db\",\"\\u5468\\u4e94\"]}', 'n', '1513056935', '1513058128', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130568226540.jpeg\",\"id\":\"117\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('27', '21', '45', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '22', '[\"\\u5ddd\\u83dc\",\"\\u9c81\\u83dc\"]', '', 'n', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513080515', '1513741541', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\",\"id\":\"120\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('28', '21', '47', '[\"\\u949f\\u70b9\\u5de5\"]', '11', '[\"\\u5ddd\\u83dc\",\"\\u5fbd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513081076', '1513224388', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\",\"id\":\"120\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805009867.jpeg\",\"id\":\"119\"},{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130804883642.jpeg\",\"id\":\"118\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('29', '57', '48', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '2000', '[\"\\u5ddd\\u83dc\",\"\\u6e58\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513081525', '1513081525', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130815053332.png\",\"id\":\"121\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('30', '23', '49', '[\"\\u517b\\u8001\\u7167\\u62a4\"]', '5000', '[\"\\u9762\\u98df\",\"\\u7ca4\\u83dc\",\"\\u6d59\\u83dc\",\"\\u5ddd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513245108', '1513245108', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130568226540.jpeg\",\"id\":\"117\"}]');
INSERT INTO `jfy_company_staff_demand` VALUES ('31', '21', '50', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '1', '[\"\\u5ddd\\u83dc\",\"\\u897f\\u9910\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1513741236', '1513741236', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('32', '2', '51', '[\"\\u949f\\u70b9\\u5de5\",\"\\u517b\\u8001\\u7167\\u62a4\"]', '200', '[\"\\u5ddd\\u83dc\",\"\\u5fbd\\u83dc\"]', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1516260151', '1516861055', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('33', '58', '52', 'null', '', 'null', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1517801670', '1517801670', 'null');
INSERT INTO `jfy_company_staff_demand` VALUES ('34', '58', '53', 'null', '', 'null', '', 'y', '{\"full\":\"nopart\",\"part\":{\"startTime\":\"\",\"endTime\":\"\"}}', 'n', '1517801706', '1517801706', 'null');

-- ----------------------------
-- Table structure for `jfy_company_staff_health_apply`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_health_apply`;
CREATE TABLE `jfy_company_staff_health_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `education` varchar(255) NOT NULL COMMENT '文化程度',
  `native_place` varchar(255) NOT NULL COMMENT '籍贯',
  `native_place_address` varchar(255) NOT NULL COMMENT '户籍所在地',
  `now_address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `service_content` text NOT NULL COMMENT '服务内容',
  `service_style` enum('time','home','all') NOT NULL DEFAULT 'time' COMMENT '服务形式: time 小时工 home 住家制 all 全日制',
  `service_year` int(10) NOT NULL COMMENT '从事服务年限',
  `reservation_time` int(10) NOT NULL COMMENT '预约时间',
  `reservation_address` varchar(255) NOT NULL COMMENT '预约地点',
  `contractors` varchar(255) NOT NULL COMMENT '承接单位',
  `report_address` varchar(255) NOT NULL COMMENT '报告送达地址',
  `status` enum('wait','active','accept','process','reject') NOT NULL DEFAULT 'wait' COMMENT '状态: wait 等待, active 正常, accept 已接受, process 已处理, reject 已拒绝',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_health_apply
-- ----------------------------
INSERT INTO `jfy_company_staff_health_apply` VALUES ('5', '6', '18', '大学', '东方闪电', '上海', '新华路', '021-62365323', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u8001\\u4eba\\u7167\\u62a4\",\"index\":\"2\"}]', 'home', '3', '1504003264', '和国际化概况', '东方闪电', '佛挡杀佛', 'active', '1504003152', '1504003533');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('6', '1', '21', '就会考虑', '1113211321132', '11321321321', '121321231321', '1213', '[{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u8001\\u4eba\\u7167\\u62a4\",\"index\":\"2\"},{\"name\":\"\\u7cbe\\u82f1\\u7ba1\\u5bb6\",\"index\":\"3\"}]', 'time', '2', '1504185422', 'jfk了解', '是会计的飞机啊士大夫精神的空间', '就是空间发士大夫', 'process', '1504099124', '1504101511');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('7', '4', '6', '1', '1', '1', '1', '1', '[{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"}]', 'time', '1', '1504108903', '1', '1', '1', 'wait', '1504108902', '1504108902');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('8', '4', '27', '初中', '辽宁省', '湖北省襄阳市襄州区whichType', '江西省上饶市弋阳县whichType', '5523652', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u8001\\u4eba\\u7167\\u62a4\",\"index\":\"2\"},{\"name\":\"\\u7cbe\\u82f1\\u7ba1\\u5bb6\",\"index\":\"3\"},{\"name\":\"\\u533b\\u9662\\u62a4\\u5de5\",\"index\":\"4\"},{\"name\":\"\\u65e5\\u95f4\\u7167\\u6599\",\"index\":\"5\"}]', 'home', '2', '1504835558', '上海市1', '喵神1', '新华路1', 'wait', '1504662815', '1504664631');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('9', '1', '25', '本科', '辽宁省', '辽宁省大连市西岗区大师傅撒旦发送发噶', '青海省果洛藏族自治州达日县大发噶山豆根', '0212132123', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u8001\\u4eba\\u7167\\u62a4\",\"index\":\"2\"}]', 'time', '1', '1504681872', '撒士大夫似的', '大师傅撒旦', '发射点', 'wait', '1504681882', '1504681882');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('10', '4', '28', '初中', '辽宁省', '湖北省襄阳市樊城区户籍详细地址', '青海省果洛藏族自治州久治县户籍详细地址', '18272878105', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"}]', 'time', '4', '1505873139', '11', '11', '11', 'wait', '1504749944', '1504749944');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('11', '2', '29', '本科', '河南省', '河南省三门峡市陕州区12121', '上海上海市松江区2121221', '7', '[{\"name\":\"\\u7cbe\\u82f1\\u7ba1\\u5bb6\",\"index\":\"3\"}]', 'time', '1', '1509088817', '上海', '上海', '上海', 'wait', '1509088831', '1509088831');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('12', '15', '34', '初中', '河南省', '这是*户籍详细地址', '辽宁省大连市中山区高浮雕鬼地方', '18521722857', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u8001\\u4eba\\u7167\\u62a4\",\"index\":\"2\"}]', 'time', '3', '1512034121', '第一人民医院', '第一人民医院', '新华路365弄', 'wait', '1511861725', '1511861907');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('13', '14', '33', '未知', '河南省', '这是*户籍详细地址', '湖北省襄阳市襄城区这是联系地址', '18272878105', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u5176\\u4ed6\",\"index\":\"7\"}]', 'time', '1', '1511863489', '上海喵神', '上海喵神', '上海喵神', 'wait', '1511863497', '1511863497');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('16', '15', '36', '高中', '辽宁省', '辽宁省大连市西岗区大王村25号', '', '18521722857', '[{\"name\":\"\\u6bcd\\u5a74\\u62a4\\u7406\",\"index\":\"1\"},{\"name\":\"\\u80b2\\u5a74\\u62a4\\u7406\",\"index\":\"6\"}]', 'home', '3', '1512013116', 'eqweqq', 'eqweq', 'weqw', 'wait', '1511927011', '1511927011');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('17', '15', '39', '未知', '', '这是户籍详细地址', '', '18521722857', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"},{\"name\":\"\\u5176\\u4ed6\",\"index\":\"7\"}]', 'time', '3', '1512535776', '第一人民医院', '第一人民医院', '新华路365', 'wait', '1512363200', '1512363200');
INSERT INTO `jfy_company_staff_health_apply` VALUES ('18', '23', '44', '大专', '河南省', '河南省三门峡市撒士大夫似的', '', '', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"0\"}]', 'home', '1', '1513317837', '十大士大夫士大夫', '大师傅似的', '发士大夫', 'wait', '1513058645', '1513058645');

-- ----------------------------
-- Table structure for `jfy_company_staff_health_card`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_health_card`;
CREATE TABLE `jfy_company_staff_health_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `health_level` varchar(255) DEFAULT NULL COMMENT '健康情况',
  `card_bn` varchar(20) NOT NULL COMMENT '卡号',
  `send_time` int(10) NOT NULL COMMENT '发放日期',
  `end_time` int(10) NOT NULL COMMENT '截至有效日期',
  `img_url` text NOT NULL COMMENT '图片路径',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态：y 正常 n 作废',
  `is_check` enum('y','n') DEFAULT 'n',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_health_card
-- ----------------------------
INSERT INTO `jfy_company_staff_health_card` VALUES ('62', '6', '20', '123123', '2017083096243', '1504022400', '1504108800', '', 'y', 'n', '1504083827', '1504083827');
INSERT INTO `jfy_company_staff_health_card` VALUES ('63', '2', '13', '第三方的444', '2017083022009', '1504022400', '1504108800', '', 'y', 'n', '1504086966', '1504090215');
INSERT INTO `jfy_company_staff_health_card` VALUES ('64', '1', '21', '不不健康', '2017083023841', '1501516800', '1533052800', '', 'y', 'n', '1504092649', '1504092677');
INSERT INTO `jfy_company_staff_health_card` VALUES ('65', '1', '22', '吉萨打法几乎', '2017083082061', '1503504000', '1502380800', '', 'y', 'n', '1504101287', '1504101287');
INSERT INTO `jfy_company_staff_health_card` VALUES ('66', '4', '6', '监控', '2017083146419', '1502985600', '1502812800', '', 'y', 'n', '1504169688', '1504169744');
INSERT INTO `jfy_company_staff_health_card` VALUES ('67', '4', '27', null, '2017090524267', '1504540800', '1504540800', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\",\"id\":\"32\"}]', 'y', 'n', '1504606058', '1504606567');
INSERT INTO `jfy_company_staff_health_card` VALUES ('68', '1', '25', null, '2017090590284', '1504195200', '1536076800', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15046053682395.png\",\"id\":\"40\"}]', 'y', 'n', '1504606946', '1504606946');
INSERT INTO `jfy_company_staff_health_card` VALUES ('69', '4', '28', null, '2017090673847', '1505318400', '1506614400', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908168421.jpeg\",\"id\":\"31\"}]', 'y', 'n', '1504669891', '1504669897');
INSERT INTO `jfy_company_staff_health_card` VALUES ('70', '2', '29', null, '2017102788175', '1507046400', '1509120000', '[{\"src\":\"http:\\/\\/192.168.199.156\\/zhianbao_api\\/images\\/15090870953055.jpeg\",\"id\":\"57\"}]', 'y', 'n', '1509087102', '1509087102');
INSERT INTO `jfy_company_staff_health_card` VALUES ('71', '15', '36', null, '2017113081100', '1511971200', '1543507200', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15118552788724.png\",\"id\":\"99\"}]', 'y', 'n', '1512023798', '1512023798');
INSERT INTO `jfy_company_staff_health_card` VALUES ('72', '21', '41', null, '2017121823893', '1513094400', '1545062400', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15127286236308.png\",\"id\":\"106\"}]', 'y', 'n', '1513580345', '1513580485');
INSERT INTO `jfy_company_staff_health_card` VALUES ('73', '21', '42', null, '2017121820746', '1513526400', '1513526400', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130804883642.jpeg\",\"id\":\"118\"}]', 'y', 'n', '1513580426', '1513580426');
INSERT INTO `jfy_company_staff_health_card` VALUES ('74', '21', '47', null, '2017121843305', '1513526400', '1545062400', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\",\"id\":\"120\"}]', 'y', 'n', '1513580528', '1513580528');

-- ----------------------------
-- Table structure for `jfy_company_staff_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_insurance`;
CREATE TABLE `jfy_company_staff_insurance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `title` varchar(255) NOT NULL COMMENT '保险记录标题',
  `content` varchar(255) DEFAULT NULL COMMENT '保险记录内容',
  `policy_bn` varchar(255) NOT NULL COMMENT '保单号',
  `insured_name` varchar(255) NOT NULL COMMENT '投保人',
  `end_time` int(10) NOT NULL COMMENT '截至有效期',
  `is_check` enum('y','n') DEFAULT 'n',
  `is_delete` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否删除: y 删除 n正常 ',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_insurance
-- ----------------------------
INSERT INTO `jfy_company_staff_insurance` VALUES ('11', '2', '13', '11152', '里面看没看了看', '', '', '1503922620', 'y', 'n', '1503912952', '1504083398');
INSERT INTO `jfy_company_staff_insurance` VALUES ('14', '6', '20', '健康保险', '大苏打撒', '132121321', '111', '1487001600', 'y', 'n', '1504089106', '1504693641');
INSERT INTO `jfy_company_staff_insurance` VALUES ('15', '2', '13', '23', '123123', '', '', '1504095420', 'y', 'n', '1504090004', '1504090004');
INSERT INTO `jfy_company_staff_insurance` VALUES ('16', '2', '13', '3443', '3443', '', '', '1504095420', 'y', 'n', '1504090017', '1504090017');
INSERT INTO `jfy_company_staff_insurance` VALUES ('17', '2', '13', '32', '32', '', '', '1504095420', 'y', 'n', '1504090033', '1504090033');
INSERT INTO `jfy_company_staff_insurance` VALUES ('18', '2', '13', '23', '23', '', '', '1504095420', 'y', 'n', '1504090051', '1504090051');
INSERT INTO `jfy_company_staff_insurance` VALUES ('19', '1', '21', '减肥哈士大夫', '打发士大夫', '', '', '1504095420', 'y', 'n', '1504092827', '1504097263');
INSERT INTO `jfy_company_staff_insurance` VALUES ('20', '1', '22', '白线记录', '5423534534', '', '', '1504095420', 'y', 'n', '1504101229', '1504101236');
INSERT INTO `jfy_company_staff_insurance` VALUES ('21', '4', '6', '1111', '111', '', '', '1504181820', 'y', 'n', '1504169463', '1504171972');
INSERT INTO `jfy_company_staff_insurance` VALUES ('27', '1', '25', '疾病险22', null, '20170901999999', '雇主22', '1538323200', 'y', 'n', '1504673449', '1504673511');
INSERT INTO `jfy_company_staff_insurance` VALUES ('28', '4', '28', '健康保险', null, '33', '张三', '1503936000', 'y', 'n', '1504681426', '1504682840');
INSERT INTO `jfy_company_staff_insurance` VALUES ('29', '2', '29', '健康保险', null, '121', '212', '1507737600', 'y', 'n', '1509099455', '1509099455');
INSERT INTO `jfy_company_staff_insurance` VALUES ('30', '15', '36', '健康保险', null, '20171130143926', '孟真', '1543507200', 'y', 'n', '1512024010', '1512024011');
INSERT INTO `jfy_company_staff_insurance` VALUES ('31', '23', '44', '健康保险', null, '20171212000011', '赵晓丽', '1544803200', 'n', 'n', '1513058506', '1513058506');
INSERT INTO `jfy_company_staff_insurance` VALUES ('32', '21', '42', '意外保险', null, '2234234', 'sda', '1513526400', 'n', 'n', '1513580644', '1513580644');
INSERT INTO `jfy_company_staff_insurance` VALUES ('33', '21', '45', '意外保险', null, '1213132', 'gsafg', '1513094400', 'n', 'n', '1513580664', '1513580664');
INSERT INTO `jfy_company_staff_insurance` VALUES ('34', '2', '26', '健康保险', null, '123132', '张伟', '1519401600', 'n', 'n', '1517454768', '1517454768');

-- ----------------------------
-- Table structure for `jfy_company_staff_skill_cert`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_skill_cert`;
CREATE TABLE `jfy_company_staff_skill_cert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `type` enum('society','government') NOT NULL DEFAULT 'society' COMMENT '类型:society 协会  government 政府',
  `img_url` text NOT NULL COMMENT '图片路径',
  `name` varchar(255) NOT NULL COMMENT '技能名称',
  `level` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '证书等级: 1专项级 2 初级 3 中级 4 高级',
  `cert_bn` varchar(255) NOT NULL COMMENT '证书编号',
  `issued` varchar(255) NOT NULL COMMENT '发证机关',
  `occupation` varchar(255) NOT NULL COMMENT '职业',
  `theoretical_score` varchar(255) NOT NULL COMMENT '理论知识成绩',
  `operating_score` varchar(255) NOT NULL COMMENT '操作技能成绩',
  `evaluation_score` varchar(255) NOT NULL COMMENT '评定成绩',
  `train_organization` varchar(255) NOT NULL COMMENT '培训机构',
  `accreditation_time` int(10) NOT NULL COMMENT '认证时间',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态:y 正常 n 作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_check` enum('y','n') DEFAULT 'n',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_skill_cert
-- ----------------------------
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('22', '1', '19', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014939774602.jpeg\",\"id\":\"33\"}]', '牛逼证', '4', '213121321', '手动阀手动阀手动阀', '大法师d\'f', '100', '100', '100', '手动阀手动阀', '1502121600', 'y', '大阿斯顿飞过', 'n', '1504008495', '1504008495');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('23', '1', '19', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\",\"id\":\"36\"}]', '协会的撒发射点', '1', '1132', '打发士大夫', '发士大夫', '99', '99', '99', '都是发法', '1502294400', 'y', '反对法', 'n', '1504008556', '1504008556');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('37', '2', '13', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15012066419395.png\",\"id\":\"19\"}]', '11111', '1', '1111111', '防守打法', '发送到上帝', '水电费 水电费', '发送到', '水电费发送到', '浮动所发生的分发送到f', '1501603200', 'y', '是的发送到水电费上帝', 'y', '1504083397', '1504083398');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('38', '6', '20', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15028688659345.png\",\"id\":\"39\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027860559547.png\",\"id\":\"37\"}]', '吱吱吱', '1', '111112', '上海市人力资源和社会保障局', '东方闪电2', '的所发生的2', '发送到s2', '发送到2', '的方式的更好2', '1503504000', 'y', '第三方2', 'y', '1504084021', '1504099614');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('39', '6', '20', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15027878721264.png\",\"id\":\"38\"}]', '吱吱吱', '1', '45454132', '水电费sd', '发送上帝', '发送到上帝', '发送到', '发送到发送到', '上帝发送到', '1502726400', 'y', '发送到上帝', 'y', '1504084235', '1504096215');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('40', '1', '21', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\",\"id\":\"36\"}]', '大师级的hash', '1', '13213212131', '的撒打算', '实打实', '大苏打', '大苏打', '三大殿啊', '打算大', '1502812800', 'y', '打算打算', 'y', '1504097560', '1504097758');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('41', '1', '21', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424964578.png\",\"id\":\"36\"},{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15017424967679.png\",\"id\":\"35\"}]', '职业技能家协', '4', '1321321', '121321', '各个环节和', '公司法国', '三大的 ', '但是阿迪斯', '打算', '1502380800', 'y', '打算 ', 'y', '1504098379', '1504098379');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('42', '4', '6', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\",\"id\":\"32\"}]', '1', '1', '1', '上海市人力资源和社会保障局', '1', '1', '1', '1', '1', '1502208000', 'y', '1', 'y', '1504103535', '1504103535');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('43', '4', '6', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\",\"id\":\"32\"}]', '1', '1', '1', '上海市家庭服务业行业协会', '11', '1', '1', '1', '1', '1502208000', 'y', '111', 'y', '1504103670', '1504103670');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('44', '14', '30', 'government', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\",\"id\":\"32\"}]', '1', '1', '1', '上海市人力资源和社会保障局', '1', '1', '1', '1', '1', '1502208000', 'y', '1', 'y', '1504103535', '1504103535');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('45', '14', '30', 'society', '[{\"src\":\"http:\\/\\/192.168.199.236\\/zhianbao_api\\/images\\/15014908163146.gif\",\"id\":\"32\"}]', '1', '1', '1', '上海市家庭服务业行业协会', '11', '1', '1', '1', '1', '1502208000', 'y', '111', 'y', '1504103670', '1504103670');
INSERT INTO `jfy_company_staff_skill_cert` VALUES ('46', '21', '41', 'government', '[{\"src\":\"http:\\/\\/192.168.100.136\\/zhianbao_api\\/images\\/15130805008630.jpeg\",\"id\":\"120\"}]', '保姆从业资格证', '2', '20150305123632', '上海市人力资源和社会保障局', '保姆', '100', '96', '98', '上海喵神', '1425484800', 'y', '', 'n', '1515052140', '1515052140');

-- ----------------------------
-- Table structure for `jfy_company_staff_train_apply`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_company_staff_train_apply`;
CREATE TABLE `jfy_company_staff_train_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `age` int(10) NOT NULL COMMENT '年龄',
  `nation` varchar(255) NOT NULL COMMENT '民族',
  `marriage` varchar(255) NOT NULL COMMENT '婚姻情况',
  `education` varchar(255) NOT NULL COMMENT '学历',
  `industry` varchar(255) DEFAULT NULL COMMENT '专业',
  `address` varchar(255) NOT NULL COMMENT '联系地址',
  `company_telephone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `work_objective` text NOT NULL COMMENT '求职意向',
  `work_service` text NOT NULL COMMENT '所选培训服务和费用',
  `total_cost` decimal(20,2) NOT NULL COMMENT '总费用',
  `status` enum('wait','active','accept','process','reject') NOT NULL DEFAULT 'wait' COMMENT '状态: wait 等待, active 正常, accept 已接受, process 已处理, reject 已拒绝',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_company_staff_train_apply
-- ----------------------------
INSERT INTO `jfy_company_staff_train_apply` VALUES ('1', '6', '18', '22', '汉族', '未婚', '本科', '计算机', '上海市', '0216363636', '[{\"index\":\"1\",\"value\":\"\\u6708\\u5ac2\"},{\"index\":\"2\",\"value\":\"\\u80b2\\u513f\\u5ac2\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\"},{\"index\":\"1\",\"price\":\"600\"}]}', '1000.00', 'active', '1504059586', '1504060080');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('2', '6', '12', '0', 'fsdfsdfsd', 'fsdfsd', 'dfdsfsd', 'dfsfsdfsdfsdfds', 'fsdfsdfsdfsd', 'fdsfgsdfsd', '[{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"},{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"3\"}]', '{\"type\":\"\\u4eba\\u793e\\u5c40\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1504066149', '1504066149');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('3', '6', '9', '0', 'dsfsd', 'fsdfsd', 'fsdfsd', 'fsdfsd', 'fsdfsd', 'sdfsdf', '[{\"name\":\"\\u533b\\u966a\",\"index\":\"4\"},{\"name\":\"\\u7ba1\\u5bb6\",\"index\":\"5\"}]', '{\"type\":\"high\",\"price\":[{\"index\":\"0\",\"price\":\"1100\\u5143\"},{\"index\":\"1\",\"price\":\"1500\\u5143\"}]}', '2600.00', 'wait', '1504068308', '1504068308');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('4', '6', '8', '0', 'fsdfsdf', 'fdsfdsf', 'fdsfsdfsd', 'fdsdf', 'fsdfsd', 'fdfsfsdfsd', '[{\"name\":\"\\u533b\\u966a\",\"index\":\"4\"},{\"name\":\"\\u7ba1\\u5bb6\",\"index\":\"5\"}]', '{\"type\":\"primary\",\"price\":[{\"index\":\"0\",\"price\":\"600\\u5143\"},{\"index\":\"1\",\"price\":\"800\\u5143\"}]}', '1400.00', 'wait', '1504070991', '1504070991');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('5', '6', '3', '11', '汉', '俺的', '订单', '订单', '俺的', '15516517307', '[{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"},{\"name\":\"\\u533b\\u966a\",\"index\":\"4\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"2\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1504073882', '1504076220');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('6', '6', '17', '12', '暗色调', '暗色调', '俺的', '暗色调', '暗色调', '15516517307', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"2\",\"price\":\"600\\u5143\"},{\"index\":\"3\",\"price\":\"600\\u5143\"}]}', '1200.00', 'wait', '1504075292', '1504076481');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('7', '1', '21', '12132', '发士大夫', '广泛大概', '132121321', '6666', '发射点方式', '1212131213', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"}]', '{\"type\":\"primary\",\"price\":[{\"index\":\"0\",\"price\":\"600\\u5143\"},{\"index\":\"1\",\"price\":\"800\\u5143\"}]}', '1400.00', 'accept', '1504099363', '1504101594');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('8', '4', '5', '1', '1', '未婚', '1', '1', '1', '1', '[{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1504168189', '1504168189');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('9', '4', '6', '1', '1', '已婚', '专科', '1', '1', '11', '[{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1504168950', '1504233647');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('10', '4', '27', '0', '汉族', '已婚', '初中', '123123123', '江西省上饶市弋阳县whichType', '11', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"},{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"3\"}]', '{\"type\":\"\"}', '0.00', 'wait', '1504665198', '1504665198');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('11', '4', '28', '56', '11', '已婚', '初中', '1', '青海省果洛藏族自治州久治县户籍详细地址', '111', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"},{\"index\":\"2\",\"price\":\"600\\u5143\"},{\"index\":\"3\",\"price\":\"600\\u5143\"}]}', '2200.00', 'wait', '1504665741', '1504665748');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('14', '1', '21', '0', '满族', '未婚', '高中', '', '江西省抚州市乐安县啊法国地方官大使馆犯得上个', '121312', '[{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"},{\"name\":\"\\u5c45\\u5bb6\\u517b\\u8001\",\"index\":\"2\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1504667461', '1504667461');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('15', '4', '28', '56', '11', '已婚', '初中', '1', '青海省果洛藏族自治州久治县户籍详细地址', '18272878105', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"}]}', '400.00', 'wait', '1504750029', '1504750033');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('16', '15', '34', '19', '汉族', '已婚', '初中', '', '辽宁省大连市中山区高浮雕鬼地方', '18521722857', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1511862006', '1511862006');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('17', '14', '33', '0', '汉族', '未知', '未知', '专业', '湖北省襄阳市襄城区这是联系地址', '18272878105', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"},{\"index\":\"2\",\"price\":\"600\\u5143\"},{\"index\":\"3\",\"price\":\"600\\u5143\"}]}', '2200.00', 'wait', '1511863610', '1511863610');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('18', '15', '36', '35', '汉族', '已婚', '高中', '', '', '18521722857', '[{\"name\":\"\\u6708\\u5ac2\",\"index\":\"0\"},{\"name\":\"\\u80b2\\u513f\\u5ac2\",\"index\":\"1\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"},{\"index\":\"1\",\"price\":\"600\\u5143\"}]}', '1000.00', 'wait', '1511927048', '1511927048');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('19', '15', '39', '37', '汉族', '未知', '未知', '', '', '18521722857', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"3\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"}]}', '400.00', 'wait', '1512363241', '1512363241');
INSERT INTO `jfy_company_staff_train_apply` VALUES ('20', '23', '44', '95', '汉族', '已婚', '大专', '', '', '', '[{\"name\":\"\\u7efc\\u5408\\u5bb6\\u653f\",\"index\":\"3\"}]', '{\"type\":\"human\",\"price\":[{\"index\":\"0\",\"price\":\"400\\u5143\"}]}', '400.00', 'wait', '1513058661', '1513058661');

-- ----------------------------
-- Table structure for `jfy_customer`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer`;
CREATE TABLE `jfy_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `nickname` varchar(10) NOT NULL DEFAULT '' COMMENT '昵称',
  `introduce` varchar(255) NOT NULL COMMENT '个人简介',
  `source` enum('h5','pc','mini') NOT NULL DEFAULT 'h5' COMMENT '来源:h5 微信; pc 网页; mini 小程序',
  `create_time` int(10) unsigned NOT NULL COMMENT '注册时间',
  `last_modify` int(10) unsigned NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer
-- ----------------------------
INSERT INTO `jfy_customer` VALUES ('1', '15516517307', '张伟', '张伟', 'h5', '1522318145', '1522318145');

-- ----------------------------
-- Table structure for `jfy_customer_address`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_address`;
CREATE TABLE `jfy_customer_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL COMMENT '会员ID',
  `consignee` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人名称',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机号码 ',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮编',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_default` enum('y','n') NOT NULL DEFAULT 'n',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `last_modify` int(10) unsigned NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=706 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_address
-- ----------------------------
INSERT INTO `jfy_customer_address` VALUES ('701', '1', '张伟', '15516517307', '0', '1', '310000', '310100', '310152', '', 'y', '0', '1522400053');
INSERT INTO `jfy_customer_address` VALUES ('702', '1', '张伟', '15516517307', '0', '1', '310000', '310100', '310231', '2222', 'n', '1522390301', '1522390301');
INSERT INTO `jfy_customer_address` VALUES ('703', '1', '张伟', '15516517307', '0', '1', '420000', '420100', '420106', '333366', 'n', '1522400053', '1523250085');
INSERT INTO `jfy_customer_address` VALUES ('704', '1', '张伟', '15516517306', '0', '1', '210000', '210200', '210203', '1231', 'n', '1523250085', '1523250198');
INSERT INTO `jfy_customer_address` VALUES ('705', '1', '周凯', '18521722857', '0', '1', '310000', '310100', '310152', '310152', 'n', '1524040565', '1524040565');

-- ----------------------------
-- Table structure for `jfy_customer_channel_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_channel_coupon`;
CREATE TABLE `jfy_customer_channel_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL COMMENT '客户ID',
  `coupon_id` int(10) NOT NULL COMMENT '优惠券ID',
  `coupon_details_id` int(10) NOT NULL COMMENT '优惠券详情ID',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` enum('online','offline') NOT NULL DEFAULT 'online' COMMENT '家服卡领取途径 online线上领取兑换 offline线下领取线上兑换',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_channel_coupon
-- ----------------------------
INSERT INTO `jfy_customer_channel_coupon` VALUES ('16', '1', '17', '1341', '1524105981', 'offline');
INSERT INTO `jfy_customer_channel_coupon` VALUES ('17', '1', '17', '1332', '1524106953', 'offline');
INSERT INTO `jfy_customer_channel_coupon` VALUES ('18', '1', '17', '1333', '1524106994', 'offline');

-- ----------------------------
-- Table structure for `jfy_customer_online_signup`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_online_signup`;
CREATE TABLE `jfy_customer_online_signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `sex` enum('boy','girl') NOT NULL DEFAULT 'girl' COMMENT '性别:boy:男; girl:女',
  `birthday` varchar(255) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `homeArea` varchar(255) NOT NULL COMMENT '家乡',
  `work_city` varchar(255) NOT NULL COMMENT '意向城市',
  `work_intention` text NOT NULL COMMENT '报名意向',
  `remark` text COMMENT '备注',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_online_signup
-- ----------------------------
INSERT INTO `jfy_customer_online_signup` VALUES ('3', '1', '李二狗', 'boy', '76608000', '13340330735', '江西省', '上海', '[\"\\u80b2\\u513f\\u5ac2\",\"\\u8001\\u4eba\\u966a\\u62a4\",\"\\u6e05\\u6d01\\u517b\\u62a4\"]', '分地方东方闪电', '1522734193', '1522734193');

-- ----------------------------
-- Table structure for `jfy_customer_session`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_session`;
CREATE TABLE `jfy_customer_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sessionId',
  `customer_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_session
-- ----------------------------
INSERT INTO `jfy_customer_session` VALUES ('1', '1', '62803180e79fe64491fde6d1625f0a20', '[]', '1522318145');

-- ----------------------------
-- Table structure for `jfy_customer_to_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_to_coupon`;
CREATE TABLE `jfy_customer_to_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL COMMENT '客户ID',
  `coupon_id` int(10) NOT NULL COMMENT '优惠券ID',
  `coupon_details_id` int(10) NOT NULL COMMENT '优惠券详情ID',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_to_coupon
-- ----------------------------
INSERT INTO `jfy_customer_to_coupon` VALUES ('1', '435', '1', '10', '1514280859');
INSERT INTO `jfy_customer_to_coupon` VALUES ('2', '46', '1', '9', '1514281519');
INSERT INTO `jfy_customer_to_coupon` VALUES ('4', '435', '1', '8', '1514281760');
INSERT INTO `jfy_customer_to_coupon` VALUES ('5', '46', '1', '7', '1514357578');
INSERT INTO `jfy_customer_to_coupon` VALUES ('6', '46', '1', '3', '1514430224');
INSERT INTO `jfy_customer_to_coupon` VALUES ('7', '46', '1', '4', '1514430232');
INSERT INTO `jfy_customer_to_coupon` VALUES ('8', '46', '1', '5', '1514430240');
INSERT INTO `jfy_customer_to_coupon` VALUES ('9', '46', '1', '6', '1514430248');
INSERT INTO `jfy_customer_to_coupon` VALUES ('10', '435', '2', '11', '1514874325');
INSERT INTO `jfy_customer_to_coupon` VALUES ('11', '46', '2', '12', '1514874768');
INSERT INTO `jfy_customer_to_coupon` VALUES ('12', '46', '4', '40', '1514888122');
INSERT INTO `jfy_customer_to_coupon` VALUES ('13', '46', '2', '13', '1514945911');
INSERT INTO `jfy_customer_to_coupon` VALUES ('14', '46', '5', '50', '1514946760');

-- ----------------------------
-- Table structure for `jfy_customer_wechat`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_customer_wechat`;
CREATE TABLE `jfy_customer_wechat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `sex` int(1) NOT NULL DEFAULT '0' COMMENT '性别 1:男 2:女',
  `country` varchar(255) NOT NULL COMMENT '国家',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `headimgurl` varchar(255) NOT NULL COMMENT '头像',
  `subscribe` int(1) NOT NULL DEFAULT '0' COMMENT '是否关注 0:未关注 1:已关注',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_customer_wechat
-- ----------------------------
INSERT INTO `jfy_customer_wechat` VALUES ('1', '1', 'zhangwei', 'zhangwei', '0', '', '', '', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `jfy_finance`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_finance`;
CREATE TABLE `jfy_finance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `about_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联id',
  `item_bn` varchar(255) NOT NULL COMMENT '订单明细编号',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '财务金额',
  `pay_type` enum('unknow','wechat','alipay','coupon','offline') NOT NULL DEFAULT 'unknow' COMMENT '支付类型:unknow 未知; wechat 微信; alipay 支付宝; offline 线下支付 coupon家服卡',
  `serial_bn` varchar(255) DEFAULT '' COMMENT '支付流水号',
  `openid` varchar(255) DEFAULT NULL COMMENT '支付人OPENID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消费类型1正常保洁 2增值消费等',
  `is_coupon` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否使用优惠券 0未使用 1使用',
  `coupon_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券减免金额',
  `status` enum('active','finish','cancal','close') NOT NULL DEFAULT 'active' COMMENT 'active 正在进行中; finish 已完成;cancal 撤单; close 关闭',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联用户id',
  `pay_status` enum('wait','succ','refund','part_refund') NOT NULL DEFAULT 'wait' COMMENT '支付状态:wait:等待; succ:完成;refund:退款;part_refund:部分退款',
  `pay_time` int(10) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_end_time` int(10) NOT NULL DEFAULT '0' COMMENT '支付截止时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '财务创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `remark` varchar(255) NOT NULL COMMENT '支付备注',
  `is_deposit` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否是定金',
  PRIMARY KEY (`id`),
  KEY `about_id` (`about_id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_finance
-- ----------------------------
INSERT INTO `jfy_finance` VALUES ('210', '393', 'O201804192985585490065', '135.00', 'wechat', '', 'zhangwei', '1', '0', '0.00', 'close', '1', 'refund', '0', '1524130755', '1524129855', '1524130042', '', 'n');
INSERT INTO `jfy_finance` VALUES ('211', '394', 'O201804193006972360041', '135.00', 'wechat', '', 'zhangwei', '1', '0', '0.00', 'finish', '1', 'succ', '0', '1524130969', '1524130069', '1524130069', '', 'n');
INSERT INTO `jfy_finance` VALUES ('212', '394', 'O201804193060423820089', '20.00', 'unknow', '', 'zhangwei', '1', '0', '0.00', 'active', '1', 'wait', '0', '1524131504', '1524130604', '1524130604', '擦了一个柜子', 'n');
INSERT INTO `jfy_finance` VALUES ('213', '395', 'O201804193119810950012', '135.00', 'unknow', '', 'zhangwei', '1', '', '0.00', 'active', '1', 'wait', '0', '1524132098', '1524131198', '1524131198', '', 'n');
INSERT INTO `jfy_finance` VALUES ('214', '396', 'O201804193135196000071', '180.00', 'unknow', '', 'zhangwei', '1', '0', '0.00', 'active', '1', 'wait', '0', '1524132251', '1524131351', '1524131351', '', 'n');
INSERT INTO `jfy_finance` VALUES ('215', '397', 'O201804193141726000029', '180.00', 'unknow', '', 'zhangwei', '1', '0', '0.00', 'active', '1', 'wait', '0', '1524132317', '1524131417', '1524131417', '', 'n');
INSERT INTO `jfy_finance` VALUES ('216', '398', 'O201804193174256000090', '180.00', 'unknow', '', 'zhangwei', '1', '0', '0.00', 'active', '1', 'wait', '0', '1524132642', '1524131742', '1524131742', '', 'n');
INSERT INTO `jfy_finance` VALUES ('217', '399', 'O201804193175706000025', '180.00', 'unknow', '', 'zhangwei', '1', '0', '0.00', 'active', '1', 'wait', '0', '1524132657', '1524131757', '1524131757', '', 'n');
INSERT INTO `jfy_finance` VALUES ('218', '406', 'O201804193209086000057', '180.00', 'unknow', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524132090', '1524132990', '1524132090', '1524132090', '', 'n');
INSERT INTO `jfy_finance` VALUES ('219', '407', 'O201804193330346000006', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133303', '1524134203', '1524133303', '1524133303', '', 'n');
INSERT INTO `jfy_finance` VALUES ('220', '408', 'O201804193336656000094', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133366', '1524134266', '1524133366', '1524133366', '', 'n');
INSERT INTO `jfy_finance` VALUES ('221', '409', 'O201804193337656000022', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133376', '1524134276', '1524133376', '1524133376', '', 'n');
INSERT INTO `jfy_finance` VALUES ('222', '410', 'O201804193341026000078', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133410', '1524134310', '1524133410', '1524133410', '', 'n');
INSERT INTO `jfy_finance` VALUES ('223', '411', 'O201804193343476000023', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133434', '1524134334', '1524133434', '1524133434', '', 'n');
INSERT INTO `jfy_finance` VALUES ('234', '422', 'O201804193384046000036', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133840', '1524134740', '1524133840', '1524133840', '', 'n');
INSERT INTO `jfy_finance` VALUES ('235', '423', 'O201804193389856000021', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133898', '1524134798', '1524133898', '1524133898', '', 'n');
INSERT INTO `jfy_finance` VALUES ('236', '424', 'O201804193389986000094', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133899', '1524134799', '1524133899', '1524133899', '', 'n');
INSERT INTO `jfy_finance` VALUES ('237', '425', 'O201804193390066000023', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133900', '1524134800', '1524133900', '1524133900', '', 'n');
INSERT INTO `jfy_finance` VALUES ('238', '426', 'O201804193394456000080', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524133944', '1524134844', '1524133944', '1524133944', '', 'n');
INSERT INTO `jfy_finance` VALUES ('239', '427', 'O201804193400576000078', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524134005', '1524134905', '1524134005', '1524134005', '', 'n');
INSERT INTO `jfy_finance` VALUES ('242', '430', 'O201804193428196000010', '180.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524134281', '1524135181', '1524134281', '1524134281', '', 'n');
INSERT INTO `jfy_finance` VALUES ('243', '431', 'O201804193478076000042', '0.00', 'coupon', '', 'zhangwei', '1', '1', '0.00', 'finish', '1', 'succ', '1524134780', '1524135680', '1524134780', '1524134780', '', 'n');

-- ----------------------------
-- Table structure for `jfy_gold_staff`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_gold_staff`;
CREATE TABLE `jfy_gold_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(10) NOT NULL COMMENT '监管者ID',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `trades` varchar(255) NOT NULL COMMENT '从事工种',
  `experience` int(10) NOT NULL COMMENT '从事家政服务时间',
  `birthday` varchar(255) NOT NULL COMMENT '出生年份',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `house_keep_card` varchar(255) NOT NULL COMMENT '家政卡号',
  `bank_card` varchar(255) NOT NULL COMMENT '银行卡号',
  `cardID` varchar(20) NOT NULL COMMENT '身份证号',
  `skill_level` varchar(255) NOT NULL COMMENT '职业技能等级',
  `education` varchar(255) NOT NULL COMMENT '学历',
  `company_name` varchar(255) NOT NULL COMMENT '家政公司名称',
  `remark` text COMMENT '备注',
  `years` int(11) NOT NULL COMMENT '年份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_gold_staff
-- ----------------------------
INSERT INTO `jfy_gold_staff` VALUES ('1', '15', '汤文霞', '家政服务', '9', '1980', '13386018951', '3110112000735', '6231621231000297320', '340811198002104223', '高级家政服务员', '大专', '上海宛心家庭服务有限公司七宝店', '历任洋雇主，有详细文字材料，可做微信', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('2', '15', '张会兰', '母婴护理', '10', '1979', '13524417239', '3110112000049', '6231621231000295878', '342623197907077129', '母婴护理', '大专', '上海宛心家庭服务有限公司七宝店', '从家政员成为一名家政老师', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('3', '15', '陈兰琼', '育婴师', '10', '1969', '13301706448', '3110115001736', '6231621231000196951', '140802196910050029', '中级育婴师', '大专', '上海闵行顺航家政服务社', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('4', '15', '江云芳', '养老护理', '15', '1969', '13402097501', '3110112000103', '6231621231000340138', '34253019691007394X', '母婴护理', '初中', '上海欣闵保洁服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('5', '15', '孙玉敏', '家政服务', '20', '1971', '18516589215', '3110112001999', '6231621231001438725', '130324197101193322', '母婴护理', '大专', '上海千户家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('6', '15', '夏小琴', '家政服务', '10', '1963', '13175227077', '3110112004812', '6231621231000967724', '330523196312021384', '中级家政服务员', '初中', '上海升华家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('7', '15', '杨爱春', '育婴师', '9', '1965', '13061981731', '3110104001821', '6231621231000275631', '342530196502111847', '母婴护理', '高中', '无尘珠家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('8', '15', '虞海霞', '家政服务', '4', '1981', '13162270994', '3110112000320', '6231621231000318761', '340827198108243222', '母婴护理', '中专', '上海阿依家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('9', '15', '蒋立梅', '育婴师', '8', '1969', '13701628143', '3110112003343', '6231621231001430318', '320830196910102449', '母婴护理', '高中', '上海信义家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('10', '15', '郭珍', '母婴护理', '8', '1973', '18701817796', '3110210000847', '6231621231000035167', '37072419730816076x', '中级育婴师', '初中', '上海帮女郎家庭服务中心', '以雇主需求出发', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('11', '15', '吴小凤', '母婴护理', '8', '1970', '13814753468', '3110210001803', '6231621231000048889', '320422197004084923', '母婴护理', '高中', '上海帮女郎家庭服务中心', '帮助抑郁症新妈妈走出抑郁', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('12', '15', '朱凤琴', '家政服务', '9', '1978', '15011874289', '3110110002254', '6231621231000103163', '342623197806255328', '母婴护理', '初中', '上海海阳老年事业发展服务中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('13', '15', '古爱荣', '家政服务', '6', '1977', '15921619948', '3110110004130', '6231621231000441266', '342530197701214544', '初级养老护理员', '初中', '上海卉卉家政', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('14', '15', '王爽', '育婴师', '6', '1973', '13022112039', '3110109000325', '6231621231000012323', '372822197303280564', '母婴护理', '高中', '上海家事佳家庭服务有限公司', '服务技能拯救宝宝', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('15', '15', '宋春娟', '育婴师', '10', '1973', '13501706469', '3110110002590', '6231621231000105028', '320828197302066029', '高级育婴师', '初中', '上海晶丰家政服务有限公司', '自我价值观', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('16', '15', '邓颖', '家政服务', '12', '1975', '13564206983', '3110109000149', '6231621231000008115', '211221197505042244 ', '母婴护理', '高中', '上海皎盟家庭服务经营部', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('17', '15', '余爱梅', '家政服务', '15', '1967', '18621743868', '3110710012742', '6231621231001143986', '342623196704175023', '母婴护理', '初中', '上海俨佶家政服务中心', '五“心”服务', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('18', '15', '梁利梅', '育婴师', '6', '1976', '18776104034', '正在办理中', '6212261001010484241', '450122197610236547', '初级养老护理员', '高中', '阿姨来了（上海）信息科技有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('19', '15', '宋庆玲', '母婴护理', '12', '1973', '13391107576', '3110201002401', '6231621231000817630', '370829197301223921', '高级母婴护理师', '高中', '上海人人家政服务有限公司（黄浦）', '客户推荐信', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('20', '15', '蓝云香', '母婴护理', '10', '1967', '13454021118', '3110201002653', '6231621231000408117', '33082519670902702X', '母婴护理', '中专', '志正Nicebaby母婴护理中心', '党员，照片多', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('21', '15', '徐果', '家政服务', '9', '1978', '13671776816', '3110101000012', '6231621231000072574', '321302197812132022', '高级育婴师', '初中', '上海爱君家庭服务有限公司黄浦第一分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('22', '15', '曾红岚', '母婴护理', '6', '1972', '18121030867', '3110101001809', '6231621231000218888', '362421197206065029', '中级家政服务员', '大专', '北京易盟天地信息技术有限公司上海分公司', '催乳师', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('23', '15', '蒋明美', '母婴护理', '10', '1969', '13611669562', '3110101001036', '6231621231000157144', '330625196908087841', '母婴护理', '职高', '上海方馨家政服务有限公司（黄浦）', '有很详细篇幅很长的雇主推荐信', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('24', '15', '马建萍', '家政服务', '10', '1968', '13671768142', '3100104000029', '6231621231000003405', '320827196811144362', '中级家政服务员', '初中', '上海快帮家政信息咨询有限公司', '无偿照顾子女出国的孤独老人', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('25', '15', '谭愧花', '母婴护理', '11', '1975', '13183270188', '3110201000043', '6231621231000073176', '410225197507305548', '母婴护理', '高中', '河南雪绒花母婴护理有限公司上海分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('26', '15', '赵玲玲', '母婴护理', '5', '1980', '15921154869', '正在办理中', '6212261001045061535', '511381198012204185', '中级家政服务员', '高中', '上海悦纬网络科技有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('27', '15', '伏晓蓉', '母婴护理', '9', '1972', '13671828938', '3110115007529', '6231621231000610498', '513025197207153605', '母婴护理', '初中', '上海爱君家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('28', '15', '华红梅', '母婴护理', '13', '1969', '18915191856', '3110705002481', '6231621231000199443', '320831196902191847', '母婴护理', '高中', '上海爱君家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('29', '15', '罗玉芸', '母婴护理', '11', '1964', '13671828938', '3110705007812', '6231621231000620489', '360425196411262063', '母婴护理', '高中', '上海家利来家政服务有限公司', '综合能力强', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('30', '15', '薛敏', '母婴护理', '5', '1980', '13020216203', '3110205008921', '6231621231000772983', '34212219800528756X', '母婴护理', '初中', '上海今缘劳务派遣有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('31', '15', '王桂萍', '母婴护理', '8', '1963', '15221222668', '3110105006705', '6231621231000582903', '320625196309095426', '母婴护理', '初中', '上海今缘（隽心）家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('32', '15', '刘桂香', '家政服务', '10', '1974', '13761743358', '3110105004145', '6231621231000361365', '340111197408183029', '母婴护理', '大专', '上海千户家政服务公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('33', '15', '吴金汝', '育婴师', '11', '1968', '18721667797', '3110105002197', '6231621231000282413', '342701196802233028', '母婴护理', '初中', '上海人人家政服务有限公司古北店', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('34', '15', '王红侠', '母婴护理', '5', '1971', '15000152569', '3110205003495', '6231621231000261755', '61032419710110374X', '高级家政服务员', '初中', '舒月母婴护理中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('35', '15', '许小琴', '母婴护理', '8', '1965', '13817006254', '正在办理中', '6228480038189102676', '360281196503080320', '母婴护理', '大专', '舒月母婴护理中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('36', '15', '杨秀芬', '母婴护理', '7', '1964', '13919394299', '3110205000236', '6231621231000024781', '210782196412262824', '母婴护理', '高中', '上海馨贝家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('37', '15', '王明琴', '母婴护理', '6', '1964', '15921588120', '3110205000203', '6231621231000024625', '420625196408154069', '母婴护理', '高中', '上海馨贝华阳街道服务站', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('38', '15', '韩桂菊', '家政服务', '7', '1976', '13641843936', '3100104000023', '6231621231000003348', '372425197612220327', '中级育婴师', '大专', '上海信义家庭服务有限公司长宁区新泾店', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('39', '15', '韩琴', '养老护理', '6', '1967', '15000683203', '3110113000031', '6231621231000309125', '321025196705078423', '母婴护理', '初中', '上海工汇家庭服务有限公司', '为老服务', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('40', '15', '翟继香', '母婴护理', '8', '1974', '18276720091', '3110213000191', '6231621231000088398', '372522197404143423', '母婴护理', '高中', '上海春蕊家政服务有限公司', '月嫂 申请表只有一份', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('41', '15', '李利娟', '母婴护理', '9', '1983', '15279430803', '3110113001475', '6231621231000309802', '362525198303160947', '高级家政服务员', '初中', '上海徐虎家政大华分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('42', '15', '苏正芹', '家政服务', '4', '1969', '18321985680', '3110113000005', '6231621231000039904', '340421196905140649', '母婴护理', '初中', '上海吉爱家庭有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('43', '15', '郝玉荣', '育婴师', '9', '1970', '15121066591', '3110109002514', '6231621231000108097', '232700197004012127', '母婴护理', '高中', '上海安鑫家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('44', '15', '吴义美', '家政服务', '7', '1980', '13564861629', '3110116000006', '6231621231000016498', '34082119800424592X', '母婴护理', '初中', '上海金山爱君家庭服务有限公司金山第一分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('45', '15', '俞春玉', '家政服务', '10', '1967', '13918162325', '3110117111625', '6231621231000382734', '341022196702287128', '初级育婴师', '大专', '上海巾帼家政松江营业部', '材料不错', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('46', '15', '周根宝', '家政服务', '12', '1964', '18916052558', '3110117000129', '6231621231000098124', '310227196403033626', '高级育婴师', '大专', '上海松江区新浜镇家政服务社', '本地阿姨，家庭烹饪师', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('47', '15', '朱春娟', '母婴护理', '4', '1963', '13817799254', '3110217000291', '6231621231000801709', '310227196305134028', '母婴护理', '初中', '上海松江区泖港家政服务社', '本地阿姨', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('48', '15', '陈翠', '家政服务', '8', '1983', '14782216386', '3110115010388', '6231621231000900121', '370831198301064322', '中级家政服务员', '初中', '上海佰兴家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('49', '15', '吴世琴', '养老护理', '6', '1981', '50630523', '3110315004830', '6231621231000331061', '342921198103030526', '中级家政服务员', '大专', '上海用心家庭服务有限公司', '弹钢琴 护理老人', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('50', '15', '杨琼', '养老护理', '8', '1977', '50630523', '3110315000656', '6231621231000070255', '422802197705216820', '母婴护理', '大专', '上海用心家庭服务有限公司', '养老代表', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('51', '15', '余成霞', '家政服务', '5', '1983', '15221941298', '3110115000523', '6231621231000072087', '34112419831001462X', '初级养老护理员', '初中', '上海家音家政服务有限公司', '来自雇主的三封表扬信', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('52', '15', '徐太玲', '母婴护理', '4', '1975', '13122115932', '3110115025953', '6231621231001290431', '371324197507288327', '母婴护理', '初中', '大拇指家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('53', '15', '徐丽艳', '母婴护理', '12', '1961', '13472554439', '3110215045329', '6226660603630704', '220123196102230922', '中级育婴师', '初中', '大拇指家庭服务有限公司', '月嫂代表', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('54', '15', '田雪芳', '家政服务', '7', '1981', '13764687424', '3110115001449', '6231621231000180021', '340323198112261324', '母婴护理', '大专', '上海慧云家政服务站', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('55', '15', '刘贤彩', '母婴护理', '5', '1982', '13585549377', '3110115000989', '6231621231000179544', '340222198201054122', '高级家政服务员', '高中', '上海富通劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('56', '15', '刘昌容', '母婴护理', '5', '1983', '18217480205', '3110115000786', '6231621231000177159', '513523198311213726', '高级家政服务员', '高中', '上海高行富通职业介绍所', '全能月嫂', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('57', '15', '李学茹', '家政服务', '5', '1978', '13816832316', '3110515008990', '6231621231000704861', '372431197810102441', '中级家政服务员', '高中', '上海浦东帼苑家庭服务社', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('58', '15', '赵红梅', '家政服务', '23', '1973', '15821361927', '3110115008514', '6231621231000957402', '65232319730112322X', '母婴护理', '高中', '上海浦东帼苑家庭服务社', '事迹全面', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('59', '15', '毕美青', '家政服务', '14', '1970', '15900925594', '3110115003863', '6231621231000245972', '34252919700322722X', '母婴护理', '初中', '上海浦东帼苑家庭服务社金桥点', '如何面对挑剔雇主', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('60', '15', '刘文华', '家政服务', '15', '1966', '13918902684', '3110101000405', '6231621231000079454', '360425196610222021', '高级家政服务员', '大专', '上海浦东帼苑家庭服务社周家渡点', '下岗后的15年家政岁月', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('61', '15', '李顺艳', '家政服务', '10', '1973', '13918793425', '3110115000550', '6231621231000053277', '340406197309133021', '母婴护理', '大专', '上海浦东帼苑家庭服务社北蔡服务点', '转变观念', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('62', '15', '沈莉', '母婴护理', '10', '1969', '13564847098', '3110115000232', '6231621231000278544', '342224196908131027', '母婴护理', '初中', '上海好帮手社区服务发展中心', '来自于陪伴新生命的喜悦', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('63', '15', '任怀侠', '家政服务', '6', '1979', '13601938367', '3110115000058', '6231621231000330907', '342130197910271025', '高级保育员', '初中', '上海徐虎家政服务有限公司金桥分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('64', '15', '王美兰', '家政服务', '5', '1983', '13917871105', '3110115004125', '6231621231000276779', '372922198306192324', '高级家政服务员', '大专', '上海晓荷家庭劳务介绍所', '80后家政员', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('65', '15', '魏巍', '母婴护理', '10', '1965', '15601733657', '3110215009266', '6231621231000713029', '230202196504062226', '高级家政服务员', '中专', '上海市歌子实业有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('66', '15', '吴余英', '家政服务', '6', '1984', '18221109722', '3110115009925', '6231621231000881545', '362531198404023025', '高级家政服务员', '大专', '上海米乐家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('67', '15', '宋从云', '家政服务', '6', '1981', '18939742406', '3110115000177', '6231621231000039250', '341124198112103824', '高级家政服务员', '高中', '上海贤梅家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('68', '15', '庄秀杰', '育婴师', '8', '1972', '', '3110104000782', '6231621231000017793', '211402197203136423', '母婴护理', '高中', '上海家仁家政服务有限公司', '克服地域饮食差异', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('69', '15', '陈秀玲', '家政服务', '8', '1974', '15900534784', '3110115003798', '6231621231000246038', '320705197406100041', '中级家政服务员', '大专', '上海家仁家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('70', '15', '向家玉', '母婴护理', '3', '1963', '15921328819', '3110215007822', '6231621231000613435', '420529196301233349', '母婴护理', '高中', '上海优悦家政服务有限公司', '母婴护理代表', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('71', '15', '王爱芳', '家政服务', '7', '1970', '18217275509', '3110115002242', '6231621231000198015', '320621197001037720', '高级家政服务员', '初中', '上海徐敏家庭服务有限公司第一分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('72', '15', '徐礼霞', '母婴护理', '5', '1968', '15901781415', '3110115005317', '6231621231000352646', '342824196803033247', '母婴护理', '初中', '上海满李家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('73', '15', '李玲珍', '家政服务', '3', '1963', '13916412962', '3110718000921', '6231621231000915772', '310229196308233622', '中级家政服务员', '高中', '上海青浦区练塘富民家政服务中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('74', '15', '江备芳', '家政服务', '6', '1970', '15902190484', '3110118000213', '6228480038310210778', '310229197008242222', '中级家政服务员', '初中', '青浦景雯保洁服务部', '失业转向家政', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('75', '15', '巴国华', '养老护理', '7', '1964', '18930191729', '3110120000460', '6231621231000274253', '310226196408183520', '中级育婴师', '初中', '上海青舒家政服务社', '与四个老人的故事', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('76', '15', '姜凤英', '育婴师', '8', '1971', '15921823047', '3110204018087', '6212261001025035558', '222303197110012441', '高级家政服务员', '高中', '地德家政服务（上海）有限公司', '育婴师代表', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('77', '15', '王志宁', '母婴护理', '15', '1962', '15921823047', '3110204009722', '6231621231000753637', '32010419620307242X', '母婴护理', '高中', '地德家政服务（上海）有限公司', '为新生儿吸痰脱离危险', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('78', '15', '田菊妹', '养老护理', '10', '1969', '13901666196', '3110104001417', '6231621231000050661', '32102619691107776X', '中级育婴师', '初中', '上海好帮手社区服务发展中心田林站', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('79', '15', '彭付荣', '育婴师', '11', '1969', '13564029488', '3110104008206', '6231621231000666649', '420684196907221529', '母婴护理', '高中', '上海佳禾家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('80', '15', '陶美龄', '家政服务', '10', '1974', '13817972549', '3110115002786', '6231621231000206784', '320828197510126022', '母婴护理', '大专', '上海佳禾家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('81', '15', '仝泽娟', '育婴师', '8', '1973', '13615126210', '3110104009422', '6231621231000754387', '320324197305126522', '中级家政服务员', '高中', '上海佳禾家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('82', '15', '郭月英', '母婴护理', '8', '1961', '13262744608', '3100104000199', '6231621231000002191', '411121196112201029', '中级家政服务员', '高中', '巾帼家政天平店', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('83', '15', '张凤萍', '家政服务', '6', '1971', '15353855886', '3110104000412', '6231621231000004262 ', '612326197106200324', '初级养老护理员', '初中', '巾帼家政康健店', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('84', '15', '付春连', '育婴师', '8', '1970', '15921720323', '3110204002582', '6231621231000151915', '420803197002104544', '母婴护理', '高中', '上海满杰家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('85', '15', '田碧丽', '育婴师', '9', '1966', '13564662135', '3110112002155', '6228480031705227119', '430725196612052569', '母婴护理', '大专', '上海满杰家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('86', '15', '李莉', '育婴师', '5', '1970', '18817323298', '3110104002332', '6231621231000135157', '320827197003051103', '初级养老护理员', '中专', '无尘珠家庭服务有限公司', '帮助新生儿髋关节复位', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('87', '15', '朱胜华', '育婴师', '9', '1976', '18221850589', '3110104016830', '6231621231001424873', '320324197606160628', '母婴护理', '初中', '无尘珠家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('88', '15', '陈海梅', '母婴护理', '6', '1969', '13120810084', '3110108000370', '6231621231000070362', '320922196901230065', '高级家政服务员', '初中', '春雨家政劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('89', '15', '刘洪', '母婴护理', '7', '1976', '15901636117', '3110208015825', '6212261001030271446', '522527197607202542', '母婴护理', '大专', '春雨家政劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('90', '15', '丁小红', '母婴护理', '5', '1980', '13127559572', '3110208004059', '6231621231000478953', '32128319800626062X', '母婴护理', '中专', '上海功新实业有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('91', '15', '廖红娟', '育婴师', '3', '1985', '13296087225', '3110109000056', '6231621231000009519', '500240198509031325', '母婴护理', '本科', '上海功新实业有限公司', '本科家政员，行行出状元', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('92', '15', '王静', '家政服务', '10', '1966', '13004146978', '3110708000145', '6231621231000053707', '321023196611111664', '中级育婴师', '大专', '上海杰妮家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('93', '15', '胡芬芳', '家政服务', '6', '1982', '17701624843', '3110108000147', '6231621231000053731', '341024198208286826', '母婴护理', '大专', '上海升华家政服务有限公司老沪太路分公司', '大专班学习提升', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('94', '15', '周常慧', '家政服务', '13', '1970', '13761563620', '3110108000638', '6231621231000093208', '371481197005251543', '中级家政服务员', '大专', '上海升华家政服务有限公司老沪太路分公司', '完美应对突发状况', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('95', '15', '管秀清', '育婴师', '6', '1974', '13761343676', '3110108006415', '6231621231000820386', '342921197408093128', '母婴护理', '初中', '上海升华家政服务有限公司汶水路分公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('96', '15', '李美香', '母婴护理', '10', '1972', '13472862584', '3110208001364', '6231621231000193867', '372833197212034527', '母婴护理', '高中', '上海婉娘商务咨询服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('97', '15', '张学秀', '家政服务', '13', '1967', '15801701516', '3110188002464', '6231621231000465745', '340123196705042944', '母婴护理', '大专', '徐虎家政服务有限公司共和新路分公司', '与时具进', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('98', '15', '钱丽丽', '母婴护理', '6', '1976', '15617221880', '3110208010483', '6231621231001341606', '342224197608150028', '母婴护理', '大专', '上海韵御家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('99', '15', '张翠香', '家政服务', '8', '1967', '13621940827', '3110114000096', '6231621231000007158', '371202196705077426', '母婴护理', '初中', '上海帮侬忙家庭服务所', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('100', '15', '何青华', '家政服务', '4', '1973', '13818141203', '3110114000458', '6231621231000194246', '512927197307173866', '母婴护理', '初中', '上海亦轩家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('101', '15', '陆丽英', '家政服务', '7', '1969', '15900755205', '3110114000263', '6231621231000087812', '310114196901143628', '母婴护理', '初中', '上海嘉定区和谐家庭服务中心', '服务特殊人群', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('102', '15', '张卫平', '母婴护理', '8', '1964', '13524735855', '3110205000204', '6231621231000024633', '410222196406021542', '中级家政服务员', '高中', '上海馨贝姐妹家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('103', '15', '杨桂兰', '母婴护理', '14', '1967', '13701730087', '3110204005603', '6231621231000501747', '513126196710242020 ', '中级家政服务员', '初中', '上海欣勤劳务派遣有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('104', '15', '曹秀艳', '母婴护理', '7', '1974', '13818655349', '3110208002362', '6231621231000292446', '320923197408151882', '中级家政服务员', '初中', '上海百馨家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('105', '15', '卢军', '母婴护理', '3', '1968', '18521788731', '3110201007168', '6231621231000670575', '310224196807314767', '母婴护理', '初中', '上海睿昊家庭服务有限公司', '本地 专业能力强', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('106', '15', '周建香', '家政服务', '12', '1970', '13524466823', '3110107000047', '6231621231000592944', '320724197008241825', '母婴护理', '初中', '上海舒颖家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('107', '15', '王世贵', '家政服务', '21', '1964', '13761074986', '3110104003657', '6231621231000763057', '342425196408122463 ', '中级家政服务员', '初中', '普陀桃浦社区助老服务社 ', '为老服务 感人', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('108', '15', '陈香', '家政服务', '12', '1977', '13012856295', '3110107003690', '6231621231000996798', '320922197704283023', '母婴护理', '初中', '上海嘉顺劳务派遣服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('109', '15', '林海霞', '家政服务', '13', '1977', '18021020709', '3110120001024', '6231621231000314059', '342923197709152622', '母婴护理', '大专', '上海哈哈家政劳务服务所', '事迹写的很好', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('110', '15', '唐云珍', '母婴护理', '5', '1968', '13817065088', '3110107001710', '6231621231000759667', '513522196805286129', '中级家政服务员', '初中', '上海田华母婴护理服务中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('111', '15', '王书梅', '育婴师', '10', '1977', '13671938856', '3110120000107', '6231621231000195730', '412929197710039463', '中级家政服务员', '高中', '上海悠蓓杰家庭服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('112', '15', '尹西莲', '育婴师', '15', '1968', '13701605327', '3110104004040', '6231621231000444856', '342427196809176924', '中级家政服务员', '初中', '上海佳旺保洁服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('113', '15', '裴玉仙', '母婴护理', '12', '1975', '13764235036', '3110107008742', '6231621231001245690', '410327197506182425', '母婴护理', '初中', '上海中逸劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('114', '15', '徐玉红', '家政服务', '11', '1970', '13764984419', '3110108000791', '6231621231000116868', '342622196603255140', '母婴护理', '初中', '上海中逸劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('115', '15', '袁永红', '母婴护理', '5', '1975', '18655029821', '3110109000711', '6231621231000030192', '341122197509295249', '母婴护理', '初中', '上海博劳企业管理咨询有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('116', '15', '吕永红', '母婴护理', '9', '1969', '13701678915', '3110209003044', '6231621231000148481', '412824196901300642', '母婴护理', '初中', '上海秋歌实业发展有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('117', '15', '濮丽新', '养老护理', '10', '1966', '13817792382', '3110315007768', '6231621231000565296', '231084196611230066', '母婴护理', '高中', '上海同泰家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('118', '15', '尹玉香', '家政服务', '16', '1965', '18221506764', '3110109004122', '6231621231000161823', '342827196510231062', '母婴护理', '初中', '广中家庭劳务介绍所', '老人护理的甜酸苦辣', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('119', '15', '高美红', '养老护理', '5', '1967', '13122759635', '3110109008931', '6231621231000436274', '321321196702092925', '高级家政服务员', '初中', '上海虹口区凉城复馨敬老院', '老人护理的甜酸苦辣', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('120', '15', '瞿清', '养老护理', '10', '1970', '13764435917', '3110109010643', '6231621231000558044', '310225197003063844', '高级家政服务员', '初中', '嘉兴社区助老服务社', '居家养老服务心得体会', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('121', '15', '韦芳', '母婴护理', '9', '1968', '13912529576', '3110208000308', '6231621231000066717', '320926196810262024', '母婴护理', '大专', '上海家事佳家庭服务有限公司凉城店', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('122', '15', '邱文琴', '养老护理', '10', '1968', '18916582397', '3110109004566', '6231621231000223201', '310110196810301621', '母婴护理', '初中', '欧阳社区助老服务社', '服务空巢老人', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('123', '15', '周忠长', '养老护理', '10', '1962', '13381608695', '3110109011653', '6231621231000961438', '310109196201242034', '母婴护理', '高中', '曲阳社区助老服务社', '男性坚守社区居家养老岗位十年', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('124', '15', '程丽', '母婴护理', '8', '1979', '13681905699', '3110109000716', '6231621231000030242', '320822197906020680', '母婴护理', '初中', '真正家政', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('125', '15', '孙嗣燕', '育婴师', '6', '1975', '14721138780', '3110109009636', '6231621231000484118', '340222197510181323', '母婴护理', '高中', '上海金荟园家庭服务中心', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('126', '15', '窦翠红', '家政服务', '17', '1966', '13671922455', '3110106000598', '6231621231000100433', '32102719660225364X', '母婴护理', '初中', '上海静安区青凤老年生活护理服务社', '多一份体谅、尊重、勤奋', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('127', '15', '汪碧玉', '家政服务', '22', '1969', '15900557305', '3110106000775', '6231621231000137070', '342529196912136646', '中级家政服务员', '初中', '上海静安区青凤老年生活护理服务社', '不计酬劳的爱', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('128', '15', '任雪红', '家政服务', '5', '1986', '18021020709', '3110107011171', '6231621231001180756', '230921198611072127', '初级养老护理员', '大专', '上海永帮家政服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('129', '15', '陈学玉', '母婴护理', '13', '1967', '13621778835', '3110213000488', '6231621231000301668', '342622196603255140', '高级家政服务员', '高中', '上海中逸劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('130', '15', '施颍', '母婴护理', '10', '1967', '15821719353', '正在办理中', '6227001218260076609', '31023019671130086X', '母婴护理', '初中', '上海中逸劳务服务有限公司', '', '2015');
INSERT INTO `jfy_gold_staff` VALUES ('133', '15', '邹丽玲', '母婴护理', '8', '1963', '18939737548', '3110109000411', '6231621231000012570', '310223196307130244', '育婴师高级', '大专', '上海家事佳家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('134', '15', '郑婕', '养老护理', '5', '1964', '18621891198', '3110309017704', '6231621231002047616', '320924196401129027', '养老护理员（医疗照护）初级', '大学', '上海市同泰家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('135', '15', '杨美玲', '育婴师', '8', '1969', '13681822686', '3110109001546', '6231621231000066089', '342326196902010628', '母婴护理专项', '高中', '上海海蒂家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('136', '15', '张二咏', '育婴师', '12', '1975', '13564295897', '3110109000975', '6231621231000130950', '320923197509066329', '育婴师中级', '初中', '上海朋缘家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('137', '15', '刘影', '母婴护理', '8', '1968', '18217115126', '3110109000239', '6231621231000011101', '230824196802120021', '母婴护理专项', '高中', '上海金荟园家庭服务中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('138', '15', '杨义红', '母婴护理', '3', '1969', '13818718363', '3110209016248', '6231621231001939649', '230102196904134326', '母婴护理专项', '大专', '上海秋歌实业发展有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('139', '15', '栾桂华', '家政服务', '5', '1969', '13386218065', '3110107000006', '6231621231000593298', '321028196910282860', '家政服务员中级|养老护理员初级', '初中', '虹口区嘉兴街道助老服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('140', '15', '吴霞', '育婴师', '4', '1978', '13764313221', '3110209010155', '6231621231000478334', '413021197807181045', '育婴师高级', '大学', '上海麦忒教育科技有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('141', '15', '汪秋月', '养老护理', '6', '1975', '13524891732', '3110301005041', '6231621231000526975', '342530197509141322', '养老护理员初级', '高中', '上海康乐家社区服务发展中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('142', '15', '戴建华', '母婴护理', '13', '1965', '13817412705', '3110101000961', '6231621231000155593', '342529196510203826', '母婴护理专项', '初中', '上海人人家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('143', '15', '林志辉', '母婴护理', '6', '1979', '18516221217', '3110201002670', '6231621231000408281', '410503197912093022', '母婴护理专项', '高中', '志正Nicebaby母婴护理中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('144', '15', '饶国英', '母婴护理', '15', '1969', '15906705695', '3110201002672', '6231621231000408307', '330821196902111420', '母婴护理专项', '高中', '志正Nicebaby母婴护理中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('145', '15', '邓亿金', '育婴师', '9', '1962', '15921125156', '3110118002973', '6231621231001541379', '430303196212123022', '母婴护理专项', '高中', '上海方馨家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('146', '15', '王换男', '涉外家政', '6', '1980', '13501980994', '3110101000136', '6231621231000073820', '232303198012151022', '家政服务员中级', '大专', '上海方馨家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('147', '15', '张丽', '母婴护理', '13', '1967', '15821836318', '3110201000034', '6231621231000072699', '412722196707110062', '育婴师高级', '大专', '河南雪绒花母婴护理有限公司上海分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('148', '15', '吕晓明', '家政服务', '3', '1982', '17765106865', '3110104004093', '6231621231001440697', '320123198212063240', '家政服务员高级', '高中', '上海无尘珠家庭服务斜土分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('149', '15', '李辉', '母婴护理', '9', '1976', '15026674896', '3110204000599', '6231621231000007497', '412823197607200024', '母婴护理专项', '高中', '上海富益家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('150', '15', '郭秀英', '家政服务', '8', '1958', '15801920249', '3110704000655', '6231621231000274873', '220224195806290525', '母婴护理专项', '大专在读', '上海徐汇区漕河泾社区家庭文明建设指导中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('151', '15', '潘茹', '母婴护理', '9', '1967', '15201958238', '3110204001391', '6231621231000050414', '320723196712195067', '母婴护理专项', '初中', '荷吉实业（上海）有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('152', '15', '侯玉翠', '母婴护理', '10', '1970', '15221376109', '3100104000160', '6217001210037225875', '342501197012266443', '母婴护理专项', '高中', '上海巾帼社会服务有限公司（天平营业部）', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('153', '15', '叶道芬', '钟点工', '6', '1978', '18721968679', '3110104024016', '6231621231001836936', '340827197811111323', '母婴护理专项', '初中', '上海巾帼社会服务有限公司（龙华营业部）', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('154', '15', '马瑞凤', '母婴护理', '11', '1970', '13661404472', '3110204005659', '6231621231000495486', '231084197007150021', '母婴护理专项', '初中', '荷吉实业（上海）有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('155', '15', '史秋平', '母婴护理', '8', '1969', null, '3110209010425', '6231621231000557400', '612325196907081360', '母婴护理专项', '初中', '上海百馨家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('156', '15', '鄢笑妹', '母婴护理', '5', '1971', null, '3110107015114', '6231621231001660294', '362202197111173609', '母婴护理专项', '初中', '上海徐虎家政服务有限公司双山路分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('157', '15', '汪爱珍', '母婴护理', '5', '1970', null, '3110208000955', '6231621231000124003', '340224197009081727', '母婴护理专项', '初中', '普陀区晶尚保洁服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('158', '15', '段付珍', '母婴护理', '9', '1979', null, '3110107003580', '6231621231000995733', '412823197907153725', '母婴护理专项', '初中', '上海嘉顺劳务派遣服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('159', '15', '张金花', '母婴护理', '0', '1969', null, '3110112000790', '6231621231000312657', '412824196911050704', '母婴护理专项', '初中', '上海悠蓓杰家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('160', '15', '吴在香', '母婴护理', '0', '1965', null, '3110115030591', '6231621231001472500', '32072319650221424X', '母婴护理专项', '初中', '上海欣勤劳务派遣有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('161', '15', '孙凤梅', '家政等级4级', '0', '1974', null, '3110120001019', '6231621231000314000', '321084197401256328', '家政服务员中级', '初中', '上海哈哈家政劳务服务所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('162', '15', '孙世兰', '母婴护理', '0', '1971', null, '3110107000247', '6231621231000654298', '420983197104014029', '母婴护理专项', '初中', '上海舒颖家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('163', '15', '张宝娣', '小时工', '12', '1966', null, '3110107000770', '6231621231000667407', '321023196604196225', '家政服务员中级', '初中', '普陀区晶尚保洁服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('164', '15', '陈品娟', '家政服务', '3', '1963', '18917150612', '3110130000002', '6231621231000054804', '310230196304051720', '家政服务员中级', '初中', '上海市崇明手拉手助残服务中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('165', '15', '何理丽', '母婴护理', '12', '1975', '13701757645', '3110110002970', '6231621231000200266', '342421197511224328', '母婴护理专项', '初中', '上海天地家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('166', '15', '于素荣', '母婴护理', '10', '1965', '13371808329', '3110112017893', '6231621231002057235', '412728196508014527', '母婴护理专项', '高中', '上海皎盟家庭服务经营部', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('167', '15', '沈桂花', '母婴护理', '8', '1970', '13770197559', '3110210013776', '6231621231000869813', '320921197007164743', '母婴护理专项', '高中', '上海帮女郎家庭服务中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('168', '15', '刘中林', '母婴护理', '6', '1977', '15900464268', '3110210000816', '6231621231000036009', '452324197712201842', '母婴护理专项', '高中', '上海麒欣实业有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('169', '15', '张开慧', '养老护理', '9', '1969', '15221478626', '正在办理中', '6228480038886292879', '320925196912075821', '养老护理员初级', '初中', '上海家事佳家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('170', '15', '丁雪', '家政服务', '16', '1964', '13774332580', '3110115000134 ', '6231621231000171541', '342121196405057529', '家政服务员高级', '本科', '上海浦东帼苑家庭服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('171', '15', '徐艳', '家政服务', '10', '1974', '18721183851', '3110115000673 ', '6231621231000174263', '341202197405063582', '家政服务员高级|养老护理员初级', '初中', '上海家阔家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('172', '15', '李光英', '家政服务', '6', '1975', '18221362018', '3110115000554 ', '6231621231000053319', '51031119750915334X', '家政服务员高级', '大专在读', '上海浦东帼苑家庭服务社北蔡点', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('173', '15', '谢晓岚', '家政服务', '8', '1969', '13482639901', '3110115002070 ', '6231621231000175526', '362222196911206545', '家政服务员高级', '初中', '上海浦东帼苑家庭服务社金桥点', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('174', '15', '吕玉湘', '家政服务', '11', '1965', '13564772643', '3110115004050 ', '6231621231000251731', '620102196509113325', '家政服务员高级', '高中', '上海用心家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('175', '15', '安云', '家政服务', '9', '1979', '13681646769', '3110115002024 ', '6231621231000276969', '342423197912274468', '家政服务员高级', '大专在读', '上海慧云家政服务站', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('176', '15', '王玉先', '钟点工', '9', '1980', '15800718726', '3110115000011 ', '6231621231000170493', '412728198010176421', '家政服务员中级', '大专在读', '上海徐虎家政服务有限公司金桥分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('177', '15', '李华', '家政服务', '6', '1983', '15317255219', '3110115042093 ', '6231621231001500953', '342623198312196828', '家政服务员初级|母婴护理专项', '初中', '上海依信家庭服务部', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('178', '15', '邱小菊', '母婴护理', '4', '1982', '13816526354', '3110215003965 ', '6231621231000259429', '510781198205014266', '母婴护理专项', '专科', '上海大拇指家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('179', '15', '李国霞', '母婴护理', '6', '1971', '15000662011', '3110115045076 ', '6231621231001518351', '410221197104080545', '母婴护理专项', '初中', '上海优悦家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('180', '15', '田彩云', '母婴护理', '14', '1973', '18621934820', '3110215045708 ', '6231621231001538516', '422801197304013647', '母婴护理专项', '初中', '上海优悦家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('181', '15', '牧巧玲', '母婴护理', '10', '1963', '15000249985', '3110215001564 ', '6231621231000100250', '340721196309113026', '母婴护理专项', '高中', '上海徐敏家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('182', '15', '沈琴', '养老护理', '8', '1966', '13917327575', '3110315054993 ', '6231621231002053705', '310104196611263223', '养老护理员高级', '大专', '上海好帮手社区服务发展中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('183', '15', '陈明香', '养老护理', '12', '1974', '13621756264', '3110315005633 ', '6231621231000383989', '510112197412102728', '母婴护理专项', '高中', '上海用心家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('184', '15', '吴恩艳', '涉外家政', '14', '1977', '13636651140', '3110115003516 ', '6231621231000245220', '321324197709214482', '家政服务员高级', '中专', '上海晓荷家庭劳务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('185', '15', '刘雪芬', '涉外家政', '3', '1983', '13621873605', '3110115002363 ', '6231621231000210190', '411382198307177166', '家政服务员初级和中级|养老护理员初级', '大专在读', '上海浦东帼苑家庭服务社周家渡点', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('186', '15', '汪宣美', '家政|母婴|育婴', '7', '1987', '15968832515', '3110215008287 ', '6231621231001557185', '340221198709236860', '母婴护理专项|育婴师初级和中级', '大专在读', '上海麦忒教育科技有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('187', '15', '蔡金芳', '育婴', '6', '1967', '13023161232', '3110115001750 ', '6231621231000197553', '430726196710190021', '母婴护理|育婴师初级', '高中', '上海家仁家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('188', '15', '邓安秀', '钟点工', '8', '1982', '18317095117', '3110115000041 ', '6231621231000173901', '512529198202255967', '家政服务员高级', '在读大专', '上海徐虎家政服务有限公司金桥分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('189', '15', '宋得琴', '涉外家政', '8', '1987', '13918294367', '3110115000427 ', '6231621231000789243', '522425198707075428', '家政服务员中级', '初中', '上海晓荷家庭劳务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('190', '15', '夏虹', '涉外家政', '18', '1968', '13381796568', '3110115000471 ', '6231621231000789342', '652827196810263421', '家政服务员初级|中级和高级', '高中', '上海晓荷家庭劳务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('191', '15', '沈红雅', '母婴护理', '7', '1974', '15821737640', '3110215002249 ', '6231621231000197231', '310230197410051948', '母婴护理专项', '初中', '上海徐敏家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('192', '15', '密小平', '家政服务', '15', '1974', '15821769367', '3110115004950 ', '6231621231000330915', '421127197402114788', '母婴护理专项', '高中', '上海米乐家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('193', '15', '姚维英', '照顾老人', '8', '1962', '15000164135', '3110108019549 ', '6231621231002033525', '34262219621008052X', '母婴护理专项', '初中', '上海春雨家庭劳务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('194', '15', '杨明滔', '母婴护理', '7', '1981', '13524862056', '3110108001156 ', '6231621231000144308', '352230198101300043', '家政服务员中级|母婴护理专项', '大专', '上海徐虎家政服务有限公司共和新路分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('195', '15', '王艮姣', '育儿嫂', '18', '1973', '15821797895', '3110108001570 ', '6231621231000936828', '342921197301033029', '母婴护理专项', '高中', '上海升华家政服务有限公司老沪太路分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('196', '15', '江英', '钟点工', '10', '1972', '13761958602', '3110108002106 ', '6231621231000254503', '362227197208252220', '母婴护理专项|养老护理员初级', '高中', '上海升华家政服务有限公司汶水路分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('197', '15', '苏敏', '月嫂|育婴', '3', '1981', '13052384305', '3110208016837 ', '6231621231001661144', '32081919810502272X', '母婴护理专项|育婴师初级', '高中', '上海功新实业有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('198', '15', '陈水平', '家政服务员', '15', '1970', '13917775034', '3110106000177 ', '6231621231000040936', '342519197009065022', '养老护理员初级', '初中', '上海静安区曹家渡社区家庭劳务服务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('199', '15', '朱六平', '家政服务员', '15', '1969', '18021020709', '3110107002289 ', '6231621231000725577', '342529196907254621', '家政服务员中级', '初中', '上海永帮家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('200', '15', '董玉密', '家政护理', '17', '1963', '13023253938', '3110106000762 ', '6231621231000136940', '342530196303234545', '家政员初级|养老护理员初级', '初中', '上海静安区青凤老年生活护理服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('201', '15', '周继红', '住家保姆', '8', '1967', '13585897697', '3110108003776 ', '6231621231000479910', '372833196702254528', '养老护理员初级|育婴师初级', '高中', '上海升华家政服务有限公司老沪太路分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('202', '15', '张彩云', '母婴护理', '8', '1967', '15155700582', '3110108001374 ', '6231621231000193313', '342201196705154144', '母婴护理专项', '高中', '上海韵御家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('203', '15', '姜红', '家政服务', '12', '1970', '18217258790', '3110109001806 ', '6231621231000075684', '211021197012015845', '母婴护理专项', '高中', '上海杰妮家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('204', '15', '铙从珍', '家政服务员', '11', '1974', '13524097343', '3110106000207 ', '6231621231000040282', '34242119741118412X', '养老护理员初级', '初中', '上海静安区曹家渡社区家庭劳务服务介绍所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('205', '15', '江玉姣', '母婴护理', '16', '1970', '15801786978', '3110106000110 ', '6231621231000055736', '340827197003083440', '母婴护理专项', '初中', '上海永帮家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('206', '15', '李琴', '家政服务员', '4', '1975', '13564959508', '3110314000791 ', '6231621231000271929', '342625197508083102', '家政服务员高级', '初中', '上海嘉定区和谐家庭服务中心', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('207', '15', '徐华云', '钟点工', '8', '1977', '13818544375', '3110114000130 ', '6231621231000039268', '413026197708084540', '家政服务员中级', '初中', '上海亦轩家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('208', '15', '段艳', '保洁', '3', '1976', '13621839132', '3110114001190 ', '6231621231000357314', '510902197610240700', '家政服务员中级', '高中', '上海帮侬忙家庭服务所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('209', '15', '万小云', '保洁', '5', '1979', '18221198384', '3110114000286 ', '6231621231000109103', '341226197907071022', '家政服务员中级', '初中', '上海帮侬忙家庭服务所', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('210', '15', '张霞芬', '家政服务', '7', '1960', '14782430615', '3110113000997 ', '6231621231000207709', '310102196001252049', '母婴护理专项', '高中', '上海吉爱家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('211', '15', '黄忠云', '母婴|育婴', '8', '1970', '18721362360', '3110113001211 ', '6231621231000243498', '320621197006285125', '母婴护理专项', '中专', '上海荣惠家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('212', '15', '王俊芬', '母婴', '20', '1969', '18321484716', '3110213000221 ', '6231621231000089511', '320922196906075420', '母婴护理专项', '初中', '上海春蕊家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('213', '15', '方海燕', '家政', '15', '1974', '13917656179', '3110118000036 ', '6231621231000127451', '34120219741005332X', '家政服务员中级', '大专', '上海鑫桥家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('214', '15', '王雁', '家政', '4', '1963', '18930191723', '3110120000468 ', '6231621231000274337', '310226196309193520', '养老护理员初级', '初中', '上海青舒家政服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('215', '15', '沈银花', '养老|居家护理', '11', '1964', '15102120163', '3110120000468 ', '6231621231000204888', '310226196408261322', '养老护理人员(居家护理)初级|家政专项', '初中', '上海居贤家政服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('216', '15', '李方丽', '育婴', '12', '1971', '13809202079', '正在办理中', '6231621231000074265', '422431197108214886', '母婴护理专项', '中专', '家事无忧家政服务', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('217', '15', '王玉娣', '全日制家政', '16', '1974', '13761036165', '3110112005921 ', '6231621231000985189', '342421197409182643', '家政服务员高级', '大专', '上海宛心家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('218', '15', '马晓华', '母婴', '11', '1970', '13862844626', '3110205025481 ', '6231621231001875785', '211381197001040028', '家政服务员初级|母婴护理专项', '大专', '上海闵行龙柏顺航家政服务社', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('219', '15', '冯丽', '钟点工', '6', '1983', '13162333373', '3110112000786 ', '6231621231000312616', '341225198303050042', '家政服务员中级', '初中', '上海信义家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('220', '15', '黎芳', '母婴|育婴', '8', '1978', '13795381633', '3110212002183 ', '6231621231000350673', '36050219781221042X', '母婴护理专项|育婴师中级', '大专', '上海升华家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('221', '15', '叶素英', '家政服务', '10', '1971', '13524990373', '3110112014386 ', '6231621231001917215', '341003197111270821', '母婴护理专项', '初中', '上海欣闵保洁服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('222', '15', '谭小花', '全日制家政', '5', '1981', '17740891696', '3110112010476 ', '6231621231001686968', '433027198108173827', '家政服务员初级|母婴护理专项', '大专', '上海宛心家庭服务有限公司颛桥店', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('223', '15', '李承侠', '涉外家政', '8', '1978', '13524180121', '3110112001753 ', '6231621231000294822', '341226197808111965', '家政服务员高级', '大专', '上海宛心家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('224', '15', '武瑞侠', '母婴', '10', '1969', '18817631038', '3110104001274 ', '6231621231000034343', '342201196908120825', '母婴护理专项', '高中', '上海升华家政服务有限公司九亭分公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('225', '15', '何寒梅', '育婴', '6', '1969', '18651307956', '3110705011862 ', '6231621231001050413', '432922196908033627', '育婴师高级', '大专', '上海沪瑞家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('226', '15', '刘云芳', '住家', '12', '1972', '15026971398', '3110105002389 ', '6231621231000181334', '510823197208186562', '家政服务员中级', '高中', '上海千户家政服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('227', '15', '路春华', '母婴', '5', '1978', '15801715814', '3110105000205 ', '6231621231000024641', '342529197804103024', '家政服务员中级|母婴护理专项|育婴师初级', '大专在读', '上海馨贝家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('228', '15', '施忠敏', '母婴', '8', '1969', '13501632048', '3110205003494 ', '6231621231000261748', '320624196904142745', '母婴护理专项', '高中', '上海舒月家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('229', '15', '徐长娥', '母婴|育婴', '9', '1970', '13127637522', '3110208000260 ', '6231621231000064084', '321322197003044423', '母婴护理专项|育婴师初级', '高中', '上海爱君家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('230', '15', '王先美', '育婴', '10', '1967', '15921828071', '3110705000306 ', '6231621231000193404', '342521196707155628', '母婴护理专项|育婴师初级', '高中', '上海爱君家庭服务有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('231', '15', '陈霞', '保洁', '4', '1987', '13641926132', '3110605002354 ', '6231621231000181060', '342501198710254268', '家政服务员中级|母婴护理专项', '大专在读', '上海悦纬网络科技有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('232', '15', '肖洁', '保洁', '2', '1979', '18201940637', '3110104002991 ', '6231621231000919774', '532621197908280025', '家政服务员中级|母婴护理专项', '大专', '上海悦纬网络科技有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('233', '15', '杨杰', '保洁', '4', '1979', '15026919890', '正在办理中', '6217920181390969', '341221197906268534', '家政服务员中级', '大专在读', '上海悦纬网络科技有限公司', null, '2016');
INSERT INTO `jfy_gold_staff` VALUES ('234', '15', '范丽芳', '母婴', '6', '1964', '13601804775', '3110116000621 ', '6231621231000746938', '310228196404151241', '母婴护理专项', '初中', '上海爱君家庭服务有限公司金山第一分公司', null, '2016');

-- ----------------------------
-- Table structure for `jfy_img`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_img`;
CREATE TABLE `jfy_img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `user_id` int(11) DEFAULT NULL COMMENT '服务商ID',
  `regulator_id` int(11) DEFAULT NULL,
  `img_cat_id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL COMMENT '图片地址',
  `local_img_url` varchar(255) NOT NULL COMMENT '本地图片路径',
  `is_del` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_img
-- ----------------------------
INSERT INTO `jfy_img` VALUES ('1', '3', null, '0', '../Resource/images/15223912513459.png', '../Resource/images/15223912513459.png', 'y');
INSERT INTO `jfy_img` VALUES ('2', '3', null, '0', '../Resource/images/15223913347180.png', '../Resource/images/15223913347180.png', 'y');
INSERT INTO `jfy_img` VALUES ('3', '3', null, '0', '../Resource/images/15223914473096.png', '../Resource/images/15223914473096.png', 'y');
INSERT INTO `jfy_img` VALUES ('4', '3', null, '0', '../Resource/images/15223915245043.png', '../Resource/images/15223915245043.png', 'n');
INSERT INTO `jfy_img` VALUES ('5', '3', null, '0', '../Resource/images/15223915305312.png', '../Resource/images/15223915305312.png', 'n');
INSERT INTO `jfy_img` VALUES ('6', '3', null, '0', '../Resource/images/15223987146806.gif', '../Resource/images/15223987146806.gif', 'n');
INSERT INTO `jfy_img` VALUES ('7', '3', null, '0', '../Resource/images/15223993822908.png', '../Resource/images/15223993822908.png', 'n');

-- ----------------------------
-- Table structure for `jfy_img_cat`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_img_cat`;
CREATE TABLE `jfy_img_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片分类ID',
  `user_id` int(11) DEFAULT NULL COMMENT '服务商ID',
  `regulator_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '图片分类名称',
  `create_time` int(10) DEFAULT NULL,
  `last_modify` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_img_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_knowledge`;
CREATE TABLE `jfy_knowledge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(10) NOT NULL COMMENT '监管者ID',
  `cat_id` int(10) NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_knowledge
-- ----------------------------
INSERT INTO `jfy_knowledge` VALUES ('10', '1', '9', '总  则', '<div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第一条根据《医疗机构管理条例》（以下简称条例）制定本细则。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二条条例及本细则所称医疗机构，是指依据条例和本细则的规定，经登记取得《医疗机构执业许可证》的机构。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三条医疗机构的类别：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）综合医院、中医医院、中西医结合医院、民族医医院、专科医院、康复医院；<br>　　（二）妇幼保健院、妇幼保健计划生育服务中心；<br>　　（三）社区卫生服务中心、社区卫生服务站；<br>　　（四）中心卫生院、乡（镇）卫生院、街道卫生院；<br>　　（五）疗养院；<br>　　（六）综合门诊部、专科门诊部、中医门诊部、中西医结合门诊部、民族医门诊部；<br>　　（七）诊所、中医诊所、民族医诊所、卫生所、医务室、卫生保健所、卫生站；<br>　　（八）村卫生室（所）；<br>　　（九）急救中心、急救站；<br>　　（十）临床检验中心；<br>　　（十一）专科疾病防治院、专科疾病防治所、专科疾病防治站；<br>　　（十二）护理院、护理站；<br>　　（十三）医学检验实验室、病理诊断中心、医学影像诊断中心、血液透析中心、安宁疗护中心</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十四）其他诊疗机构。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第四条卫生防疫、国境卫生检疫、医学科研和教学等机构在本机构业务范围之外开展诊疗活动以及美容服务机构开展医疗美容业务的，必须依据条例及本细则，申请设置相应类别的医疗机构。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第五条中国人民解放军和中国人民武装警察部队编制外的医疗机构，由地方卫生计生行政部门按照条例和本细则管理。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">中国人民解放军后勤卫生主管部门负责向地方卫生计生行政部门提供军队编制外医疗机构的名称和地址。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第六条医疗机构依法从事诊疗活动受法律保护。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第七条卫生计生行政部门依法独立行使监督管理职权。不受任何单位和个人干涉。</div>', '1501236936', '1501236936');
INSERT INTO `jfy_knowledge` VALUES ('11', '1', '9', '设置审批', '<div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第八条各省、自治区、直辖市应当按照当地《医疗机构设置规划》合理配置和合理利用医疗资源。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">《医疗机构设置规划》由县级以上地方卫生计生行政部门依据《医疗机构设置规划指导原则》制定，经上一级卫生计生行政部门审核，报同级人民政府批准，在本行政区域内发布实施。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">《医疗机构设置规划指导原则》另行制定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第九条县级以上地方卫生计生行政部门按照《医疗机构设置规划指导原则》规定的权限和程序组织实施本行政区域《医疗机构设置规划》，定期评价实施情况，并将评价结果按年度向上一级卫生计生行政部门和同级人民政府报告。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十条医疗机构不分类别、所有制形式、隶属关系、服务对象，其设置必须符合当地《医疗机构设置规划》。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十一条床位在一百张以上的综合医院、中医医院、中西医结合医院、民族医医院以及专科医院、疗养院、康复医院、妇幼保健院、急救中心、临床检验中心和专科疾病防治机构的设置审批权限的划分，由省、自治区、直辖市卫生计生行政部门规定；其他医疗机构的设置，由县级卫生计生行政部门负责审批。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">医学检验实验室、病理诊断中心、医学影像诊断中心、血液透析中心、安宁疗护中心的设置审批权限另行规定</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十二条有下列情形之一的，不得申请设置医疗机构：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）不能独立承担民事责任的单位；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）正在服刑或者不具有完全民事行为能力的个人；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）发生二级以上医疗事故未满五年的医务人员；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）因违反有关法律、法规和规章，已被吊销执业证书的医务人员；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）被吊销《医疗机构执业许可证》的医疗机构法定代表人或者主要负责人；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）省、自治区、直辖市政府卫生计生行政部门规定的其他情形。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">有前款第（二）、（三）、（四）、（五）项所列情形之一者，不得充任医疗机构的法定代表人或者主要负责人。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十三条在城市设置诊所的个人，必须同时具备下列条件：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）经医师执业技术考核合格，取得《医师执业证书》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）取得《医师执业证书》或者医师职称后，从事五年以上同一专业的临床工作；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）省、自治区、直辖市卫生计生行政部门规定的其他条件。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">医师执业技术标准另行制定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">在乡镇和村设置诊所的个人的条件，由省、自治区、直辖市卫生计生行政部门规定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十四条地方各级人民政府设置医疗机构，由政府指定或者任命的拟设医疗机构的筹建负责人申请；法人或者其他组织设置医疗机构，由其代表人申请；个人设置医疗机构，由设置人申请；两人以上合伙设置医疗机构，由合伙人共同申请。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十五条条例第十条规定提交的设置可行性研究报告包括以下内容：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）申请单位名称、基本情况以及申请人姓名、年龄、专业履历、身份证号码；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）所在地区的人口、经济和社会发展等概况；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）所在地区人群健康状况和疾病流行以及有关疾病患病率；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）所在地区医疗资源分布情况以及医疗服务需求分析；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）拟设医疗机构的名称、选址、功能、任务、服务半径；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）拟设医疗机构的服务方式、时间、诊疗科目和床位编制；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（七）拟设医疗机构的组织结构、人员配备；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（八）拟设医疗机构的仪器、设备配备；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（九）拟设医疗机构与服务半径区域内其他医疗机构的关系和影响；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十）拟设医疗机构的污水、污物、粪便处理方案；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十一）拟设医疗机构的通讯、供电、上下水道、消防设施情况；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十二）资金来源、投资方式、投资总额、注册资金（资本）；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十三）拟设医疗机构的投资预算；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十四）拟设医疗机构五年内的成本效益预测分析。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">并附申请设计单位或者设置人的资信证明。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">申请设置门诊部、诊所、卫生所、医务室、卫生保健所、卫生站、村卫生室（所）、护理站等医疗机构的，可以根据情况适当简化设置可行性研究报告内容。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十六条条例第十条规定提交的选址报告包括以下内容：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）选址的依据；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）选址所在地区的环境和公用设施情况；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）选址与周围托幼机构、中小学校、食品生产经营单位布局的关系；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）占地和建筑面积。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十七条由两个以上法人或者其他组织共同申请设置医疗机构以及两人以上合伙申请设置医疗机构的，除提交可行性研究报告和选址报告外，还必须提交由各方共同签署的协议书。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十八条医疗机构建筑设计必须按照法律、法规和规章要求经相关审批机关审查同意后，方可施工。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第十九条条例第十二条规定的设置申请的受理时间，自申请人提供条例和本细则规定的全部材料之日算起。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十条县级以上地方卫生计生行政部门依据当地《医疗机构设置规划》及本细则审查和批准医疗机构的设置。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">申请设计医疗机构有下列情形之一的，不予批准：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）不符合当地《医疗机构设置规划》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）设置人不符合规定的条件；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）不能提供满足投资总额的资信证明；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）投资总额不能满足各项预算开支；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）医疗机构选址不合理；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）污水、污物、粪便处理方案不合理；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（七）省、自治区、直辖市卫生计生行政部门规定的其他情形。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十一条卫生计生行政部门应当在核发《设置医疗机构批准书》的同时，向上一级卫生计生行政部门备案。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">上级卫生计生行政部门有权在接到备案报告之日起三十日内纠正或者撤销下级卫生计生行政部门作出的不符合当地《医疗机构设置规划》的设置审批。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十二条《设置医疗机构批准书》的有效期，由省、自治区、直辖市卫生计生行政部门规定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十三条变更《设置医疗机构批准书》中核准的医疗机构的类别、规模、选址和诊疗科目，必须按照条例和本细则的规定，重新申请办理设置审批手续。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十四条法人和其他组织设置的为内部职工服务的门诊部、诊所、卫生所（室），由设置单位在该医疗机构执业登记前，向当地县级卫生计生行政部门备案，并提交下列材料：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）设置单位或者其主管部门设置医疗机构的决定；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）《设置医疗机构备案书》。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">卫生计生行政部门应当在接到备案后十五日内给予《设置医疗机构备案回执》。</div>', '1501236978', '1501236978');
INSERT INTO `jfy_knowledge` VALUES ('12', '1', '9', '登记与校验', '<div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十五条申请医疗机构执业登记必须填写《医疗机构申请执业登记注册书》，并向登记机关提交下列材料：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）《设置医疗机构批准书》或者《设置医疗机构备案回执》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）医疗机构用房产权证明或者使用证明；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）医疗机构建筑设计平面图；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）验资证明、资产评估报告；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）医疗机构规章制度；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）医疗机构法定代表人或者主要负责人以及各科室负责人名录和有关资格证书、执业证书复印件；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（七）省、自治区、直辖市卫生计生行政部门规定提供的其他材料。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">申请门诊部、诊所、卫生所、医务室、卫生保健所和卫生站登记的，还应当提交附设药房（柜）的药品种类清单、卫生技术人员名录及其有关资格证书、执业证书复印件以及省、自治区、直辖市卫生计生行政部门规定提交的其他材料。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十六条登记机关在受理医疗机构执业登记申请后，应当按照条例第十六条规定的条件和条例第十九条规定的时限进行审查和实地考察、核实，并对有关执业人员进行消毒、隔离和无菌操作等基本知识和技能的现场抽查考核。经审核合格的，发给《医疗机构执业许可证》；审核不合格的，将审核结果和不予批准的理由以书面形式通知申请人。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">《医疗机构执业许可证》及其副本由国家卫生计生委统一印制。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">条例第十九条规定的执业登记申请的受理时间，自申请人提供条例和本细则规定的全部材料之日算起。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十七条申请医疗机构执业登记有下列情形之一的，不予登记：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）不符合《设置医疗机构批准书》核准的事项；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）不符合《医疗机构基本标准》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）投资不到位；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）医疗机构用房不能满足诊疗服务功能；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）通讯、供电、上下水道等公共设施不能满足医疗机构正常运转；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）医疗机构规章制度不符合要求；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（七）消毒、隔离和无菌操作等基本知识和技能的现场抽查考核不合格；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（八）省、自治区、直辖市卫生计生行政部门规定的其他情形。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十八条医疗机构执业登记的事项：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）类别、名称、地址、法定代表人或者主要负责人；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）所有制形式；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）注册资金（资本）；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（四）服务方式；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（五）诊疗科目；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（六）房屋建筑面积、床位（牙椅）；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（七）服务对象；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（八）职工人数；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（九）执业许可证登记号（医疗机构代码）；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（十）省、自治区、直辖市卫生计生行政部门规定的其他登记事项。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">门诊部、诊所、卫生所、医务室、卫生保健所、卫生站除登记前款所列事项外，还应当核准登记附设药房（柜）的药品种类。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">《医疗机构诊疗科目名录》另行制定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第二十九条因分立或者合并而保留的医疗机构应当申请变更登记；因分立或者合并而新设置的医疗机构应当申请设置许可证和执业登记；因合并而终止的医疗机构应当申请注销登记。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十条医疗机构变更名称、地址、法定代表人或者主要负责人、所有制形式、服务对象、服务方式、注册资金（资本）、诊疗科目、床位（牙椅）的，必须向登记机关申请办理变更登记，并提交下列材料：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）医疗机构法定代表人或者主要负责人签署的《医疗机构申请变更登记注册书》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）申请变更登记的原因和理由；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）登记机关规定提交的其他材料。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十一条机关、企业和事业单位设置的为内部职工服务的医疗机构向社会开放，必须按照前条规定申请办理变更登记。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十二条医疗机构在原登记机关管辖权限范围内变更登记事项的，由原登记机关办理变更登记；因变更登记超出原登记机关管辖权限的，由有管辖权的卫生计生行政部门办理变更登记。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">医疗机构在原登记机关管辖区域内迁移，由原登记机关办理变更登记；向原登记机关管辖区域外迁移的，应当在取得迁移目的地的卫生计生行政部门发给的《设置医疗机构批准书》，并经原登记机关核准办理注销登记后，再向迁移目的地的卫生计生行政部门申请办理执业登记。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十三条登记机关在受理变更登记申请后，依据条例和本细则的有关规定以及当地《医疗机构设置规划》进行审核，按照登记程序或者简化程序办理变更登记，并作出核准变更登记或者不予变更登记的决定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十四条医疗机构停业，必须经登记机关批准。除改建、扩建、迁建原因，医疗机构停业不得超过一年。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十五条床位在一百张以上的综合医院、中医医院、中西医结合医院、民族医医院以及专科医院、疗养院、康复医院、妇幼保健院、急救中心、临床检验中心和专科疾病防治机构的校验期为三年；其他医疗机构的校验期为一年。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">医疗机构应当于校验期满前三个月向登记机关申请办理校验手续。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">输校验应当交验《医疗机构执业许可证》，并提交下列文件：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）《医疗机构校验申请书》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）《医疗机构执业许可证》副本；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）省、自治区、直辖市卫生计生行政部门规定提交的其他材料。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十六条卫生计生行政部门应当在受理校验申请后的三十日内完成校验。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十七条医疗机构有下列情形之一的，登记机关可以根据情况，给予一至六个月的暂缓校验期：</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（一）不符合《医疗机构基本标准》；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（二）限期改正期间；</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">（三）省、自治区、直辖市卫生计生行政部门规定的其他情形。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">不设床位的医疗机构在暂缓校验期内不得执业。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">暂缓校验期满仍不能通过校验的，由登记机关注销其《医疗机构执业许可证》。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十八条各级卫生计生行政部门应当采用电子证照等信息化手段对医疗机构实行全程管理和动态监管。有关管理办法另行制定。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">第三十九条医疗机构开业、迁移、更名、改变诊疗科目以及停业、歇业和校验结果由登记机关予以公告。</div>', '1501237009', '1501237009');
INSERT INTO `jfy_knowledge` VALUES ('13', '1', '12', '医疗安全管理制度', '<p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\">一、医务人员应当具备良好的职业道德和医疗职业水平，发扬人道主义精神，履行防病治病，</span></font><span style=\"font-family: 宋体; color: rgb(0, 102, 255); display: inline !important;\">救死扶伤，保护人民健康的神圣职责。</span></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span><span style=\"font-family: 宋体;\">二、遵守法律、法规，遵守技术操作规范。</span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br></span><span style=\"font-family: 宋体;\">三、对急危患者，应当采取紧急措施进行诊治，不得拒绝急救处置。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span><span style=\"font-family: 宋体;\">四、对毒、麻、精神药品严加管理，按制度用药。</span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br></span><span style=\"font-family: 宋体;\">五、对医疗设备、电源、氧气要定期检查维修，严格按照规程操作。</span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br></span><span style=\"font-family: 宋体;\">六、消防设备定期检查。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span><span style=\"font-family: 宋体;\">七、定期对职工进行安全教育。</span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br><br></span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\"><br></span><span style=\"font-family: 宋体;\">八、各级各类医务人员恪守职责，严防医疗事故发生。</span></font></p>', '1501237293', '1501237293');
INSERT INTO `jfy_knowledge` VALUES ('14', '1', '12', '质 量 管 理 制 度', '<p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">1</span><span style=\"font-family: 宋体;\">、把医疗质量放在首位，把质量管理纳入医院的各项工作中。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">2</span><span style=\"font-family: 宋体;\">、建立健全质量保障体系，建立质量管理组织，配备专兼职人员，负责质量管理工作。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">3</span><span style=\"font-family: 宋体;\">、质量管理组织要根据上级有关要求和自身医疗工作的实际，建立切实可行的质量管理方案。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span style=\"font-family: 宋体;\"><br></span><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">4</span><span style=\"font-family: 宋体;\">、质量管理方案的主要内容包括：建立质量管理目标、指标、计划、措施、效果评价及信息反馈等。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">5</span><span style=\"font-family: 宋体;\">、加强对全体人员进行质量管理教育，组织其参加质量管理活动。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">6</span><span style=\"font-family: 宋体;\">、质量管理工作应用文字纪录，并由质量管理组织形成报告，定期逐级上报。</span></font></p><p align=\"left\" style=\"color: rgb(0, 0, 0); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; line-height: 32px;\"><font color=\"#0066FF\"><span lang=\"EN-US\" style=\"font-family: ˎ̥;\">7</span><span style=\"font-family: 宋体;\">、每季进行一次质量大检查，科室每月进行一次质量检查，质量检查的结果与评优奖罚结合与岗贴挂钩，并纳入评审。</span></font></p>', '1501237348', '1501237348');
INSERT INTO `jfy_knowledge` VALUES ('15', '2', '14', '文章', '11111', '1501237841', '1501237841');
INSERT INTO `jfy_knowledge` VALUES ('16', '1', '11', '周界防护', '<div>1 周界入侵报警系统应符合GB 50394的规定。 &nbsp;</div><div>2 &nbsp;周界入侵报警系统设防应无盲区和死角，并24h设防；防区划分应有利于报警时准确定位。&nbsp;</div><div>3 &nbsp;监控中心通过显示屏、报警控制主机或电子地图能准确识别报警区域。&nbsp;</div><div>4 监控中心在收到警情时应能同时发出声光报警信号，并具有记录、存储、打印功能。 &nbsp;</div><div>5 在周界设置视频监控系统的，系统应具有联动功能，当周界入侵探测器发出警报信号时，</div><div>监控中心图像显示装置应能立即自动切换出与报警相关的摄像机图像（晚间报警区域的灯光自动开启）。&nbsp;</div><div>6 入侵探测器的选用与安装应充分考虑环境气候、各种干扰因素引起的误报以及对有效探测距离的影响等，</div><div>应选用抗干扰能力强的产品。 &nbsp;</div><div>7 周界入侵报警系统宜使用脉冲式或张力式电子围栏及主动红外报警系统。</div>', '1501239085', '1501239467');
INSERT INTO `jfy_knowledge` VALUES ('17', '1', '11', '视频安防监控系统', '<p class=\"MsoNormal\"><span lang=\"EN-US\">1&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">网络型数字视频安防监控系统的设备接口协议应符合</span><span lang=\"EN-US\">GA/T&nbsp;669.5</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的规定；非网络型数字视频安防监控系统的设备接口协议应符合</span><span lang=\"EN-US\">HDcctv</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">标准的要求；与城市监控报警网络联网的数字视频安防监控系统的设备接口协议应符合</span><span lang=\"EN-US\">GA/T&nbsp;669.5</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">、</span><span lang=\"EN-US\">DB12/&nbsp;480</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的要求。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">2&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应采用专用网络，系统传输与布线应符合</span><span lang=\"EN-US\">GB&nbsp;50348</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">—</span><span lang=\"EN-US\">2004</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">中</span><span lang=\"EN-US\">3.11</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">的规定。</span><span lang=\"EN-US\">&nbsp;5.6.5&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">网络型数字视频安防监控系统传输与布线设计应符合</span><span lang=\"EN-US\">GB&nbsp;50311</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的要求；网络交换设备设计应符合</span><span lang=\"EN-US\">GB/T&nbsp;21050</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的要求。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">3&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">视频图像应有日期、时间、监视画面位置等的字符叠加显示功能，字符叠加应不影响对图像的监视和记录回放效果。字符时间与标准时间的误差应在±</span><span lang=\"EN-US\">30s</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">以内。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">4 &nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应能在医院监控中心显示、记录监控图像，能自动、手动切换图像，遥控云台、镜头等摄像机辅助设备。</span><span lang=\"EN-US\">&nbsp;5.6.8&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">带有云台、变焦镜头控制的摄像机，应根据管理要求设定初始位置，在停止云台、变焦操作</span><span lang=\"EN-US\">5min</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">±</span><span lang=\"EN-US\">0.5min</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">后，应自动恢复至预设定状态。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">5 &nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">具备视频监控与报警联动的系统，当报警控制器发出信号时，监控中心的图像显示设备应能联动切换出该报警区域相关的视频图像，并全屏显示。其联动响应时间应≤</span><span lang=\"EN-US\">2s</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">6&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统宜采用智能化视频分析处理技术，具有虚拟警戒、目标检测、行为分析、视频远程诊断、快速图像检索等功能。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">7&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">大型的视频监控系统应采用数字集中存储方式，并支持系统内授权用户通过网络搜寻存储数据。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">8</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应配置数字录像设备，对系统所有摄像机摄取的图像进行</span><span lang=\"EN-US\">24h</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">记录，并保存</span><span lang=\"EN-US\">30d</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">。</span><span lang=\"EN-US\">&nbsp;5.6.13&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">在系统正常工作照明条件下，图像质量主观评价不应低于</span><span lang=\"EN-US\">GB&nbsp;50198</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">、</span><span lang=\"EN-US\">DB12/&nbsp;480</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的要求。</span><span lang=\"EN-US\">&nbsp;5.6.14&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">摄像机安装应符合以下要求：</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">a)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">监控区域应无盲区、避免或减少图像出现逆光现象，特殊场所视频设备应具有低照度和逆光补</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">偿功能；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">b)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">在光比大、光照度变化大的区域应选择宽动态、低照度、性能指标与环境相适应的摄像机，必</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">要时应配置辅助照明光源；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">c)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">大范围监控宜选用带有云台和变焦镜头的摄像机，并配置防护罩；</span><span lang=\"EN-US\">&nbsp;d)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">电梯轿厢内的摄像机应安装在电梯厢门上方的左或右侧；</span><span lang=\"EN-US\">&nbsp;e)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">视频监控系统宜采用独立供电方式，并具备防破坏报警功能；</span><span lang=\"EN-US\">&nbsp;</span><span style=\"display: inline !important;\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">9 &nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">视频监控图像应符合以下要求：</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">a)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">视频监控区域内的所有图像应清晰地显示进出、过往的机动车牌号和往来人员的体貌特征；</span><span lang=\"EN-US\">&nbsp;b)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">视频图像信息采集、传输、编解码、存储、显示等终端设备应与前端信息采集设备相匹配；</span><span lang=\"EN-US\">&nbsp;c)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">应配置专用图像存储设备，存储、回放的视频监控图像与前端设备采集的图像质量相一致；</span><span lang=\"EN-US\">&nbsp;d)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">应保证图像信息的原始完整性、有效性，重要点位的视频监控回放的图像分辨率应符合</span><span lang=\"EN-US\">DB12/&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">480</span><span style=\"font-family:宋体;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">的规定；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">e)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">视频监控图像应能按照指定设备、通道进行图像的实时点播</span><span lang=\"EN-US\">;&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">支持点播图像的显示、抓拍、缩</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">放和录像；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">f)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">应保证图像信息的原始完整性，即在色彩还原性、图像轮廓还原性、灰度级、事件后继性等方</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">面均应与现场场景保持最大相似性</span><span lang=\"EN-US\">(</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">主观评价）；</span><span lang=\"EN-US\">&nbsp;g)&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">系统的最终显示图像</span><span lang=\"EN-US\">(</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">主观评价</span><span lang=\"EN-US\">)</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">应达到四级</span><span lang=\"EN-US\">(</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">含四级）</span><span lang=\"EN-US\">,</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">对于电磁环境特别恶劣的现场，图像质</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">量应不低于三级</span><span lang=\"EN-US\">,</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">图像质量的主观评价应符合</span><span lang=\"EN-US\">GB&nbsp;50198</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">—</span><span lang=\"EN-US\">2011&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">中的</span><span lang=\"EN-US\">&nbsp;5.4</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">的规定。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">10&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">医院出入口摄像机应符合以下要求：</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">a)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">出入口应设置进出双向分别安装的两台高清彩色摄像机，并与城市监控报警网络联网；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">b)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">出入口的摄像机应能清楚地识别出入人员的面部和体貌行为特征，夜间应采取辅助照明光源</span><span lang=\"EN-US\">,</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">保证监控图像的实时有效；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">c)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">出入口摄像机应能清楚识别、摄录进出机动车辆牌号、颜色及驾乘人员面部特征；</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">d)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">出入口摄像机、镜头选型，存储联网设备，后台存储空间，安装高度等应符合公安机关的管理</span></p><p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">要求；</span><span lang=\"EN-US\">&nbsp;</span></p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\"><span lang=\"EN-US\">e)&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">出入口视频图像要求应符合</span><span lang=\"EN-US\">DB12/&nbsp;480</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">的规定。</span></p>', '1501239209', '1501239209');
INSERT INTO `jfy_knowledge` VALUES ('18', '1', '11', '电子巡查系统', '<p class=\"MsoNormal\"><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">1 系统应符合</span><span lang=\"EN-US\">GA/T&nbsp;644</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">标准的规定。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">2&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应根据医院安全防范的需要选择离线式或在线式两种类型。</span><span lang=\"EN-US\">&nbsp;&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">3&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应根据医院安全防范的需要设置巡查点，设定保安人员巡查路线，并能对巡查点、巡查路线、时间进行调整和修改。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">4&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">监控中心应具有巡查时间、地点、人员、路线等数据的显示、查询、打印等功能。</span><span lang=\"EN-US\">&nbsp;5.7.5&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">巡查钮或读卡器应设置合理，安装牢固。</span><span lang=\"EN-US\">&nbsp;5.8&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">停车场（库）安全管理系统</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">5&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应符合</span><span lang=\"EN-US\">GA/T&nbsp;761</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">和</span><span lang=\"EN-US\">&nbsp;GA/T&nbsp;992</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">的标准规定；系统安装应符合</span><span lang=\"EN-US\">GB&nbsp;50348</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">－</span><span lang=\"EN-US\">2004</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">第</span><span lang=\"EN-US\">6</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\nmso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">章相关规定。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">6&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">系统应重点对出入口、停车场（库）出入口及其车辆通行道口实施控制、监管。</span><span lang=\"EN-US\">&nbsp;</span></p><p class=\"MsoNormal\"><span lang=\"EN-US\">7&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">在车辆出入大门和停车场（库）时，宜采用感应式刷卡或远距离自动识别系统，并自动记录车辆进出时间。</span><span lang=\"EN-US\">&nbsp;</span></p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\"><span lang=\"EN-US\">8&nbsp;</span><span style=\"font-family:\n宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:\n宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">停车场（库）控制系统宜与视频监控系统联动，有人值守的岗亭应安装紧急报警装置。</span><span lang=\"EN-US\">&nbsp;5.8.5&nbsp;</span><span style=\"font-family:宋体;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:\nminor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">对院内非机动车存放区宜集中封闭管理。</span></p>', '1501239391', '1501239391');
INSERT INTO `jfy_knowledge` VALUES ('19', '1', '10', '对危险化学品进行安全管理', '<p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; text-indent: 2em; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px;\">医院在医疗、科研、教学等环节经常要使用和接触许多危险化学品，存在一定安全风险。近日，为确保医院危险化学品安全，北京市医院管理局对危险化学品审批、采购、储存、使用和销毁等环节进行规范。出台了《市属医院危险化学品安全管理规范》。</p><p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; text-indent: 2em; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px;\">《规范》明确要求各市属医院要建立危险化学品安全管理工作体系，建立安全工作组织机构，明确医院安全保卫部门、业务职能管理部门、使用部门（科室）的安全管理工作职责，完善危险化学品审批、采购、储存、使用和销毁等环节的安全管理工作流程，强化危险化学品采购到销毁的闭环管理，同时建立医院院级、安全保卫部门、业务管理部门和使用部门（科室）的四种安全检查工作制度，严格实行逐级审批、集中管理、专人负责制度，严格落实危险化学品“双人收发、双人记账、双人双锁”等管理制度，完善危险化学品防泄漏、防遗洒、防中毒、防爆炸、防火灾等应急预案，确保危险化学品的有效监管。</p><p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; text-indent: 2em; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px;\">《规范》还对危险化学品储存场所建设与安全、教育培训、考核奖惩等内容进行了明确。北京市医管局还将制定危险化学品安全检查指标体系，将纳入医院绩效考核，推进市属医院危险化学品规范化管理。</p>', '1501239544', '1501239544');
INSERT INTO `jfy_knowledge` VALUES ('20', '1', '10', '开展安全质量联合督查', '<p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; text-indent: 2em; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px;\">近日，为保障芜湖患者的诊疗安全，芜湖市第一人民医院开展联合督查，由副院长彭东风、水心富，院长助理孙铭，医务、护理、质控、院感、防保、总务、设备、保卫、信息等职能部门多部门组成的联合督查组对该院血透室、新生儿、ICU、手术室、检验科、急诊室、产房、内镜室、口腔科、消毒供应中心等重点科室开展安全质量联合督查。</p><p></p><p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px; text-align: center;\"><a href=\"http://www.vodjk.com/news/170223/1049564.shtml\" style=\"border-width: 0px; border-style: initial; overflow: hidden;\"><img src=\"http://upload.vodjk.com/2017/0223/1487836651535.jpg\" alt=\"芜湖第一人民医院开展安全质量联合督查\" border=\"0\" style=\"margin: 10px auto; border-width: 0px; border-style: initial; overflow: hidden;\"></a></p><p style=\"margin-top: 15px; margin-bottom: 15px; border: 0px; overflow: hidden; text-indent: 2em; color: rgb(0, 0, 0); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 微软雅黑, sans-serif; font-size: 16px;\">按照”市一院医疗安全专项整治月”活动部署，联合督查组对检查发现的问题现场反馈，责令整改。对部分需要多部门协调解决的问题，现场给予协调解决</p>', '1501239591', '1501239591');
INSERT INTO `jfy_knowledge` VALUES ('21', '1', '10', '开展安全宣传月活动', '<p><br></p><p style=\"margin-bottom: 6px; padding-top: 4px; padding-bottom: 4px; line-height: 27px; border: none; font-variant-numeric: inherit; font-stretch: inherit; font-family: &quot;Microsoft YaHei&quot;, 宋体, &quot;Trebuchet MS&quot;, Arial, Helvetica, sans-serif; table-layout: fixed; color: rgb(51, 51, 51); text-align: center;\"><img src=\"http://www.cd120.com/thirdparty/ueditor/jsp/upload/1447230607750.jpg\" title=\"1.jpg\" style=\"line-height: inherit; border-width: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: inherit; max-width: 740px;\"><strong style=\"line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; font-family: inherit;\"><span style=\"padding-top: 4px; padding-bottom: 4px; line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: 宋体; table-layout: fixed;\">&nbsp;</span></strong></p><p></p><p style=\"margin-bottom: 6px; padding-top: 4px; padding-bottom: 4px; line-height: 27px; border: none; font-variant-numeric: inherit; font-stretch: inherit; font-family: &quot;Microsoft YaHei&quot;, 宋体, &quot;Trebuchet MS&quot;, Arial, Helvetica, sans-serif; table-layout: fixed; color: rgb(51, 51, 51); text-indent: 28px;\"><span style=\"padding-top: 4px; padding-bottom: 4px; line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: 宋体; table-layout: fixed;\"></span></p><p style=\"margin-bottom: 5px; padding-top: 4px; padding-bottom: 4px; line-height: 27px; border: none; font-variant-numeric: inherit; font-stretch: inherit; font-family: &quot;Microsoft YaHei&quot;, 宋体, &quot;Trebuchet MS&quot;, Arial, Helvetica, sans-serif; table-layout: fixed; color: rgb(51, 51, 51); text-indent: 21px;\"><span style=\"padding-top: 4px; padding-bottom: 4px; line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: 宋体; table-layout: fixed;\">&nbsp;为进一步向全院教职员工宣传普及安全知识，切实增强安全意识和应急处理的能力，积极营造良好的医院安全环境，11月6日下午，安全保卫部在医院开展安全宣传，全面拉开了“119”消防宣传日和医院安全生产宣传月活动的序幕，为夯实医院安全防控工作奠定良好的基础。</span></p><p style=\"margin-bottom: 5px; padding-top: 4px; padding-bottom: 4px; line-height: 27px; border: none; font-variant-numeric: inherit; font-stretch: inherit; font-family: &quot;Microsoft YaHei&quot;, 宋体, &quot;Trebuchet MS&quot;, Arial, Helvetica, sans-serif; table-layout: fixed; color: rgb(51, 51, 51); text-indent: 21px;\"><span style=\"padding-top: 4px; padding-bottom: 4px; line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: 宋体; table-layout: fixed;\">&nbsp;安全保卫部根据医院的实际情况，制作完善了形式多样的宣传材料，如安全手册、宣传展板、宣传专栏以及宣传横幅等。宣传内容丰富多彩，包括医院安全生产、治安防范、消防防控、反恐防暴、危化品、涉医暴力防范等安全管理和基本知识。结合近年来全国医院火灾事故案例和重点科室、重点部位可能存在的消防安全隐患，阐述了医院火灾事故的危害性，以及火灾中如何逃生自救、如何组织引导疏散、灭火器、室内消火栓等消防器材的使用方法等内容。同时对医疗行业最为关心的问题——“医闹入刑”作了具体阐述，以切实保障医务人员的合法权益。另外，在安全宣传月，还将协调政府职能部门专业人员进行安全讲座。根据消防法律、法规和医院消防安全管理制度，在今年底前各科室将组织安全消防应急处置演练，安全保卫部将全力做好保障支撑工作。</span></p><p style=\"margin-bottom: 5px; padding-top: 4px; padding-bottom: 4px; line-height: 27px; border: none; font-variant-numeric: inherit; font-stretch: inherit; font-family: &quot;Microsoft YaHei&quot;, 宋体, &quot;Trebuchet MS&quot;, Arial, Helvetica, sans-serif; table-layout: fixed; color: rgb(51, 51, 51); text-indent: 21px;\"><span style=\"padding-top: 4px; padding-bottom: 4px; line-height: inherit; border: none; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; font-family: 宋体; table-layout: fixed;\">&nbsp;医院领导对此次安全宣传方式和内容给予了肯定，希望今后继续开展此类安全宣传，进一步提高广大医务人员掌握安全防控、逃生自救的基本常识和技能水平，增强安全防控综合素质能力，切实维护我院安全和良好的工作秩序。</span></p>', '1501239630', '1501239630');
INSERT INTO `jfy_knowledge` VALUES ('22', '3', '16', '大主宰', '<div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\"><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">客串</h3></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; font-family: arial, 宋体, sans-serif; text-align: start; background-color: rgb(255, 255, 255);\"><tbody><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">绫清竹</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"54\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" valign=\"top\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境主母之一，和丈夫林动育有一女林静。</td></tr><tr><td width=\"41\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">应欢欢</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">武境</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">冰灵族</div></td><td width=\"415\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境主母之一，曾因帮助林动晋入祖境而燃烧轮回命陨。林动来到大千后从冰灵族将其复活，后出任冰灵族族长</td></tr><tr><td width=\"41\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">萧薰儿</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域主母之一，和丈夫萧炎育有一子萧霖</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">彩鳞</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域主母之一，和丈夫萧炎育有一女萧潇</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林青檀</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">随哥哥林动来到大千</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林貂</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">仙品后期</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林动二弟及武境二当家，本体天妖貂，后进化为超级神兽</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林炎</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林动三弟，本体变异体质的黑暗圣虎</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">药尘</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">仙品后期</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">仙品炼丹大宗师</div></td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">萧炎的师傅，擅长炼药炼丹</td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 12px;\"><a name=\"1_5\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_1_5\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"上古强者\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\"><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">上古强者</h3></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; font-family: arial, 宋体, sans-serif; text-align: start; background-color: rgb(255, 255, 255);\"><tbody><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8D%E6%9C%BD%E5%A4%A7%E5%B8%9D/20833143\" data-lemmaid=\"20833143\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">不朽大帝</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">半步主宰</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">大千宫</div></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古第一强者，前任大千宫宫主，苍穹榜上留下姓氏“叶”</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">九劫战帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣品天至尊</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古九帝之一，上古最强战阵师。创出九劫雷狱观想法，具有弹指间摧毁一个下位面的能力</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">心魔雷帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古雷宫</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古九帝之一，远古雷宫之主。上古时期的超级凶魔，纵横大千世界，威名赫赫。创出无上心魔经和招牌神通幽冥心魔雷</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">洛神</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">洛神族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古大千第一美人。在浩劫时她独战邪族排名第八第九的天魔帝，最终战死也将两位天魔帝打的一死一重伤</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E5%B8%9D/19629154\" data-lemmaid=\"19629154\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">天帝</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8A%E5%8F%A4%E5%A4%A9%E5%AE%AB\" style=\"color: rgb(19, 110, 194);\">上古天宫</a></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古天宫之主，天罗大陆曾经的统治者，授牧尘一气化三清</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">摩诃老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族先祖，曾与不朽大帝争夺万古不朽身，遗憾落败，也正是因此大帝在陨落前将万古身交于摩诃族保管</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">浮屠老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B5%AE%E5%B1%A0%E5%8F%A4%E6%97%8F\" style=\"color: rgb(19, 110, 194);\">浮屠古族</a></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一，残魂被牧尘唤醒并授予牧尘创出的八部浮屠</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">太灵老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一，残魂被洛璃唤醒，传授洛璃太灵通天光</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">擎天老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣渊陨落的四位圣品之一</div></td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">枪祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">天阵老人</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">天至尊</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣品灵阵大宗师</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古名列前茅的强者</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵蝶丹仙</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">炼丹术不输萧炎，炼制出来的丹药就连圣品都很推崇</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">玄龙战帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">妻子灵蝶丹仙，上古有名的人，将玄龙军”赠与牧尘</div></td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">血僵</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">血魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">被封印与圣渊大陆的四位天魔帝之一，被尸天幽释放出来后占据其身体，后被浮屠老祖和牧尘击杀，因此牧尘才成为新一任的诛魔王</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">九尸</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">吞魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">前十的天魔帝，被天帝拼死封印，后死于炎帝武祖之手</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E9%82%AA%E7%A5%9E\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">天邪神</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">BOSS</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">域外邪族的领袖，邪族最强者，有九目，每张开一目，力量都能暴涨许多。最终被<span style=\"font-weight: 700;\">“尊主”</span>牧尘、<span style=\"font-weight: 700;\">“武祖”</span>林动、<span style=\"font-weight: 700;\">“炎帝”</span>萧炎三人消灭。</div></td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 12px;\"><a name=\"1_6\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_1_6\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"当代强者\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\"><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">当代强者</h3></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; font-family: arial, 宋体, sans-serif; text-align: start; background-color: rgb(255, 255, 255);\"><tbody><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%92%E8%A1%AB%E5%89%91%E5%9C%A3\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">青衫剑圣</span></a></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品极致</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%89%91%E5%9F%9F/20438511\" data-lemmaid=\"20438511\" style=\"color: rgb(19, 110, 194);\">剑域</a></td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">剑域之主，成就媲美炎帝，炎帝在“炎之一道的造诣登峰造极”，而他在“剑之一道的造诣登峰造极”。大千世界最接近炎帝与武祖的人之一。</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8D%E6%AD%BB%E4%B9%8B%E4%B8%BB\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">不死之主</span></a></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品极致</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%87%E5%A2%93%E4%B9%8B%E5%9C%B0\" style=\"color: rgb(19, 110, 194);\">万墓之地</a></div></td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古不朽大帝的后人，现<span style=\"font-weight: 700;\">“守墓人”</span>的领袖，曾坐镇于北荒之丘镇守着封印天邪神的大阵。大千世界最接近炎帝与武祖的人之一。</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">秦天</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大千宫</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">现任大千宫宫主，大千宫“诛魔王”。最后一次盟约大战中被魔域的心天魔帝控制，后被炎帝百年前留下的警惕<span style=\"font-weight: 700;\">“帝焱火珠”</span>解救</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">西天战皇</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品初期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">西天战殿</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">西天大陆的统治者，修炼大帝内经</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">浮屠玄</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">浮屠古族</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">浮屠古族原大长老，曾迂腐不化，看重规矩，后退位给清衍静</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">摩诃天</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族</td><td width=\"404\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族族长。当年想吞并创立不久的火域，最终萧炎出手将其击败才让他从此以后不敢沾染火域。正因此事火域才跻身大千最顶尖超级势力行列</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">太冥老祖</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族大长老，洛璃请他来帮助牧尘</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑天</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，因黑天族欠摩诃族一道人情就和黑地前往万古城对付牧尘</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑地</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品初期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族大长老</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">荒虬</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">荒古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，拥有圣品肉身</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">真龙帝</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">龙族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太上大长老，在大千地位崇高，本体紫金巨龙</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">鲲鹏老祖</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">鲲鹏族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">通天大猿王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">通天猿族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">暴躁无比，武器巨棍</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">凤王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤凰族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤族族长，早已进化为真凤，若她与凰王联手就算面对两位顶尖天魔帝都能一战</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">凰王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤凰族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凰族族长，名为凰金，早已进化为真凰</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">姜崖</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">邪灵族</td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">域外邪族用大千世界的血脉与邪族结合而诞生，对大千有恨意。邪族用来攻破大千化魔阵的底牌之一。</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑尸</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">尸魔族</td><td width=\"404\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">尸魔皇族和族长，儿子尸天幽</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">斩魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">刀魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">刀魔族族长</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵魔族族长</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">心魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">心魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">心魔族族长</div></td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">暗魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，实力不弱于圣天魔帝，真龙帝从他身上察觉到极其危险的气息</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">圣魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，地位仅次于天邪神</td></tr></tbody></table>', '1501665583', '1501665583');
INSERT INTO `jfy_knowledge` VALUES ('23', '1', '17', '大主宰', '<h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><br></div></div></h4><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">客串</h3><h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; text-indent: 0px;\"></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; color: rgb(0, 0, 0); text-align: start; text-indent: 0px; background-color: rgb(255, 255, 255);\"><tbody><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">绫清竹</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"54\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" valign=\"top\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境主母之一，和丈夫林动育有一女林静。</td></tr><tr><td width=\"41\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">应欢欢</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">武境</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">冰灵族</div></td><td width=\"415\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境主母之一，曾因帮助林动晋入祖境而燃烧轮回命陨。林动来到大千后从冰灵族将其复活，后出任冰灵族族长</td></tr><tr><td width=\"41\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">萧薰儿</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域主母之一，和丈夫萧炎育有一子萧霖</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">彩鳞</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域主母之一，和丈夫萧炎育有一女萧潇</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林青檀</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">随哥哥林动来到大千</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林貂</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">仙品后期</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林动二弟及武境二当家，本体天妖貂，后进化为超级神兽</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林炎</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">武境</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">林动三弟，本体变异体质的黑暗圣虎</td></tr><tr><td width=\"41\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">药尘</td><td width=\"111\" align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">仙品后期</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">仙品炼丹大宗师</div></td><td width=\"57\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">无尽火域</td><td width=\"415\" align=\"left\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">萧炎的师傅，擅长炼药炼丹</td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; font-size: 12px; text-indent: 0px;\"><a name=\"1_5\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_1_5\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"上古强者\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div></div></div></h4><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">上古强者</h3><h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; text-indent: 0px;\"></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; color: rgb(0, 0, 0); text-align: start; text-indent: 0px; background-color: rgb(255, 255, 255);\"><tbody><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8D%E6%9C%BD%E5%A4%A7%E5%B8%9D/20833143\" data-lemmaid=\"20833143\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">不朽大帝</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">半步主宰</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">大千宫</div></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古第一强者，前任大千宫宫主，苍穹榜上留下姓氏“叶”</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">九劫战帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣品天至尊</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古九帝之一，上古最强战阵师。创出九劫雷狱观想法，具有弹指间摧毁一个下位面的能力</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">心魔雷帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古雷宫</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古九帝之一，远古雷宫之主。上古时期的超级凶魔，纵横大千世界，威名赫赫。创出无上心魔经和招牌神通幽冥心魔雷</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">洛神</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">洛神族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古大千第一美人。在浩劫时她独战邪族排名第八第九的天魔帝，最终战死也将两位天魔帝打的一死一重伤</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E5%B8%9D/19629154\" data-lemmaid=\"19629154\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">天帝</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8A%E5%8F%A4%E5%A4%A9%E5%AE%AB\" style=\"color: rgb(19, 110, 194);\">上古天宫</a></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古天宫之主，天罗大陆曾经的统治者，授牧尘一气化三清</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">摩诃老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族先祖，曾与不朽大帝争夺万古不朽身，遗憾落败，也正是因此大帝在陨落前将万古身交于摩诃族保管</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">浮屠老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B5%AE%E5%B1%A0%E5%8F%A4%E6%97%8F\" style=\"color: rgb(19, 110, 194);\">浮屠古族</a></td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一，残魂被牧尘唤醒并授予牧尘创出的八部浮屠</td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">太灵老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一，残魂被洛璃唤醒，传授洛璃太灵通天光</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">擎天老祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣渊陨落的四位圣品之一</div></td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">枪祖</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣渊陨落的四位圣品之一</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">天阵老人</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">天至尊</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">圣品灵阵大宗师</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上古名列前茅的强者</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵蝶丹仙</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">炼丹术不输萧炎，炼制出来的丹药就连圣品都很推崇</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">玄龙战帝</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天至尊</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td width=\"317\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">妻子灵蝶丹仙，上古有名的人，将玄龙军”赠与牧尘</div></td></tr><tr><td width=\"23\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">血僵</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">血魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">被封印与圣渊大陆的四位天魔帝之一，被尸天幽释放出来后占据其身体，后被浮屠老祖和牧尘击杀，因此牧尘才成为新一任的诛魔王</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">九尸</span></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">吞魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">前十的天魔帝，被天帝拼死封印，后死于炎帝武祖之手</td></tr><tr><td width=\"74\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A9%E9%82%AA%E7%A5%9E\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">天邪神</span></a></td><td width=\"157\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">BOSS</div></td><td width=\"49\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣魔族</td><td width=\"317\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">域外邪族的领袖，邪族最强者，有九目，每张开一目，力量都能暴涨许多。最终被<span style=\"font-weight: 700;\">“尊主”</span>牧尘、<span style=\"font-weight: 700;\">“武祖”</span>林动、<span style=\"font-weight: 700;\">“炎帝”</span>萧炎三人消灭。</div></td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; font-size: 12px; text-indent: 0px;\"><a name=\"1_6\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_1_6\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"当代强者\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div></div></div></h4><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">当代强者</h3><h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; text-indent: 0px;\"></div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; color: rgb(0, 0, 0); text-align: start; text-indent: 0px; background-color: rgb(255, 255, 255);\"><tbody><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%92%E8%A1%AB%E5%89%91%E5%9C%A3\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">青衫剑圣</span></a></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品极致</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%89%91%E5%9F%9F/20438511\" data-lemmaid=\"20438511\" style=\"color: rgb(19, 110, 194);\">剑域</a></td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">剑域之主，成就媲美炎帝，炎帝在“炎之一道的造诣登峰造极”，而他在“剑之一道的造诣登峰造极”。大千世界最接近炎帝与武祖的人之一。</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8D%E6%AD%BB%E4%B9%8B%E4%B8%BB\" style=\"color: rgb(19, 110, 194);\"><span style=\"font-weight: 700;\">不死之主</span></a></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品极致</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\"><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%87%E5%A2%93%E4%B9%8B%E5%9C%B0\" style=\"color: rgb(19, 110, 194);\">万墓之地</a></div></td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">远古不朽大帝的后人，现<span style=\"font-weight: 700;\">“守墓人”</span>的领袖，曾坐镇于北荒之丘镇守着封印天邪神的大阵。大千世界最接近炎帝与武祖的人之一。</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">秦天</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大千宫</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">现任大千宫宫主，大千宫“诛魔王”。最后一次盟约大战中被魔域的心天魔帝控制，后被炎帝百年前留下的警惕<span style=\"font-weight: 700;\">“帝焱火珠”</span>解救</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">西天战皇</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品初期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">西天战殿</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">西天大陆的统治者，修炼大帝内经</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">浮屠玄</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">浮屠古族</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">浮屠古族原大长老，曾迂腐不化，看重规矩，后退位给清衍静</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">摩诃天</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族</td><td width=\"404\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">摩诃古族族长。当年想吞并创立不久的火域，最终萧炎出手将其击败才让他从此以后不敢沾染火域。正因此事火域才跻身大千最顶尖超级势力行列</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">太冥老祖</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族</td><td align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太灵古族大长老，洛璃请他来帮助牧尘</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑天</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，因黑天族欠摩诃族一道人情就和黑地前往万古城对付牧尘</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑地</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品初期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">黑天古族大长老</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">荒虬</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">荒古族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，拥有圣品肉身</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">真龙帝</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">龙族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">太上大长老，在大千地位崇高，本体紫金巨龙</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">鲲鹏老祖</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">鲲鹏族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">通天大猿王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">通天猿族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">暴躁无比，武器巨棍</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">凤王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤凰族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤族族长，早已进化为真凤，若她与凰王联手就算面对两位顶尖天魔帝都能一战</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">凰王</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品后期</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凤凰族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">凰族族长，名为凰金，早已进化为真凰</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">姜崖</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品中期</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">邪灵族</td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">域外邪族用大千世界的血脉与邪族结合而诞生，对大千有恨意。邪族用来攻破大千化魔阵的底牌之一。</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">黑尸</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">尸魔族</td><td width=\"404\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">尸魔皇族和族长，儿子尸天幽</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">斩魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">刀魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">刀魔族族长</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵魔族族长</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">心魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">心魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">心魔族族长</div></td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">暗魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">天魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，实力不弱于圣天魔帝，真龙帝从他身上察觉到极其危险的气息</td></tr><tr><td width=\"63\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">圣魔</span></td><td width=\"96\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">顶尖天魔帝</td><td width=\"48\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣魔族</td><td width=\"51\" align=\"left\" valign=\"top\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">族长，地位仅次于天邪神</td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; font-size: 12px; text-indent: 0px;\"><a name=\"2\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_2\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"设定\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div></div></div></h4><h2 class=\"title-text\" style=\"margin-top: 0px; padding-right: 8px; padding-left: 18px; font-size: 22px; color: rgb(0, 0, 0); float: left; line-height: 24px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">设定</h2><h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><div class=\"para-title level-2\" label-module=\"para-title\" style=\"clear: both; zoom: 1; overflow: hidden; border-left: 12px solid rgb(79, 156, 238); line-height: 24px; font-size: 22px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; margin-top: 35px; margin-bottom: 15px; margin-left: -30px; background-image: url(&quot;https://bkssl.bdimg.com/static/wiki-lemma/normal/resource/img/paraTitle-line_c5e6d61.png&quot;); background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; position: relative; text-indent: 0px;\"><a class=\"edit-icon j-edit-link\" data-edit-dl=\"2\" style=\"color: rgb(136, 136, 136); display: block; float: right; height: 22px; line-height: 22px; padding-left: 24px; font-size: 12px; font-family: SimSun; background: rgb(255, 255, 255);\"><span class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\" style=\"font-family: baikeFont_layout; -webkit-font-smoothing: antialiased; speak: none; line-height: 1; outline: 0px; margin-right: 3px; vertical-align: text-bottom; color: rgb(170, 170, 170);\"></span>编辑</a></div><table log-set-param=\"table_view\" width=\"-552\" data-sort=\"sortDisabled\" style=\"font-size: 12px; text-align: start; text-indent: 0px; background-color: rgb(255, 255, 255);\"><tbody><tr><th align=\"center\" valign=\"middle\" colspan=\"3\" style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\">灵力境界</th><th align=\"center\" valign=\"middle\" style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\">介绍</th></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">感应境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">感应天地灵气</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵动境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">吸纳灵气入体</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵轮境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">体内灵气凝聚成轮</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">神魄境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">分水岭境界，能获得一个奇特能力，炼化兽魄</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">三天之境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">融天境、化天境、通天境的总称</td></tr><tr><td width=\"7\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">融天境</td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; line-height: 24px; zoom: 1; height: auto;\">三天之境第一重，能融入天地，操纵些天地灵气，举手投足间拥有摧毁山岳的力量</div></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">化天境</td><td align=\"left\" valign=\"top\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; line-height: 24px; zoom: 1; height: auto;\">三天之境第二重，神魄脱离肉体的束缚，能化入天地之间，随时隐匿自身，令人难以查探，受到攻击也能将身体化入天地，令受伤减弱</div></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">通天境</td><td align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">三天之境第三重，神魄远离肉身，遨游天地而不灭，是为通天</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">至尊小三难</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">让得无数天才闻之色变的“小三难”只有渡过这三难才能塑起至尊身，真正跨入至尊境</td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">肉身难</td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第一难，强化肉体</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵力难</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第二难，强化灵力</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">神魄难</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第三难，强化神魄，共分三重，只有经过三重神魄之火的淬炼才能入至尊境</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" class=\"coloredcell\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230); background: rgb(251, 251, 251);\"><span style=\"font-weight: 700;\">至尊境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大千世界强者的标志，至尊之下皆为蝼蚁</td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"9\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">至尊</span></td><td width=\"153\" align=\"left\" valign=\"top\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">共分九品，标志是至尊海与至尊法身。踏入它便能在大千世界中成为强者，九品至尊在至尊中属顶尖强者。相当于域外最低级的<span style=\"font-weight: 700;\">魔将</span></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">地至尊</span></td><td align=\"center\" valign=\"middle\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">标志是天地之相放眼整个大千世界都能拥有响彻一方的惊天之名，恢复力极强大。相当邪族<span style=\"font-weight: 700;\">魔王</span></td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">下位地至尊</td><td width=\"450\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的初级阶段，<span style=\"font-weight: 700;\">相当初级魔王</span></td></tr><tr><td width=\"83\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上位地至尊</td><td width=\"504\" align=\"center\" valign=\"middle\" colspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的高级阶段，<span style=\"font-weight: 700;\">相当高级魔王</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大圆满地至尊</td><td width=\"513\" align=\"center\" valign=\"middle\" colspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的巅峰阶段，相当<span style=\"font-weight: 700;\">最强魔王</span>；大圆满巅峰的准天至尊相当<span style=\"font-weight: 700;\">魔皇</span></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">天至尊</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; line-height: 24px; zoom: 1; height: auto;\">每品又分初期→中期→后期→巅峰，它能拥有天尊灵体，灵体乃其标志。相当邪族<span style=\"font-weight: 700;\">魔帝</span></div></td></tr><tr><td width=\"5\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵品</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">普通天至尊，相当邪族<span style=\"font-weight: 700;\">幽魔帝</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">仙品</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">高级天至尊，相当邪族<span style=\"font-weight: 700;\">玄魔帝</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品</td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">相当邪族<span style=\"font-weight: 700;\">天魔帝</span>，后期堪比顶尖天魔帝，圣品之路唯有最勇猛不惧者才能冲刺，在失去锐气后基本无缘它了</td></tr><tr><td height=\"22\" align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" class=\"coloredcell\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230); background: rgb(251, 251, 251);\"><span style=\"font-weight: 700;\">主宰境</span></td><td width=\"153\" height=\"22\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; line-height: 24px; zoom: 1; height: auto;\">感应世界意志，召唤苍穹榜，留下姓氏则超脱圣品，留下完整姓名则完全超脱；<span style=\"font-weight: 700;\">大千世界有史以来牧尘是第一个留下全名的人，他将其命名主宰境界！后来“炎帝”萧炎、“武祖”林动两人也成功在榜上留下全名，步入主宰境界。</span></div></td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; font-size: 12px; text-indent: 0px;\"><a name=\"2_1\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_2_1\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"灵力\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div></div></div></h4><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">灵力</h3><h4 class=\"article-name\" style=\"font-family: &quot;microsoft yahei&quot;, Arial, Helvetica, STHeiTi, sans-serif; font-weight: bold; color: black; font-size: 20px; text-align: center;\"><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-weight: normal; text-align: start;\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; text-indent: 0px;\"></div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\">大千的主调，其修炼已在无数代人努力下发展到巅峰，由于它不断繁衍甚至扩散到民间中，导致它与人类日常生活，变得息息相关。因此变得无可替代</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><span style=\"font-weight: 700;\">灵脉</span>：有它的人修炼速度会比常人快不少。随着实力到达某种程度后它便逐渐消匿，很多人都认为它只是修炼最初有作用，到了后面作用便会越来越小，其实只要踏入天至尊修成天尊灵体才能感应到身体深处的它，进而才能将它炼化让自身灵体达到圆满。其越是强横，一经炼化后灵体就越神妙=要炼化它就必须用心火</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><span style=\"font-weight: 700;\">神脉</span>：最为罕见的灵脉。能有它的人都是亿中无一，虽说有它也不一定能踏入天至尊，可成功几率却比常人高很多</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><span style=\"font-weight: 700;\">灵脉神通</span>：天尊灵体圆满领悟的众多神妙之一，也是灵体众多神妙之最，一些神脉衍变出来的它堪比绝世神通中的顶尖层次，甚至能与三十六道绝世神通媲美</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1;\"><span style=\"font-weight: 700;\">天尊灵体</span>：分为灵仙圣3品</div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"text-align: start; margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; color: rgb(0, 0, 0); text-indent: 0px; background-color: rgb(255, 255, 255);\"><tbody><tr><th style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\"><br></th><th style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\"><br></th></tr><tr><td width=\"252\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td width=\"149\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td width=\"199\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td width=\"240\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td width=\"198\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td width=\"149\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding: 2px 10px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><br></td></tr></tbody></table></div></div></h4>', '1501665871', '1501669320');
INSERT INTO `jfy_knowledge` VALUES ('24', '4', '18', '测试1', '<p>差撒大声地a</p>', '1501727211', '1501727211');
INSERT INTO `jfy_knowledge` VALUES ('25', '4', '19', '测试2', '<p>啊撒大声地</p>', '1501727227', '1501727227');
INSERT INTO `jfy_knowledge` VALUES ('26', '4', '20', '测试3', '<p>车阿斯达多阿萨德阿萨德啊</p>', '1501727238', '1501727238');
INSERT INTO `jfy_knowledge` VALUES ('27', '4', '21', '测试哦', '<p>啊实打实大啥就是打开链接</p>', '1501727247', '1501727247');
INSERT INTO `jfy_knowledge` VALUES ('28', '9', '23', '888', '<p>tynnu</p>', '1523864299', '1523864299');

-- ----------------------------
-- Table structure for `jfy_notice`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_notice`;
CREATE TABLE `jfy_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(10) NOT NULL COMMENT '监管者ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '通知内容',
  `is_release` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否发布: y 已发 n 未发 ',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL COMMENT '更新时间',
  `release_time` int(10) NOT NULL COMMENT '发布时间',
  `is_sign` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否签收: y 已签收 n 待签收',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_notice
-- ----------------------------
INSERT INTO `jfy_notice` VALUES ('7', '1', '55321', 'dsfsdafsd', 'y', '1500979197', '1501122176', '1501212658', 'n');
INSERT INTO `jfy_notice` VALUES ('8', '1', '测试哦', '<p>阿萨德阿萨德阿萨德a</p><img src=http://192.168.199.236/zhianbao_api/images/15009781928828.jpeg></img>', 'y', '1500985969', '1500985969', '150098599', 'n');
INSERT INTO `jfy_notice` VALUES ('9', '1', '阿萨德', '<p>阿萨德</p>', 'y', '1501038361', '1501038361', '1501121827', 'n');
INSERT INTO `jfy_notice` VALUES ('10', '1', '666', 'dsfsdafsd', 'y', '1501121386', '1501122149', '1501121765', 'n');
INSERT INTO `jfy_notice` VALUES ('11', '1', '阿萨德试试', '<p>阿萨德对对对</p>', 'y', '1501235698', '1501235708', '1501235711', 'n');
INSERT INTO `jfy_notice` VALUES ('12', '2', '互动通知', '<p>22222</p>', 'y', '1501237939', '1501237939', '1501240066', 'n');
INSERT INTO `jfy_notice` VALUES ('13', '1', '测试', '<p>阿萨德阿萨德</p>', 'n', '1501238093', '1501238093', '0', 'n');
INSERT INTO `jfy_notice` VALUES ('14', '4', '测试', '<p>这是个测试</p>', 'y', '1503307988', '1503307988', '1503479979', 'n');
INSERT INTO `jfy_notice` VALUES ('15', '9', 'oooo', '<p>bhunjnjnjnj</p>', 'y', '1523864331', '1523864331', '1523864344', 'n');

-- ----------------------------
-- Table structure for `jfy_orders`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_orders`;
CREATE TABLE `jfy_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0' COMMENT '发单公司ID',
  `accept_user_id` int(10) NOT NULL DEFAULT '0' COMMENT '接单公司ID',
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '家政员ID',
  `order_bn` varchar(20) NOT NULL COMMENT '订单编号',
  `total_amount` decimal(20,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `service_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '服务价格',
  `real_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '实际需要付款的价格',
  `is_pay` enum('noPay','succPay','partPay','refund','partRefund') NOT NULL DEFAULT 'noPay' COMMENT '是否支付:noPay:未支付,succPay:已支付,partPay部分支付:,refund:退款,partRefund:部分退款',
  `pay_type` enum('unknow','all','deposit','coupon','stage') NOT NULL DEFAULT 'unknow' COMMENT '支付类型:unknow 未知;all 全款;deposit 定金;stage 分期  coupon 家服卡',
  `service_type` enum('cooking_aunts','enterprise_cleaning','maternity_matron','sister_in_law','deep_cleaning','wipe_glass','kitchen_maintenance','toilet_maintenance','floor_waxing','aged_care','refrigerator_cleaning','oil_fume_cleaning','washing_machine_cleaning','air_conditioning_cleaning','carpet_cleaning','sofa_cleaning','deep_demodex','single_cleaning','medals','set_dinner','health_package','open_wasteland','long_term_housekeeping') NOT NULL COMMENT '服务分类long_term_housekeeping长期钟点工cooking_aunts住家/早出晚归保姆enterprise_cleaning企业保洁maternity_matron月嫂sister_in_law育儿嫂kitchen_maintenance厨房保养卫生间保养sofa_cleaning沙发清洗deep_demodex深度除螨single_cleaning临时保洁medals家庭收纳set_dinner金牌收纳health_package健康生活open_wasteland开荒',
  `service_status` enum('wait','confirm','test','work','cancel','test_close','change','close','finish') NOT NULL DEFAULT 'wait' COMMENT '服务状态 wait:待确认,confirm:已确认,test:试工;work:上单;cancel:取消;test_close:试工关闭;change:更换家政员;close:关闭;finish:完成',
  `custom_mark_text` text CHARACTER SET utf8mb4 COMMENT '买家订单备注',
  `admin_mark_text` text CHARACTER SET utf8mb4 NOT NULL COMMENT '商家订单备注',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `service_content` longtext NOT NULL COMMENT '服务内容',
  `service_time` int(10) NOT NULL DEFAULT '0' COMMENT '约定的服务时间',
  `consignee` varchar(50) DEFAULT '' COMMENT '收货人',
  `address` varchar(255) DEFAULT '' COMMENT '收货地址',
  `mobile` varchar(50) DEFAULT '' COMMENT '收货人手机',
  `country` int(10) DEFAULT '0' COMMENT '国家',
  `province` int(10) DEFAULT '0' COMMENT '省份',
  `city` int(10) DEFAULT '0' COMMENT '城市',
  `district` int(10) DEFAULT '0' COMMENT '地区',
  `publish` enum('y','order','n') NOT NULL DEFAULT 'n' COMMENT '是否发布 y:已发布 n:未发布 order:发布并接单',
  `change_time` int(10) NOT NULL DEFAULT '0' COMMENT '换工次数',
  `source` enum('offline','online') NOT NULL DEFAULT 'online' COMMENT '订单来源 offline线下 online线上',
  `pay_notice` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否收支提醒',
  `visit_notice` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '回访提醒',
  `goods_order_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品订单ID',
  `supplement_mark_text` text COMMENT '补充备注',
  `is_check` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否平台审核: y 是 n 否',
  `send_count` int(10) NOT NULL DEFAULT '0' COMMENT '推荐简历次数',
  `payment_deadline` int(10) NOT NULL DEFAULT '0' COMMENT '支付截止时间',
  `order_type` enum('ordinary','long_term') NOT NULL DEFAULT 'ordinary' COMMENT 'ordinary 普通订单; long_term长期订单',
  `change_price_time` int(11) NOT NULL DEFAULT '0' COMMENT '改价次数',
  `is_coupon` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否使用家服卡或优惠券 0否 1使用',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `refund_status` enum('active','refund','refund_end') NOT NULL DEFAULT 'active' COMMENT '是否售后:active:未售后,refund:售后中,refund_end:售后结束',
  `change_price_status` enum('active','change','changre_refuse','changre_agree') NOT NULL DEFAULT 'active' COMMENT '改价状态:active:未改价,change:改价中,changre_refuse:改价失败,changre_agree:改价失败',
  PRIMARY KEY (`id`),
  KEY `order_bn` (`order_bn`) USING BTREE COMMENT '订单编号',
  KEY `coupon_id` (`coupon_id`) USING BTREE COMMENT '优惠券id',
  KEY `user_id` (`user_id`) USING BTREE COMMENT '发单公司',
  KEY `accept_user_id` (`accept_user_id`) USING BTREE COMMENT '接单公司id',
  KEY `customer_id` (`customer_id`) USING BTREE COMMENT '用户id',
  KEY `staff_id` (`staff_id`) USING BTREE COMMENT '家政员id'
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_orders
-- ----------------------------
INSERT INTO `jfy_orders` VALUES ('393', '0', '0', '1', '0', 'O2018041929855854900', '135.00', '0.00', '45.00', '135.00', 'refund', 'all', 'single_cleaning', 'close', '', '', '1524129855', '1524130042', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":3,\"unit\":\"小时\"}]', '1524376800', '周凯', '新南路501', '18521722857', '1', '310000', '310100', '310117', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524130755', 'ordinary', '0', '0', '0', 'refund_end', 'active');
INSERT INTO `jfy_orders` VALUES ('394', '0', '3', '1', '0', 'O2018041930069723600', '155.00', '0.00', '45.00', '155.00', 'partPay', 'all', 'single_cleaning', 'confirm', '', '', '1524130069', '1524130604', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":3,\"unit\":\"小时\"}]', '1556344800', '周凯', '新南路501', '18521722857', '1', '310000', '310100', '310117', 'n', '0', 'online', 'n', 'n', '0', '', 'y', '0', '1524131504', 'ordinary', '1', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('395', '0', '0', '1', '0', 'O2018041931198109500', '135.00', '0.00', '45.00', '135.00', 'noPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524131198', '1524131198', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":3,\"unit\":\"小时\"}]', '1524301200', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132098', 'ordinary', '0', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('396', '0', '0', '1', '0', 'O2018041931351960000', '180.00', '0.00', '45.00', '180.00', 'noPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524131351', '1524131351', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132251', 'ordinary', '0', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('397', '0', '0', '1', '0', 'O2018041931417260000', '180.00', '0.00', '45.00', '180.00', 'noPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524131417', '1524131417', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132317', 'ordinary', '0', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('398', '0', '0', '1', '0', 'O2018041931742560000', '180.00', '0.00', '45.00', '180.00', 'noPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524131742', '1524131742', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132642', 'ordinary', '0', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('399', '0', '0', '1', '0', 'O2018041931757060000', '180.00', '0.00', '45.00', '180.00', 'noPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524131757', '1524131757', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132657', 'ordinary', '0', '0', '0', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('406', '0', '0', '1', '0', 'O2018041932090860000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'unknow', 'single_cleaning', 'wait', '', '', '1524132090', '1524132090', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524132990', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('407', '0', '0', '1', '0', 'O2018041933303460000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133303', '1524133303', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134203', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('408', '0', '0', '1', '0', 'O2018041933366560000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133366', '1524133366', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134266', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('409', '0', '0', '1', '0', 'O2018041933376560000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133376', '1524133376', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134276', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('410', '0', '0', '1', '0', 'O2018041933410260000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133410', '1524133410', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134310', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('411', '0', '0', '1', '0', 'O2018041933434760000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133434', '1524133434', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134334', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('422', '0', '0', '1', '0', 'O2018041933840460000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133840', '1524133840', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134740', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('423', '0', '0', '1', '0', 'O2018041933898560000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133898', '1524133898', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134798', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('424', '0', '0', '1', '0', 'O2018041933899860000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133899', '1524133899', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134799', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('425', '0', '0', '1', '0', 'O2018041933900660000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133900', '1524133900', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134800', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('426', '0', '0', '1', '0', 'O2018041933944560000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524133944', '1524133944', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134844', 'ordinary', '0', '1', '1332', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('427', '0', '0', '1', '0', 'O2018041934005760000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524134005', '1524134005', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524134905', 'ordinary', '0', '1', '1333', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('430', '0', '0', '1', '0', 'O2018041934281960000', '180.00', '0.00', '45.00', '180.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524134281', '1524134281', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524135181', 'ordinary', '0', '1', '1333', 'active', 'active');
INSERT INTO `jfy_orders` VALUES ('431', '0', '0', '1', '0', 'O2018041934780760000', '0.00', '0.00', '45.00', '0.00', 'succPay', 'coupon', 'single_cleaning', 'wait', '', '', '1524134780', '1524134780', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"4\",\"unit\":\"小时\"}]', '1524222000', '张伟', '', '15516517307', '1', '310000', '310100', '310152', 'n', '0', 'online', 'n', 'n', '0', '', 'n', '0', '1524135680', 'ordinary', '0', '1', '1333', 'active', 'active');

-- ----------------------------
-- Table structure for `jfy_orders_2`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_orders_2`;
CREATE TABLE `jfy_orders_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT '0' COMMENT '接单公司ID',
  `accept_company_id` int(10) NOT NULL DEFAULT '0' COMMENT '接单公司ID',
  `customer_id` int(10) NOT NULL COMMENT '发布需求会员ID',
  `bbc_customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '发布需求bbc会员ID',
  `staff_id` int(10) NOT NULL COMMENT '平台家政员ID',
  `bn` varchar(20) NOT NULL COMMENT '订单编号',
  `total_amount` decimal(20,2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `service_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '服务价格',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_time` int(10) DEFAULT '0' COMMENT '支付时间',
  `payment_code` enum('credit','alipay','wechat','none') DEFAULT 'none' COMMENT '支付方式',
  `serial_bn` varchar(255) NOT NULL COMMENT '支付流水号',
  `service_type` enum('matron','careBaby','careElderly','nanny','longHours','quickClean','tempClean','depthClean') NOT NULL COMMENT '服务类型 tempClean:临时保洁,quickClean:宅速洁,longHours:长期钟点工,nanny:保姆,careElderly:看护老人,careBaby:育儿嫂,matron:月嫂,depthClean:开荒保洁',
  `order_status` enum('wait','confirm','test','work','cancel','test_close','change','close','finish') NOT NULL DEFAULT 'wait' COMMENT '订单状态 wait:待确认 active:已确认,待指派',
  `custom_mark_text` text NOT NULL COMMENT '买家订单备注',
  `admin_mark_text` text CHARACTER SET utf8mb4 NOT NULL COMMENT '商家订单备注',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL,
  `content` text NOT NULL COMMENT '需求内容',
  `consignee` varchar(50) DEFAULT '' COMMENT '收货人',
  `address` varchar(255) DEFAULT '' COMMENT '收货地址',
  `mobile` varchar(50) DEFAULT '' COMMENT '收货人手机',
  `country` int(10) DEFAULT '0' COMMENT '国家',
  `province` int(10) DEFAULT '0' COMMENT '省份',
  `city` int(10) DEFAULT '0' COMMENT '城市',
  `district` int(10) DEFAULT '0' COMMENT '地区',
  `mark` text NOT NULL COMMENT '买家备注',
  `publish` enum('y','order','n') NOT NULL DEFAULT 'y' COMMENT '是否发布 y:已发布 n:未发布 order:发布并接单',
  `change_time` int(10) NOT NULL DEFAULT '0' COMMENT '换工次数',
  `source` enum('offline','online') NOT NULL DEFAULT 'online' COMMENT '订单来源 offline线下 online线上',
  `pay_notice` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否收支提醒',
  `visit_notice` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '回访提醒',
  `goods_order_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品订单ID',
  `server_img` varchar(255) NOT NULL COMMENT '服务类型图片',
  `supplement_mark_text` text COMMENT '补充备注',
  `is_jfy` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否平台发布: y 是 n 否',
  `send_count` int(10) NOT NULL DEFAULT '0' COMMENT '推荐简历次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_orders_2
-- ----------------------------
INSERT INTO `jfy_orders_2` VALUES ('60', '2', '0', '23', '0', '21', 'O171019160504548', '11.00', '0.00', '11.00', '1', '1508754669', 'none', '', 'longHours', 'work', '', '', '1508400337', '1517373792', '{\"homeArea\":\"100\",\"serviceBeginTime\":\"2018/01/31 \",\"weekServiceTime\":\"周一~周日\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '0.10321', '15516517307', '1', '210000', '210200', '210203', '', 'y', '3', 'offline', 'y', 'y', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('61', '1', '2', '23', '0', '29', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'close', '', '', '1508743966', '1512022328', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('62', '14', '14', '21', '0', '0', 'O171128163657136', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', '', '', '', '1511858183', '1511858200', '{\"serviceBeginTime\":\"2018/03/5\",\"weekServiceTime\":\"\",\"homeArea\":\"10\",\"cookieTaste\":{\"taste\":\"无\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"无\",\"needDrug\":\"不需要用药\"}', 'chen', '11', '18272878105', '1', '210000', '210200', '210203', '', 'n', '0', 'online', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('63', '1', '2', '23', '0', '29', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'wait', '', '', '1508743966', '1511851202', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('64', '1', '2', '23', '0', '29', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'wait', '', '', '1508743966', '1511851202', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('65', '1', '2', '23', '0', '29', 'O171023153251151', '100.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'work', '', '', '1508743966', '1514514267', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('66', '1', '2', '23', '0', '29', 'O171023153251151', '20.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'work', '', '', '1508743966', '1512104039', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('67', '2', '2', '23', '0', '53', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'test', '', '', '1508743966', '1517802566', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'n', '1', 'offline', 'n', 'n', '0', '', null, 'n', '1');
INSERT INTO `jfy_orders_2` VALUES ('68', '1', '2', '23', '0', '29', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'cancel', '', '', '1508743966', '1512022230', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('69', '1', '2', '23', '0', '0', 'O171023153251151', '20000.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'work', '', '', '1508743966', '1512119590', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '3', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('70', '1', '2', '23', '0', '29', 'O171023153251151', '2000.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'close', '', '', '1508743966', '1516761141', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '3', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('71', '1', '2', '23', '0', '29', 'O171023153251151', '1.00', '0.00', '0.00', '1', '1509959199', 'none', '', 'nanny', 'test_close', '', '', '1508743966', '1512013085', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('72', '1', '2', '23', '0', '29', 'O171023153251151', '200.00', '0.00', '0.00', '1', '1512021317', 'none', '', 'nanny', 'finish', '', '', '1508743966', '1512021584', '{\"homeArea\":\"200\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '3213', '15516517307', '1', '210000', '210200', '210203', '', 'order', '1', 'offline', 'n', 'n', '0', '', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('73', '2', '2', '72', '0', '0', 'O171207150968940', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512630571', '1512630571', '{\"serviceBeginTime\":\"2017-12-07 14:42\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1630', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('74', '2', '2', '72', '0', '0', 'O171207150985706', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512630583', '1512630583', '{\"serviceBeginTime\":\"2017-12-07 14:42\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1631', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('75', '2', '2', '72', '0', '0', 'O171207151034372', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512630605', '1512630605', '{\"serviceBeginTime\":\"2017-12-07 14:42\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1632', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('76', '2', '2', '72', '0', '0', 'O171207151045151', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512630627', '1512630627', '{\"serviceBeginTime\":\"2017-12-07 14:42\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1633', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('77', '2', '2', '72', '0', '0', 'O171207151145948', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512630661', '1512630661', '{\"serviceBeginTime\":\"2017-12-07 14:42\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1634', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('78', '2', '2', '72', '0', '0', 'O171207152627839', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512631607', '1512631607', '{\"serviceBeginTime\":\"2017-12-07 15:16\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '啊飒飒大时代拉凯迪拉克桑德拉打开了是多少懒得看浏览速度快；阿里看到；阿拉山口的；阿兰卡', '15516517307', '1', '210000', '210200', '210203', '', 'n', '0', 'online', 'n', 'n', '1635', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('79', '2', '2', '72', '0', '0', 'O171207153100620', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512631904', '1512631904', '{\"serviceBeginTime\":\"2017-12-07 15:30\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e00\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('80', '2', '2', '72', '0', '0', 'O171207153696659', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512632201', '1512632201', '{\"serviceBeginTime\":\"2017-12-07 15:35\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e00\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('81', '2', '2', '72', '0', '0', 'O171207153827735', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512632321', '1512632321', '{\"serviceBeginTime\":\"2017-12-07 15:38\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('82', '2', '2', '72', '0', '0', 'O171207155226505', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512633136', '1512633136', '{\"serviceBeginTime\":\"2017-12-07 15:52\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('83', '2', '2', '88', '0', '0', 'O171207162823612', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512635297', '1512635297', '{\"serviceBeginTime\":\"2017-12-7 8:00\",\"weekServiceTime\":\"\",\"serviceTime\":\"\\u56db\\u5c0f\\u65f6\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', 'chenM3', '这是我的详细地址', '18272878105', '1', '410000', '411600', '411624', '', 'n', '0', 'online', 'n', 'n', '1638', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('84', '2', '2', '88', '0', '0', 'O171207162999961', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512635341', '1512635341', '{\"serviceBeginTime\":\"2017-12-7 8:00\",\"weekServiceTime\":\"\",\"serviceTime\":\"\\u56db\\u5c0f\\u65f6\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', 'chenM3', '这是我的详细地址', '18272878105', '1', '410000', '411600', '411624', '', 'n', '0', 'online', 'n', 'n', '1639', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('86', '21', '21', '454', '0', '0', 'O171207172602979', '2000.00', '0.00', '0.00', '1', '1512984770', 'none', '', 'nanny', 'work', '', '', '1512638770', '1513081563', '{\"homeArea\":\"100\",\"cookieTaste\":{\"taste\":\"偏咸\",\"con\":\"\"},\"serviceBeginTime\":\"2017/12/11 \",\"liveHome\":\"y\",\"hasPet\":\"小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,小型犬,\",\"extRequire\":\"其他需求其他需求\"}', '刘仁松', '新华路365弄', '13312345678', '1', '310000', '310100', '310104', '这里是备注', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('87', '2', '2', '72', '0', '0', 'O171207172747931', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512638841', '1512638841', '{\"serviceBeginTime\":\"2017-12-07 17:26\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1640', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('88', '2', '2', '72', '0', '0', 'O171207173198050', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1512639110', '1512639110', '{\"serviceBeginTime\":\"2017-12-07 17:31\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e8c\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1641', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('89', '21', '21', '456', '0', '41', 'O171207173727219', '2000.00', '0.00', '0.00', '1', '1512728785', 'none', '', 'careElderly', 'close', '', '', '1512639453', '1512729503', '{\"oldManSex\":\"男\",\"oldManAge\":\"78\",\"serviceBeginTime\":\"2017/12/11 \",\"independLive\":\"half\",\"needDrug\":\"n\",\"liveHome\":\"n\",\"hasPet\":\"小型犬,\",\"extRequire\":\"没有其他需求\"}', '王村', '新华路365弄6号华东科技园2号楼', '18522223333', '1', '310000', '310100', '310104', '嗨，这里是备注！', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457734370.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('90', '21', '21', '454', '0', '0', 'O171207181368863', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'cancel', '', '', '1512641635', '1512642753', '{\"serviceBeginTime\":\"2017-12-07 18:10\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e00\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', '周琼', '博山东路20弄5号', '18522220000', '1', '310000', '310000', '310107', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('91', '21', '21', '454', '0', '0', 'O171207182323554', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'cancel', '', '', '1512642194', '1512642723', '{\"dueDate\":\"2017-12-7\",\"extRequire\":\"fsgsdhgshsf\",\"hasPet\":\"\\u732b,\\u5176\\u4ed6,\",\"liveHome\":\"y\",\"cookieTaste\":\"\\u65e0\",\"serviceBeginTime\":\"2017-12-7\"}', '周琼', '博山东路20弄5号', '18522220000', '1', '310000', '310000', '310107', '', 'n', '0', 'online', 'n', 'n', '1642', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('92', '2', '2', '88', '0', '0', 'O171208103583558', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'wait', '', '', '1512700546', '1512700546', '{\"serviceBeginTime\":\"2017-12-7\",\"homeArea\":\"\",\"babySex\":\"\\u7537\",\"babyCount\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"\\u4f4f\\u5bb6\"}', 'chenM3', '这是我的详细地址', '18272878105', '1', '410000', '411600', '411624', '', 'n', '0', 'online', 'n', 'n', '1643', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('93', '2', '2', '72', '0', '0', 'O171208175912763', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'wait', '', '', '1512727194', '1512727194', '{\"serviceBeginTime\":\"2017-12-8\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1647', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('94', '21', '21', '469', '0', '42', 'O171211160993091', '2.00', '0.00', '0.00', '1', '1512985498', 'none', '', 'longHours', 'work', '', '', '1512979762', '1512985498', '{\"homeArea\":\"\",\"serviceBeginTime\":\"\",\"weekServiceTime\":\"周一~周日\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张三', '地址地址', '18272878105', '1', '140000', '141000', '141022', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('95', '21', '21', '21', '0', '47', 'O171211161499656', '1.00', '0.00', '0.00', '1', '1512984068', 'none', '', 'longHours', 'close', '', '', '1512980048', '1513246651', '{\"homeArea\":\"\",\"serviceBeginTime\":\"\",\"weekServiceTime\":\"周一~周日\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张三', '地址地址', '18272878105', '1', '140000', '141000', '141022', '', 'n', '1', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('96', '23', '23', '471', '0', '43', 'O171212152072101', '50000.00', '0.00', '0.00', '1', '1513063406', 'none', '', 'matron', 'finish', '', '', '1513063252', '1513063416', '{\"dueDate\":\"2017/12/30 \",\"liveHome\":\"y\",\"hasPet\":\"其他,\",\"extRequire\":\"发送大法师其他需求\"}', '王安石', '的方式发噶大锅饭大锅饭大概的发', '15212345678', '1', '210000', '210300', '210302', '备注备注备注备注备注', 'n', '2', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('97', '23', '23', '473', '0', '44', 'O171212162890659', '1000.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'change', '', '', '1513067336', '1513244034', '{\"serviceBeginTime\":\"2017-12-15 10:30\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"serviceTime\":\"\\u4e00\\u5c0f\\u65f6\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"\"}', 'sss', 'dfgsdfgdfg', '13312345678', '1', '310000', '310100', '310230', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('98', '23', '23', '473', '0', '43', 'O171212184025342', '30000.00', '0.00', '0.00', '1', '1513075303', 'none', '', 'matron', 'finish', '', '', '1513075210', '1513075307', '{\"dueDate\":\"2017-12-15\",\"extRequire\":\"\\u53d1\\u5c04\\u70b9\\u6cd5\\u7ed9\",\"hasPet\":\"\\u5176\\u4ed6,\",\"liveHome\":\"y\",\"cookieTaste\":\"\\u65e0\",\"serviceBeginTime\":\"2017-12-15\"}', 'sss', 'dfgsdfgdfg', '13312345678', '1', '310000', '310100', '310230', '', 'n', '0', 'online', 'n', 'n', '1648', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('99', '2', '2', '88', '0', '0', 'O171212205582831', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'wait', '', '', '1513083353', '1513083353', '{\"serviceBeginTime\":\"2017-12-17\",\"homeArea\":\"\",\"babySex\":\"\\u7537\",\"babyCount\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\",\"cookieTaste\":\"\\u65e0\"}', 'chenM3', '这是我的详细地址', '18272878105', '1', '410000', '411600', '411624', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('100', '2', '2', '72', '0', '0', 'O171213143289481', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'wait', '', '', '1513146746', '1513146746', '{\"serviceBeginTime\":\"2017-12-13\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('101', '2', '2', '72', '0', '0', 'O171213144613395', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'wait', '', '', '1513147576', '1513147576', '{\"serviceBeginTime\":\"2017-12-13\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('102', '2', '2', '72', '0', '0', 'O171213144775178', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'wait', '', '', '1513147634', '1513147634', '{\"serviceBeginTime\":\"2017-12-13\",\"weekServiceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('103', '2', '2', '72', '0', '0', 'O171213145118293', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'wait', '', '', '1513147894', '1513147894', '{\"serviceBeginTime\":\"2017-12-13\",\"homeArea\":\"\",\"babySex\":\"\\u7537\",\"babyCount\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\",\"cookieTaste\":\"\\u65e0\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('104', '2', '2', '72', '0', '0', 'O171213150356348', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1513148597', '1513148597', '{\"serviceBeginTime\":\"2017-12-13 8:00\",\"weekServiceTime\":\"\",\"serviceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1650', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('105', '2', '2', '72', '0', '0', 'O171213150863584', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1513148926', '1513148926', '{\"serviceBeginTime\":\"2017-12-13 8:00\",\"weekServiceTime\":\"\",\"serviceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('106', '2', '2', '72', '0', '0', 'O171213151018528', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1513149033', '1513149033', '{\"serviceBeginTime\":\"2017-12-13 8:00\",\"weekServiceTime\":\"\",\"serviceTime\":\"\",\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"\\u65e0\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('107', '21', '21', '461', '0', '47', 'O171213171667759', '1.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'close', '', '', '1513156563', '1513246462', '{\"homeArea\":\"\",\"serviceBeginTime\":\"\",\"weekServiceTime\":\"周一~周日\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张三', '11', '18272878105', '1', '420000', '420800', '420804', '', 'n', '1', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('108', '21', '21', '468', '0', '45', 'O171213175607490', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'close', '', '', '1513158960', '1513246265', '{\"dueDate\":\"2017/12/20 \",\"liveHome\":\"y\",\"hasPet\":\"其他,\",\"extRequire\":\"年龄五十岁以下\"}', '宙斯', '平安路365号', '18533332222', '1', '140000', '140800', '140829', '独家试爱很费劲啊', 'n', '2', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('109', '21', '21', '461', '0', '45', 'O171214160418567', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'close', '', '', '1513238684', '1513246122', '{\"serviceBeginTime\":\"2017/12/14 16:4:39\",\"serviceEndTime\":\"2017/12/14 20:4:39\",\"extRequire\":\"\"}', '18272878105', '18272878105', '18272878105', '1', '350000', '350900', '350983', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('110', '23', '23', '473', '0', '0', 'O171214174176880', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'change', '', '', '1513244462', '1513244719', '{\"dueDate\":\"2017/12/20 \",\"liveHome\":\"y\",\"hasPet\":\"其他,\",\"extRequire\":\"师范师大其他需求\"}', '周周', '新华路365弄', '13311110000', '1', '310000', '310100', '310104', '第三方备注', 'n', '1', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('111', '23', '23', '474', '0', '43', 'O171214175780442', '8000.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'change', '', '', '1513245435', '1513246556', '{\"dueDate\":\"2017/12/18 \",\"liveHome\":\"y\",\"hasPet\":\"其他,\",\"extRequire\":\"士大夫士大夫公司\"}', '赵玉生', '士大夫豆腐干岁的', '17612345678', '1', '360000', '360400', '360402', '的士大夫十分', 'n', '2', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('112', '21', '21', '461', '0', '47', 'O171215110869825', '1.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'work', '', '', '1513307291', '1513742354', '{\"homeArea\":\"\",\"serviceBeginTime\":\"\",\"weekServiceTime\":\"周一~周日\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"\",\"dayServiceEndTime\":\"\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '陈蒙', '* 详细地址', '18272878105', '1', '420000', '420700', '420704', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', '哈就开始建设规划放大看', 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('113', '23', '23', '472', '0', '0', 'O171215125794950', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careElderly', 'confirm', '', '', '1513313877', '1513313884', '{\"oldManSex\":\"男\",\"oldManAge\":\"75\",\"serviceBeginTime\":\"2017/12/20 \",\"independLive\":\"half\",\"needDrug\":\"y\",\"liveHome\":\"y\",\"hasPet\":\"其他,\",\"extRequire\":\"腹股沟\"}', '刘先生', '是法国士大夫噶地方士大夫', '18522220000', '1', '350000', '350500', '350583', '岁的法国', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457734370.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('114', '2', '2', '72', '0', '0', 'O171218164446207', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careElderly', 'wait', '', '', '1513586663', '1513586663', '{\"serviceBeginTime\":\"2017-12-18\",\"homeArea\":\"\",\"oldManSex\":\"\\u7537\",\"oldManAge\":\"\",\"needDrug\":\"n\",\"independLive\":\"all\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\",\"cookieTaste\":\"\\u65e0\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1652', 'http://img.mshenpu.com/15124457734370.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('115', '2', '2', '72', '0', '51', 'O171218164626868', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'close', '', '', '1513586765', '1516761108', '{\"serviceBeginTime\":\"2017/12/18 \",\"homeArea\":\"\",\"babySex\":\"男\",\"babyCount\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\",\"cookieTaste\":\"无\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1653', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('116', '21', '2', '461', '0', '0', 'O171220145535239', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'wait', '', '', '1513752930', '1514960402', '{\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '陈先生', ' 详细地址', '18272878105', '1', '310000', '310100', '310231', '', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', '这是订单的补充说明！！！！！！！123123', 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('117', '21', '21', '461', '0', '50', 'O171220153562391', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'test', '', '', '1513755325', '1514516041', '{\"serviceBeginTime\":\"2017/12/20 15:35:25\",\"serviceEndTime\":\"2017/12/20 18:35:25\",\"extRequire\":\"\"}', 'chen', '详细地', '18272878105', '1', '420000', '420700', '420704', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', '这是补充说明', 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('121', '0', '21', '0', '435', '0', 'O171227172577466', '180.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514366711', '1514517407', '{\"serviceBeginTime\":\"2017-12-27 00:00\",\"extRequire\":\"13\"}', '周', '120号花园小区163号301', '18522229999', '1', '310000', '310100', '310152', '12我是备注', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('122', '0', '21', '0', '46', '0', 'O171228101300364', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514427232', '1514948677', '{\"serviceBeginTime\":\"2017-09-01 00:00\",\"extRequire\":\"13\"}', '陈先生002', '地址', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('123', '0', '21', '0', '46', '0', 'O171228101961844', '180.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514427563', '1514540156', '{\"serviceBeginTime\":\"2017-09-01 00:01\",\"extRequire\":\"123123\"}', '陈先生', '120号花园小区13号402', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('125', '0', '2', '0', '46', '0', 'O171228111948252', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514431170', '1514514157', '{\"serviceBeginTime\":\"2017-09-01 09:01\",\"extRequire\":\"123123123qeqweqweqwe\"}', '陈先生002', '地址', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('126', '0', '2', '0', '46', '29', 'O171228115821567', '1.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'work', '', '', '1514433491', '1514514207', '{\"serviceBeginTime\":\"2017-09-01 09:01\",\"extRequire\":\"123123123qeqweqweqwe\"}', '陈先生002', '地址', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('127', '0', '21', '0', '46', '0', 'O171228115970170', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514433570', '1514517266', '{\"serviceBeginTime\":\"2017-09-01 00:01\",\"extRequire\":\"\"}', '1', '111', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('128', '0', '21', '0', '46', '41', 'O171228120014228', '2000.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'work', '', '', '1514433612', '1514515239', '{\"serviceBeginTime\":\"2017-09-01 00:00\",\"extRequire\":\"122\"}', '陈先生001', '这是xiangxidizh详细地址', '18272878105', '1', '310000', '310100', '310152', '', 'order', '3', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('129', '21', '2', '454', '0', '51', 'O171228162727070', '500.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'work', '', '', '1514449667', '1516617164', '{\"homeArea\":\"120\",\"cookieTaste\":{\"taste\":\"偏咸\",\"con\":\"\"},\"serviceBeginTime\":\"2017/12/30 \",\"liveHome\":\"n\",\"hasPet\":\"猫,\",\"extRequire\":\"有多久啊的需求\"}', '周琼', '阿斯顿噶发的价格还', '18522220000', '1', '310000', '310100', '310152', '我是备注12132', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('130', '0', '21', '0', '46', '0', 'O171229113786039', '180.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514518654', '1514540116', '{\"serviceBeginTime\":\"2017-09-01 00:01\",\"extRequire\":\"\\u8fd9\\u662f\\u5907\\u6ce8\\u8fd9\\u662f\\u5907\\u6ce8\\u8fd9\\u662f\\u5907\\u6ce8\\u8fd9\\u662f\\u5907\\u6ce8\\u8fd9\\u662f\\u5907\\u6ce8\"}', '123', '120号花园小区123', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('131', '0', '0', '0', '46', '0', 'O171229114314658', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514519028', '1514519028', '{\"serviceBeginTime\":\"2017-09-01 09:01\",\"extRequire\":\"mddasd\"}', 'chenM1', '这是我的详细地址', '18272878102', '1', '410000', '411600', '411628', '', 'y', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('132', '0', '21', '0', '46', '0', 'O180102102664805', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514859977', '1514877872', '{\"serviceBeginTime\":\"2017-09-01 00:00\",\"extRequire\":\"\"}', '陈M', '111', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', 'fghsgfghs', 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('133', '0', '0', '0', '46', '0', 'O180102145521088', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514876133', '1514876133', '{\"serviceBeginTime\":\"2017-09-01 10:01\",\"extRequire\":\"sdfsdfsdfsdfsdfsdfssdfs\"}', '123', '上海213123', '17372878100', '1', '210000', '210200', '210203', '', 'y', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('134', '0', '0', '0', '46', '0', 'O180102180288956', '200.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514887330', '1514887330', '{\"serviceBeginTime\":\"2017-09-01 10:01\",\"extRequire\":\"\"}', 'chenM1', '这是我的详细地址', '18272878102', '1', '410000', '411600', '411628', '', 'y', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('135', '0', '21', '0', '46', '41', 'O180102181983170', '500.00', '0.00', '0.00', '0', '0', 'none', '', 'depthClean', 'finish', '', '', '1514888367', '1515048318', '{\"serviceBeginTime\":\"2017-09-01 09:05\",\"extRequire\":\"vgvgfsv\'g\'f\'s\'g\'h\'s\'f\'g\'h\'s\'gv\\u9b3c\\u65a7\\u795e\\u5de5\\u5f88\\u662f\\u53cd\\u611f\\u548c\\u65bd\\u5de5\\u65b9\"}', '陈', '长达上课打发士大夫噶', '18272878105', '1', '310000', '310100', '310104', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('136', '0', '0', '0', '46', '0', 'O180103101968696', '0.00', '1999.00', '200.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514945982', '1514945982', '{\"serviceBeginTime\":\"2017-09-01 10:01\",\"extRequire\":\"\"}', 'chen', '上海111', '18272878105', '1', '210000', '210200', '210203', '', 'y', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('137', '21', '21', '478', '0', '0', 'O180103102298890', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'wait', '', '', '1514946121', '1514960384', '{\"dueDate\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', 'chen001', 'ad', '18272878105', '1', '420000', '420600', '420606', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('138', '0', '2', '0', '46', '0', 'O180103110087357', '150.00', '50.00', '200.00', '0', '0', 'none', '', 'depthClean', 'wait', '', '', '1514948434', '1514963166', '{\"serviceBeginTime\":\"2017-09-01 00:01\",\"extRequire\":\"\"}', 'chen002', '新华路365弄111', '18272878105', '1', '310000', '310100', '310105', '', 'order', '0', 'online', 'n', 'n', '0', 'http://img.mshenpu.com/15145193829999.png ', null, 'y', '0');
INSERT INTO `jfy_orders_2` VALUES ('139', '21', '2', '478', '0', '29', 'O180103112755338', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'close', '', '', '1514950047', '1514951072', '{\"serviceBeginTime\":\"2018/01/3 11:27:28\",\"serviceEndTime\":\"2018/01/3 13:27:28\",\"extRequire\":\"\"}', '18272878105', '18272878105', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('140', '2', '21', '72', '0', '0', 'O180103135923636', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careElderly', 'wait', '', '', '1514959159', '1514959281', '{\"oldManSex\":\"男\",\"oldManAge\":\"75\",\"serviceBeginTime\":\"2018/01/5 \",\"independLive\":\"half\",\"needDrug\":\"y\",\"liveHome\":\"n\",\"hasPet\":\"小型犬,\",\"extRequire\":\"的风格个\"}', '张伟', '发生的官方的', '15516517307', '1', '310000', '310100', '310109', '', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457734370.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('141', '21', '2', '478', '0', '29', 'O180103143687653', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'close', '', '', '1514961407', '1514961581', '{\"serviceBeginTime\":\"2018/01/3 14:36:45\",\"serviceEndTime\":\"2018/01/3 16:36:45\",\"extRequire\":\"\"}', '18272878105', '18272878105', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('142', '2', '2', '72', '0', '26', 'O180103144051905', '1000.00', '0.00', '0.00', '1', '1514961756', 'none', '', 'careBaby', 'work', '', '', '1514961649', '1514961756', '{\"babyCount\":\"1\",\"babySex\":\"男\",\"serviceBeginTime\":\"2018/01/9 \",\"liveHome\":\"y\",\"hasPet\":\"小型犬,\",\"extRequire\":\"45412132\"}', '张伟', 'hgghjgjhg', '15516517307', '1', '310000', '310100', '310152', '', 'n', '2', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('143', '21', '21', '478', '0', '0', 'O180103145834641', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1514962683', '1514962683', '{\"serviceBeginTime\":\"2018/01/3 14:58:2\",\"serviceEndTime\":\"2018/01/3 17:58:2\",\"extRequire\":\"\"}', '18272878105', '18272878105', '18272878105', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('144', '21', '2', '478', '0', '29', 'O180103145937574', '100.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'work', '', '', '1514962763', '1516009651', '{\"serviceBeginTime\":\"2018/01/3 14:59:21\",\"serviceEndTime\":\"2018/01/3 16:59:21\",\"extRequire\":\"\"}', '18272878105', '18272878105', '18272878105', '1', '310000', '310100', '310152', '', 'order', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('145', '2', '2', '72', '0', '29', 'O180115175925800', '500.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'work', '', '', '1516010340', '1516010372', '{\"serviceBeginTime\":\"2018/01/15 17:58:51\",\"serviceEndTime\":\"2018/01/15 19:58:51\",\"extRequire\":\"321\"}', '213213', '321321321', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('146', '2', '2', '72', '0', '13', 'O180115180198322', '1000.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'finish', '', '', '1516010504', '1516760999', '{\"serviceBeginTime\":\"2018/01/15 18:1:38\",\"serviceEndTime\":\"2018/01/15 20:1:38\",\"extRequire\":\"\"}', '3213', '232321', '15516517307', '1', '210000', '210300', '210303', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('147', '21', '21', '468', '0', '45', 'O180123135311609', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'test', '', '', '1516686806', '1516689542', '{\"homeArea\":\"120\",\"cookieTaste\":{\"taste\":\"清单\",\"con\":\"\"},\"serviceBeginTime\":\"2018/01/25 \",\"liveHome\":\"n\",\"hasPet\":\"猫,\",\"extRequire\":\"fsdfg \"}', '阿三', '中山北路1265号', '18533332222', '1', '310000', '310100', '310108', '备注备注备注', 'n', '4', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('148', '21', '0', '457', '0', '0', 'O180123145656186', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'confirm', '', '', '1516690568', '1517384660', '{\"dueDate\":\"\",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '周凯', '徐家汇路162号平安小区', '18521722857', '1', '310000', '310100', '310104', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '7');
INSERT INTO `jfy_orders_2` VALUES ('149', '2', '2', '72', '0', '51', 'O180124101506162', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'test', '', '', '1516760156', '1516761124', '{\"serviceBeginTime\":\"2017/12/18 \",\"homeArea\":\"\",\"babySex\":\"男\",\"babyCount\":\"\",\"extRequire\":\"\",\"hasPet\":\"none\",\"liveHome\":\"y\",\"cookieTaste\":\"无\"}', '张伟', '111', '15516517307', '1', '140000', '141000', '141021', '', 'n', '0', 'online', 'n', 'n', '1653', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('150', '2', '2', '72', '0', '0', 'O180124102990494', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'wait', '', '', '1516760944', '1516760944', '{\"serviceBeginTime\":\"2018/01/24 10:29:1\",\"serviceEndTime\":\"2018/01/24 13:29:1\",\"extRequire\":\"无\"}', '张伟', '1231321', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('151', '2', '2', '72', '0', '0', 'O180125101844202', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'longHours', 'change', '', '', '1516846713', '1517373750', '{\"homeArea\":\"10\",\"serviceBeginTime\":\"2018/01/25 \",\"weekServiceTime\":\"周一,\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"dayServiceBeginTime\":\"08:30\",\"dayServiceEndTime\":\"08:45\",\"hasPet\":\"小型犬,大型犬,\",\"extRequire\":\"\"}', '张伟', '地址', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('152', '2', '2', '72', '0', '13', 'O180125102133051', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'test', '', '', '1516846873', '1516853082', '{\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"偏咸\",\"con\":\"\"},\"serviceBeginTime\":\"2018/01/25 \",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '323123213', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('153', '2', '2', '72', '0', '0', 'O180125125854554', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'matron', 'confirm', '', '', '1516856283', '1516876383', '{\"dueDate\":\"2018/01/25 \",\"liveHome\":\"y\",\"hasPet\":\"小型犬,大型犬,猫,\",\"extRequire\":\"啊实打实大\"}', '张伟', '3232123', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457733527.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('154', '2', '2', '72', '0', '0', 'O180125183067835', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'nanny', 'confirm', '', '', '1516876243', '1522746998', '{\"homeArea\":\"20\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"2018/01/25 \",\"liveHome\":\"y\",\"hasPet\":\"小型犬,大型犬,猫,\",\"extRequire\":\"\"}', '张伟', '阿萨德', '15516517307', '1', '140000', '141100', '141122', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('155', '2', '0', '72', '0', '0', 'O180130113155619', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'careBaby', 'confirm', '', '', '1517283094', '1517817178', '{\"babyCount\":\"1\",\"babySex\":\"男\",\"serviceBeginTime\":\"2018/01/30 \",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '啊实打实大', '15516517307', '1', '310000', '310100', '310152', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457737535.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('156', '2', '2', '72', '0', '50', 'O180130160057071', '200.00', '0.00', '200.00', '0', '0', 'none', '', 'nanny', 'work', '', '', '1517299256', '1517474839', '{\"homeArea\":\"\",\"cookieTaste\":{\"taste\":\"偏甜\",\"con\":\"\"},\"serviceBeginTime\":\"2018/01/31 \",\"liveHome\":\"y\",\"hasPet\":\"none\",\"extRequire\":\"\"}', '张伟', '啊实打实', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124457735864.png ', null, 'n', '14');
INSERT INTO `jfy_orders_2` VALUES ('158', '2', '0', '72', '0', '0', 'O180131154846683', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'confirm', '', '', '1517384910', '1517801594', '{\"serviceBeginTime\":\"2018/01/31 15:46:59\",\"serviceEndTime\":\"\",\"extRequire\":\"\",\"serveTime\":\"5\"}', '张伟', '32132132', '15516517307', '1', '310000', '310100', '310152', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('159', '2', '0', '72', '0', '0', 'O180131154976847', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'confirm', '', '', '1517384957', '1517801581', '{\"serviceBeginTime\":\"2018/01/31 15:46:59\",\"serviceEndTime\":\"\",\"extRequire\":\"\",\"serveTime\":\"5\"}', '张伟', '32132132', '15516517307', '1', '310000', '310100', '310152', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('160', '2', '0', '72', '0', '0', 'O180131154923380', '0.00', '0.00', '0.00', '0', '0', 'none', '', 'tempClean', 'confirm', '', '', '1517384979', '1517474337', '{\"serviceBeginTime\":\"2018/01/31 15:46:59\",\"serviceEndTime\":\"\",\"extRequire\":\"\",\"serveTime\":\"5\"}', '张伟', '32132132', '15516517307', '1', '310000', '310100', '310152', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');
INSERT INTO `jfy_orders_2` VALUES ('161', '58', '58', '481', '0', '47', 'O180131160464847', '5.00', '0.00', '5.00', '0', '0', 'none', '', 'tempClean', 'confirm', '', '', '1517385858', '1517558197', '{\"serviceBeginTime\":\"2018/01/31 16:4:15\",\"serviceEndTime\":\"\",\"extRequire\":\"\",\"serveTime\":\"5\"}', '张伟', '2132321', '15516517307', '1', '310000', '310100', '310152', '', 'y', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '6');
INSERT INTO `jfy_orders_2` VALUES ('162', '58', '58', '481', '0', '0', 'O180202155964832', '200.00', '0.00', '200.00', '0', '0', 'none', '', 'tempClean', 'confirm', '', '', '1517558340', '1517558438', '{\"serviceBeginTime\":\"2018/02/2 15:59:2\",\"serviceEndTime\":\"\",\"extRequire\":\"\",\"serveTime\":\"5\"}', '张伟', '.2010321', '15516517307', '1', '310000', '310100', '310152', '', 'n', '0', 'offline', 'n', 'n', '0', 'http://img.mshenpu.com/15124463705185.png ', null, 'n', '0');

-- ----------------------------
-- Table structure for `jfy_order_appraise`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_appraise`;
CREATE TABLE `jfy_order_appraise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `demand_id` int(10) NOT NULL DEFAULT '0' COMMENT '需求ID',
  `appraise_id` int(10) NOT NULL DEFAULT '0' COMMENT '评价人ID',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '评价星级',
  `mark` text NOT NULL COMMENT '标签',
  `content` text NOT NULL COMMENT '评价内容',
  `type` enum('customer','staff') NOT NULL COMMENT '评价人类型 customer:雇主 staff:家政员',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_appraise
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_order_change_price_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_change_price_log`;
CREATE TABLE `jfy_order_change_price_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `type` enum('add','reduce') NOT NULL DEFAULT 'add' COMMENT '类型:add:增加 reduce:减少',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '改价金额',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_change_price_log
-- ----------------------------
INSERT INTO `jfy_order_change_price_log` VALUES ('12', '3', '394', 'add', '20.00', '1524130604');

-- ----------------------------
-- Table structure for `jfy_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_log`;
CREATE TABLE `jfy_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `content` text NOT NULL COMMENT '日志内容',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=971 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_log
-- ----------------------------
INSERT INTO `jfy_order_log` VALUES ('942', '393', '用户id为:1的用户进行下单,订单号为:393.订单总金额为135.00元，订单金额为.135.00元.', '1524129855');
INSERT INTO `jfy_order_log` VALUES ('943', '393', '买家退款成功,订单关闭.退款订单支付记录编号【O201804192985585490065】.退款金额:135元', '1524130042');
INSERT INTO `jfy_order_log` VALUES ('944', '394', '用户id为:1的用户进行下单,订单号为:394.订单总金额为135.00元，订单金额为.135.00元.', '1524130069');
INSERT INTO `jfy_order_log` VALUES ('945', '394', '订单审核通过', '1524130119');
INSERT INTO `jfy_order_log` VALUES ('946', '394', '订单【O2018041930069723600】分配服务商成功', '1524130125');
INSERT INTO `jfy_order_log` VALUES ('947', '394', '确认订单成功', '1524130252');
INSERT INTO `jfy_order_log` VALUES ('948', '394', '服务商拒绝确认,订单退回平台', '1524130310');
INSERT INTO `jfy_order_log` VALUES ('949', '394', '订单【O2018041930069723600】分配服务商成功', '1524130324');
INSERT INTO `jfy_order_log` VALUES ('950', '394', '确认订单成功', '1524130330');
INSERT INTO `jfy_order_log` VALUES ('951', '394', '订单改价成功,原因【擦了一个柜子】', '1524130604');
INSERT INTO `jfy_order_log` VALUES ('952', '395', '用户id为:1的用户进行下单,订单号为:395.订单总金额为135.00元，订单金额为.135.00元.', '1524131198');
INSERT INTO `jfy_order_log` VALUES ('953', '396', '用户id为:1的用户进行下单,订单号为:396.订单总金额为180.00元，订单金额为.180.00元.', '1524131351');
INSERT INTO `jfy_order_log` VALUES ('954', '397', '用户id为:1的用户进行下单,订单号为:397.订单总金额为180.00元，订单金额为.180.00元.', '1524131417');
INSERT INTO `jfy_order_log` VALUES ('955', '398', '用户id为:1的用户进行下单,订单号为:398.订单总金额为180.00元，订单金额为.180.00元.', '1524131742');
INSERT INTO `jfy_order_log` VALUES ('956', '399', '用户id为:1的用户进行下单,订单号为:399.订单总金额为180.00元，订单金额为.180.00元.', '1524131757');
INSERT INTO `jfy_order_log` VALUES ('957', '406', '用户id为:1的用户进行下单,订单号为:406.订单总金额为180.00元，订单金额为.180.00元.', '1524132090');
INSERT INTO `jfy_order_log` VALUES ('958', '0', '用户id为:1的用户进行下单,订单号为:407.订单总金额为元，订单金额为.元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('959', '0', '用户id为:1的用户进行下单,订单号为:408.订单总金额为元，订单金额为.元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('960', '0', '用户id为:1的用户进行下单,订单号为:409.订单总金额为元，订单金额为.元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('961', '0', '用户id为:1的用户进行下单,订单号为:422.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('962', '0', '用户id为:1的用户进行下单,订单号为:423.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('963', '0', '用户id为:1的用户进行下单,订单号为:424.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('964', '0', '用户id为:1的用户进行下单,订单号为:425.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('965', '0', '用户id为:1的用户进行下单,订单号为:426.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1332', '0');
INSERT INTO `jfy_order_log` VALUES ('966', '0', '用户id为:1的用户进行下单,订单号为:427.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1333', '0');
INSERT INTO `jfy_order_log` VALUES ('969', '430', '用户id为:1的用户进行下单,订单号为:430.订单总金额为180.00元，订单金额为.180.00元,使用家服卡扣除一次使用记录。家服卡id为:1333', '1524134281');
INSERT INTO `jfy_order_log` VALUES ('970', '431', '用户id为:1的用户进行下单,订单号为:431使用家服卡扣除一次使用记录。家服卡id为:1333', '1524134780');

-- ----------------------------
-- Table structure for `jfy_order_pay_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_pay_log`;
CREATE TABLE `jfy_order_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `pay_id` int(10) NOT NULL DEFAULT '0' COMMENT '支付记录ID',
  `amount` decimal(20,2) NOT NULL COMMENT '金额',
  `reason` varchar(255) NOT NULL COMMENT '理由',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_pay_log
-- ----------------------------
INSERT INTO `jfy_order_pay_log` VALUES ('14', '393', '210', '135.00', '订单退款,原因:12', '1524130042');

-- ----------------------------
-- Table structure for `jfy_order_refund`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_refund`;
CREATE TABLE `jfy_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款单ID',
  `refund_bn` varchar(255) NOT NULL COMMENT '退款单编号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `finance_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付明细ID',
  `item_bn` varchar(255) NOT NULL COMMENT '支付明细编号',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0:未结算 1:已结算',
  `content` text COMMENT '原因',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `is_del` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_refund
-- ----------------------------
INSERT INTO `jfy_order_refund` VALUES ('10', 'R15241300427407', '0', '393', '210', 'O201804192985585490065', '135.00', '1', '12', '1524130042', '1524130042', 'n');

-- ----------------------------
-- Table structure for `jfy_order_refund_apply`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_refund_apply`;
CREATE TABLE `jfy_order_refund_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款单ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_bn` varchar(255) NOT NULL COMMENT '订单编号',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `status` enum('wait','refuse','agree') NOT NULL DEFAULT 'wait' COMMENT '状态 wait 等待:refuse 拒绝:agree 同意',
  `content` text COMMENT '原因',
  `is_jfy` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '平台介入:n 未介入; y 平台介入',
  `jfy_status` enum('active','wait','refuse','agree') NOT NULL DEFAULT 'active' COMMENT '平台状态:active 正常; wait 等待:refuse 拒绝:agree 同意',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_refund_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_order_staff`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_staff`;
CREATE TABLE `jfy_order_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '阿姨ID',
  `staff_name` varchar(255) NOT NULL COMMENT '阿姨名字',
  `status` enum('test_close','finish','test','work_change','close','work') NOT NULL DEFAULT 'test' COMMENT '状态 test:试工,work:上单中:finish:完工,test_pass:试工通过test_close:未通过,work_change:上单时换工',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_staff
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_order_staff_close_amount`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_staff_close_amount`;
CREATE TABLE `jfy_order_staff_close_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '阿姨ID',
  `staff_name` varchar(255) NOT NULL COMMENT '阿姨名字',
  `amount` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '试工金额',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_staff_close_amount
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_order_staff_contract`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_order_staff_contract`;
CREATE TABLE `jfy_order_staff_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '阿姨ID',
  `staff_name` varchar(255) NOT NULL COMMENT '阿姨名字',
  `monthly_pay_time` int(2) NOT NULL DEFAULT '1' COMMENT '每月支付时间',
  `work_month` int(10) NOT NULL DEFAULT '1' COMMENT '签订周期',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '合同金额',
  `customer_intermediary_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '雇主中介费',
  `staff_intermediary_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '家政员中介费',
  `manage_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '管理费(每月)',
  `rest_day` varchar(255) NOT NULL COMMENT '休息天数(每周/每月)',
  `work_content` text NOT NULL COMMENT '工作内容',
  `return_customer_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款给客户',
  `return_staff_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款给家政员',
  `receive_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '关闭时应收金额',
  `mark` varchar(255) NOT NULL COMMENT '备注',
  `attachment` text NOT NULL COMMENT '合同附件',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL,
  `status` enum('close','finish','active') NOT NULL DEFAULT 'active' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_order_staff_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner`;
CREATE TABLE `jfy_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL,
  `login_password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `is_enable` enum('y','n') NOT NULL DEFAULT 'y',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '最后登录IP',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_contract`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_contract`;
CREATE TABLE `jfy_partner_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` varchar(255) NOT NULL,
  `bn` varchar(255) NOT NULL COMMENT '编号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `mark` varchar(255) NOT NULL COMMENT '澶?敞',
  `status` enum('close','finish','active') NOT NULL DEFAULT 'active',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_contract_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_contract_log`;
CREATE TABLE `jfy_partner_contract_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '内容',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_contract_log
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_coupon`;
CREATE TABLE `jfy_partner_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '合伙人ID',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '合同ID',
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `total` int(10) NOT NULL COMMENT '发放总数',
  `receive_num` int(10) NOT NULL COMMENT '已领取数量',
  `lave_num` int(10) NOT NULL COMMENT '剩余数量',
  `face_value` varchar(255) NOT NULL COMMENT '面值',
  `limit_num` int(11) NOT NULL DEFAULT '0' COMMENT '每人限领数量',
  `begin_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '优惠券状态:y 正常, n 失效',
  `fail_time` int(10) NOT NULL DEFAULT '0' COMMENT '优惠券失效时间',
  `attribute_type` enum('all') NOT NULL DEFAULT 'all' COMMENT '针对目标/全部商品、部分商品',
  `description` text COMMENT '使用说明',
  `is_delete` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否删除:y 是 n 否',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_coupon_details`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_coupon_details`;
CREATE TABLE `jfy_partner_coupon_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '合伙人ID',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '合同ID',
  `partner_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `bn` varchar(255) NOT NULL COMMENT '优惠券编号',
  `cdk` varchar(255) NOT NULL COMMENT '激活码',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `mobile` varchar(11) DEFAULT NULL COMMENT '领取手机号',
  `status` enum('y','used','get','n') NOT NULL DEFAULT 'y' COMMENT '状态:y 正常;uesd 使用;get 领取;n 失效',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_coupon_details
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_login_data`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_login_data`;
CREATE TABLE `jfy_partner_login_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL COMMENT '合伙人ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `times` int(11) NOT NULL COMMENT '登录次数',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_login_data
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_login_log`;
CREATE TABLE `jfy_partner_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '上次登录时间IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_partner_session`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_partner_session`;
CREATE TABLE `jfy_partner_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sessionId',
  `partner_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_partner_session
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_regulator`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator`;
CREATE TABLE `jfy_regulator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '监管者ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `login_password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `last_visit_time` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL,
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `is_enable` enum('n','y') NOT NULL DEFAULT 'y' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator
-- ----------------------------
INSERT INTO `jfy_regulator` VALUES ('1', '18817800000', 'da9bf699992f1f45786419162f4087ef9849b5ef', 'ZBiA4lcO', '家政神铺监管', '18817800000', '1524033210', '192.168.100.192', '1512701466', 'y');

-- ----------------------------
-- Table structure for `jfy_regulator_config`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator_config`;
CREATE TABLE `jfy_regulator_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(10) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator_config
-- ----------------------------
INSERT INTO `jfy_regulator_config` VALUES ('3', '7', 'GoldStaff', 'open');
INSERT INTO `jfy_regulator_config` VALUES ('4', '8', 'GoldStaff', 'open');
INSERT INTO `jfy_regulator_config` VALUES ('5', '9', 'GoldStaff', 'open');

-- ----------------------------
-- Table structure for `jfy_regulator_login_data`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator_login_data`;
CREATE TABLE `jfy_regulator_login_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `times` int(11) NOT NULL COMMENT '登录次数',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  PRIMARY KEY (`id`,`regulator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator_login_data
-- ----------------------------
INSERT INTO `jfy_regulator_login_data` VALUES ('1', '144', '15737927799', '10', '1493367936');
INSERT INTO `jfy_regulator_login_data` VALUES ('2', '153', '18201869634', '146', '1493370244');
INSERT INTO `jfy_regulator_login_data` VALUES ('3', '92', '18272878105', '106', '1493363716');
INSERT INTO `jfy_regulator_login_data` VALUES ('4', '47', '15737928808', '16', '1493366706');
INSERT INTO `jfy_regulator_login_data` VALUES ('5', '173', '15512346578', '6', '1493367915');
INSERT INTO `jfy_regulator_login_data` VALUES ('6', '138', '15737928899', '16', '1493367143');
INSERT INTO `jfy_regulator_login_data` VALUES ('7', '56', '15737928782', '1', '1493367448');
INSERT INTO `jfy_regulator_login_data` VALUES ('8', '65', '15536985212', '5', '1493367922');
INSERT INTO `jfy_regulator_login_data` VALUES ('9', '21', '15516517307', '148', '1493707192');
INSERT INTO `jfy_regulator_login_data` VALUES ('10', '174', '17512345678', '3', '1493715327');
INSERT INTO `jfy_regulator_login_data` VALUES ('11', '175', '15712345678', '9', '1493717517');
INSERT INTO `jfy_regulator_login_data` VALUES ('12', '25', '15516517306', '51', '1493718870');
INSERT INTO `jfy_regulator_login_data` VALUES ('13', '27', '18521722857', '3', '1493727248');
INSERT INTO `jfy_regulator_login_data` VALUES ('14', '93', '18521722888', '2', '1493727333');
INSERT INTO `jfy_regulator_login_data` VALUES ('15', '167', '18812345678', '1', '1493775544');
INSERT INTO `jfy_regulator_login_data` VALUES ('16', '161', '17612345678', '13', '1493879295');
INSERT INTO `jfy_regulator_login_data` VALUES ('17', '154', '13312345678', '106', '1493880080');
INSERT INTO `jfy_regulator_login_data` VALUES ('18', '55', '15737928816', '1', '1493893864');
INSERT INTO `jfy_regulator_login_data` VALUES ('19', '145', '15737929977', '7', '1493952244');
INSERT INTO `jfy_regulator_login_data` VALUES ('20', '116', '15737928809', '5', '1494208968');
INSERT INTO `jfy_regulator_login_data` VALUES ('21', '38', '13917771100', '5', '1494214830');
INSERT INTO `jfy_regulator_login_data` VALUES ('22', '84', '18818223461', '3', '1494215796');
INSERT INTO `jfy_regulator_login_data` VALUES ('23', '78', '18272878100', '3', '1494313366');
INSERT INTO `jfy_regulator_login_data` VALUES ('24', '177', '15516517317', '3', '1494835784');
INSERT INTO `jfy_regulator_login_data` VALUES ('25', '179', '15516517311', '1', '1494836040');
INSERT INTO `jfy_regulator_login_data` VALUES ('26', '158', '15512345678', '1', '1495164231');
INSERT INTO `jfy_regulator_login_data` VALUES ('27', '94', '18722761560', '14', '1497510827');
INSERT INTO `jfy_regulator_login_data` VALUES ('28', '196', '18818223461', '1', '1501039731');
INSERT INTO `jfy_regulator_login_data` VALUES ('29', '2', '15516517307', '38', '1501056481');
INSERT INTO `jfy_regulator_login_data` VALUES ('30', '197', '18272878105', '7', '1501208263');
INSERT INTO `jfy_regulator_login_data` VALUES ('31', '1', '18818223461', '89', '1501226350');
INSERT INTO `jfy_regulator_login_data` VALUES ('32', '2', '13917771100', '5', '1501237434');
INSERT INTO `jfy_regulator_login_data` VALUES ('33', '3', '18272878105', '5', '1501244515');
INSERT INTO `jfy_regulator_login_data` VALUES ('34', '4', '15516517307', '45', '1501640759');
INSERT INTO `jfy_regulator_login_data` VALUES ('35', '5', '15737928816', '2', '1505191984');
INSERT INTO `jfy_regulator_login_data` VALUES ('36', '7', '18272878105', '13', '1511505886');
INSERT INTO `jfy_regulator_login_data` VALUES ('37', '8', '15039541345', '4', '1511861241');
INSERT INTO `jfy_regulator_login_data` VALUES ('38', '9', '18817800000', '21', '1512731045');

-- ----------------------------
-- Table structure for `jfy_regulator_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator_login_log`;
CREATE TABLE `jfy_regulator_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(11) NOT NULL COMMENT '用户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator_login_log
-- ----------------------------
INSERT INTO `jfy_regulator_login_log` VALUES ('1', '144', '15737927799', '', '1493358832', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('2', '153', '18201869634', '', '1493360530', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('3', '92', '18272878105', '', '1493363716', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('4', '47', '15737928808', '', '1493364889', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('5', '144', '15737927799', '', '1493365675', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('6', '173', '15512346578', '', '1493366098', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('7', '173', '15512346578', '', '1493366497', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('8', '47', '15737928808', '', '1493366706', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('9', '173', '15512346578', '', '1493367016', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('10', '138', '15737928899', '', '1493367143', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('11', '144', '15737927799', '', '1493367236', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('12', '56', '15737928782', '', '1493367448', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('13', '65', '15536985212', '', '1493367511', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('14', '144', '15737927799', '', '1493367622', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('15', '173', '15512346578', '', '1493367648', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('16', '65', '15536985212', '', '1493367712', '127.0.0.1');
INSERT INTO `jfy_regulator_login_log` VALUES ('17', '65', '15536985212', '', '1493367790', '127.0.0.1');
INSERT INTO `jfy_regulator_login_log` VALUES ('18', '65', '15536985212', '', '1493367818', '127.0.0.1');
INSERT INTO `jfy_regulator_login_log` VALUES ('19', '173', '15512346578', '', '1493367852', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('20', '173', '15512346578', '', '1493367915', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('21', '65', '15536985212', '', '1493367922', '127.0.0.1');
INSERT INTO `jfy_regulator_login_log` VALUES ('22', '144', '15737927799', '', '1493367936', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('23', '153', '18201869634', '', '1493370244', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('24', '144', '15737927799', '', '1493370708', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('25', '153', '18201869634', '', '1493690692', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('26', '47', '15737928808', '', '1493691000', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('27', '92', '18272878105', '', '1493691505', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('28', '92', '18272878105', '', '1493691528', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('29', '153', '18201869634', '', '1493691928', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('30', '21', '15516517307', '', '1493707192', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('31', '92', '18272878105', '', '1493714452', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('32', '92', '18272878105', '', '1493714477', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('33', '92', '18272878105', '', '1493714505', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('34', '92', '18272878105', '', '1493714693', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('35', '174', '17512345678', '', '1493715327', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('36', '174', '17512345678', '', '1493715347', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('37', '174', '17512345678', '', '1493715485', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('38', '175', '15712345678', '', '1493717517', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('39', '92', '18272878105', '', '1493718206', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('40', '175', '15712345678', '', '1493718522', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('41', '175', '15712345678', '', '1493718549', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('42', '25', '15516517306', '', '1493718870', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('43', '25', '15516517306', '', '1493718874', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('44', '25', '15516517306', '', '1493718887', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('45', '25', '15516517306', '', '1493718901', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('46', '153', '18201869634', '', '1493718908', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('47', '47', '15737928808', '', '1493718938', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('48', '21', '15516517307', '', '1493718970', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('49', '21', '15516517307', '', '1493718970', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('50', '21', '15516517307', '', '1493719011', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('51', '47', '15737928808', '', '1493719054', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('52', '25', '15516517306', '', '1493719060', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('53', '25', '15516517306', '', '1493719081', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('54', '138', '15737928899', '', '1493719101', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('55', '138', '15737928899', '', '1493719128', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('56', '175', '15712345678', '', '1493719644', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('57', '175', '15712345678', '', '1493719695', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('58', '175', '15712345678', '', '1493719742', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('59', '175', '15712345678', '15712345678', '1493720356', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('60', '175', '15712345678', '15712345678', '1493720384', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('61', '92', '18272878105', 'chenM', '1493721180', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('62', '27', '18521722857', '', '1493727248', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('63', '93', '18521722888', 'admin', '1493727333', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('64', '153', '18201869634', 'chenM6', '1493728294', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('65', '167', '18812345678', 'test(4/24)', '1493775544', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('66', '153', '18201869634', 'chenM6', '1493775669', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('67', '138', '15737928899', '138企业', '1493775691', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('68', '21', '15516517307', '', '1493776139', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('69', '21', '15516517307', '', '1493776537', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('70', '21', '15516517307', '', '1493783437', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('71', '21', '15516517307', '', '1493783802', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('72', '93', '18521722888', 'admin', '1493797907', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('73', '25', '15516517306', '张飞', '1493800426', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('74', '21', '15516517307', '', '1493801820', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('75', '153', '18201869634', 'chenM6', '1493868334', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('76', '153', '18201869634', 'chenM6', '1493869720', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('77', '161', '17612345678', '', '1493879295', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('78', '154', '13312345678', 'test-通用版', '1493880080', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('79', '153', '18201869634', 'chenM6', '1493882148', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('80', '153', '18201869634', 'chenM6', '1493882274', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('81', '154', '13312345678', 'test-通用版', '1493882346', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('82', '154', '13312345678', 'test-通用版', '1493892744', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('83', '154', '13312345678', 'test-通用版', '1493892812', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('84', '154', '13312345678', 'test-通用版', '1493892816', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('85', '154', '13312345678', 'test-通用版', '1493892823', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('86', '154', '13312345678', 'test-通用版', '1493892860', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('87', '21', '15516517307', '', '1493892905', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('88', '154', '13312345678', 'test-通用版', '1493892963', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('89', '21', '15516517307', '', '1493892963', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('90', '21', '15516517307', '', '1493892980', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('91', '47', '15737928808', '信通社123111', '1493893772', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('92', '55', '15737928816', '', '1493893864', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('93', '47', '15737928808', '信通社123111', '1493893988', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('94', '21', '15516517307', '', '1493950508', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('95', '92', '18272878105', 'chenM', '1493950884', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('96', '21', '15516517307', '', '1493951114', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('97', '21', '15516517307', '', '1493951142', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('98', '21', '15516517307', '', '1493951499', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('99', '145', '15737929977', '自由-分', '1493952244', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('100', '92', '18272878105', 'chenM', '1493968867', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('101', '21', '15516517307', '', '1494208139', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('102', '21', '15516517307', '', '1494208416', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('103', '92', '18272878105', 'chenM', '1494208858', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('104', '116', '15737928809', 'zhouzhou', '1494208968', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('105', '21', '15516517307', '', '1494209119', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('106', '21', '15516517307', '', '1494209993', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('107', '21', '15516517307', '', '1494210731', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('108', '92', '18272878105', 'chenM', '1494212751', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('109', '92', '18272878105', 'chenM', '1494213224', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('110', '21', '15516517307', '', '1494213514', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('111', '92', '18272878105', 'chenM', '1494213844', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('112', '21', '15516517307', '', '1494214528', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('113', '153', '18201869634', 'chenM6', '1494214571', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('114', '92', '18272878105', 'chenM', '1494214582', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('115', '153', '18201869634', 'chenM6', '1494214589', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('116', '153', '18201869634', 'chenM6', '1494214595', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('117', '154', '13312345678', 'test-通用版', '1494214636', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('118', '21', '15516517307', '', '1494214648', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('119', '154', '13312345678', 'test-通用版', '1494214706', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('120', '153', '18201869634', 'chenM6', '1494214712', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('121', '21', '15516517307', '', '1494214784', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('122', '38', '13917771100', '泰山', '1494214830', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('123', '153', '18201869634', 'chenM6', '1494214850', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('124', '21', '15516517307', '', '1494214912', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('125', '153', '18201869634', 'chenM6', '1494214945', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('126', '21', '15516517307', '', '1494215056', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('127', '153', '18201869634', 'chenM6', '1494215216', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('128', '153', '18201869634', 'chenM6', '1494215270', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('129', '47', '15737928808', '信通社123111', '1494215547', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('130', '21', '15516517307', '', '1494215506', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('131', '47', '15737928808', '信通社123111', '1494215574', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('132', '154', '13312345678', 'test-通用版', '1494215704', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('133', '21', '15516517307', '', '1494215690', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('134', '84', '18818223461', '', '1494215796', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('135', '153', '18201869634', 'chenM6', '1494216031', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('136', '47', '15737928808', '信通社123111', '1494216058', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('137', '84', '18818223461', '', '1494216086', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('138', '21', '15516517307', '', '1494216109', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('139', '154', '13312345678', 'test-通用版', '1494216191', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('140', '153', '18201869634', 'chenM6', '1494216200', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('141', '92', '18272878105', 'chenM', '1494217473', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('142', '92', '18272878105', 'chenM', '1494217528', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('143', '92', '18272878105', 'chenM', '1494217952', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('144', '21', '15516517307', '', '1494224165', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('145', '116', '15737928809', 'zhouzhou', '1494225946', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('146', '92', '18272878105', 'chenM', '1494228666', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('147', '92', '18272878105', 'chenM', '1494238765', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('148', '92', '18272878105', 'chenM', '1494239135', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('149', '27', '18521722857', '', '1494239364', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('150', '145', '15737929977', '自由-分', '1494239402', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('151', '153', '18201869634', 'chenM6', '1494239636', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('152', '21', '15516517307', '', '1494248048', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('153', '21', '15516517307', '', '1494248051', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('154', '21', '15516517307', '', '1494248064', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('155', '21', '15516517307', '', '1494248375', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('156', '92', '18272878105', 'chenM', '1494293749', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('157', '21', '15516517307', '', '1494295425', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('158', '145', '15737929977', '自由-分', '1494296170', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('159', '92', '18272878105', 'chenM', '1494301387', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('160', '153', '18201869634', 'chenM6', '1494301396', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('161', '153', '18201869634', 'chenM6', '1494310461', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('162', '153', '18201869634', 'chenM6', '1494310598', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('163', '138', '15737928899', '138企业', '1494311520', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('164', '92', '18272878105', 'chenM', '1494313014', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('165', '153', '18201869634', 'chenM6', '1494313109', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('166', '116', '15737928809', 'zhouzhou', '1494313202', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('167', '153', '18201869634', 'chenM6', '1494313257', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('168', '153', '18201869634', 'chenM6', '1494313334', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('169', '47', '15737928808', '信通社123111', '1494313354', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('170', '78', '18272878100', '', '1494313366', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('171', '153', '18201869634', 'chenM6', '1494313404', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('172', '78', '18272878100', '', '1494313451', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('173', '161', '17612345678', '', '1494313490', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('174', '161', '17612345678', '', '1494313545', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('175', '161', '17612345678', '', '1494313604', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('176', '153', '18201869634', 'chenM6', '1494313628', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('177', '161', '17612345678', '', '1494313688', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('178', '92', '18272878105', 'chenM', '1494314177', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('179', '153', '18201869634', 'chenM6', '1494314316', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('180', '25', '15516517306', '张飞', '1494315040', '192.168.199.25');
INSERT INTO `jfy_regulator_login_log` VALUES ('181', '21', '15516517307', '', '1494317660', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('182', '21', '15516517307', '', '1494317699', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('183', '21', '15516517307', '', '1494317709', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('184', '21', '15516517307', '', '1494317782', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('185', '21', '15516517307', '', '1494317800', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('186', '153', '18201869634', 'chenM6', '1494319877', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('187', '154', '13312345678', 'test-通用版', '1494320335', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('188', '153', '18201869634', 'chenM6', '1494322027', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('189', '153', '18201869634', 'chenM6', '1494323198', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('190', '116', '15737928809', 'zhouzhou', '1494323241', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('191', '116', '15737928809', 'zhouzhou', '1494323254', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('192', '154', '13312345678', 'test-通用版', '1494323281', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('193', '153', '18201869634', 'chenM6', '1494325775', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('194', '25', '15516517306', '张飞', '1494400325', '192.168.199.25');
INSERT INTO `jfy_regulator_login_log` VALUES ('195', '92', '18272878105', 'chenM', '1494401138', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('196', '161', '17612345678', '', '1494404517', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('197', '154', '13312345678', 'test-通用版', '1494404527', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('198', '92', '18272878105', 'chenM', '1494467851', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('199', '92', '18272878105', 'chenM', '1494467867', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('200', '154', '13312345678', 'test-通用版', '1494467906', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('201', '153', '18201869634', 'chenM6', '1494467958', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('202', '153', '18201869634', 'chenM6', '1494467977', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('203', '153', '18201869634', 'chenM6', '1494468668', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('204', '92', '18272878105', 'chenM', '1494468730', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('205', '92', '18272878105', 'chenM', '1494469237', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('206', '92', '18272878105', 'chenM', '1494469279', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('207', '153', '18201869634', 'chenM6', '1494469502', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('208', '161', '17612345678', '', '1494469581', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('209', '161', '17612345678', '', '1494469589', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('210', '154', '13312345678', 'test-通用版', '1494469659', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('211', '92', '18272878105', 'chenM', '1494473947', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('212', '145', '15737929977', '自由-分', '1494474374', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('213', '92', '18272878105', 'chenM', '1494476466', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('214', '153', '18201869634', 'chenM6', '1494485697', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('215', '153', '18201869634', 'chenM6', '1494485761', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('216', '47', '15737928808', '信通社123111', '1494485776', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('217', '153', '18201869634', 'chenM6', '1494485876', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('218', '153', '18201869634', 'chenM6', '1494485905', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('219', '154', '13312345678', 'test-通用版', '1494485938', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('220', '153', '18201869634', 'chenM6', '1494485955', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('221', '154', '13312345678', 'test-通用版', '1494486031', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('222', '153', '18201869634', 'chenM6', '1494486058', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('223', '161', '17612345678', '', '1494486272', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('224', '25', '15516517306', '张飞', '1494487165', '192.168.199.25');
INSERT INTO `jfy_regulator_login_log` VALUES ('225', '154', '13312345678', 'test-通用版', '1494487375', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('226', '154', '13312345678', 'test-通用版', '1494490641', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('227', '92', '18272878105', 'chenM', '1494496258', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('228', '92', '18272878105', 'chenM', '1494496282', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('229', '92', '18272878105', 'chenM', '1494498401', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('230', '92', '18272878105', 'chenM', '1494498460', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('231', '153', '18201869634', 'chenM6', '1494554815', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('232', '154', '13312345678', 'test-通用版', '1494555317', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('233', '154', '13312345678', 'test-通用版', '1494574997', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('234', '21', '15516517307', '', '1494582414', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('235', '21', '15516517307', '', '1494582599', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('236', '21', '15516517307', '', '1494814208', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('237', '21', '15516517307', '', '1494814243', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('238', '21', '15516517307', '', '1494814281', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('239', '92', '18272878105', 'chenM', '1494825960', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('240', '92', '18272878105', 'chenM', '1494827367', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('241', '92', '18272878105', 'chenM', '1494827634', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('242', '92', '18272878105', 'chenM', '1494827673', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('243', '154', '13312345678', 'test-通用版', '1494829750', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('244', '144', '15737927799', '周凯-分', '1494829943', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('245', '177', '15516517317', '张伟', '1494835784', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('246', '177', '15516517317', '张伟', '1494835797', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('247', '177', '15516517317', '张伟', '1494835808', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('248', '21', '15516517307', '', '1494835892', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('249', '179', '15516517311', '张伟', '1494836040', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('250', '153', '18201869634', 'chenM6', '1494838446', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('251', '21', '15516517307', '', '1494843398', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('252', '138', '15737928899', '138企业', '1494843539', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('253', '21', '15516517307', '', '1494843439', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('254', '21', '15516517307', '', '1494843445', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('255', '138', '15737928899', '138企业', '1494843625', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('256', '144', '15737927799', '周凯-分', '1494843667', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('257', '145', '15737929977', '自由-分', '1494844051', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('258', '138', '15737928899', '138企业', '1494844764', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('259', '92', '18272878105', 'chenM', '1494908432', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('260', '92', '18272878105', 'chenM', '1494908795', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('261', '92', '18272878105', 'chenM', '1494908862', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('262', '154', '13312345678', 'test-通用版', '1494917154', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('263', '153', '18201869634', 'chenM6', '1494917766', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('264', '21', '15516517307', '', '1494923157', '192.168.199.25');
INSERT INTO `jfy_regulator_login_log` VALUES ('265', '21', '15516517307', '', '1494923245', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('266', '21', '15516517307', '', '1494923320', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('267', '21', '15516517307', '', '1494923486', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('268', '21', '15516517307', '', '1494923490', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('269', '92', '18272878105', 'chenM', '1494926149', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('270', '92', '18272878105', 'chenM', '1494926157', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('271', '92', '18272878105', 'chenM', '1494926174', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('272', '153', '18201869634', 'chenM6', '1494927026', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('273', '47', '15737928808', '信通社123111', '1494927668', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('274', '153', '18201869634', 'chenM6', '1494938367', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('275', '21', '15516517307', '', '1494938811', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('276', '154', '13312345678', 'test-通用版', '1494986903', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('277', '154', '13312345678', 'test-通用版', '1494988427', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('278', '92', '18272878105', 'chenM', '1494991686', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('279', '153', '18201869634', 'chenM6', '1494991938', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('280', '92', '18272878105', 'chenM', '1494992894', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('281', '21', '15516517307', '', '1494994029', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('282', '21', '15516517307', '', '1494994120', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('283', '154', '13312345678', 'test-通用版', '1495005898', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('284', '153', '18201869634', 'chenM6', '1495008245', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('285', '38', '13917771100', '泰山', '1495009269', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('286', '21', '15516517307', '', '1495009337', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('287', '21', '15516517307', '', '1495012390', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('288', '38', '13917771100', '泰山', '1495012881', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('289', '38', '13917771100', '泰山', '1495014435', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('290', '154', '13312345678', 'test-通用版', '1495016563', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('291', '154', '13312345678', 'test-通用版', '1495016714', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('292', '21', '15516517307', '', '1495016841', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('293', '21', '15516517307', '', '1495016854', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('294', '21', '15516517307', '', '1495016791', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('295', '92', '18272878105', 'chenM', '1495017048', '192.168.199.145');
INSERT INTO `jfy_regulator_login_log` VALUES ('296', '153', '18201869634', 'chenM6', '1495072912', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('297', '153', '18201869634', 'chenM6', '1495075914', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('298', '154', '13312345678', 'test-通用版', '1495075921', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('299', '47', '15737928808', '信通社123111', '1495076263', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('300', '153', '18201869634', 'chenM6', '1495088270', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('301', '154', '13312345678', 'test-通用版', '1495162964', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('302', '21', '15516517307', '', '1495164140', '192.168.199.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('303', '158', '15512345678', 'chen', '1495164231', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('304', '47', '15737928808', '信通社123111', '1495164284', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('305', '92', '18272878105', 'chenM', '1495167065', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('306', '175', '15712345678', '15712345678', '1495167116', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('307', '92', '18272878105', 'chenM', '1495167153', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('308', '78', '18272878100', '', '1495167245', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('309', '21', '15516517307', '', '1495167268', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('310', '21', '15516517307', '', '1495176089', '192.168.199.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('311', '21', '15516517307', '', '1495176626', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('312', '21', '15516517307', '', '1495418866', '192.168.199.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('313', '92', '18272878105', 'chenM', '1495424654', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('314', '153', '18201869634', 'chenM6', '1495436787', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('315', '21', '15516517307', '', '1495436927', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('316', '153', '18201869634', 'chenM6', '1495436955', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('317', '21', '15516517307', '', '1495437062', '192.168.199.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('318', '154', '13312345678', 'test-通用版', '1495440690', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('319', '92', '18272878105', 'chenM', '1495505085', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('320', '21', '15516517307', '', '1495505064', '192.168.199.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('321', '92', '18272878105', 'chenM', '1495505144', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('322', '92', '18272878105', 'chenM', '1495506797', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('323', '153', '18201869634', 'chenM6', '1495507155', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('324', '154', '13312345678', 'test-通用版', '1495508415', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('325', '153', '18201869634', 'chenM61', '1495510693', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('326', '154', '13312345678', 'test-通用版', '1495522062', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('327', '154', '13312345678', 'test-通用版', '1495524010', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('328', '154', '13312345678', 'test-通用版', '1495530369', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('329', '21', '15516517307', '', '1495530558', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('330', '154', '13312345678', 'test-通用版', '1495591535', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('331', '21', '15516517307', '', '1495592279', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('332', '92', '18272878105', 'chenM', '1495592580', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('333', '153', '18201869634', 'chenM61', '1495592589', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('334', '153', '18201869634', 'chenM61', '1495597387', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('335', '92', '18272878105', 'chenM', '1495601746', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('336', '154', '13312345678', 'test-通用版', '1495605504', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('337', '21', '15516517307', '', '1495605585', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('338', '21', '15516517307', '', '1495606084', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('339', '153', '18201869634', 'chenM61', '1495606467', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('340', '154', '13312345678', 'test-通用版', '1495606766', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('341', '154', '13312345678', 'test-通用版', '1495606931', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('342', '21', '15516517307', '', '1495607047', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('343', '154', '13312345678', 'test-通用版', '1495607536', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('344', '21', '15516517307', '', '1495607892', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('345', '153', '18201869634', 'chenM61', '1495607923', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('346', '21', '15516517307', '', '1495608049', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('347', '21', '15516517307', '', '1495608070', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('348', '154', '13312345678', 'test-通用版', '1495612555', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('349', '92', '18272878105', 'chenM', '1495613296', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('350', '153', '18201869634', 'chenM61', '1495613527', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('351', '154', '13312345678', 'test-通用版', '1495614446', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('352', '92', '18272878105', 'chenM', '1495618448', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('353', '153', '18201869634', 'chenM61', '1495618511', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('354', '153', '18201869634', 'chenM61', '1495618866', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('355', '21', '15516517307', '', '1495618932', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('356', '21', '15516517307', '', '1495678854', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('357', '153', '18201869634', 'chenM61', '1495680394', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('358', '92', '18272878105', 'chenM', '1495680691', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('359', '153', '18201869634', 'chenM61', '1495684583', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('360', '153', '18201869634', 'chenM61', '1495684918', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('361', '153', '18201869634', 'chenM61', '1495691448', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('362', '21', '15516517307', '', '1495692015', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('363', '154', '13312345678', 'test-通用版', '1495693467', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('364', '21', '15516517307', '', '1495695387', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('365', '21', '15516517307', '', '1495696004', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('366', '153', '18201869634', 'chenM61', '1495762297', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('367', '153', '18201869634', 'chenM61', '1495763202', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('368', '92', '18272878105', 'chenM', '1495763239', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('369', '161', '17612345678', '', '1495763249', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('370', '38', '13917771100', '泰山', '1495763260', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('371', '21', '15516517307', '', '1495782529', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('372', '154', '13312345678', 'test-通用版', '1495785907', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('373', '92', '18272878105', 'chenM', '1495789136', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('374', '92', '18272878105', 'chenM', '1495791371', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('375', '153', '18201869634', 'chenM61', '1495851345', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('376', '153', '18201869634', 'chenM61', '1495859730', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('377', '153', '18201869634', 'chenM61', '1495860628', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('378', '153', '18201869634', 'chenM61', '1495860641', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('379', '153', '18201869634', 'chenM61', '1495861432', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('380', '153', '18201869634', 'chenM61', '1495867646', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('381', '21', '15516517307', '', '1495867669', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('382', '27', '18521722857', '', '1495867726', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('383', '154', '13312345678', 'test-通用版', '1495867765', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('384', '21', '15516517307', '', '1495867803', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('385', '154', '13312345678', 'test-通用版', '1495867847', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('386', '21', '15516517307', '', '1495867879', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('387', '153', '18201869634', 'chenM61', '1495868155', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('388', '21', '15516517307', '', '1495869372', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('389', '153', '18201869634', 'chenM61', '1495869802', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('390', '154', '13312345678', 'test-通用版', '1495870597', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('391', '21', '15516517307', '', '1496195162', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('392', '153', '18201869634', 'chenM61', '1496199358', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('393', '154', '13312345678', 'test-通用版', '1496200925', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('394', '92', '18272878105', 'chenM', '1496203416', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('395', '153', '18201869634', 'chenM61', '1496203515', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('396', '153', '18201869634', 'chenM61', '1496214411', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('397', '154', '13312345678', 'test-通用版', '1496215723', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('398', '21', '15516517307', '', '1496281814', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('399', '92', '18272878105', 'chenM', '1496284196', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('400', '21', '15516517307', '', '1496299004', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('401', '21', '15516517307', '', '1496299128', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('402', '25', '15516517306', '张飞', '1496299337', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('403', '154', '13312345678', 'test-通用版', '1496307021', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('404', '92', '18272878105', 'chenM', '1496370976', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('405', '153', '18201869634', 'chenM61', '1496386203', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('406', '21', '15516517307', '', '1496389427', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('407', '25', '15516517306', '张飞', '1496534031', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('408', '25', '15516517306', '张飞', '1496626518', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('409', '92', '18272878105', 'chenM', '1496628321', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('410', '21', '15516517307', '', '1496628447', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('411', '153', '18201869634', 'chenM61', '1496628688', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('412', '154', '13312345678', 'test-通用版', '1496629430', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('413', '154', '13312345678', 'test-通用版', '1496632178', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('414', '21', '15516517307', '', '1496633565', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('415', '153', '18201869634', 'chenM61', '1496633590', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('416', '21', '15516517307', '', '1496634174', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('417', '92', '18272878105', 'chenM', '1496648782', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('418', '138', '15737928899', '138企业', '1496649014', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('419', '92', '18272878105', 'chenM', '1496649111', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('420', '138', '15737928899', '138企业', '1496649159', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('421', '92', '18272878105', 'chenM', '1496649093', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('422', '25', '15516517306', '张飞', '1496713428', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('423', '92', '18272878105', 'chenM', '1496716600', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('424', '92', '18272878105', 'chenM', '1496717963', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('425', '154', '13312345678', 'test-通用版', '1496728525', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('426', '21', '15516517307', '', '1496740494', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('427', '25', '15516517306', '张飞', '1496800267', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('428', '92', '18272878105', 'chenM', '1496801542', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('429', '154', '13312345678', 'test-通用版', '1496815494', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('430', '153', '18201869634', 'chenM61', '1496816071', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('431', '92', '18272878105', 'chenM', '1496816398', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('432', '153', '18201869634', 'chenM61', '1496816406', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('433', '154', '13312345678', 'test-通用版', '1496816431', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('434', '153', '18201869634', 'chenM61', '1496816469', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('435', '138', '15737928899', '138企业', '1496818301', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('436', '154', '13312345678', 'test-通用版', '1496825452', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('437', '21', '15516517307', '', '1496828121', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('438', '92', '18272878105', 'chenM', '1496886395', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('439', '92', '18272878105', 'chenM', '1496891379', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('440', '153', '18201869634', 'chenM61', '1496892824', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('441', '153', '18201869634', 'chenM61', '1496892911', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('442', '153', '18201869634', 'chenM61', '1496892973', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('443', '153', '18201869634', 'chenM61', '1496893216', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('444', '153', '18201869634', 'chenM61', '1496893497', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('445', '153', '18201869634', 'chenM61', '1496893677', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('446', '21', '15516517307', '', '1496907999', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('447', '154', '13312345678', 'test-通用版', '1496912630', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('448', '92', '18272878105', 'chenM', '1496917513', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('449', '92', '18272878105', 'chenM', '1496918022', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('450', '92', '18272878105', 'chenM', '1496972767', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('451', '153', '18201869634', 'chenM61', '1496973790', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('452', '21', '15516517307', '', '1496990543', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('453', '138', '15737928899', '138企业', '1496990563', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('454', '154', '13312345678', 'test-通用版', '1496990725', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('455', '21', '15516517307', '', '1496990713', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('456', '138', '15737928899', '138企业', '1496991035', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('457', '153', '18201869634', 'chenM61', '1496993223', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('458', '153', '18201869634', 'chenM61', '1496993795', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('459', '92', '18272878105', 'chenM', '1496995317', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('460', '153', '18201869634', 'chenM61', '1496995332', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('461', '154', '13312345678', 'test-通用版', '1496995814', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('462', '153', '18201869634', 'chenM61', '1496995823', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('463', '153', '18201869634', 'chenM61', '1496996596', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('464', '21', '15516517307', '', '1497233128', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('465', '154', '13312345678', 'test-通用版', '1497236263', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('466', '153', '18201869634', 'chenM61', '1497238991', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('467', '92', '18272878105', 'chenM', '1497252543', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('468', '154', '13312345678', 'test-通用版', '1497255400', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('469', '154', '13312345678', 'test-通用版', '1497255932', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('470', '161', '17612345678', '', '1497259462', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('471', '153', '18201869634', 'chenM61', '1497259471', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('472', '21', '15516517307', '', '1497259888', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('473', '153', '18201869634', 'chenM61', '1497260662', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('474', '92', '18272878105', 'chenM', '1497261724', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('475', '92', '18272878105', 'chenM', '1497262245', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('476', '153', '18201869634', 'chenM61', '1497262251', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('477', '47', '15737928808', '信通社123111', '1497262294', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('478', '153', '18201869634', 'chenM61', '1497262433', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('479', '21', '15516517307', '', '1497263319', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('480', '153', '18201869634', 'chenM61', '1497263507', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('481', '25', '15516517306', '张飞', '1497320200', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('482', '154', '13312345678', 'test-通用版', '1497325455', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('483', '153', '18201869634', 'chenM61', '1497334062', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('484', '21', '15516517307', '', '1497334845', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('485', '153', '18201869634', 'chenM61', '1497336643', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('486', '21', '15516517307', '', '1497342542', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('487', '92', '18272878105', 'chenM', '1497347086', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('488', '154', '13312345678', 'test-通用版', '1497348841', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('489', '21', '15516517307', '', '1497406432', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('490', '154', '13312345678', 'test-通用版', '1497411563', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('491', '25', '15516517306', '张飞', '1497423568', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('492', '154', '13312345678', 'test-通用版', '1497426248', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('493', '21', '15516517307', '', '1497426252', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('494', '154', '13312345678', 'test-通用版', '1497426412', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('495', '154', '13312345678', 'test-通用版', '1497434541', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('496', '145', '15737929977', '自由-分', '1497435276', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('497', '138', '15737928899', '138企业', '1497435312', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('498', '154', '13312345678', 'test-通用版', '1497435555', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('499', '25', '15516517306', '张飞', '1497436196', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('500', '154', '13312345678', 'test-通用版', '1497436208', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('501', '154', '13312345678', 'test-通用版', '1497436216', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('502', '161', '17612345678', '', '1497436223', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('503', '153', '18201869634', 'chenM61', '1497436232', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('504', '153', '18201869634', 'chenM61', '1497436246', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('505', '153', '18201869634', 'chenM61', '1497437179', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('506', '92', '18272878105', 'chenM', '1497439922', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('507', '153', '18201869634', 'chenM61', '1497497444', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('508', '154', '13312345678', 'test-通用版', '1497497494', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('509', '25', '15516517306', '张飞', '1497510225', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('510', '94', '18722761560', '夏小冬', '1497510827', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('511', '161', '17612345678', '', '1497514469', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('512', '21', '15516517307', '', '1497517485', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('513', '92', '18272878105', 'chenM', '1497521163', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('514', '92', '18272878105', 'chenM', '1497521255', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('515', '92', '18272878105', 'chenM', '1497521274', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('516', '154', '13312345678', 'test-通用版', '1497525958', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('517', '153', '18201869634', 'chenM61', '1497530636', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('518', '21', '15516517307', '', '1497533506', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('519', '153', '18201869634', 'chenM61', '1497603842', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('520', '153', '18201869634', 'chenM61', '1497839852', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('521', '154', '13312345678', 'test-通用版', '1497841690', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('522', '25', '15516517306', '张飞', '1497843115', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('523', '21', '15516517307', '', '1497843364', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('524', '154', '13312345678', 'test-通用版', '1497864627', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('525', '154', '13312345678', 'test-通用版', '1497924091', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('526', '153', '18201869634', 'chenM61', '1497924287', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('527', '21', '15516517307', '', '1497930473', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('528', '92', '18272878105', 'chenM', '1497930812', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('529', '138', '15737928899', '138企业', '1497931274', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('530', '94', '18722761560', '夏小冬', '1497939383', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('531', '25', '15516517306', '张飞', '1497939395', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('532', '92', '18272878105', 'chenM', '1497940220', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('533', '92', '18272878105', 'chenM', '1497940350', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('534', '92', '18272878105', 'chenM', '1497940440', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('535', '92', '18272878105', 'chenM', '1497940456', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('536', '92', '18272878105', 'chenM', '1497941196', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('537', '92', '18272878105', 'chenM', '1497941271', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('538', '92', '18272878105', 'chenM', '1497942389', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('539', '92', '18272878105', 'chenM', '1497943112', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('540', '94', '18722761560', '夏小冬', '1497943325', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('541', '25', '15516517306', '张飞', '1497943335', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('542', '144', '15737927799', '周凯-分', '1497943849', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('543', '145', '15737929977', '自由-分', '1497943886', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('544', '153', '18201869634', 'chenM61', '1498011948', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('545', '21', '15516517307', '', '1498027046', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('546', '25', '15516517306', '张飞', '1498034685', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('547', '25', '15516517306', '张飞', '1498034747', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('548', '153', '18201869634', 'chenM61', '1498098431', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('549', '154', '13312345678', 'test-通用版', '1498101247', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('550', '21', '15516517307', '', '1498114131', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('551', '21', '15516517307', '', '1498122104', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('552', '21', '15516517307', '', '1498122364', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('553', '25', '15516517306', '张飞', '1498125273', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('554', '25', '15516517306', '张飞', '1498126422', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('555', '92', '18272878105', 'chenM', '1498190433', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('556', '92', '18272878105', 'chenM', '1498190625', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('557', '92', '18272878105', 'chenM', '1498191002', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('558', '154', '13312345678', 'test-通用版', '1498198118', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('559', '153', '18201869634', 'chenM61', '1498204071', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('560', '21', '15516517307', '', '1498208800', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('561', '21', '15516517307', '', '1498211067', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('562', '21', '15516517307', '', '1498211110', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('563', '21', '15516517307', '', '1498442024', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('564', '154', '13312345678', 'test-通用版', '1498442591', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('565', '153', '18201869634', 'chenM61', '1498445611', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('566', '25', '15516517306', '张飞', '1498456928', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('567', '94', '18722761560', '夏小冬', '1498456970', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('568', '94', '18722761560', '夏小冬', '1498457011', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('569', '21', '15516517307', '', '1498457021', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('570', '21', '15516517307', '', '1498457041', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('571', '94', '18722761560', '夏小冬', '1498457160', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('572', '94', '18722761560', '夏小冬', '1498457177', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('573', '94', '18722761560', '夏小冬', '1498457184', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('574', '94', '18722761560', '夏小冬', '1498457195', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('575', '94', '18722761560', '夏小冬', '1498457200', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('576', '94', '18722761560', '夏小冬', '1498457205', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('577', '94', '18722761560', '夏小冬', '1498457209', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('578', '94', '18722761560', '夏小冬', '1498457219', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('579', '94', '18722761560', '夏小冬', '1498457241', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('580', '25', '15516517306', '张飞', '1498457248', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('581', '25', '15516517306', '张飞', '1498468128', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('582', '25', '15516517306', '张飞', '1498471235', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('583', '25', '15516517306', '张飞', '1498472699', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('584', '154', '13312345678', 'test-通用版', '1498530780', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('585', '153', '18201869634', 'chenM61', '1498535597', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('586', '21', '15516517307', '', '1498544172', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('587', '21', '15516517307', '', '1498547830', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('588', '21', '15516517307', '', '1498548280', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('589', '21', '15516517307', '', '1498616566', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('590', '154', '13312345678', 'test-通用版', '1498617362', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('591', '153', '18201869634', 'chenM61', '1498622131', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('592', '154', '13312345678', 'test-通用版', '1498639692', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('593', '154', '13312345678', 'test-通用版', '1498642972', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('594', '154', '13312345678', 'test-通用版', '1498700521', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('595', '153', '18201869634', 'chenM61', '1498701130', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('596', '25', '15516517306', '张飞', '1498702524', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('597', '25', '15516517306', '张飞', '1498702740', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('598', '21', '15516517307', '', '1498702992', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('599', '154', '13312345678', 'test-通用版', '1498703701', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('600', '21', '15516517307', '', '1498704774', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('601', '153', '18201869634', 'chenM61', '1498706129', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('602', '154', '13312345678', 'test-通用版', '1498731106', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('603', '21', '15516517307', '', '1498791177', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('604', '153', '18201869634', 'chenM61', '1498793368', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('605', '92', '18272878105', 'chenM', '1498793875', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('606', '25', '15516517306', '张飞', '1498806522', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('607', '21', '15516517307', '', '1499046822', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('608', '153', '18201869634', 'chenM61', '1499047138', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('609', '154', '13312345678', 'test-通用版', '1499047791', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('610', '25', '15516517306', '张飞', '1499070402', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('611', '25', '15516517306', '张飞', '1499070426', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('612', '21', '15516517307', '', '1499070650', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('613', '25', '15516517306', '张飞', '1499070743', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('614', '21', '15516517307', '', '1499071042', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('615', '138', '15737928899', '138企业', '1499074772', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('616', '144', '15737927799', '周凯-分', '1499075730', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('617', '154', '13312345678', 'test-通用版', '1499076756', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('618', '153', '18201869634', 'chenM61', '1499134385', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('619', '21', '15516517307', '', '1499162078', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('620', '154', '13312345678', 'test-通用版', '1499164227', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('621', '153', '18201869634', 'chenM61', '1499221437', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('622', '92', '18272878105', 'chenM', '1499248841', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('623', '153', '18201869634', 'chenM61', '1499248850', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('624', '21', '15516517307', '', '1499248961', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('625', '21', '15516517307', '', '1499249037', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('626', '153', '18201869634', 'chenM61', '1499249535', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('627', '153', '18201869634', 'chenM61', '1499306458', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('628', '154', '13312345678', 'test-通用版', '1499307353', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('629', '154', '13312345678', 'test-通用版', '1499330546', '192.168.199.236');
INSERT INTO `jfy_regulator_login_log` VALUES ('630', '154', '13312345678', 'test-通用版', '1499334498', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('631', '21', '15516517307', '', '1499393131', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('632', '153', '18201869634', 'chenM61', '1499394653', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('633', '154', '13312345678', 'test-通用版', '1499422383', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('634', '153', '18201869634', 'chenM61', '1499653106', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('635', '21', '15516517307', '', '1499654805', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('636', '154', '13312345678', 'test-通用版', '1499659321', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('637', '21', '15516517307', '', '1499680114', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('638', '92', '18272878105', 'chenM', '1499742369', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('639', '154', '13312345678', 'test-通用版', '1499826080', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('640', '153', '18201869634', 'chenM61', '1499840311', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('641', '153', '18201869634', 'chenM61', '1499841082', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('642', '25', '15516517306', '张飞', '1499841424', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('643', '25', '15516517306', '张飞', '1499841473', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('644', '25', '15516517306', '张飞', '1499841575', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('645', '25', '15516517306', '张飞', '1499843150', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('646', '25', '15516517306', '张飞', '1499845073', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('647', '154', '13312345678', 'test-通用版', '1499845005', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('648', '154', '13312345678', 'test-通用版', '1499845009', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('649', '21', '15516517307', '', '1499911120', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('650', '153', '18201869634', 'chenM61', '1499927633', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('651', '25', '15516517306', '张飞', '1499932816', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('652', '21', '15516517307', '', '1499999619', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('653', '153', '18201869634', 'chenM61', '1500015426', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('654', '154', '13312345678', 'test-通用版', '1500017531', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('655', '25', '15516517306', '张飞', '1500020238', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('656', '153', '18201869634', 'chenM61', '1500256682', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('657', '154', '13312345678', 'test-通用版', '1500257894', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('658', '25', '15516517306', '张飞', '1500259436', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('659', '21', '15516517307', '', '1500271898', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('660', '25', '15516517306', '张飞', '1500280182', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('661', '153', '18201869634', 'chenM61', '1500344005', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('662', '154', '13312345678', 'test-通用版', '1500344332', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('663', '25', '15516517306', '张飞', '1500344641', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('664', '25', '15516517306', '张飞', '1500345190', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('665', '21', '15516517307', '', '1500362853', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('666', '25', '15516517306', '张飞', '1500433317', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('667', '154', '13312345678', 'test-通用版', '1500434071', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('668', '154', '13312345678', 'test-通用版', '1500448779', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('669', '21', '15516517307', '', '1500449296', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('670', '153', '18201869634', 'chenM61', '1500458293', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('671', '84', '18818223461', '', '1500517823', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('672', '25', '15516517306', '张飞', '1500517870', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('673', '21', '15516517307', '', '1500536003', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('674', '154', '13312345678', 'test-通用版', '1500537071', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('675', '92', '18272878105', 'chenM', '1500605115', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('676', '153', '18201869634', 'chenM61', '1500605157', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('677', '153', '18201869634', 'chenM61', '1500606882', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('678', '153', '18201869634', 'chenM61', '1500607425', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('679', '153', '18201869634', 'chenM61', '1500621355', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('680', '21', '15516517307', '', '1500862396', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('681', '154', '13312345678', 'test-通用版', '1500862635', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('682', '153', '18201869634', 'chenM61', '1500865306', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('683', '21', '15516517307', '', '1500877828', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('684', '21', '15516517307', '', '1500878135', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('685', '196', '18818223461', '上海喵神', '1501039596', '::1');
INSERT INTO `jfy_regulator_login_log` VALUES ('686', '196', '18818223461', '上海喵神', '1501039731', '::1');
INSERT INTO `jfy_regulator_login_log` VALUES ('687', '2', '15516517307', '上海喵神', '1501056481', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('688', '2', '15516517307', '上海喵神', '1501056550', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('689', '2', '15516517307', '上海喵神', '1501056556', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('690', '2', '15516517307', '上海喵神', '1501056566', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('691', '2', '15516517307', '上海喵神', '1501146947', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('692', '2', '15516517307', '上海喵神', '1501147095', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('693', '2', '15516517307', '上海喵神', '1501147191', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('694', '2', '15516517307', '上海喵神', '1501148047', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('695', '2', '15516517307', '上海喵神', '1501150036', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('696', '2', '15516517307', '上海喵神', '1501150153', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('697', '2', '15516517307', '上海喵神', '1501150168', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('698', '2', '15516517307', '上海喵神', '1501150189', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('699', '2', '15516517307', '上海喵神', '1501150248', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('700', '2', '15516517307', '上海喵神', '1501150805', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('701', '2', '15516517307', '上海喵神', '1501150875', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('702', '2', '15516517307', '上海喵神', '1501150898', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('703', '2', '15516517307', '上海喵神', '1501151357', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('704', '2', '15516517307', '上海喵神', '1501151424', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('705', '2', '15516517307', '上海喵神', '1501151556', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('706', '2', '15516517307', '上海喵神', '1501151590', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('707', '2', '15516517307', '上海喵神', '1501151746', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('708', '2', '15516517307', '上海喵神', '1501152010', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('709', '2', '15516517307', '上海喵神', '1501152112', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('710', '2', '15516517307', '上海喵神', '1501152163', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('711', '2', '15516517307', '上海喵神', '1501152189', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('712', '2', '15516517307', '上海喵神', '1501152422', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('713', '2', '15516517307', '上海喵神', '1501152566', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('714', '2', '15516517307', '上海喵神', '1501205823', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('715', '2', '15516517307', '上海喵神', '1501206068', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('716', '2', '15516517307', '上海喵神', '1501206078', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('717', '2', '15516517307', '上海喵神', '1501206111', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('718', '2', '15516517307', '上海喵神', '1501206080', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('719', '2', '15516517307', '上海喵神', '1501207645', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('720', '197', '18272878105', '上海喵神', '1501208263', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('721', '197', '18272878105', '上海喵神', '1501208726', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('722', '197', '18272878105', '上海喵神', '1501208788', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('723', '2', '15516517307', '上海喵神', '1501208951', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('724', '2', '15516517307', '上海喵神', '1501208977', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('725', '2', '15516517307', '上海喵神', '1501209010', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('726', '2', '15516517307', '上海喵神', '1501209092', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('727', '2', '15516517307', '上海喵神', '1501209066', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('728', '197', '18272878105', '上海喵神', '1501212099', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('729', '197', '18272878105', '上海喵神', '1501212136', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('730', '197', '18272878105', '上海喵神', '1501212149', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('731', '197', '18272878105', '上海喵神', '1501212186', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('732', '1', '18818223461', '上海喵神', '1501226350', '::1');
INSERT INTO `jfy_regulator_login_log` VALUES ('733', '1', '18818223461', '上海喵神', '1501226355', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('734', '1', '18818223461', '上海喵神', '1501234704', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('735', '1', '18818223461', '上海喵神', '1501234725', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('736', '1', '18818223461', '上海喵神', '1501236019', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('737', '1', '18818223461', '上海喵神', '1501236075', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('738', '2', '13917771100', '上海喵神', '1501237434', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('739', '2', '13917771100', '上海喵神', '1501237520', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('740', '2', '13917771100', '昆山卫计委', '1501241654', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('741', '2', '13917771100', '昆山卫计委', '1501242075', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('742', '2', '13917771100', '昆山卫计委', '1501242087', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('743', '3', '18272878105', '上海喵神11', '1501244515', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('744', '1', '18818223461', '上海喵神222', '1501466763', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('745', '3', '18272878105', '上海喵神11', '1501470818', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('746', '1', '18818223461', '上海喵神222', '1501471174', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('747', '1', '18818223461', '上海喵神222', '1501472057', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('748', '1', '18818223461', '上海喵神222', '1501483186', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('749', '1', '18818223461', '上海喵神222', '1501483193', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('750', '1', '18818223461', '上海喵神222', '1501483196', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('751', '1', '18818223461', '上海喵神222', '1501483201', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('752', '1', '18818223461', '上海喵神222', '1501483204', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('753', '1', '18818223461', '上海喵神222', '1501483255', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('754', '1', '18818223461', '上海喵神222', '1501483267', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('755', '1', '18818223461', '上海喵神222', '1501483367', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('756', '1', '18818223461', '上海喵神222', '1501483489', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('757', '3', '18272878105', '上海喵神11', '1501485959', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('758', '1', '18818223461', '上海喵神222', '1501487161', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('759', '1', '18818223461', '上海喵神222', '1501490291', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('760', '1', '18818223461', '上海喵神222', '1501568773', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('761', '1', '18818223461', '上海喵神222', '1501571005', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('762', '1', '18818223461', '上海喵神222', '1501576956', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('763', '1', '18818223461', '上海喵神222', '1501578353', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('764', '1', '18818223461', '上海喵神222', '1501638952', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('765', '1', '18818223461', '上海喵神222', '1501639320', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('766', '4', '15516517307', '上海喵神', '1501640759', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('767', '1', '18818223461', '上海喵神222', '1501647220', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('768', '1', '18818223461', '上海喵神222', '1501653311', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('769', '3', '18272878105', '上海喵神11', '1501656575', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('770', '3', '18272878105', '上海喵神11', '1501665552', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('771', '4', '15516517307', '上海喵神', '1501665802', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('772', '1', '18818223461', '上海喵神222', '1501665833', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('773', '1', '18818223461', '上海喵神222', '1501665885', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('774', '1', '18818223461', '上海喵神222', '1501665915', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('775', '1', '18818223461', '上海喵神222', '1501666249', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('776', '4', '15516517307', '上海喵神', '1501667503', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('777', '1', '18818223461', '上海喵神222', '1501667541', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('778', '1', '18818223461', '上海喵神222', '1501667639', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('779', '1', '18818223461', '上海喵神222', '1501669311', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('780', '1', '18818223461', '上海喵神222', '1501669363', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('781', '4', '15516517307', '上海喵神', '1501724747', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('782', '4', '15516517307', '上海喵神', '1501724749', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('783', '1', '18818223461', '上海喵神222', '1501742524', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('784', '1', '18818223461', '上海喵神222', '1501742941', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('785', '1', '18818223461', '上海喵神222', '1501744079', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('786', '1', '18818223461', '上海喵神222', '1501744134', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('787', '4', '15516517307', '上海喵神', '1501747905', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('788', '4', '15516517307', '上海喵神', '1501747908', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('789', '1', '18818223461', '上海喵神222', '1501748152', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('790', '1', '18818223461', '上海喵神222', '1501748516', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('791', '1', '18818223461', '上海喵神222', '1501753982', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('792', '1', '18818223461', '上海喵神222', '1501754303', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('793', '1', '18818223461', '上海喵神222', '1501754368', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('794', '1', '18818223461', '上海喵神222', '1501754706', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('795', '1', '18818223461', '上海喵神222', '1501754732', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('796', '1', '18818223461', '上海喵神222', '1501754745', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('797', '1', '18818223461', '上海喵神222', '1501814056', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('798', '1', '18818223461', '上海喵神222', '1501826715', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('799', '1', '18818223461', '上海喵神222', '1501827309', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('800', '1', '18818223461', '上海喵神222', '1501828424', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('801', '1', '18818223461', '上海喵神222', '1501830406', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('802', '1', '18818223461', '上海喵神222', '1501831792', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('803', '4', '15516517307', '上海喵神', '1501831856', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('804', '1', '18818223461', '上海喵神222', '1501839222', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('805', '1', '18818223461', '上海喵神222', '1501840206', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('806', '4', '15516517307', '上海喵神', '1501840902', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('807', '1', '18818223461', '上海喵神222', '1501840932', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('808', '1', '18818223461', '上海喵神222', '1502436115', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('809', '1', '18818223461', '上海喵神222', '1502436118', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('810', '4', '15516517307', '上海喵神', '1502678118', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('811', '4', '15516517307', '上海喵神', '1502678120', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('812', '1', '18818223461', '上海喵神222', '1502782942', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('813', '1', '18818223461', '上海喵神222', '1502782944', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('814', '4', '15516517307', '上海喵神', '1502850977', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('815', '1', '18818223461', '上海喵神222', '1502960391', '192.168.199.129');
INSERT INTO `jfy_regulator_login_log` VALUES ('816', '4', '15516517307', '上海喵神', '1503037802', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('817', '4', '15516517307', '上海喵神', '1503281869', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('818', '4', '15516517307', '上海喵神', '1503366670', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('819', '4', '15516517307', '上海喵神', '1503454395', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('820', '4', '15516517307', '上海喵神', '1503541847', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('821', '4', '15516517307', '上海喵神', '1503638949', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('822', '1', '18818223461', '上海喵神222', '1503639266', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('823', '1', '18818223461', '上海喵神222', '1503885303', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('824', '1', '18818223461', '上海喵神222', '1503972568', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('825', '1', '18818223461', '上海喵神222', '1503972569', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('826', '4', '15516517307', '上海家庭服务行业协会', '1503972585', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('827', '1', '18818223461', '上海喵神222', '1503975422', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('828', '4', '15516517307', '上海家庭服务行业协会', '1503987824', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('829', '4', '15516517307', '上海家庭服务行业协会', '1503992439', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('830', '1', '18818223461', '上海喵神222', '1503992456', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('831', '4', '15516517307', '上海家庭服务行业协会', '1504003660', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('832', '1', '18818223461', '上海喵神222', '1504003684', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('833', '1', '18818223461', '上海家庭服务行业协会', '1504084993', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('834', '4', '15516517307', '上海家庭服务行业协会', '1504085035', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('835', '4', '15516517307', '上海家庭服务行业协会', '1504086288', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('836', '1', '18818223461', '上海家庭服务行业协会', '1504086453', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('837', '1', '18818223461', '上海家庭服务行业协会', '1504086461', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('838', '4', '15516517307', '上海家庭服务行业协会', '1504086467', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('839', '4', '15516517307', '上海家庭服务行业协会', '1504086529', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('840', '1', '18818223461', '上海家庭服务行业协会', '1504086752', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('841', '4', '15516517307', '上海家庭服务行业协会', '1504086758', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('842', '4', '15516517307', '上海家庭服务行业协会', '1504088653', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('843', '1', '18818223461', '上海家庭服务行业协会', '1504095688', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('844', '4', '15516517307', '上海家庭服务行业协会', '1504099184', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('845', '1', '18818223461', '上海家庭服务行业协会', '1504490258', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('846', '1', '18818223461', '上海家庭服务行业协会', '1504576778', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('847', '1', '18818223461', '上海家庭服务行业协会', '1504602489', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('848', '1', '18818223461', '上海家庭服务行业协会', '1504603356', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('849', '4', '15516517307', '上海家庭服务行业协会', '1504605776', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('850', '1', '18818223461', '上海家庭服务行业协会', '1504694205', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('851', '1', '18818223461', '上海家庭服务行业协会', '1504694208', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('852', '1', '18818223461', '上海家庭服务行业协会', '1505095434', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('853', '4', '15516517307', '上海家庭服务行业协会', '1505095491', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('854', '1', '18818223461', '上海家庭服务行业协会', '1505095981', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('855', '1', '18818223461', '上海家庭服务行业协会', '1505099433', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('856', '4', '15516517307', '上海家庭服务行业协会', '1505100574', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('857', '5', '15737928816', '上海建筑公司', '1505191984', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('858', '5', '15737928816', '上海建筑公司', '1505192353', '192.168.199.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('859', '1', '18818223461', '上海家庭服务行业协会', '1505274753', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('860', '1', '18818223461', '上海家庭服务行业协会', '1505370951', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('861', '1', '18818223461', '上海家庭服务行业协会', '1505466514', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('862', '1', '18818223461', '上海家庭服务行业协会', '1505699222', '192.168.199.243');
INSERT INTO `jfy_regulator_login_log` VALUES ('863', '4', '15516517307', '上海家庭服务行业协会', '1508403027', '192.168.100.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('864', '1', '18818223461', '上海家庭服务行业协会', '1508915598', '192.168.100.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('865', '4', '15516517307', '上海家庭服务行业协会', '1510036131', '192.168.100.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('866', '7', '18272878105', '阿陈', '1511505886', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('867', '7', '18272878105', '阿陈', '1511505907', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('868', '7', '18272878105', '阿陈', '1511508673', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('869', '7', '18272878105', '阿陈', '1511510517', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('870', '7', '18272878105', '阿陈', '1511750392', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('871', '7', '18272878105', '阿陈', '1511753414', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('872', '4', '15516517307', '上海家庭服务行业协会', '1511774982', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('873', '7', '18272878105', '阿陈', '1511849784', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('874', '7', '18272878105', '阿陈', '1511859903', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('875', '7', '18272878105', '阿陈', '1511859934', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('876', '8', '15039541345', 'zhou-test', '1511861241', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('877', '7', '18272878105', '阿陈', '1511865482', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('878', '7', '18272878105', '阿陈', '1511867708', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('879', '8', '15039541345', 'zhou-test', '1511927355', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('880', '8', '15039541345', 'zhou-test', '1512025376', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('881', '7', '18272878105', '阿陈', '1512185261', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('882', '7', '18272878105', '阿陈', '1512362354', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('883', '8', '15039541345', 'zhou-test', '1512362998', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('884', '4', '15516517307', '上海家庭服务行业协会', '1512555529', '192.168.100.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('885', '9', '18817800000', '家政神铺监管', '1512731045', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('886', '9', '18817800000', '家政神铺监管', '1512731160', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('887', '9', '18817800000', '家政神铺监管', '1512960529', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('888', '9', '18817800000', '家政神铺监管', '1512960645', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('889', '9', '18817800000', '家政神铺监管', '1512960876', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('890', '9', '18817800000', '家政神铺监管', '1512961693', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('891', '9', '18817800000', '家政神铺监管', '1512962097', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('892', '9', '18817800000', '家政神铺监管', '1512962173', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('893', '9', '18817800000', '家政神铺监管', '1512963112', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('894', '9', '18817800000', '家政神铺监管', '1512963282', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('895', '9', '18817800000', '家政神铺监管', '1513059546', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('896', '9', '18817800000', '家政神铺监管', '1513061484', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('897', '9', '18817800000', '家政神铺监管', '1513062994', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('898', '9', '18817800000', '家政神铺监管', '1513085073', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('899', '9', '18817800000', '家政神铺监管', '1514536250', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('900', '9', '18817800000', '家政神铺监管', '1514966725', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('901', '9', '18817800000', '家政神铺监管', '1514966925', '192.168.100.160');
INSERT INTO `jfy_regulator_login_log` VALUES ('902', '4', '15516517307', '上海家庭服务行业协会', '1516764697', '192.168.100.190');
INSERT INTO `jfy_regulator_login_log` VALUES ('903', '1', '18818223461', '上海家庭服务行业协会', '1522663695', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('904', '4', '15516517307', '上海家庭服务行业协会', '1523864085', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('905', '9', '18817800000', '家政神铺监管', '1523864247', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('906', '4', '15516517307', '上海家庭服务行业协会', '1524016857', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('907', '9', '18817800000', '家政神铺监管', '1524016875', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('908', '4', '15516517307', '上海家庭服务行业协会', '1524016932', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('909', '9', '18817800000', '家政神铺监管', '1524022231', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('910', '4', '15516517307', '上海家庭服务行业协会', '1524022643', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('911', '4', '15516517307', '上海家庭服务行业协会', '1524031863', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('912', '9', '18817800000', '家政神铺监管', '1524033210', '192.168.100.192');
INSERT INTO `jfy_regulator_login_log` VALUES ('913', '4', '15516517307', '上海家庭服务行业协会', '1524035677', '192.168.100.36');
INSERT INTO `jfy_regulator_login_log` VALUES ('914', '4', '15516517307', '上海家庭服务行业协会', '1524038295', '192.168.100.36');
INSERT INTO `jfy_regulator_login_log` VALUES ('915', '4', '15516517307', '上海家庭服务行业协会', '1524038636', '192.168.100.36');

-- ----------------------------
-- Table structure for `jfy_regulator_session`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator_session`;
CREATE TABLE `jfy_regulator_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sessionId',
  `regulator_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=3059 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator_session
-- ----------------------------
INSERT INTO `jfy_regulator_session` VALUES ('126', '37', 'cd73d07a114f66c46cc3033effbb0208', '[]', '', '1482842759');
INSERT INTO `jfy_regulator_session` VALUES ('129', '26', '62803180e79fe64491fde6d1625f0a20', '[]', '', '1482910736');
INSERT INTO `jfy_regulator_session` VALUES ('138', '39', '336795d7d8de3b26c9d51f6647a3e44f', '[]', '', '1482993527');
INSERT INTO `jfy_regulator_session` VALUES ('232', '43', '97f348a578175d2bb3bc0e3e1041eeed', '[]', '', '1483085591');
INSERT INTO `jfy_regulator_session` VALUES ('307', '46', 'b821c2ae5b8861c81077e96eb769f430', '[]', '', '1483104755');
INSERT INTO `jfy_regulator_session` VALUES ('424', '64', '4dcd80fdb0920bdf9fb2b3575377133d', '[]', '', '1483601810');
INSERT INTO `jfy_regulator_session` VALUES ('602', '61', 'dfc14e8a8d9db9593bcf8ad01a61c40e', '[]', '', '1484213958');
INSERT INTO `jfy_regulator_session` VALUES ('607', '68', 'df527d420957aa56f917cd12e1c69412', '[]', '', '1484217992');
INSERT INTO `jfy_regulator_session` VALUES ('645', '74', '6bfd01b9519b781040c212e120c63943', '[]', '', '1484282188');
INSERT INTO `jfy_regulator_session` VALUES ('669', '80', '2fd16afbea4a309db425750507a60085', '[]', '', '1484298195');
INSERT INTO `jfy_regulator_session` VALUES ('902', '41', 'bf26f9dc1f67dbe5fe1f3fb6f6daf1a4', '[]', '', '1487573445');
INSERT INTO `jfy_regulator_session` VALUES ('978', '91', 'ae4b7ee2ba64e36b79a5a6bf30e4caab', '[]', '', '1488254555');
INSERT INTO `jfy_regulator_session` VALUES ('1328', '136', '1e4866de590cd998ae34ee016f1c5a6c', '[]', '', '1490704239');
INSERT INTO `jfy_regulator_session` VALUES ('1432', '33', '105bb6222733a0388ceed9011e6a1c97', '[]', '', '1491377406');
INSERT INTO `jfy_regulator_session` VALUES ('1465', '76', 'b24cda684ccd105ccfe633b2ec2327ae', '[]', '', '1491471672');
INSERT INTO `jfy_regulator_session` VALUES ('1832', '159', 'a46887eb2034967134808ed4248e3b86', '[]', '', '1492675906');
INSERT INTO `jfy_regulator_session` VALUES ('1860', '162', 'a6568b518e395063c9093585b98aacbf', '[]', '', '1492748368');
INSERT INTO `jfy_regulator_session` VALUES ('1863', '82', 'b6baa8229fec5c146e0435fffbc797bd', '[]', '', '1492748514');
INSERT INTO `jfy_regulator_session` VALUES ('1921', '168', 'bf975c0717a4676025aa42e930d9e86d', '[]', '', '1493013110');
INSERT INTO `jfy_regulator_session` VALUES ('1932', '160', 'efdebbc6a5304ae6a5ae47f320b940d7', '[]', '', '1493018970');
INSERT INTO `jfy_regulator_session` VALUES ('1945', '170', '2db76f48631c97d55df88738d226f79d', '[]', '', '1493023182');
INSERT INTO `jfy_regulator_session` VALUES ('2161', '56', '7e6dff94ed36a847d32d6e5cd210680a', '[]', '', '1493367448');
INSERT INTO `jfy_regulator_session` VALUES ('2169', '173', 'b8d58779c80cf65cc9a9e56e7d86bb1a', '[]', '', '1493367915');
INSERT INTO `jfy_regulator_session` VALUES ('2170', '65', 'f7e9b007223758dba4ccbfe70990a451', '[]', '', '1493367922');
INSERT INTO `jfy_regulator_session` VALUES ('2186', '174', 'eae8325bc0f46464a02a6f5e1cdc104b', '[]', '', '1493715485');
INSERT INTO `jfy_regulator_session` VALUES ('2223', '93', '75a652f2871bb06ec12498f4b0f72544', '[]', '', '1493797907');
INSERT INTO `jfy_regulator_session` VALUES ('2243', '55', 'a479c7131d5d061a4387c3dc41a7fe44', '[]', '', '1493893864');
INSERT INTO `jfy_regulator_session` VALUES ('2344', '116', '0f8307c3766a54930c35371dcc7c626b', '[]', '', '1494323255');
INSERT INTO `jfy_regulator_session` VALUES ('2400', '177', 'd56eca18758e87c0596bb47763343eaa', '[]', '', '1494835808');
INSERT INTO `jfy_regulator_session` VALUES ('2402', '178', '74398cb723d827fee7740c433a25be86', '[]', '', '1494835944');
INSERT INTO `jfy_regulator_session` VALUES ('2404', '179', '82ca46067ba0995c7b54530a29613195', '[]', '', '1494836040');
INSERT INTO `jfy_regulator_session` VALUES ('2458', '158', '9a1a62a754a631996ac202d218ca63e6', '[]', '', '1495164231');
INSERT INTO `jfy_regulator_session` VALUES ('2461', '175', '73469c9d37398ec6086e09a902a751e3', '[]', '', '1495167116');
INSERT INTO `jfy_regulator_session` VALUES ('2463', '78', '6ce4a42f109736d6e19f01fc4fffa4eb', '[]', '', '1495167245');
INSERT INTO `jfy_regulator_session` VALUES ('2632', '47', 'c05eb99486c93e7d9b292ec2b6c88c43', '[]', '', '1497262294');
INSERT INTO `jfy_regulator_session` VALUES ('2666', '161', '6ffbf3087434f1a2c0687a79769d0cf9', '[]', '', '1497514470');
INSERT INTO `jfy_regulator_session` VALUES ('2698', '145', 'e011277c1155cef2dad5db4eff421e93', '[]', '', '1497943886');
INSERT INTO `jfy_regulator_session` VALUES ('2734', '94', '3c39cb19b6b2bb7663f269d95af77bc4', '[]', '', '1498457241');
INSERT INTO `jfy_regulator_session` VALUES ('2768', '144', 'c97b55070597519c461d06d23ec83515', '[]', '', '1499075731');
INSERT INTO `jfy_regulator_session` VALUES ('2790', '194', 'e555a251678b2195748bf8536eb38461', '[]', '', '1499740891');
INSERT INTO `jfy_regulator_session` VALUES ('2792', '195', 'dbf90a17005f1549959498df30003646', '[]', '', '1499742804');
INSERT INTO `jfy_regulator_session` VALUES ('2825', '84', 'f7f99d12725b38ba367e1272cb56ff86', '[]', '', '1500517823');
INSERT INTO `jfy_regulator_session` VALUES ('2826', '25', '2d150b35fbd5196912b4e4b40c87177f', '[]', '', '1500517870');
INSERT INTO `jfy_regulator_session` VALUES ('2829', '92', 'bc9964f86f2b4b1e49d15873889cc3aa', '[]', '', '1500605115');
INSERT INTO `jfy_regulator_session` VALUES ('2880', '197', '5d1580a4988143131ac8748978b4d7cc', '[]', '', '1501212186');
INSERT INTO `jfy_regulator_session` VALUES ('3027', '7', '5cd6b3f4fb96dd3f4064cb20193dd9de', '[]', '', '1512362354');
INSERT INTO `jfy_regulator_session` VALUES ('3058', '4', '0552370ff9a62846e9929a9ca713a71f', '[]', '', '1524038636');

-- ----------------------------
-- Table structure for `jfy_regulator_to_company`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_regulator_to_company`;
CREATE TABLE `jfy_regulator_to_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regulator_id` int(10) NOT NULL COMMENT '监管者ID',
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_regulator_to_company
-- ----------------------------
INSERT INTO `jfy_regulator_to_company` VALUES ('1', '1', '1', '1501066823', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('2', '1', '2', '1501066823', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('7', '2', '5', '1501066823', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('9', '4', '1', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('10', '4', '2', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('11', '4', '3', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('12', '4', '4', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('13', '4', '5', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('15', '1', '6', '1501066823', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('16', '5', '10', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('17', '7', '14', '1511409513', '1511409513');
INSERT INTO `jfy_regulator_to_company` VALUES ('18', '8', '15', '1511861204', '1511861204');
INSERT INTO `jfy_regulator_to_company` VALUES ('19', '9', '21', '0', '0');
INSERT INTO `jfy_regulator_to_company` VALUES ('24', '9', '23', '1513059491', '1513059491');

-- ----------------------------
-- Table structure for `jfy_service_category`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_service_category`;
CREATE TABLE `jfy_service_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父类id 第一级为0',
  `name` varchar(20) DEFAULT '' COMMENT '服务名称',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '服务价格',
  `content` varchar(255) DEFAULT '' COMMENT '服务描述或内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1开启 2关闭',
  `img_src` varchar(100) DEFAULT '' COMMENT '服务图片描述',
  `config` text COMMENT '配置项',
  `service_hours` tinyint(1) NOT NULL DEFAULT '0' COMMENT '一个服务的时间段',
  `service_start_time` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '服务开始的时间段',
  `service_end_time` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '服务结束时间',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '服务标志码',
  `is_need_time` enum('2','1','0') NOT NULL DEFAULT '0' COMMENT '是否需要时间 0不需要 1小时段 2半小时',
  `lower_single_type` enum('long_term','n','ordinary') NOT NULL DEFAULT 'n' COMMENT '下单类型 n不需要下单 一般为父类时使用 ordinary普通 long_term长期',
  `payment_method` enum('full_payment','deposit','by_stages','n','all') NOT NULL DEFAULT 'n' COMMENT '该服务支持的付款方式 n 不需要付款 在父类时使用 ''full_payment''全款 ''deposit''定金 ''by_stages''分期''all'' 所有都支持',
  `default_img` varchar(100) DEFAULT '' COMMENT '缩略图',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE COMMENT 'pid索引',
  KEY `status` (`status`) USING BTREE,
  KEY `where` (`id`,`status`) USING BTREE,
  KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_service_category
-- ----------------------------
INSERT INTO `jfy_service_category` VALUES ('1', '0', '全能保姆', '0.00', '长期钟点工,放心省心', '1', '', '', '1', '8', '20', 'long_hours_work', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('2', '1', '长期钟点工', '320.00', '摆脱繁琐家务,重获生活自由', '1', 'http://zabapi.mshenpu.com/images/15227378203332.jpeg', '[{\"type\":\"select\",\"name\":\"房屋面积\",\"ename\":\"housing_area\",\"value\":[\"0-60平\",\"60-90平\",\"90-120平\",\"120平以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"开始时间\",\"ename\":\"start_time\",\"value\":[\"06:00\",\"07:00\",\"08:00\",\"09:00\",\"10:00\",\"11:00\",\"12:00\",\"13:00\",\"14:00\",\"15:00\",\"16:00\",\"17:00\",\"18:00\",\"19:00\",\"20:00\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"宠物\",\"ename\":\"pet\",\"value\":[\"无\",\"小型宠物\",\"大型宠物\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"到岗时间\",\"ename\":\"demand_interval\",\"value\":[\"越快越好\",\"三天以内\",\"一周以上\",\"可协商\"],\"con\":\"\"}]', '1', '8', '20', 'long_term_housekeeping', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231719952343.jpeg');
INSERT INTO `jfy_service_category` VALUES ('3', '1', '住家/早出晚归保姆', '320.00', '家常菜,妈妈的味道', '1', 'http://zabapi.mshenpu.com/images/15227378203332.jpeg', '[{\"type\":\"select\",\"name\":\"保姆类型\",\"ename\":\"nanny_type\",\"value\":[\"住家\",\"早出晚归\",\"待定\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务时长\",\"ename\":\"length_of_service\",\"value\":[\"1-3个月\",\"4-6个月\",\"7-12个月\",\"12个月以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务面积\",\"ename\":\"housing_area\",\"value\":[\"0-60平\",\"60-90平\",\"90-120平\",\"120平以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"可接受价位\",\"ename\":\"salary_expectation\",\"value\":[\"4000~5500元\",\"5500~8000元\",\"8000元以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"到岗时间\",\"ename\":\"demand_interval\",\"value\":[\"越快越好\",\"三天以内\",\"一周以上\",\"可协商\"],\"con\":\"\"},{\"type\":\"textArea\",\"name\":\"备注\",\"ename\":\"remarks\",\"con\":\"\"}]', '1', '8', '20', 'cooking_aunts', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231720528094.jpeg');
INSERT INTO `jfy_service_category` VALUES ('4', '1', '企业保洁', '700.00', '给员工一个温馨舒适的家', '2', '', '[{\"type\":\"text\",\"name\":\"公司名称\",\"ename\":\"corporate_name\",\"con\":\"\"},{\"type\":\"select\",\"name\":\"公司面积\",\"ename\":\"company_area\",\"value\":[\"90平左右\",\"90~120平\",\"120~150平\",\"150~180平\",\"180平以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务频次\",\"ename\":\"frequency_of_service\",\"value\":[\"每周1次\",\"每周2次\",\"每周3次\",\"每周4次\",\"每周5次\",\"每周6次\",\"每周7次\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务时长\",\"ename\":\"length_of_service\",\"value\":[\"2小时\",\"2.5小时\",\"3小时\",\"3.5小时\",\"4小时\",\"4小时以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"需求时段\",\"ename\":\"demand_interval\",\"value\":[\"一周内\",\"两周内\",\"一个月内\"],\"con\":\"\"},{\"type\":\"textArea\",\"name\":\"其他需求\",\"ename\":\"other_needs\",\"con\":\"\"}]', '1', '8', '20', 'enterprise_cleaning', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231721147491.jpeg');
INSERT INTO `jfy_service_category` VALUES ('5', '0', '母婴护理', '0.00', '好保姆，好生活', '1', '', null, '1', '8', '20', 'nanny_yuesao', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('6', '5', '月嫂', '7800.00', '呵护母婴,体贴放心', '1', 'http://zabapi.mshenpu.com/images/15227382417328.jpeg', '[{\"type\":\"text\",\"name\":\"预产期\",\"ename\":\"expected_date_of_childbirth\",\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务时长\",\"ename\":\"length_of_service\",\"value\":[\"26天\",\"42天\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"工资预期\",\"ename\":\"salary_expectation\",\"value\":[\"6000~8000元\",\"7000~9000元\",\"8000~10000元\",\"10000元以上\"],\"con\":\"\"},{\"type\":\"textArea\",\"name\":\"其他需求\",\"ename\":\"other_needs\",\"con\":\"\"}]', '1', '8', '20', 'maternity_matron', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231721422616.jpeg');
INSERT INTO `jfy_service_category` VALUES ('7', '5', '育儿嫂', '6000.00', '专业呵护,快乐成长', '1', 'http://zabapi.mshenpu.com/images/15227383016804.jpeg', '[{\"type\":\"select\",\"name\":\"育儿嫂类型\",\"ename\":\"nanny_type\",\"value\":[\"住家\",\"早出晚归\",\"待定\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务时长\",\"ename\":\"length_of_service\",\"value\":[\"1-3个月\",\"4-6个月\",\"7-12个月\",\"12个月以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"到岗时间\",\"ename\":\"demand_interval\",\"value\":[\"越快越好\",\"三天以内\",\"一周以上\",\"可协商\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"房屋面积\",\"ename\":\"housing_area\",\"value\":[\"0-60平\",\"60-90平\",\"90-120平\",\"120平以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"家庭人数\",\"ename\":\"family_number\",\"value\":[\"3~5人\",\"6~8人\",\"8人以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"宝宝年龄\",\"ename\":\"baby_age\",\"value\":[\"1~3个月\",\"4~6个月\",\"7~12个月\",\"1~2岁\",\"2~3岁\",\"3岁以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"工资预期\",\"ename\":\"salary_expectation\",\"value\":[\"6000~8000元\",\"7000~9000元\",\"8000~10000元\",\"10000元以上\"],\"con\":\"\"},{\"type\":\"textArea\",\"name\":\"其他需求\",\"ename\":\"other_needs\",\"con\":\"\"}]', '1', '8', '20', 'sister_in_law', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231721773907.jpeg');
INSERT INTO `jfy_service_category` VALUES ('8', '0', '专项保洁', '0.00', '深度保洁，关注您的健康', '1', '', null, '1', '8', '20', 'special_cleaning', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('10', '8', '深度保洁', '10.00', '体验深度保洁,享受新家感觉', '1', 'http://zabapi.mshenpu.com/images/15227354684718.jpeg', '[{\"type\":\"unit_text\",\"name\":\"深度保洁\",\"ename\":\"deep_cleaning\",\"price\":\"10.00\",\"con\":\"\",\"unit\":\"平米\"}]', '1', '8', '20', 'deep_cleaning', '2', 'ordinary', 'deposit', 'http://zabapi.mshenpu.com/images/15231745789135.jpeg');
INSERT INTO `jfy_service_category` VALUES ('12', '8', '开荒保洁', '400.00', '新房入住,首选服务', '1', 'http://zabapi.mshenpu.com/images/15233550085496.jpeg', '[{\"type\":\"unit_text\",\"name\":\"房屋面积\",\"ename\":\"home_area\",\"con\":\"\"},{\"type\":\"select\",\"name\":\"家具情况\",\"ename\":\"furniture\",\"value\":[\"有家具\",\"无家具\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"装修情况\",\"ename\":\"renovation\",\"value\":[\"新装修\",\"旧装修\",\"别墅/阁楼\"],\"con\":\"\",\"tup\":{\"new_decoration\":{\"80_down_yes\":{\"sum\":\"648\"},\"80_down_no\":{\"sum\":\"748\"},\"80_up_yes\":{\"price\":\"8\"},\"80_up_no\":{\"price\":\"7\"}},\"old_decoration\":{\"80_down_yes\":{\"sum\":\"568\"},\"80_down_no\":{\"sum\":\"648\"},\"80_up_furniture_yes\":{\"price\":\"9\"},\"80_up_furniture_no\":{\"price\":\"8\"}},\"villa\":{\"80_down_yes\":{\"price\":\"9\"},\"80_down_no\":{\"price\":\"8\"},\"80_up_yes\":{\"price\":\"9\"},\"80_up_no\":{\"price\":\"8\"}}}}]', '1', '8', '20', 'open_wasteland', '2', 'ordinary', 'deposit', 'http://zabapi.mshenpu.com/images/15231747738145.jpeg');
INSERT INTO `jfy_service_category` VALUES ('13', '8', '精细擦玻璃', '100.00', '洁净玻璃,闪亮心情', '1', 'http://zabapi.mshenpu.com/images/15233544276340.jpeg', '[]', '1', '8', '20', 'wipe_glass', '2', 'ordinary', 'deposit', 'http://zabapi.mshenpu.com/images/15231748003904.jpeg');
INSERT INTO `jfy_service_category` VALUES ('14', '8', '厨房保养', '580.00', '厨房保养,感受敞亮空间', '1', 'http://zabapi.mshenpu.com/images/15233575225913.jpeg', '[{\"type\":\"unit_text\",\"name\":\"厨房保养\",\"ename\":\"kitchen_maintenance\",\"price\":\"580.00\",\"con\":\"\",\"unit\":\"间\"}]', '1', '8', '20', 'kitchen_maintenance', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231748262392.jpeg');
INSERT INTO `jfy_service_category` VALUES ('15', '8', '卫生间保养', '380.00', '卫生间保养,焕发闪亮光洁', '1', 'http://zabapi.mshenpu.com/images/15227406996343.jpeg', '[{\"type\":\"unit_text\",\"name\":\"卫生间保养\",\"ename\":\"toilet_maintenance\",\"price\":\"380.00\",\"con\":\"\",\"unit\":\"间\"}]', '1', '8', '20', 'toilet_maintenance', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231748516467.jpeg');
INSERT INTO `jfy_service_category` VALUES ('16', '8', '地板打蜡', '12.00', '天然蜂蜡,温和养护', '1', 'http://zabapi.mshenpu.com/images/15227343976208.png', '[{\"type\":\"unit_text\",\"name\":\"地板面积\",\"ename\":\"floor_waxing\",\"price\":\"12.00\",\"con\":\"\",\"unit\":\"平米\"}]', '1', '8', '20', 'floor_waxing', '2', 'ordinary', 'deposit', 'http://zabapi.mshenpu.com/images/15231748897361.jpeg');
INSERT INTO `jfy_service_category` VALUES ('17', '0', '看护老人', '0.00', '至亲至爱,暖心陪伴', '1', '', null, '1', '8', '20', 'care_for_the_old_man', '0', 'n', 'n', 'http://zabapi.mshenpu.com/images/15231734511965.jpeg');
INSERT INTO `jfy_service_category` VALUES ('18', '17', '老人陪护', '4500.00', '至亲至爱,暖心陪伴', '1', 'http://zabapi.mshenpu.com/images/15233540138033.jpeg', '[{\"type\":\"select\",\"name\":\"类型\",\"ename\":\"type\",\"value\":[\"住家\",\"早出晚归\",\"钟点\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务时长\",\"ename\":\"length_of_service\",\"value\":[\"临时\",\"1~3个月\",\"4~6个月\",\"7~12个月\",\"12个月以上\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"到岗时间\",\"ename\":\"demand_interval\",\"value\":[\"越快越好\",\"三天以内\",\"一周以上\",\"可协商\"],\"con\":\"\"},{\"type\":\"select\",\"name\":\"服务面积\",\"ename\":\"housing_area\",\"value\":[\"0-60平\",\"60-90平\",\"90-120平\",\"120平以上\"],\"con\":\"\"}]', '1', '8', '20', 'aged_care', '0', 'long_term', 'deposit', 'http://zabapi.mshenpu.com/images/15231734511965.jpeg');
INSERT INTO `jfy_service_category` VALUES ('20', '0', '家电清洗', '0.00', '专注家电清洗', '1', '', null, '1', '8', '20', 'cleaning_of_household_appliances', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('21', '20', '冰箱清洗', '150.00', '健康冰箱,健康生活', '1', 'http://zabapi.mshenpu.com/images/15227410278798.jpeg', '[{\"type\":\"unit_text\",\"name\":\"单开门冰箱\",\"ename\":\"open_door_refrigerator\",\"price\":\"150.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"双开门冰箱\",\"ename\":\"double_door_fridge\",\"price\":\"180.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"三开门冰箱\",\"ename\":\"three_open_door_refrigerator\",\"price\":\"210.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"对开门冰箱\",\"ename\":\"side_by_side\",\"price\":\"240.00\",\"con\":\"\",\"unit\":\"台\"}]', '1', '8', '20', 'refrigerator_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231726701414.jpeg');
INSERT INTO `jfy_service_category` VALUES ('22', '20', '油烟机清洗', '150.00', '洗尽铅华,油影无踪', '1', 'http://zabapi.mshenpu.com/images/15227411288635.jpeg', '[{\"type\":\"unit_text\",\"name\":\"中式油烟机\",\"ename\":\"chinese_fume_machine\",\"price\":\"150.00\",\"con\":\"\",\"unit\":\"套\"},{\"type\":\"unit_text\",\"name\":\"欧式油烟机\",\"ename\":\"european_type_oil_fume_machine\",\"price\":\"180.00\",\"con\":\"\",\"unit\":\"套\"},{\"type\":\"unit_text\",\"name\":\"侧式油烟机\",\"ename\":\"side_type_oil_fume_machine\",\"price\":\"210.00\",\"con\":\"\",\"unit\":\"套\"}]', '1', '8', '20', 'oil_fume_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15233597135410.jpeg');
INSERT INTO `jfy_service_category` VALUES ('23', '20', '洗衣机清洗', '168.00', '拒绝脏桶洗衣', '1', 'http://zabapi.mshenpu.com/images/15233546997029.jpeg', '[{\"type\":\"unit_text\",\"name\":\"滚筒洗衣机\",\"ename\":\"drum_washing_machine\",\"price\":\"168.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"波轮洗衣机(免拆)\",\"ename\":\"wave_wheel_washer\",\"price\":\"158.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"波轮洗衣机(拆开)\",\"ename\":\"wave_wheel_washer_chai\",\"price\":\"198.00\",\"con\":\"\",\"unit\":\"台\"}]', '1', '8', '20', 'washing_machine_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231729204241.jpeg');
INSERT INTO `jfy_service_category` VALUES ('24', '20', '空调清洗', '120.00', '空调清洗,拒绝室内雾霾', '1', 'http://zabapi.mshenpu.com/images/15227424459065.jpeg', '[{\"type\":\"unit_text\",\"name\":\"挂式空调\",\"ename\":\"hanging_type_air_conditioner\",\"price\":\"120.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"柜式空调\",\"ename\":\"cabinet_type_air_conditioner\",\"price\":\"180.00\",\"con\":\"\",\"unit\":\"台\"},{\"type\":\"unit_text\",\"name\":\"中央空调\",\"ename\":\"Central_air_conditioning\",\"price\":\"158.00\",\"con\":\"\",\"unit\":\"台\"}]', '1', '8', '20', 'air_conditioning_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231729456514.jpeg');
INSERT INTO `jfy_service_category` VALUES ('25', '20', '地毯清洗', '10.00', '无缝清洗,滋润养护', '1', 'http://zabapi.mshenpu.com/images/15227348462627.jpeg', '[{\"type\":\"unit_text\",\"name\":\"办公室\",\"ename\":\"office\",\"price\":\"10.00\",\"con\":\"\",\"unit\":\"平米\"},{\"type\":\"unit_text\",\"name\":\"纯毛\",\"ename\":\"pure_wool\",\"price\":\"60.00\",\"con\":\"\",\"unit\":\"平米\"},{\"type\":\"unit_text\",\"name\":\"纯毛满铺\",\"ename\":\"wool_shop\",\"price\":\"35.00\",\"con\":\"\",\"unit\":\"平米\"},{\"type\":\"unit_text\",\"name\":\"混纺满铺\",\"ename\":\"blends\",\"price\":\"20.00\",\"con\":\"\",\"unit\":\"平米\"}]', '1', '8', '20', 'carpet_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231731299101.jpeg');
INSERT INTO `jfy_service_category` VALUES ('26', '20', '沙发清洗', '88.00', '无缝清洗,滋润养护', '1', 'http://zabapi.mshenpu.com/images/15227430385004.jpeg', '[{\"type\":\"unit_text\",\"name\":\"布艺沙发\",\"ename\":\"fabric_sofa\",\"price\":\"88.00\",\"con\":\"\",\"unit\":\"座\"},{\"type\":\"unit_text\",\"name\":\"皮质沙发\",\"ename\":\"leather_sofa\",\"price\":\"108.00\",\"con\":\"\",\"unit\":\"座\"}]', '1', '8', '20', 'sofa_cleaning', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231732653177.jpeg');
INSERT INTO `jfy_service_category` VALUES ('27', '0', '健康生活', '0.00', '您的健康我负责', '1', '', null, '1', '8', '20', 'healthy_life', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('28', '27', '深度除螨', '199.00', '深度除螨,刻不容缓', '1', 'http://zabapi.mshenpu.com/images/15233433837680.jpeg', '\r\n[{\"type\":\"unit_text\",\"name\":\"单人床\",\"ename\":\"single_bed\",\"price\":\"169\",\"unit\":\"张\",\"con\":\"\"},{\"type\":\"unit_text\",\"name\":\"双人床\",\"ename\":\"double_bed\",\"price\":\"199\",\"unit\":\"张\",\"con\":\"\"},{\"type\":\"unit_text\",\"name\":\"布艺沙发\",\"ename\":\"fabric_sofa\",\"price\":\"60\",\"unit\":\"座\",\"con\":\"\"},{\"type\":\"unit_text\",\"name\":\"布艺窗帘\",\"ename\":\"fabric_curtain\",\"price\":\"149\",\"unit\":\"幅\",\"con\":\"\"},{\"type\":\"unit_text\",\"name\":\"地毯\",\"ename\":\"carpet\",\"price\":\"159\",\"unit\":\"幅\",\"con\":\"\"}]', '1', '8', '20', 'deep_demodex', '2', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231733852007.jpeg');
INSERT INTO `jfy_service_category` VALUES ('29', '8', '临时保洁', '45.00', '经典人生离不开家服云保洁的服务', '1', 'http://zabapi.mshenpu.com/images/15233577129789.jpeg', '[{\"type\":\"unit_text\",\"name\":\"日常保洁\",\"ename\":\"aunt\",\"price\":\"45.00\",\"con\":\"\",\"unit\":\"小时\"}]', '1', '8', '20', 'single_cleaning', '0', 'ordinary', 'full_payment', 'http://zabapi.mshenpu.com/images/15231750163263.jpeg');
INSERT INTO `jfy_service_category` VALUES ('30', '0', '金牌收纳', '0.00', '专注收纳，帮您管理你的家庭生活', '1', '', '', '1', '8', '20', 'gold_medals', '0', 'n', 'n', '');
INSERT INTO `jfy_service_category` VALUES ('31', '30', '金牌收纳', '3900.00', '天下再大，我来笑纳', '1', 'http://zabapi.mshenpu.com/images/15231764288282.jpeg', '[{\"type\":\"select\",\"name\":\"房屋面积\",\"ename\":\"housing_area\",\"value\":[\"90平左右\",\"120~150平\",\"150~180平\",\"180平以上\"],\"price\":\"3900.00\"}]', '5', '8', '20', 'medals', '2', 'ordinary', 'deposit', '');
INSERT INTO `jfy_service_category` VALUES ('32', '30', '品质生活', '4690.00', '天下再大，我来笑纳', '1', 'http://zabapi.mshenpu.com/images/15232748524586.png', '[{\"type\":\"select\",\"name\":\"套餐\",\"ename\":\"package\",\"value\":[\"套餐一:收纳+除螨(4690元)\",\"套餐二:收纳+除菌(5530元)\",\"套餐三:收纳+除菌+除螨(5810元)\"],\"tup\":[\"4690\",\"5530\",\"5810\"]}]', '1', '8', '20', 'set_dinner', '2', 'ordinary', 'full_payment', '');
INSERT INTO `jfy_service_category` VALUES ('33', '27', '健康生活', '880.00', '您的健康我负责', '1', 'http://zabapi.mshenpu.com/images/15241208233634.png', '[{\"type\":\"select\",\"name\":\"套餐\",\"ename\":\"package\",\"value\":[\"套餐一:除螨+家电清洗(880元)\"],\"tup\":[\"880\"]}]', '1', '8', '20', 'health_package', '2', 'ordinary', 'full_payment', '');

-- ----------------------------
-- Table structure for `jfy_sms_checkcode`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_sms_checkcode`;
CREATE TABLE `jfy_sms_checkcode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号码',
  `code` varchar(255) NOT NULL COMMENT '验证码',
  `status` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '使用状态',
  `create_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_sms_checkcode
-- ----------------------------
INSERT INTO `jfy_sms_checkcode` VALUES ('6', '18818223461', '761788', 'y', '1499743223');
INSERT INTO `jfy_sms_checkcode` VALUES ('8', '18818223461', '761788', 'y', '1491979536');
INSERT INTO `jfy_sms_checkcode` VALUES ('12', '18621722857', '698272', 'y', '1482312423');
INSERT INTO `jfy_sms_checkcode` VALUES ('14', '15323235656', '558441', 'y', '1481884746');
INSERT INTO `jfy_sms_checkcode` VALUES ('15', '15516517311', '596966', 'y', '1494835530');
INSERT INTO `jfy_sms_checkcode` VALUES ('16', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('17', '18521722857', '745501', 'n', '1510219338');
INSERT INTO `jfy_sms_checkcode` VALUES ('18', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('19', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('20', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('21', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('22', '15516517301', '315826', 'n', '1484052705');
INSERT INTO `jfy_sms_checkcode` VALUES ('23', '15516517301', '315826', 'n', '1484052705');
INSERT INTO `jfy_sms_checkcode` VALUES ('24', '15516517301', '315826', 'n', '1484052705');
INSERT INTO `jfy_sms_checkcode` VALUES ('25', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('26', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('27', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('28', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('29', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('30', '15516517304', '614105', 'n', '1483589826');
INSERT INTO `jfy_sms_checkcode` VALUES ('31', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('32', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('33', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('34', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('35', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('36', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('37', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('38', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('39', '15516517307', '114529', 'y', '1514432015');
INSERT INTO `jfy_sms_checkcode` VALUES ('40', '15516517301', '315826', 'n', '1484052705');
INSERT INTO `jfy_sms_checkcode` VALUES ('41', '15516517302', '546209', 'y', '1483613882');
INSERT INTO `jfy_sms_checkcode` VALUES ('42', '15516517308', '292453', 'y', '1482465780');
INSERT INTO `jfy_sms_checkcode` VALUES ('43', '15516517306', '788375', 'y', '1482465862');
INSERT INTO `jfy_sms_checkcode` VALUES ('44', '18722761562', '752120', 'y', '1492655285');
INSERT INTO `jfy_sms_checkcode` VALUES ('45', '18722761560', '979208', 'n', '1497510748');
INSERT INTO `jfy_sms_checkcode` VALUES ('46', '18521722857', '745501', 'n', '1510219338');
INSERT INTO `jfy_sms_checkcode` VALUES ('47', '13917771100', '211264', 'y', '1493959440');
INSERT INTO `jfy_sms_checkcode` VALUES ('48', '13917771120', '848373', 'y', '1482830859');
INSERT INTO `jfy_sms_checkcode` VALUES ('49', '13917771101', '574098', 'n', '1482836888');
INSERT INTO `jfy_sms_checkcode` VALUES ('50', '13917771111', '231753', 'y', '1493004473');
INSERT INTO `jfy_sms_checkcode` VALUES ('51', '13123123123', '816645', 'n', '1482837008');
INSERT INTO `jfy_sms_checkcode` VALUES ('52', '13912312312', '154675', 'n', '1482837041');
INSERT INTO `jfy_sms_checkcode` VALUES ('53', '18818818888', '654157', 'y', '1482842719');
INSERT INTO `jfy_sms_checkcode` VALUES ('54', '15516517201', '267596', 'y', '1482993503');
INSERT INTO `jfy_sms_checkcode` VALUES ('55', '15516517101', '472958', 'y', '1482993603');
INSERT INTO `jfy_sms_checkcode` VALUES ('56', '18272878105', '220794', 'n', '1514270245');
INSERT INTO `jfy_sms_checkcode` VALUES ('57', '18037457326', '626052', 'y', '1483085325');
INSERT INTO `jfy_sms_checkcode` VALUES ('58', '18839780608', '649343', 'y', '1492653871');
INSERT INTO `jfy_sms_checkcode` VALUES ('59', '18818818887', '752752', 'y', '1483104193');
INSERT INTO `jfy_sms_checkcode` VALUES ('60', '15737928808', '654205', 'y', '1489566359');
INSERT INTO `jfy_sms_checkcode` VALUES ('61', '15737928888', '820840', 'n', '1483439589');
INSERT INTO `jfy_sms_checkcode` VALUES ('62', '18521722837', '406738', 'y', '1483440656');
INSERT INTO `jfy_sms_checkcode` VALUES ('63', '15737928816', '431347', 'y', '1483441811');
INSERT INTO `jfy_sms_checkcode` VALUES ('64', '15737928782', '227166', 'y', '1483442167');
INSERT INTO `jfy_sms_checkcode` VALUES ('65', '15039541345', '261259', 'y', '1483590379');
INSERT INTO `jfy_sms_checkcode` VALUES ('66', '15203951212', '928648', 'y', '1483590399');
INSERT INTO `jfy_sms_checkcode` VALUES ('67', '15539541345', '261389', 'n', '1483594705');
INSERT INTO `jfy_sms_checkcode` VALUES ('68', '13917771102', '449266', 'y', '1483601169');
INSERT INTO `jfy_sms_checkcode` VALUES ('69', '15536985212', '191790', 'n', '1483606970');
INSERT INTO `jfy_sms_checkcode` VALUES ('70', '15516517303', '163885', 'y', '1483614208');
INSERT INTO `jfy_sms_checkcode` VALUES ('71', '15516517305', '407836', 'y', '1484052770');
INSERT INTO `jfy_sms_checkcode` VALUES ('72', '15516517707', '993270', 'y', '1484052987');
INSERT INTO `jfy_sms_checkcode` VALUES ('73', '15516517777', '695761', 'y', '1484217914');
INSERT INTO `jfy_sms_checkcode` VALUES ('74', '13611112222', '251583', 'y', '1484274713');
INSERT INTO `jfy_sms_checkcode` VALUES ('75', '18272878103', '529235', 'y', '1484274841');
INSERT INTO `jfy_sms_checkcode` VALUES ('76', '18272878104', '590072', 'y', '1493023135');
INSERT INTO `jfy_sms_checkcode` VALUES ('77', '15526262323', '794912', 'y', '1484279331');
INSERT INTO `jfy_sms_checkcode` VALUES ('78', '15526260011', '245404', 'y', '1484279490');
INSERT INTO `jfy_sms_checkcode` VALUES ('79', '15522661122', '146444', 'y', '1484279616');
INSERT INTO `jfy_sms_checkcode` VALUES ('80', '15722335566', '821444', 'y', '1484279679');
INSERT INTO `jfy_sms_checkcode` VALUES ('81', '15522336655', '760305', 'n', '1484282590');
INSERT INTO `jfy_sms_checkcode` VALUES ('82', '18272878100', '687301', 'y', '1489566586');
INSERT INTO `jfy_sms_checkcode` VALUES ('83', '15522336688', '660742', 'y', '1484282651');
INSERT INTO `jfy_sms_checkcode` VALUES ('84', '15533668899', '975390', 'y', '1484298124');
INSERT INTO `jfy_sms_checkcode` VALUES ('85', '15622335566', '235645', 'n', '1484298125');
INSERT INTO `jfy_sms_checkcode` VALUES ('86', '15599887744', '375701', 'y', '1484301376');
INSERT INTO `jfy_sms_checkcode` VALUES ('87', '13711223366', '114776', 'y', '1484301477');
INSERT INTO `jfy_sms_checkcode` VALUES ('88', '15022667788', '653656', 'y', '1487582666');
INSERT INTO `jfy_sms_checkcode` VALUES ('89', '18521722888', '714245', 'y', '1488372017');
INSERT INTO `jfy_sms_checkcode` VALUES ('90', '15737928809', '926693', 'y', '1489983297');
INSERT INTO `jfy_sms_checkcode` VALUES ('91', '15737927799', '590457', 'y', '1491464459');
INSERT INTO `jfy_sms_checkcode` VALUES ('92', '15516517300', '925567', 'y', '1491018800');
INSERT INTO `jfy_sms_checkcode` VALUES ('93', '18721722877', '123456', 'y', '1491469192');
INSERT INTO `jfy_sms_checkcode` VALUES ('94', '15737929977', '557608', 'y', '1491471423');
INSERT INTO `jfy_sms_checkcode` VALUES ('95', '13355667788', '563265', 'y', '1491818264');
INSERT INTO `jfy_sms_checkcode` VALUES ('96', '13312345678', '937185', 'y', '1499847006');
INSERT INTO `jfy_sms_checkcode` VALUES ('97', '18201869634', '767144', 'n', '1493708195');
INSERT INTO `jfy_sms_checkcode` VALUES ('98', '15512345677', '989041', 'y', '1492748298');
INSERT INTO `jfy_sms_checkcode` VALUES ('99', '17712345678', '180447', 'y', '1492744064');
INSERT INTO `jfy_sms_checkcode` VALUES ('100', '17612345678', '711196', 'y', '1492744187');
INSERT INTO `jfy_sms_checkcode` VALUES ('101', '17712345677', '375756', 'y', '1492763255');
INSERT INTO `jfy_sms_checkcode` VALUES ('102', '18272878101', '630090', 'y', '1493000070');
INSERT INTO `jfy_sms_checkcode` VALUES ('103', '18812345678', '605838', 'y', '1493000259');
INSERT INTO `jfy_sms_checkcode` VALUES ('104', '15612346578', '171960', 'n', '1493006108');
INSERT INTO `jfy_sms_checkcode` VALUES ('105', '18612346578', '188439', 'y', '1493024119');
INSERT INTO `jfy_sms_checkcode` VALUES ('106', '15512346578', '762475', 'y', '1493024458');
INSERT INTO `jfy_sms_checkcode` VALUES ('107', '17512345678', '292453', 'y', '1493715288');
INSERT INTO `jfy_sms_checkcode` VALUES ('108', '15712345678', '390368', 'y', '1493717491');
INSERT INTO `jfy_sms_checkcode` VALUES ('109', '15212345678', '563485', 'n', '1494403850');
INSERT INTO `jfy_sms_checkcode` VALUES ('110', '18521722877', '281658', 'y', '1497412228');
INSERT INTO `jfy_sms_checkcode` VALUES ('111', '18272878106', '996813', 'n', '1513756700');
INSERT INTO `jfy_sms_checkcode` VALUES ('112', '18272878107', '425689', 'n', '1513756550');
INSERT INTO `jfy_sms_checkcode` VALUES ('113', '18772878105', '975500', 'n', '1499998838');
INSERT INTO `jfy_sms_checkcode` VALUES ('114', 'undefined', '928286', 'n', '1509969513');
INSERT INTO `jfy_sms_checkcode` VALUES ('115', '1872878105', '523989', 'n', '1510026967');
INSERT INTO `jfy_sms_checkcode` VALUES ('116', '1827287810', '793072', 'n', '1510027011');
INSERT INTO `jfy_sms_checkcode` VALUES ('117', '15812345678', '218624', 'y', '1510218356');
INSERT INTO `jfy_sms_checkcode` VALUES ('118', '18272878109', '313299', 'y', '1510644966');
INSERT INTO `jfy_sms_checkcode` VALUES ('119', '18817800000', '739788', 'n', '1512463090');
INSERT INTO `jfy_sms_checkcode` VALUES ('120', '17611110000', '809744', 'n', '1512464763');
INSERT INTO `jfy_sms_checkcode` VALUES ('121', '13312345677', '911752', 'y', '1512466325');
INSERT INTO `jfy_sms_checkcode` VALUES ('122', '18817700000', '249551', 'y', '1513048721');
INSERT INTO `jfy_sms_checkcode` VALUES ('123', '17811110000', '222991', 'n', '1513051755');
INSERT INTO `jfy_sms_checkcode` VALUES ('124', '17811114444', '421679', 'n', '1513070937');
INSERT INTO `jfy_sms_checkcode` VALUES ('125', '18272878116', '414236', 'n', '1513756763');
INSERT INTO `jfy_sms_checkcode` VALUES ('126', '18272878119', '470596', 'n', '1513759526');
INSERT INTO `jfy_sms_checkcode` VALUES ('127', '15516517000', '848498', 'y', '1513761187');
INSERT INTO `jfy_sms_checkcode` VALUES ('128', '15516517111', '802932', 'y', '1513761472');
INSERT INTO `jfy_sms_checkcode` VALUES ('129', '15516517222', '913565', 'y', '1513762113');
INSERT INTO `jfy_sms_checkcode` VALUES ('130', '18522229999', '271990', 'y', '1513931085');

-- ----------------------------
-- Table structure for `jfy_sms_send_log`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_sms_send_log`;
CREATE TABLE `jfy_sms_send_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `content` text NOT NULL COMMENT '短信内容',
  `send_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_sms_send_log
-- ----------------------------
INSERT INTO `jfy_sms_send_log` VALUES ('1', '18521722857', '您的验证码：623596，感谢使用神铺微商城系统。【喵神科技】', '1480060034');
INSERT INTO `jfy_sms_send_log` VALUES ('2', '18521722857', '您的验证码是：356245，有效期五分钟。【喵神科技】', '1480331455');
INSERT INTO `jfy_sms_send_log` VALUES ('3', '18521722857', '您的验证码是：266433，退订回N【喵神科技】', '1480419184');
INSERT INTO `jfy_sms_send_log` VALUES ('4', '18521722857', '您的验证码是：266223，退订回N【喵神科技】', '1480421025');
INSERT INTO `jfy_sms_send_log` VALUES ('5', '18521722857', '欢迎来到喵神神铺，退订回N【喵神科技】', '1480424339');
INSERT INTO `jfy_sms_send_log` VALUES ('6', '18521722857', '短信验证码', '1481875305');
INSERT INTO `jfy_sms_send_log` VALUES ('7', '18818223461', '短信验证码', '1481875761');
INSERT INTO `jfy_sms_send_log` VALUES ('8', '18521722857', '短信验证码', '1481876208');
INSERT INTO `jfy_sms_send_log` VALUES ('9', '18818223461', '短信验证码', '1481876269');
INSERT INTO `jfy_sms_send_log` VALUES ('10', '18521722857', '【喵神科技】您的验证码：641540，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481876787');
INSERT INTO `jfy_sms_send_log` VALUES ('11', '18521722857', '【喵神科技】您的验证码：136474，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481877336');
INSERT INTO `jfy_sms_send_log` VALUES ('12', '18521722857', '【喵神科技】您的验证码：698272，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481877365');
INSERT INTO `jfy_sms_send_log` VALUES ('13', '18521722857', '【喵神科技】您的验证码：908538，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481877381');
INSERT INTO `jfy_sms_send_log` VALUES ('14', '15516517307', '【喵神科技】您的验证码：558441，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481883521');
INSERT INTO `jfy_sms_send_log` VALUES ('15', '15516517307', '【喵神科技】您的验证码：457580，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1481885109');
INSERT INTO `jfy_sms_send_log` VALUES ('16', '15516517307', '【喵神科技】您的验证码：708374，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482310122');
INSERT INTO `jfy_sms_send_log` VALUES ('17', '18521722857', '【喵神科技】您的验证码：912109，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315035');
INSERT INTO `jfy_sms_send_log` VALUES ('18', '15516517307', '【喵神科技】您的验证码：738586，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315357');
INSERT INTO `jfy_sms_send_log` VALUES ('19', '15516517304', '【喵神科技】您的验证码：186981，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315394');
INSERT INTO `jfy_sms_send_log` VALUES ('20', '15516517304', '【喵神科技】您的验证码：780792，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315531');
INSERT INTO `jfy_sms_send_log` VALUES ('21', '15516517304', '【喵神科技】您的验证码：360229，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315534');
INSERT INTO `jfy_sms_send_log` VALUES ('22', '15516517301', '【喵神科技】您的验证码：978302，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315750');
INSERT INTO `jfy_sms_send_log` VALUES ('23', '15516517301', '【喵神科技】您的验证码：687133，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315818');
INSERT INTO `jfy_sms_send_log` VALUES ('24', '15516517301', '【喵神科技】您的验证码：628845，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482315942');
INSERT INTO `jfy_sms_send_log` VALUES ('25', '15516517304', '【喵神科技】您的验证码：423248，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482316887');
INSERT INTO `jfy_sms_send_log` VALUES ('26', '15516517304', '【喵神科技】您的验证码：280487，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482316962');
INSERT INTO `jfy_sms_send_log` VALUES ('27', '15516517304', '【喵神科技】您的验证码：595611，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482317509');
INSERT INTO `jfy_sms_send_log` VALUES ('28', '15516517304', '【喵神科技】您的验证码：597534，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482317575');
INSERT INTO `jfy_sms_send_log` VALUES ('29', '15516517304', '【喵神科技】您的验证码：888916，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482318802');
INSERT INTO `jfy_sms_send_log` VALUES ('30', '15516517304', '【喵神科技】您的验证码：831756，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482318828');
INSERT INTO `jfy_sms_send_log` VALUES ('31', '15516517307', '【喵神科技】您的验证码：986212，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482378386');
INSERT INTO `jfy_sms_send_log` VALUES ('32', '15516517307', '【喵神科技】您的验证码：945700，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463312');
INSERT INTO `jfy_sms_send_log` VALUES ('33', '15516517307', '【喵神科技】您的验证码：839544，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463374');
INSERT INTO `jfy_sms_send_log` VALUES ('34', '15516517307', '【喵神科技】您的验证码：813781，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463376');
INSERT INTO `jfy_sms_send_log` VALUES ('35', '15516517307', '【喵神科技】您的验证码：643685，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463470');
INSERT INTO `jfy_sms_send_log` VALUES ('36', '15516517307', '【喵神科技】您的验证码：786370，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463473');
INSERT INTO `jfy_sms_send_log` VALUES ('37', '15516517307', '【喵神科技】您的验证码：605480，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482463709');
INSERT INTO `jfy_sms_send_log` VALUES ('38', '15516517307', '【喵神科技】您的验证码：627865，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482464437');
INSERT INTO `jfy_sms_send_log` VALUES ('39', '15516517307', '【喵神科技】您的验证码：431539，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482464719');
INSERT INTO `jfy_sms_send_log` VALUES ('40', '15516517301', '【喵神科技】您的验证码：718090，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482465181');
INSERT INTO `jfy_sms_send_log` VALUES ('41', '15516517302', '【喵神科技】您的验证码：478890，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482465372');
INSERT INTO `jfy_sms_send_log` VALUES ('42', '15516517308', '【喵神科技】您的验证码：292453，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482465781');
INSERT INTO `jfy_sms_send_log` VALUES ('43', '15516517306', '【喵神科技】您的验证码：788375，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482465863');
INSERT INTO `jfy_sms_send_log` VALUES ('44', '18722761560', '【喵神科技】您的验证码：169653，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482728408');
INSERT INTO `jfy_sms_send_log` VALUES ('45', '18722761560', '【喵神科技】您的验证码：157073，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482730604');
INSERT INTO `jfy_sms_send_log` VALUES ('46', '18521722857', '【喵神科技】您的验证码：706335，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482736306');
INSERT INTO `jfy_sms_send_log` VALUES ('47', '13917771100', '【喵神科技】您的验证码：937333，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482829125');
INSERT INTO `jfy_sms_send_log` VALUES ('48', '13917771100', '【喵神科技】您的验证码：177025，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482829216');
INSERT INTO `jfy_sms_send_log` VALUES ('49', '13917771100', '【喵神科技】您的验证码：495424，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482829276');
INSERT INTO `jfy_sms_send_log` VALUES ('50', '13917771100', '【喵神科技】您的验证码：905518，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482829386');
INSERT INTO `jfy_sms_send_log` VALUES ('51', '13917771100', '【喵神科技】您的验证码：475208，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482829940');
INSERT INTO `jfy_sms_send_log` VALUES ('52', '13917771120', '【喵神科技】您的验证码：848373，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482830859');
INSERT INTO `jfy_sms_send_log` VALUES ('53', '13917771101', '【喵神科技】您的验证码：574098，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482836888');
INSERT INTO `jfy_sms_send_log` VALUES ('54', '13917771111', '【喵神科技】您的验证码：242685，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482836988');
INSERT INTO `jfy_sms_send_log` VALUES ('55', '13123123123', '【喵神科技】您的验证码：816645，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482837008');
INSERT INTO `jfy_sms_send_log` VALUES ('56', '13912312312', '【喵神科技】您的验证码：154675，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482837041');
INSERT INTO `jfy_sms_send_log` VALUES ('57', '13111123123', '【喵神科技】您的验证码：654157，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482837077');
INSERT INTO `jfy_sms_send_log` VALUES ('58', '13917771100', '【喵神科技】您的验证码：844333，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482907983');
INSERT INTO `jfy_sms_send_log` VALUES ('59', '15516517201', '【喵神科技】您的验证码：267596，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482993504');
INSERT INTO `jfy_sms_send_log` VALUES ('60', '15516517101', '【喵神科技】您的验证码：472958，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1482993604');
INSERT INTO `jfy_sms_send_log` VALUES ('61', '18521722857', '【喵神科技】您的验证码：840643，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483081983');
INSERT INTO `jfy_sms_send_log` VALUES ('62', '18272878105', '【喵神科技】您的验证码：516574，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483082131');
INSERT INTO `jfy_sms_send_log` VALUES ('63', '18521722857', '【喵神科技】您的验证码：878326，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483082384');
INSERT INTO `jfy_sms_send_log` VALUES ('64', '18272878105', '【喵神科技】您的验证码：904254，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483084874');
INSERT INTO `jfy_sms_send_log` VALUES ('65', '18037457326', '【喵神科技】您的验证码：626052，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483085326');
INSERT INTO `jfy_sms_send_log` VALUES ('66', '18839780608', '【喵神科技】您的验证码：953253，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483085395');
INSERT INTO `jfy_sms_send_log` VALUES ('67', '18818818887', '【喵神科技】您的验证码：752752，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483104194');
INSERT INTO `jfy_sms_send_log` VALUES ('68', '15737928808', '【喵神科技】您的验证码：233621，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483438574');
INSERT INTO `jfy_sms_send_log` VALUES ('69', '15737928888', '【喵神科技】您的验证码：139990，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483438765');
INSERT INTO `jfy_sms_send_log` VALUES ('70', '15737928888', '【喵神科技】您的验证码：820840，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483439590');
INSERT INTO `jfy_sms_send_log` VALUES ('71', '15737928806', '【喵神科技】您的验证码：706033，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483440522');
INSERT INTO `jfy_sms_send_log` VALUES ('72', '18521722837', '【喵神科技】您的验证码：406738，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483440647');
INSERT INTO `jfy_sms_send_log` VALUES ('73', '15737928816', '【喵神科技】您的验证码：431347，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483441812');
INSERT INTO `jfy_sms_send_log` VALUES ('74', '15737928782', '【喵神科技】您的验证码：227166，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483442168');
INSERT INTO `jfy_sms_send_log` VALUES ('75', '18272878105', '【喵神科技】您的验证码：859045，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483495708');
INSERT INTO `jfy_sms_send_log` VALUES ('76', '15516517304', '【喵神科技】您的验证码：614105，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483589827');
INSERT INTO `jfy_sms_send_log` VALUES ('77', '15516517307', '【喵神科技】您的验证码：928176，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483589920');
INSERT INTO `jfy_sms_send_log` VALUES ('78', '15039541345', '【喵神科技】您的验证码：261259，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483590379');
INSERT INTO `jfy_sms_send_log` VALUES ('79', '15203951212', '【喵神科技】您的验证码：928648，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483590399');
INSERT INTO `jfy_sms_send_log` VALUES ('80', '15539541345', '【喵神科技】您的验证码：261389，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483594706');
INSERT INTO `jfy_sms_send_log` VALUES ('81', '13917771100', '【喵神科技】您的验证码：474818，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483595048');
INSERT INTO `jfy_sms_send_log` VALUES ('82', '13917771100', '【喵神科技】您的验证码：555265，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483595074');
INSERT INTO `jfy_sms_send_log` VALUES ('83', '13917771102', '【喵神科技】您的验证码：449266，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483601169');
INSERT INTO `jfy_sms_send_log` VALUES ('84', '15536985212', '【喵神科技】您的验证码：191790，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483606971');
INSERT INTO `jfy_sms_send_log` VALUES ('85', '15516517307', '【喵神科技】您的验证码：227084，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483613044');
INSERT INTO `jfy_sms_send_log` VALUES ('86', '15516517307', '【喵神科技】您的验证码：732482，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483613536');
INSERT INTO `jfy_sms_send_log` VALUES ('87', '15516517301', '【喵神科技】您的验证码：482241，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483613818');
INSERT INTO `jfy_sms_send_log` VALUES ('88', '15516517302', '【喵神科技】您的验证码：546209，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483613883');
INSERT INTO `jfy_sms_send_log` VALUES ('89', '15516517303', '【喵神科技】您的验证码：163885，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483614209');
INSERT INTO `jfy_sms_send_log` VALUES ('90', '18272878105', '【喵神科技】您的验证码：724325，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483956300');
INSERT INTO `jfy_sms_send_log` VALUES ('91', '18272878105', '【喵神科技】您的验证码：745639，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483956374');
INSERT INTO `jfy_sms_send_log` VALUES ('92', '18272878105', '【喵神科技】您的验证码：483724，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1483956442');
INSERT INTO `jfy_sms_send_log` VALUES ('93', '15516517301', '【喵神科技】您的验证码：315826，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484052706');
INSERT INTO `jfy_sms_send_log` VALUES ('94', '15516517305', '【喵神科技】您的验证码：407836，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484052771');
INSERT INTO `jfy_sms_send_log` VALUES ('95', '15516517707', '【喵神科技】您的验证码：993270，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484052988');
INSERT INTO `jfy_sms_send_log` VALUES ('96', '15516517307', '【喵神科技】您的验证码：970254，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484193346');
INSERT INTO `jfy_sms_send_log` VALUES ('97', '15516517777', '【喵神科技】您的验证码：695761，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484217915');
INSERT INTO `jfy_sms_send_log` VALUES ('98', '18272878105', '【喵神科技】您的验证码：116314，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484272532');
INSERT INTO `jfy_sms_send_log` VALUES ('99', '18272878105', '【喵神科技】您的验证码：921530，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484274282');
INSERT INTO `jfy_sms_send_log` VALUES ('100', '13611112222', '【喵神科技】您的验证码：251583，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484274714');
INSERT INTO `jfy_sms_send_log` VALUES ('101', '18272878103', '【喵神科技】您的验证码：529235，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484274842');
INSERT INTO `jfy_sms_send_log` VALUES ('102', '18272878102', '【喵神科技】您的验证码：454199，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484274930');
INSERT INTO `jfy_sms_send_log` VALUES ('103', '15526262323', '【喵神科技】您的验证码：794912，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484279332');
INSERT INTO `jfy_sms_send_log` VALUES ('104', '15526260011', '【喵神科技】您的验证码：245404，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484279491');
INSERT INTO `jfy_sms_send_log` VALUES ('105', '15522661122', '【喵神科技】您的验证码：146444，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484279617');
INSERT INTO `jfy_sms_send_log` VALUES ('106', '15722335566', '【喵神科技】您的验证码：821444，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484279680');
INSERT INTO `jfy_sms_send_log` VALUES ('107', '15522336655', '【喵神科技】您的验证码：163885，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484279764');
INSERT INTO `jfy_sms_send_log` VALUES ('108', '18272878100', '【喵神科技】您的验证码：476391，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484282256');
INSERT INTO `jfy_sms_send_log` VALUES ('109', '15522336655', '【喵神科技】您的验证码：760305，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484282591');
INSERT INTO `jfy_sms_send_log` VALUES ('110', '15522336688', '【喵神科技】您的验证码：660742，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484282652');
INSERT INTO `jfy_sms_send_log` VALUES ('111', '15533668899', '【喵神科技】您的验证码：975390，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484298125');
INSERT INTO `jfy_sms_send_log` VALUES ('112', '15622335566', '【喵神科技】您的验证码：235645，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484298125');
INSERT INTO `jfy_sms_send_log` VALUES ('113', '15599887744', '【喵神科技】您的验证码：375701，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484301377');
INSERT INTO `jfy_sms_send_log` VALUES ('114', '13711223366', '【喵神科技】您的验证码：114776，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484301478');
INSERT INTO `jfy_sms_send_log` VALUES ('115', '18818223461', '【喵神科技】您的验证码：929028，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484633413');
INSERT INTO `jfy_sms_send_log` VALUES ('116', '18818223461', '【喵神科技】您的验证码：668487，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484633766');
INSERT INTO `jfy_sms_send_log` VALUES ('117', '15516517307', '【喵神科技】您的验证码：544891，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484722799');
INSERT INTO `jfy_sms_send_log` VALUES ('118', '15516517307', '【喵神科技】您的验证码：251858，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484821687');
INSERT INTO `jfy_sms_send_log` VALUES ('119', '15516517307', '【喵神科技】您的验证码：344473，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484821912');
INSERT INTO `jfy_sms_send_log` VALUES ('120', '15516517307', '【喵神科技】您的验证码：873547，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484823427');
INSERT INTO `jfy_sms_send_log` VALUES ('121', '15516517307', '【喵神科技】您的验证码：947210，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484825460');
INSERT INTO `jfy_sms_send_log` VALUES ('122', '15516517307', '【喵神科技】您的验证码：791809，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1484825764');
INSERT INTO `jfy_sms_send_log` VALUES ('123', '18272878105', '【喵神科技】您的验证码：342990，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487044806');
INSERT INTO `jfy_sms_send_log` VALUES ('124', '18272878105', '【喵神科技】您的验证码：820071，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487573293');
INSERT INTO `jfy_sms_send_log` VALUES ('125', '18272878105', '【喵神科技】您的验证码：628826，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487575097');
INSERT INTO `jfy_sms_send_log` VALUES ('126', '15022667788', '【喵神科技】您的验证码：653656，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487582667');
INSERT INTO `jfy_sms_send_log` VALUES ('127', '18521722857', '【喵神科技】您的验证码：486471，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487583425');
INSERT INTO `jfy_sms_send_log` VALUES ('128', '18521722857', '【喵神科技】您的验证码：952236，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487662660');
INSERT INTO `jfy_sms_send_log` VALUES ('129', '18818223461', '【喵神科技】您的验证码：161111，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1487824136');
INSERT INTO `jfy_sms_send_log` VALUES ('130', '18521722857', '【喵神科技】您的验证码：585540，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488186069');
INSERT INTO `jfy_sms_send_log` VALUES ('131', '18272878105', '【喵神科技】您的验证码：281713，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488188634');
INSERT INTO `jfy_sms_send_log` VALUES ('132', '18272878105', '【喵神科技】您的验证码：557827，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488189654');
INSERT INTO `jfy_sms_send_log` VALUES ('133', '18272878105', '【喵神科技】您的验证码：268255，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488190760');
INSERT INTO `jfy_sms_send_log` VALUES ('134', '18272878105', '【喵神科技】您的验证码：512399，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488193251');
INSERT INTO `jfy_sms_send_log` VALUES ('135', '18272878105', '【喵神科技】您的验证码：663735，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488193309');
INSERT INTO `jfy_sms_send_log` VALUES ('136', '18272878105', '【喵神科技】您的验证码：667800，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488193710');
INSERT INTO `jfy_sms_send_log` VALUES ('137', '18272878105', '【喵神科技】您的验证码：622180，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488249861');
INSERT INTO `jfy_sms_send_log` VALUES ('138', '18272878105', '【喵神科技】您的验证码：513745，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488250221');
INSERT INTO `jfy_sms_send_log` VALUES ('139', '18272878105', '【喵神科技】您的验证码：829959，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488250411');
INSERT INTO `jfy_sms_send_log` VALUES ('140', '18272878105', '【喵神科技】您的验证码：340216，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488250708');
INSERT INTO `jfy_sms_send_log` VALUES ('141', '18272878105', '【喵神科技】您的验证码：986981，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488266213');
INSERT INTO `jfy_sms_send_log` VALUES ('142', '18818223461', '【喵神科技】您的验证码：761788，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488366707');
INSERT INTO `jfy_sms_send_log` VALUES ('143', '18521722888', '【喵神科技】您的验证码：714245，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488372017');
INSERT INTO `jfy_sms_send_log` VALUES ('144', '15516517307', '【喵神科技】您的验证码：102636，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488423760');
INSERT INTO `jfy_sms_send_log` VALUES ('145', '18521722857', '【喵神科技】您的验证码：534317，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491469192');
INSERT INTO `jfy_sms_send_log` VALUES ('146', '18722761560', '【喵神科技】您的验证码：685406，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488772198');
INSERT INTO `jfy_sms_send_log` VALUES ('147', '18722761560', '【喵神科技】您的验证码：294128，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488773936');
INSERT INTO `jfy_sms_send_log` VALUES ('148', '18272878105', '【喵神科技】您的验证码：748880，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488781823');
INSERT INTO `jfy_sms_send_log` VALUES ('149', '18272878105', '【喵神科技】您的验证码：684445，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488868262');
INSERT INTO `jfy_sms_send_log` VALUES ('150', '18272878105', '【喵神科技】您的验证码：981954，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1488966002');
INSERT INTO `jfy_sms_send_log` VALUES ('151', '15516517307', '【喵神科技】您的验证码：586831，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489027226');
INSERT INTO `jfy_sms_send_log` VALUES ('152', '15516517307', '【喵神科技】您的验证码：451480，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489051595');
INSERT INTO `jfy_sms_send_log` VALUES ('153', '15737928808', '【喵神科技】您的验证码：478863，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489561299');
INSERT INTO `jfy_sms_send_log` VALUES ('154', '15737928808', '【喵神科技】您的验证码：138204，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489561379');
INSERT INTO `jfy_sms_send_log` VALUES ('155', '15737928808', '【喵神科技】您的验证码：851602，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489563787');
INSERT INTO `jfy_sms_send_log` VALUES ('156', '15516517307', '【喵神科技】您的验证码：497073，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489561710');
INSERT INTO `jfy_sms_send_log` VALUES ('157', '18272878105', '【喵神科技】您的验证码：197833，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489565940');
INSERT INTO `jfy_sms_send_log` VALUES ('158', '18272878105', '【喵神科技】您的验证码：350680，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489565964');
INSERT INTO `jfy_sms_send_log` VALUES ('159', '18272878100', '【喵神科技】您的验证码：450271，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489566000');
INSERT INTO `jfy_sms_send_log` VALUES ('160', '15737928808', '【喵神科技】您的验证码：654205，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489566359');
INSERT INTO `jfy_sms_send_log` VALUES ('161', '18272878100', '【喵神科技】您的验证码：687301，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489566586');
INSERT INTO `jfy_sms_send_log` VALUES ('162', '18839780608', '【喵神科技】您的验证码：355514，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489981755');
INSERT INTO `jfy_sms_send_log` VALUES ('163', '15737928809', '【喵神科技】您的验证码：926693，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489981961');
INSERT INTO `jfy_sms_send_log` VALUES ('164', '15737928899', '【喵神科技】您的验证码：155453，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1489984571');
INSERT INTO `jfy_sms_send_log` VALUES ('165', '15737928899', '【喵神科技】您的验证码：326428，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1490596538');
INSERT INTO `jfy_sms_send_log` VALUES ('166', '15516517307', '【喵神科技】您的验证码：183935，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1490702397');
INSERT INTO `jfy_sms_send_log` VALUES ('167', '18272878105', '【喵神科技】您的验证码：634786，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491018740');
INSERT INTO `jfy_sms_send_log` VALUES ('168', '15516517300', '【喵神科技】您的验证码：925567，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491018800');
INSERT INTO `jfy_sms_send_log` VALUES ('169', '15516517307', '【喵神科技】您的验证码：351477，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491378713');
INSERT INTO `jfy_sms_send_log` VALUES ('170', '15516517307', '【喵神科技】您的验证码：354965，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491381070');
INSERT INTO `jfy_sms_send_log` VALUES ('171', '15516517307', '【喵神科技】您的验证码：646734，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491381334');
INSERT INTO `jfy_sms_send_log` VALUES ('172', '15516517307', '【喵神科技】您的验证码：421212，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491381900');
INSERT INTO `jfy_sms_send_log` VALUES ('173', '15516517307', '【喵神科技】您的验证码：246640，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491382258');
INSERT INTO `jfy_sms_send_log` VALUES ('174', '15516517307', '【喵神科技】您的验证码：589715，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491382956');
INSERT INTO `jfy_sms_send_log` VALUES ('175', '15516517307', '【喵神科技】您的验证码：301104，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491383356');
INSERT INTO `jfy_sms_send_log` VALUES ('176', '15737927799', '【喵神科技】您的验证码：590457，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491460459');
INSERT INTO `jfy_sms_send_log` VALUES ('177', '15516517307', '【喵神科技】您的验证码：579360，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491465793');
INSERT INTO `jfy_sms_send_log` VALUES ('178', '15516517307', '【喵神科技】您的验证码：615615，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491466040');
INSERT INTO `jfy_sms_send_log` VALUES ('179', '15737929977', '【喵神科技】您的验证码：557608，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491471424');
INSERT INTO `jfy_sms_send_log` VALUES ('180', '13355667788', '【喵神科技】您的验证码：563265，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491811227');
INSERT INTO `jfy_sms_send_log` VALUES ('181', '15516517307', '【喵神科技】您的验证码：827926，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491900375');
INSERT INTO `jfy_sms_send_log` VALUES ('182', '15516517307', '【喵神科技】您的验证码：269711，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491902722');
INSERT INTO `jfy_sms_send_log` VALUES ('183', '15516517307', '【喵神科技】您的验证码：709576，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1491902756');
INSERT INTO `jfy_sms_send_log` VALUES ('184', '15516517307', '【喵神科技】您的验证码：512728，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492051692');
INSERT INTO `jfy_sms_send_log` VALUES ('185', '15516517307', '【喵神科技】您的验证码：371499，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492078073');
INSERT INTO `jfy_sms_send_log` VALUES ('186', '18272878105', '【喵神科技】您的验证码：276989，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492506500');
INSERT INTO `jfy_sms_send_log` VALUES ('187', '18201869634', '【喵神科技】您的验证码：744540，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492508967');
INSERT INTO `jfy_sms_send_log` VALUES ('188', '18722761560', '【喵神科技】您的验证码：703121，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492510338');
INSERT INTO `jfy_sms_send_log` VALUES ('189', '18722761560', '【喵神科技】您的验证码：752120，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492510428');
INSERT INTO `jfy_sms_send_log` VALUES ('190', '18272878105', '【喵神科技】您的验证码：748220，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492570798');
INSERT INTO `jfy_sms_send_log` VALUES ('191', '18272878105', '【喵神科技】您的验证码：565270，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492570871');
INSERT INTO `jfy_sms_send_log` VALUES ('192', '18272878105', '【喵神科技】您的验证码：455352，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492652933');
INSERT INTO `jfy_sms_send_log` VALUES ('193', '18272878105', '【喵神科技】您的验证码：770935，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492653029');
INSERT INTO `jfy_sms_send_log` VALUES ('194', '18839780608', '【喵神科技】您的验证码：649343，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492653871');
INSERT INTO `jfy_sms_send_log` VALUES ('195', '17712345678', '【喵神科技】您的验证码：180447，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492744064');
INSERT INTO `jfy_sms_send_log` VALUES ('196', '17612345678', '【喵神科技】您的验证码：711196，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492744187');
INSERT INTO `jfy_sms_send_log` VALUES ('197', '18812345678', '【喵神科技】您的验证码：121835，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492999889');
INSERT INTO `jfy_sms_send_log` VALUES ('198', '18272878101', '【喵神科技】您的验证码：387045，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1492999912');
INSERT INTO `jfy_sms_send_log` VALUES ('199', '18272878101', '【喵神科技】您的验证码：630090，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493000070');
INSERT INTO `jfy_sms_send_log` VALUES ('200', '18812345678', '【喵神科技】您的验证码：605838，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493000259');
INSERT INTO `jfy_sms_send_log` VALUES ('201', '13917771111', '【喵神科技】您的验证码：231753，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493004473');
INSERT INTO `jfy_sms_send_log` VALUES ('202', '15612346578', '【喵神科技】您的验证码：171960，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493006108');
INSERT INTO `jfy_sms_send_log` VALUES ('203', '18272878104', '【喵神科技】您的验证码：590072，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493023135');
INSERT INTO `jfy_sms_send_log` VALUES ('204', '18612346578', '【喵神科技】您的验证码：188439，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493024119');
INSERT INTO `jfy_sms_send_log` VALUES ('205', '15512346578', '【喵神科技】您的验证码：762475，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493024458');
INSERT INTO `jfy_sms_send_log` VALUES ('206', '15516517307', '【喵神科技】您的验证码：551785，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493034734');
INSERT INTO `jfy_sms_send_log` VALUES ('207', '13917771100', '【喵神科技】您的验证码：211264，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493193716');
INSERT INTO `jfy_sms_send_log` VALUES ('208', '18201869634', '【喵神科技】您的验证码：767144，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493708195');
INSERT INTO `jfy_sms_send_log` VALUES ('209', '17512345678', '【喵神科技】您的验证码：292453，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493715288');
INSERT INTO `jfy_sms_send_log` VALUES ('210', '15712345678', '【喵神科技】您的验证码：390368，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1493717491');
INSERT INTO `jfy_sms_send_log` VALUES ('211', '15212345678', '【喵神科技】您的验证码：563485，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1494403851');
INSERT INTO `jfy_sms_send_log` VALUES ('212', '18272878105', '【喵神科技】您的验证码：771923，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1494469101');
INSERT INTO `jfy_sms_send_log` VALUES ('213', '18521722857', '【喵神科技】您的验证码：973880，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1494561208');
INSERT INTO `jfy_sms_send_log` VALUES ('214', '18521722857', '【喵神科技】订单【14945613949398】 发货完成！配送方式为：顺丰快递,物流单号为：930276170331！退订回N', '1494561612');
INSERT INTO `jfy_sms_send_log` VALUES ('215', '18521722857', '【喵神科技】订单【14945613949398】 卖家已同意您的取消订单操作。', '1494575575');
INSERT INTO `jfy_sms_send_log` VALUES ('216', '18521722857', '【喵神科技】订单【14945775989974】 卖家已同意您的取消订单操作。请戳我：http://h5.mshenpu.com/?shop_id=126', '1494578403');
INSERT INTO `jfy_sms_send_log` VALUES ('218', '15516517307', '【喵神科技】您的验证码：216976，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1494820212');
INSERT INTO `jfy_sms_send_log` VALUES ('221', '15516517307', '【喵神科技】您的验证码：596966，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1494835530');
INSERT INTO `jfy_sms_send_log` VALUES ('229', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494917755');
INSERT INTO `jfy_sms_send_log` VALUES ('230', '18521722857', '【通用科技】订单：14948300615829，卖家已同意您的取消订单操作。请戳我：http://t.cn/RajSHBH', '1494917892');
INSERT INTO `jfy_sms_send_log` VALUES ('231', '18521722857', '【通用科技】订单：14949180018897，发货完成！配送方式为：顺丰快递,物流单号为：930276170322！点击进入店铺。请戳我：http://t.cn/RalFLFX，退订回N', '1494918290');
INSERT INTO `jfy_sms_send_log` VALUES ('232', '18521722857', '【通用科技】订单：14949180018897，发货完成！配送方式为：顺丰快递,物流单号为：930276170322！点击进入店铺。请戳我：http://t.cn/RalFLFX，退订回N', '1494918488');
INSERT INTO `jfy_sms_send_log` VALUES ('233', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494936118');
INSERT INTO `jfy_sms_send_log` VALUES ('234', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494936161');
INSERT INTO `jfy_sms_send_log` VALUES ('235', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494936212');
INSERT INTO `jfy_sms_send_log` VALUES ('238', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494936453');
INSERT INTO `jfy_sms_send_log` VALUES ('243', '18521722857', '【通用科技】订单：14948300615829，卖家已拒绝您的取消订单操作。请戳我：http://t.cn/RalFLFX', '1494936810');
INSERT INTO `jfy_sms_send_log` VALUES ('244', '15516517307', '【喵神科技】您的验证码：613967，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495005540');
INSERT INTO `jfy_sms_send_log` VALUES ('245', '15516517307', '【喵神科技】您的验证码：135321，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495005795');
INSERT INTO `jfy_sms_send_log` VALUES ('246', '15516517307', '【喵神科技】您的验证码：853140，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495005920');
INSERT INTO `jfy_sms_send_log` VALUES ('247', '15516517307', '【喵神科技】您的验证码：888642，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495014542');
INSERT INTO `jfy_sms_send_log` VALUES ('248', '18272878105', '【喵神科技】您的验证码：610232，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495092259');
INSERT INTO `jfy_sms_send_log` VALUES ('249', '18272878105', '【喵神科技】您的验证码：477188，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1495868187');
INSERT INTO `jfy_sms_send_log` VALUES ('250', '18521722857', '【喵神科技】您的验证码：769863，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1496212183');
INSERT INTO `jfy_sms_send_log` VALUES ('251', '18272878105', '【喵神科技】您的验证码：535305，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1496714558');
INSERT INTO `jfy_sms_send_log` VALUES ('252', '18272878105', '【喵神科技】您的验证码：923864，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1496714986');
INSERT INTO `jfy_sms_send_log` VALUES ('253', '18521722857', '【喵神科技】您的验证码：142352，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497254322');
INSERT INTO `jfy_sms_send_log` VALUES ('254', '18521722877', '【喵神科技】您的验证码：281658，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497412228');
INSERT INTO `jfy_sms_send_log` VALUES ('255', '18722761560', '【喵神科技】您的验证码：979208，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497510749');
INSERT INTO `jfy_sms_send_log` VALUES ('256', '18272878105', '【喵神科技】您的验证码：874481，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497511428');
INSERT INTO `jfy_sms_send_log` VALUES ('257', '18272878105', '【喵神科技】您的验证码：209780，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497521230');
INSERT INTO `jfy_sms_send_log` VALUES ('258', '18521722857', '【喵神科技】您的验证码：488723，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497526288');
INSERT INTO `jfy_sms_send_log` VALUES ('259', '18521722857', '【喵神科技】您的验证码：550988，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1497526518');
INSERT INTO `jfy_sms_send_log` VALUES ('260', '18521722857', '【喵神科技】您的验证码：587792，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1498212115');
INSERT INTO `jfy_sms_send_log` VALUES ('261', '18272878105', '【喵神科技】您的验证码：581201，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1498616155');
INSERT INTO `jfy_sms_send_log` VALUES ('262', '15516517307', '【喵神科技】您的验证码：670849，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499673145');
INSERT INTO `jfy_sms_send_log` VALUES ('263', '15516517307', '【喵神科技】您的验证码：867257，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499673388');
INSERT INTO `jfy_sms_send_log` VALUES ('264', '18272878105', '【喵神科技】您的验证码：230792，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499739469');
INSERT INTO `jfy_sms_send_log` VALUES ('265', '18272878106', '【喵神科技】您的验证码：898266，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499739823');
INSERT INTO `jfy_sms_send_log` VALUES ('266', '18272878107', '【喵神科技】您的验证码：255429，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499742775');
INSERT INTO `jfy_sms_send_log` VALUES ('267', '15516517307', '【喵神科技】您的验证码：285421，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499745051');
INSERT INTO `jfy_sms_send_log` VALUES ('268', '15516517307', '【喵神科技】您的验证码：762695，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499745170');
INSERT INTO `jfy_sms_send_log` VALUES ('269', '15516517307', '【喵神科技】您的验证码：604190，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499745648');
INSERT INTO `jfy_sms_send_log` VALUES ('270', '15516517307', '【喵神科技】您的验证码：460900，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499755115');
INSERT INTO `jfy_sms_send_log` VALUES ('271', '15516517307', '【喵神科技】您的验证码：876870，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499755267');
INSERT INTO `jfy_sms_send_log` VALUES ('272', '15516517307', '【喵神科技】您的验证码：203793，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499841411');
INSERT INTO `jfy_sms_send_log` VALUES ('273', '13312345678', '【喵神科技】您的验证码：136639，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499846393');
INSERT INTO `jfy_sms_send_log` VALUES ('274', '13312345678', '【喵神科技】您的验证码：934878，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499846677');
INSERT INTO `jfy_sms_send_log` VALUES ('275', '13312345678', '【喵神科技】您的验证码：937185，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499847006');
INSERT INTO `jfy_sms_send_log` VALUES ('276', '15516517307', '【喵神科技】您的验证码：739678，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499850107');
INSERT INTO `jfy_sms_send_log` VALUES ('277', '18772878105', '【喵神科技】您的验证码：975500，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499998838');
INSERT INTO `jfy_sms_send_log` VALUES ('278', '18272878105', '【喵神科技】您的验证码：396081，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1499998867');
INSERT INTO `jfy_sms_send_log` VALUES ('279', '18272878105', '【喵神科技】您的验证码：104037，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500451617');
INSERT INTO `jfy_sms_send_log` VALUES ('280', '18272878105', '【喵神科技】您的验证码：719766，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500452472');
INSERT INTO `jfy_sms_send_log` VALUES ('281', '18272878105', '【喵神科技】您的验证码：116287，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500452667');
INSERT INTO `jfy_sms_send_log` VALUES ('282', '18272878105', '【喵神科技】您的验证码：374713，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500452829');
INSERT INTO `jfy_sms_send_log` VALUES ('283', '18272878105', '【喵神科技】您的验证码：663269，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500461254');
INSERT INTO `jfy_sms_send_log` VALUES ('284', '18272878105', '【喵神科技】您的验证码：235983，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500461442');
INSERT INTO `jfy_sms_send_log` VALUES ('285', '18272878105', '【喵神科技】您的验证码：786178，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500517100');
INSERT INTO `jfy_sms_send_log` VALUES ('286', '18272878105', '【喵神科技】您的验证码：257489，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500519277');
INSERT INTO `jfy_sms_send_log` VALUES ('287', '18272878105', '【喵神科技】您的验证码：249304，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500533589');
INSERT INTO `jfy_sms_send_log` VALUES ('288', '18521722857', '【喵神科技】您的验证码：210769，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500533638');
INSERT INTO `jfy_sms_send_log` VALUES ('289', '18272878105', '【喵神科技】您的验证码：968441，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500533976');
INSERT INTO `jfy_sms_send_log` VALUES ('290', '18272878105', '【喵神科技】您的验证码：726220，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500539265');
INSERT INTO `jfy_sms_send_log` VALUES ('291', '18521722857', '【喵神科技】您的验证码：298989，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500539421');
INSERT INTO `jfy_sms_send_log` VALUES ('292', '18521722857', '【喵神科技】您的验证码：168060，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500542379');
INSERT INTO `jfy_sms_send_log` VALUES ('293', '18272878105', '【喵神科技】您的验证码：123126，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500543353');
INSERT INTO `jfy_sms_send_log` VALUES ('294', '18272878105', '【喵神科技】您的验证码：265316，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500544261');
INSERT INTO `jfy_sms_send_log` VALUES ('295', '18521722857', '【喵神科技】您的验证码：496743，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500544306');
INSERT INTO `jfy_sms_send_log` VALUES ('296', '18272878105', '【喵神科技】您的验证码：127383，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500602961');
INSERT INTO `jfy_sms_send_log` VALUES ('297', '18272878105', '【喵神科技】您的验证码：466860，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500621435');
INSERT INTO `jfy_sms_send_log` VALUES ('298', '18521722857', '【喵神科技】您的验证码：410830，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500621529');
INSERT INTO `jfy_sms_send_log` VALUES ('299', '18272878105', '【喵神科技】您的验证码：785491，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500633006');
INSERT INTO `jfy_sms_send_log` VALUES ('300', '18272878105', '【喵神科技】您的验证码：326675，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500865934');
INSERT INTO `jfy_sms_send_log` VALUES ('301', '15516517307', '【喵神科技】您的验证码：155975，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500871872');
INSERT INTO `jfy_sms_send_log` VALUES ('302', '15516517307', '【喵神科技】您的验证码：293084，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500886459');
INSERT INTO `jfy_sms_send_log` VALUES ('303', '15516517307', '【喵神科技】您的验证码：190170，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1500886547');
INSERT INTO `jfy_sms_send_log` VALUES ('304', '18272878105', '【喵神科技】您的验证码：503005，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502175612');
INSERT INTO `jfy_sms_send_log` VALUES ('305', '18272878105', '【喵神科技】您的验证码：977917，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502182754');
INSERT INTO `jfy_sms_send_log` VALUES ('306', '18272878105', '【喵神科技】您的验证码：349636，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502268845');
INSERT INTO `jfy_sms_send_log` VALUES ('307', '18272878105', '【喵神科技】您的验证码：588562，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502268942');
INSERT INTO `jfy_sms_send_log` VALUES ('308', '15516517307', '【喵神科技】您的验证码：493640，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502271420');
INSERT INTO `jfy_sms_send_log` VALUES ('309', '18521722857', '【喵神科技】您的验证码：406079，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502274152');
INSERT INTO `jfy_sms_send_log` VALUES ('310', '18272878105', '【喵神科技】您的验证码：964541，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502330721');
INSERT INTO `jfy_sms_send_log` VALUES ('311', '18272878105', '【喵神科技】您的验证码：435137，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502353975');
INSERT INTO `jfy_sms_send_log` VALUES ('312', '18521722857', '【喵神科技】您的验证码：585073，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502357432');
INSERT INTO `jfy_sms_send_log` VALUES ('313', '18521722857', '【喵神科技】您的验证码：733554，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1502677755');
INSERT INTO `jfy_sms_send_log` VALUES ('314', '15516517307', '【喵神科技】您的验证码：854788，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1504838237');
INSERT INTO `jfy_sms_send_log` VALUES ('315', '15516517307', '【喵神科技】您的验证码：716360，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1504838307');
INSERT INTO `jfy_sms_send_log` VALUES ('316', 'undefined', '【喵神科技】您的验证码：928286，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969513');
INSERT INTO `jfy_sms_send_log` VALUES ('317', '18272878105', '【喵神科技】您的验证码：295666，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969545');
INSERT INTO `jfy_sms_send_log` VALUES ('318', '18272878105', '【喵神科技】您的验证码：886044，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969593');
INSERT INTO `jfy_sms_send_log` VALUES ('319', '18272878105', '【喵神科技】您的验证码：748248，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969656');
INSERT INTO `jfy_sms_send_log` VALUES ('320', '18272878105', '【喵神科技】您的验证码：859512，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969767');
INSERT INTO `jfy_sms_send_log` VALUES ('321', '18272878105', '【喵神科技】您的验证码：204067，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969790');
INSERT INTO `jfy_sms_send_log` VALUES ('322', '18272878105', '【喵神科技】您的验证码：329229，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969831');
INSERT INTO `jfy_sms_send_log` VALUES ('323', '18272878105', '【喵神科技】您的验证码：189456，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969839');
INSERT INTO `jfy_sms_send_log` VALUES ('324', '18272878105', '【喵神科技】您的验证码：915460，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969840');
INSERT INTO `jfy_sms_send_log` VALUES ('325', '18272878105', '【喵神科技】您的验证码：625997，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969841');
INSERT INTO `jfy_sms_send_log` VALUES ('326', '18272878105', '【喵神科技】您的验证码：453018，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969842');
INSERT INTO `jfy_sms_send_log` VALUES ('327', '18272878105', '【喵神科技】您的验证码：572906，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969864');
INSERT INTO `jfy_sms_send_log` VALUES ('328', '18272878105', '【喵神科技】您的验证码：729763，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969865');
INSERT INTO `jfy_sms_send_log` VALUES ('329', '18272878105', '【喵神科技】您的验证码：301736，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969865');
INSERT INTO `jfy_sms_send_log` VALUES ('330', '18272878105', '【喵神科技】您的验证码：731658，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969865');
INSERT INTO `jfy_sms_send_log` VALUES ('331', '18272878105', '【喵神科技】您的验证码：133673，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969865');
INSERT INTO `jfy_sms_send_log` VALUES ('332', '18272878105', '【喵神科技】您的验证码：514651，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969865');
INSERT INTO `jfy_sms_send_log` VALUES ('333', '18272878105', '【喵神科技】您的验证码：273858，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969866');
INSERT INTO `jfy_sms_send_log` VALUES ('334', '18272878105', '【喵神科技】您的验证码：649920，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969889');
INSERT INTO `jfy_sms_send_log` VALUES ('335', '18272878105', '【喵神科技】您的验证码：229776，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969953');
INSERT INTO `jfy_sms_send_log` VALUES ('336', '18272878105', '【喵神科技】您的验证码：808920，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509969965');
INSERT INTO `jfy_sms_send_log` VALUES ('337', '18272878105', '【喵神科技】您的验证码：837127，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509970161');
INSERT INTO `jfy_sms_send_log` VALUES ('338', '18272878105', '【喵神科技】您的验证码：964376，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1509970975');
INSERT INTO `jfy_sms_send_log` VALUES ('339', '18272878105', '【喵神科技】您的验证码：590512，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510024800');
INSERT INTO `jfy_sms_send_log` VALUES ('340', '18272878105', '【喵神科技】您的验证码：263696，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510026719');
INSERT INTO `jfy_sms_send_log` VALUES ('341', '1872878105', '【喵神科技】您的验证码：523989，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510026967');
INSERT INTO `jfy_sms_send_log` VALUES ('342', '1827287810', '【喵神科技】您的验证码：793072，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510027011');
INSERT INTO `jfy_sms_send_log` VALUES ('343', '18272878105', '【喵神科技】您的验证码：608886，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510027046');
INSERT INTO `jfy_sms_send_log` VALUES ('344', '18272878105', '【喵神科技】您的验证码：513497，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510027183');
INSERT INTO `jfy_sms_send_log` VALUES ('345', '18272878105', '【喵神科技】您的验证码：725149，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510031557');
INSERT INTO `jfy_sms_send_log` VALUES ('346', '18272878105', '【喵神科技】您的验证码：861132，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510031946');
INSERT INTO `jfy_sms_send_log` VALUES ('347', '18272878105', '【喵神科技】您的验证码：117083，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510032314');
INSERT INTO `jfy_sms_send_log` VALUES ('348', '18272878105', '【喵神科技】您的验证码：208737，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510032547');
INSERT INTO `jfy_sms_send_log` VALUES ('349', '18272878105', '【喵神科技】您的验证码：989727，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510032729');
INSERT INTO `jfy_sms_send_log` VALUES ('350', '15516517307', '【喵神科技】您的验证码：251171，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510033350');
INSERT INTO `jfy_sms_send_log` VALUES ('351', '15812345678', '【喵神科技】您的验证码：218624，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510218360');
INSERT INTO `jfy_sms_send_log` VALUES ('352', '18521722857', '【喵神科技】您的验证码：745501，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510219338');
INSERT INTO `jfy_sms_send_log` VALUES ('353', '15516517307', '【喵神科技】您的验证码：339776，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510300723');
INSERT INTO `jfy_sms_send_log` VALUES ('354', '15516517307', '【喵神科技】您的验证码：473233，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510379861');
INSERT INTO `jfy_sms_send_log` VALUES ('355', '15516517307', '【喵神科技】您的验证码：319671，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510379903');
INSERT INTO `jfy_sms_send_log` VALUES ('356', '18272878105', '【喵神科技】您的验证码：910845，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510644746');
INSERT INTO `jfy_sms_send_log` VALUES ('357', '18272878107', '【喵神科技】您的验证码：614984，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510644894');
INSERT INTO `jfy_sms_send_log` VALUES ('358', '18272878109', '【喵神科技】您的验证码：313299，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510644966');
INSERT INTO `jfy_sms_send_log` VALUES ('359', '15516517307', '【喵神科技】您的验证码：764068，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510646292');
INSERT INTO `jfy_sms_send_log` VALUES ('360', '15516517307', '【喵神科技】您的验证码：284954，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1510647334');
INSERT INTO `jfy_sms_send_log` VALUES ('361', '18272878105', '【喵神科技】您的验证码：596911，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511154609');
INSERT INTO `jfy_sms_send_log` VALUES ('362', '18272878105', '【喵神科技】您的验证码：436566，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511155199');
INSERT INTO `jfy_sms_send_log` VALUES ('363', '18272878105', '【喵神科技】您的验证码：610699，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511155609');
INSERT INTO `jfy_sms_send_log` VALUES ('364', '18272878105', '【喵神科技】您的验证码：180639，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511155813');
INSERT INTO `jfy_sms_send_log` VALUES ('365', '18272878105', '【喵神科技】您的验证码：689471，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511155888');
INSERT INTO `jfy_sms_send_log` VALUES ('366', '18272878105', '【喵神科技】您的验证码：182067，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511155988');
INSERT INTO `jfy_sms_send_log` VALUES ('367', '15516517307', '【喵神科技】您的验证码：649810，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511425251');
INSERT INTO `jfy_sms_send_log` VALUES ('368', '15516517307', '【喵神科技】您的验证码：449530，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511489409');
INSERT INTO `jfy_sms_send_log` VALUES ('369', '15516517307', '【喵神科技】您的验证码：630255，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511836565');
INSERT INTO `jfy_sms_send_log` VALUES ('370', '15516517307', '【喵神科技】您的验证码：114117，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511836571');
INSERT INTO `jfy_sms_send_log` VALUES ('371', '15516517307', '【喵神科技】您的验证码：606744，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1511836583');
INSERT INTO `jfy_sms_send_log` VALUES ('372', '18817800000', '【喵神科技】您的验证码：739788，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1512463090');
INSERT INTO `jfy_sms_send_log` VALUES ('373', '17611110000', '【喵神科技】您的验证码：809744，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1512463570');
INSERT INTO `jfy_sms_send_log` VALUES ('374', '13312345677', '【喵神科技】您的验证码：911752，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1512466325');
INSERT INTO `jfy_sms_send_log` VALUES ('375', '18817700000', '【喵神科技】您的验证码：249551，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513048722');
INSERT INTO `jfy_sms_send_log` VALUES ('376', '17811110000', '【喵神科技】您的验证码：222991，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513051755');
INSERT INTO `jfy_sms_send_log` VALUES ('377', '17811114444', '【喵神科技】您的验证码：421679，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513070937');
INSERT INTO `jfy_sms_send_log` VALUES ('378', '18272878107', '【喵神科技】您的验证码：425689，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513756550');
INSERT INTO `jfy_sms_send_log` VALUES ('379', '18272878106', '【喵神科技】您的验证码：996813，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513756700');
INSERT INTO `jfy_sms_send_log` VALUES ('380', '18272878116', '【喵神科技】您的验证码：414236，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513756763');
INSERT INTO `jfy_sms_send_log` VALUES ('381', '18272878119', '【喵神科技】您的验证码：470596，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513759526');
INSERT INTO `jfy_sms_send_log` VALUES ('382', '15516517000', '【喵神科技】您的验证码：848498，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513761188');
INSERT INTO `jfy_sms_send_log` VALUES ('383', '15516517111', '【喵神科技】您的验证码：802932，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513761472');
INSERT INTO `jfy_sms_send_log` VALUES ('384', '15516517222', '【喵神科技】您的验证码：913565，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513762113');
INSERT INTO `jfy_sms_send_log` VALUES ('385', '15516517307', '【喵神科技】您的验证码：174349，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513847363');
INSERT INTO `jfy_sms_send_log` VALUES ('386', '18522229999', '【喵神科技】您的验证码：697326，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513930775');
INSERT INTO `jfy_sms_send_log` VALUES ('387', '18522229999', '【喵神科技】您的验证码：137243，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513931004');
INSERT INTO `jfy_sms_send_log` VALUES ('388', '18522229999', '【喵神科技】您的验证码：271990，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1513931085');
INSERT INTO `jfy_sms_send_log` VALUES ('389', '18272878105', '【喵神科技】您的验证码：418328，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1514270235');
INSERT INTO `jfy_sms_send_log` VALUES ('390', '18272878105', '【喵神科技】您的验证码：220794，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1514270246');
INSERT INTO `jfy_sms_send_log` VALUES ('391', '15516517307', '【喵神科技】您的验证码：555960，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1514430811');
INSERT INTO `jfy_sms_send_log` VALUES ('392', '15516517307', '【喵神科技】您的验证码：114529，在5分钟有效。如非本人操作请忽略本短信！退订回N', '1514432016');

-- ----------------------------
-- Table structure for `jfy_staff`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_staff`;
CREATE TABLE `jfy_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardID` varchar(20) NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_staff
-- ----------------------------
INSERT INTO `jfy_staff` VALUES ('1', '411123199210104034');
INSERT INTO `jfy_staff` VALUES ('2', '41272819940120612');
INSERT INTO `jfy_staff` VALUES ('3', '412728199401206012');
INSERT INTO `jfy_staff` VALUES ('4', '412728199401206013');
INSERT INTO `jfy_staff` VALUES ('5', '412728199401206014');
INSERT INTO `jfy_staff` VALUES ('6', '412728199401206015');
INSERT INTO `jfy_staff` VALUES ('7', '412728199401206016');
INSERT INTO `jfy_staff` VALUES ('8', '412728199401206018');

-- ----------------------------
-- Table structure for `jfy_urgent_plan`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_urgent_plan`;
CREATE TABLE `jfy_urgent_plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司ID',
  `name` varchar(255) NOT NULL COMMENT '预案名称',
  `bn` varchar(255) NOT NULL COMMENT '预案号',
  `content` longtext NOT NULL COMMENT '预案内容',
  `status` enum('wait','finish','failure') NOT NULL DEFAULT 'wait' COMMENT '备案状态:wait 等待 finish 完成 failure 失败',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '更新时间',
  `finish_time` int(10) NOT NULL COMMENT '备案成功时间',
  `is_repeal` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否作废:y 未作废,n 已作废',
  `repeal_time` int(10) NOT NULL COMMENT '作废时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_urgent_plan
-- ----------------------------
INSERT INTO `jfy_urgent_plan` VALUES ('6', '1', 'ssss', '2017072731589', '33333', 'wait', '1501142191', '1501583450', '0', 'y', '1501640599');
INSERT INTO `jfy_urgent_plan` VALUES ('7', '1', '测试预案001阿斯达所多', '2017072767955', '阿斯达所多<img src=\"http://192.168.199.236/zhianbao_api/images/15011379181166.png\">阿大声道', 'finish', '1501143326', '1501149885', '1501149885', 'n', '0');
INSERT INTO `jfy_urgent_plan` VALUES ('8', '1', '测试002', '2017072796837', '<img src=\"http://192.168.199.236/zhianbao_api/images/15011379181166.png\" style=\"width: 565px; height: 565px;\">', 'finish', '1501144089', '1501149624', '1501149624', 'n', '0');
INSERT INTO `jfy_urgent_plan` VALUES ('9', '4', 'ceshi', '2017072873910', '<p>11</p>', 'wait', '1501243688', '1501243688', '0', 'n', '0');
INSERT INTO `jfy_urgent_plan` VALUES ('10', '4', '测试预案演练', '2017073183638', '<table log-set-param=\"table_view\" width=\"-552\" data-sort=\"sortDisabled\" style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 12px; text-align: start; background-color: rgb(255, 255, 255);\"><tbody><tr><th align=\"center\" valign=\"middle\" colspan=\"3\" style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\">灵力境界</th><th align=\"center\" valign=\"middle\" style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\">介绍</th></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">感应境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">感应天地灵气</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵动境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">吸纳灵气入体</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">灵轮境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">体内灵气凝聚成轮</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">神魄境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">分水岭境界，能获得一个奇特能力，炼化兽魄</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">三天之境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">融天境、化天境、通天境的总称</td></tr><tr><td width=\"7\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">融天境</td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">三天之境第一重，能融入天地，操纵些天地灵气，举手投足间拥有摧毁山岳的力量</div></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">化天境</td><td align=\"left\" valign=\"top\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">三天之境第二重，神魄脱离肉体的束缚，能化入天地之间，随时隐匿自身，令人难以查探，受到攻击也能将身体化入天地，令受伤减弱</div></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">通天境</td><td align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">三天之境第三重，神魄远离肉身，遨游天地而不灭，是为通天</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">至尊小三难</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">让得无数天才闻之色变的“小三难”只有渡过这三难才能塑起至尊身，真正跨入至尊境</td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">肉身难</td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第一难，强化肉体</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵力难</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第二难，强化灵力</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">神魄难</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">小三难第三难，强化神魄，共分三重，只有经过三重神魄之火的淬炼才能入至尊境</td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" class=\"coloredcell\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230); background: rgb(251, 251, 251);\"><span style=\"font-weight: 700;\">至尊境</span></td><td width=\"153\" align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大千世界强者的标志，至尊之下皆为蝼蚁</td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"9\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">至尊</span></td><td width=\"153\" align=\"left\" valign=\"top\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">共分九品，标志是至尊海与至尊法身。踏入它便能在大千世界中成为强者，九品至尊在至尊中属顶尖强者。相当于域外最低级的<span style=\"font-weight: 700;\">魔将</span></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">地至尊</span></td><td align=\"center\" valign=\"middle\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">标志是天地之相放眼整个大千世界都能拥有响彻一方的惊天之名，恢复力极强大。相当邪族<span style=\"font-weight: 700;\">魔王</span></td></tr><tr><td width=\"6\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">下位地至尊</td><td width=\"450\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的初级阶段，<span style=\"font-weight: 700;\">相当初级魔王</span></td></tr><tr><td width=\"83\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">上位地至尊</td><td width=\"504\" align=\"center\" valign=\"middle\" colspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的高级阶段，<span style=\"font-weight: 700;\">相当高级魔王</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">大圆满地至尊</td><td width=\"513\" align=\"center\" valign=\"middle\" colspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">地至尊的巅峰阶段，相当<span style=\"font-weight: 700;\">最强魔王</span>；大圆满巅峰的准天至尊相当<span style=\"font-weight: 700;\">魔皇</span></td></tr><tr><td align=\"center\" valign=\"middle\" colspan=\"2\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">天至尊</span></td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">每品又分初期→中期→后期→巅峰，它能拥有天尊灵体，灵体乃其标志。相当邪族<span style=\"font-weight: 700;\">魔帝</span></div></td></tr><tr><td width=\"5\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"3\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">灵品</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">普通天至尊，相当邪族<span style=\"font-weight: 700;\">幽魔帝</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">仙品</td><td align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">高级天至尊，相当邪族<span style=\"font-weight: 700;\">玄魔帝</span></td></tr><tr><td width=\"82\" align=\"center\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">圣品</td><td align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">相当邪族<span style=\"font-weight: 700;\">天魔帝</span>，后期堪比顶尖天魔帝，圣品之路唯有最勇猛不惧者才能冲刺，在失去锐气后基本无缘它了</td></tr><tr><td height=\"22\" align=\"center\" valign=\"middle\" colspan=\"3\" rowspan=\"1\" class=\"coloredcell\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230); background: rgb(251, 251, 251);\"><span style=\"font-weight: 700;\">主宰境</span></td><td width=\"153\" height=\"22\" align=\"left\" valign=\"middle\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">感应世界意志，召唤苍穹榜，留下姓氏则超脱圣品，留下完整姓名则完全超脱；<span style=\"font-weight: 700;\">大千世界有史以来牧尘是第一个留下全名的人，他将其命名主宰境界！后来“炎帝”萧炎、“武祖”林动两人也成功在榜上留下全名，步入主宰境界。</span></div></td></tr></tbody></table><div class=\"anchor-list\" style=\"position: relative; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 12px;\"><a name=\"2_1\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_2_1\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"灵力\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\"><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">灵力</h3></div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">大千的主调，其修炼已在无数代人努力下发展到巅峰，由于它不断繁衍甚至扩散到民间中，导致它与人类日常生活，变得息息相关。因此变得无可替代</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">灵脉</span>：有它的人修炼速度会比常人快不少。随着实力到达某种程度后它便逐渐消匿，很多人都认为它只是修炼最初有作用，到了后面作用便会越来越小，其实只要踏入天至尊修成天尊灵体才能感应到身体深处的它，进而才能将它炼化让自身灵体达到圆满。其越是强横，一经炼化后灵体就越神妙=要炼化它就必须用心火</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">神脉</span>：最为罕见的灵脉。能有它的人都是亿中无一，虽说有它也不一定能踏入天至尊，可成功几率却比常人高很多</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">灵脉神通</span>：天尊灵体圆满领悟的众多神妙之一，也是灵体众多神妙之最，一些神脉衍变出来的它堪比绝世神通中的顶尖层次，甚至能与三十六道绝世神通媲美</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">天尊灵体</span>：分为灵仙圣3品</div><table log-set-param=\"table_view\" class=\"table-view log-set-param\" style=\"margin: 5px 0px; word-wrap: break-word; word-break: break-all; font-size: 12px; line-height: 22px; font-family: arial, 宋体, sans-serif; text-align: start; background-color: rgb(255, 255, 255);\"><tbody><tr><th style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">灵脉品级</div></th><th style=\"padding: 2px 10px; line-height: 22px; height: 23px; border: 1px solid rgb(230, 230, 230); text-align: left; background-color: rgb(248, 248, 248);\"><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); line-height: 24px; zoom: 1; height: auto;\">拥有者</div></th></tr><tr><td width=\"252\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">一人脉</span></td><td width=\"149\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">柳阳</td></tr><tr><td width=\"199\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">二人脉</span></td><td width=\"240\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">柳慕白</td></tr><tr><td width=\"198\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">三地脉</span></td><td width=\"149\" align=\"center\" valign=\"center\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">/</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">四地脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">杨弘</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">五天脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">姬玄</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">六天脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">玄天老祖</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">七神脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">玄尊</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">八神脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">清衍静</td></tr><tr><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\"><span style=\"font-weight: 700;\">九神脉</span></td><td align=\"center\" valign=\"center\" colspan=\"1\" rowspan=\"1\" style=\"margin: 0px; padding-top: 2px; padding-bottom: 2px; line-height: 22px; height: 22px; border: 1px solid rgb(230, 230, 230);\">牧尘</td></tr></tbody></table><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">灵诀</span>：分为凡级→灵级→神级→太古级，每级又分下中上三品。种类有：功法灵诀、炼体灵决、防御灵诀、攻击灵诀。此外还有许多危险性灵决，可能会对修炼者造成不小的伤害，其威力并不能用表面等级来判断</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">功法灵决</span>：主要用来培养灵力收入气海中，坚持修炼灵力将会越来越庞大。它还有一个重要作用能振幅增强灵力，凡级上品能振幅灵力五层，灵级下品能振幅十层，这种振幅层次越深灵力爆发时的威力便越厉害</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">神术</span>：天地间万法莫测，神诀只是其中之一，它比神诀更玄妙。拥有各种神奇力量，一旦将其驱动能爆发出极端恐怖的力量，它便是能驱动这种力量的术法。分小神术→大神术→准大圆满神术→大圆满神术</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">神通</span>：神术之上更为玄奥的法=神通，对于至尊有太过遥远和强大。每道它出世都会引来无数至尊疯狂争夺。还有些奇特神通，如血脉神通（诞生于血脉间，在大千极稀有因出现概率极低，大多数不具备正面战斗力，但辅助却堪称神效。只能对有相同血脉的族人才有效果，虽对自身没大好处却能提升整体实力，一旦在大规模交战中必然会取得压倒性的胜利）。分小神通→大神通→大圆满神通→准绝世神通→绝世神通→三十六道绝世神通</div><div class=\"anchor-list\" style=\"position: relative; color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 12px;\"><a name=\"2_2\" class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"sub14017570_2_2\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a name=\"灵阵\" class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></div><div class=\"para-title level-3\" label-module=\"para-title\" style=\"clear: both; zoom: 1; margin-top: 20px; margin-bottom: 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\"><h3 class=\"title-text\" style=\"font-size: 18px; color: rgb(51, 51, 51);\">灵阵</h3></div>', 'wait', '1501470443', '1501470443', '0', 'y', '1501640834');
INSERT INTO `jfy_urgent_plan` VALUES ('11', '4', '测试005', '2017080283160', '<img src=http://192.168.199.236/zhianbao_api/images/15014908163146.gif></img><img src=http://192.168.199.236/zhianbao_api/images/15014908156611.jpeg></img><img src=http://192.168.199.236/zhianbao_api/images/15014908156611.jpeg></img>', 'wait', '1501668828', '1501668828', '0', 'n', '0');
INSERT INTO `jfy_urgent_plan` VALUES ('12', '1', '火灾应急预案', '2017080424123', '<p>手动阀手动阀是德国法国花粉管</p>', 'wait', '1501840381', '1501840386', '0', 'y', '1501840399');
INSERT INTO `jfy_urgent_plan` VALUES ('13', '1', '活火', '2017080444085', '<p>规划风格化1231312</p>', 'finish', '1501840421', '1501840426', '1501840426', 'n', '0');

-- ----------------------------
-- Table structure for `jfy_user`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user`;
CREATE TABLE `jfy_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '主账号ID',
  `name` varchar(255) NOT NULL COMMENT '商户名称',
  `login_name` varchar(64) NOT NULL COMMENT '管理员账号',
  `login_password` varchar(64) NOT NULL COMMENT '管理员密码',
  `salt` varchar(32) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '类型: jfb 服务商',
  `country` int(10) NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) NOT NULL DEFAULT '0' COMMENT '地区',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `last_visit_time` int(10) DEFAULT '0' COMMENT '上次登录时间',
  `last_visit_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  `is_enable` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '是否可用： y 是, n 否',
  `create_time` int(10) NOT NULL,
  `last_modify` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user
-- ----------------------------
INSERT INTO `jfy_user` VALUES ('3', '0', '喵神家政', '18817700000', '63dc9e16b0cec3a05a6aa8ac3671676da942f885', '8garKHtq', '18817700000', 'jfb', '1', '310000', '310100', '310104', '长宁区365号', '1524118871', '192.168.100.160', 'y', '1522219451', '1522750526');
INSERT INTO `jfy_user` VALUES ('4', '0', '阿陈家政', '18272878106', '51f9a92bbc4230f2fc319c7067bacf139131c922', 'gsNMS48v', '18272878106', 'jfb', '1', '310000', '310100', '310115', '上海市浦东新区', '1523602108', '192.168.100.160', 'y', '1523601923', '1523601923');

-- ----------------------------
-- Table structure for `jfy_user_auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_auth_role`;
CREATE TABLE `jfy_user_auth_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `action` varchar(255) NOT NULL COMMENT '操作',
  `api_name` varchar(255) NOT NULL COMMENT '接口名称',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `path` varchar(255) NOT NULL COMMENT '路径',
  `islink` int(1) NOT NULL DEFAULT '1' COMMENT '是否链接 0:不是 1:是',
  `o` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_auth_role
-- ----------------------------
INSERT INTO `jfy_user_auth_role` VALUES ('1', '0', '知识库', 'konwledge', '', 'icon-falvfagui', '', '1', '1');
INSERT INTO `jfy_user_auth_role` VALUES ('2', '1', '知识库文章列表', 'konwledgearticle_list', 'Zhianbao_Company_Knowledge_ListGet.Go,Zhianbao_Company_Knowledge_Categroy_ListGet.Go', '', '/konwledgeArticle', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('3', '2', '文章详情', 'knowledge_info', 'Zhianbao_Company_Knowledge_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('4', '0', '发文通知', 'notice', '', 'icon-tongzhi01', '', '1', '2');
INSERT INTO `jfy_user_auth_role` VALUES ('5', '4', '发文通知列表', 'notice_list', 'Zhianbao_Company_Notice_ListGet.Go', '', '/noticeList', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('6', '5', '发文通知详情', 'notice_info', 'Zhianbao_Company_Notice_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('7', '5', '发文通知签收', 'notice_sign', 'Zhianbao_Company_Notice_Sign.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('8', '0', '家政员管理', 'housestaff', '', 'icon-qiangayitab', '', '1', '3');
INSERT INTO `jfy_user_auth_role` VALUES ('9', '8', '家政员列表', 'housestaff_list', 'Jiafubao_Company_HouseStaff_ListGet.Go', '', '/housekeeperList', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('10', '9', '家政员详情', 'housestaff_info', 'Jiafubao_Company_HouseStaff_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('11', '9', '家政员添加', 'housestaff_add', 'Jiafubao_Company_HouseStaff_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('12', '9', '家政员更新', 'housestaff_update', 'Jiafubao_Company_HouseStaff_InfoGet.Go,Jiafubao_Company_HouseStaff_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('13', '9', '体检记录列表', 'healthcard_list', 'Jiafubao_Company_HealthCard_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('14', '9', '体检记录详情', 'healthcard_info', 'Jiafubao_Company_HealthCard_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('15', '9', '体检记录添加', 'healthcard_add', 'Jiafubao_Company_HealthCard_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('16', '9', '体检记录更新', 'healthcard_update', 'Jiafubao_Company_HealthCard_InfoGet.Go,Jiafubao_Company_HealthCard_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('21', '9', '技能证书列表', 'staffcert_list', 'Jiafubao_Company_StaffCert_Skill_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('22', '9', '技能证书详情', 'staffcert_info', 'Jiafubao_Company_StaffCert_Skill_Info.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('23', '9', '技能证书添加', 'staffcert_add', 'Jiafubao_Company_StaffCert_Skill_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('24', '9', '技能证书更新', 'staffcert_update', 'Jiafubao_Company_StaffCert_Skill_InfoGet.Go,Jiafubao_Company_StaffCert_Skill_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('25', '9', '保险记录列表', 'insurrecord_list', 'Jiafubao_Company_StaffInsurance_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('26', '9', '保险记录详情', 'insurrecord_info', 'Jiafubao_Company_StaffInsurance_Info.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('27', '9', '保险记录添加', 'insurrecord_add', 'Jiafubao_Company_StaffInsurance_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('28', '9', '保险记录更新', 'insurrecord_update', 'Jiafubao_Company_StaffInsurance_InfoGet.Go,Jiafubao_Company_StaffInsurance_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('29', '9', '需求详情', 'staffrequire_info', 'Jiafubao_Company_Demand_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('30', '9', '需求更新', 'staffrequire_update', 'Jiafubao_Company_Demand_InfoGet.Go,Jiafubao_Company_Demand_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('31', '97', '健康体检申请列表', 'medicalapply_list', 'Jiafubao_Company_HealthApply_ListGet.Go', '', '/medicalApply', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('32', '31', '健康体检申请详情', 'medicalapply_info', 'Jiafubao_Company_HealthApply_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('33', '31', '健康体检申请添加', 'medicalapply_add', 'Jiafubao_Company_HouseStaff_ListGet.Go,Jiafubao_Company_HealthApply_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('34', '97', '培训报名列表', 'signup_list', 'Jiafubao_Company_TrainApply_ListGet.Go', '', '/signUp', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('35', '34', '培训报名详情', 'signup_info', 'Jiafubao_Company_TrainApply_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('36', '34', '培训报名添加', 'signup_add', 'Jiafubao_Company_TrainApply_ListGet.Go,Jiafubao_Company_TrainApply_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('37', '8', '家政员星级评定', 'staffstar', '', '', '/staffStar', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('38', '0', '业务处理', 'order', '', 'icon-dingdan', '', '1', '5');
INSERT INTO `jfy_user_auth_role` VALUES ('39', '38', '订单处理', 'order_list', 'Jiafubao_Order_ListGet.Go,Jiafubao_Company_HouseStaff_ListGet.Go', '', '/orderList', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('40', '39', '订单详情', 'order_info', 'Jiafubao_Order_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('42', '39', '订单试工', 'order_test', 'Jiafubao_Order_Test.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('43', '39', '订单关闭', 'order_close', 'Jiafubao_Order_Close.Go,Jiafubao_Order_Cancel.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('44', '39', '订单支付', 'order_pay', 'Jiafubao_Order_Pay.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('45', '39', '订单上单', 'order_work', 'Jiafubao_Order_Work.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('46', '39', '订单完成', 'order_finish', 'Jiafubao_Order_Finish.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('47', '38', '订单来源', 'order_list', 'Jiafubao_Order_ListGet.Go,Jiafubao_Company_HouseStaff_ListGet.Go', '', '/orderNeed', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('48', '39', '订单添加', 'order_add', 'Jiafubao_Order_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('49', '39', '订单发布', 'order_publish', 'Jiafubao_Order_Publish.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('50', '39', '订单撤回', 'order_unpublish', 'Jiafubao_Order_UnPublish.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('51', '0', '客户管理', 'customer', '', 'icon-kehu', '', '1', '7');
INSERT INTO `jfy_user_auth_role` VALUES ('52', '51', '客户列表', 'customer_list', 'Jiafubao_Company_Customer_ListGet.Go', '', '/customerList', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('53', '0', '数据报表', 'statistics', '', 'icon-baobiao1', '', '1', '8');
INSERT INTO `jfy_user_auth_role` VALUES ('54', '53', '订单金额统计', 'orderstatistics_list', 'Jiafubao_Company_DataReport_Order_ListGet.Go', '', '/orderStatistics', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('55', '53', '服务质量统计', 'servicestatistics_list', 'Jiafubao_Company_DataReport_Service_ListGet.Go', '', '/serviceStatistics', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('56', '0', '市场订单', 'marketneed', '', 'icon-falv2', '', '1', '6');
INSERT INTO `jfy_user_auth_role` VALUES ('57', '56', '订单池', 'marketneed_list', 'Jiafubao_Order_ListGet.Go', '', '/marketNeed', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('58', '57', '订单详情', 'order_info', 'Jiafubao_Order_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('59', '57', '订单接单', 'order_accept', 'Jiafubao_Order_Accept.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('60', '0', '公司组织（机构）', 'company', '', 'icon-zuzhi2', '', '1', '9');
INSERT INTO `jfy_user_auth_role` VALUES ('61', '60', '公司基本信息', 'company_info', 'Jiafubao_Company_Company_InfoGet.Go', '', '/companyInfor', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('62', '61', '公司基本信息更新', 'company_update', 'Jiafubao_Company_Company_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('63', '60', '公司执照管理', 'companycert_list', 'Jiafubao_Company_Company_License_ListGet.Go,Zhianbao_Company_License_Type_ListGet.Go', '', '/companyCert', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('64', '63', '公司执照详情', 'companycert_info', 'Jiafubao_Company_Company_License_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('65', '63', '公司执照添加', 'companycert_add', 'Jiafubao_Company_Company_License_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('66', '63', '公司执照更新', 'companycert_update', 'Jiafubao_Company_Company_License_InfoGet.Go,Jiafubao_Company_Company_License_update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('67', '60', '公司星级评定', 'starRating', '', '', '/starRating', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('68', '0', '微店管理', 'shop', '', 'icon-weidian', '', '1', '10');
INSERT INTO `jfy_user_auth_role` VALUES ('72', '68', '推广链接', 'shop_url', '', '', '/shop', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('73', '0', '系统管理', 'system', '', 'icon-xitong', '', '1', '11');
INSERT INTO `jfy_user_auth_role` VALUES ('74', '73', '修改密码', 'accountsafe', '', '', '/accountSafe', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('75', '74', '密码更新', 'userpassword_update', 'Zhianbao_Company_User_ChangePwd.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('76', '73', '角色管理', 'usergroup_list', 'Zhianbao_Company_UserGroup_ListGet.Go', '', '/userGroup', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('77', '76', '角色详情', 'usergroup_info', 'Zhianbao_Company_UserGroup_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('78', '76', '角色添加', 'usergroup_add', 'Zhianbao_Company_UserGroup_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('79', '76', '角色更新', 'usergroup_update', 'Zhianbao_Company_UserGroup_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('80', '76', '角色删除', 'usergroup_delete', 'Zhianbao_Company_UserGroup_Delete.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('81', '73', '管理员设置', 'subaccount_list', 'Zhianbao_Company_SubAccount_ListGet.Go,Zhianbao_Company_UserGroup_ListGet.Go', '', '/admin', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('82', '81', '管理员添加', 'subaccount_add', 'Zhianbao_Company_UserGroup_ListGet.Go,Zhianbao_Company_Sms_SendCode.Go,Zhianbao_Company_SubAccount_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('83', '8', '金牌家政员列表', 'goodStaff_list', 'Jiafubao_Company_GoldStaff_ListGet.Go', '', '/goodStaff', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('84', '83', '获取申请设置', 'config_get', 'Jiafubao_Company_GoldStaff_Get.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('85', '83', '金牌家政员申请', 'goodApply_add', 'Jiafubao_Company_GoldStaff_Apply_Add.Go,Jiafubao_Company_HouseStaff_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('86', '83', '金牌家政员申请列表', 'goodApply_list', 'Jiafubao_Company_GoldStaff_Apply_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('87', '83', '金牌家政员申请详情', 'goodApply_info', 'Jiafubao_Company_GoldStaff_Apply_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('88', '83', '金牌家政员申请更新', 'goodApply_update', 'Jiafubao_Company_GoldStaff_Apply_InfoGet.Go,Jiafubao_Company_GoldStaff_Apply_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('89', '9', '家政员上下岗', 'housestaff_isPost', 'Jiafubao_Company_HouseStaff_IsPost.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('90', '9', '从业经历列表', 'working_list', 'Jiafubao_Order_ListGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('91', '9', '从业经历详情', 'working_info', 'Jiafubao_Order_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('92', '39', '订单更换家政员', 'order_changeStaff', 'Jiafubao_Order_ChangeStaff.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('93', '39', '订单通过试工', 'order_testPass', 'Jiafubao_Order_TestPass.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('94', '39', '订单未通过试工', 'order_testClose', 'Jiafubao_Order_TestClose.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('95', '38', '订单跟踪', 'order_follow', 'Jiafubao_Order_ListGet.Go,Jiafubao_Order_InfoGet.Go,Jiafubao_Order_PayUnMark.Go,Jiafubao_Order_VisitUnMark.Go', '', '/orderTrack', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('96', '38', '订单跟踪设置', 'order_followSet', 'Jiafubao_Company_Setting_Set.Go,Jiafubao_Company_Setting_Get.Go', '', '/setOrderTrack', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('97', '0', '工作保障', 'protect', '', 'icon-baozhang1', '', '1', '4');
INSERT INTO `jfy_user_auth_role` VALUES ('98', '52', '客户详情', 'customer_info', 'Jiafubao_Company_Customer_ShenPu_InfoGet.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('99', '52', '客户更新', 'customer_update', 'Jiafubao_Company_Customer_ShenPu_InfoGet.Go,Jiafubao_Company_Customer_ShenPu_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('100', '52', '添加客户', 'customer_add', 'Jiafubao_Company_Customer_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('101', '39', '订单分享', 'order_share', 'Jiafubao_Order_Share_Qrcode.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('102', '61', '公司基本信息添加', 'company_add', 'Jiafubao_Company_Information_Add.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('103', '39', '订单信息补充说明', 'order_supplement', 'Jiafubao_Order_Supplement_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('104', '9', '家政员分享', 'housestaff_share', 'Jiafubao_Company_HouseStaff_Share_Share.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('105', '39', '订单编辑', 'order_update', 'Jiafubao_Order_Update.Go', '', '', '0', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('106', '56', '推荐记录', 'orderSend_list', 'Jiafubao_Order_SendStaff_ListGet.Go', '', '', '1', '0');
INSERT INTO `jfy_user_auth_role` VALUES ('107', '56', '我的合作单', 'orderPartner_list', 'Jiafubao_Order_Partner_ListGet.Go', '', '', '1', '0');

-- ----------------------------
-- Table structure for `jfy_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_group`;
CREATE TABLE `jfy_user_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) DEFAULT '0' COMMENT '公司ID',
  `name` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `last_modify` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_group
-- ----------------------------
INSERT INTO `jfy_user_group` VALUES ('7', '2', '总管理', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"97\"]', '1512116159', '1512116159');
INSERT INTO `jfy_user_group` VALUES ('8', '2', '测试', '[\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"37\",\"38\",\"39\",\"40\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"56\",\"57\",\"58\",\"59\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"98\",\"99\",\"100\",\"101\",\"103\",\"105\",\"106\",\"107\"]', '1512118286', '1517816687');
INSERT INTO `jfy_user_group` VALUES ('9', '15', '运营', '[\"1\",\"2\",\"3\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"47\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"60\",\"61\",\"63\",\"64\",\"67\",\"68\",\"72\",\"73\",\"74\",\"75\",\"76\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"95\",\"96\",\"97\"]', '1512119840', '1512119840');
INSERT INTO `jfy_user_group` VALUES ('10', '21', '助手', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"72\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"97\"]', '1512463563', '1512463563');
INSERT INTO `jfy_user_group` VALUES ('11', '23', '运营', '[\"1\",\"2\",\"3\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"63\",\"64\",\"65\",\"67\",\"68\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"81\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"98\"]', '1513060457', '1513073958');
INSERT INTO `jfy_user_group` VALUES ('12', '60', '运营', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', '1513762099', '1513762099');
INSERT INTO `jfy_user_group` VALUES ('13', '58', '测试', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"92\",\"93\",\"94\",\"95\",\"96\",\"97\",\"98\",\"99\",\"100\",\"101\",\"102\",\"103\",\"104\",\"105\",\"106\",\"107\"]', '1517816272', '1517816272');

-- ----------------------------
-- Table structure for `jfy_user_information`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_information`;
CREATE TABLE `jfy_user_information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `telephone` varchar(255) NOT NULL COMMENT '公司电话',
  `legal_person` varchar(255) NOT NULL COMMENT '法人名称',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `intermediary_fee` text NOT NULL COMMENT '中介费',
  `teacher_number` int(10) NOT NULL COMMENT '老师数量',
  `staff_number` int(10) NOT NULL COMMENT '家政员数量',
  `business` text NOT NULL COMMENT '经营项目',
  `part_work_charge` varchar(255) NOT NULL COMMENT '钟点工收费标准',
  `is_intermediary_fee` text NOT NULL COMMENT '钟点是否有中介费',
  `is_cleaning` enum('y','n') NOT NULL DEFAULT 'n' COMMENT '是否做开荒保洁:y 是 n 否',
  `charges` varchar(255) NOT NULL COMMENT '收费标准',
  `introduction` text NOT NULL COMMENT '公司简介',
  `remark` text COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `zip_code` varchar(255) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_information
-- ----------------------------
INSERT INTO `jfy_user_information` VALUES ('7', '3', '18272878105', 'chen', '18272878105', '[{\"wagesUp\":\"111\",\"wagesDown\":\"222\",\"per\":\"1\"},{\"wagesUp\":\"222\",\"wagesDown\":\"222\",\"per\":\"1\"}]', '30', '20', '[\"\\u4fdd\\u59c6\",\"\\u6708\\u5ac2\",\"\\u62a4\\u5de5\",\"\\u52b3\\u52a1\",\"\\u949f\\u70b9\\u5de5\"]', '1000', '{\"status\":\"y\",\"fee\":\"30\"}', 'y', '10', 'asdasd', '撒撒犯得上发顺丰', '1522638635', '1522638704', null);

-- ----------------------------
-- Table structure for `jfy_user_login_error`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_login_error`;
CREATE TABLE `jfy_user_login_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '商户ID',
  `login_name` varchar(255) NOT NULL COMMENT '用户名',
  `error_times` int(11) NOT NULL COMMENT '错误次数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '上次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_login_error
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_user_session`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_session`;
CREATE TABLE `jfy_user_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sessionId',
  `user_id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session` (`session`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_session
-- ----------------------------
INSERT INTO `jfy_user_session` VALUES ('25', '4', '42760e611e0ae65fd04434c57b5e2fe9', '[]', '', '1523602108');
INSERT INTO `jfy_user_session` VALUES ('28', '3', 'cff089395c4d874c8b58f66e9dfba209', '[]', '', '1524118871');

-- ----------------------------
-- Table structure for `jfy_user_staff`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff`;
CREATE TABLE `jfy_user_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `name` varchar(255) NOT NULL COMMENT '家政员名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '员工照片',
  `birthday` varchar(255) NOT NULL DEFAULT '0' COMMENT '出生日期',
  `sex` enum('boy','girl') NOT NULL DEFAULT 'boy' COMMENT '性别',
  `mobile` varchar(11) NOT NULL COMMENT '电话',
  `now_district` text COMMENT '现居住省市区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `cardID` varchar(20) NOT NULL COMMENT '身份证号',
  `work_experience` text COMMENT '家政经验',
  `crime_experience` text COMMENT '犯罪经历',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `education` varchar(255) DEFAULT '' COMMENT '文化程度',
  `marriage` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `industry` varchar(255) DEFAULT NULL COMMENT '专业',
  `native_place` int(10) NOT NULL DEFAULT '0' COMMENT '籍贯',
  `native_place_district` text COMMENT '户籍地区',
  `native_place_address` varchar(255) DEFAULT NULL COMMENT '户籍详细地址',
  `is_dormitory` enum('y','n','unknown') NOT NULL DEFAULT 'unknown' COMMENT '是否住店:y 是;n 否;unknown 不确定',
  `is_post` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '是否上岗:y 是, n 否',
  `idcard_p` varchar(255) DEFAULT NULL COMMENT '身份证正面照片',
  `idcard_n` varchar(255) DEFAULT NULL COMMENT '身份证反面照片',
  `height` varchar(255) DEFAULT NULL COMMENT '身高',
  `weight` varchar(255) DEFAULT NULL COMMENT '体重',
  `work_time_range` varchar(255) NOT NULL COMMENT '工作时间范围',
  `work_area` text NOT NULL COMMENT '工作地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff
-- ----------------------------
INSERT INTO `jfy_user_staff` VALUES ('5', '3', '陈', null, '0', 'boy', '18272878105', '', null, '41272819940120612', null, null, '1522317580', '1522317580', null, null, null, null, '0', null, '阿斯达所多', 'unknown', 'y', null, null, null, null, '00:00,00:00', '{\"provinceId\":\"\",\"cityId\":\"310100\",\"districtId\":\"310152\"}');
INSERT INTO `jfy_user_staff` VALUES ('6', '3', '陈1', null, '-28800', 'girl', '18272878105', '', '', '412728199401206012', null, null, '1522383991', '1522383991', null, null, null, null, '0', null, '河南省周口市沈丘县冯营乡', 'unknown', 'y', null, null, null, null, '05:00,10:00', '{\"provinceId\":\"\",\"cityId\":\"310100\",\"districtId\":\"310110\"}');
INSERT INTO `jfy_user_staff` VALUES ('7', '3', '陈', null, '1522339200', 'girl', '18272878105', '', '', '412728199401206013', null, null, '1522384315', '1522384315', null, null, null, null, '0', null, '河南省沈丘县冯营乡', 'unknown', 'y', null, null, null, null, '03:00,06:00', '{\"provinceId\":\"\",\"cityId\":\"310100\",\"districtId\":\"310231\"}');
INSERT INTO `jfy_user_staff` VALUES ('8', '3', '陈2', null, '1522339200', 'girl', '18272878105', '', '', '412728199401206014', null, null, '1522384499', '1522384499', null, null, null, null, '0', null, '河南省实打实', 'unknown', 'y', null, null, null, null, '02:00,05:00', '{\"provinceId\":\"\",\"cityId\":\"310100\",\"districtId\":\"310108\",\"native_place_address\":\"\\u6cb3\\u5357\\u7701\"}');
INSERT INTO `jfy_user_staff` VALUES ('9', '3', '陈5', null, '-28800', 'girl', '18272878105', '', '', '412728199401206015', '阿斯达所多分身乏术', null, '1522385157', '1522385157', null, null, null, null, '0', null, '爱迪生', 'unknown', 'y', null, null, null, null, '09:00,03:02', '{\"provinceId\":\"310000\",\"cityId\":\"310100\",\"districtId\":\"310108\"}');
INSERT INTO `jfy_user_staff` VALUES ('10', '3', '陈', null, '758995200', 'girl', '18272878105', '', '', '412728199401206016', '打算', null, '1523255933', '1523255933', null, null, null, null, '0', null, '阿萨德', 'unknown', 'y', null, null, null, null, '00:00,00:00', '{\"provinceId\":\"310000\",\"cityId\":\"310100\",\"districtId\":\"310109\"}');
INSERT INTO `jfy_user_staff` VALUES ('11', '3', '陈先生', null, '758995200', 'girl', '18272878105', '', '', '412728199401206018', '啊实打实', null, '1523256111', '1523256111', null, null, null, null, '0', null, '阿斯达所多', 'unknown', 'y', null, null, null, null, '03:00,04:00', '{\"provinceId\":\"310000\",\"cityId\":\"310100\",\"districtId\":\"310101\"}');

-- ----------------------------
-- Table structure for `jfy_user_staff_ability_cert`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff_ability_cert`;
CREATE TABLE `jfy_user_staff_ability_cert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务ID',
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '家政员ID',
  `type` enum('society','government') NOT NULL DEFAULT 'society' COMMENT '类型:society 协会  government 政府',
  `img_url` text NOT NULL COMMENT '图片路径',
  `level` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '证书等级: 1专项级 2 初级 3 中级 4 高级',
  `cert_bn` varchar(255) NOT NULL COMMENT '证书编号',
  `issued` varchar(255) NOT NULL COMMENT '发证机关',
  `train_course` varchar(255) NOT NULL COMMENT '培训内容',
  `train_time` int(11) NOT NULL COMMENT '培训时间',
  `train_score` varchar(255) NOT NULL COMMENT '培训成绩',
  `train_organization` varchar(255) NOT NULL COMMENT '培训机构',
  `train_periods` varchar(255) DEFAULT NULL COMMENT '培训课时',
  `skill` varchar(255) DEFAULT NULL COMMENT '所学技能',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态:y 正常 n 作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff_ability_cert
-- ----------------------------

-- ----------------------------
-- Table structure for `jfy_user_staff_demand`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff_demand`;
CREATE TABLE `jfy_user_staff_demand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `demand` text COMMENT '业务需求',
  `expected_salary` varchar(255) DEFAULT NULL COMMENT '期望薪酬',
  `good_cuisine` text COMMENT '擅长菜系',
  `cook_taste` varchar(255) DEFAULT NULL COMMENT '做饭口味',
  `is_home` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '是否住家:y 住家 n 不住家',
  `work_time` text COMMENT '工作时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  `work_picture` text COMMENT '工作照',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff_demand
-- ----------------------------
INSERT INTO `jfy_user_staff_demand` VALUES ('3', '5', null, null, null, null, 'n', 'null', '1522317580', '1522317580', 'null');
INSERT INTO `jfy_user_staff_demand` VALUES ('4', '6', null, null, null, null, 'n', 'null', '1522319616', '1522383991', 'null');
INSERT INTO `jfy_user_staff_demand` VALUES ('5', '7', null, null, null, null, 'n', 'null', '1522384242', '1522384315', 'null');
INSERT INTO `jfy_user_staff_demand` VALUES ('6', '8', null, null, null, null, 'n', 'null', '1522384406', '1522384499', 'null');
INSERT INTO `jfy_user_staff_demand` VALUES ('7', '9', null, null, null, null, 'n', 'null', '1522384564', '1522385157', 'null');
INSERT INTO `jfy_user_staff_demand` VALUES ('8', '10', null, null, null, null, 'n', null, '1523177535', '1523255933', null);
INSERT INTO `jfy_user_staff_demand` VALUES ('9', '11', null, null, null, null, 'n', null, '1523178223', '1523256111', null);

-- ----------------------------
-- Table structure for `jfy_user_staff_health_record`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff_health_record`;
CREATE TABLE `jfy_user_staff_health_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `send_time` int(10) NOT NULL COMMENT '发放日期',
  `end_time` int(10) NOT NULL COMMENT '截至有效日期',
  `img_url` text NOT NULL COMMENT '图片路径',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态：y 正常 n 作废',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff_health_record
-- ----------------------------
INSERT INTO `jfy_user_staff_health_record` VALUES ('5', '3', '9', '1293811200', '1672502400', '[\"http:\\/\\/192.168.100.136\\/jiafuyun_api\\/Resource\\/images\\/15223915245043.png\"]', 'y', '1522394544', '1523349836');
INSERT INTO `jfy_user_staff_health_record` VALUES ('6', '3', '9', '1388505600', '1420041600', '[\"http:\\/\\/192.168.100.136\\/jiafuyun_api\\/Resource\\/images\\/15223915245043.png\"]', 'y', '1522397631', '1522397631');

-- ----------------------------
-- Table structure for `jfy_user_staff_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff_insurance`;
CREATE TABLE `jfy_user_staff_insurance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `staff_id` int(10) NOT NULL DEFAULT '0' COMMENT '家政员ID',
  `title` varchar(255) NOT NULL COMMENT '保险类别',
  `policy_bn` varchar(255) NOT NULL COMMENT '保单号',
  `insured_name` varchar(255) NOT NULL COMMENT '投保人',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '截至有效期',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `last_modify` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff_insurance
-- ----------------------------
INSERT INTO `jfy_user_staff_insurance` VALUES ('2', '3', '9', '意外保险', 'asdasd', 'asdas ', '1325347200', '1522397301', '1522397301');

-- ----------------------------
-- Table structure for `jfy_user_staff_skill_cert`
-- ----------------------------
DROP TABLE IF EXISTS `jfy_user_staff_skill_cert`;
CREATE TABLE `jfy_user_staff_skill_cert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务商ID',
  `staff_id` int(10) NOT NULL COMMENT '家政员ID',
  `type` enum('society','government') NOT NULL DEFAULT 'society' COMMENT '类型:society 协会  government 政府',
  `img_url` text NOT NULL COMMENT '图片路径',
  `name` varchar(255) NOT NULL COMMENT '技能名称',
  `level` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '证书等级: 1专项级 2 初级 3 中级 4 高级',
  `cert_bn` varchar(255) NOT NULL COMMENT '证书编号',
  `issued` varchar(255) NOT NULL COMMENT '发证机关',
  `occupation` varchar(255) NOT NULL COMMENT '职业',
  `theoretical_score` varchar(255) NOT NULL COMMENT '理论知识成绩',
  `operating_score` varchar(255) NOT NULL COMMENT '操作技能成绩',
  `evaluation_score` varchar(255) NOT NULL COMMENT '评定成绩',
  `train_organization` varchar(255) NOT NULL COMMENT '培训机构',
  `accreditation_time` int(10) NOT NULL COMMENT '认证时间',
  `status` enum('y','n') NOT NULL DEFAULT 'y' COMMENT '状态:y 正常 n 作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_modify` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfy_user_staff_skill_cert
-- ----------------------------
