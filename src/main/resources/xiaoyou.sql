#用户-fr_user
drop table if exists `fr_user`;
CREATE TABLE `fr_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL default '123456',
  `nick_name` varchar(32),
  `real_name` varchar(32),
  `email` varchar(64),
  `tel` varchar(16),
  `qq` varchar(16) ,
  `cid` bigint COMMENT '所属学校id',
  `sid` bigint COMMENT '所属院系id',
  PRIMARY KEY (`id`)
)  DEFAULT CHARSET=utf8;

#地区-sys_region
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `id` bigint NOT NULL COMMENT '地区编码，后四位为0的地区是省份',
  `name` varchar(100) COMMENT '地区名称',
  `description` varchar(128)  COMMENT '地区描述',
  `lng` varchar(255) COMMENT '经度',
  `lat` varchar(255) COMMENT '纬度',
  PRIMARY KEY (`id`)
)  DEFAULT CHARSET=utf8 COMMENT='地区编码表';
#学校-fr_college
DROP TABLE IF EXISTS `fr_college`;
CREATE TABLE `fr_college` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) NOT NULL,
  `addr_code` varchar(6) NOT NULL COMMENT '所在地区编码对应sys_region表中的id',
  `addr` varchar(62) COMMENT '详细地址',
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

#院系-fr_school
DROP TABLE IF EXISTS `fr_school`;
CREATE TABLE `fr_school` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sname` varchar(32) NOT NULL,
  `cid` bigint NOT NULL COMMENT '所属学校id',
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
#群组-fr_group
DROP TABLE IF EXISTS `fr_group`;
CREATE TABLE `fr_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gname` varchar(32) NOT NULL,
  `descript` varchar(512) ,
  `status` int DEFAULT 0 NOT NULL COMMENT '群组状态：0：审核中；1：活动小组；2：已关闭,3：已解散',
  `college` bigint ,
  `addr_code` bigint ,
  `createtime` date COMMENT '创建日期',
  `creator_id` bigint,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
#消息类型-fr_msgtype
DROP TABLE IF EXISTS `fr_msgtype`;
CREATE TABLE `fr_msgtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `descript` text,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
#消息-fr_message
DROP TABLE IF EXISTS `fr_message`;
CREATE TABLE `fr_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32)    ,
  `descript` text,
  `createtime` date COMMENT '发布日期',
  `status` int DEFAULT 0 NOT NULL COMMENT '状态：0：发布中；1：已关闭',
  `tid` bigint COMMENT '所属消息类型id',
  `uid` bigint COMMENT '发布者id',
  `gid` bigint COMMENT '所属群组id',
  `replay_id` bigint COMMENT '如果该字段有值，说明该消息是一个回复消息，该字段表示回复的那个消息的id',

  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

#消息类型-fr_user_group
DROP TABLE IF EXISTS `fr_user_group`;
CREATE TABLE `fr_group_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fr_user_id` bigint ,
  `fr_group_id` bigint ,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;


#系统消息-fr_msgbox
DROP TABLE IF EXISTS `fr_msgbox`;
CREATE TABLE `fr_msgbox` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `send_user` varchar(32) ,
  `send_date` date,
  `if_read` int,
  `receive_user` bigint ,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;