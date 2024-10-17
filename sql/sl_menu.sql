/*
Navicat MySQL Data Transfer

Source Server         : 121.196.237.108
Source Server Version : 50744
Source Host           : 121.196.237.108:3306
Source Database       : stacklifes

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2024-10-17 21:03:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sl_menu
-- ----------------------------
DROP TABLE IF EXISTS `sl_menu`;
CREATE TABLE `sl_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '链接',
  `parent` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `icon` varchar(128) DEFAULT '' COMMENT '菜单图标',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `parent` (`parent`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sl_menu
-- ----------------------------
INSERT INTO `sl_menu` VALUES ('229', 'center', 'sys_setting', 'admin', '系统设置', '#', '0', 'fa-cogs', '1', '1', '1487598451', '1487681759');
INSERT INTO `sl_menu` VALUES ('232', 'center', 'admin_group', 'admin', '用户组管理', 'admin_group/list', '229', '', '4', '1', '1487661857', '1487661857');
INSERT INTO `sl_menu` VALUES ('233', 'center', 'password', 'admin', '修改密码', 'admin/password', '229', '', '5', '1', '1487661888', '1487661888');
INSERT INTO `sl_menu` VALUES ('257', 'center', 'menu', 'admin', '菜单设置', 'menu/list', '229', '', '0', '1', '1487750865', '1487750865');
INSERT INTO `sl_menu` VALUES ('258', 'center', 'admin', 'admin', '管理员', 'admin/list', '229', '', '0', '1', '1488445679', '1488445679');
INSERT INTO `sl_menu` VALUES ('259', 'center', 'opt_log', 'zcr', '操作日志', 'log/list', '229', '', '0', '1', '1493542152', '1493542152');
INSERT INTO `sl_menu` VALUES ('266', 'center', 'permit', 'zcr', '权限管理', 'permit/list', '229', 'fa-cogs', '5', '1', '1497860481', '1497860481');
INSERT INTO `sl_menu` VALUES ('331', 'center', 'base_setting', 'zcr', '基本设置', 'web_site/list', '229', '', '0', '1', '0', null);
INSERT INTO `sl_menu` VALUES ('346', 'center', 'lang', 'huangxiaowen', '语言设置', 'lang/list', '229', '', '0', '1', '0', null);
INSERT INTO `sl_menu` VALUES ('364', 'center', 'fail_log', 'zcr', '错误日志', 'log/logFail', '229', '', '0', '1', '1683297510', null);
INSERT INTO `sl_menu` VALUES ('365', 'center', 'article_manager', 'zcr', '文章管理', '#', '0', 'fa-align-left', '0', '1', '1686320743', null);
INSERT INTO `sl_menu` VALUES ('367', 'center', 'article', 'zcr', '文章列表', 'article/list', '365', '', '0', '1', '1686320811', null);
INSERT INTO `sl_menu` VALUES ('368', 'center', 'tags', 'zcr', '标签列表', 'tags/list', '365', '', '0', '1', '1686320883', null);
INSERT INTO `sl_menu` VALUES ('369', 'center', 'attach', 'zcr', '附件列表', 'attach/list', '365', '', '0', '1', '1686320908', null);
INSERT INTO `sl_menu` VALUES ('370', 'center', 'read', 'zcr', '阅读记录', 'read/list', '365', '', '0', '1', '1686404032', null);
INSERT INTO `sl_menu` VALUES ('371', 'center', 'comment', 'zcr', '评论记录', 'comment/list', '365', '', '0', '1', '1686404049', null);
INSERT INTO `sl_menu` VALUES ('372', 'center', 'message', 'zcr', '留言管理', 'message/list', '365', '', '0', '1', '1686473492', null);
