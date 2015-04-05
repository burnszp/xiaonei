/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : xiaoyou

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-04-05 11:32:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acct_user`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
`id`  bigint(20) NOT NULL COMMENT '主键' ,
`login_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名称' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实名称' ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码' ,
`salt`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验辅助字码' ,
`register_date`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='管理员'

;

-- ----------------------------
-- Table structure for `fr_college`
-- ----------------------------
DROP TABLE IF EXISTS `fr_college`;
CREATE TABLE `fr_college` (
`id`  bigint(20) NOT NULL COMMENT '主键' ,
`cname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学校名称' ,
`addr_code`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区编码对应sys_region表中的id' ,
`addr`  varchar(62) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='学校'

;

-- ----------------------------
-- Table structure for `fr_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_group`;
CREATE TABLE `fr_group` (
`id`  bigint(20) NOT NULL ,
`gname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`descript`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '群组状态：0：审核中；1：活动小组；2：已关闭 3:已解散' ,
`college`  bigint(20) NULL DEFAULT NULL ,
`addr_code`  bigint(20) NULL DEFAULT NULL ,
`createtime`  date NULL DEFAULT NULL COMMENT '创建日期' ,
`creator_id`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_message`
-- ----------------------------
DROP TABLE IF EXISTS `fr_message`;
CREATE TABLE `fr_message` (
`id`  bigint(20) NOT NULL COMMENT '主键' ,
`title`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题' ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容' ,
`createtime`  date NULL DEFAULT NULL COMMENT '发布日期' ,
`status`  int(11) NOT NULL DEFAULT 0 COMMENT '状态：0：发布中；1：已关闭' ,
`tid`  bigint(20) NULL DEFAULT NULL COMMENT '所属消息类型id' ,
`uid`  bigint(20) NULL DEFAULT NULL COMMENT '发布者id' ,
`gid`  bigint(20) NULL DEFAULT NULL COMMENT '所属群组id' ,
`replay_id`  bigint(20) NULL DEFAULT NULL COMMENT '如果该字段有值，说明该消息是一个回复消息，该字段表示回复的那个消息的id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='帖子消息'

;

-- ----------------------------
-- Table structure for `fr_msgbox`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgbox`;
CREATE TABLE `fr_msgbox` (
`id`  bigint(20) NOT NULL ,
`send_user`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息发送者' ,
`send_date`  date NULL DEFAULT NULL COMMENT '发送日期' ,
`if_read`  int(11) NULL DEFAULT NULL COMMENT '是否读过，0：未读，1：已读' ,
`receive_user`  bigint(20) NULL DEFAULT NULL COMMENT '消息接受者' ,
`descript`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='收件箱'

;

-- ----------------------------
-- Table structure for `fr_msgtype`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgtype`;
CREATE TABLE `fr_msgtype` (
`id`  bigint(20) NOT NULL COMMENT 'id，主键' ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称' ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '类别描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='消息类别'

;

-- ----------------------------
-- Table structure for `fr_school`
-- ----------------------------
DROP TABLE IF EXISTS `fr_school`;
CREATE TABLE `fr_school` (
`id`  bigint(20) NOT NULL COMMENT '院系id，主键' ,
`sname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系名称' ,
`cid`  bigint(20) NOT NULL COMMENT '所属学校id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='院系'

;

-- ----------------------------
-- Table structure for `fr_user`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user`;
CREATE TABLE `fr_user` (
`id`  bigint(20) NOT NULL COMMENT 'id，主键' ,
`uname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名' ,
`pwd`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '密码' ,
`nick_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称' ,
`real_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实名称' ,
`email`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址' ,
`tel`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话' ,
`qq`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号码' ,
`cid`  bigint(20) NULL DEFAULT NULL COMMENT '所属学校id' ,
`sid`  bigint(20) NULL DEFAULT NULL COMMENT '所属院系id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表'

;

-- ----------------------------
-- Table structure for `fr_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user_group`;
CREATE TABLE `fr_user_group` (
`id`  bigint(20) NOT NULL COMMENT 'id，主键' ,
`fr_user_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户id' ,
`fr_group_id`  bigint(20) NULL DEFAULT NULL COMMENT '群组id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户和群组对照关系表'

;

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
`id`  bigint(20) NOT NULL ,
`param_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数key值' ,
`param_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数键值' ,
`param_type`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数组' ,
`param_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数中文名称' ,
`param_desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述' ,
`last_modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间' ,
`last_modify_by`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后更新用户' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='系统参数配置表'

;

-- ----------------------------
-- Table structure for `sys_region`
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
`id`  bigint(20) NOT NULL COMMENT '地区编码，后四位为0的地区是省份' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`description`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区描述' ,
`lng`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度' ,
`lat`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='地区编码表'

;

-- ----------------------------
-- Indexes structure for table acct_user
-- ----------------------------
CREATE UNIQUE INDEX `login_name` ON `acct_user`(`login_name`) USING BTREE ;
