/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : car_4s_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-03-15 00:05:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `t_attendance`;
CREATE TABLE `t_attendance` (
  `attendanceId` int(11) NOT NULL auto_increment COMMENT '考勤id',
  `attendanceDate` varchar(20) default NULL COMMENT '考勤日期',
  `employeeObj` varchar(30) NOT NULL COMMENT '考勤员工',
  `attendanceStateObj` int(11) NOT NULL COMMENT '考勤结果',
  `attendanceMemo` varchar(800) default NULL COMMENT '考勤备注',
  PRIMARY KEY  (`attendanceId`),
  KEY `employeeObj` (`employeeObj`),
  KEY `attendanceStateObj` (`attendanceStateObj`),
  CONSTRAINT `t_attendance_ibfk_1` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_attendance_ibfk_2` FOREIGN KEY (`attendanceStateObj`) REFERENCES `t_attendancestate` (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
INSERT INTO `t_attendance` VALUES ('1', '2019-03-05', 'EM001', '2', '迟到了5分钟');

-- ----------------------------
-- Table structure for `t_attendancestate`
-- ----------------------------
DROP TABLE IF EXISTS `t_attendancestate`;
CREATE TABLE `t_attendancestate` (
  `stateId` int(11) NOT NULL auto_increment COMMENT '考勤状态id',
  `stateName` varchar(20) NOT NULL COMMENT '考勤状态名称',
  PRIMARY KEY  (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attendancestate
-- ----------------------------
INSERT INTO `t_attendancestate` VALUES ('1', '正常');
INSERT INTO `t_attendancestate` VALUES ('2', '迟到');
INSERT INTO `t_attendancestate` VALUES ('3', '早退');
INSERT INTO `t_attendancestate` VALUES ('4', '旷工');

-- ----------------------------
-- Table structure for `t_buyinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_buyinfo`;
CREATE TABLE `t_buyinfo` (
  `buyId` int(11) NOT NULL auto_increment COMMENT '进货id',
  `productObj` int(11) NOT NULL COMMENT '进货商品',
  `supplierObj` int(11) NOT NULL COMMENT '供应商',
  `price` float NOT NULL COMMENT '进货单价',
  `number` int(11) NOT NULL COMMENT '进货数量',
  `totalPrice` float NOT NULL COMMENT '总价格',
  `buyDate` varchar(20) default NULL COMMENT '进货日期',
  `buyMemo` varchar(800) default NULL COMMENT '进货备注',
  `employeeObj` varchar(30) NOT NULL COMMENT '进货员工',
  PRIMARY KEY  (`buyId`),
  KEY `productObj` (`productObj`),
  KEY `supplierObj` (`supplierObj`),
  KEY `employeeObj` (`employeeObj`),
  CONSTRAINT `t_buyinfo_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_buyinfo_ibfk_2` FOREIGN KEY (`supplierObj`) REFERENCES `t_suppllier` (`supplierId`),
  CONSTRAINT `t_buyinfo_ibfk_3` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyinfo
-- ----------------------------
INSERT INTO `t_buyinfo` VALUES ('1', '1', '1', '150', '20', '3000', '2019-03-01', '11412', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('2', '1', '1', '150', '10', '1500', '2019-03-10', 'test', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('3', '2', '1', '120', '20', '2400', '2019-03-12', '进货了', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('4', '2', '1', '120', '10', '1200', '2019-03-12', '测试进货', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('5', '2', '1', '120', '12', '1440', '2019-03-12', '我来进货一个', 'EM001');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `employeeNo` varchar(30) NOT NULL COMMENT 'employeeNo',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `employeePhoto` varchar(60) NOT NULL COMMENT '雇员照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('EM001', '123', '双鱼林', '男', '2019-03-01', 'upload/f34dbf84-2975-402b-920a-84c5c53735a1.jpg', '13984019834', 'lingege@163.com', '四川达州', '2019-03-06 11:08:55');
INSERT INTO `t_employee` VALUES ('EM002', '123', '张晓馨', '女', '2019-03-06', 'upload/32319049-0ed3-4942-aba0-f3c91d765ba4.jpg', '13983908342', 'xiaoxing@163.com', '福建南平', '2019-03-12 11:27:47');

-- ----------------------------
-- Table structure for `t_loginfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_loginfo`;
CREATE TABLE `t_loginfo` (
  `logId` int(11) NOT NULL auto_increment COMMENT '日志id',
  `logType` varchar(30) NOT NULL COMMENT '日志类型',
  `logContent` varchar(500) NOT NULL COMMENT '日志内容',
  `logTime` varchar(20) default NULL COMMENT '日志时间',
  PRIMARY KEY  (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginfo
-- ----------------------------
INSERT INTO `t_loginfo` VALUES ('1', '商品进货', '员工EM001进货了商品xxx', '2019-03-06 11:12:45');
INSERT INTO `t_loginfo` VALUES ('2', '系统登录', '超级管理员a登录系统', '2019-03-12 11:16:06');
INSERT INTO `t_loginfo` VALUES ('3', '系统登录', '员工EM001登录系统', '2019-03-12 11:16:42');
INSERT INTO `t_loginfo` VALUES ('4', '商品销售', '员工操作苏泊尔电饭煲销售数量：2入库成功', '2019-03-12 11:18:30');
INSERT INTO `t_loginfo` VALUES ('5', '系统登录', '超级管理员a登录系统', '2019-03-12 11:18:43');
INSERT INTO `t_loginfo` VALUES ('6', '系统登录', '员工EM001登录系统', '2019-03-12 11:21:10');
INSERT INTO `t_loginfo` VALUES ('7', '商品进货', '员工EM001操作商品美的电磁炉进货数量：10登记成功', '2019-03-12 11:21:43');
INSERT INTO `t_loginfo` VALUES ('8', '系统登录', '超级管理员a登录系统', '2019-03-12 11:21:53');
INSERT INTO `t_loginfo` VALUES ('9', '系统登录', '员工EM001登录系统', '2019-03-12 11:23:20');
INSERT INTO `t_loginfo` VALUES ('10', '系统登录', '员工EM001登录系统', '2019-03-12 11:23:20');
INSERT INTO `t_loginfo` VALUES ('11', '商品进货', '员工EM001操作商品美的电磁炉进货数量：12登记成功', '2019-03-12 11:23:43');
INSERT INTO `t_loginfo` VALUES ('12', '系统登录', '超级管理员a登录系统', '2019-03-12 11:23:49');
INSERT INTO `t_loginfo` VALUES ('13', '商品登记', '商品飘柔洗发水登记成功', '2019-03-12 11:30:11');
INSERT INTO `t_loginfo` VALUES ('14', '系统登录', '员工EM002登录系统', '2019-03-12 11:35:51');
INSERT INTO `t_loginfo` VALUES ('15', '商品销售', '员工操作苏泊尔电饭煲销售数量：1登记成功', '2019-03-12 11:36:17');
INSERT INTO `t_loginfo` VALUES ('16', '商品销售', '员工操作飘柔洗发水750ml销售数量：2登记成功', '2019-03-12 11:36:17');
INSERT INTO `t_loginfo` VALUES ('17', '系统登录', '普通管理员gl002登录系统', '2019-03-12 11:36:32');
INSERT INTO `t_loginfo` VALUES ('18', '系统登录', '超级管理员a登录系统', '2019-03-12 11:36:51');
INSERT INTO `t_loginfo` VALUES ('19', '系统登录', '超级管理员a登录系统', '2019-03-14 23:30:27');
INSERT INTO `t_loginfo` VALUES ('20', '系统登录', '普通管理员gl001登录系统', '2019-03-14 23:31:03');
INSERT INTO `t_loginfo` VALUES ('21', '系统登录', '超级管理员a登录系统', '2019-03-14 23:39:53');
INSERT INTO `t_loginfo` VALUES ('22', '系统登录', '超级管理员a登录系统', '2019-03-14 23:46:24');
INSERT INTO `t_loginfo` VALUES ('23', '系统登录', '超级管理员a登录系统', '2019-03-15 00:00:03');
INSERT INTO `t_loginfo` VALUES ('24', '系统登录', '普通管理员gl001登录系统', '2019-03-15 00:00:17');
INSERT INTO `t_loginfo` VALUES ('25', '系统登录', '员工EM001登录系统', '2019-03-15 00:03:07');
INSERT INTO `t_loginfo` VALUES ('26', '系统登录', '员工em001登录系统', '2019-03-15 00:03:14');
INSERT INTO `t_loginfo` VALUES ('27', '系统登录', '员工EM001登录系统', '2019-03-15 00:03:28');

-- ----------------------------
-- Table structure for `t_lostproduct`
-- ----------------------------
DROP TABLE IF EXISTS `t_lostproduct`;
CREATE TABLE `t_lostproduct` (
  `lostId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `productObj` int(11) NOT NULL COMMENT '丢失物品',
  `lostNumber` int(11) NOT NULL COMMENT '丢失数量',
  `lostTime` varchar(20) default NULL COMMENT '丢失时间',
  `lostPlace` varchar(40) NOT NULL COMMENT '丢失地点',
  `productMoney` float NOT NULL COMMENT '总价值',
  `employeeObj` varchar(30) NOT NULL COMMENT '操作员',
  PRIMARY KEY  (`lostId`),
  KEY `productObj` (`productObj`),
  KEY `employeeObj` (`employeeObj`),
  CONSTRAINT `t_lostproduct_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_lostproduct_ibfk_2` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lostproduct
-- ----------------------------
INSERT INTO `t_lostproduct` VALUES ('1', '1', '2', '2019-03-06 11:11:33', '门店超市', '700', 'EM001');
INSERT INTO `t_lostproduct` VALUES ('2', '2', '3', '2019-03-11 23:29:24', '门店超市', '500', 'EM001');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerUserName` varchar(20) NOT NULL COMMENT 'managerUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `birthday` varchar(20) default NULL COMMENT '出生日期',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `managerMemo` varchar(800) default NULL COMMENT '管理备注',
  PRIMARY KEY  (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('gl001', '123', '王忠', '男', '2019-03-02', '13959342344', 'test');
INSERT INTO `t_manager` VALUES ('gl002', '123', '李二', '男', '2019-03-06', '13984893423', 'test');

-- ----------------------------
-- Table structure for `t_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `memberUserName` varchar(30) NOT NULL COMMENT 'memberUserName',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) default NULL COMMENT '住宅地址',
  `memberMemo` varchar(800) default NULL COMMENT '会员备注',
  PRIMARY KEY  (`memberUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('member1', '李明', '男', '2019-03-01', '13539802432', '四川成都红星路13号', 'test');
INSERT INTO `t_member` VALUES ('member2', '王超', '男', '2019-03-06', '13985083423', '四川攀枝花', '高级会员');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品主图',
  `productPrice` float NOT NULL COMMENT '商品单价',
  `productCount` int(11) NOT NULL COMMENT '商品库存',
  `productDesc` mediumtext NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '1.4 GL MT手动焕新版', 'upload/9f7cfd2e-8c66-48dc-bf13-beda6be94bba.jpg', '299', '50', '<table class=\"congfigTab\" width=\"1002\" style=\"width: 912px;\"><tbody class=\"config-tbody1\" style=\"margin: 0px; padding: 0px; border: 0px;\"><tr style=\"margin: 0px; padding: 0px; border: 0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">长×宽×高 (mm)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">4,300×1,705×1,460</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">轴距 (mm)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">2,570</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">发动机</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">自然吸气 多点喷射 (D-CVVT)</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">发动机排量 (ml)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">1,368</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">最大功率 (kW/rpm)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">70/6,000</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">最大扭矩 (N·m/rpm)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">132.4/4,000</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">变速器</td><td colspan=\"4\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">5速手动</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">4速自动</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">转向系统</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">电动助力</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">制动系统 (前/后)</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">盘式/鼓式</td><td colspan=\"6\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">盘式/盘式</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">燃油箱容积 (L)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">43</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">悬架系统 (前/后)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">麦弗逊式独立悬架/扭力梁式半独立悬架</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">最高车速 (km/h)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">170</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">综合工况油耗 (L/100km)</td><td colspan=\"4\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">5.2 (带ISG 5.0)</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">5.7 (带ISG 5.5)</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">轮胎规格</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">175/70 R14</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">轮毂材质</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">钢制</td><td colspan=\"6\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">铝合金</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">整车整备质量 (kg)</td><td colspan=\"4\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">990</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">1,020</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">后备箱容积 (L)</td><td colspan=\"7\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\">475</td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td><td colspan=\"1\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133);\"><br/></td></tr></tbody><tfoot style=\"margin: 0px; padding: 0px; border: 0px;\"><tr style=\"margin: 0px; padding: 0px; border: 0px; background: none;\"><td colspan=\"10\" class=\"botth\" style=\"margin: 0px; padding: 8px 5px 8px 0px; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 14px;\" width=\"NaN\">注：“●”为有此配置；“○”为选装配置；“-”为无此配置；</td></tr></tfoot></table><p><br/></p>', '2019-03-09 11:10:04');
INSERT INTO `t_product` VALUES ('2', '2', '1.6L 自动 智炫·豪华型', 'upload/b94a415b-66cc-4fe4-b869-45ca60782eb5.jpg', '238', '62', '<table class=\"congfigTab\" width=\"1002\" style=\"width: 912px;\"><tbody class=\"config-tbody1\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><tr class=\"hover firstRow\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">长×宽×高 (mm)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">4,610×1,800×1,450</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">轴距 (mm)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">2,700</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">发动机排量 (ml)</td><td colspan=\"6\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,591</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,353</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">最大功率 (kW/rpm)</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">93.8/6,300</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">95.3/6,300</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">93.8/6,300</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">95.3/6,300</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">95.6/5,500</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">最大扭矩 (N·m/rpm)</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">155.5/4,850</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">157/4,850</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">155.5/4,850</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">157/4,850</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">210.8/1,400~3,700</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">发动机</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">自然吸气 多点喷射</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">缸内直喷</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">自然吸气 多点喷射</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">缸内直喷</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">缸内直喷 涡轮增压</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">变速器</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">6速手动</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">6速手自一体</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">6速手动</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">6速手自一体</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">7速双离合</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">转向系统</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">电动助力</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">燃油箱容积 (L)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">53</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">后备箱容积 (L)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">462</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">最高车速 (km/h)</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">195</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">204</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">195</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">204</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">200</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">整车整备质量 (kg)</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,225</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,254</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,225</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,317</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">1,317</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">综合工况油耗 (L/100km)</td><td colspan=\"6\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">6.1(带ISG 5.9)</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">5.5</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">5.5(带ISG 5.3)</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">制动系统 (前/后)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">盘式/盘式</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">悬架系统 (前/后)</td><td colspan=\"9\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">麦弗逊式独立悬架/双扭力梁式半独立悬架</td></tr><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">轮毂材质</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">铝合金</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">铝合金 (运动型)</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; list-style: none; border-color: rgb(237, 237, 238); color: rgb(112, 118, 133); font-size: 12px; word-break: break-all; word-wrap: break-word;\">轮胎规格</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">205/55 R16</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">225/45 R17</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">205/55 R16</td><td style=\"margin: 0px; padding: 8px 5px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 12px;\">225/45 R17</td></tr></tbody><tfoot style=\"margin: 0px; padding: 0px; list-style: none; border: 0px;\"><tr style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><td colspan=\"10\" class=\"botth\" style=\"margin: 0px; padding: 8px 5px 8px 0px; list-style: none; border-color: rgb(237, 237, 238); text-align: center; color: rgb(112, 118, 133); font-size: 14px;\" width=\"NaN\">注：“●”为有此配置；“-”为无此配置；“o“为选装.</td></tr></tfoot></table><p><br/></p>', '2019-03-11 19:00:37');
INSERT INTO `t_product` VALUES ('3', '3', '1.6T GL DCT双离合舒适型', 'upload/8951e13b-f166-45ea-b1b1-0f557d5def10.jpg', '28', '80', '<table class=\"congfigTab\" width=\"100%\"><tbody class=\"config-tbody1\" style=\"margin: 0px; padding: 0px; border: 0px;\"><tr class=\"hover firstRow\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">长×宽×高 (mm)</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">4,475×1,850×1,655</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">4,475×1,850×1,660</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">4,475×1,850×1,655</td><td colspan=\"4\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">4,475×1,850×1,660</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">轴距 (mm)</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">2,670</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">发动机</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">缸内直喷</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">涡轮增压 缸内直喷</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">发动机排量 (ml)</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,999</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,591</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">最大功率 (kW/rpm)</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">121/6,200</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">130/5,500</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">最大扭矩 (N·m/rpm)</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">203/4,700</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">265/1,500~4,500</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">变速器</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">6速手动</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">6速手自一体</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">7速双离合</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">柔性转向</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">驾驶模式选择</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">驱动方式</td><td colspan=\"6\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">前驱</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">四驱</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">转向系统</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">电动助力</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">悬架系统 (前/后)</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">麦弗逊式独立悬架/多连杆式独立悬架</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">燃油箱容积 (L)</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">62</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">后备箱容积 (L)</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">488</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">最小离地间隙 (mm)</td><td colspan=\"8\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">182</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">整车整备质量 (kg)</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,463</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,486</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,531</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,541</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,603</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">1,657</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">最高车速 (km/h)</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">192</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">185</td><td colspan=\"5\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">195</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">综合工况油耗 (L/100km)</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">7.7</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">7.7 (带ISG 7.4)</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">6.9</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">6.9 (带ISG 6.7)</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">6.7</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">7.2</td></tr><tr class=\"hover\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(245, 246, 248);\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">轮胎规格</td><td colspan=\"2\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">215/70 R16</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">225/60 R17</td><td colspan=\"3\" style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">225/55 R18</td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px;\"><td class=\"th\" style=\"margin: 0px; padding: 8px 5px 8px 20px; border-color: rgb(237, 237, 238); text-size-adjust: none; color: rgb(112, 118, 133); word-break: break-all; word-wrap: break-word;\" width=\"242\">ISG 发动机自动启停</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">o</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">-</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">o</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td><td style=\"margin: 0px; padding: 8px 5px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133);\">●</td></tr></tbody><tfoot style=\"margin: 0px; padding: 0px; border: 0px;\"><tr style=\"margin: 0px; padding: 0px; border: 0px; background: none;\"><td colspan=\"9\" class=\"botth\" style=\"margin: 0px; padding: 8px 5px 8px 0px; border-color: rgb(237, 237, 238); text-size-adjust: none; text-align: center; color: rgb(112, 118, 133); font-size: 14px;\" width=\"NaN\">注：“●”为有此配置；“-”为无此配置；“o“为选装.</td></tr></tfoot></table><p><br/></p>', '2019-03-12 11:30:11');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '全新瑞纳', '全新瑞纳');
INSERT INTO `t_productclass` VALUES ('2', '领动系列', '领动系列');
INSERT INTO `t_productclass` VALUES ('3', '全新途胜', '全新途胜');
INSERT INTO `t_productclass` VALUES ('4', '新名图', '新名图');
INSERT INTO `t_productclass` VALUES ('5', '悦纳系列', '悦纳系列');

-- ----------------------------
-- Table structure for `t_sell`
-- ----------------------------
DROP TABLE IF EXISTS `t_sell`;
CREATE TABLE `t_sell` (
  `sellId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `sellNo` varchar(20) NOT NULL COMMENT '订单号',
  `productObj` int(11) NOT NULL COMMENT '销售商品',
  `price` float NOT NULL COMMENT '销售价格',
  `number` int(11) NOT NULL COMMENT '销售数量',
  `totalPrice` float NOT NULL COMMENT '销售总价',
  `memberObj` varchar(30) NOT NULL COMMENT '购买会员',
  `employeeObj` varchar(30) NOT NULL COMMENT '销售员工',
  `sellTime` varchar(20) default NULL COMMENT '销售时间',
  PRIMARY KEY  (`sellId`),
  KEY `productObj` (`productObj`),
  KEY `employeeObj` (`employeeObj`),
  KEY `memberObj` (`memberObj`),
  CONSTRAINT `t_sell_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_sell_ibfk_2` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_sell_ibfk_3` FOREIGN KEY (`memberObj`) REFERENCES `t_member` (`memberUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sell
-- ----------------------------
INSERT INTO `t_sell` VALUES ('1', 'EM00120190306111113', '1', '350', '2', '700', 'member1', 'EM001', '2019-03-01 11:11:20');
INSERT INTO `t_sell` VALUES ('2', 'EM00120190311223342', '1', '299', '4', '1196', 'member1', 'EM001', '2019-03-02 22:33:42');
INSERT INTO `t_sell` VALUES ('3', 'EM00120190311223342', '2', '238', '2', '476', 'member1', 'EM001', '2019-03-02 22:33:42');
INSERT INTO `t_sell` VALUES ('4', 'EM00120190311230608', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-03 23:06:08');
INSERT INTO `t_sell` VALUES ('5', 'EM00120190311230611', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-04 23:06:11');
INSERT INTO `t_sell` VALUES ('6', 'EM00120190311230618', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-05 23:06:18');
INSERT INTO `t_sell` VALUES ('7', 'EM00120190311230626', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-06 23:06:26');
INSERT INTO `t_sell` VALUES ('8', 'EM00120190311230739', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-07 23:07:39');
INSERT INTO `t_sell` VALUES ('9', 'EM00120190311230739', '2', '238', '1', '238', 'member1', 'EM001', '2019-03-07 23:07:39');
INSERT INTO `t_sell` VALUES ('10', 'EM00120190311230843', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-08 23:08:43');
INSERT INTO `t_sell` VALUES ('11', 'EM00120190311231028', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-09 23:10:28');
INSERT INTO `t_sell` VALUES ('12', 'EM00120190311231028', '2', '238', '1', '238', 'member1', 'EM001', '2019-03-09 23:10:28');
INSERT INTO `t_sell` VALUES ('13', 'EM00120190312111830', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-12 11:18:30');
INSERT INTO `t_sell` VALUES ('14', 'EM00220190312113617', '1', '299', '1', '299', 'member1', 'EM002', '2019-03-12 11:36:17');
INSERT INTO `t_sell` VALUES ('15', 'EM00220190312113617', '3', '28', '2', '56', 'member1', 'EM002', '2019-03-12 11:36:17');

-- ----------------------------
-- Table structure for `t_sellcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_sellcart`;
CREATE TABLE `t_sellcart` (
  `sellCartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `employeeObj` varchar(30) NOT NULL COMMENT '员工',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `productCount` int(11) NOT NULL COMMENT '商品数量',
  PRIMARY KEY  (`sellCartId`),
  KEY `employeeObj` (`employeeObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_sellcart_ibfk_1` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_sellcart_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sellcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_suppllier`
-- ----------------------------
DROP TABLE IF EXISTS `t_suppllier`;
CREATE TABLE `t_suppllier` (
  `supplierId` int(11) NOT NULL auto_increment COMMENT '供应商id',
  `supplierName` varchar(20) NOT NULL COMMENT '供应商名称',
  `supplierLawyer` varchar(20) NOT NULL COMMENT '法人代表',
  `supplierTelephone` varchar(20) NOT NULL COMMENT '供应商电话',
  `supplierAddress` varchar(80) NOT NULL COMMENT '供应商地址',
  PRIMARY KEY  (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_suppllier
-- ----------------------------
INSERT INTO `t_suppllier` VALUES ('1', '四川供应商总代理', '王强', '028-83948083', '四川成都建设路');

-- ----------------------------
-- Table structure for `t_ziliao`
-- ----------------------------
DROP TABLE IF EXISTS `t_ziliao`;
CREATE TABLE `t_ziliao` (
  `ziliaoId` int(11) NOT NULL auto_increment COMMENT '资料id',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `content` varchar(8000) NOT NULL COMMENT '描述',
  `ziliaoFile` varchar(60) NOT NULL COMMENT '资料文件',
  `addTime` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`ziliaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ziliao
-- ----------------------------
INSERT INTO `t_ziliao` VALUES ('1', '员工手册文件', '<p>为了方便门店的管理，我们门店的员工制度规则，请下载阅读！</p><p><br/></p>', 'upload/9b4efb2f-6b24-4988-a26b-c221379104ff.doc', '2019-03-06 11:12:19');
