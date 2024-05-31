/*
Navicat MySQL Data Transfer

Source Server         : 本地5.7
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : stacklifes

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-05-31 10:16:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sl_admin
-- ----------------------------
DROP TABLE IF EXISTS `sl_admin`;
CREATE TABLE `sl_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户自增id',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` varchar(64) NOT NULL COMMENT '密码掩码',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户组id',
  `eid` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '电话',
  `department` varchar(64) DEFAULT '' COMMENT '所在部门',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建用户时间戳',
  `expiration` int(11) DEFAULT '0' COMMENT '用户过期时间戳',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '累计登陆次数',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(64) DEFAULT '' COMMENT '最后登录ip',
  `lang` varchar(255) DEFAULT NULL,
  `login_flag` varchar(16) DEFAULT '' COMMENT '登录跳转验证',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sl_admin
-- ----------------------------
INSERT INTO `sl_admin` VALUES ('377', 'zcr', 'f31f413a2c4164ae89513383a3c08ea5', 'b16574c54c98b9512edbecb8fa4f47f2', '1', null, '朱成汝', '', '', null, '0', '2147483647', '85', '1710860215', '120.230.252.60', null, '', '1');
INSERT INTO `sl_admin` VALUES ('380', 'admin', '50029fc296985a142931182b0ef3764f', 'b4fd1d2cb085390fbbadae65e07876a7', '1', null, 'admin', '', '', null, '0', '2147483647', '0', '1683297155', '183.6.88.24', null, '', '1');

-- ----------------------------
-- Table structure for sl_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `sl_admin_group`;
CREATE TABLE `sl_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组自增id',
  `mark` varchar(11) NOT NULL COMMENT '用户组标识',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `menu_permit` text COMMENT '央服权限数据',
  `menu_modules` text COMMENT '央服权限模块',
  `allow_ip` text COMMENT 'ip白名单',
  `create_time` int(11) DEFAULT '0' COMMENT '创建用户组时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '更新操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of sl_admin_group
-- ----------------------------
INSERT INTO `sl_admin_group` VALUES ('1', 'super', '超级管理员', '拥有所有权限', '[\"347\",\"348\",\"349\",\"350\",\"351\",\"352\",\"353\",\"370\",\"381\",\"382\",\"383\",\"384\",\"385\",\"386\",\"387\",\"388\"]', '[\"menu\\/*\",\"permit\\/*\",\"usergroup\\/*\",\"log\\/*\",\"website\\/*\",\"user\\/index\",\"user\\/add\",\"user\\/updatedata\",\"user\\/changestatus\",\"user\\/password\",\"lang\\/*\",\"columns\\/*\",\"article\\/*\",\"tags\\/*\",\"attach\\/*\",\"upload\\/*\",\"read\\/*\",\"comment\\/*\",\"message\\/*\"]', null, '1487580864', '1487580864');
INSERT INTO `sl_admin_group` VALUES ('131', 'test', 'test', 'test', '[\"347\",\"348\",\"349\",\"350\",\"351\",\"352\",\"353\",\"356\",\"366\",\"370\"]', '[\"menu\\/*\",\"permit\\/*\",\"usergroup\\/*\",\"log\\/*\",\"website\\/*\",\"user\\/index\",\"user\\/add\",\"user\\/updatedata\",\"user\\/changestatus\",\"user\\/password\",\"log\\/*\",\"export\\/*\",\"lang\\/*\"]', null, '1644290301', null);

-- ----------------------------
-- Table structure for sl_article
-- ----------------------------
DROP TABLE IF EXISTS `sl_article`;
CREATE TABLE `sl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `summary` text,
  `content` longtext,
  `is_hot` tinyint(4) DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `is_recom` tinyint(4) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `public_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '素材类型，1图片，2视频',
  `month` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_article
-- ----------------------------
INSERT INTO `sl_article` VALUES ('248', '371', 'linux环境PostgreSQL安装', null, null, 'nacholas', '', 'pgsql安装', '<h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">下载</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">这里只是一个版本的下载例子，一般去官网找最新文档版本的下载</p><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">wget&nbsp;<a href=\"https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.gz\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; color: rgb(65, 131, 196); background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">https://ftp.postgresql.org/pub/source/v10.3/postgresql-10.3.tar.gz</a></p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">解压&amp;安装</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">tar -xzvf postgresql-10.3.tar.gz</p><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">cd postgresql-10.3</p><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">./configure --prefix=/usr/local/pgsql</p><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">make &amp;&amp; make install</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">配置，新增一个操作pgsql的用户</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">useradd postgres</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">给该用户设置密码</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">passwd postgres</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">切换postgres用户，执行pgsql初始化（不允许root用户初始化），并指定存放数据路劲</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">/usr/local/pgsql/bin/initdb -D /home/postgres/pgdata</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">启动pgsql</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">/usr/local/pgsql/bin/pg_ctl -D /home/postgres/pgdata -l logfile start</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">创建数据库</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; margin-bottom: 0.85em; font-weight: 400; letter-spacing: 0.2px;\">/usr/local/pgsql/bin/createdb zcr</p></h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">登录数据库</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; margin-top: 0px; font-weight: 400; letter-spacing: 0.2px; margin-bottom: 0px !important;\">/usr/local/pgsql/bin/psql zcr</p></h5>', '1', '1', '1', '1', '1558886400', '1', '2019-05', '1686476393', '1708395323');
INSERT INTO `sl_article` VALUES ('249', '371', 'linux环境redis安装和使用', null, null, 'nacholas', '', 'redis安装和使用', '<h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">下载</h5><pre><code class=\"Bash\"><xmp>http://download.redis.io/releases/redis-5.0.4.tar.gz</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">解压</h5><pre><code class=\"Bash\"><xmp>tar xzvf redis-5.0.4.tar.gz</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">安装</h5><pre><code class=\"Bash\"><xmp>cd redis-5.0.4</xmp><xmp>make </xmp><xmp>cd src </xmp><xmp>make install PREFIX=/usr/local/redis</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">移动配置文件到安装目录下</h5><pre><code class=\"Bash\"><xmp>cd ../ </xmp><xmp>mkdir /usr/local/redis/etc</xmp><xmp>mv redis.conf /usr/local/redis/etc</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">配置redis为后台启动</h5><pre><code class=\"Bash\"><xmp>vi /usr/local/redis/etc/redis.conf\r\n将daemonize no 改成daemonize yes</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">设置redis端口和密码</h5><pre><code class=\"Bash\"><xmp>vi /usr/local/redis/etc/redis.conf\r\n将port 6379 改成 port 你的端口\r\n去掉requirepass注释，并设置requirepass 你的密码</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">开启redis</h5><pre><code class=\"Bash\"><xmp>/usr/local/redis/bin/redis-server /usr/local/redis/etc/redis.conf</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">关闭redis</h5><pre><code class=\"Bash\"><xmp>/usr/local/redis/bin/redis-cli shutdown</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">php操作redis</h5><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">下载</h5><pre><code class=\"Bash\"><xmp>https://github.com/phpredis/phpredis/archive/4.2.0.tar.gz</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">解压</h5><pre><code class=\"Bash\"><xmp>tar zxvf 4.2.0</xmp></code></pre><h5 style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 1em; orphans: 3; widows: 3; break-after: avoid; margin-top: 1.275em; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">安装</h5><pre><code class=\"Bash\"><xmp>cd phpredis-4.2.0/</xmp></code></pre><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; orphans: 3; widows: 3; margin-top: 0px; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">使用phpize生成配置</p><pre><code class=\"Bash\"><xmp>/usr/local/php56/bin/phpize</xmp></code></pre><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; orphans: 3; widows: 3; margin-top: 0px; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\">指定安卓路径</p><pre><code class=\"Bash\"><xmp>./configure --with-php-config=/usr/local/php56/bin/php-config </xmp><xmp>make</xmp><xmp>make install</xmp></code></pre><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 1em; font-weight: 600; letter-spacing: 0.2px; orphans: 3; widows: 3;\">加入扩展</span><br/></p><pre><code class=\"Bash\"><xmp>vim /usr/local/php56/etc/php.ini\r\nextension=\"redis.so\"</xmp></code></pre><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; orphans: 3; widows: 3; margin-top: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px; margin-bottom: 0px !important;\">重启Nginx和PHP</p><p><br/></p>', '1', '1', '1', '0', '1655827200', '1', '2022-06', '1686476581', '1709231036');
INSERT INTO `sl_article` VALUES ('250', '371', 'linux环境安装并使用composer', null, null, 'nacholas', '', '安装并使用composer', '<p>安装composer</p><pre><code class=\"PHP\"><xmp>/usr/local/php/bin/php -r \"copy(\'https://install.phpcomposer.com/installer\', \'composer-setup.php\');\"\r\n\r\n/usr/local/php/bin/php composer-setup.php\r\n\r\n/usr/local/php/bin/php -r \"unlink(\'composer-setup.php\');\"</xmp></code></pre><p>全局设置composer</p><pre><code class=\"Bash\"><xmp>sudo mv composer.phar /usr/local/bin/composer</xmp></code></pre><p>建立PHP软连接(如果有需要)</p><pre><code class=\"Bash\"><xmp>ln -s /usr/local/php56/bin/php /usr/local/bin/php</xmp></code></pre><p>查看composer版本</p><pre><code class=\"Bash\"><xmp>composer --version</xmp></code></pre><p>切换composer为国内镜像(如果报不能用root用户去使用，可以忽略，只是一个提醒，或者创建一个用户去使用composer，useradd zhuzhu)</p><pre><code class=\"Bash\"><xmp>composer config -g repo.packagist composer https://packagist.phpcomposer.com</xmp></code></pre><p>使用composer安装Laravel</p><pre><code class=\"Bash\"><xmp>composer create-project --prefer-dist laravel/test_project</xmp></code></pre><p><br/></p>', '1', '1', '1', '0', '1591632000', '1', '2020-06', '1686586760', '1704901821');
INSERT INTO `sl_article` VALUES ('251', '371', ' linux环境安装Python3以上版本', null, null, 'nacholas', '', ' linux下安装Python3以上版本', '<p>先查看本机python版本</p><p>python --version<br/><br/>安装Python3以上版本<br/><br/>解压：tar zxvf Python-3.3.7.tgz<br/>-c ：create 建立压缩档案的参数；<br/>-x ： 解压缩压缩档案的参数；<br/>-z ： 是否需要用gzip压缩；<br/>-v： 压缩的过程中显示档案；<br/>-f： 置顶文档名，在f后面立即接文件名，不能再加参数<br/><br/>安装<br/>./configure --prefix=/usr/local/python3<br/>make &amp;&amp; make install<br/>创建软连接：ln -s /usr/local/python3/bin/python3 /usr/bin/python3<br/><br/>安装setuptool：https://pypi.python.org/pypi/setuptools<br/>zip解压：unzip setuptools-36.6.0.zip <br/>python3 setup.py install<br/><br/>安卓pip3：https://pypi.python.org/pypi/pip<br/>解压：tar zxvf pip-9.0.1.tar.gz  <br/>python3 setup.py install<br/>创建pip3软连接：ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3<br/><br/>安装virtualenv<br/>pip3 install virtualenv<br/>创建软连接：ln -s /usr/local/python3/bin/virtualenv /usr/bin/virtualenv3<br/>创建虚拟环境：virtualenv3 sh_sdk<br/>激活进入到虚拟环境：source sh_sdk/bin/activate<br/><br/>python3已经默认安装了pyvenv-3.3环境，所以只需要创建一下软连接就可以用了<br/>ln -s /usr/local/python3/bin/pyvenv-3.3 /usr/bin/pyvenv3<br/>创建虚拟环境：pyvenv3 test_project<br/>激活进入到虚拟环境：source test_project/bin/activate&nbsp;</p>', '1', '1', '1', '0', '1527523200', '1', '2018-05', '1686587114', '1705238474');
INSERT INTO `sl_article` VALUES ('252', '375', 'Nginx在linux下的安装和简单配置使用', null, null, 'nacholas', '', '', '<p>Nginx安装<br/><br/>安装依赖包，这里最好也编译安装：yum -y install pcre-devel openssl openssl-devel<br/><br/>如果没有gcc，安装gcc：yum -y install gcc<br/><br/>下载：wget http://nginx.org/download/nginx-1.9.3.tar.gz <br/><br/>解压：tar -zxvf nginx-1.9.3.tar.gz <br/><br/>切换目录：cd nginx-1.9.3/<br/><br/>配置：./configure <br/><br/>编译，安装：make &amp;&amp; make install<br/><br/>查看安装目录：whereis nginx<br/><br/>查看版本：/usr/local/nginx/sbin/nginx -v<br/><br/>查看帮助：/usr/local/nginx/sbin/nginx -h<br/><br/>启动：/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf<br/><br/>重启：/usr/local/nginx/sbin/nginx -s reload<br/><br/>停止：/usr/local/nginx/sbin/nginx -s stop<br/><br/>查看进程：ps -ef|grep nginx <br/><br/>配置Nginx<br/><br/>新建存放项目目录：/data/test/html,在此目录下新建文件index.html<br/><br/>打开Nginx配置文件：<br/><br/>vim /usr/local/nginx/conf/nginx.conf，配置如下：</p><p><img src=\"http://cdn.iamzcr.com//article/2024011421044696500.png\" style=\"max-width:100%;\"/><br/><br/>注意这里有一行：include vhost/test.conf ;表示还包含了test.conf的配置<br/><br/>vim /usr/local/nginx/conf/vhost/test.conf,加入如下配置：</p><p><img src=\"http://cdn.iamzcr.com//article/202401142104286935.png\" style=\"max-width:100%;\"/><br/><br/>重启Nginx，浏览器访问192.168.16.71:8080，查看是否能访问到index.html的内容<br/><br/>防火墙设置<br/><br/>安装和启动了Nginx之后，有可能还访问不了，还需要设置防火墙，CentOS7.0以上默认firewall为防火墙配置，已经没有iptables这种方式的防火墙设置了，所以我们这里改为iptables配置。<br/><br/>停止firewall：systemctl stop firewalld.service <br/><br/>禁止firewall开机启动：systemctl disable firewalld.service <br/><br/>查看默认防火墙状态（关闭后显示not running，开启后显示running）：firewall-cmd --state<br/><br/>配置iptables，安装iptables服务：yum install iptables-services<br/><br/>编辑防火墙配置文件：vim /etc/sysconfig/iptables<br/><br/>加入下面的几行配置，开放8080,443，80端口，22是已经默认存在的：<br/><br/>-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -jACCEPT<br/><br/>-A INPUT -p tcp -m state --state NEW -m tcp --dport 8080-j ACCEPT<br/><br/>-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT<br/><br/>22端口是供ssh访问的，80，8080端口是http服务访问的，443端口是https服务访问。<br/><br/>保存，最后重启防火墙使配置生效<br/><br/>systemctl restart iptables.service<br/><br/>设置防火墙开机启动<br/><br/>systemctl enable iptables.service<br/><br/>再去访问192.168.16.71:8080，就能看到index.html的内容了<br/></p>', '1', '1', '1', '0', '1496592000', '1', '2017-06', '1686633162', '1705237743');
INSERT INTO `sl_article` VALUES ('253', '375', 'Nginx反向代理实现负载均衡', null, null, 'nacholas', '', '', '<h5 style=\"font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 1rem; margin-bottom: 1rem; font-size: 1em; position: relative; cursor: text; width: inherit; white-space-collapse: preserve;\"><p>反向代理<br/><br/>前面一篇文章介绍了Nginx的简单配置和使用，这篇文章介绍一下，如何通过Nginx的反向代理实现负载均衡。<br/><br/>反向代理：当我们访问一个网站的时候，看起来好像是访问了某个域名下面的ip文件，但是实际上访问到的可能被指向了另一个地址，这是我们不知道的，其实这种就是服务器的反向代理，我们自个本身感知不到的。<br/><br/>正向代理：使用过vpn的朋友都知道，我们访问外网的时候，需要设置代理，这种情况，我们访问google的时候，我们知道实际上是通过哪个管道去访问的，也就是被我们所感知的，这种就是一个正向代理。<br/><br/>负载均衡<br/><br/>简单而言就是当有2台或以上服务器时，根据规则随机的将请求分发到指定的服务器上处理，负载均衡配置一般都需要同时配置反向代理，通过反向代理跳转到负载均衡。而Nginx目前自带3种负载均衡策略，还有2种常用的第三方策略，下面的实验只是在一台虚拟机上实现负载均衡，原理和在多台上面是一样的。<br/><br/>实现过程<br/><br/>搭建Nginx环境<br/><br/>看这里：<a href=\"http://iamzcr.com/article/detail.html?id=252\" target=\"_blank\">Nginx在linux下的安装和简单配置使用</a><br/><br/>配置Nginx：nginx.conf配置</p><p><img src=\"http://cdn.iamzcr.com//article/2024011421160269832.png\" style=\"max-width:100%;\"/><br/><br/>在vhost目录下配置两台虚拟机，这里分别命名伟test.conf，test1.conf：<br/><br/><img src=\"http://cdn.iamzcr.com//article/202401142116237882.png\" style=\"max-width:100%;\"/><br/><br/>配置test.conf，监听的端口为8080，root目录为/data/test/html,，在该目录下生成index.html文件，文件内容直接输出：nginx:8080;<br/><br/>同理，test1.conf，监听的端口为8081，root目录为/data/test1/html，在该目录下生成index.html文件，文件内容直接输出：nginx:8081。<br/><br/>配置如下：</p><p><br/><img src=\"http://cdn.iamzcr.com//article/2024011421165068726.png\" style=\"max-width:100%;\"/><br/><br/>重启Nginx：<br/><br/>/usr/local/nginx/sbin/nginx -s reload<br/><br/>浏览器访问： 192.168.18.87 (即你虚拟机所在的ip地址)，继续刷新访问，你会看到，Nginx会把你的访问分配到不一样的web目录下，这就是一个简单的Nginx通过反向代理实现负载均衡。</p><p><img src=\"http://cdn.iamzcr.com//article/202401142117151720.png\" style=\"max-width:100%;\"/></p><p><img src=\"http://cdn.iamzcr.com//article/2024011421172614066.png\" style=\"max-width:100%;\"/><br/><br/>总结<br/><br/>Nginx负载均衡关键代码在于这里：<br/></p><pre><code><xmp> upstream testnginx {\r\n      server 192.168.18.87:8080 weight=5;\r\n      server 192.168.18.87:8081 weight=5;\r\n}\r\nserver {\r\n      listen       80;\r\n      server_name  192.168.16.87;\r\n      client_max_body_size 1024M;\r\n    \r\n      location / {\r\n          proxy_pass http://testnginx;\r\n          proxy_set_header Host $host:$server_port;\r\n          }\r\n}\r\n</xmp></code></pre><p>我们通过访问192.168.16.87，实际上Nginx会根据设置的权重(weight参数就是表示权重的意思)去选择访问8080,8081这两个端口，如果你有两台机器，就是访问两台机器了，当8081这端口挂了，也就是说8081这台机器挂了，实际上不会影响到用户的正常访问，Nginx会让用户跑到8080这个端口或者这台机器上去。理论上和DNS轮询方式实现的负载均衡是一个道理的，不同的是DNS轮序没有权重的设置。<br/><br/>这种只是简单的模式，这种方式有个问题，那就是下一个请求来的时候请求可能分发到另外一个服务器，当我们的程序不是无状态的时候（采用了session保存数据），这时候就有一个很大的很问题了，比如把登录信息保存到了session中，那么跳转到另外一台服务器的时候就需要重新登录了，所以很多时候我们需要一个客户只访问一个服务器，那么就需要用iphash了，iphash的每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。配置如下：<br/></p><pre><code><xmp>upstream testnginx {\r\n    ip_hash;\r\n    server 192.168.18.87:8080 weight=5;\r\n    server 192.168.18.87:8081 weight=5;\r\n}</xmp></code></pre><p><br/></p></h5><h5 style=\"font-size: 1em; position: relative; margin-top: 1rem; margin-bottom: 1rem; line-height: 1.4; cursor: text; width: inherit; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, &quot;Clear Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; white-space-collapse: preserve;\"><p><br style=\"color: rgb(103, 106, 108); font-family: &quot;open sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-weight: 400; white-space-collapse: collapse;\"/></p></h5>', '1', '1', '1', '0', '1560873600', '1', '2019-06', '1686633455', '1705238353');
INSERT INTO `sl_article` VALUES ('254', '370', 'Linux下编译安装搭建PHP环境', null, null, 'nacholas', '', '', '<p>官网下载对应的安装包<span style=\"color: inherit;\">。</span></p><p><a href=\"https://www.php.net/downloads.php\" target=\"_blank\">PHP官网下载</a><br/></p><pre><code class=\"Bash\"><xmp>wget https://www.php.net/distributions/php-7.4.2.tar.gz --no-check-certificate</xmp></code></pre><p>解压并进入目录<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>tar -xzvf php-7.4.2.tar.gz\r\ncd php-7.4.2</xmp></code></pre><p>生成<span style=\"font-size: 1em; color: inherit;\">configure</span><span style=\"font-size: 1em; color: inherit;\">配置文件</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>./configure \\\r\n--prefix=/usr/local/php \\\r\n--exec-prefix=/usr/local/php \\\r\n--bindir=/usr/local/php/bin \\\r\n--sbindir=/usr/local/php/sbin \\\r\n--includedir=/usr/local/php/include \\\r\n--libdir=/usr/local/php/lib/php \\\r\n--mandir=/usr/local/php/php/man \\\r\n--with-config-file-path=/usr/local/php/etc \\\r\n--with-openssl \\\r\n--enable-mbstring \\\r\n--with-pdo-mysql \\\r\n--enable-fpm</xmp></code></pre><p>编译安装<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>make && make install</xmp></code></pre><p>查看安装版本<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>/usr/local/php/bin/php --version</xmp></code></pre><p>在<span style=\"color: rgb(51, 51, 51);\">php-7.4.2复制php.ini到配置目录</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>cp php.ini-production /usr/local/php/etc/php.ini</xmp></code></pre><p><span style=\"color: inherit;\">在</span><span style=\"color: rgb(51, 51, 51);\">php-7.4.2复制</span>目录下的 sapi/fpm/init.d.php-fpm 文件拷贝到系统配置 /etc/init.d 目录下，并重命名为 php-fpm，并且给可执行权限<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm </xmp><xmp>chmod +x /etc/init.d/php-fpm</xmp></code></pre><p>添加<span style=\"font-size: 1em; color: inherit;\">php-fpm 配置文件，在</span><span style=\"font-size: 1em; color: inherit;\">php安装</span><span style=\"font-size: 1em; color: inherit;\">目录下</span><span style=\"font-size: 1em; color: inherit;\">的 /usr/local/php/etc/php-fpm.conf.default 文件拷贝到同目录下，并重命名为 php-fpm.conf</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf</xmp></code></pre><p>添加 www.conf 配置文件，<span style=\"color: inherit;\">将php安装目录下的 /usr/local/php/etc/php-fpm.d/www.conf.default 文件拷贝同目录下并重命名为 www.conf</span><span style=\"color: inherit;\">。</span><br/></p><pre><code class=\"Bash\"><xmp>cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf</xmp></code></pre><p>添加php安装目录到系统环境变量，<span style=\"font-size: 1em; color: inherit;\">创建并打开文件php.sh</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>vim /etc/profile.d/php.sh \r\nexport PATH=$PATH:/usr/local/php/bin/:/usr/local/php/sbin/ </xmp></code></pre><p>使用source立即生效刚刚添加的php环境变量&nbsp;<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>source /etc/profile.d/php.sh </xmp></code></pre><p>启动php</p><pre><code class=\"Bash\"><xmp>service php-fpm start</xmp></code></pre><p>查看php进程和<span style=\"font-size: 1em; color: inherit;\">fastcgi</span><span style=\"font-size: 1em; color: inherit;\">监听端口(默认是9000)</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>查看php进程\r\n ps aux|grep php\r\n查看fastcgi监听的端口\r\nnetstat -tnl |grep 9000</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/202401102340374227.png\" style=\"max-width:100%;\"/><br/></p><p>设置开机启动PHP服务<span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>配置系统配置目录下的 php-fpm 文件为可执行权限\r\nchmod +x /etc/init.d/php-fpm\r\n将系统配置目录下的 `php-fpm` 添加到 `系统服务`\r\nchkconfig --add php-fpm\r\n设置 `php-fpm` `系统服务` 为开机启动\r\nchkconfig php-fpm on</xmp></code></pre><p>至此，PHP服务安装完成。</p>', '1', '1', '1', '0', '1516291200', '1', '2018-01', '1704822290', '1708284415');
INSERT INTO `sl_article` VALUES ('255', '371', 'Linux下二进制方式安装搭建MYSQL环境', null, null, 'nacholas', '', '', '<p>下载mysql</p><p><a href=\"https://dev.mysql.com/downloads/mysql/5.7.html#downloads\" target=\"_blank\">mysql官网下载</a></p><pre><code class=\"Bash\"><xmp>cd /usr/local/\r\nwget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.37-linux-glibc2.12-x86_64.tar</xmp></code></pre><p>检测系统是否自带安装 MySQL和mariadb。</p><pre><code class=\"Bash\"><xmp>rpm -qa | grep mysql\r\nrpm -qa | grep mariadb</xmp></code></pre><p>如果出现上边返回结果，证明存在自带版本，要先进行卸载<br/></p><pre><code class=\"Bash\"><xmp>// 普通删除模式。\r\nrpm -e mysql-libs-5.1.52-1.el6_0.1.x86_64　\r\n// 强力删除模式，使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除。\r\nrpm -e --nodeps mysql-libs-5.1.52-1.el6_0.1.x86_64　　\r\nrpm -e --nodeps mariadb-libs-5.5.56-2.el7.x86_64</xmp></code></pre><p>解压mysql安装包</p><pre><code class=\"Bash\"><xmp>tar -xvf mysql-5.7.37-linux-glibc2.12-x86_64.tar</xmp></code></pre><p>在某些mysql版本中，<span style=\"font-size: 1em; color: inherit;\">第一次解压会得到两个版本,还有一个是test，这里直接解压非test的。</span></p><pre><code class=\"Bash\"><xmp>tar -zxvf mysql-5.7.37-linux-glibc2.12-x86_64.tar.gz</xmp></code></pre><p>重命名解压后的目录</p><pre><code class=\"Bash\"><xmp>mv mysql-5.7.37-linux-glibc2.12-x86_64 mysql</xmp></code></pre><p>创建mysql用户组和用户，<span style=\"color: inherit;\">必须创建mysql用户，因为mysql的初始化需要。</span><br/></p><pre><code class=\"Bash\"><xmp>groupadd mysql\r\nuseradd -r -g mysql mysql</xmp></code></pre><p>创建数据目录并赋予权限<br/></p><pre><code class=\"Bash\"><xmp>mkdir -p /data/mysql #创建目录\r\nchown mysql:mysql -R /data/mysql #赋予权限</xmp></code></pre>', '1', '1', '1', '0', '1703952000', '0', '2023-12', '1704822434', '1706949291');
INSERT INTO `sl_article` VALUES ('256', '374', '设计一个的发行SDK系统-核心业务', null, null, 'nacholas', '', '设计一个的发行SDK系统', '<p>设计一个基础发行SDK系统，首先要先知道整个游戏业务是怎样的。</p><p>登录业务：</p><p>1，玩家通过点击广告下载游戏，点击启动游戏。</p><p>2，研发客户端向SDK客户端获取token等信息。</p><p>3，SDK客户端向SDK服务端获取token等信息。</p><p>4，SDK服务端返回token等信息给SDK客户端。</p><p>5，SDK客户端通过提供方法给研发客户端调用，获取到<span style=\"color: inherit;\">token信息</span><span style=\"font-size: 1em; color: inherit;\">。</span></p><p>6，研发客户端发送token等信息到研发服务端。</p><p>7，研发服务端拿到token等信息到SDK服务端做校验。</p><p>8，SDK服务端返回验证信息给研发服务端。</p><p>9，研发服务端得到SDK验证信息，判断状态，给研发客户端返回选服界面的信息。</p><p>10，玩家选择服务器进入游戏。</p><p>上面就是一个市场上通用的游戏登录流程，作为SDK服务端，我们需要关心的是SDK客户端和<span style=\"color: inherit;\">SDK服务端的通信，研发服务端和</span><span style=\"color: inherit;\">SDK服务端之间的校验通信。</span></p><p><span style=\"font-size: 1em; color: inherit;\">充值业务：</span><span style=\"color: inherit; font-family: inherit; font-size: 1.17em;\"></span></p><p>1、研发客户端点击游戏充值档位发送给研发服务端。</p><p>2、研发服务端生成订单号给研发客户端返回。</p><p>3、研发客户端拿到研发订单号，调用SDK客户端拉起充值。</p><p>4、SDK客户端发送请求到SDK服务端，SDK服务端拉起微信或者支付宝等支付。</p><p>5、玩家支付后，微信或者支付宝等支付回调给SDK服务端。</p><p>6、SDK服务端收到微信、支付宝等支付回调后，经过一系列验证后，给研发服务端发送支付回调信息。</p><p>7、研发服务端验证后给玩家发送相应的充值奖励，充值完成。</p><p>上面就是一个市场上通用的游戏充值流程，作为SDK服务端，我们需要4，5，6三个环节，也就是和SDK之间的通信，和第三方支付的通信，还有和研发服务端之间的通信<span style=\"color: inherit;\">。</span><br/></p><p>至此一个简单完整的SDK登录充值业务完成了，后面分包、投放系统都依赖于该业务去做扩展，后续会逐步开始设计。</p><p><br/></p>', '1', '1', '1', '0', '1685980800', '1', '2023-06', '1704865088', '1708247999');
INSERT INTO `sl_article` VALUES ('257', '370', '构建自己的小型PHP框架(一)', null, null, 'nacholas', '', '我们日常PHP开发中，如果不想用第三方开源框架，可以利用composer构建自己的PHP开发框架', '<p>创建框架目录</p><pre><code class=\"Bash\"><xmp>mkdir framework</xmp><xmp>cd framework</xmp></code></pre><p>利用composer构建框架环境，相关composer使用，可以查看<a href=\"http://iamzcr.com/article/detail.html?id=250\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">linux环境安装并使用composer</a></p><pre><code class=\"Bash\"><xmp>/usr/local/php7.3.10/bin/php composer.phar init</xmp></code></pre><p>安装路由库</p><p style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: 16px; orphans: 3; widows: 3; margin-top: 0px; margin-bottom: 0.85em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: 0.2px;\"><a href=\"https://github.com/NoahBuscher/Macaw\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-size: inherit; color: rgb(65, 131, 196); background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">https://github.com/NoahBuscher/Macaw</a></p><pre><code class=\"Bash\"><xmp>/usr/local/php7.3.10/bin/php composer.phar require noahbuscher/macaw:dev-master</xmp></code></pre><p>定义入口目录和入口文件</p><pre><code class=\"Bash\"><xmp>mkdir public\r\ntouch index.php</xmp></code></pre><p>定义配置目录和路由配置</p><pre><code class=\"Bash\"><xmp>mkdir config\r\ntouch routes.php</xmp></code></pre><p>编辑入口文件index.php，引入composer自动加载类库和加载路由配置文件</p><pre><code class=\"Bash\"><xmp><?php\r\n// Autoload 自动载入\r\nrequire \'../vendor/autoload.php\';\r\n// 路由配置\r\nrequire \'../config/routes.php\';\r\n?></xmp></code></pre><p>编辑路由配置，定义访问入口</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nuse NoahBuscher\\Macaw\\Macaw;\r\n\r\nMacaw::get(\'/\', function() {\r\n  echo \"success\";\r\n});\r\n\r\nMacaw::get(\'(:all)\', function($error) {\r\n  echo \'routes fail\'.$error;\r\n});\r\n\r\nMacaw::dispatch();\r\n?></xmp></code></pre><p>配置Nginx入口指向public框架入口，访问对应端口，如127.0.0.1:4016，结果会是success，一个简单的框架搭建完成。</p>', '1', '1', '1', '0', '1638806400', '1', '2021-12', '1704901799', '1708248292');
INSERT INTO `sl_article` VALUES ('258', '370', '构建自己的小型PHP框架(二)', null, null, 'nacholas', '', '', '<p>前面框架已经可以通过路由访问了，我们总不可能把业务写在各个路由的回调里面吧，所以需要按一般框架实现MVC.</p><p><span style=\"font-size: 1em; color: inherit;\">新增目录application,</span><span style=\"font-size: 1em; color: inherit;\">application目录下新建model，controller，view，开始我们的MVC</span></p><p>进入controller，新增类CommonController</p><pre><code class=\"Bash\"><xmp><?php\r\nnamespace Application\\controller;\r\n\r\nclass CommonController\r\n{\r\n    public $params = [];\r\n    public function __construct()\r\n    {\r\n        $this->params = $_POST;\r\n    }\r\n}\r\n?></xmp></code></pre><p>新增类IndexController继承CommmonController</p><pre><code class=\"Bash\"><xmp>namespace Application\\controller;\r\n\r\nclass IndexController extends CommonController\r\n{\r\n    public function Welcome()\r\n    {\r\n        echo \"hello\";\r\n    }\r\n}\r\n\r\n?></xmp></code></pre><p>打开config/routes.php，配置路由指向Controller</p><p>原来的路由</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nuse NoahBuscher\\Macaw\\Macaw;\r\n\r\nMacaw::get(\'/\', function() {\r\n    echo \"success\";\r\n});\r\n\r\nMacaw::get(\'(:all)\', function($error) {\r\n    echo \'routes fail\'.$error;\r\n});\r\n\r\nMacaw::dispatch();</xmp></code></pre><p>配置后的路由<span style=\"background-color: rgb(241, 241, 241); color: inherit; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: inherit; white-space-collapse: preserve;\"><!--?php</span--></span></p><pre><code class=\"Bash\"><xmp>\r\nuse NoahBuscher\\Macaw\\Macaw;\r\n\r\nMacaw::get(\'index/welcome\', \'Application\\controller\\IndexController@Index\');\r\n\r\nMacaw::get(\'(:all)\', function ($fu) {\r\n    echo \'invalid routes\' . $fu;\r\n});\r\n\r\nMacaw::dispatch();</xmp></code></pre><p>访问下http://127.0.0.14016/index/welcome，结果<br/></p><pre><code class=\"Bash\"><xmp>Class \'Application\\controller\\IndexController\' not found</xmp></code></pre><p>为什么呢，原来我们框架还没配置PSR-4规范（也可以用PSR-0规范去处理，但是不推荐）<br/><br/>打开composer.json，配置命名空间指向目录</p><p>修改前</p><pre><code class=\"Bash\"><xmp>{\r\n    \"name\": \"root/sh_framework\",\r\n    \"require\": {\r\n        \"noahbuscher/macaw\": \"dev-master\"\r\n    }\r\n}</xmp></code></pre><p>修改后</p><pre><code class=\"Bash\"><xmp>{\r\n    \"name\": \"root/framework\",\r\n    \"require\": {\r\n        \"noahbuscher/macaw\": \"dev-master\"\r\n    },\r\n    \"autoload\": {\r\n        \"psr-4\": {\r\n            \"Application\\\\\": \"application/\"\r\n        }\r\n    }\r\n}</xmp></code></pre><p><br/></p><p>运行</p><pre><code class=\"Bash\"><xmp>/usr/local/bin/php composer.phar dump-autoload</xmp></code></pre><p><br/></p><p>这个时候，就把我们的命名空间指向到对应的目录里面了，继续访问上面的路由看看会不会输出：<span style=\"color: rgb(51, 51, 51);\">hello</span></p><p>这个时候，我们的model也可以使用了，一个简单的api框架已完成。</p><p>我们的view可以直接PHP输出，如在view目录下新建welcome.php</p><pre><code class=\"Bash\"><xmp><?php\r\n    echo \"这是一个view\";\r\n?></xmp></code></pre><p>修改下IndexController的welcome方法，require你的welcome.php</p><pre><code class=\"Bash\"><xmp><?php\r\nnamespace Application\\controller;\r\n\r\nclass IndexController extends CommonController\r\n{\r\n    public function Welcome()\r\n    {\r\n        require dirname(__FILE__).\'/../view/wecome.php\';\r\n    }\r\n}\r\n\r\n?>\r\n结果会输出：这是一个view</xmp></code></pre>', '1', '1', '1', '0', '1638892800', '1', '2021-12', '1704901869', '1708248302');
INSERT INTO `sl_article` VALUES ('259', '370', '构建自己的小型PHP框架(三)', null, null, 'nacholas', '', '', '<p>利用composer引入各种你需要的类库</p><p>当我们需要操作mongodb扩展的时候</p><pre><code class=\"Bash\"><xmp>/usr/local/php/bin/php composer.phar require mongodb/mongodb</xmp></code></pre><p>当我们需要http请求的时候</p><pre><code class=\"Bash\"><xmp>/usr/local/php/bin/php composer.phar require guzzlehttp/guzzle</xmp></code></pre><p><span style=\"color: inherit;\">当我们需要</span>操作redis<span style=\"color: inherit;\">的时候</span></p><pre><code class=\"Bash\"><xmp>/usr/local/php/bin/php composer.phar require /usr/local/php/bin/php composer.phar require guzzlehttp/guzzle</xmp></code></pre><p>至此，一个简单的PHP框架搭建完成。可以继续在这基础上完善自己额外需要的功能，比如加入中间件，加入验证等</p>', '1', '1', '1', '0', '1638979200', '1', '2021-12', '1704901926', '1708248340');
INSERT INTO `sl_article` VALUES ('260', '374', '设计一个游戏研发数据管理系统(一)', null, null, 'nacholas', '', '', '<p>coming soon.....</p>', '1', '1', '1', '0', '1703952000', '0', '2023-12', '1704956748', null);
INSERT INTO `sl_article` VALUES ('261', '371', 'ClickHouse安装和基本使用', null, null, 'nacholas', '', '', '<p>由于发行的买量系统，投放的点击数历史数据已经将近1T了，用MYSQL存储已经不再适合了，考虑到业务情况，只需要匹配最后七天的投放数据，因为clickhouse运行语句的写法和sql写法比较像，对于团队的学习成本比较低，所以<span style=\"color: inherit;\">把历史数据放到clickhouse里面去。这里简单记录下clickhouse的yum安装和简单的使用，有条件可以选择编译安装。</span></p><p>yum安装<span style=\"font-size: 1em; color: inherit;\">clickhouse</span></p><pre><code class=\"Bash\"><xmp>依赖安装\r\nsudo yum install -y yum-utils\r\n切换\r\n需要添加官方存储库\r\nsudo yum-config-manager --add-repo https://packages.clickhouse.com/rpm/clickhouse.repo\r\n安装\r\nsudo yum install -y clickhouse-server clickhouse-client</xmp></code></pre><p>启动clickhouse</p><p>由于clickhouse默认监听的tcp端口是9000，可能会和PHP端口冲突，所以我们修改配置文件</p><pre><code class=\"Bash\"><xmp>vim /etc/clickhouse-server/config.xml</xmp></code></pre><p>找到tcp链接端口，修改为9001，如下</p><p><img src=\"http://cdn.iamzcr.com//article/202401151221171393.png\" style=\"max-width:100%;\"/><br/></p><p>启动，<span style=\"font-size: 1em; color: inherit;\">开发过程中，建议手动启动，可以看到日志的输出</span></p><pre><code class=\"Bash\"><xmp>clickhouse-server --config-file=/etc/clickhouse-server/config.xml</xmp></code></pre><p>此时服务已启动，使用客户端登录操作clickhouse，运行下面命令</p><pre><code class=\"Bash\"><xmp> clickhouse-client --host 127.0.0.1 --port 9001</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024011512272180244.png\" style=\"max-width:100%;\"/><br/></p><p>此时已登录了clickhouse客户端了，执行一些简单的查询语句，例如查看数据库，show databases</p><p><img src=\"http://cdn.iamzcr.com//article/2024011512291046836.png\" style=\"max-width:100%;\"/><br/></p>', '1', '1', '1', '0', '1701360000', '1', '2023-12', '1705292614', '1706684509');
INSERT INTO `sl_article` VALUES ('262', '376', 'ClickHouse表引擎-ReplacingMergeTree ', null, null, 'nacholas', '', '', '<p>当我们某些表出现重复数据的时候，会影响到统计，这是这时候需要表引擎<span style=\"font-size: 1em; color: inherit;\">ReplacingMergeTree实现去重，用pt_order_num作为去重字段，</span><span style=\"font-size: 1em; color: inherit;\">可以加入在查询的时候加入final关键字来实现去重，创建一个</span><span style=\"font-size: 1em; color: inherit;\">log_test_merge</span><span style=\"font-size: 1em; color: inherit;\">表</span></p><pre><code class=\"Bash\"><xmp>CREATE TABLE log_test_merge\r\n(\r\n    id Int64,\r\n    uid Int64,\r\n    pt_order_num String\r\n) ENGINE = ReplacingMergeTree()\r\nORDER BY pt_order_num</xmp></code></pre><p>插入一些数据</p><pre><code class=\"Bash\"><xmp>INSERT INTO log_test_merge (id, uid, pt_order_num)\r\nVALUES\r\n    (1, 2, \'7777\'),\r\n    (1, 2, \'7777\'),\r\n    (1, 2, \'8888\'),\r\n    (1, 2, \'8888\'),\r\n    (1, 2, \'9999\'),\r\n    (1, 2, \'9999\'),</xmp></code></pre><p>执行不带final的查询</p><pre><code class=\"Bash\"><xmp>SELECT * FROM log_test_merge;</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024020121064217009.png\" style=\"max-width:100%;\"/><br/></p><p>发现结果，并不是预想的结果，明明插入了六个记录，出来只有三个，这是为什么呢，实际上是因为<span style=\"color: inherit;\">ReplacingMergeTree表引擎在你插入过程中，如果存在重复数据的情况下，会自动去重。</span></p><p><span style=\"color: inherit;\">继续执行上面的插入，然后继续查询</span></p><p><img src=\"http://cdn.iamzcr.com//article/2024020121091956517.png\" style=\"max-width:100%;\"/><span style=\"color: inherit;\"><br/></span></p><p>这个时候，为什么第二次的插入的时候，库里面存在有记录，为什么没去重的，原因是<span style=\"color: inherit;\">ReplacingMergeTree</span><span style=\"color: inherit;\">表引擎</span><span style=\"color: inherit; font-size: 1em;\">数据的去重只会在数据合并期间进行，合并会在后台一个不确定的时间进行。所以如果想要去重,要不就等clickhouse处理完，要不就候查询的时候要加入FINAL关键字</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>SELECT * FROM log_test_merge FINAL;</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024020121130464002.png\" style=\"max-width:100%;\"/><br/></p><p>当然，还有一个办法，就是优化表，调用<span style=\"font-size: 1em; color: inherit;\">OPTIMIZE语句，强行合并，数据重组</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>OPTIMIZE TABLE log_test_merge FINAL</xmp></code></pre><p>在执行查询</p><pre><code class=\"Bash\"><xmp>SELECT * FROM log_test_merge;</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024020121172265555.png\" style=\"max-width:100%;\"/><br/></p><p><span style=\"color: inherit; font-size: 1em;\">数据已经被合并了，但是要谨慎使用</span><span style=\"font-size: 1em; color: inherit;\">OPTIMIZE，因为会引发大量的数据读写，所以一般需要找个时间合并数据即可。</span></p>', '1', '1', '1', '0', '1701500551', '1', '2023-12', '1706684572', '1706860168');
INSERT INTO `sl_article` VALUES ('263', '376', 'ClickHouse的分区操作', null, null, 'nacholas', '', '', '<p>ClickHouse提供的对数据分区管理的功能，某些情况数据量特别大，比如说发行投放广告的点击数，这部分数据就特别大，我们可以考虑按月份对数据进行分区，使用分区，可以更有效的管理和维护数据。例如，创建一个表log_test，按插入时间的年月进行分区。</p><pre><code class=\"Bash\"><xmp>CREATE TABLE log_test\r\n(\r\n    id Int64,\r\n    uid Int64,\r\n    create_time DateTime\r\n)\r\nENGINE = MergeTree()\r\nORDER BY create_time\r\nPARTITION BY toYYYYMM(create_time)</xmp></code></pre><p>插入一些数据。</p><pre><code class=\"Bash\"><xmp>INSERT INTO log_test \r\nVALUES\r\n (1,20001,1698768000),\r\n (2,20002,1698768000),\r\n (3,20003,1698768000),\r\n (4,20004,1698768000),</xmp><xmp> (1,20001,1701360000),\r\n (2,20002,1701360000),\r\n (3,20003,1701360000),\r\n (4,20004,1701360000);</xmp></code></pre><p>插入之后，查看分区的信息。</p><pre><code class=\"Bash\"><xmp>SELECT partition, name, path, rows, bytes\r\nFROM system.parts\r\nWHERE database = \'你的数据库\'  AND table = \'log_test\'</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024020217455116430.png\" style=\"max-width:100%;\"/><br/></p><p>可以看到，clickhouse已经按我们设定的分区格式分区了，继续插入同样的数据，再次查看分区。</p><p><img src=\"http://cdn.iamzcr.com//article/2024020217464147656.png\" style=\"max-width:100%;\"/><br/></p><p>为什么同样的分区，不合并在一起呢，其实clickhouse的分区合并和之前说的数据去重机制是一样的，根据参数会在适当时机去合并认为要合并的分区，如果是因为精度问题，clickhouse会按照一定的策略去合并，下面自动合并后结果，rows的总行数不变，但是分区只剩下两个分区了。</p><p><img src=\"http://cdn.iamzcr.com//article/2024020300393648785.png\" style=\"font-size: 1em; color: inherit; max-width: 100%;\"/></p><p>当我们插入的数据之后，如果想要按照分区来查找数据。</p><pre><code class=\"Bash\"><xmp>SELECT * FROM log_test WHERE toYYYYMM(create_time) =\'202311\'</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024020217552082914.png\" style=\"max-width:100%;\"/><br/></p><p>clickhouse分区操作，比如说分区时机，分区过程，有时候还需要和配置配合完成。深入了解，可以查看<span style=\"font-size: 1em; color: inherit;\">参考文档:</span></p><p><a href=\"https://clickhouse.com/docs/en/intro\" target=\"_blank\">ClickHouse官方文档</a><br/></p><p><br/></p>', '1', '1', '1', '0', '1701532800', '1', '2023-12', '1706795381', '1706892052');
INSERT INTO `sl_article` VALUES ('264', '376', '错误日志系统搭建-elasticsearch和kibana安装', null, null, 'nacholas', '', '', '<p>在开发过程中，程序的错误是不可避免的，PHP通过try{}cache{}抛出来的错误日志，一般放在磁盘文件上，但是实际上不直观，没法看到具体哪个错误或者警告集中在哪里，还需要登录到ssh去看到错误日志，非常不方便，<span style=\"font-size: 1em; color: inherit;\">elasticsearch+</span><span style=\"font-size: 1em; color: inherit;\">kibana可以很好解决痛点，</span><span style=\"font-size: 1em; color: inherit;\">elasticsearch作为存储，kibana作为可视化显示。</span></p><p><span style=\"font-size: 1em; color: inherit;\">mysql和elasticsearch比较</span></p><pre><code class=\"Bash\"><xmp>表(table) => 索引(index)：索引，文档的集合，类似于数据库中的表.\r\n行(row) => 文档(Document)：文档，一条数据，类似数据库中的每一行数据，但是文档的格式是 json 格式.\r\n列(column) => 字段(field)：字段，json 文档中的字段，类似于数据库中的列.\r\n约束(Schema) => 映射(Mapping)：映射是索引中文档的约束，例如字段类型约束（数据类型）.类似于数据库中的表结构.\r\nSQL => DSL：DSL 是 es 中提供的 json 风格的请求语句，用来操作 es，实现 CRUD.</xmp></code></pre><p>docker安装<span style=\"font-size: 1em; color: inherit;\">elasticsearch</span></p><p><span style=\"font-size: 1em; color: inherit;\">创建网络</span></p><pre><code class=\"Bash\"><xmp>docker network create es-network</xmp></code></pre><p>下载镜像</p><pre><code class=\"Bash\"><xmp>docker pull elasticsearch:7.12.1\r\n</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">安装并运行</span><span style=\"color: rgb(51, 51, 51);\">elasticsearch</span><span style=\"color: inherit; font-size: 1em;\">容器</span></p><pre><code class=\"Bash\"><xmp>docker run -d \\\r\n    --name elasticsearch \\\r\n    --privileged \\\r\n    --net es-network \\\r\n    -p 9200:9200 \\\r\n    -p 9300:9300 \\\r\n    -e \"discovery.type=single-node\" \\\r\n    -v elasticsearch-data:\"/usr/share/elasticsearch/data\" \\\r\n    -v elasticsearch-plugins:\"/usr/share/elasticsearch/plugins\" \\\r\n    elasticsearch:7.12.1</xmp></code></pre><p>安装完成，访问http:///你的ip:9200/<br/></p><p><img src=\"http://cdn.iamzcr.com//article/20240205132808140.png\" style=\"max-width:100%;\"/><br/></p><p><span style=\"font-size: 1em; color: inherit;\">docker安装kibana</span></p><p><span style=\"font-size: 1em; color: inherit;\">下载镜像</span></p><pre><code class=\"Bash\"><xmp>docker pull kibana:7.12.1</xmp></code></pre><p>创建并运行kibana容器</p><pre><code class=\"Bash\"><xmp>docker run -d \\\r\n    --name kibana \\\r\n    --net es-network \\\r\n    -p 5601:5601 \\\r\n    -e ELASTICSEARCH_HOSTS=http://elasticsearch:9200 \\\r\n    kibana:7.12.1</xmp></code></pre><p>安装完成，<span style=\"color: inherit;\">访问http://你的ip:</span><span style=\"font-size: 1em; color: inherit;\">5601</span><span style=\"color: inherit; font-size: 1em;\">/，操作dev tools</span></p><p><img src=\"http://cdn.iamzcr.com//article/2024020513331493854.png\" style=\"max-width:100%;\"/><span style=\"color: inherit; font-size: 1em;\"><br/></span></p><p>说明</p><p>kibana和<span style=\"color: rgb(51, 51, 51);\">elasticsearch容器要同一个网络</span><span style=\"color: rgb(51, 51, 51);\">es-network。</span></p><p><span style=\"color: rgb(51, 51, 51);\">kibana的</span><span style=\"color: rgb(51, 51, 51);\">ELASTICSEARCH_HOSTS参数要指定对应的</span><span style=\"color: rgb(51, 51, 51);\">elasticsearch容器用哪一个。</span></p>', '1', '1', '1', '0', '1696435200', '1', '2023-10', '1706892600', '1707158178');
INSERT INTO `sl_article` VALUES ('265', '371', 'Docker的安装和基本使用', null, null, 'nacholas', '', '', '<p>卸载旧版本</p><pre><code class=\"Bash\"><xmp>sudo yum remove docker \\\r\n                  docker-client \\\r\n                  docker-client-latest \\\r\n                  docker-common \\\r\n                  docker-latest \\\r\n                  docker-latest-logrotate \\\r\n                  docker-logrotate \\\r\n                  docker-engine</xmp></code></pre><p>安装并且配置yum源</p><pre><code class=\"Bash\"><xmp>sudo yum install -y yum-utils\r\nsudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo<br/></xmp></code></pre><p>安装docker</p><pre><code class=\"Bash\"><xmp>sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin</xmp></code></pre><p>查看版本</p><pre><code class=\"Bash\"><xmp>docker -v</xmp></code></pre><p>查看进程是否启动</p><pre><code class=\"Bash\"><xmp>docker images 或者 docker ps</xmp></code></pre><p>启动docker</p><pre><code class=\"Bash\"><xmp>systemctl start docker</xmp></code></pre><p>由于部署应用的时候，需要访问大部分海外的服务，所以可以配置国内的镜像加速，这里使用的是阿里云的加速服务，xxxx标识你的阿里云用户的镜像地址，可以登录阿里云<span style=\"font-size: 1em; color: inherit;\">容器镜像服务(</span><span style=\"color: inherit;\">ACR</span><span style=\"color: inherit; font-size: 1em;\">)查看</span></p><pre><code class=\"Bash\"><xmp>sudo mkdir -p /etc/docker\r\nsudo tee /etc/docker/daemon.json <<-\'EOF\'\r\n{\r\n  \"registry-mirrors\": [\"https://xxxx.mirror.aliyuncs.com\"]\r\n}\r\nEOF\r\nsudo systemctl daemon-reload\r\nsudo systemctl restart docker</xmp></code></pre><p>docker安装完成</p><p>使用docker安装mysql5.7</p><pre><code class=\"Bash\"><xmp>docker run --name mysql -e MYSQL_ROOT_PASSWORD=mypassword -e TZ=Asia/Shanghai -p 3306:3306 -d mysql:5.7\r\n\r\ndocker run：运行 Docker 容器的命令。\r\n--name mysql：为容器指定一个名称（可以根据需要自定义）。\r\n-e MYSQL_ROOT_PASSWORD=mypassword：设置 MySQL 的 root 用户的密码。将 password 替换为你想要设置的实际密码。\r\n-e TZ=Asia/Shanghai：时区\r\n-p 3306:3306：将容器的 3306 端口映射到主机的 3306 端口，以便可以通过主机访问 MySQL。\r\n-d：以后台（守护进程）模式运行容器。\r\nmysql:5.7：指定要使用的 MySQL 镜像及其版本</xmp></code></pre><p>使用docket安装showdoc</p><pre><code class=\"Bash\"><xmp>下载镜像\r\n\r\ndocker pull star7th/showdoc:latest\r\n\r\n新建存放showdoc数据的目录\r\n\r\nmkdir -p /data/showdoc/html\r\nchmod  -R 777  /data/showdoc\r\n\r\n#启动showdoc容器\r\n\r\ndocker run -d --name showdoc --user=root --privileged=true -p 4999:80 -v /data/showdoc/html:/var/www/html/ star7th/showdoc\r\n\r\n-d：以后台（守护进程）模式运行容器。\r\n--name showdoc：为容器指定一个名称，这里是 \"showdoc\"。\r\n--user=root：在容器内以 root 用户身份运行。\r\n--privileged=true：给容器提供特权访问，以便执行一些高级操作。\r\n-p 4999:80：将容器的 80 端口映射到主机的 4999 端口，以便可以通过主机的 4999 端口访问 ShowDoc 应用程序。\r\n-v /data/showdoc/html:/var/www/html/目录挂载到容器的 /var/www/html/ 目录。这样可以将容器内的 ShowDoc 数据持久化到主机上，以便数据在容器重启后仍然可用。\r\nstar7th/showdoc：指定要使用的 ShowDoc 镜像。</xmp></code></pre><p>如果需要绑定域名，那么就设置nginx代理到4999端口</p><pre><code class=\"Bash\"><xmp>location ^~ / {\r\n        proxy_pass http://127.0.0.1:4999/;\r\n        proxy_redirect off;\r\n        proxy_connect_timeout 90;\r\n        proxy_send_timeout 90;\r\n        proxy_read_timeout 90;\r\n        proxy_set_header Host $host;\r\n        proxy_set_header X-Real-IP $remote_addr;\r\n        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\r\n        proxy_set_header http_user_agent $http_user_agent;\r\n    }</xmp></code></pre><p><br/></p><p>参考官方文档</p><p><a href=\"https://docs.docker.com/engine/install/centos/\" target=\"_blank\" style=\"font-size: 1em; background-color: rgb(255, 255, 255);\">Docker官方文档</a></p><p><a href=\"https://hub.docker.com/\" target=\"_blank\">官方维护镜像</a><br/></p>', '1', '1', '1', '0', '1612281600', '1', '2021-02', '1706949212', '1706974947');
INSERT INTO `sl_article` VALUES ('266', '376', 'Docker的简单使用', null, null, 'nacholas', '', '', '<p>Docker已经是开发中必不可少的工具了，简单介绍一下doker，用nginx镜像为例子</p><p>拉去nginx镜像：<span style=\"font-size: 1em; color: inherit;\">docker pull nginx</span></p><p>查看本地有什么镜像：<span style=\"font-size: 1em; color: inherit;\">docker images</span></p><p><span style=\"font-size: 1em; color: inherit;\">创建并运行nginx容器</span></p><pre><code class=\"Bash\"><xmp>docker run  -d \\\r\n	--name docker-nginx \\\r\n	-v /data/test/html:/usr/share/nginx/html/ \\\r\n	-p 80:80 \\\r\nnginx</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">查看运行的容器：docker ps</span></p>', '1', '1', '1', '0', '1615305600', '0', '2021-03', '1707126506', null);
INSERT INTO `sl_article` VALUES ('267', '376', 'elasticsearch分词插件的使用', null, null, 'nacholas', '', '', '<p>分词器的作用是在创建倒排索引的时候对文档分词，在用户搜索的时候，可以对输入的内容分词，更友好，快速的去检索出用户的内容。</p><p>由于e<span style=\"font-size: 1em; color: inherit;\">lasticsearch是docker安装的，所以要查看数据卷对应的</span><span style=\"font-size: 1em; color: inherit;\">elasticsearch插件存放在哪里。</span></p><pre><code class=\"Bash\"><xmp>docker inspect elasticsearch </xmp><xmp>看到存放目录</xmp><xmp>/var/lib/docker/volumes/elasticsearch-plugins/_data<br/></xmp></code></pre><p>下载ik分词器，要下载对应的<span style=\"color: inherit;\">e</span><span style=\"color: inherit; font-size: 1em;\">lasticsearch</span></p><p><a href=\"https://github.com/medcl/elasticsearch-analysis-ik/releases/tag/v7.12.1\" target=\"_blank\">ik分词器7.12.1版本</a><br/></p><p>下载解压完后，放到上面目录。</p><p><img src=\"http://cdn.iamzcr.com//article/2024020521181450114.png\" style=\"max-width:100%;\"/><span style=\"color: inherit; font-size: 1em;\"><br/></span></p><p>重启<span style=\"color: inherit;\">e</span><span style=\"color: inherit; font-size: 1em;\">lasticsearch容器</span><br/></p><pre><code class=\"Bash\"><xmp>docker restart elasticsearch</xmp></code></pre><p>使用kibana的dev_tool查看是否生效</p><p>默认的分词器</p><p><img src=\"http://cdn.iamzcr.com//article/2024020521224987902.png\" style=\"max-width:100%;\"/><br/></p><p>ik分词器，该分词器有两种常用的模式，ik_smart和ik_max_word，ik_smart是智能切分，粗粒度，<span style=\"color: inherit;\">ik_max_word是最细切分，细粒度，要占用的内存空间更高。</span></p><p><img src=\"http://cdn.iamzcr.com//article/2024020521232765854.png\" style=\"max-width:100%;\"/><br/></p><p>ik分词器可以拓展分词的词库，也可以停用分词的词库，找到分词器的配置文件</p><pre><code class=\"Bash\"><xmp>/var/lib/docker/volumes/elasticsearch-plugins/_data/elasticsearch-analysis-ik-7.12.1/config/cat IKAnalyzer.cfg.xml</xmp></code></pre><p>修改配置</p><pre><code class=\"Bash\"><xmp><?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!DOCTYPE properties SYSTEM \"http://java.sun.com/dtd/properties.dtd\">\r\n<properties>\r\n        <comment>IK Analyzer 扩展配置</comment>\r\n        <!--用户可以在这里配置自己的扩展字典 -->\r\n        <entry key=\"ext_dict\">extend.dic</entry>\r\n         <!--用户可以在这里配置自己的扩展停止词字典-->\r\n        <entry key=\"ext_stopwords\">stopword.dic</entry>\r\n        <!--用户可以在这里配置远程扩展字典 -->\r\n        <!-- <entry key=\"remote_ext_dict\">words_location</entry> -->\r\n        <!--用户可以在这里配置远程扩展停止词字典-->\r\n        <!-- <entry key=\"remote_ext_stopwords\">words_location</entry> -->\r\n</properties></xmp></code></pre><p>新建扩展字典<span style=\"font-size: 1em; color: inherit;\">extend.dic</span><span style=\"font-size: 1em; color: inherit;\">，保存在同一个目录，停用扩展词库</span><span style=\"font-size: 1em; color: inherit;\">stopword.dic</span><span style=\"color: inherit; font-size: 1em;\">应该本身就自带，往</span><span style=\"color: inherit;\">extend.dic新加入分词：</span><span style=\"font-size: 1em; color: inherit;\">这是ik分词器，往</span><span style=\"color: rgb(51, 51, 51);\">stopword.di加入停用分词：分词器</span></p><p><span style=\"color: rgb(51, 51, 51);\">重启</span><span style=\"font-size: 1em; color: inherit;\">elasticsearch，</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">再在</span><span style=\"font-size: 1em; color: inherit;\">dev_tool</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">运行上面的分词语句，明显“</span><span style=\"color: inherit;\">这是ik分词器</span><span style=\"color: rgb(51, 51, 51); font-size: 1em;\">”已经变成一个分词，而“</span><span style=\"color: rgb(51, 51, 51);\">分词器</span><span style=\"color: rgb(51, 51, 51); font-size: 1em;\">”不再被用作分词。</span></p><p><img src=\"http://cdn.iamzcr.com//article/202402060043582114.png\" style=\"max-width:100%;\"/><span style=\"color: rgb(51, 51, 51); font-size: 1em;\"><br/></span></p>', '1', '1', '1', '0', '1644508800', '1', '2022-02', '1707139410', '1707151872');
INSERT INTO `sl_article` VALUES ('268', '371', 'SVN安装和使用', null, null, 'nacholas', '', '', '<p>安装</p><pre><code class=\"Bash\"><xmp>yum install subversion</xmp></code></pre><p>查看安装路径</p><pre><code class=\"Bash\"><xmp>rpm -ql subversion</xmp></code></pre><p>创建一个目录（这里是在根目录，最后路径是 /svn）</p><pre><code class=\"Bash\"><xmp>mkdir -p svn</xmp></code></pre><p>在svn目录下创建一个目录存放项目&nbsp;</p><pre><code class=\"Bash\"><xmp>mkdir -p test-project</xmp></code></pre><p>创建版本</p><pre><code class=\"Bash\"><xmp> svnadmin create /svn/test-project</xmp></code></pre><p>进入test-project目录下的conf目录，配置几个文件,如下：<br/></p><pre><code class=\"Bash\"><xmp>authz文件是权限控制文件\r\npasswd是帐号密码文件\r\nsvnserve.conf SVN服务配置文件</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">打开文件 vi passwd 这里设置客户端登录用户和密码，格式为</span><br/></p><pre><code class=\"Bash\"><xmp> testuser= 123456</xmp></code></pre><p>打开文件vi authz，在末尾添加如下代码,用户给用户添加权限</p><pre><code class=\"Bash\"><xmp>[/]\r\ntestuser= rw\r\nw = r</xmp></code></pre><p>打开文件 vi svnserve.conf,打开下面的几个注释：<br/></p><pre><code class=\"Bash\"><xmp>anon-access = read #匿名用户可读\r\nauth-access = write #授权用户可写\r\npassword-db = passwd #使用哪个文件作为账号文件\r\nauthz-db = authz #使用哪个文件作为权限文件\r\nrealm = /svn # 认证空间名，版本库所在目录</xmp></code></pre><p>启动svn版本库<br/></p><pre><code class=\"Bash\"><xmp>svnserve -d -r /svn </xmp></code></pre><p>然后在客户端就可以直接checkout</p><pre><code class=\"Bash\"><xmp>svn checkout svn://你的ip/test-project</xmp></code></pre><p>注意</p><p>1、每次修改svnserve.conf文件要 重启svn服务，当然重启之前必须杀死服务，查看svn进程<br/></p><pre><code class=\"Bash\"><xmp>ps -ef|grep svnserve</xmp><xmp>root     11610     1  0 10:19 ?        00:00:00 svnserve -d -r /svn\r\nroot     11637 10885  0 10:22 pts/1    00:00:00 grep --color=auto svnserve</xmp><xmp>kill -9 11610</xmp></code></pre><p>然后再重启服务</p><pre><code class=\"Bash\"><xmp>svnserve -d -r /svn</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">2、如果要想客户端提交版本的时候同步到网站的更目录的话，</span><br/></p><p>需要在python目录下的hooks文件及下新建一个post-commit文件，hooks文件下已经有关于post-commit的post-commit.tmpl模板直接   cp post-commit.tmpl post-commit 即可，然后修改post-commit文件，写入一下脚本。<br/></p><pre><code class=\"Bash\"><xmp>REPOS=\"$1\"\r\nREV=\"$2\"\r\nexport LANG=en_US.UTF-8\r\nsvn up --username=testuser--password=123456 --no-auth-cache --non-interactive /www</xmp></code></pre><p>别忘了给可执行权限<br/></p><pre><code class=\"Bash\"><xmp>chmod +x post-commit</xmp></code></pre><p>3、当需要创建另外一个存储仓库的时候，在svn目录下新建目录other_project</p><pre><code class=\"Bash\"><xmp>mkdir -p other_project</xmp></code></pre><p>然后重复上面创建版本库的步骤，记得重启svn服务</p><pre><code class=\"Bash\"><xmp>svnserve -d -r /svn</xmp></code></pre><p>就可以在客户端<span style=\"font-size: 1em; color: inherit;\">检出另外一个项目。</span></p><pre><code class=\"Bash\"><xmp>svn checkout svn://你的ip/other_project</xmp></code></pre>', '1', '1', '1', '0', '1581989286', '1', '2020-02', '1708225172', '1708225975');
INSERT INTO `sl_article` VALUES ('269', '374', '设计一个的发行SDK系统-架构设计', null, null, 'nacholas', '', '', '<p>前面<a href=\"http://iamzcr.com/article/detail.html?id=256\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">设计一个的发行SDK系统-核心业务</a>清楚了发行的核心业务之后，根据核心业务设计整个系统的架构。</p><p>技术栈:<span style=\"font-size: 1em; color: inherit;\">PHP</span>，<span style=\"font-size: 1em; color: inherit;\">Golang</span>，<span style=\"font-size: 1em; color: inherit;\">MongoDB</span>，<span style=\"font-size: 1em; color: inherit;\">Mysql，</span>ClickHouse，<span style=\"font-size: 1em; color: inherit;\">ELK。</span></p><p><span style=\"font-size: 1em; color: inherit;\">其中，PHP作为登录和充值业务实现语言。Golang作为广告点击业务实现语言，</span><span style=\"color: inherit;\">MongoDB作为存放玩家点击信息，激活信息，注册信息，登录信息，认证信息，充值信息数据库，ClickHouse作为原始数据存储，MySQL作为配置信息存储，也可以同步双写保存用户注册和充值信息，ELK则作为项目错误日志收集系统。</span></p><p><img src=\"http://cdn.iamzcr.com//article/2024021813373652698.jpg\" style=\"max-width:100%;\"/><br/></p><p>如上图所示</p><p>1、玩家通过点击广告链接，媒体渠道会根据在平台上配置的下载链接，触发对应的下载设备发送到发行系统侧，由于这部分请求并发可能会存在较大的情况，而且没有太多的复杂业务处理，所以使用golang处理这部分业务，这里的MongoDB可以根据实际的业务量，独立一个副本集群出来存放点击数据，再更新回clickhouse里面，<span style=\"color: inherit;\">也可以放到redis或者kafka里面，消费最终回调clickhouse</span><span style=\"font-size: 1em; color: inherit;\">，也就是不和激活，注册，登录业务共用一个副本集群。</span></p><p>2、nosql可以使用redis而不一定是MongoDB，使用MongoDB作为中间件的原因是前期可能对原始数据有不同记录需求，而MongoDB作为文档型数据库，可以更好的扩充字段，而且性能并不差。</p><p>3、玩家登录充值，广告业务，后台业务等程序日志可以都通过<span style=\"font-size: 1em; color: inherit;\">Filebeat+Logstash收集进</span><span style=\"font-size: 1em; color: inherit;\">elasticsearch，实时查看具体的错误日志。</span></p><p>4、clickhouse作为一个数据仓库，对写入拥有良好的性能，缺点是不能支持太高的并发查询，所以作为存放原始数据历史记录和后台查询操作。</p><p>5、PHP登录充值服务器和golang广告业务服务器可以根据实际并发的情况，横向扩展。</p><p>6、该架构只是对输入的数据做了处理，并不包括输出系统，例如分包系统，投放系统。</p>', '1', '1', '1', '0', '1686758400', '1', '2023-06', '1708228730', '1709006788');
INSERT INTO `sl_article` VALUES ('270', '374', '设计一个的发行SDK系统-分包系统', null, null, 'nacholas', '', '', '<p>在<a href=\"http://iamzcr.com/article/detail.html?id=269\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">设计一个的发行SDK系统-架构设计</a>结尾提到，前面的架构只是发行系统的输入业务，下面聊聊输出业务中的分包系统，宏观上，发行可以把投放分为各大应用商店上的上架投放(硬核渠道)，也就是我们游戏业内说的5+7硬核渠道(<span style=\"font-size: 1em; color: inherit;\">5家主流：应用宝 、UC、360、百度、小米，5家传统手机应用商店，</span><span style=\"font-size: 1em; color: inherit;\">7家硬核：OPPO、vivo、酷派、金立、联想、华为、魅族，联盟成员</span><span style=\"font-size: 1em; color: inherit;\">)，还有就是买量渠道(抖音，快手，广点通等)，另外一个就是私域流量(公会直播)，这里不介绍应用商店的上架投放情况，因为对于应用商店上架投放分包系统有不少的差异。主要介绍的是买量投放和私域流量的分包，具体逻辑如图</span></p><p><img src=\"http://cdn.iamzcr.com//article/2024021918210565298.jpg\" style=\"max-width:100%;\"/><span style=\"font-size: 1em; color: inherit;\"><br/></span></p><p>如上图所示</p><p>1、研发出了一个母包后，作为发行去投放，会有多种投放方式，包括巨量引擎，快手，公会直播间等私域流量。</p><p>2、在研发出了母包左边的部分，主要针对私域流量，最终出来一个走自己cdn的落地页，公会的主播在直播间引导去落地页下载，绑定玩家都对应的主播渠道身上。</p><p>3、在研发出了母包右边部分，主要是针对类似于抖音的主播上的小手柄和小风车，因为这些功能，必须要买量渠道分出来的子包，才能使用。</p><p>4、巨量的分包只需要导出符合规则的分包模板，上传到巨量那边分包，而快手需要自己打分包，复制下载链接到对应的投放计划。</p><p>5、左边和右边的渠道A，B的含义其实是相同的，只不过左边的出包不带买量渠道的sdk，右边的带有买量渠道的sdk。</p><p><br/></p>', '1', '1', '1', '0', '1686844800', '1', '2023-06', '1708236538', '1708338719');
INSERT INTO `sl_article` VALUES ('271', '376', 'MongoDB使用中的问题', null, null, 'nacholas', '', '', '<p>在MongoDB使用中，有几个不注意的问题，可能会导致MongoDB的性能下降。</p><p>1、对文档没有设计适当的索引，当文档数据量过大，在执行高并发查询的时候，消耗大量的cpu资源，查询变慢，导致应用服务器崩溃。</p><p>例如：假设存在一个用户授权系统，需要通过输入账号找出uid，有500万条记录，我们来模拟该情况，登录mongo客户端，选择一个数据库test_db，使用mongo shell 执行下面脚本，插入500万条数据，每次插入50万条，</p><pre><code class=\"Bash\"><xmp>var totalCount = 5000000; // 总文档数量\r\nvar insertCount = 500000; // 每次插入的文档数量\r\nvar total = totalCount / insertCount; // 总批次数\r\n\r\nfor (var batch = 0; batch < total; batch++) {\r\n    var documents = [];\r\n    for (var i = 0; i < insertCount; i++) {\r\n        var uid = (batch * insertCount) + i + 1;\r\n        var document = {\r\n            uid: uid,\r\n            account: \"A\" + uid\r\n        };\r\n        documents.push(document);\r\n    }\r\n    db.test_user.insertMany(documents);\r\n    print(\"插入第\", batch+1 , \"批次\");\r\n}\r\n</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024021921334816715.png\" style=\"max-width:100%;\"/><br/></p><p>没有索引的情况，我们查询account为A1的用户，查询速度特别慢，查看CPU消耗情况，如果大量用户登录同时登录，资源将会被耗尽。</p><p><img src=\"http://cdn.iamzcr.com//article/2024021921361628912.png\" style=\"max-width:100%;\"/><br/></p><p><img src=\"http://cdn.iamzcr.com//article/2024021921364199017.png\" style=\"max-width:100%;\"/><br/></p><p>当给account加入索引后，再执行查询，不仅查询的速度快，而且CPU的消耗都可以忽略不计。</p><p><img src=\"http://cdn.iamzcr.com//article/2024021921382015367.png\" style=\"font-size: 1em; color: inherit; max-width: 100%;\"/></p><p>2、MongoDB在<span style=\"font-size: 1em; color: inherit;\">3.2版本开始对数据类型敏感，需要严格的数据类型匹配查询。在此之前的版本中，即使查询时指定了数据类型，MongoDB也只是对查询条件进行了字符串形式的匹配，而不会区分数据类型。</span></p><p><span style=\"font-size: 1em; color: inherit;\">例如上面的用户账号集合的例子，如果uid是字符串，3.2版本以前，PHP操作查询uid等于1的，如下这么写，可以查出相应的记录，因为字符串形式匹配，在3.2版本开始，必须要把uid转成字符串才能查询出来。</span></p><pre><code class=\"Bash\"><xmp>$mongoConnect = MongodbModel::mongoConnect();//链接mongodb\r\n$cursor = $mongoConnect->test_db->test_user->findOne([\'uid\' => 1]);\r\nvar_dump($cursor);</xmp></code></pre><p><br/></p><p><br/></p>', '1', '1', '1', '0', '1644336000', '1', '2022-02', '1708262897', '1709158383');
INSERT INTO `sl_article` VALUES ('272', '371', 'MongoDB在centos7下安装和配置', null, null, 'nacholas', '', '', '<p><a href=\"https://www.mongodb.com/try/download/community\" target=\"_blank\">MongoDB官网</a>下载对应版本<br/></p><pre><code class=\"Bash\"><xmp>wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-4.0.28.tgz</xmp></code></pre><p>解压</p><pre><code class=\"Bash\"><xmp>tar -zxvf mongodb-linux-x86_64-rhel70-4.0.28.tgz </xmp></code></pre><p>移动解压后的目录</p><pre><code class=\"Bash\"><xmp> mv mongodb-linux-x86_64-rhel70-4.0.28 /usr/local/mongodb4.0</xmp></code></pre><p>新增日志和数据存放日志目录</p><pre><code class=\"Bash\"><xmp>mkdir -p /data/mongodb/data\r\nmkdir -p /data/mongodb/log</xmp></code></pre><p>新增配置文件<span style=\"font-size: 1em; color: inherit;\">/data/mongodb/mongod.conf</span></p><pre><code class=\"Bash\"><xmp>mkdir -p /data/mongodb/data\r\nmkdir -p /data/mongodb/mongod.conf\r\nsystemLog:\r\n  ##指定日志的输出目标为文件。\r\n  destination: file\r\n  path: \"/data/mongodb/log/mongod.log\"\r\n  ##启用日志追加模式，新的日志将追加到现有日志文件末尾。\r\n  logAppend: true\r\nstorage:\r\n  dbPath: \"/data/mongodb/data\"\r\n  journal:\r\n	##启用日志功能，确保数据持久化到磁盘。\r\n    enabled: true\r\n  ##指定存储引擎为WiredTiger。\r\n  engine: wiredTiger\r\n  wiredTiger:\r\n    engineConfig:\r\n	  ##设置WiredTiger的缓存大小为300MB。\r\n      configString : cache_size=300M\r\n	  ##使用单独的目录存储索引文件。\r\n      directoryForIndexes: true\r\nprocessManagement:\r\n  ##以守护进程的方式运行MongoDB，即将其转变为后台进程。\r\n  fork: true\r\nnet:\r\n  bindIp: 127.0.0.1\r\n  port: 23001</xmp></code></pre><p>启动MongoDB</p><pre><code class=\"Bash\"><xmp>/usr/local/mongodb4.0/bin/mongod --config /data/mongodb/mongod.conf</xmp></code></pre><p>客户端登录并创建数据库和集合</p><pre><code class=\"Bash\"><xmp>/usr/local/mongodb4.0/bin/mongo 127.0.0.1:23001\r\nuse test\r\ndb.test_user.insertOne({\"uid\":1,\"account\":\"A1\"})\r\ndb.test_user.find()</xmp></code></pre><p>关闭MongoDB</p><pre><code class=\"Bash\"><xmp> /usr/local/mongodb4.0/bin/mongod --config /data/stacksdk/mongodb/mongod.conf --shutdown</xmp></code></pre>', '1', '1', '1', '0', '1612108800', '1', '2021-02', '1708401631', '1708402385');
INSERT INTO `sl_article` VALUES ('273', '374', '设计一个的发行SDK系统-投放系统(一)', null, null, 'nacholas', '', '', '<p>在发行的投放系统中，玩家广告点击，买量渠道回传是一个并发比较大的业务。用<span style=\"font-size: 1em; color: inherit;\">不同的语言去实现该业务，在PHP和Golang之间做个粗略的压测。</span></p><p>压测环境</p><p>机器：4台，一台应用服务器(<span style=\"font-size: 1em; color: inherit;\">192.168.18.103，</span><span style=\"color: inherit;\">4C8G</span><span style=\"font-size: 1em; color: inherit;\">)，一台数据库服务器(</span><span style=\"font-size: 1em; color: inherit;\">192.168.18.93，</span><span style=\"font-size: 1em; color: inherit;\">4C16G</span><span style=\"font-size: 1em; color: inherit;\">)，两台压测机(</span><span style=\"font-size: 1em; color: inherit;\">192.168.18.229,</span><span style=\"font-size: 1em; color: inherit;\">192.168.18.101，</span><span style=\"font-size: 1em; color: inherit;\">4C16G</span><span style=\"font-size: 1em; color: inherit;\">)</span></p><p>数据库：MongoDB3.6.12版本，单机,机器配置，4C16G。</p><p>应用服务器：PHP版本7.3.10(分别对开启opcache和不开启opcahe做压测，最少进程数70，最大进程数200)，golang1.22，nginx<span style=\"font-size: 1em; color: inherit;\">1.17.9，</span><span style=\"color: inherit;\">4C8G。</span></p><p>两台压测机：<span style=\"color: inherit;\">4C16G</span><span style=\"color: inherit;\">。</span><span style=\"color: inherit;\"><br/></span></p><p>压测工具：<span style=\"font-size: 1em; color: inherit;\">siege</span><span style=\"color: inherit;\">。</span></p><p>压测结果指标：</p><pre><code class=\"Bash\"><xmp>Transactions：已完成的请求总数。\r\nAvailability：成功完成的请求百分比。\r\nElapsed time：测试运行的总时间。\r\nData transferred：传输的数据量。\r\nResponse time：平均响应时间。\r\nTransaction rate：每秒完成的请求数量（事务率）。\r\nThroughput：每秒传输的数据量。\r\nConcurrency：并发用户数。\r\nSuccessful transactions：成功完成的请求总数。\r\nFailed transactions：失败的请求总数。\r\nLongest transaction：最长的请求响应时间。\r\nShortest transaction：最短的请求响应时间。</xmp></code></pre><p>压测脚本：</p><p><a href=\"https://github.com/iamzcr/web_ads\" target=\"_blank\">web_ads</a><br/></p><p>Golang脚本压测，进入到根目录，golang自带的http服务监听端口设置为8080</p><pre><code class=\"Bash\"><xmp>/usr/local/go1.22/bin/go mod init go_ads\r\n/usr/local/go1.22/bin/go mod tidy\r\n/usr/local/go1.22/bin/go run main.go</xmp></code></pre><p>不通过nginx转发对程序压测，结果</p><pre><code class=\"Bash\"><xmp>#每次500个并发，循环请求50次\r\nsiege -c 500 -r 50  http://192.168.18.93:8080/insert</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024022018103683826.png\" style=\"max-width:100%;\"/><img src=\"http://cdn.iamzcr.com//article/202402201810565284.png\" style=\"color: inherit; max-width: 100%;\"/></p><p>通过nginx转发，nginx端口配置为8082，结果</p><pre><code class=\"Bash\"><xmp>#每次500个并发，循环请求50次\r\nsiege -c 500 -r 50  http://192.168.18.93:8082/insert</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024022018143556958.png\" style=\"max-width:100%;\"/><img src=\"http://cdn.iamzcr.com//article/2024022018144725345.png\" style=\"color: inherit; max-width: 100%;\"/><br/></p><p>原生PHP脚本压测，不开opcache，配置nginx监听的端口为8081，结果<br/></p><pre><code class=\"Bash\"><xmp>#每次500个并发，循环请求50次\r\nsiege -c 500 -r 50  http://192.168.18.93:8081/insert</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024022018194977186.png\" style=\"max-width:100%;\"/><img src=\"http://cdn.iamzcr.com//article/202402201819541760.png\" style=\"color: inherit; max-width: 100%;\"/><br/></p><p>原生PHP脚本压测，开起opcache，配置nginx监听的端口为8081，结果<br/></p><pre><code class=\"Bash\"><xmp>#每次500个并发，循环请求50次\r\nsiege -c 500 -r 50  http://192.168.18.93:8081/insert</xmp></code></pre><p><img src=\"http://cdn.iamzcr.com//article/2024022018214151622.png\" style=\"max-width:100%;\"/><img src=\"http://cdn.iamzcr.com//article/2024022018214615519.png\" style=\"color: inherit; max-width: 100%;\"/><br/></p><p>从结果看，golang的成功请求成功数，<span style=\"color: inherit;\">平均响应时长和最大响应时长</span><span style=\"font-size: 1em; color: inherit;\">会比PHP好些，其实原生的PHP实际上并不差，单个进程消耗的cpu资源并不高，在实际开发中，PHP会使用框架，单个进程cpu消耗会增加一倍，而且这只是1000左右的并发，如果强行提高并发请求，本身应用服务器的cpu资源就会消耗完，所以更准确的测试应该需要把硬件一点一点提升，并发数提高才能看到更显著的效果。</span></p><p><span style=\"font-size: 1em; color: inherit;\">常驻内存语言和脚本语言对比也不太合理，但是针对于这种简单的业务，PHP和Golang的开发成本都不高，但是从长远来看，可以节省更多的机器成本。</span></p>', '1', '1', '1', '0', '1696608000', '1', '2023-10', '1708422384', '1709180662');
INSERT INTO `sl_article` VALUES ('274', '370', 'PHP实现-观察者模式', null, null, 'nacholas', '', '', '<p>1、定义</p><p>观察者模式是行为型模式的一种，定义了对象间一对多的关系。当对象(被观察者)的状态发生变化时候，依赖于它的对象(观察者)会得到通知，处理对应的任务。</p><p>2、在<span style=\"font-size: 1em; color: inherit;\">PHP的标准库</span><span style=\"font-size: 1em; color: inherit;\">中的使用</span></p><p>在PHP中，提供了方便实现观察者模式的接口，主要包括以下两个：<br/><br/>SplObserver接口：这个接口定义了观察者对象的方法。观察者通过实现这个接口来接收被观察对象的通知。<br/><br/>SplSubject接口：这个接口定义了被观察对象的方法。被观察对象通过实现这个接口来管理观察者的注册、注销和通知。</p><p>3、应用</p><p>在游戏中，当SDK回调给研发测，需要通知服务端去发货，可以在操作订单入库的时候，可以使用设计模式去实现。</p><p>构造被观察者类Order</p><pre><code class=\"Bash\"><xmp>class Order implements \\SplSubject\r\n{\r\n    //存放观察者\r\n    private $observers = null;\r\n\r\n    //订单数据\r\n    public $orderData = [], $orderStatus = 0;\r\n\r\n    public function __construct()\r\n    {\r\n        $this->observers = new \\SplObjectStorage();\r\n    }\r\n\r\n    //添加一个观察者\r\n    public function attach(\\SplObserver $observer)\r\n    {\r\n        if (!$this->observers->contains($observer)) {\r\n            $this->observers->attach($observer);\r\n        }\r\n    }\r\n\r\n    //删除一个观察者\r\n    public function detach(\\SplObserver $observer)\r\n    {\r\n        $this->observers->detach($observer);\r\n\r\n    }\r\n\r\n    //通知观察者\r\n    public function notify()\r\n    {\r\n        if (count($this->observers) > 0) {\r\n            foreach ($this->observers as $observer) {\r\n                // 把本类对象传给观察者，以便观察者获取当前类对象的信息\r\n                $observer->update($this);\r\n            }\r\n        }\r\n    }\r\n\r\n    //订单入库\r\n    public function insertOrder($orderData = [])\r\n    {\r\n\r\n        echo \"后台订单入库操作\" . PHP_EOL;\r\n        $res = $this->setOrder($orderData);\r\n        $this->orderData = $orderData;\r\n        $this->orderStatus = $res[\'code\'];\r\n        $this->notify();\r\n        return $res;\r\n    }\r\n\r\n    private function setOrder($orderData)\r\n    {\r\n        try {\r\n            if (empty($orderData[\'money\']) || $orderData[\'money\'] < 0) {\r\n                throw new Exception(\"money error\");\r\n            }\r\n            //处理订单入库逻辑\r\n            // TODO: Change the autogenerated stub\r\n            //入库成功返回成功信息\r\n            return [\'code\' => 1, \'msg\' => \"success\"];\r\n\r\n        } catch (\\Exception $e) {\r\n            return [\'code\' => 0, \'msg\' => \"msg:\" . $e->getMessage() . \'...line:\' . $e->getLine()];\r\n        }\r\n    }\r\n\r\n    public function getOrderStatus()\r\n    {\r\n        return $this->orderStatus;\r\n    }\r\n\r\n}</xmp></code></pre><p>构建<span style=\"font-size: 1em; color: inherit;\">SyncOrder触发服务端发货观察者</span></p><pre><code class=\"Bash\"><xmp>//订单入库更新成功，通知观察者\r\nclass SyncOrder implements \\SplObserver\r\n{\r\n\r\n    public function update(\\SplSubject $subject)\r\n    {\r\n        $orderStatus = $subject->getOrderStatus();\r\n        if (!$orderStatus) {\r\n            echo \"充值失败，不需要发货，订单信息:\" . json_encode($subject->orderData) . \"，订单状态：\" . $orderStatus . PHP_EOL;\r\n            return;\r\n        }\r\n        echo \"后台订单已更新并且入库，给服务端发货，订单信息:\" . json_encode($subject->orderData) . \"，订单状态：\" . $orderStatus . PHP_EOL;\r\n\r\n    }\r\n}</xmp></code></pre><p>构造邮件或者短信消息发送观察者</p><pre><code class=\"Bash\"><xmp>//订单入库更新成功，通知观察者\r\nclass SyncMsg implements \\SplObserver\r\n{\r\n    public function update(\\SplSubject $subject)\r\n    {\r\n        $orderStatus = $subject->getOrderStatus();\r\n        if (!$orderStatus) {\r\n            echo \"充值失败，订单信息:\" . json_encode($subject->orderData) . \"，订单状态：\" . $orderStatus . PHP_EOL;\r\n            return;\r\n        }\r\n        if ($subject->orderData[\'money\'] > 648) {\r\n            echo \"后台订单已入库，有大额玩家充值，发送消息，订单信息:\" . json_encode($subject->orderData) . \"，订单状态：\" . $orderStatus . PHP_EOL;\r\n        }\r\n\r\n    }\r\n}</xmp></code></pre><p>使用</p><pre><code class=\"Bash\"><xmp>//构建被观察者订单对象\r\n$order = new Order();\r\n\r\n$syncOrder = new SyncOrder();\r\n$syncMsg = new SyncMsg();\r\n\r\n//添加通知服务端发货观察者;\r\n$order->attach($syncOrder);\r\n//添加消息通知观察者;\r\n$order->attach($syncMsg);\r\n\r\n//第一笔订单\r\n$orderData = [\'order_num\' => time(), \"uid\" => 123456, \"money\" => 1000];\r\n$order->insertOrder($orderData);\r\n\r\n//第二笔订单\r\n$orderData = [\'order_num\' => time(), \"uid\" => 123456, \"money\" => 0];\r\n$order->insertOrder($orderData);</xmp></code></pre><p><br/></p>', '1', '1', '1', '0', '1612108800', '1', '2021-02', '1708508171', '1708524674');
INSERT INTO `sl_article` VALUES ('275', '370', '安装PHP扩展-phpize方式', null, null, 'nacholas', '', '', '<p>使用<span style=\"font-size: 1em; color: inherit;\">phpize安装mongodb扩展</span></p><p><span style=\"font-size: 1em; color: inherit;\">下载扩展，注意一下下载和PHP版本相匹配的mongodb扩展，这里使用的是PHP7.3.10</span></p><pre><code class=\"Bash\"><xmp>wget https://pecl.php.net/get/mongodb-1.12.0.tgz --no-check-certificate</xmp></code></pre><p>解压</p><pre><code class=\"Bash\"><xmp>tar -zxvf mongodb-1.12.0.tgz </xmp></code></pre><p>进入目录并执行，生成配置文件</p><pre><code class=\"Bash\"><xmp>cd mongodb-1.12.0\r\n/usr/local/php73/bin/phpize </xmp></code></pre><p>指定安装PHP版本配置路径</p><pre><code class=\"Bash\"><xmp>./configure --with-php-config=/usr/local/php73/bin/php-config</xmp></code></pre><p>安装</p><pre><code class=\"Bash\"><xmp>make && make install</xmp></code></pre><p>修改PHP.ini文件</p><pre><code class=\"Bash\"><xmp>vim /usr/local/php73/etc/php.ini\r\n#添加mongo扩展\r\nextension=mongodb.so<br/></xmp></code></pre><p>查看对应的PHP版本进程，找出后，kill掉</p><pre><code class=\"Bash\"><xmp> ps aux | grep php-fpm </xmp></code></pre><p>重启PHP和nginx</p><pre><code class=\"Bash\"><xmp>/usr/local/php73/sbin/php-fpm \r\n/usr/local/nginx/sbin/nginx -s reload<br/></xmp></code></pre><p>安装PHP操作mongodb扩展完成</p>', '1', '1', '1', '0', '1550073600', '1', '2019-02', '1708913473', '1708913692');
INSERT INTO `sl_article` VALUES ('276', '374', '设计一个的发行SDK系统-订单系统(一)', null, null, 'nacholas', '', '', '<p>很久没更新发行系统这个系列了，记录下订单系统这部分。</p><p>玩家支付成功之后，需要通知研发方发货，如果只是在支付成功触发一次，有可能会因为网络或者研发方返回的状态不正确，导致不能更新自身的订单状态，或者玩家充值不到账，我们在订单系统里面需要加入按一定时间间隔去重复通知研发方。可以使用redis的发布订阅或者队列方式去通知实现该业务。</p><p>队列(List数据类型)方式，该方式需要配合定时任务去计算通知次数</p><p>版本环境：PHP7.3.10，<span style=\"font-size: 1em; color: inherit;\">redis-5.0.4，扩展版本</span><span style=\"font-size: 1em; color: inherit;\">phpredis4.2.0</span></p><p><a href=\"https://github.com/iamzcr/redis_demo\" target=\"_blank\">github下载demo</a><br/></p><p>新建redis_mq.php</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nclass RedisSingleton\r\n{\r\n    private static $instance;\r\n\r\n    private\r\n        $redis,\r\n        $config = [\'host\' => \'127.0.0.1\', \'port\' => 25002];\r\n\r\n    private function __construct()\r\n    {\r\n        $this->redis = new Redis();\r\n        $this->redis->connect($this->config[\'host\'], $this->config[\'port\']);\r\n    }\r\n\r\n    public static function getInstance()\r\n    {\r\n        if (!self::$instance) {\r\n            self::$instance = new RedisSingleton();\r\n        }\r\n        return self::$instance->redis;\r\n    }\r\n\r\n}</xmp></code></pre><p>新增order.php文件，处理订单业务</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nrequire_once \'redis_mq.php\';\r\n\r\n\r\nclass Order\r\n{\r\n    private $redisClient;\r\n\r\n    public function __construct()\r\n    {\r\n        $this->redisClient = RedisSingleton::getInstance();\r\n    }\r\n\r\n    public function callbackToCp($orderData = [])\r\n    {\r\n\r\n        //这里订单记录可以放到mysql,为了demo方便,直接把订单存到redis\r\n        $this->redisClient->set($orderData[\'order_num\'], json_encode($orderData));\r\n        $orderInfo = $this->redisClient->get($orderData[\'order_num\']);\r\n        $orderInfo = json_decode($orderInfo, 1);\r\n        if (!empty($orderInfo[\'is_callback\'])) {\r\n            return true;\r\n        }\r\n\r\n        //研发方响应成功\r\n        if ($this->curlPost($orderInfo)) {\r\n            //TODO 通知成功，处理修改订单状态逻辑is_callback=1\r\n            return true;\r\n        }\r\n        //研发方响应失败，把失败订单写到队列里面，用于后续定时任务出列重复通知，通知5次\r\n        if ($orderInfo[\'callback_count\'] < 5) {\r\n            //重新发放redis队列\r\n            $orderMq = [\r\n                \'order_num\' => $orderInfo[\'order_num\'],\r\n                //按通知次数*2*60秒人列\r\n                \'notify_time\' => time() + 60 * ($orderInfo[\'callback_count\'] * 2),\r\n            ];\r\n            $this->redisClient->lpush(\'order_fail\', json_encode($orderMq));\r\n        }\r\n        return false;\r\n    }\r\n\r\n    public function notifyCp($orderData)\r\n    {\r\n        $isCallback = $this->callbackToCp($orderData);\r\n        $orderData[\'is_callback\'] = intval($isCallback);\r\n        $orderData[\'callback_count\'] = $orderData[\'callback_count\'] + 1;\r\n        file_put_contents(\'/tmp/order.log\', json_encode($orderData) . PHP_EOL, FILE_APPEND);\r\n        $this->redisClient->set($orderData[\'order_num\'], json_encode($orderData));\r\n    }\r\n\r\n    private function curlPost($orderData)\r\n    {\r\n        //TODO 具体发送http请求逻辑\r\n        return false;\r\n    }\r\n\r\n    //重复通知\r\n    public function repeatCp($orderNum)\r\n    {\r\n        $orderInfo = $this->redisClient->get($orderNum);\r\n        $orderInfo = json_decode($orderInfo, 1);\r\n        $this->notifyCp($orderInfo);\r\n    }\r\n}</xmp></code></pre><p>新建定时任务脚本cron.php</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nif (php_sapi_name() !== \'cli\') {\r\n    exit(\'not cli run\');\r\n}\r\nrequire_once \'redis_mq.php\';\r\nrequire_once \'order.php\';\r\n\r\n$redisClient = RedisSingleton::getInstance();\r\n$orderFailArr = [];\r\n$order = new Order();\r\nwhile (true) {\r\n    $orderFailbuffer = $redisClient->lPop(\'order_fail\');\r\n    if (!$orderFailbuffer) {\r\n        break;\r\n    }\r\n    $orderFailInfo = json_decode($orderFailbuffer, true);\r\n    //判断是否符合通知时间\r\n    if ($orderFailInfo[\'notify_time\'] > time()) {\r\n        $orderFailArr[] = $orderFailbuffer;\r\n        continue;\r\n    }\r\n    $order->repeatCp($orderFailInfo[\'order_num\']);\r\n\r\n}\r\n//如果时间没到,再放回队列里面\r\nif (!empty($orderFailArr)) {\r\n    foreach ($orderFailArr as $orderRow) {\r\n        $redisClient->rPush(\'order_fail\', $orderRow);\r\n    }\r\n}</xmp></code></pre><p>新建订单测试文件test.php</p><pre><code class=\"Bash\"><xmp><?php\r\nrequire_once \'order.php\';\r\n//模拟要回调给研发方的订单\r\n$orderData = [\r\n    \'order_num\' => \'O\' . strval(time()),\r\n    \'uid\' => rand(10000, 999999),\r\n    \'is_callback\' => 0,\r\n    \'callback_count\' => 0, //通知次数\r\n    \'create_time\' => time(),\r\n];\r\n(new  Order())->notifyCp($orderData);</xmp></code></pre><p>配置定时任务</p><pre><code class=\"Bash\"><xmp>* * * * * /usr/local/php7.3.10/bin/php /data/mq/redis/lpush/cron.php</xmp></code></pre><p>说明</p><p>test.php调用订单模块的通知研发方的方法<span style=\"font-size: 1em; color: inherit;\">notifyCp，如果研发方没有按需要的固定格式返回，就认为是失败订单，放到redis队列里面，设置定时任务，每分钟去取出队列里面的失败订单，重复通知，每次通知失败更新下一次通知的时间：当前时间+60*2*通知次数，直到通知次数达到5次，不再通知，该订单则被认为失败订单。</span></p>', '1', '1', '1', '0', '1701273600', '1', '2023-11', '1708963542', '1709180598');
INSERT INTO `sl_article` VALUES ('277', '374', '设计一个的发行SDK系统-订单系统(二)', null, null, 'nacholas', '', '', '<p>前面介绍了通过<a href=\"http://iamzcr.com/article/detail.html?id=276\" target=\"_blank\">redis队列方式去操作重复发送失败的订单</a>，其实也可以通过有序集合去做这个处理，使用有序集合可以较少对订单库的操作，实现重复通知功能。</p><p>版本环境：PHP7.3.10，<span style=\"color: inherit; font-size: 1em;\">redis-5.0.4，扩展版本</span><span style=\"color: inherit; font-size: 1em;\">phpredis4.2.0</span><br/></p><p><a href=\"https://github.com/iamzcr/redis_demo\" target=\"_blank\"></a><a style=\"background-color: rgb(255, 255, 255);\">github下载demo</a><span style=\"color: inherit; font-size: 1em;\"><br/></span></p><p>新建redis_mq.php</p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nclass RedisSingleton\r\n{\r\n    private static $instance;\r\n\r\n    private\r\n        $redis,\r\n        $config = [\'host\' => \'127.0.0.1\', \'port\' => 25002];\r\n\r\n    private function __construct()\r\n    {\r\n        $this->redis = new Redis();\r\n        $this->redis->connect($this->config[\'host\'], $this->config[\'port\']);\r\n    }\r\n\r\n    public static function getInstance()\r\n    {\r\n        if (!self::$instance) {\r\n            self::$instance = new RedisSingleton();\r\n        }\r\n        return self::$instance->redis;\r\n    }\r\n\r\n}</xmp></code></pre><p>新增order.php文件，处理订单业务<br/></p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nrequire_once \'redis_mq.php\';\r\n\r\n\r\nclass Order\r\n{\r\n    private $redisClient;\r\n\r\n    public function __construct()\r\n    {\r\n        $this->redisClient = RedisSingleton::getInstance();\r\n    }\r\n\r\n    public function callbackToCp($orderData)\r\n    {\r\n        file_put_contents(\'/tmp/order_set.log\', json_encode($orderData) . PHP_EOL, FILE_APPEND);\r\n        //这里订单记录可以放到mysql,为了demo方便,直接把订单存到redis\r\n        $this->redisClient->set($orderData[\'order_num\'], json_encode($orderData));\r\n        $orderInfo = $this->redisClient->get($orderData[\'order_num\']);\r\n        $orderInfo = json_decode($orderInfo, 1);\r\n        if (empty($orderInfo[\'is_callback\'])) {\r\n            return false;\r\n        }\r\n        if (!$this->curlPost($orderInfo)) {\r\n            return false;\r\n        }\r\n        //TODO 通知成功，处理修改订单状态逻辑is_callback=1\r\n        $orderData[\'is_callback\'] = 1;\r\n        $this->redisClient->set($orderData[\'order_num\'], json_encode($orderData));\r\n        return true;\r\n    }\r\n\r\n    public function notifyCp($orderData)\r\n    {\r\n        $res = $this->callbackToCp($orderData);\r\n        //研发方响应失败，把失败订单写到有序集合里面，用于后续定时任务出列重复通知，通知5次\r\n        if (!$res) {\r\n            for ($i = 1; $i <= 5; $i++) {\r\n                //有序集合中的成员必须是唯一的。如果尝试插入一个已经存在的成员，它的分数将被更新，但返回值将是 0，表示插入失败,所以第三个参数需要做一下处理\r\n                $this->redisClient->zAdd(\'order_zset_fail\', time() + $i * 60, json_encode($orderData) . \'order_zset\' . $i);\r\n            }\r\n        }\r\n    }\r\n    private function curlPost($orderData)\r\n    {\r\n        //TODO 具体发送http请求逻辑\r\n        return false;\r\n    }\r\n\r\n}\r\n</xmp></code></pre><p>新建定时任务脚本cron.php<br/></p><pre><code class=\"Bash\"><xmp><?php\r\n\r\nif (php_sapi_name() !== \'cli\') {\r\n    exit(\'not cli run\');\r\n}\r\nrequire_once \'redis_mq.php\';\r\nrequire_once \'order.php\';\r\n\r\n$redisClient = RedisSingleton::getInstance();\r\n$order = new Order();\r\nwhile (true) {\r\n    $orderSuccessSet = [];\r\n    // 获取当前时间\r\n    $currentTime = time();\r\n    // 获取到期的订单通知\r\n    $orderFailSet = $redisClient->zRangeByScore(\'order_zset_fail\', \'-inf\', $currentTime);\r\n    if (empty($orderFailSet)) {\r\n        break;\r\n    }\r\n    foreach ($orderFailSet as $orderFailInfo) {\r\n        list($orderData, $num) = explode(\"order_zset\", $orderFailInfo);\r\n        // 处理订单通知\r\n        $orderData = json_decode($orderData, true);\r\n        var_dump($orderData);\r\n        //这里可以获取到通知状态，如果某个订单第一次通知就成功了，把在order_zset_fail集合里面相同的订单取出来，一并移除\r\n        $order->callbackToCp($orderData);\r\n    }\r\n    //移除已处理的通知\r\n    $redisClient->zRem(\'order_zset_fail\', ...$orderFailSet);\r\n    // 以避免频繁轮询Redis队列,添加适当的延时\r\n    usleep(100000); // 100毫秒\r\n}\r\n</xmp></code></pre><p>新建订单测试文件test.php<br/></p><pre><code class=\"Bash\"><xmp><?php\r\nrequire_once \'order.php\';\r\n//模拟要回调给研发方的订单\r\n$orderData = [\r\n    \'order_num\' => \'O\' . strval(time()),\r\n    \'uid\' => rand(10000, 999999),\r\n    \'is_callback\' => 0,\r\n    \'callback_count\' => 0, //通知次数\r\n    \'create_time\' => time(),\r\n];\r\n(new Order())->notifyCp($orderData);</xmp></code></pre><p>配置定时任务</p><pre><code class=\"Bash\"><xmp>* * * * * /usr/local/php7.3.10/bin/php /data/mq/redis/zset/cron.php</xmp></code></pre><p>说明<br/>test.php调用订单模块的通知研发方的方法notifyCp，如果研发方没有按需要的固定格式返回，就认为是失败订单，放到redis有序集合里面，设置定时任务，每分钟去取出集合里面的符合时间范围的失败订单，通知研发方发货。用有序集合方式，可以不需要记录某一笔订单的当前通知次数，构造需要通知多少条集合成员，每条集合成员需要间隔多少时间通知即可。</p>', '1', '1', '1', '0', '1701360000', '1', '2023-12', '1709023336', '1709180615');
INSERT INTO `sl_article` VALUES ('279', '376', '版本管理工具git的基本操作', null, null, 'nacholas', '', '', '<p>下载安装<br/><a href=\"https://git-scm.com/downloads\" target=\"_blank\">https://git-scm.com/downloads</a><br/>创建全局用户和邮箱<br/></p><pre><code class=\"Bash\"><xmp>git config --global user.name \"iamzcr\"\r\ngit config --global user.email\"iamzcr@gmail.com\"</xmp></code></pre><p>新建目录并进入目录创建文件README.md<br/></p><pre><code class=\"Bash\"><xmp>mkdir web_ads\r\ncd web_ads\r\necho \"# web_ads\" >> README.md</xmp></code></pre><p>初始化本地仓库<br/></p><pre><code class=\"Bash\"><xmp>git init</xmp></code></pre><p>查看本地仓库当前状态<br/></p><pre><code class=\"Bash\"><xmp>git status</xmp></code></pre><p>新增文件到本地仓库<br/></p><pre><code class=\"Bash\"><xmp>#新增文件<br/></xmp><xmp>git add .\r\n#提交文件\r\ngit commit -m \"first commit\"</xmp></code></pre><p>分支操作<br/></p><pre><code class=\"Bash\"><xmp>#查看当前操作的分支\r\ngit branch --show-current\r\n#查看所有分支\r\ngit branch\r\n#新建sub分支\r\ngit branch sub\r\n#切换到sub分支\r\ngit checkout sub</xmp></code></pre><p>合并分支操作<br/></p><pre><code class=\"Bash\"><xmp>#切换到子分支\r\ngit checkout sub\r\n#新增文件\r\ntouch test.php\r\n#新增操作\r\ngit add.\r\ngit commit -m \"first commit\"\r\n#切换到主分支\r\ngit checkout master\r\n#合并sub分支到主分支，合并前最好先查看当前是否主分支\r\ngit merge sub</xmp></code></pre><p>远程仓库操作</p><p>在GitHub上新建远程仓库，本地添加远程仓库</p><pre><code class=\"Bash\"><xmp>git remote add origin https://github.com/iamzcr/web_ads.git</xmp></code></pre><p>推送文件到远程仓库，由于GitHub的远程仓库的主分支是main，而本地仓库主分支是master，本地需要新建分支main，切换到main去推送</p><pre><code class=\"Bash\"><xmp>git push -u origin main</xmp></code></pre><p>查看远程分支</p><pre><code class=\"Bash\"><xmp>git branch -r</xmp></code></pre><p>提交本地分支到远程分支</p><pre><code class=\"Bash\"><xmp>#创建本地分支并切换到该分支\r\ngit checkout -b sub-branch\r\n#推送分支到远程仓库\r\ngit push origin sub-branch</xmp></code></pre>', '1', '1', '1', '0', '1551974400', '1', '2019-03', '1709170598', '1709184243');
INSERT INTO `sl_article` VALUES ('280', '372', 'Golang笔记--Golang简单使用', null, null, 'nacholas', '', '', '<p>下载</p><pre><code class=\"Bash\"><xmp>wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz</xmp></code></pre><p>安装</p><pre><code class=\"Bash\"><xmp>tar -xvf go1.22.0.linux-amd64.tar.gz \r\nmv go  /usr/local</xmp></code></pre><p>查看版本和env</p><pre><code class=\"Bash\"><xmp>/usr/local/go/bin/go version\r\n/usr/local/go/bin/go env</xmp></code></pre><p>开启模块支持</p><pre><code class=\"Bash\"><xmp>/usr/local/go/bin/go env  -w GO111MODULE=on</xmp></code></pre><p>由于有些包下载速度或者网络上有问题，修改代理。</p><pre><code class=\"Bash\"><xmp>/usr/local/go/bin/go env -w GOPROXY=https://goproxy.cn,direct</xmp></code></pre><p>go mod 使用，<span style=\"color: inherit; font-size: 1em;\">Go 1.11 版本引入</span><span style=\"color: inherit;\">模块化</span><span style=\"color: inherit; font-size: 1em;\">特性，</span><span style=\"color: inherit;\">go mod用于管理模块的工具，</span><span style=\"color: inherit; font-size: 1em;\">新建项目目录go_mod_demo,</span><span style=\"color: inherit;\">进入目录，</span><span style=\"font-size: 1em; color: inherit;\">初始化模块，会生成一个go.mod文件，</span><span style=\"font-size: 1em; color: inherit;\">用于定义项目的模块和依赖关系。</span></p><pre><code><xmp>/usr/local/go/bin/go mod init go_mod_demo</xmp></code></pre><p><span style=\"color: inherit; font-size: 1em;\">在</span><span style=\"color: inherit;\">go_mod_demo</span><span style=\"color: inherit; font-size: 1em;\">新建pkg1，pkg2目录，分别在两目录新建pkg1.go，pkg2.go。</span></p><pre><code class=\"Bash\"><xmp>// pkg1/package1.go\r\n\r\npackage pkg1\r\n\r\nimport \"fmt\"\r\n\r\nfunc Func1() {\r\n	fmt.Println(\"Func1 from pkg1\")\r\n}\r\n</xmp></code></pre><pre><code class=\"Bash\"><xmp>// pkg2/package2.go\r\n\r\npackage pkg2\r\n\r\nimport \"fmt\"\r\n\r\nfunc Func2() {\r\n	fmt.Println(\"Func2 from pkg2\")\r\n}</xmp></code></pre><p>在<span style=\"color: inherit;\">go_mod_demo</span><span style=\"font-size: 1em; color: inherit;\">新建main.go</span></p><pre><code class=\"Bash\"><xmp>// main.go\r\n\r\npackage main\r\n\r\nimport (\r\n	\"go_mod_demo/pkg1\"\r\n	\"go_mod_demo/pkg2\"\r\n)\r\n\r\nfunc main() {\r\n	pkg1.Func1()\r\n	pkg2.Func2()\r\n}</xmp></code></pre><p>运行main.go</p><pre><code class=\"Bash\"><xmp>/usr/local/go/bin/go run main.go \r\n#输出\r\nFunc1 from pkg1\r\nFunc2 from pkg2</xmp></code></pre><p><a href=\"https://github.com/iamzcr/go_demo/tree/main/go_mod_demo\" target=\"_blank\">demo下载</a><br/></p>', '1', '1', '1', '0', '1551369600', '1', '2019-03', '1709276919', '1710066578');
INSERT INTO `sl_article` VALUES ('281', '372', 'Golang笔记--切片(slice)的长度和容量', null, null, 'nacholas', '', '', '<p>前面简单介绍了切片(slice)的使用，这里聊聊slice的长度和容量，由于slice是<span style=\"font-size: 1em; color: inherit;\">对数组的一个连续片段的引用</span><span style=\"font-size: 1em; color: inherit;\">，所以有长度的，但是她比数组的容量有所不同，是可以自动扩容的，怎么理解呢？</span></p><p>先看看为什么切片是数组一个连续片段的引用，我们可以通过一个查看内存地址的实例来直观地观察。</p><pre><code class=\"Bash\"><xmp>package main\r\n\r\nimport \"fmt\"\r\n\r\nfunc main() {\r\n	//创建数组\r\n	var arr = [3]string{\"广州\", \"北京\", \"上海\"}\r\n	fmt.Println(\"没有修改slice[0]前的arr\", arr)\r\n	for i := 0; i < len(arr); i++ {\r\n		fmt.Printf(\"arr[%v]内存地址： %p\\n\", arr[i], &arr[i])\r\n	}\r\n\r\n	//切割数组赋值给变量slice\r\n	slice := arr[1:2]\r\n	for i := 0; i < len(slice); i++ {\r\n		fmt.Printf(\"slice[%v]内存地址： %p\\n\", slice[i], &slice[i])\r\n	}\r\n	slice[0] = \"深圳\"\r\n	fmt.Println(\"修改slice[0]后的arr\", arr)\r\n\r\n}\r\n\r\n//输出\r\n没有修改slice[0]前的arr [广州 北京 上海]\r\narr[广州]内存地址： 0x9851398\r\narr[北京]内存地址： 0x98513a0\r\narr[上海]内存地址： 0x98513a8\r\nslice[北京]内存地址： 0x98513a0\r\n修改slice[0]后的arr [广州 深圳 上海]\r\n</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">上面的案例，我们创建一个数组arr，切割操作赋值给变量slice，再分别打印arr和slice的值内存地址，可以看到arr第1个元素的值是北京，内存地址是</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">0x9c513a0，而</span><span style=\"font-size: 1em; color: inherit;\">slice是从arr的第一个元素开始切割，切割一个元素出来的切片，第0个元素的值是北京，内存地址是</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">0x9c513a0，这两个地址是一样的，说明slice[0],和arr[1]指向同一个地址。所以说切片是数组的一个引用片段，下面修改了slice[0]=深圳，arr也会被修改，证明slice确实是一个底层数组的引用。</span></p><p>既然切片是数组的一个引用，但是数组是有长度的，如果超出了长度，编译器会越界错误，那么slice是怎么处理的呢，看下面一个案例，<span style=\"font-size: 1em; color: rgb(51, 51, 51);\"><br/></span></p><pre><code class=\"Bash\"><xmp>package main\r\n\r\nimport \"fmt\"\r\n\r\nfunc main() {\r\n	//创建slice\r\n	var slice = []string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\"}\r\n	fmt.Printf(\"slice内存地址： %p；slice长度：%v；slice长度：%v\\n\", &slice[0], len(slice), cap(slice))\r\n\r\n	sliceAppFirst := append(slice, \"重庆\")\r\n	fmt.Printf(\"sliceAppFirst内存地址： %p；sliceAppFirst长度：%v；sliceAppFirst容量：%v\\n\", &sliceAppFirst[0], len(sliceAppFirst), cap(sliceAppFirst))\r\n\r\n	sliceAppSecond := append(sliceAppFirst, \"成都\")\r\n	fmt.Printf(\"sliceAppSecond内存地址： %p；sliceAppSecond长度：%v；sliceAppSecond容量：%v\\n\", &sliceAppSecond[0], len(sliceAppSecond), cap(sliceAppSecond))\r\n\r\n	sliceAppSecond[1] = \"洛阳\"\r\n	fmt.Printf(\"slice： %v\\n\", slice)\r\n	fmt.Printf(\"sliceAppFirst： ： %v\\n\", sliceAppFirst)\r\n	fmt.Printf(\"sliceAppSecond： ： %v\\n\", sliceAppSecond)\r\n\r\n}\r\n//输出\r\nslice内存地址： 0x9822060；slice长度：5；slice长度：5\r\nsliceAppFirst内存地址： 0x986a000；sliceAppFirst长度：6；sliceAppFirst容量：10\r\nsliceAppSecond内存地址： 0x986a000；sliceAppSecond长度：7；sliceAppSecond容量：10\r\nslice： [广州 北京 上海 深圳 武汉]\r\nsliceAppFirst： ： [广州 洛阳 上海 深圳 武汉 重庆]\r\nsliceAppSecond： ： [广州 洛阳 上海 深圳 武汉 重庆 成都]\r\n\r\n</xmp></code></pre><p><span style=\"color: inherit;\">上面的案例，</span>定义一个长度和容量都是5的<span style=\"color: inherit;\">slice,首个元素的内存地址是</span><span style=\"color: rgb(51, 51, 51);\">0x9822060</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">，当追加重庆到slice里面赋值给变量</span><span style=\"font-size: 1em; color: inherit;\">sliceAppFirst</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">，可以看到长度变成了6，容量扩大了一倍变成10，内存地址也跟着变了，也就是这个时候的切片不再指向开始定义的数组了，而是开辟一个新地址来存储新的数组，追加成都到</span><span style=\"font-size: 1em; color: inherit;\">sliceAppFirst赋值给</span><span style=\"font-size: 1em; color: inherit;\">sliceAppSecond</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">，可以看到</span><span style=\"font-size: 1em; color: inherit;\">sliceAppSecond的容量并没有发生变化，只是长度加了1，而且</span><span style=\"font-size: 1em; color: inherit;\">sliceAppFirst和</span><span style=\"font-size: 1em; color: inherit;\">sliceAppSecond的首个元素的地址是一样的</span><span style=\"color: rgb(51, 51, 51);\">0x986a000</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">，并没有发生变化，所以指向的是同一个底层数组的。所以修改了</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">sliceAppSecond第一个元素为洛阳，</span><span style=\"font-size: 1em; color: inherit;\">sliceAppFirst会跟着变化，而</span><span style=\"font-size: 1em; color: rgb(51, 51, 51);\">slice不会变化。&nbsp;</span></p><p><span style=\"font-size: 1em; color: inherit;\">小结</span></p><p>slice长度(len)：切片的元素个数决定了切片的长度。</p><p>slice容量(cap)：如果slice的底层数组比slice还大，那么就说该slice还有容量可以增长使用,采用append追加一个元素，则不开辟新的数组，否则开辟新的一个数组，容量也会跟着变化。</p>', '1', '1', '1', '0', '1551196800', '1', '2019-02', '1709382468', '1709545692');
INSERT INTO `sl_article` VALUES ('282', '370', 'Golang笔记--切片的三索引切分', null, null, 'nacholas', '', '', '<p>在go1.2中引入了能够限制新建切片容量的三索引切分操作，<span style=\"font-size: 1em; color: inherit;\">允许创建新的切片，并指定这个新切片的长度和容量</span><span style=\"font-size: 1em; color: inherit;\">，什么叫三索引切分呢，看看下面的两个索引拆分后的长度和容量</span><span style=\"color: inherit;\">。</span></p><pre><code class=\"Bash\"><xmp>var areaSlice = []string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\", \"重庆\", \"成都\", \"洛阳\"}\r\nareaSlice1 := areaSlice[1:3]\r\nfmt.Printf(\"areaSlice1值%v，长度%v，容量%v，类型%T\\n\", areaSlice1, len(areaSlice1), cap(areaSlice1), areaSlice1)\r\n\r\n//输出\r\nareaSlice1值[北京 上海]，长度2，容量7，类型[]string</xmp></code></pre><p>上面案例中，对areaSlice做了从第一个元素开始，到第三个元素(不包含)切分了一个切片，在<a href=\"http://iamzcr.com/article/detail.html?id=290\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">Golang笔记--切片(slice)的使用</a>这里可以知道，出来的是一个长度为2，容量为7的这么一个切片。</p><p>而在golang的1.2以上版本，slice的切分提供了一个可限制容量的索引。</p><pre><code class=\"Bash\"><xmp>var areaSlice = []string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\", \"重庆\", \"成都\", \"洛阳\"}\r\nareaSlice2 := areaSlice[1:3:5]\r\nfmt.Printf(\"areaSlicea2值%v，长度%v，容量%v，类型%T\\n\", areaSlice2, len(areaSlice2), cap(areaSlice2), areaSlice2)\r\n\r\n//输出\r\nareaSlicea2值[北京 上海]，长度2，容量4，类型[]string</xmp></code></pre><p>看案例<span style=\"font-size: 1em; color: inherit;\">areaSlice2 := areaSlice[1:3:5]，最后的5，实际上是指最后出来的容量按初始索引计算到5，不包括5，也就是出来的切片的容量是4，这样可以显式控制切片容量的大小。</span></p><p><span style=\"font-size: 1em; color: inherit;\">小结：</span></p><p>1、Golang1.2版本以上允许你控制切片的容量，即底层数组的大小，通过显式设置容量限制</p><p>2、显式控制切片容量的时候，需要你确保新切片不会访问原始切片超出容量限制的部分，不然潜在的越界访问错误。</p>', '1', '1', '1', '0', '1688659200', '1', '2023-07', '1709388663', '1709962906');
INSERT INTO `sl_article` VALUES ('283', '372', 'Golang笔记--defer关键字', null, null, 'nacholas', '', '', '<p>defer是goland中的一个关键词，<span style=\"font-size: 1em; color: inherit;\">用于延迟执行一个函数调用，通常用于在函数返回之前执行一些清理操作，无论函数是否发生错误。</span><span style=\"font-size: 1em; color: inherit;\">当函数中的defer语句被执行时，被延迟的函数调用会被推入一个栈中，然后在函数返回时按照后进先出（LIFO）的顺序执行。</span><span style=\"font-size: 1em; color: inherit;\">defer语句在函数中的位置并不重要，它们会在函数返回之前的任何时候都被执行。如下</span></p><pre><code class=\"Bash\"><xmp>package main\r\n\r\nimport (\r\n	\"fmt\"\r\n)\r\n\r\nfunc main() {\r\n	defer func() {\r\n		fmt.Println(\"第一个defer。\")\r\n	}()\r\n	defer func() {\r\n		fmt.Println(\"第二个defer。\")\r\n	}()\r\n	defer func() {\r\n		fmt.Println(\"第三个defer。\")\r\n	}()\r\n	fmt.Println(\"主进程运行结束。\")\r\n}</xmp></code></pre><p>上面案例会输出</p><pre><code class=\"Bash\"><xmp>主进程运行结束。\r\n第三个defer。\r\n第二个defer。\r\n第一个defer。</xmp></code></pre><p>defer的机制，在某些资源处理上是很有用的，<span style=\"color: inherit;\">例如在文件操作中，使用defer关闭文件，无论是否正常读取，都用defer关键字调用关闭操作。</span></p><pre><code class=\"Bash\"><xmp>package main\r\n\r\nimport (\r\n	\"fmt\"\r\n	\"os\"\r\n)\r\n\r\nfunc main() {\r\n	_, err := readFile(\"test.txt\")\r\n	if err != nil {\r\n		fmt.Println(\"读取文件时发生错误:\", err)\r\n		return\r\n	}\r\n	fmt.Println(\"主进程运行结束。\")\r\n\r\n}\r\n\r\nfunc readFile(filename string) ([]string, error) {\r\n	file, err := os.Open(filename)\r\n	if err != nil {\r\n		return nil, err\r\n	}\r\n	// 确保文件在函数返回前被关闭\r\n	defer func() {\r\n		err := file.Close()\r\n		if err != nil {\r\n			fmt.Println(\"关闭文件时发生错误:\", err)\r\n		} else {\r\n			fmt.Println(\"成功关闭文件:\", err)\r\n		}\r\n	}()\r\n	lines := []string{}\r\n	return lines, nil\r\n}\r\n//输出\r\n成功关闭文件: <nil>\r\n主进程运行结束。</xmp></code></pre><p><span style=\"color: inherit; font-size: 1em;\">当开发中</span><span style=\"color: inherit; font-size: 1em;\">使用defer语句确保在函数返回之前释放锁，避免忘记释放锁导致死锁的情况。</span></p><pre><code class=\"Bash\"><xmp>package main\r\n\r\nimport (\r\n	\"fmt\"\r\n	\"sync\"\r\n	\"sync/atomic\"\r\n	\"time\"\r\n)\r\n\r\nfunc main() {\r\n	var mutex sync.Mutex\r\n	var counter int32\r\n	var wg sync.WaitGroup\r\n	num := 2\r\n	for i := 0; i < num; i++ {\r\n		wg.Add(1)\r\n		go func(id int) {\r\n			fmt.Printf(\"第 %d 个goroutine尝试进入临界区\\n\", id)\r\n			mutex.Lock()\r\n			defer func() {\r\n				mutex.Unlock()\r\n				atomic.AddInt32(&counter, 1) // 利用原子操作，增加计数器\r\n				wg.Done()\r\n			}()\r\n			fmt.Printf(\"第 %d 个goroutine 进入临界区\\n\", id)\r\n			// 在临界区执行操作，模拟等待时常，例如一些数据库的更新操作\r\n			time.Sleep(time.Second)\r\n			fmt.Printf(\"第 %d 个goroutine离开临界区\\n\", id)\r\n		}(i)\r\n	}\r\n	// 等待所有goroutine执行完毕\r\n	wg.Wait()\r\n	// 检查计数器的值，如果所有goroutine都正确释放了锁，计数器应该等于goroutine的数量\r\n	if atomic.LoadInt32(&counter) == int32(num) {\r\n		fmt.Println(\"所有锁都被正确释放\")\r\n	} else {\r\n		fmt.Println(\"存在锁泄漏\")\r\n	}\r\n}</xmp></code></pre><p>案例输出：</p><pre><code class=\"Bash\"><xmp>第 1 个goroutine尝试进入临界区\r\n第 1 个goroutine 进入临界区\r\n第 0 个goroutine尝试进入临界区\r\n第 1 个goroutine离开临界区\r\n第 0 个goroutine 进入临界区\r\n第 0 个goroutine离开临界区\r\n所有锁都被正确释放</xmp></code></pre><p>因此，可以通过defer来确保资源的释放、锁的释放、等其他一些必要的清理操作，尽量避免忘记执行清理操作的风险。</p>', '1', '1', '1', '0', '1551369600', '1', '2019-03', '1709491181', '1709549709');
INSERT INTO `sl_article` VALUES ('284', '372', 'Golang笔记--常量和iota', null, null, 'nacholas', '', '', '<p>Golang中常量的值是在编译时确定的，它们在程序运行时是不可变的，<span style=\"font-size: 1em; color: inherit;\">声明一般用大写。</span></p><pre><code class=\"Bash\"><xmp>声明一般用大写\r\n\r\nconst PI = \"3014.158\"\r\nfmt.Printf(\"PI...%v,%T\\n\", PI, PI)\r\n\r\n//多个常量一起声明。\r\nconst (\r\n	A = \"A\"\r\n	B = 1\r\n)\r\nfmt.Printf(\"A...%v,%T...B...%v,%T\\n\", A, A, B, B)\r\n\r\n//多个常量一起声明，如果第一个赋值，其他不赋值，其他的值和第一个常量的值一样。\r\nconst (\r\n	C = \"C\"\r\n	D\r\n	E\r\n)\r\nfmt.Printf(\"C...%v,%T...D...%v,%T...E...%v,%T\\n\", C, C, D, D, E, E)\r\n//输出\r\nPI...3014.158,string\r\nA...A,string...B...1,int\r\nC...C,string...D...C,string...E...C,string\r\n</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">iota是go语言的常量计数器，只能在常量表达式中使用。</span><br/></p><pre><code class=\"Bash\"><xmp>const iotaTest = iota\r\nfmt.Printf(\"iotaTest...%v,%T\\n\", iotaTest, iotaTest)\r\n\r\n//多个常量定义，如果首个常量是iota，那么默认是0，后面常量会自动加1\r\nconst (\r\n	iota1 = iota\r\n	iota2\r\n	iota3\r\n)\r\nfmt.Printf(\"iota常量...%v,%v,%v\\n\", iota1, iota2, iota3)\r\n\r\n//使用_跳过某些值\r\nconst (\r\n	iota4 = iota\r\n	_\r\n	iota5\r\n)\r\nfmt.Printf(\"iota跳过某些值...%v,%v\\n\", iota4, iota5)\r\n//使用iota声明时候，中间插入一个初始化\r\nconst (\r\n	iota6 = iota\r\n	iota7 = 100\r\n	iota8 = iota\r\n	iota9\r\n)\r\nfmt.Printf(\"iota中间插入...%v,%v,%v,%v\\n\", iota6, iota7, iota8, iota9)\r\n\r\n//多个iota定义在一行，其中的递增计算，第二行的声明列数和第一行一致，否则编译报错,所以可理解为const语句块中的行索引。\r\nconst (\r\n	iota10, iota11 = iota + 1, iota + 3\r\n	iota12, iota13\r\n)\r\nfmt.Printf(\"iota多个iota定义在一行...%v,%v,%v,%v\\n\", iota10, iota11, iota12, iota13)\r\n\r\n//输出\r\niotaTest...0,int                          \r\niota常量...0,1,2                          \r\niota跳过某些值...0,2                      \r\niota中间插入...0,100,2,3                  \r\niota多个iota定义在一行...1,3,2,4 \r\n</xmp></code></pre><p><br/></p><div style=\"background-color:#1e1f22;color:#bcbec4\"></div><div style=\"background-color:#1e1f22;color:#bcbec4\"></div>', '1', '1', '1', '0', '1549555200', '1', '2019-02', '1709734959', null);
INSERT INTO `sl_article` VALUES ('285', '372', 'Golang笔记--整数类型', null, null, 'nacholas', '', '', '<p>Golang中的整数类型有十种，其中两种int和uint是根据操作系统的位数<span style=\"font-size: 1em; color: inherit;\">决于系统的位数和编译器的实现，不同的编译器可能会有所不同</span><span style=\"font-size: 1em; color: inherit;\">。</span></p><p>int8：8位有符号整数，取值范围从-128到127。<br/>uint8：8位无符号整数，取值范围从0到255。<br/><br/>int16：16位有符号整数，取值范围从-32768到32767。<br/>uint16：16位无符号整数，取值范围从0到65535。<br/><br/>int32：32位有符号整数，取值范围从-2147483648到2147483647。<br/>uint32：32位无符号整数，取值范围从0到4294967295。<br/><br/>int64：64位有符号整数，取值范围从-9223372036854775808到9223372036854775807。<br/>uint64：64位无符号整数，取值范围从0到18446744073709551615。<br/><br/>上面的类型它们的长度不受系统架构的影响，始终是固定的，此外，Go语言还提供了两个与平台相关的整数类型：<br/><br/>int：有符号整数类型，int可以是32位或64位的有符号整数。<br/>uint：与int相对应的无符号整数类型，同样根据计算机架构可以是32位或64位。<br/><br/>在32位系统中：<br/>int类型通常是32位有符号整数，取值范围从-2147483648到2147483647。<br/>uint类型通常是32位无符号整数，取值范围从0到4294967295。<br/><br/>在64位系统中：<br/>int类型通常是64位有符号整数，取值范围从-9223372036854775808到9223372036854775807。<br/>uint类型通常是64位无符号整数，取值范围从0到18446744073709551615。</p><pre><code class=\"Bash\"><xmp>//整数类型只声明，不赋值默认是0,unsafe.Sizeof方法可以查看占用多少存储空间(字节)\r\nvar num int\r\nfmt.Printf(\"num 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", num, num, unsafe.Sizeof(num))\r\n\r\n//如果不指定类型，默认是int类型\r\nnum1 := 1000\r\nfmt.Printf(\"num2 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num1, unsafe.Sizeof(num1))\r\n\r\nvar num2 = 1000\r\nfmt.Printf(\"num2 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num2, unsafe.Sizeof(num2))\r\n\r\n//初始化赋值的时候,也可以显式指定类型\r\nvar num3 int = 1000\r\nfmt.Printf(\"num3 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num3, unsafe.Sizeof(num3))\r\n\r\n//初始化赋值int64\r\nvar num4 int64 = 1000\r\nfmt.Printf(\"num4 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num4, unsafe.Sizeof(num4))\r\n\r\n//如果某个数超过了该类型的大小，就会发生环绕，例如，如果test是uint8，最大值为255，计算超过了该值，则会变成0,所以在设计的时候需要特别注意\r\nvar num5 uint8 = 255\r\nfmt.Printf(\"num5 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num5, unsafe.Sizeof(num5))\r\nnum5++\r\nfmt.Printf(\"num5 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", num5, unsafe.Sizeof(num5))\r\n\r\n//高位如果向低位转换需要注意不要超出低位的长度\r\nvar num6 = 140\r\nfmt.Printf(\"num6 数据类型为%T，值为%[1]v，占用存储空间为%v字节\\n\", int8(num6), unsafe.Sizeof(num6))\r\n\r\nvar num7 = 140\r\n//输出数字字面量,其他进制\r\nfmt.Printf(\"num7 数据类型为%[1]T，值为%[1]v，十进制为%[1]d，二进制为%[1]b，八进制为%[1]o，十六进制为%[1]x，占用存储空间为%v字节\\n\", num7, unsafe.Sizeof(num7))\r\n\r\n//输出\r\nnum 数据类型为int，值为0，占用存储空间为4字节\r\nnum2 数据类型为int，值为1000，占用存储空间为4字节\r\nnum2 数据类型为int，值为1000，占用存储空间为4字节\r\nnum3 数据类型为int，值为1000，占用存储空间为4字节\r\nnum4 数据类型为int64，值为1000，占用存储空间为8字节\r\nnum5 数据类型为uint8，值为255，占用存储空间为1字节\r\nnum5 数据类型为uint8，值为0，占用存储空间为1字节\r\nnum6 数据类型为int8，值为-116，占用存储空间为4字节\r\nnum7 数据类型为int，值为140，十进制为140，二进制为10001100，八进制为214，十六进制为8c，占用存储空间为4字节</xmp></code></pre>', '1', '1', '1', '0', '1548950400', '1', '2019-02', '1709796075', '1709811717');
INSERT INTO `sl_article` VALUES ('286', '371', 'Golang笔记--浮点型和布尔型', null, null, 'nacholas', '', '', '<p>golang中浮点类型有float32和float64两种：<br/>float64浮点数类型：不显式声明，含有小数的都是默认float64，占用8个字节内存，默认保留6位小数，如果没有为科学计数法形式的数指定类型，那么会被视为float64类型。<br/>float32浮点数类型：占用4个字节内存，默认保留6位小数，可以节省内存，但是math标准库里面的函数操作都是float64，所以实际开发应该选择放float64。</p><pre><code class=\"Bash\"><xmp>//浮点型，浮点型只声明，不赋值默认是0\r\nvar float float64\r\nfmt.Printf(\"float 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", float, float, unsafe.Sizeof(float))\r\n//只要含有小数，都是float64类型\r\nfloat1 := 4.356\r\nfmt.Printf(\"float1 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", float1, float1, unsafe.Sizeof(float1))\r\n\r\nvar float2 = 4.356\r\nfmt.Printf(\"float2 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", float2, float2, unsafe.Sizeof(float2))\r\n\r\nvar float3 float64 = 4.356\r\nfmt.Printf(\"float3 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", float3, float3, unsafe.Sizeof(float3))\r\n\r\n//默认保留6位小数\r\nvar float4 float32 = 4.356\r\nvar float5 = 4.356\r\nfmt.Printf(\"float4 数据类型为%T，值为%v，默认保留小数为%f，占用存储空间为%v字节\\n\", float4, float4, float4, unsafe.Sizeof(float4))\r\nfmt.Printf(\"float5 数据类型为%T，值为%v，默认保留小数为%f，占用存储空间为%v字节\\n\", float5, float5, float5, unsafe.Sizeof(float5))\r\n//保留两位小数\r\nfmt.Printf(\"float5 数据类型为%T，值为%v，默认保留小数为%.2f，占用存储空间为%v字节\\n\", float5, float5, float5, unsafe.Sizeof(float5))\r\n\r\n//如果没有为科学计数法形式的数指定类型，那么会被视为float64类型\r\nvar float6 = 2e2 //2 * 10的二次方\r\nfmt.Printf(\"float6 数据类型为%T，值为%v，默认保留小数为%f，占用存储空间为%v字节\\n\", float6, float6, float6, unsafe.Sizeof(float6))\r\n\r\n//输出\r\nfloat 数据类型为float64，值为0，占用存储空间为8字节\r\nfloat1 数据类型为float64，值为4.356，占用存储空间为8字节\r\nfloat2 数据类型为float64，值为4.356，占用存储空间为8字节\r\nfloat3 数据类型为float64，值为4.356，占用存储空间为8字节\r\nfloat4 数据类型为float32，值为4.356，默认保留小数为4.356000，占用存储空间为4字节\r\nfloat5 数据类型为float64，值为4.356，默认保留小数为4.356000，占用存储空间为8字节\r\nfloat5 数据类型为float64，值为4.356，默认保留小数为4.36，占用存储空间为8字节\r\nfloat6 数据类型为float64，值为200，默认保留小数为200.000000，占用存储空间为8字节</xmp></code></pre><p>精度问题，<span style=\"color: rgb(51, 51, 51);\">浮点型的计算可能会丢失精度的问题，</span><span style=\"color: rgb(51, 51, 51);\">如果确实需要比较，可以通过定义一个容差值，如果计算出来的值和我们预想的值相减的绝对值少于容差值，那么就认为足够接近预想的值。</span></p><pre><code class=\"Bash\"><xmp>num1, num2 := 8.2, 2.8\r\nfloat9 := num1 - num2\r\nfmt.Printf(\"float9 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", float9, float9, unsafe.Sizeof(float9))\r\n\r\nfmt.Println(\"float9=====\", float9 == 5.4)\r\n//理论上是true的，由于浮点数的精度问题，返回false，所以使用上要小心，如果确实需要比较，可以通过定义一个容差值,如果计算出来的值和我们预想的值相减的绝对值少于容差值，那么就认为足够接近预想的值\r\nepsilon := 0.00001\r\nfmt.Println(\"float9容差值=====\", math.Abs(float9-5.4) < epsilon)\r\n\r\n//输出\r\nfloat9 数据类型为float64，值为5.3999999999999995，占用存储空间为8字节\r\nfloat9===== false\r\nfloat9容差值===== true\r\n</xmp></code></pre><p>或者可以使用第三方库”<span style=\"color: rgb(106, 171, 115); background-color: rgb(245, 245, 245); font-family: &quot;JetBrains Mono&quot;, monospace; font-size: 12pt;\">github.com/shopspring/decimal</span><span style=\"font-size: 1em; color: inherit;\">“来计算，该库的底层也是通过标准库的big库来配合实现的。</span></p><pre><code class=\"Bash\"><xmp>num1, num2 := 8.2, 2.8\r\nsub := decimal.NewFromFloat(num1).Sub(decimal.NewFromFloat(num2))\r\nfmt.Printf(\"float9 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", sub, sub, unsafe.Sizeof(sub))\r\n\r\n//输出\r\nfloat9 数据类型为decimal.Decimal，值为5.4，占用存储空间为8字节<br/></xmp></code></pre><p>布尔类型类型只有true和false两个值，布尔类型变量的默认值位false，不允许将整型强制转换位布尔型，布尔型没法参与数值的运算,也无法与其他类型进行转换。</p><pre><code class=\"Bash\"><xmp>//声明,不赋值,默认flase\r\nvar flag bool\r\nfmt.Printf(\"flag 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", flag, flag, unsafe.Sizeof(flag))\r\n\r\nvar flag1 = true\r\nfmt.Printf(\"flag1 数据类型为%T，值为%v，占用存储空间为%v字节\\n\", flag1, flag1, unsafe.Sizeof(flag1))\r\n\r\n//输出\r\nflag 数据类型为bool，值为false，占用存储空间为1字节\r\nflag1 数据类型为bool，值为true，占用存储空间为1字节\r\n</xmp></code></pre>', '1', '1', '1', '0', '1548864000', '1', '2019-01', '1709812575', '1709812649');
INSERT INTO `sl_article` VALUES ('287', '372', 'Golang笔记--字符(rune和byte)', null, null, 'nacholas', '', '', '<p>字符是组成每个字符串的元素叫做字符，可以通过遍历字符串获得字符。<br/>golang的字符类型有byte和rune类型：<br/>byte代表一个ascii码值的一个字符，实际上是一个无符号的int8类型uint8，也就是和uint8声明的变量可以相互赋值，默认是0，对应的符号是空，占用1个字节存储空间。<br/>rune类型，代表一个unicode编码字符，际类型是int32,也就是和int32声明的变量可以相互赋值，默认是0，对应的符号是空，占用4个字节的存储空间。<br/></p><pre><code class=\"Bash\"><xmp>var defaultRune rune\r\nfmt.Printf(\"defaultRune 数据类型为%T，ascii码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", defaultRune, defaultRune, defaultRune, unsafe.Sizeof(defaultRune))\r\n\r\nvar defaultByte byte\r\nfmt.Printf(\"defaultByte 数据类型为%T，ascii码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", defaultByte, defaultByte, defaultByte, unsafe.Sizeof(defaultByte))\r\n\r\n//声明初始化byte类型字符\r\n//具体参考https://www.w3school.com.cn/charsets/ref_html_ascii.asp\r\nvar byte1 byte = \'a\'\r\nfmt.Printf(\"byte1 数据类型为%T，ascii码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", byte1, byte1, byte1, unsafe.Sizeof(byte1))\r\n\r\n//隐式声明一个字符,默认是rune类型的字符,也就是int32,占用4个字节存储空间.\r\nrune1 := \'a\'\r\nfmt.Printf(\"byte2 数据类型为%T，unicode编码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", rune1, rune1, rune1, unsafe.Sizeof(rune1))\r\n\r\nrune2 := \'我\'\r\nfmt.Printf(\"byte2 数据类型为%T，unicode编码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", rune2, rune2, rune2, unsafe.Sizeof(rune2))</xmp></code></pre><p><span style=\"font-size: 1em; color: inherit;\">字符串的长度是指字节的长度，</span>字符串可以转化为rune或者byte类型。</p><pre><code class=\"Bash\"><xmp>var str = \"吃饭了,hello\"\r\nfmt.Println(\"str字节长度:\", len(str))\r\n//byte类型\r\nbyteSlice := []byte(str)\r\nfor i := 0; i < len(byteSlice); i++ {\r\n	fmt.Printf(\"数据类型为%T，ascii码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", byteSlice[i], byteSlice[i], byteSlice[i], unsafe.Sizeof(byteSlice[i]))\r\n}\r\nfmt.Println(\"===========\")\r\nfor i := 0; i < len(str); i++ {\r\n	fmt.Printf(\"数据类型为%T，ascii码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", str[i], str[i], str[i], unsafe.Sizeof(str[i]))\r\n}\r\nfmt.Println(\"===========\")\r\n\r\n//rune类型\r\nruneSlice := []rune(str)\r\nfor i := 0; i < len(runeSlice); i++ {\r\n	fmt.Printf(\"数据类型为%T，unicode编码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", runeSlice[i], runeSlice[i], runeSlice[i], unsafe.Sizeof(runeSlice[i]))\r\n}\r\nfmt.Println(\"===========\")\r\nfor _, r := range str {\r\n	fmt.Printf(\"数据类型为%T，unicode编码值为%v，输出字符值为%c，占用存储空间为%v字节\\n\", r, r, r, unsafe.Sizeof(r))\r\n}\r\n\r\n//rune类型或者byte类型切片转换字符串,转换后分配新的内存地址\r\nbyteStr := string(byteSlice)\r\nruneStr := string(runeSlice)\r\nfmt.Printf(\"源字符串内存地址:%p,新字符串数据类型为:%T，值为:%v，内存地址值为:%p\\n\", &str, byteStr, byteStr, &byteStr)\r\nfmt.Printf(\"源字符串内存地址:%p,新字符串数据类型为:%T，值为:%v，内存地址值为:%p\\n\", &str, runeStr, runeStr, &runeStr)</xmp></code></pre><p><a href=\"https://www.w3school.com.cn/charsets/ref_html_ascii.asp\" target=\"_blank\">ascii码</a><br/></p>', '1', '1', '1', '0', '1548864000', '1', '2019-01', '1709825739', null);
INSERT INTO `sl_article` VALUES ('288', '372', 'Golang笔记--基本数据类型转换', null, null, 'nacholas', '', '', '<p>基本数据类型转换。</p><p>整型，浮点型之间可以相互显式转换，但是需要注意精度。<br/>整型，浮点型，字符型，布尔型转可以换成字符串，有两种方式，一种是strconv库操作，还可以通过fmt库的Sprintf函数操作。</p><pre><code class=\"Bash\"><xmp>//整型换成字符串\r\nvar num = 64\r\nnumStr := fmt.Sprintf(\"%d\", num)\r\nfmt.Printf(\"值%v,类型%T\\n\", numStr, numStr)\r\n//浮点换成字符串\r\nvar float1 = 125.6\r\nfloatStr := fmt.Sprintf(\"%f\", float1)\r\nfmt.Printf(\"值%v,类型%T\\n\", floatStr, floatStr)\r\n//布尔类型换成字符串\r\nvar bool1 = true\r\nboolStr := fmt.Sprintf(\"%t\", bool1)\r\nfmt.Printf(\"值%v,类型%T\\n\", boolStr, boolStr)\r\n//字符换成字符串\r\nvar byte1 = \'a\'\r\nbyteStr := fmt.Sprintf(\"%c\", byte1)\r\nfmt.Printf(\"值%v,类型%T\\n\", byteStr, byteStr)\r\n\r\n//strconv整型int64转字符串,第二个参数表示格式化为什么进制\r\nnumStr1 := strconv.FormatInt(int64(num), 10)\r\nfmt.Printf(\"strconv转换,值%v,类型%T\\n\", numStr1, numStr1)\r\n//strconv整型int转字符串\r\nnumStr2 := strconv.Itoa(num)\r\nfmt.Printf(\"strconv转换,值%v,类型%T\\n\", numStr2, numStr2)\r\n//strconv浮点转字符串\r\nfloatStr1 := strconv.FormatFloat(float1, \'f\', -1, 64)\r\nfmt.Printf(\"strconv转换,值%v,类型%T\\n\", floatStr1, floatStr1)\r\n//strconv字符转字符串,第二个参数表示格式化为什么进制\r\nbyteStr1 := strconv.FormatUint(uint64(byte1), 10)\r\nfmt.Printf(\"strconv转换,值%v,类型%T\\n\", byteStr1, byteStr1)\r\n//strconv字符转字符串,第二个参数表示格式化为什么进制\r\nboolStr2 := strconv.FormatBool(bool1)\r\nfmt.Printf(\"strconv转换,值%v,类型%T\\n\", boolStr2, boolStr2)\r\n\r\n//字符串转浮点类型\r\nvar str = \"123.5666\"\r\nfloat2, _ := strconv.ParseFloat(str, 64)\r\nfmt.Printf(\"strconv字符串转换,值%v,类型%T\\n\", float2, float2)\r\n\r\n//字符串转整型int和转int64\r\nvar str1 = \"123\"\r\nint1, _ := strconv.Atoi(str1)\r\nfmt.Printf(\"strconv字符串转换,值%v,类型%T\\n\", int1, int1)\r\n//第一个参数是进制,第二个是格式化成位数\r\nint2, _ := strconv.ParseInt(str1, 10, 64)\r\nfmt.Printf(\"strconv字符串转换,值%v,类型%T\\n\", int2, int2)\r\n\r\n//字符串转字符\r\nvar str2 = \"a\"\r\nbyte2, _ := strconv.ParseUint(str2, 10, 64)\r\nfmt.Printf(\"strconv字符串转换,值%v,类型%T\\n\", byte2, byte2)\r\n\r\n//字符串转布尔型\r\nvar str3 = \"true\"\r\nbool2, _ := strconv.ParseBool(str3)\r\nfmt.Printf(\"strconv字符串转换,值%v,类型%T\\n\", bool2, bool2)</xmp></code></pre><p>输出</p><pre><code class=\"Bash\"><xmp>值64,类型string\r\n值125.600000,类型string\r\n值true,类型string\r\n值a,类型string\r\nstrconv转换,值64,类型string\r\nstrconv转换,值64,类型string\r\nstrconv转换,值125.6,类型string\r\nstrconv转换,值97,类型string\r\nstrconv转换,值true,类型string\r\nstrconv字符串转换,值123.5666,类型float64\r\nstrconv字符串转换,值123,类型int\r\nstrconv字符串转换,值123,类型int64\r\nstrconv字符串转换,值0,类型uint64\r\nstrconv字符串转换,值true,类型bool</xmp></code></pre>', '1', '1', '1', '0', '1550160000', '1', '2019-02', '1709831777', '1709831843');
INSERT INTO `sl_article` VALUES ('289', '372', 'Golang笔记--数组的使用', null, null, 'nacholas', '', '', '<p>数组是同一类型数据的集合，长度不可变，是值数据类型非引用数据类型，所以数组作为函数的参数是非常低效的。<br/>数组的元素个数称为数组长度，长度是类型的一部分[5]int，[10]int是不同的类型。<br/>数组只是声明，不赋值，素是对应类型的初始值，如int为0。<br/>数组赋值如果超出数组长度，编译器在检测到对越界元素的访问时会报错，如果在编译时没有发现越界错误，程序会在运行时出现panic。</p><pre><code class=\"Bash\"><xmp>//声明\r\nvar arr [3]int\r\nfmt.Printf(\"arr:值%v;类型%T,内存地址%p\\n\", arr, arr, &arr)\r\n//数组赋值\r\narr[0] = 1\r\nfmt.Printf(\"arr:值%v;类型%T,内存地址%p\\n\", arr, arr, &arr)\r\n\r\nvar arr1 = [3]int{1, 2, 3}\r\nfmt.Printf(\"arr1:值%v;类型%T,内存地址%p\\n\", arr1, arr1, &arr1)\r\n\r\narr2 := [3]int{1, 2, 3}\r\nfmt.Printf(\"arr2:值%v;类型%T,内存地址%p\\n\", arr2, arr2, &arr2)\r\n\r\n//另外的声明赋值方式,让编译器根据初始值的个数自行推断数组的长度\r\narr3 := [...]int{1, 2, 100, 5, 3, 4, 8}\r\nfmt.Printf(\"arr3:值%v;类型%T,内存地址%p\\n\", arr3, arr3, &arr3)\r\n\r\n//指定下标初始化,因为数组是连续的,从0开始,如果跳过下标,对应的下标没赋值,会给元素类型的默认值,如果0的下标不赋值,那会自动补上,值为元素类型的默认值\r\narr4 := [...]int{0: 1, 2: 10, 3: 100}\r\nfmt.Printf(\"arr4:值%v;类型%T,内存地址%p\\n\", arr4, arr4, &arr4)\r\n//数组遍历\r\nfor i := 0; i < len(arr4); i++ {\r\n	fmt.Printf(\"for:下标值%v;下标类型%T,元素值%v;元素类型%T,元素内存地址%p\\n\", i, i, arr4[i], arr4[i], &arr4[i])\r\n}\r\n//当使用range迭代数组时，每次迭代都会返回数组中的一个元素的副本，而不是直接引用原始数组的内存地址,这是为了安全性和一致性考虑。\r\nfor index, item := range arr4 {\r\n	fmt.Printf(\"range:下标值%v;下标类型%T,元素值%v;元素类型%T,元素内存地址%p\\n\", index, index, item, item, &item)\r\n}\r\n\r\n//多为数组初始化\r\nvar arrMuti = [3][3]int{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}\r\nvar arrMuti1 = [3][3]int{}\r\nvar arrMuti2 = [...][3]int{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}\r\n\r\nfmt.Printf(\"arrMuti:值%v;类型%T,内存地址%p\\n\", arrMuti, arrMuti, &arrMuti)\r\nfmt.Printf(\"arrMuti1:值%v;类型%T,内存地址%p\\n\", arrMuti1, arrMuti1, &arrMuti1)\r\nfmt.Printf(\"arrMuti2:值%v;类型%T,内存地址%p\\n\", arrMuti2, arrMuti2, &arrMuti2)</xmp></code></pre><p>数组的一些应用，找出最大值</p><pre><code class=\"Bash\"><xmp>//求出数组testArr元素的最大值\r\ntestArr := [...]int{1, 2, 100, 5, 3, 4, 8}\r\nmax, index := testArr[0], 0 // 假设第一个元素为最大值,下标为0\r\nfor i := 0; i < len(testArr); i++ {\r\n	if testArr[i] > max {\r\n		max = testArr[i]\r\n		index = i\r\n	}\r\n}\r\nfmt.Printf(\"testArr最大值为%v:下标值%v\\n\", max, index)</xmp></code></pre><p>找出数组中，两个值相加等于某个数的元素</p><pre><code class=\"Bash\"><xmp>//求出数组testArr两个元素相加等于7的元素\r\n//方法1:嵌套循环\r\ntargetSum := 7\r\nfor i := 0; i < len(testArr)-1; i++ {\r\n	for j := i + 1; j < len(testArr); j++ {\r\n		if testArr[i]+testArr[j] == targetSum {\r\n			fmt.Printf(\"找到和为%d的两个数：%d 和 %d\\n\", targetSum, testArr[i], testArr[j])\r\n		}\r\n	}\r\n}\r\n//方法2哈希表\r\nvalueMap := make(map[int]bool)\r\nfor _, num := range testArr {\r\n	complement := targetSum - num\r\n	if valueMap[complement] {\r\n		fmt.Printf(\"找到和为%d的两个数：%d 和 %d\\n\", targetSum, num, complement)\r\n	}\r\n	valueMap[num] = true\r\n}</xmp></code></pre><p><br/></p><p><br/></p>', '1', '1', '1', '0', '1549641600', '1', '2019-02', '1709882784', null);
INSERT INTO `sl_article` VALUES ('290', '372', 'Golang笔记--切片(slice)的使用', null, null, 'nacholas', '', '', '<p>切片是一个引用类型，内部结构包括地址、长度、和容量，实际上切片是数组的一个引用，声明切片可以有几种方式</p><p>直接声明，该声明方式，切片的内容是一个nil，长度和容量都是0。</p><pre><code class=\"Bash\"><xmp>var slice []int\r\nfmt.Printf(\"sliceMake长度%v，容量%v，初始值%v\\n\", len(slice), cap(slice), slice)\r\nif slice == nil {\r\n	fmt.Println(\"slice is nil\")\r\n}</xmp></code></pre><p>make关键字声明，<span style=\"color: inherit;\">该声明方式，切片的内容不是一个nil，长度和容量都是0。</span></p><pre><code class=\"Bash\"><xmp>//make声明和创建\r\nsliceMake := make([]int, 0)\r\nif sliceMake == nil {\r\n	fmt.Println(\"sliceMake is nil\")\r\n}\r\nfmt.Printf(\"sliceMake长度%v，容量%v，初始值%v\\n\", len(sliceMake), cap(sliceMake), sliceMake)\r\n\r\nsliceMake1 := make([]int, 5, 10)\r\nfmt.Printf(\"sliceMake1长度%v，容量%v，初始值%v\\n\", len(sliceMake1), cap(sliceMake1), sliceMake1)</xmp></code></pre><p>直接声明和初始化，该方式的过程是先创建了一个数组，然后在创建切片指向该数组</p><pre><code class=\"Bash\"><xmp>//直接声明和初始化\r\nvar areaSlice = []string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\", \"重庆\", \"成都\", \"洛阳\"}\r\nfmt.Printf(\"areaSlice长度%v，容量%v，初始值%v\\n\", len(areaSlice), cap(areaSlice), areaSlice)</xmp></code></pre><p>根据数组切分初始化切片，该方式有个特别注意的地方，就是切片的容量怎么定义，按该方式去初始化，出来切片的容量是从他第一个元素开始数，到其底层元素数组元素末尾的个数，拿下面这个<span style=\"color: rgb(51, 51, 51);\">areaArr[:3]来说，该切片的长度是从底层数组第0个元素开始计算，直到第3个元素切割(不包括3)，所以他的长度是3，而容量则是</span><span style=\"color: rgb(51, 51, 51);\">是从底层数组第0个元素开始计算，直到</span><span style=\"color: rgb(51, 51, 51);\">areaArr数组的最后一个元素，也就是areaSlice的容量其实是8，</span></p><pre><code class=\"Bash\"><xmp>//数组切分创建和初始化切片\r\nvar areaArr = [...]string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\", \"重庆\", \"成都\", \"洛阳\"}\r\n//忽略掉slice的起始索引，表示从数组的起始位置进行切分\r\nareaSlice1 := areaArr[:3]\r\nfmt.Printf(\"areaSlice1长度%v，容量%v，初始值%v\\n\", len(areaSlice1), cap(areaSlice1), areaSlice1)\r\n\r\n//忽略掉slice的结束索引，表示从使用数组的长度作为结束索引\r\nareaSlice2 := areaArr[4:]\r\nfmt.Printf(\"areaSlice2长度%v，容量%v，初始值%v\\n\", len(areaSlice2), cap(areaSlice2), areaSlice2)\r\n//同时忽略开始和结束索引，就是包含数组所有元素的一个slice\r\nareaSlice3 := areaArr[:]\r\nfmt.Printf(\"areaSlice3长度%v，容量%v，初始值%v\\n\", len(areaSlice3), cap(areaSlice3), areaSlice3)</xmp></code></pre><p>切片的遍历</p><pre><code class=\"Bash\"><xmp>//range方式\r\nvar areaSlice = []string{\"广州\", \"北京\", \"上海\", \"深圳\", \"武汉\", \"重庆\", \"成都\", \"洛阳\"}\r\nfor index, item := range areaSlice {\r\n	fmt.Printf(\"areaSlice遍历第%v个元素的值为%v\\n\", index, item)\r\n}\r\n//for方式\r\nfor i := 0; i < len(areaSlice); i++ {\r\n	fmt.Printf(\"areaSlice遍历第%v个元素的值为%v\\n\", i, areaSlice[i])\r\n}</xmp></code></pre><p>追加切片元素(append)</p><pre><code class=\"Bash\"><xmp>sliceMake := make([]int, 1)\r\n//追加多个元素\r\nsliceMakeAppend := append(sliceMake, 1, 2)\r\n//追加一个元素\r\nsliceMakeAppend1 := append(sliceMakeAppend, 1)\r\n\r\nslice1 := []string{\"广州\", \"北京\"}\r\nslice2 := []string{\"广州\", \"北京\"}\r\n//追加切片\r\nsliceMerge := append(slice1, slice2...)</xmp></code></pre><p>实际上，append可以在切片声明之后直接追加，而不需要make，因为append底层实现有make方法，在不符合长度的时候，会初始化该切片。<br/></p><pre><code class=\"Bash\"><xmp>var slice []int\r\nif slice == nil {\r\n	fmt.Printf(\"slice is nil\\n\")\r\n}\r\nslice = append(slice, 11)\r\nif slice != nil {\r\n	fmt.Printf(\"slice is not nil\\n\")\r\n}\r\nfmt.Printf(\"slice长度%v，容量%v，初始值%v\\n\", len(slice), cap(slice), slice)\r\n\r\n//输出\r\nslice is nil\r\nslice is not nil\r\nslice长度1，容量2，初始值[11]</xmp></code></pre><p>复制一个切片(copy)</p><pre><code class=\"Bash\"><xmp>//切片复制\r\nsliceCopy := []string{\"广州\", \"北京\"}\r\nsliceNew := make([]string, 2)\r\ncopy(sliceNew, sliceCopy)</xmp></code></pre><p><br/></p><p>切片操作字符串，利用切片可以切割字符串，但是要注意的是，切片切割字符串，索引是按照字节数来计算的，如果碰到有中文或者特殊字符的，切割出来并不是我们预想的结果。</p><pre><code class=\"Bash\"><xmp>var strByte = \"this is test\"\r\ntestSlice := strByte[:4]\r\nfmt.Printf(\"testSlice长度%v，初始值%v，首个元素的内存地址%p\\n\", len(testSlice), testSlice)\r\n\r\n//切片字符串，索引代表的是字节数而非rune的数，例如下面的\"go语言,\"长度为9个字节，一个汉字占用3个字节\r\nvar strRune = \"go语言,Hello！\"\r\ntestSlice1 := strRune[:7]\r\nfmt.Printf(\"testSlice1长度%v，初始值%v，首个元素的内存地址%p\\n\", len(testSlice1), testSlice1)</xmp></code></pre><p>碰到字符串是中文或者特殊字符的，可以考虑转为rune类型的切片，再去提取对应的字符串。</p><pre><code class=\"Bash\"><xmp>var strByte = \"this is test\"\r\nvar strRune = \"go语言,Hello！\"\r\nvar tempByte = []byte(strByte)\r\nfmt.Printf(\"tempByte长度%v，容量%v，初始值%v，首个元素的内存地址%p\\n\", len(tempByte), cap(tempByte), tempByte, &tempByte[0])\r\nvar newByteSlice = make([]byte, 0)\r\nfor i := 0; i < 4; i++ {\r\n	newByteSlice = append(newByteSlice, tempByte[i])\r\n}\r\nnewStr := string(newByteSlice)\r\nfmt.Printf(\"newStr值%v，类型%T\\n\", newStr, newStr)\r\n\r\nvar tempRune = []rune(strRune)\r\nfmt.Printf(\"tempRune长度%v，容量%v，初始值%v，首个元素的内存地址%p\\n\", len(tempRune), cap(tempRune), tempRune, &tempRune[0])\r\nvar newRuneSlice = make([]rune, 0)\r\nfor i := 0; i < 7; i++ {\r\n	newRuneSlice = append(newRuneSlice, tempRune[i])\r\n}\r\nnewRuneStr := string(newRuneSlice)\r\nfmt.Printf(\"newStr值%v，类型%T\\n\", newRuneStr, newRuneStr)</xmp></code></pre>', '1', '1', '1', '0', '1550505600', '1', '2019-02', '1709915346', '1710052941');
INSERT INTO `sl_article` VALUES ('291', '372', 'Golang笔记--panic异常捕获', null, null, 'nacholas', '', '', '<p>golang没有像其他语言那样提供try{}catch(){}方式去处理异常，但是可以通过panic和recover捕获处理异常。</p><p>在程序运行中，无论是显式或者隐式触发了panic，<span style=\"font-size: 1em; color: inherit;\">它会立即停止当前函数的执行，并沿着函数调用栈向上传播，直到被捕获或达到顶层的main函数，导致程序终止。</span></p><p><span style=\"font-size: 1em; color: inherit;\">如下面的案例，第一个</span><span style=\"color: rgb(51, 51, 51);\">testFunc调用会执行，中间调用了</span><span style=\"color: rgb(51, 51, 51);\">panicFunc，触发了panic，下面的</span><span style=\"color: rgb(51, 51, 51);\">testFunc就不会被执行。</span></p><pre><code class=\"Bash\"><xmp>func testFunc() {\r\n	fmt.Println(\"this is test func\")\r\n}\r\nfunc panicFunc() {\r\n	panic(\"this is panic\")\r\n}\r\n\r\nfunc main() {\r\n	testFunc()\r\n	panicFunc()\r\n	testFunc()\r\n}</xmp></code></pre><p>这时，如下面案例，我们需要对testFunc进行recover捕获处理，再次编译运行，将不影响最后一个testFunc的执行。</p><pre><code class=\"Bash\"><xmp>func testFunc() {\r\n	defer func() {\r\n		if err := recover(); err != nil {\r\n			fmt.Println(err)\r\n		}\r\n	}()\r\n	panic(\"this is panic\")\r\n}</xmp></code></pre><p>但是有时候需要给客户端返回这个异常，这种属于主动去调用panic，但是有时候系统触发的异常，想捕获返回给客户端怎么处理呢，比如两个数相除，除数不能是0，我们可以定义一个error的返回类型。判断err是否空，返回给客户端。</p><pre><code class=\"Bash\"><xmp>func testFn(n, m int) (cal int, err error) {\r\n	defer func() {\r\n		r := recover()\r\n		if r != nil {\r\n			//TODO可以执行一些监控接口，通知异常\r\n			err = fmt.Errorf(\"Panic error: %v\", r)\r\n		}\r\n	}()\r\n	cal = n / m\r\n	return\r\n}\r\nfunc main() {\r\n	cal, err := testFn(5, 0)\r\n	fmt.Println(err)\r\n	fmt.Println(cal)\r\n}\r\n//输出\r\nPanic error: runtime error: integer divide by zero\r\n0</xmp></code></pre><p>对于一些非系统的异常，可以通过自定义的错误信息抛出panic返回。例如做一些订单的校验业务</p><pre><code class=\"Bash\"><xmp>func checkName(name string) (err error) {\r\n	if name == \"iamzcr\" {\r\n		return nil\r\n	} else {\r\n		return errors.New(\"name error\")\r\n	}\r\n}\r\nfunc checkOrder(orderNum string) (err error) {\r\n	if orderNum == \"123456\" {\r\n		return nil\r\n	} else {\r\n		return errors.New(\"order num error\")\r\n	}\r\n}\r\nfunc check(orderData map[string]string) (err error) {\r\n	defer func() {\r\n		r := recover()\r\n		if r != nil {\r\n			//TODO可以执行一些监控接口，通知异常\r\n			err = fmt.Errorf(\"Panic error: %v\", r)\r\n		}\r\n	}()\r\n	err = checkName(orderData[\"name\"])\r\n	if err != nil {\r\n		panic(err)\r\n	}\r\n	err = checkOrder(orderData[\"order_num\"])\r\n	if err != nil {\r\n		panic(err)\r\n	}\r\n	return\r\n}\r\n\r\nfunc main() {\r\n	var orderData = make(map[string]string)\r\n	orderData[\"name\"] = \"iamzc1r\"\r\n	orderData[\"order_num\"] = \"123456\"\r\n	err := check(orderData)\r\n	if err == nil {\r\n		fmt.Println(\"order check success\")\r\n	} else {\r\n		fmt.Println(\"order check fail msg:\", err)\r\n	}\r\n}</xmp></code></pre><p>如果在go协程里面，如果不处理可能潜在的panic，不仅是一个协程异常，其他主进程和其他协程也会退出，下<span style=\"color: inherit;\">面的程序，开辟了5个协程，处理的业务是两个数相除，如果在函数里面</span><span style=\"color: rgb(51, 51, 51);\">testGoFn不处理系统抛出的异常，会导致整个程序奔溃。</span></p><pre><code class=\"Bash\"><xmp>func testGoFn(n, m int) {\r\n	defer func() {\r\n		r := recover()\r\n		if r != nil {\r\n			//TODO可以执行一些监控接口，通知异常\r\n			fmt.Printf(\"Panic error: %v\\n\", r)\r\n		}\r\n	}()\r\n	fmt.Printf(\"cal: %v\\n\", n/m)\r\n}\r\n\r\nfunc main() {\r\n	fmt.Println(\"main start\")\r\n\r\n	for i := 0; i < 5; i++ {\r\n		n := rand.Intn(3) // 生成0到2之间的随机整数\r\n		m := rand.Intn(3) // 生成0到2之间的随机整数\r\n		go testGoFn(n, m)\r\n	}\r\n	time.Sleep(2 * time.Second)\r\n	fmt.Println(\"main end\")\r\n}</xmp></code></pre><p>小结</p><p>当程序发生panic时，它会立即停止当前函数的执行，并沿着函数调用栈向上传播，直到被捕获或达到顶层的main函数，导致程序终止。</p><p>如果在defer语句中调用了recover，并且在同一协程中发生了panic，那么recover将返回panic的值，程序将继续执行后续的语句，而不是终止程序。</p><p><br/></p>', '1', '1', '1', '0', '1551715200', '1', '2019-03', '1710008989', '1710009248');
INSERT INTO `sl_article` VALUES ('292', '372', 'Golang笔记--指针变量', null, null, 'nacholas', '', '', '<p>golang中<span style=\"font-size: 1em; color: inherit;\">指针也是一个变量，存储的数据不是一个普通的值，而是另外一个变量的内存地址，所以实际上指针就是一个引用类型。</span></p><pre><code class=\"Bash\"><xmp>func testPointFunc(num *int) {\r\n	*num = 40\r\n}\r\n\r\n\r\nfunc main() {\r\n\r\n	var num int = 10\r\n	//num地址是\r\n	fmt.Printf(\"num值是%v,类型是%T,地址是%p\\n\", num, num, &num)\r\n	//声明一个指针类型的变量pointNum，把num的地址赋值给pointNum\r\n	var point *int = &num\r\n	//指针变量point的值就是num地址，而指针变量point也有自己的内存地址\r\n	fmt.Printf(\"point值是%v，类型是%T,地址是%p\\n\", point, point, &point)\r\n\r\n	//通过指针变量point可以修改num的值\r\n	*point = 20\r\n	fmt.Printf(\"num值是%v,类型是%T,地址是%p\\n\", num, num, &num)\r\n\r\n	testPointFunc(point)\r\n	fmt.Printf(\"num值是%v,类型是%T,地址是%p\\n\", num, num, &num)\r\n}</xmp></code></pre><p>上面案例中，<span style=\"font-size: 1em; color: inherit;\">*point表示取出point这个指针变量对应的num的内存地址的值，point表示num对应的内存地址。</span></p><p>golang中提供了new函数创建<span style=\"font-size: 1em; color: inherit;\">指向分配的内存空间的指针，和make不同，make用于创建引用类型的实例。</span></p><pre><code class=\"Bash\"><xmp>//make创建切片引用类型的对象\r\nvar mapTest = make([]string, 0)\r\nfmt.Printf(\"num值是%v,类型是%T,num地址是%p\\n\", mapTest, mapTest, &mapTest)\r\n\r\n//new创建并分配内存空间，返回指向该内存空间的指针\r\nvar num1 *int\r\nnum1 = new(int)\r\n*num1 = 10\r\nfmt.Printf(\"num1值是%v,类型是%T,num2地址是%p\\n\", num1, num1, &num1)\r\n\r\nvar num2 = new(int)\r\nfmt.Printf(\"num2值是%v,类型是%T,num2地址是%p\\n\", num2, num2, &num2)</xmp></code></pre><p>小结</p><p>new和make函数的异同。</p><p>共同点：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两者都是用来分配内存的，两者都有自己的内存地址。</p><p>用途不同：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;make 用于创建切片、映射和通道等引用类型的对象。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new 用于创建并分配内存空间，并且内存对应的值为类型零值，返回指向该内存空间的指针。</p><p>返回值类型不同：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;make 返回的是已初始化的对象，即对应引用类型的实例。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new 返回的是指向分配的内存空间的指针。</p>', '1', '1', '1', '0', '1550678400', '1', '2019-02', '1710067402', null);
INSERT INTO `sl_article` VALUES ('293', '372', 'Golang笔记--init函数', null, null, 'nacholas', '', '', '<p>golang的程序执行时会自动触发包内部的init()函数的调用，该函数没有参数，也没有返回值，不能被主动调用。</p><p>包初始化执行顺序：全局声明-&gt;init()-&gt;main()函数。</p><p><a href=\"https://github.com/iamzcr/go_demo/tree/main/go_init_demo\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">init调用demo</a><br/></p><p>在运行时，不在同一个文件导入的包调用顺序是被最后导入的包会最先初始化并调用其init()函数，如果在同一个文件被导入的包，那么就按导入顺序执行。</p><pre><code class=\"Bash\"><xmp>//main import\r\nimport (\r\n	\"fmt\"\r\n	\"go_init_demo/pkg1\"\r\n	\"go_init_demo/pkg2\"\r\n	\"go_init_demo/pkg3\"\r\n)\r\n\r\n//pkg1 import\r\n\r\nimport (\r\n	\"fmt\"\r\n	\"go_init_demo/pkg2\"\r\n)</xmp></code></pre><p>如上，在main中按顺序引入了pkg1,2,3包，但是pkg1里面引入了pkg2，最终的执行顺序。<br/></p><pre><code class=\"Bash\"><xmp>this pkg2 init\r\nthis pkg1 init\r\nthis pkg1 tool init//因为pkg2里面有两个文件，都存在init()函数\r\nthis pkg3 init</xmp></code></pre><p>同一个包可以有多个init()函数，按照如果是同一个文件，它们在源代码中的顺序被调用。</p><pre><code class=\"Bash\"><xmp>func init() {\r\n	fmt.Println(\"main init\")\r\n}\r\n\r\nfunc init() {\r\n	fmt.Println(\"main init1\")\r\n}\r\n\r\n//输出\r\nmain init\r\nmain init1</xmp></code></pre><p>如果同一个包被拆分为多个文件，那么每个文件可以包含一个 init 函数。这些 init 函数的执行顺序是无法保证的，如上面说的pkg2。</p><p>因此，<span style=\"font-size: 1em; color: inherit;\">init()函数常用于执行一些初始化操作，例如初始化全局变量、注册驱动程序、加载配置文件等。它可以用来确保在程序运行前，必要的初始化工作已经完成。但是要特别</span><span style=\"font-size: 1em; color: inherit;\">注意循环导入问题：循环导入是指两个或多个包之间相互导入的情况。在循环导入的情况下，init 函数的执行顺序可能会变得复杂，并且可能导致编译错误。应该避免出现循环导入的情况。</span></p>', '1', '1', '1', '0', '1551196800', '1', '2019-02', '1710071161', null);
INSERT INTO `sl_article` VALUES ('294', '372', '记录golang常用库-json处理', null, null, 'nacholas', '', '', '<p>golang提供了json处理的标准库<span style=\"color: inherit;\"></span><span style=\"color: inherit; font-size: 1em;\">encoding/json处理，对于结构体，转为json，属性和结构体必须是公有的。</span></p><pre><code class=\"Bash\"><xmp>type Stu struct {\r\n	ID     int      `json:\"id\"`\r\n	Sex    int      `json:\"sex\"`\r\n	Name   string   `json:\"name\"`\r\n	Number string   `json:\"number\"`\r\n	Hobby  []string `json:\"hobby\"`\r\n	Addr   Address  `json:\"address\"`\r\n}\r\ntype Address struct {\r\n	AddrName string\r\n	Phone    string\r\n}</xmp></code></pre><p>结构体转json。</p><pre><code class=\"Bash\"><xmp>var stu = Stu{\r\n	ID:     1,\r\n	Sex:    2,\r\n	Name:   \"小明\",\r\n	Number: \"N123456\",\r\n	Hobby:  []string{\"写代码\", \"足球\"},\r\n}\r\nstu.Addr = Address{\r\n	AddrName: \"test\",\r\n	Phone:    \"123456789\",\r\n}\r\n//返回的是一个byte类型的切片\r\nstuByte, _ := json.Marshal(stu)\r\nstuJson := string(stuByte)\r\nfmt.Printf(\"%v\\n\", stuJson)</xmp></code></pre><p>json转结构体。</p><pre><code class=\"Bash\"><xmp>var stuStr = `{\"id\":1,\"sex\":2,\"name\":\"小明\",\"number\":\"N123456\",\"hobby\":[\"写代码\",\"足球\"],\"address\":{\"AddrName\":\"test\",\"Phone\":\"123456789\"}}`\r\nvar stuStruct Stu\r\n//应该要修改stuStruct的值，所以需要传入地址\r\nerr := json.Unmarshal([]byte(stuStr), &stuStruct)\r\nif err != nil {\r\n	fmt.Printf(\"%v\\n\", err)\r\n}\r\nfmt.Printf(\"%#v\\n\", stuStruct)</xmp></code></pre><p>还有一些更方便的json处理库，例如：<a href=\"https://github.com/tidwall/gjson\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">https://github.com/tidwall/gjson</a>，提供对嵌套json字符串的提取。</p><pre><code class=\"Bash\"><xmp>var json = `{\"name\":{\"first\":\"Janet\",\"last\":\"Prichard\"},\"age\":47}`\r\nlast := gjson.Get(json, \"name.last\")\r\nage := gjson.Get(json, \"age\")\r\nfmt.Printf(\"last=%v,last-type=%T\\n\", last.String(), last.String())\r\nfmt.Printf(\"age=%v,age-type=%T\\n\", age.Int(), age.Int())</xmp></code></pre><p>提供聚合计算等等</p><pre><code class=\"Bash\"><xmp>jsonData := `{\r\n	\"products\": [\r\n		{\"name\": \"苹果\", \"money\": 11},\r\n		{\"name\": \"香蕉\", \"money\": 1},\r\n		{\"name\": \"橘子\", \"money\": 1},\r\n	]\r\n}`\r\n\r\nresult := gjson.Get(jsonData, \"products.#(money < 2)\")\r\ncheapProducts := result.Array()\r\nfmt.Println(\"便宜的水果:\", cheapProducts)</xmp></code></pre><p><br/></p><p><br/></p><p><span style=\"color: inherit; font-size: 1em;\"><br/></span></p>', '1', '1', '1', '0', '1689868800', '1', '2023-07', '1710096473', null);

-- ----------------------------
-- Table structure for sl_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `sl_article_tags`;
CREATE TABLE `sl_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_article_tags
-- ----------------------------
INSERT INTO `sl_article_tags` VALUES ('12', '247', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('13', '247', '373', null, null);
INSERT INTO `sl_article_tags` VALUES ('82', '250', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('92', '260', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('107', '252', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('108', '252', '380', null, null);
INSERT INTO `sl_article_tags` VALUES ('117', '253', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('118', '253', '380', null, null);
INSERT INTO `sl_article_tags` VALUES ('121', '251', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('122', '251', '379', null, null);
INSERT INTO `sl_article_tags` VALUES ('162', '261', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('163', '261', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('164', '261', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('181', '262', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('182', '262', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('183', '262', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('198', '263', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('199', '263', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('205', '255', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('206', '255', '378', null, null);
INSERT INTO `sl_article_tags` VALUES ('215', '265', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('216', '265', '378', null, null);
INSERT INTO `sl_article_tags` VALUES ('225', '266', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('226', '266', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('243', '267', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('244', '267', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('249', '264', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('250', '264', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('251', '264', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('252', '264', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('256', '268', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('311', '256', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('312', '256', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('313', '256', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('314', '256', '378', null, null);
INSERT INTO `sl_article_tags` VALUES ('315', '257', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('316', '257', '387', null, null);
INSERT INTO `sl_article_tags` VALUES ('317', '258', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('318', '258', '387', null, null);
INSERT INTO `sl_article_tags` VALUES ('320', '259', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('321', '259', '387', null, null);
INSERT INTO `sl_article_tags` VALUES ('333', '254', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('334', '254', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('343', '270', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('344', '270', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('345', '270', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('346', '270', '379', null, null);
INSERT INTO `sl_article_tags` VALUES ('357', '248', '374', null, null);
INSERT INTO `sl_article_tags` VALUES ('358', '248', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('361', '272', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('362', '272', '377', null, null);
INSERT INTO `sl_article_tags` VALUES ('419', '274', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('420', '274', '388', null, null);
INSERT INTO `sl_article_tags` VALUES ('421', '274', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('424', '275', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('425', '275', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('436', '269', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('437', '269', '377', null, null);
INSERT INTO `sl_article_tags` VALUES ('438', '269', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('439', '269', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('440', '269', '378', null, null);
INSERT INTO `sl_article_tags` VALUES ('495', '271', '377', null, null);
INSERT INTO `sl_article_tags` VALUES ('496', '271', '383', null, null);
INSERT INTO `sl_article_tags` VALUES ('504', '278', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('511', '276', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('512', '276', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('513', '276', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('514', '277', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('515', '277', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('516', '277', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('517', '273', '382', null, null);
INSERT INTO `sl_article_tags` VALUES ('518', '273', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('519', '273', '377', null, null);
INSERT INTO `sl_article_tags` VALUES ('520', '273', '380', null, null);
INSERT INTO `sl_article_tags` VALUES ('521', '273', '384', null, null);
INSERT INTO `sl_article_tags` VALUES ('522', '273', '376', null, null);
INSERT INTO `sl_article_tags` VALUES ('523', '249', '372', null, null);
INSERT INTO `sl_article_tags` VALUES ('539', '281', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('541', '283', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('542', '284', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('545', '285', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('547', '286', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('548', '287', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('550', '288', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('551', '289', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('556', '282', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('558', '291', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('559', '290', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('560', '280', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('561', '292', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('562', '293', '375', null, null);
INSERT INTO `sl_article_tags` VALUES ('563', '294', '375', null, null);

-- ----------------------------
-- Table structure for sl_attach
-- ----------------------------
DROP TABLE IF EXISTS `sl_attach`;
CREATE TABLE `sl_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '素材类型，1图片，2视频',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_attach
-- ----------------------------
INSERT INTO `sl_attach` VALUES ('245', 'googlePlay.png', '/logo/2023061017262680900.png', '/data/zcr/stacklifes_cdn/logo/2023061017262680900.png', '1', '2', '1686389186', null);
INSERT INTO `sl_attach` VALUES ('246', 'googlePlay.png', '/logo/2023061017273981679.png', '/data/zcr/stacklifes_cdn/logo/2023061017273981679.png', '1', '2', '1686389259', null);
INSERT INTO `sl_attach` VALUES ('247', 'googlePlay.png', '/article/2023061019395911960.png', '/data/zcr/stacklifes_cdn/article/2023061019395911960.png', '1', '1', '1686397199', null);
INSERT INTO `sl_attach` VALUES ('248', 'googlePlay.png', '/article/2023061019400741510.png', '/data/zcr/stacklifes_cdn/article/2023061019400741510.png', '1', '1', '1686397207', null);
INSERT INTO `sl_attach` VALUES ('249', 'googlePlay.png', '/article/2023061019413337092.png', '/data/zcr/stacklifes_cdn/article/2023061019413337092.png', '1', '1', '1686397293', null);
INSERT INTO `sl_attach` VALUES ('250', 'googlePlay.png', '/article/2023061019423147871.png', '/data/zcr/stacklifes_cdn/article/2023061019423147871.png', '1', '1', '1686397351', null);
INSERT INTO `sl_attach` VALUES ('251', 'googlePlay.png', '/article/2023061019501853185.png', '/data/zcr/stacklifes_cdn/article/2023061019501853185.png', '1', '1', '1686397818', null);
INSERT INTO `sl_attach` VALUES ('252', 'ipa.png', '/article/2023061019550752872.png', '/data/zcr/stacklifes_cdn/article/2023061019550752872.png', '1', '1', '1686398107', null);
INSERT INTO `sl_attach` VALUES ('253', 'ipa.png', '/logo/2023061019561549474.png', '/data/zcr/stacklifes_cdn/logo/2023061019561549474.png', '1', '2', '1686398175', null);
INSERT INTO `sl_attach` VALUES ('254', 'googlePlay.png', '/article/2023061020024227737.png', '/data/zcr/stacklifes_cdn/article/2023061020024227737.png', '1', '1', '1686398562', null);
INSERT INTO `sl_attach` VALUES ('255', 'googlePlay.png', '/article/2023061020534149941.png', '/data/zcr/stacklifes_cdn/article/2023061020534149941.png', '1', '1', '1686401621', null);
INSERT INTO `sl_attach` VALUES ('256', 'googlePlay.png', '/article/2023061020535522716.png', '/data/zcr/stacklifes_cdn/article/2023061020535522716.png', '1', '1', '1686401635', null);
INSERT INTO `sl_attach` VALUES ('257', 'googlePlay.png', '/article/2023061020560434776.png', '/data/zcr/stacklifes_cdn/article/2023061020560434776.png', '1', '1', '1686401764', null);
INSERT INTO `sl_attach` VALUES ('258', 'apk.png', '/article/2023061020563524290.png', '/data/zcr/stacklifes_cdn/article/2023061020563524290.png', '1', '1', '1686401795', null);
INSERT INTO `sl_attach` VALUES ('259', 'Nginx.png', '/article/2023061313150075730.png', '/data/zcr/stacklifes_cdn/article/2023061313150075730.png', '1', '1', '1686633300', null);
INSERT INTO `sl_attach` VALUES ('260', 'test.png', '/article/2023061313151083693.png', '/data/zcr/stacklifes_cdn/article/2023061313151083693.png', '1', '1', '1686633310', null);
INSERT INTO `sl_attach` VALUES ('261', 'QQ截图20240110221155.png', '/article/202401102223475800.png', '/data/iamzcr/stacklifes_cdn/article/202401102223475800.png', '1', '1', '1704896627', null);
INSERT INTO `sl_attach` VALUES ('262', 'QQ截图20240110221155.png', '/article/2024011022240741644.png', '/data/iamzcr/stacklifes_cdn/article/2024011022240741644.png', '1', '1', '1704896647', null);
INSERT INTO `sl_attach` VALUES ('263', 'QQ截图20240110221155.png', '/article/2024011023345612819.png', '/data/iamzcr/stacklifes_cdn/article/2024011023345612819.png', '1', '1', '1704900896', null);
INSERT INTO `sl_attach` VALUES ('264', 'QQ截图20240110221155.png', '/article/2024011023352372427.png', '/data/iamzcr/stacklifes_cdn/article/2024011023352372427.png', '1', '1', '1704900923', null);
INSERT INTO `sl_attach` VALUES ('265', 'QQ截图20240110221155.png', '/article/202401102340374227.png', '/data/iamzcr/stacklifes_cdn/article/202401102340374227.png', '1', '1', '1704901237', null);
INSERT INTO `sl_attach` VALUES ('266', '2023061313151083693.png', '/article/202401142104286935.png', '/data/iamzcr/stacklifes_cdn/article/202401142104286935.png', '1', '1', '1705237468', null);
INSERT INTO `sl_attach` VALUES ('267', '2023061313150075730.png', '/article/2024011421044696500.png', '/data/iamzcr/stacklifes_cdn/article/2024011421044696500.png', '1', '1', '1705237486', null);
INSERT INTO `sl_attach` VALUES ('268', 'nginxconf.png', '/article/2024011421160269832.png', '/data/iamzcr/stacklifes_cdn/article/2024011421160269832.png', '1', '1', '1705238162', null);
INSERT INTO `sl_attach` VALUES ('269', 'testandtest1.png', '/article/202401142116237882.png', '/data/iamzcr/stacklifes_cdn/article/202401142116237882.png', '1', '1', '1705238183', null);
INSERT INTO `sl_attach` VALUES ('270', 'testconf.png', '/article/2024011421165068726.png', '/data/iamzcr/stacklifes_cdn/article/2024011421165068726.png', '1', '1', '1705238210', null);
INSERT INTO `sl_attach` VALUES ('271', 'Nginx8080.png', '/article/202401142117151720.png', '/data/iamzcr/stacklifes_cdn/article/202401142117151720.png', '1', '1', '1705238235', null);
INSERT INTO `sl_attach` VALUES ('272', 'Nginx8081.png', '/article/2024011421172614066.png', '/data/iamzcr/stacklifes_cdn/article/2024011421172614066.png', '1', '1', '1705238246', null);
INSERT INTO `sl_attach` VALUES ('273', 'QQ截图20240115122046.png', '/article/202401151221171393.png', '/data/iamzcr/stacklifes_cdn/article/202401151221171393.png', '1', '1', '1705292477', null);
INSERT INTO `sl_attach` VALUES ('274', 'QQ截图20240115122712.png', '/article/2024011512272180244.png', '/data/iamzcr/stacklifes_cdn/article/2024011512272180244.png', '1', '1', '1705292841', null);
INSERT INTO `sl_attach` VALUES ('275', 'QQ截图20240115122858.png', '/article/2024011512291046836.png', '/data/iamzcr/stacklifes_cdn/article/2024011512291046836.png', '1', '1', '1705292950', null);
INSERT INTO `sl_attach` VALUES ('276', 'QQ截图20240201210631.png', '/article/2024020121064217009.png', '/data/iamzcr/stacklifes_cdn/article/2024020121064217009.png', '1', '1', '1706792802', null);
INSERT INTO `sl_attach` VALUES ('277', 'QQ截图20240201210910.png', '/article/2024020121091956517.png', '/data/iamzcr/stacklifes_cdn/article/2024020121091956517.png', '1', '1', '1706792959', null);
INSERT INTO `sl_attach` VALUES ('278', '222.png', '/article/2024020121130464002.png', '/data/iamzcr/stacklifes_cdn/article/2024020121130464002.png', '1', '1', '1706793184', null);
INSERT INTO `sl_attach` VALUES ('279', '4444.png', '/article/2024020121172265555.png', '/data/iamzcr/stacklifes_cdn/article/2024020121172265555.png', '1', '1', '1706793442', null);
INSERT INTO `sl_attach` VALUES ('280', 'QQ截图20240202170407.png', '/article/2024020217041488964.png', '/data/iamzcr/stacklifes_cdn/article/2024020217041488964.png', '1', '1', '1706864654', null);
INSERT INTO `sl_attach` VALUES ('281', 'QQ截图20240202170625.png', '/article/2024020217063932710.png', '/data/iamzcr/stacklifes_cdn/article/2024020217063932710.png', '1', '1', '1706864799', null);
INSERT INTO `sl_attach` VALUES ('282', 'QQ截图20240202174538.png', '/article/2024020217455116430.png', '/data/iamzcr/stacklifes_cdn/article/2024020217455116430.png', '1', '1', '1706867151', null);
INSERT INTO `sl_attach` VALUES ('283', 'QQ截图20240202174622.png', '/article/2024020217464147656.png', '/data/iamzcr/stacklifes_cdn/article/2024020217464147656.png', '1', '1', '1706867201', null);
INSERT INTO `sl_attach` VALUES ('284', 'QQ截图20240202175505.png', '/article/2024020217552082914.png', '/data/iamzcr/stacklifes_cdn/article/2024020217552082914.png', '1', '1', '1706867720', null);
INSERT INTO `sl_attach` VALUES ('285', 'QQ截图20240203003848.png', '/article/2024020300393648785.png', '/data/iamzcr/stacklifes_cdn/article/2024020300393648785.png', '1', '1', '1706891976', null);
INSERT INTO `sl_attach` VALUES ('286', 'QQ截图20240205030017.png', '/article/20240205132808140.png', '/data/iamzcr/stacklifes_cdn/article/20240205132808140.png', '1', '1', '1707110888', null);
INSERT INTO `sl_attach` VALUES ('287', 'QQ截图20240205133207.png', '/article/2024020513331493854.png', '/data/iamzcr/stacklifes_cdn/article/2024020513331493854.png', '1', '1', '1707111194', null);
INSERT INTO `sl_attach` VALUES ('288', 'QQ截图20240205211759.png', '/article/2024020521181450114.png', '/data/iamzcr/stacklifes_cdn/article/2024020521181450114.png', '1', '1', '1707139094', null);
INSERT INTO `sl_attach` VALUES ('289', 'QQ截图20240205212211.png', '/article/2024020521224987902.png', '/data/iamzcr/stacklifes_cdn/article/2024020521224987902.png', '1', '1', '1707139369', null);
INSERT INTO `sl_attach` VALUES ('290', 'ik.png', '/article/2024020521232765854.png', '/data/iamzcr/stacklifes_cdn/article/2024020521232765854.png', '1', '1', '1707139407', null);
INSERT INTO `sl_attach` VALUES ('291', 'QQ截图20240206004346.png', '/article/202402060043582114.png', '/data/iamzcr/stacklifes_cdn/article/202402060043582114.png', '1', '1', '1707151438', null);
INSERT INTO `sl_attach` VALUES ('292', '未命名绘图.jpg', '/article/2024021812341262526.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021812341262526.jpg', '1', '1', '1708230852', null);
INSERT INTO `sl_attach` VALUES ('293', '未命名绘图.jpg', '/article/2024021812344411088.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021812344411088.jpg', '1', '1', '1708230884', null);
INSERT INTO `sl_attach` VALUES ('294', '未命名绘图.jpg', '/article/2024021813335575037.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021813335575037.jpg', '1', '1', '1708234435', null);
INSERT INTO `sl_attach` VALUES ('295', '未命名绘图.jpg', '/article/2024021813373652698.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021813373652698.jpg', '1', '1', '1708234656', null);
INSERT INTO `sl_attach` VALUES ('296', '分包.jpg', '/article/2024021917564417260.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021917564417260.jpg', '1', '1', '1708336604', null);
INSERT INTO `sl_attach` VALUES ('297', '分包.jpg', '/article/2024021918210565298.jpg', '/data/iamzcr/stacklifes_cdn/article/2024021918210565298.jpg', '1', '1', '1708338065', null);
INSERT INTO `sl_attach` VALUES ('298', 'QQ截图20240219213333.png', '/article/2024021921334816715.png', '/data/iamzcr/stacklifes_cdn/article/2024021921334816715.png', '1', '1', '1708349628', null);
INSERT INTO `sl_attach` VALUES ('299', 'QQ截图20240219213604.png', '/article/2024021921361628912.png', '/data/iamzcr/stacklifes_cdn/article/2024021921361628912.png', '1', '1', '1708349776', null);
INSERT INTO `sl_attach` VALUES ('300', 'QQ截图20240219213557.png', '/article/2024021921364199017.png', '/data/iamzcr/stacklifes_cdn/article/2024021921364199017.png', '1', '1', '1708349801', null);
INSERT INTO `sl_attach` VALUES ('301', 'QQ截图20240219213806.png', '/article/2024021921382015367.png', '/data/iamzcr/stacklifes_cdn/article/2024021921382015367.png', '1', '1', '1708349900', null);
INSERT INTO `sl_attach` VALUES ('302', 'QQ图片20240220180836.png', '/article/2024022018103683826.png', '/data/iamzcr/stacklifes_cdn/article/2024022018103683826.png', '1', '1', '1708423836', null);
INSERT INTO `sl_attach` VALUES ('303', 'QQ图片20240220180901.png', '/article/2024022018104264301.png', '/data/iamzcr/stacklifes_cdn/article/2024022018104264301.png', '1', '1', '1708423842', null);
INSERT INTO `sl_attach` VALUES ('304', 'QQ图片20240220180901.png', '/article/202402201810565284.png', '/data/iamzcr/stacklifes_cdn/article/202402201810565284.png', '1', '1', '1708423856', null);
INSERT INTO `sl_attach` VALUES ('305', 'QQ图片20240220180836.png', '/article/2024022018130587683.png', '/data/iamzcr/stacklifes_cdn/article/2024022018130587683.png', '1', '1', '1708423985', null);
INSERT INTO `sl_attach` VALUES ('306', 'QQ图片20240220180901.png', '/article/2024022018131092783.png', '/data/iamzcr/stacklifes_cdn/article/2024022018131092783.png', '1', '1', '1708423990', null);
INSERT INTO `sl_attach` VALUES ('307', 'QQ图片20240220181203.png', '/article/2024022018143556958.png', '/data/iamzcr/stacklifes_cdn/article/2024022018143556958.png', '1', '1', '1708424075', null);
INSERT INTO `sl_attach` VALUES ('308', 'QQ图片20240220181218.png', '/article/2024022018144725345.png', '/data/iamzcr/stacklifes_cdn/article/2024022018144725345.png', '1', '1', '1708424087', null);
INSERT INTO `sl_attach` VALUES ('309', 'QQ图片20240220181856.png', '/article/2024022018194977186.png', '/data/iamzcr/stacklifes_cdn/article/2024022018194977186.png', '1', '1', '1708424389', null);
INSERT INTO `sl_attach` VALUES ('310', 'QQ图片20240220181913.png', '/article/202402201819541760.png', '/data/iamzcr/stacklifes_cdn/article/202402201819541760.png', '1', '1', '1708424394', null);
INSERT INTO `sl_attach` VALUES ('311', 'QQ图片20240220182046.png', '/article/2024022018214151622.png', '/data/iamzcr/stacklifes_cdn/article/2024022018214151622.png', '1', '1', '1708424501', null);
INSERT INTO `sl_attach` VALUES ('312', 'QQ图片20240220182112.png', '/article/2024022018214615519.png', '/data/iamzcr/stacklifes_cdn/article/2024022018214615519.png', '1', '1', '1708424506', null);

-- ----------------------------
-- Table structure for sl_category
-- ----------------------------
DROP TABLE IF EXISTS `sl_category`;
CREATE TABLE `sl_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `parent` varchar(255) DEFAULT '0',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sl_category
-- ----------------------------
INSERT INTO `sl_category` VALUES ('370', '1', '0', 'php', 'zcr', 'PHP', '1', '1', '1686381488', '1706892828');
INSERT INTO `sl_category` VALUES ('371', '1', '0', 'env', 'zcr', '环境搭建', '1', '1', '1686381680', null);
INSERT INTO `sl_category` VALUES ('372', '1', '0', 'golang', 'zcr', 'Golang', '2', '1', '1686586781', '1706892837');
INSERT INTO `sl_category` VALUES ('373', '1', '0', 'python', 'zcr', 'Python', '5', '1', '1686587161', '1686587886');
INSERT INTO `sl_category` VALUES ('374', '2', '0', 'game', 'zcr', '游戏人生', '3', '1', '1686587468', '1686587911');
INSERT INTO `sl_category` VALUES ('375', '1', '0', 'nginx', 'zcr', 'Nginx', '3', '1', '1686587492', null);
INSERT INTO `sl_category` VALUES ('376', '2', '0', 'te', 'zcr', '技术杂谈', '6', '1', '1704822510', '1704822524');

-- ----------------------------
-- Table structure for sl_comment
-- ----------------------------
DROP TABLE IF EXISTS `sl_comment`;
CREATE TABLE `sl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_reply` int(4) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_comment
-- ----------------------------
INSERT INTO `sl_comment` VALUES ('12', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', 'test', '1076686352@qq.com', 'serverPlan/index', null, '啊啊啊啊啊啊啊啊啊', '1686477101', null);

-- ----------------------------
-- Table structure for sl_lang
-- ----------------------------
DROP TABLE IF EXISTS `sl_lang`;
CREATE TABLE `sl_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `default` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_lang
-- ----------------------------
INSERT INTO `sl_lang` VALUES ('5', '简体', 'zh', '1', '1', '1572074063', '1683211073');
INSERT INTO `sl_lang` VALUES ('10', 'English', 'en', '0', '1', '1572074839', '1683211063');

-- ----------------------------
-- Table structure for sl_log
-- ----------------------------
DROP TABLE IF EXISTS `sl_log`;
CREATE TABLE `sl_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志表自增id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '简要描述',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sl_log
-- ----------------------------
INSERT INTO `sl_log` VALUES ('1', 'huangxiaowen', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('2', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('3', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('4', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('5', 'zcr', 'del article', '0', null);
INSERT INTO `sl_log` VALUES ('6', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('7', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('8', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('9', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('10', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('11', 'zcr', '用户登录', '0', null);
INSERT INTO `sl_log` VALUES ('12', 'zcr', '用户登录', '1704642765', null);
INSERT INTO `sl_log` VALUES ('13', 'zcr', '用户登录', '1704642889', null);
INSERT INTO `sl_log` VALUES ('14', 'zcr', '用户登录', '1704643208', null);
INSERT INTO `sl_log` VALUES ('15', 'zcr', '用户登录', '1704643267', null);
INSERT INTO `sl_log` VALUES ('16', 'zcr', '用户登录', '1704643320', null);
INSERT INTO `sl_log` VALUES ('17', 'zcr', '用户登录', '1704643393', null);
INSERT INTO `sl_log` VALUES ('18', 'zcr', '用户登录', '1704643714', null);
INSERT INTO `sl_log` VALUES ('19', 'zcr', '用户登录', '1704643813', null);
INSERT INTO `sl_log` VALUES ('20', 'zcr', '用户登录', '1704643840', null);
INSERT INTO `sl_log` VALUES ('21', 'zcr', '用户登录', '1704644184', null);
INSERT INTO `sl_log` VALUES ('22', 'zcr', '用户登录', '1704644229', null);
INSERT INTO `sl_log` VALUES ('23', 'zcr', '用户登录', '1704685348', null);
INSERT INTO `sl_log` VALUES ('24', 'zcr', '用户登录', '1704735053', null);
INSERT INTO `sl_log` VALUES ('25', 'zcr', '用户登录', '1704735090', null);
INSERT INTO `sl_log` VALUES ('26', 'zcr', '用户登录', '1704735224', null);
INSERT INTO `sl_log` VALUES ('27', 'zcr', '用户登录', '1704735303', null);
INSERT INTO `sl_log` VALUES ('28', 'zcr', '用户登录', '1704735361', null);
INSERT INTO `sl_log` VALUES ('29', 'zcr', '用户登录', '1704735636', null);
INSERT INTO `sl_log` VALUES ('30', 'zcr', '用户登录', '1704735639', null);
INSERT INTO `sl_log` VALUES ('31', 'zcr', '用户登录', '1704735660', null);
INSERT INTO `sl_log` VALUES ('32', 'zcr', '用户登录', '1704735746', null);
INSERT INTO `sl_log` VALUES ('33', 'zcr', '用户登录', '1704735749', null);
INSERT INTO `sl_log` VALUES ('34', 'zcr', '用户登录', '1704735756', null);
INSERT INTO `sl_log` VALUES ('35', 'zcr', '用户登录', '1704735776', null);
INSERT INTO `sl_log` VALUES ('36', 'zcr', '用户登录', '1704736304', null);
INSERT INTO `sl_log` VALUES ('37', 'zcr', '用户登录', '1704736663', null);
INSERT INTO `sl_log` VALUES ('38', 'zcr', '用户登录', '1704736922', null);
INSERT INTO `sl_log` VALUES ('39', 'zcr', '用户登录', '1704736982', null);
INSERT INTO `sl_log` VALUES ('40', 'zcr', '用户登录', '1704737001', null);
INSERT INTO `sl_log` VALUES ('41', 'zcr', '用户登录', '1704737036', null);
INSERT INTO `sl_log` VALUES ('42', 'zcr', '用户登录', '1704737106', null);
INSERT INTO `sl_log` VALUES ('43', 'zcr', '用户登录', '1704737127', null);
INSERT INTO `sl_log` VALUES ('44', 'zcr', '用户登录', '1704737175', null);
INSERT INTO `sl_log` VALUES ('45', 'zcr', '用户登录', '1704737276', null);
INSERT INTO `sl_log` VALUES ('46', 'zcr', '用户登录', '1704737479', null);
INSERT INTO `sl_log` VALUES ('47', 'zcr', '用户登录', '1704737496', null);
INSERT INTO `sl_log` VALUES ('48', 'zcr', '用户登录', '1704737519', null);
INSERT INTO `sl_log` VALUES ('49', 'zcr', '用户登录', '1704820691', null);
INSERT INTO `sl_log` VALUES ('50', 'zcr', '用户登录', '1704862024', null);
INSERT INTO `sl_log` VALUES ('51', 'zcr', '用户登录', '1704893670', null);
INSERT INTO `sl_log` VALUES ('52', 'zcr', '用户登录', '1704893680', null);
INSERT INTO `sl_log` VALUES ('53', 'zcr', '用户登录', '1705236926', null);
INSERT INTO `sl_log` VALUES ('54', 'zcr', '用户登录', '1705238118', null);
INSERT INTO `sl_log` VALUES ('55', 'zcr', '用户登录', '1705245131', null);
INSERT INTO `sl_log` VALUES ('56', 'zcr', '用户登录', '1705301290', null);
INSERT INTO `sl_log` VALUES ('57', 'zcr', '用户登录', '1705302511', null);
INSERT INTO `sl_log` VALUES ('58', 'zcr', '用户登录', '1705302514', null);
INSERT INTO `sl_log` VALUES ('59', 'zcr', '用户登录', '1705302516', null);
INSERT INTO `sl_log` VALUES ('60', 'zcr', '用户登录', '1705302584', null);
INSERT INTO `sl_log` VALUES ('61', 'zcr', '用户登录', '1705302587', null);
INSERT INTO `sl_log` VALUES ('62', 'zcr', '用户登录', '1705302626', null);
INSERT INTO `sl_log` VALUES ('63', 'zcr', '用户登录', '1705302640', null);
INSERT INTO `sl_log` VALUES ('64', 'zcr', '用户登录', '1705302702', null);
INSERT INTO `sl_log` VALUES ('65', 'zcr', '用户登录', '1705302706', null);
INSERT INTO `sl_log` VALUES ('66', 'zcr', '用户登录', '1705302716', null);
INSERT INTO `sl_log` VALUES ('67', 'zcr', '用户登录', '1705302884', null);
INSERT INTO `sl_log` VALUES ('68', 'zcr', '用户登录', '1705894510', null);
INSERT INTO `sl_log` VALUES ('69', 'zcr', '用户登录', '1706684192', null);
INSERT INTO `sl_log` VALUES ('70', 'zcr', '用户登录', '1706782778', null);
INSERT INTO `sl_log` VALUES ('71', 'zcr', '用户登录', '1706860146', null);
INSERT INTO `sl_log` VALUES ('72', 'zcr', '用户登录', '1707110707', null);
INSERT INTO `sl_log` VALUES ('73', 'zcr', '用户登录', '1708176859', null);
INSERT INTO `sl_log` VALUES ('74', 'zcr', '用户登录', '1708176868', null);
INSERT INTO `sl_log` VALUES ('75', 'zcr', '用户登录', '1708219398', null);
INSERT INTO `sl_log` VALUES ('76', 'zcr', '用户登录', '1708247813', null);
INSERT INTO `sl_log` VALUES ('77', 'zcr', '用户登录', '1708284359', null);
INSERT INTO `sl_log` VALUES ('78', 'zcr', '用户登录', '1708395155', null);
INSERT INTO `sl_log` VALUES ('79', 'zcr', '用户登录', '1708422815', null);
INSERT INTO `sl_log` VALUES ('80', 'zcr', '用户登录', '1708501240', null);
INSERT INTO `sl_log` VALUES ('81', 'zcr', '用户登录', '1708912988', null);
INSERT INTO `sl_log` VALUES ('82', 'zcr', '用户登录', '1709105927', null);
INSERT INTO `sl_log` VALUES ('83', 'zcr', '用户登录', '1709158341', null);
INSERT INTO `sl_log` VALUES ('84', 'zcr', 'del article', '1709170435', null);
INSERT INTO `sl_log` VALUES ('85', 'zcr', '用户登录', '1709733600', null);
INSERT INTO `sl_log` VALUES ('86', 'zcr', '用户登录', '1710504890', null);
INSERT INTO `sl_log` VALUES ('87', 'zcr', '用户登录', '1710731450', null);
INSERT INTO `sl_log` VALUES ('88', 'zcr', '用户登录', '1710860215', null);

-- ----------------------------
-- Table structure for sl_log_fail
-- ----------------------------
DROP TABLE IF EXISTS `sl_log_fail`;
CREATE TABLE `sl_log_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '登录名',
  `ip` varchar(128) DEFAULT NULL COMMENT '登录ip',
  `content` varchar(64) DEFAULT NULL COMMENT '错误信息',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_ip` (`username`,`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_log_fail
-- ----------------------------

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
  `parent` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
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
INSERT INTO `sl_menu` VALUES ('232', 'center', 'user_group', 'admin', '用户组管理', 'userGroup/index', '229', '', '4', '1', '1487661857', '1487661857');
INSERT INTO `sl_menu` VALUES ('233', 'center', 'password', 'admin', '修改密码', 'user/password', '229', '', '5', '1', '1487661888', '1487661888');
INSERT INTO `sl_menu` VALUES ('257', 'center', 'menu', 'admin', '菜单设置', 'menu/index', '229', '', '0', '1', '1487750865', '1487750865');
INSERT INTO `sl_menu` VALUES ('258', 'center', 'user', 'admin', '管理员', 'user/index', '229', '', '0', '1', '1488445679', '1488445679');
INSERT INTO `sl_menu` VALUES ('259', 'center', 'opt_log', 'zcr', '操作日志', 'log/index', '229', '', '0', '1', '1493542152', '1493542152');
INSERT INTO `sl_menu` VALUES ('266', 'center', 'permit', 'zcr', '权限管理', 'permit/index', '229', 'fa-cogs', '5', '1', '1497860481', '1497860481');
INSERT INTO `sl_menu` VALUES ('331', 'center', 'base_setting', 'zcr', '基本设置', 'webSite/index', '229', '', '0', '1', '0', null);
INSERT INTO `sl_menu` VALUES ('346', 'center', 'lang', 'huangxiaowen', '语言设置', 'lang/index', '229', '', '0', '1', '0', null);
INSERT INTO `sl_menu` VALUES ('364', 'center', 'fail_log', 'zcr', '错误日志', 'log/logFail', '229', '', '0', '1', '1683297510', null);
INSERT INTO `sl_menu` VALUES ('365', 'center', 'article_manager', 'zcr', '文章管理', '#', '0', 'fa-align-left', '0', '1', '1686320743', null);
INSERT INTO `sl_menu` VALUES ('366', 'center', 'columns', 'zcr', '栏目管理', 'columns/index', '365', '', '0', '1', '1686320767', null);
INSERT INTO `sl_menu` VALUES ('367', 'center', 'article', 'zcr', '文章列表', 'article/index', '365', '', '0', '1', '1686320811', null);
INSERT INTO `sl_menu` VALUES ('368', 'center', 'tags', 'zcr', '标签列表', 'tags/index', '365', '', '0', '1', '1686320883', null);
INSERT INTO `sl_menu` VALUES ('369', 'center', 'attach', 'zcr', '素材列表', 'attach/index', '365', '', '0', '1', '1686320908', null);
INSERT INTO `sl_menu` VALUES ('370', 'center', 'read', 'zcr', '阅读记录', 'read/index', '365', '', '0', '1', '1686404032', null);
INSERT INTO `sl_menu` VALUES ('371', 'center', 'comment', 'zcr', '评论记录', 'comment/index', '365', '', '0', '1', '1686404049', null);
INSERT INTO `sl_menu` VALUES ('372', 'center', 'message', 'zcr', '留言管理', 'message/index', '365', '', '0', '1', '1686473492', null);

-- ----------------------------
-- Table structure for sl_message
-- ----------------------------
DROP TABLE IF EXISTS `sl_message`;
CREATE TABLE `sl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_reply` tinyint(4) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of sl_message
-- ----------------------------
INSERT INTO `sl_message` VALUES ('1', '::1', 'test', '1076686352@qq.com', '', '0', '222', null, null);
INSERT INTO `sl_message` VALUES ('2', '::1', 'test', '1076686352@qq.com', '', '0', '222', null, null);

-- ----------------------------
-- Table structure for sl_permit
-- ----------------------------
DROP TABLE IF EXISTS `sl_permit`;
CREATE TABLE `sl_permit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限表自增id',
  `type` char(10) NOT NULL DEFAULT '' COMMENT '类型：央服center、单服single',
  `parent` varchar(100) NOT NULL DEFAULT '' COMMENT '权限分组名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '权限名称',
  `modules` text COMMENT '模块',
  `status` int(4) DEFAULT '1',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sl_permit
-- ----------------------------
INSERT INTO `sl_permit` VALUES ('347', 'admin', '系统设置', '菜单设置', '[\"menu\\/*\"]', '1', '1638326322', '1644307078');
INSERT INTO `sl_permit` VALUES ('348', 'admin', '系统设置', '权限管理', '[\"permit\\/*\"]', '1', '1638326345', null);
INSERT INTO `sl_permit` VALUES ('349', 'admin', '系统设置', '用户组管理', '[\"usergroup\\/*\"]', '1', '1638326356', null);
INSERT INTO `sl_permit` VALUES ('350', 'admin', '系统设置', '操作日志', '[\"log\\/*\"]', '1', '1638326383', null);
INSERT INTO `sl_permit` VALUES ('351', 'admin', '系统设置', '基本设置', '[\"website\\/*\"]', '1', '1638326400', null);
INSERT INTO `sl_permit` VALUES ('352', 'admin', '系统设置', '管理员', '[\"user\\/index\",\"user\\/add\",\"user\\/updatedata\",\"user\\/changestatus\"]', '1', '1638326593', null);
INSERT INTO `sl_permit` VALUES ('353', 'admin', '系统设置', '修改密码', '[\"user\\/password\"]', '1', '1638326603', null);
INSERT INTO `sl_permit` VALUES ('370', 'admin', '系统设置', '语言设置', '[\"lang\\/*\"]', '1', '1644303935', null);
INSERT INTO `sl_permit` VALUES ('381', 'admin', '文章管理', '栏目管理', '[\"columns\\/*\"]', '1', '1686320713', null);
INSERT INTO `sl_permit` VALUES ('382', 'admin', '文章管理', '文章列表', '[\"article\\/*\"]', '1', '1686320836', '1686395061');
INSERT INTO `sl_permit` VALUES ('383', 'admin', '文章管理', '标签列表', '[\"tags\\/*\"]', '1', '1686320863', null);
INSERT INTO `sl_permit` VALUES ('384', 'admin', '文章管理', '素材列表', '[\"attach\\/*\"]', '1', '1686320939', null);
INSERT INTO `sl_permit` VALUES ('385', 'admin', '文章管理', '上传设置', '[\"upload\\/*\"]', '1', '1686385392', null);
INSERT INTO `sl_permit` VALUES ('386', 'admin', '文章管理', '阅读记录', '[\"read\\/*\"]', '1', '1686404070', null);
INSERT INTO `sl_permit` VALUES ('387', 'admin', '文章管理', '评论记录', '[\"comment\\/*\"]', '1', '1686404093', null);
INSERT INTO `sl_permit` VALUES ('388', 'admin', '文章管理', '留言管理', '[\"message\\/*\"]', '1', '1686473511', null);

-- ----------------------------
-- Table structure for sl_read
-- ----------------------------
DROP TABLE IF EXISTS `sl_read`;
CREATE TABLE `sl_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1429 DEFAULT CHARSET=utf8 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_read
-- ----------------------------
INSERT INTO `sl_read` VALUES ('12', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475600', null);
INSERT INTO `sl_read` VALUES ('13', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475604', null);
INSERT INTO `sl_read` VALUES ('14', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475605', null);
INSERT INTO `sl_read` VALUES ('15', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475605', null);
INSERT INTO `sl_read` VALUES ('16', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475605', null);
INSERT INTO `sl_read` VALUES ('17', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475605', null);
INSERT INTO `sl_read` VALUES ('18', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686475605', null);
INSERT INTO `sl_read` VALUES ('19', '247', 'http://192.168.18.48:8891/', '192.168.40.54', '1686476396', null);
INSERT INTO `sl_read` VALUES ('20', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476399', null);
INSERT INTO `sl_read` VALUES ('21', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476449', null);
INSERT INTO `sl_read` VALUES ('22', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476449', null);
INSERT INTO `sl_read` VALUES ('23', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476450', null);
INSERT INTO `sl_read` VALUES ('24', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476450', null);
INSERT INTO `sl_read` VALUES ('25', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476529', null);
INSERT INTO `sl_read` VALUES ('26', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476583', null);
INSERT INTO `sl_read` VALUES ('27', '249', 'http://192.168.18.48:8891/web/article/detail/id/248.html', '192.168.40.54', '1686476595', null);
INSERT INTO `sl_read` VALUES ('28', '248', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476674', null);
INSERT INTO `sl_read` VALUES ('29', '249', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686476854', null);
INSERT INTO `sl_read` VALUES ('30', '248', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686476855', null);
INSERT INTO `sl_read` VALUES ('31', '247', 'http://192.168.18.48:8891/web/article/detail/id/248.html', '192.168.40.54', '1686476856', null);
INSERT INTO `sl_read` VALUES ('32', '247', 'http://192.168.18.48:8891/web/article/detail/id/248.html', '192.168.40.54', '1686476987', null);
INSERT INTO `sl_read` VALUES ('33', '247', 'http://192.168.18.48:8891/web/article/detail/id/248.html', '192.168.40.54', '1686476987', null);
INSERT INTO `sl_read` VALUES ('34', '247', 'http://192.168.18.48:8891/web/article/detail/id/248.html', '192.168.40.54', '1686476987', null);
INSERT INTO `sl_read` VALUES ('35', '249', 'http://192.168.18.48:8891/web/article/columns/cid/370.html', '192.168.40.54', '1686477081', null);
INSERT INTO `sl_read` VALUES ('36', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477101', null);
INSERT INTO `sl_read` VALUES ('37', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477684', null);
INSERT INTO `sl_read` VALUES ('38', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477684', null);
INSERT INTO `sl_read` VALUES ('39', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477685', null);
INSERT INTO `sl_read` VALUES ('40', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477685', null);
INSERT INTO `sl_read` VALUES ('41', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477685', null);
INSERT INTO `sl_read` VALUES ('42', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477685', null);
INSERT INTO `sl_read` VALUES ('43', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477685', null);
INSERT INTO `sl_read` VALUES ('44', '248', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477880', null);
INSERT INTO `sl_read` VALUES ('45', '249', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686477936', null);
INSERT INTO `sl_read` VALUES ('46', '248', 'http://192.168.18.48:8891/web/article/tags/tid/374.html', '192.168.40.54', '1686477951', null);
INSERT INTO `sl_read` VALUES ('47', '249', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478016', null);
INSERT INTO `sl_read` VALUES ('48', '248', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686478024', null);
INSERT INTO `sl_read` VALUES ('49', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478154', null);
INSERT INTO `sl_read` VALUES ('50', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478206', null);
INSERT INTO `sl_read` VALUES ('51', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478206', null);
INSERT INTO `sl_read` VALUES ('52', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478206', null);
INSERT INTO `sl_read` VALUES ('53', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478207', null);
INSERT INTO `sl_read` VALUES ('54', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478207', null);
INSERT INTO `sl_read` VALUES ('55', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478207', null);
INSERT INTO `sl_read` VALUES ('56', '247', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686478207', null);
INSERT INTO `sl_read` VALUES ('57', '249', 'http://192.168.18.48:8891/', '192.168.40.54', '1686586476', null);
INSERT INTO `sl_read` VALUES ('58', '250', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686586880', null);
INSERT INTO `sl_read` VALUES ('59', '250', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686586914', null);
INSERT INTO `sl_read` VALUES ('60', '250', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686586980', null);
INSERT INTO `sl_read` VALUES ('61', '249', 'http://192.168.18.48:8891/web/article/detail/id/250.html', '192.168.40.54', '1686586999', null);
INSERT INTO `sl_read` VALUES ('62', '249', 'http://192.168.18.48:8891/web/article/detail/id/250.html', '192.168.40.54', '1686587117', null);
INSERT INTO `sl_read` VALUES ('63', '251', 'http://192.168.18.48:8891/web/index/index.html', '192.168.40.54', '1686587129', null);
INSERT INTO `sl_read` VALUES ('64', '249', 'http://192.168.18.48:8891/web/article/columns/cid/370.html', '192.168.40.54', '1686587225', null);
INSERT INTO `sl_read` VALUES ('65', '251', 'http://192.168.18.48:8891/web/article/columns/cid/371.html', '192.168.40.54', '1686627973', null);
INSERT INTO `sl_read` VALUES ('66', '249', 'http://192.168.18.48:8891/web/article/columns/cid/370.html', '192.168.40.54', '1686629538', null);
INSERT INTO `sl_read` VALUES ('67', '251', 'http://192.168.18.48:8891/web/article/detail/id/249.html', '192.168.40.54', '1686629546', null);
INSERT INTO `sl_read` VALUES ('68', '250', 'http://192.168.18.48:8891/web/article/detail/id/251.html', '192.168.40.54', '1686629547', null);
INSERT INTO `sl_read` VALUES ('69', '252', 'http://192.168.18.48:8891/web/article/columns/cid/371.html', '192.168.40.54', '1686633170', null);
INSERT INTO `sl_read` VALUES ('70', '252', 'http://192.168.18.48:8891/web/article/columns/cid/371.html', '192.168.40.54', '1686633314', null);
INSERT INTO `sl_read` VALUES ('71', '252', 'http://192.168.18.48:8891/web/article/columns/cid/371.html', '192.168.40.54', '1686633456', null);
INSERT INTO `sl_read` VALUES ('72', '253', 'http://192.168.18.48:8891/web/article/detail/id/252.html', '192.168.40.54', '1686633458', null);
INSERT INTO `sl_read` VALUES ('73', '252', 'http://192.168.18.48:8891/web/article/detail/id/253.html', '192.168.40.54', '1686633471', null);
INSERT INTO `sl_read` VALUES ('74', '253', 'http://192.168.18.48:8891/web/article/detail/id/252.html', '192.168.40.54', '1686638555', null);
INSERT INTO `sl_read` VALUES ('75', '253', 'http://192.168.18.48:8891/web/article/detail/id/252.html', '192.168.40.54', '1686640196', null);
INSERT INTO `sl_read` VALUES ('76', '253', 'http://iamzcr.com/', '183.6.88.38', '1704624539', null);
INSERT INTO `sl_read` VALUES ('77', '251', 'http://iamzcr.com/article/detail.html?id=253', '183.6.88.38', '1704624575', null);
INSERT INTO `sl_read` VALUES ('78', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624754', null);
INSERT INTO `sl_read` VALUES ('79', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624755', null);
INSERT INTO `sl_read` VALUES ('80', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624756', null);
INSERT INTO `sl_read` VALUES ('81', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624757', null);
INSERT INTO `sl_read` VALUES ('82', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624758', null);
INSERT INTO `sl_read` VALUES ('83', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624758', null);
INSERT INTO `sl_read` VALUES ('84', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624758', null);
INSERT INTO `sl_read` VALUES ('85', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704624758', null);
INSERT INTO `sl_read` VALUES ('86', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1704624758', null);
INSERT INTO `sl_read` VALUES ('87', '251', 'http://iamzcr.com/article/detail.html?id=253', '183.6.88.38', '1704624855', null);
INSERT INTO `sl_read` VALUES ('88', '253', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1704624997', null);
INSERT INTO `sl_read` VALUES ('89', '251', 'http://iamzcr.com/article/detail.html?id=253', '183.6.88.38', '1704625000', null);
INSERT INTO `sl_read` VALUES ('90', '250', 'http://iamzcr.com/article/detail.html?id=251', '183.6.88.38', '1704625001', null);
INSERT INTO `sl_read` VALUES ('91', '249', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.38', '1704625003', null);
INSERT INTO `sl_read` VALUES ('92', '252', 'http://iamzcr.com/article/detail.html?id=253', '183.6.88.38', '1704625007', null);
INSERT INTO `sl_read` VALUES ('93', '253', 'http://iamzcr.com/', '183.6.88.38', '1704626092', null);
INSERT INTO `sl_read` VALUES ('94', '252', 'http://iamzcr.com/', '183.6.88.38', '1704626163', null);
INSERT INTO `sl_read` VALUES ('95', '253', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1704632263', null);
INSERT INTO `sl_read` VALUES ('96', '253', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1704644248', null);
INSERT INTO `sl_read` VALUES ('97', '251', 'http://iamzcr.com/about/index.html', '183.6.88.24', '1704822461', null);
INSERT INTO `sl_read` VALUES ('98', '253', 'http://iamzcr.com/article/detail.html?id=251', '183.6.88.24', '1704822463', null);
INSERT INTO `sl_read` VALUES ('99', '255', 'http://iamzcr.com/article/detail.html?id=253', '183.6.88.24', '1704822465', null);
INSERT INTO `sl_read` VALUES ('100', '253', 'none', '66.249.66.128', '1704838825', null);
INSERT INTO `sl_read` VALUES ('101', '251', 'none', '66.249.66.145', '1704847133', null);
INSERT INTO `sl_read` VALUES ('102', '254', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1704861967', null);
INSERT INTO `sl_read` VALUES ('103', '251', 'http://iamzcr.com/article/columns.html?cid=371', '183.6.88.38', '1704862092', null);
INSERT INTO `sl_read` VALUES ('104', '252', 'http://iamzcr.com/article/detail.html?id=251', '183.6.88.38', '1704862094', null);
INSERT INTO `sl_read` VALUES ('105', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1704862095', null);
INSERT INTO `sl_read` VALUES ('106', '255', 'http://iamzcr.com/article/detail.html?id=254', '183.6.88.38', '1704862096', null);
INSERT INTO `sl_read` VALUES ('107', '249', 'none', '66.249.66.129', '1704881414', null);
INSERT INTO `sl_read` VALUES ('108', '255', 'none', '66.249.69.192', '1704890415', null);
INSERT INTO `sl_read` VALUES ('109', '254', 'http://iamzcr.com/', '183.6.88.24', '1704894562', null);
INSERT INTO `sl_read` VALUES ('110', '254', 'http://iamzcr.com/', '183.6.88.24', '1704894598', null);
INSERT INTO `sl_read` VALUES ('111', '254', 'http://iamzcr.com/', '183.6.88.24', '1704894663', null);
INSERT INTO `sl_read` VALUES ('112', '254', 'http://iamzcr.com/', '183.6.88.24', '1704894895', null);
INSERT INTO `sl_read` VALUES ('113', '254', 'http://iamzcr.com/', '183.6.88.38', '1704895483', null);
INSERT INTO `sl_read` VALUES ('114', '254', 'http://iamzcr.com/', '183.6.88.24', '1704895583', null);
INSERT INTO `sl_read` VALUES ('115', '254', 'http://iamzcr.com/', '183.6.88.24', '1704896288', null);
INSERT INTO `sl_read` VALUES ('116', '254', 'http://iamzcr.com/', '183.6.88.38', '1704901247', null);
INSERT INTO `sl_read` VALUES ('117', '252', 'http://iamzcr.com/article/tags.html?tid=380', '183.6.88.38', '1704901268', null);
INSERT INTO `sl_read` VALUES ('118', '250', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1704901532', null);
INSERT INTO `sl_read` VALUES ('119', '248', 'none', '66.249.69.192', '1704916890', null);
INSERT INTO `sl_read` VALUES ('120', '256', 'none', '66.249.69.192', '1704917414', null);
INSERT INTO `sl_read` VALUES ('121', '250', 'http://iamzcr.com/', '183.6.88.38', '1704951195', null);
INSERT INTO `sl_read` VALUES ('122', '250', 'http://iamzcr.com/', '183.6.88.24', '1704951563', null);
INSERT INTO `sl_read` VALUES ('123', '257', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.24', '1704951565', null);
INSERT INTO `sl_read` VALUES ('124', '257', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.24', '1704952203', null);
INSERT INTO `sl_read` VALUES ('125', '258', 'http://iamzcr.com/article/detail.html?id=257', '183.6.88.24', '1704952214', null);
INSERT INTO `sl_read` VALUES ('126', '259', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1704952583', null);
INSERT INTO `sl_read` VALUES ('127', '258', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1704952739', null);
INSERT INTO `sl_read` VALUES ('128', '258', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1704952768', null);
INSERT INTO `sl_read` VALUES ('129', '254', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1704952827', null);
INSERT INTO `sl_read` VALUES ('130', '257', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1704954767', null);
INSERT INTO `sl_read` VALUES ('131', '249', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1704955368', null);
INSERT INTO `sl_read` VALUES ('132', '257', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.38', '1704990289', null);
INSERT INTO `sl_read` VALUES ('133', '257', 'none', '138.68.180.18', '1704993321', null);
INSERT INTO `sl_read` VALUES ('134', '258', 'none', '138.68.180.18', '1704993322', null);
INSERT INTO `sl_read` VALUES ('135', '259', 'none', '138.68.180.18', '1704993323', null);
INSERT INTO `sl_read` VALUES ('136', '258', 'none', '66.249.79.194', '1704998784', null);
INSERT INTO `sl_read` VALUES ('137', '250', 'none', '66.249.79.195', '1705030340', null);
INSERT INTO `sl_read` VALUES ('138', '249', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705043689', null);
INSERT INTO `sl_read` VALUES ('139', '259', 'none', '66.249.79.195', '1705057299', null);
INSERT INTO `sl_read` VALUES ('140', '252', 'none', '85.208.96.204', '1705072300', null);
INSERT INTO `sl_read` VALUES ('141', '249', 'none', '185.191.171.17', '1705078241', null);
INSERT INTO `sl_read` VALUES ('142', '253', 'none', '85.208.96.202', '1705080549', null);
INSERT INTO `sl_read` VALUES ('143', '251', 'none', '185.191.171.19', '1705102527', null);
INSERT INTO `sl_read` VALUES ('144', '250', 'none', '85.208.96.205', '1705102779', null);
INSERT INTO `sl_read` VALUES ('145', '257', 'none', '66.249.69.4', '1705214515', null);
INSERT INTO `sl_read` VALUES ('146', '256', 'none', '66.249.69.5', '1705214520', null);
INSERT INTO `sl_read` VALUES ('147', '249', 'http://iamzcr.com/', '183.6.88.38', '1705236906', null);
INSERT INTO `sl_read` VALUES ('148', '253', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1705236988', null);
INSERT INTO `sl_read` VALUES ('149', '253', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1705237042', null);
INSERT INTO `sl_read` VALUES ('150', '253', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1705237125', null);
INSERT INTO `sl_read` VALUES ('151', '254', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1705237212', null);
INSERT INTO `sl_read` VALUES ('152', '252', 'http://iamzcr.com/article/tags.html?tid=380', '183.6.88.24', '1705237219', null);
INSERT INTO `sl_read` VALUES ('153', '253', 'http://iamzcr.com/article/tags.html?tid=380', '183.6.88.38', '1705237370', null);
INSERT INTO `sl_read` VALUES ('154', '253', 'http://iamzcr.com/article/tags.html?tid=380', '183.6.88.24', '1705237496', null);
INSERT INTO `sl_read` VALUES ('155', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237765', null);
INSERT INTO `sl_read` VALUES ('156', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237765', null);
INSERT INTO `sl_read` VALUES ('157', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237766', null);
INSERT INTO `sl_read` VALUES ('158', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237766', null);
INSERT INTO `sl_read` VALUES ('159', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237766', null);
INSERT INTO `sl_read` VALUES ('160', '252', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237842', null);
INSERT INTO `sl_read` VALUES ('161', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237845', null);
INSERT INTO `sl_read` VALUES ('162', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237846', null);
INSERT INTO `sl_read` VALUES ('163', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237846', null);
INSERT INTO `sl_read` VALUES ('164', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237846', null);
INSERT INTO `sl_read` VALUES ('165', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237846', null);
INSERT INTO `sl_read` VALUES ('166', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237846', null);
INSERT INTO `sl_read` VALUES ('167', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237847', null);
INSERT INTO `sl_read` VALUES ('168', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.24', '1705237847', null);
INSERT INTO `sl_read` VALUES ('169', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1705237932', null);
INSERT INTO `sl_read` VALUES ('170', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1705237933', null);
INSERT INTO `sl_read` VALUES ('171', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1705238258', null);
INSERT INTO `sl_read` VALUES ('172', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1705238312', null);
INSERT INTO `sl_read` VALUES ('173', '253', 'http://iamzcr.com/article/detail.html?id=252', '183.6.88.38', '1705238356', null);
INSERT INTO `sl_read` VALUES ('174', '257', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705238367', null);
INSERT INTO `sl_read` VALUES ('175', '251', 'http://iamzcr.com/article/tags.html?tid=379', '183.6.88.38', '1705238429', null);
INSERT INTO `sl_read` VALUES ('176', '251', 'http://iamzcr.com/article/tags.html?tid=379', '183.6.88.38', '1705238476', null);
INSERT INTO `sl_read` VALUES ('177', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238497', null);
INSERT INTO `sl_read` VALUES ('178', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238629', null);
INSERT INTO `sl_read` VALUES ('179', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238630', null);
INSERT INTO `sl_read` VALUES ('180', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238631', null);
INSERT INTO `sl_read` VALUES ('181', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.24', '1705238631', null);
INSERT INTO `sl_read` VALUES ('182', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238632', null);
INSERT INTO `sl_read` VALUES ('183', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238632', null);
INSERT INTO `sl_read` VALUES ('184', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.24', '1705238632', null);
INSERT INTO `sl_read` VALUES ('185', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238632', null);
INSERT INTO `sl_read` VALUES ('186', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.24', '1705238632', null);
INSERT INTO `sl_read` VALUES ('187', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238632', null);
INSERT INTO `sl_read` VALUES ('188', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238633', null);
INSERT INTO `sl_read` VALUES ('189', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238633', null);
INSERT INTO `sl_read` VALUES ('190', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.38', '1705238633', null);
INSERT INTO `sl_read` VALUES ('191', '258', 'http://iamzcr.com/article/columns.html?cid=370', '183.6.88.24', '1705238788', null);
INSERT INTO `sl_read` VALUES ('192', '257', 'http://iamzcr.com/article/detail.html?id=258', '183.6.88.24', '1705238804', null);
INSERT INTO `sl_read` VALUES ('193', '257', 'http://iamzcr.com/article/detail.html?id=258', '183.6.88.24', '1705238831', null);
INSERT INTO `sl_read` VALUES ('194', '258', 'http://iamzcr.com/article/detail.html?id=257', '183.6.88.24', '1705238840', null);
INSERT INTO `sl_read` VALUES ('195', '259', 'http://iamzcr.com/article/detail.html?id=258', '183.6.88.24', '1705238842', null);
INSERT INTO `sl_read` VALUES ('196', '248', 'http://iamzcr.com/article/detail.html?id=259', '183.6.88.24', '1705238848', null);
INSERT INTO `sl_read` VALUES ('197', '256', 'http://iamzcr.com/article/columns.html?cid=374', '183.6.88.38', '1705239526', null);
INSERT INTO `sl_read` VALUES ('198', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705245087', null);
INSERT INTO `sl_read` VALUES ('199', '261', 'http://iamzcr.com/', '183.6.88.38', '1705293325', null);
INSERT INTO `sl_read` VALUES ('200', '261', 'http://iamzcr.com/', '223.104.67.209', '1705294105', null);
INSERT INTO `sl_read` VALUES ('201', '261', 'http://iamzcr.com/', '183.6.88.38', '1705302908', null);
INSERT INTO `sl_read` VALUES ('202', '261', 'none', '66.249.79.195', '1705344802', null);
INSERT INTO `sl_read` VALUES ('203', '253', 'none', '66.249.69.193', '1705474174', null);
INSERT INTO `sl_read` VALUES ('204', '251', 'none', '66.249.69.200', '1705479573', null);
INSERT INTO `sl_read` VALUES ('205', '257', 'none', '185.191.171.5', '1705503269', null);
INSERT INTO `sl_read` VALUES ('206', '254', 'none', '85.208.96.201', '1705508911', null);
INSERT INTO `sl_read` VALUES ('207', '259', 'none', '185.191.171.4', '1705510495', null);
INSERT INTO `sl_read` VALUES ('208', '248', 'none', '85.208.96.199', '1705536201', null);
INSERT INTO `sl_read` VALUES ('209', '258', 'none', '85.208.96.196', '1705536719', null);
INSERT INTO `sl_read` VALUES ('210', '253', 'none', '66.249.79.194', '1705735398', null);
INSERT INTO `sl_read` VALUES ('211', '251', 'none', '66.249.66.168', '1705832586', null);
INSERT INTO `sl_read` VALUES ('212', '250', 'none', '66.249.66.168', '1705833844', null);
INSERT INTO `sl_read` VALUES ('213', '255', 'none', '66.249.66.168', '1705833845', null);
INSERT INTO `sl_read` VALUES ('214', '249', 'none', '66.249.66.169', '1705833935', null);
INSERT INTO `sl_read` VALUES ('215', '249', 'http://iamzcr.com/article/detail.html?id=249', '112.65.212.32', '1705839245', null);
INSERT INTO `sl_read` VALUES ('216', '261', 'http://iamzcr.com/article/detail.html?id=261', '223.93.159.85', '1705840620', null);
INSERT INTO `sl_read` VALUES ('217', '257', 'http://iamzcr.com/article/detail.html?id=257', '112.65.212.106', '1705848716', null);
INSERT INTO `sl_read` VALUES ('218', '251', 'none', '66.249.66.167', '1705858279', null);
INSERT INTO `sl_read` VALUES ('219', '250', 'none', '66.249.66.169', '1705859178', null);
INSERT INTO `sl_read` VALUES ('220', '254', 'http://iamzcr.com/article/detail.html?id=254', '101.91.134.233', '1705866101', null);
INSERT INTO `sl_read` VALUES ('221', '258', 'http://iamzcr.com/article/detail.html?id=258', '140.206.236.81', '1705889705', null);
INSERT INTO `sl_read` VALUES ('222', '261', 'http://iamzcr.com/', '183.6.88.38', '1705893317', null);
INSERT INTO `sl_read` VALUES ('223', '250', 'http://iamzcr.com/article/detail.html?id=250', '112.65.211.175', '1705895647', null);
INSERT INTO `sl_read` VALUES ('224', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705898265', null);
INSERT INTO `sl_read` VALUES ('225', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900051', null);
INSERT INTO `sl_read` VALUES ('226', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900082', null);
INSERT INTO `sl_read` VALUES ('227', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900083', null);
INSERT INTO `sl_read` VALUES ('228', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900084', null);
INSERT INTO `sl_read` VALUES ('229', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900130', null);
INSERT INTO `sl_read` VALUES ('230', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900153', null);
INSERT INTO `sl_read` VALUES ('231', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900154', null);
INSERT INTO `sl_read` VALUES ('232', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900155', null);
INSERT INTO `sl_read` VALUES ('233', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900184', null);
INSERT INTO `sl_read` VALUES ('234', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900352', null);
INSERT INTO `sl_read` VALUES ('235', '257', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900364', null);
INSERT INTO `sl_read` VALUES ('236', '261', 'http://iamzcr.com/article/tags.html?tid=382', '183.6.88.38', '1705900399', null);
INSERT INTO `sl_read` VALUES ('237', '261', 'http://iamzcr.com/article/tags.html?tid=382', '183.6.88.38', '1705900400', null);
INSERT INTO `sl_read` VALUES ('238', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900406', null);
INSERT INTO `sl_read` VALUES ('239', '249', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1705900413', null);
INSERT INTO `sl_read` VALUES ('240', '249', 'none', '66.249.66.167', '1705903153', null);
INSERT INTO `sl_read` VALUES ('241', '261', 'none', '85.208.96.212', '1705916495', null);
INSERT INTO `sl_read` VALUES ('242', '249', 'none', '66.249.66.169', '1705921154', null);
INSERT INTO `sl_read` VALUES ('243', '256', 'http://iamzcr.com/article/detail.html?id=256', '101.91.134.68', '1705928740', null);
INSERT INTO `sl_read` VALUES ('244', '255', 'none', '66.249.66.169', '1705946358', null);
INSERT INTO `sl_read` VALUES ('245', '248', 'none', '66.249.66.160', '1705950860', null);
INSERT INTO `sl_read` VALUES ('246', '253', 'http://iamzcr.com/article/detail.html?id=253', '223.93.149.254', '1705962556', null);
INSERT INTO `sl_read` VALUES ('247', '248', 'none', '66.249.66.168', '1705965202', null);
INSERT INTO `sl_read` VALUES ('248', '254', 'none', '66.249.66.168', '1705967901', null);
INSERT INTO `sl_read` VALUES ('249', '261', 'http://iamzcr.com/', '183.6.88.24', '1705979448', null);
INSERT INTO `sl_read` VALUES ('250', '256', 'http://iamzcr.com/', '183.6.88.24', '1705979553', null);
INSERT INTO `sl_read` VALUES ('251', '257', 'none', '66.249.66.167', '1705986865', null);
INSERT INTO `sl_read` VALUES ('252', '256', 'none', '85.208.96.206', '1705998891', null);
INSERT INTO `sl_read` VALUES ('253', '258', 'none', '66.249.66.169', '1706213324', null);
INSERT INTO `sl_read` VALUES ('254', '249', 'none', '217.182.175.163', '1706332660', null);
INSERT INTO `sl_read` VALUES ('255', '256', 'none', '217.182.175.163', '1706332678', null);
INSERT INTO `sl_read` VALUES ('256', '257', 'none', '217.182.175.163', '1706332700', null);
INSERT INTO `sl_read` VALUES ('257', '258', 'none', '217.182.175.163', '1706332716', null);
INSERT INTO `sl_read` VALUES ('258', '259', 'none', '217.182.175.163', '1706332738', null);
INSERT INTO `sl_read` VALUES ('259', '261', 'none', '217.182.175.163', '1706332753', null);
INSERT INTO `sl_read` VALUES ('260', '255', 'none', '66.249.79.71', '1706350988', null);
INSERT INTO `sl_read` VALUES ('261', '248', 'none', '37.187.73.123', '1706386274', null);
INSERT INTO `sl_read` VALUES ('262', '250', 'none', '37.187.73.123', '1706386276', null);
INSERT INTO `sl_read` VALUES ('263', '251', 'none', '37.187.73.123', '1706386278', null);
INSERT INTO `sl_read` VALUES ('264', '252', 'none', '37.187.73.123', '1706386280', null);
INSERT INTO `sl_read` VALUES ('265', '253', 'none', '37.187.73.123', '1706386282', null);
INSERT INTO `sl_read` VALUES ('266', '254', 'none', '37.187.73.123', '1706386284', null);
INSERT INTO `sl_read` VALUES ('267', '259', 'http://iamzcr.com/article/detail.html?id=259', '223.93.159.9', '1706387523', null);
INSERT INTO `sl_read` VALUES ('268', '250', 'none', '85.208.96.205', '1706399153', null);
INSERT INTO `sl_read` VALUES ('269', '252', 'none', '85.208.96.204', '1706415567', null);
INSERT INTO `sl_read` VALUES ('270', '249', 'none', '185.191.171.19', '1706417625', null);
INSERT INTO `sl_read` VALUES ('271', '253', 'none', '185.191.171.13', '1706424873', null);
INSERT INTO `sl_read` VALUES ('272', '256', 'http://iamzcr.com/', '183.6.88.38', '1706426364', null);
INSERT INTO `sl_read` VALUES ('273', '251', 'none', '85.208.96.193', '1706437539', null);
INSERT INTO `sl_read` VALUES ('274', '261', 'none', '116.179.32.43', '1706589093', null);
INSERT INTO `sl_read` VALUES ('275', '259', 'none', '220.181.108.167', '1706589093', null);
INSERT INTO `sl_read` VALUES ('276', '249', 'none', '220.181.108.111', '1706589093', null);
INSERT INTO `sl_read` VALUES ('277', '256', 'none', '220.181.108.101', '1706589095', null);
INSERT INTO `sl_read` VALUES ('278', '258', 'none', '116.179.32.242', '1706589095', null);
INSERT INTO `sl_read` VALUES ('279', '257', 'none', '220.181.108.110', '1706589096', null);
INSERT INTO `sl_read` VALUES ('280', '259', 'none', '220.181.108.83', '1706589123', null);
INSERT INTO `sl_read` VALUES ('281', '250', 'none', '220.181.108.94', '1706589322', null);
INSERT INTO `sl_read` VALUES ('282', '248', 'none', '116.179.32.231', '1706589322', null);
INSERT INTO `sl_read` VALUES ('283', '253', 'none', '220.181.108.144', '1706589532', null);
INSERT INTO `sl_read` VALUES ('284', '248', 'http://iamzcr.com/article/detail.html?id=248', '112.65.212.11', '1706591047', null);
INSERT INTO `sl_read` VALUES ('285', '252', 'none', '116.179.32.155', '1706592533', null);
INSERT INTO `sl_read` VALUES ('286', '254', 'none', '116.179.32.97', '1706592533', null);
INSERT INTO `sl_read` VALUES ('287', '251', 'none', '220.181.108.112', '1706592933', null);
INSERT INTO `sl_read` VALUES ('288', '261', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706683200', null);
INSERT INTO `sl_read` VALUES ('289', '261', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706684392', null);
INSERT INTO `sl_read` VALUES ('290', '256', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706684603', null);
INSERT INTO `sl_read` VALUES ('291', '257', 'http://iamzcr.com/article/detail.html?id=256', '183.6.88.24', '1706684613', null);
INSERT INTO `sl_read` VALUES ('292', '258', 'http://iamzcr.com/article/detail.html?id=257', '183.6.88.24', '1706684614', null);
INSERT INTO `sl_read` VALUES ('293', '259', 'http://iamzcr.com/article/detail.html?id=258', '183.6.88.24', '1706684615', null);
INSERT INTO `sl_read` VALUES ('294', '256', 'http://iamzcr.com/article/columns.html?cid=374', '117.136.40.213', '1706769430', null);
INSERT INTO `sl_read` VALUES ('295', '259', 'http://iamzcr.com/article/columns.html?cid=370', '117.136.40.213', '1706769446', null);
INSERT INTO `sl_read` VALUES ('296', '262', 'http://iamzcr.com/', '183.6.88.24', '1706793550', null);
INSERT INTO `sl_read` VALUES ('297', '262', 'http://iamzcr.com/', '183.6.88.38', '1706793666', null);
INSERT INTO `sl_read` VALUES ('298', '262', 'http://iamzcr.com/', '183.6.88.24', '1706793800', null);
INSERT INTO `sl_read` VALUES ('299', '256', 'http://iamzcr.com/', '183.6.88.24', '1706793818', null);
INSERT INTO `sl_read` VALUES ('300', '257', 'http://iamzcr.com/', '183.6.88.24', '1706793828', null);
INSERT INTO `sl_read` VALUES ('301', '262', 'none', '116.179.32.102', '1706794607', null);
INSERT INTO `sl_read` VALUES ('302', '257', 'none', '85.208.96.196', '1706804756', null);
INSERT INTO `sl_read` VALUES ('303', '259', 'none', '85.208.96.207', '1706813571', null);
INSERT INTO `sl_read` VALUES ('304', '259', 'none', '66.249.66.167', '1706830917', null);
INSERT INTO `sl_read` VALUES ('305', '256', 'none', '113.215.188.188', '1706832390', null);
INSERT INTO `sl_read` VALUES ('306', '262', 'none', '113.215.189.29', '1706832754', null);
INSERT INTO `sl_read` VALUES ('307', '254', 'none', '85.208.96.202', '1706833460', null);
INSERT INTO `sl_read` VALUES ('308', '258', 'none', '85.208.96.202', '1706837870', null);
INSERT INTO `sl_read` VALUES ('309', '262', 'http://iamzcr.com/', '183.6.88.24', '1706847053', null);
INSERT INTO `sl_read` VALUES ('310', '262', 'http://iamzcr.com/article/month.html?month=2023-12', '183.6.88.24', '1706860104', null);
INSERT INTO `sl_read` VALUES ('311', '261', 'http://iamzcr.com/article/detail.html?id=262', '183.6.88.24', '1706860107', null);
INSERT INTO `sl_read` VALUES ('312', '262', 'none', '66.249.66.167', '1706865476', null);
INSERT INTO `sl_read` VALUES ('313', '262', 'http://iamzcr.com/article/detail.html?id=261', '183.6.88.38', '1706866134', null);
INSERT INTO `sl_read` VALUES ('314', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706867235', null);
INSERT INTO `sl_read` VALUES ('315', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706867925', null);
INSERT INTO `sl_read` VALUES ('316', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706867927', null);
INSERT INTO `sl_read` VALUES ('317', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706867980', null);
INSERT INTO `sl_read` VALUES ('318', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706868118', null);
INSERT INTO `sl_read` VALUES ('319', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706868121', null);
INSERT INTO `sl_read` VALUES ('320', '263', 'none', '220.181.108.176', '1706875127', null);
INSERT INTO `sl_read` VALUES ('321', '262', 'none', '65.108.110.26', '1706883430', null);
INSERT INTO `sl_read` VALUES ('322', '248', 'none', '185.191.171.11', '1706884266', null);
INSERT INTO `sl_read` VALUES ('323', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706891457', null);
INSERT INTO `sl_read` VALUES ('324', '264', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.38', '1706892613', null);
INSERT INTO `sl_read` VALUES ('325', '264', 'none', '220.181.108.144', '1706898528', null);
INSERT INTO `sl_read` VALUES ('326', '262', 'none', '66.249.66.168', '1706899857', null);
INSERT INTO `sl_read` VALUES ('327', '263', 'none', '66.249.66.169', '1706903906', null);
INSERT INTO `sl_read` VALUES ('328', '263', 'none', '65.108.64.210', '1706922133', null);
INSERT INTO `sl_read` VALUES ('329', '252', 'http://iamzcr.com/article/detail.html?id=252', '223.93.149.251', '1706937254', null);
INSERT INTO `sl_read` VALUES ('330', '259', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706944353', null);
INSERT INTO `sl_read` VALUES ('331', '264', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706944361', null);
INSERT INTO `sl_read` VALUES ('332', '264', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706944369', null);
INSERT INTO `sl_read` VALUES ('333', '264', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1706944371', null);
INSERT INTO `sl_read` VALUES ('334', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706945002', null);
INSERT INTO `sl_read` VALUES ('335', '262', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706945006', null);
INSERT INTO `sl_read` VALUES ('336', '254', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1706948412', null);
INSERT INTO `sl_read` VALUES ('337', '262', 'none', '66.249.66.167', '1706949529', null);
INSERT INTO `sl_read` VALUES ('338', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1706951397', null);
INSERT INTO `sl_read` VALUES ('339', '264', 'none', '178.150.14.250', '1706951826', null);
INSERT INTO `sl_read` VALUES ('340', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1706952528', null);
INSERT INTO `sl_read` VALUES ('341', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1706952605', null);
INSERT INTO `sl_read` VALUES ('342', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1706952941', null);
INSERT INTO `sl_read` VALUES ('343', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1706952946', null);
INSERT INTO `sl_read` VALUES ('344', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1706954034', null);
INSERT INTO `sl_read` VALUES ('345', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1706954568', null);
INSERT INTO `sl_read` VALUES ('346', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1706954663', null);
INSERT INTO `sl_read` VALUES ('347', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1706955878', null);
INSERT INTO `sl_read` VALUES ('348', '262', 'http://iamzcr.com/article/detail.html?id=256', '183.6.88.38', '1706955879', null);
INSERT INTO `sl_read` VALUES ('349', '263', 'http://iamzcr.com/article/detail.html?id=262', '183.6.88.38', '1706955880', null);
INSERT INTO `sl_read` VALUES ('350', '256', 'http://iamzcr.com/', '183.6.88.38', '1706974524', null);
INSERT INTO `sl_read` VALUES ('351', '265', 'http://iamzcr.com/article/tags.html?tid=378', '183.6.88.38', '1706974960', null);
INSERT INTO `sl_read` VALUES ('352', '262', 'none', '66.249.66.168', '1707005051', null);
INSERT INTO `sl_read` VALUES ('353', '265', 'none', '116.179.32.49', '1707007069', null);
INSERT INTO `sl_read` VALUES ('354', '257', 'none', '66.249.66.169', '1707036226', null);
INSERT INTO `sl_read` VALUES ('355', '265', 'none', '66.249.66.167', '1707037575', null);
INSERT INTO `sl_read` VALUES ('356', '265', 'none', '135.181.79.106', '1707038215', null);
INSERT INTO `sl_read` VALUES ('357', '262', 'none', '66.249.66.168', '1707038925', null);
INSERT INTO `sl_read` VALUES ('358', '251', 'http://iamzcr.com/article/detail.html?id=251', '140.206.235.116', '1707059173', null);
INSERT INTO `sl_read` VALUES ('359', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.24', '1707072935', null);
INSERT INTO `sl_read` VALUES ('360', '265', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1707111228', null);
INSERT INTO `sl_read` VALUES ('361', '264', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1707111236', null);
INSERT INTO `sl_read` VALUES ('362', '264', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1707120799', null);
INSERT INTO `sl_read` VALUES ('363', '265', 'http://iamzcr.com/article/columns.html?cid=371', '183.6.88.24', '1707125438', null);
INSERT INTO `sl_read` VALUES ('364', '262', 'http://iamzcr.com/article/detail.html?id=262', '112.65.212.22', '1707128661', null);
INSERT INTO `sl_read` VALUES ('365', '264', 'http://iamzcr.com/', '183.6.88.38', '1707129140', null);
INSERT INTO `sl_read` VALUES ('366', '264', 'http://iamzcr.com/', '183.6.88.38', '1707139415', null);
INSERT INTO `sl_read` VALUES ('367', '267', 'http://iamzcr.com/article/month.html?month=2022-02', '183.6.88.38', '1707139420', null);
INSERT INTO `sl_read` VALUES ('368', '267', 'http://iamzcr.com/article/month.html?month=2022-02', '183.6.88.24', '1707141518', null);
INSERT INTO `sl_read` VALUES ('369', '267', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707150208', null);
INSERT INTO `sl_read` VALUES ('370', '267', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707151489', null);
INSERT INTO `sl_read` VALUES ('371', '263', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1707151504', null);
INSERT INTO `sl_read` VALUES ('372', '267', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707151837', null);
INSERT INTO `sl_read` VALUES ('373', '267', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707151876', null);
INSERT INTO `sl_read` VALUES ('374', '267', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707158106', null);
INSERT INTO `sl_read` VALUES ('375', '264', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.24', '1707158122', null);
INSERT INTO `sl_read` VALUES ('376', '256', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.24', '1707158204', null);
INSERT INTO `sl_read` VALUES ('377', '261', 'http://iamzcr.com/article/detail.html?id=264', '183.6.88.24', '1707158207', null);
INSERT INTO `sl_read` VALUES ('378', '262', 'http://iamzcr.com/article/detail.html?id=261', '183.6.88.24', '1707158207', null);
INSERT INTO `sl_read` VALUES ('379', '262', 'none', '66.249.66.167', '1707168057', null);
INSERT INTO `sl_read` VALUES ('380', '255', 'none', '66.249.66.169', '1707176158', null);
INSERT INTO `sl_read` VALUES ('381', '262', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1707200382', null);
INSERT INTO `sl_read` VALUES ('382', '263', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1707200409', null);
INSERT INTO `sl_read` VALUES ('383', '256', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1707200432', null);
INSERT INTO `sl_read` VALUES ('384', '261', 'http://iamzcr.com/index/index.html', '223.104.67.183', '1707203418', null);
INSERT INTO `sl_read` VALUES ('385', '262', 'http://iamzcr.com/index/index.html', '223.104.67.183', '1707203420', null);
INSERT INTO `sl_read` VALUES ('386', '248', 'http://iamzcr.com/article/detail.html?id=262', '223.104.67.183', '1707203424', null);
INSERT INTO `sl_read` VALUES ('387', '267', 'http://iamzcr.com/article/detail.html?id=262', '223.104.67.183', '1707203427', null);
INSERT INTO `sl_read` VALUES ('388', '263', 'http://iamzcr.com/', '223.104.67.183', '1707208750', null);
INSERT INTO `sl_read` VALUES ('389', '264', 'http://iamzcr.com/index/index.html', '223.104.67.183', '1707208755', null);
INSERT INTO `sl_read` VALUES ('390', '267', 'none', '149.202.86.190', '1707233907', null);
INSERT INTO `sl_read` VALUES ('391', '261', 'none', '185.191.171.15', '1707262468', null);
INSERT INTO `sl_read` VALUES ('392', '256', 'none', '185.191.171.17', '1707262569', null);
INSERT INTO `sl_read` VALUES ('393', '267', 'none', '116.179.32.135', '1707268520', null);
INSERT INTO `sl_read` VALUES ('394', '250', 'none', '185.191.171.6', '1707272209', null);
INSERT INTO `sl_read` VALUES ('395', '263', 'http://iamzcr.com/article/detail.html?id=263', '140.206.236.71', '1707276365', null);
INSERT INTO `sl_read` VALUES ('396', '252', 'none', '85.208.96.210', '1707285662', null);
INSERT INTO `sl_read` VALUES ('397', '249', 'none', '185.191.171.10', '1707286445', null);
INSERT INTO `sl_read` VALUES ('398', '263', 'none', '8.142.42.74', '1707289794', null);
INSERT INTO `sl_read` VALUES ('399', '263', 'none', '85.208.96.197', '1707290575', null);
INSERT INTO `sl_read` VALUES ('400', '264', 'none', '47.92.33.204', '1707300968', null);
INSERT INTO `sl_read` VALUES ('401', '262', 'none', '85.208.96.197', '1707327807', null);
INSERT INTO `sl_read` VALUES ('402', '264', 'http://iamzcr.com/article/detail.html?id=264', '112.65.211.194', '1707337896', null);
INSERT INTO `sl_read` VALUES ('403', '267', 'none', '66.249.66.169', '1707338054', null);
INSERT INTO `sl_read` VALUES ('404', '261', 'none', '66.249.66.167', '1707340753', null);
INSERT INTO `sl_read` VALUES ('405', '262', 'none', '66.249.66.167', '1707347218', null);
INSERT INTO `sl_read` VALUES ('406', '262', 'none', '66.249.66.168', '1707359543', null);
INSERT INTO `sl_read` VALUES ('407', '265', 'none', '66.249.66.169', '1707369722', null);
INSERT INTO `sl_read` VALUES ('408', '267', 'http://iamzcr.com/article/detail.html?id=267', '112.65.212.213', '1707452360', null);
INSERT INTO `sl_read` VALUES ('409', '255', 'none', '66.249.66.169', '1707473391', null);
INSERT INTO `sl_read` VALUES ('410', '265', 'http://iamzcr.com/article/detail.html?id=265', '112.65.212.102', '1707534556', null);
INSERT INTO `sl_read` VALUES ('411', '264', 'none', '66.249.66.168', '1707551730', null);
INSERT INTO `sl_read` VALUES ('412', '254', 'none', '66.249.66.168', '1707554430', null);
INSERT INTO `sl_read` VALUES ('413', '255', 'none', '66.249.66.169', '1707570127', null);
INSERT INTO `sl_read` VALUES ('414', '264', 'none', '185.191.171.13', '1707641368', null);
INSERT INTO `sl_read` VALUES ('415', '267', 'none', '85.208.96.205', '1707645468', null);
INSERT INTO `sl_read` VALUES ('416', '253', 'none', '185.191.171.5', '1707647546', null);
INSERT INTO `sl_read` VALUES ('417', '251', 'none', '85.208.96.207', '1707654341', null);
INSERT INTO `sl_read` VALUES ('418', '265', 'none', '66.249.66.169', '1707748207', null);
INSERT INTO `sl_read` VALUES ('419', '264', 'http://iamzcr.com/', '120.230.252.43', '1707753079', null);
INSERT INTO `sl_read` VALUES ('420', '254', 'none', '85.208.96.202', '1707803445', null);
INSERT INTO `sl_read` VALUES ('421', '265', 'none', '66.249.66.168', '1707818503', null);
INSERT INTO `sl_read` VALUES ('422', '263', 'none', '117.25.139.96', '1707846622', null);
INSERT INTO `sl_read` VALUES ('423', '262', 'none', '117.25.139.120', '1707846631', null);
INSERT INTO `sl_read` VALUES ('424', '261', 'none', '117.25.139.75', '1707846656', null);
INSERT INTO `sl_read` VALUES ('425', '264', 'none', '117.25.139.75', '1707846683', null);
INSERT INTO `sl_read` VALUES ('426', '256', 'none', '117.25.139.120', '1707846705', null);
INSERT INTO `sl_read` VALUES ('427', '249', 'none', '117.25.139.96', '1707846732', null);
INSERT INTO `sl_read` VALUES ('428', '257', 'none', '85.208.96.210', '1707851450', null);
INSERT INTO `sl_read` VALUES ('429', '248', 'none', '185.191.171.10', '1707857232', null);
INSERT INTO `sl_read` VALUES ('430', '259', 'none', '185.191.171.18', '1707861433', null);
INSERT INTO `sl_read` VALUES ('431', '265', 'none', '85.208.96.203', '1707882220', null);
INSERT INTO `sl_read` VALUES ('432', '258', 'none', '185.191.171.9', '1707882866', null);
INSERT INTO `sl_read` VALUES ('433', '253', 'none', '66.249.66.167', '1707911920', null);
INSERT INTO `sl_read` VALUES ('434', '265', 'none', '66.249.66.167', '1708037102', null);
INSERT INTO `sl_read` VALUES ('435', '256', 'http://iamzcr.com/', '223.74.32.102', '1708174393', null);
INSERT INTO `sl_read` VALUES ('436', '265', 'http://iamzcr.com/article/tags.html?tid=372', '223.74.32.102', '1708175113', null);
INSERT INTO `sl_read` VALUES ('437', '251', 'http://iamzcr.com/article/columns.html?cid=371', '183.6.88.24', '1708218553', null);
INSERT INTO `sl_read` VALUES ('438', '252', 'http://iamzcr.com/article/month.html?month=2017-06', '183.6.46.144', '1708223728', null);
INSERT INTO `sl_read` VALUES ('439', '256', 'http://iamzcr.com/article/columns.html?cid=374', '183.6.46.144', '1708223742', null);
INSERT INTO `sl_read` VALUES ('440', '263', 'http://iamzcr.com/', '183.6.46.144', '1708224046', null);
INSERT INTO `sl_read` VALUES ('441', '262', 'http://iamzcr.com/article/detail.html?id=263', '183.6.46.144', '1708224057', null);
INSERT INTO `sl_read` VALUES ('442', '261', 'http://iamzcr.com/article/detail.html?id=263', '183.6.46.144', '1708224063', null);
INSERT INTO `sl_read` VALUES ('443', '249', 'http://iamzcr.com/article/month.html?month=2022-06', '183.6.46.144', '1708224105', null);
INSERT INTO `sl_read` VALUES ('444', '250', 'http://iamzcr.com/article/tags.html?tid=372', '183.6.88.38', '1708225435', null);
INSERT INTO `sl_read` VALUES ('445', '268', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.38', '1708225440', null);
INSERT INTO `sl_read` VALUES ('446', '268', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.24', '1708225925', null);
INSERT INTO `sl_read` VALUES ('447', '268', 'http://iamzcr.com/article/detail.html?id=250', '183.6.88.38', '1708227260', null);
INSERT INTO `sl_read` VALUES ('448', '268', 'http://iamzcr.com/article/month.html?month=2020-02', '183.6.88.38', '1708227269', null);
INSERT INTO `sl_read` VALUES ('449', '248', 'http://iamzcr.com/article/detail.html?id=268', '183.6.88.38', '1708227410', null);
INSERT INTO `sl_read` VALUES ('450', '256', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1708227954', null);
INSERT INTO `sl_read` VALUES ('451', '267', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.38', '1708227965', null);
INSERT INTO `sl_read` VALUES ('452', '264', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.38', '1708227971', null);
INSERT INTO `sl_read` VALUES ('453', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708228758', null);
INSERT INTO `sl_read` VALUES ('454', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708230873', null);
INSERT INTO `sl_read` VALUES ('455', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708230873', null);
INSERT INTO `sl_read` VALUES ('456', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708230888', null);
INSERT INTO `sl_read` VALUES ('457', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708231266', null);
INSERT INTO `sl_read` VALUES ('458', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708234706', null);
INSERT INTO `sl_read` VALUES ('459', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708234769', null);
INSERT INTO `sl_read` VALUES ('460', '268', 'none', '220.181.108.166', '1708234955', null);
INSERT INTO `sl_read` VALUES ('461', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.38', '1708235278', null);
INSERT INTO `sl_read` VALUES ('462', '269', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.24', '1708235849', null);
INSERT INTO `sl_read` VALUES ('463', '269', 'http://iamzcr.com/article/columns.html?cid=374', '183.6.88.24', '1708237439', null);
INSERT INTO `sl_read` VALUES ('464', '269', 'none', '116.179.32.95', '1708240355', null);
INSERT INTO `sl_read` VALUES ('465', '256', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708248350', null);
INSERT INTO `sl_read` VALUES ('466', '263', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708248376', null);
INSERT INTO `sl_read` VALUES ('467', '263', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708248378', null);
INSERT INTO `sl_read` VALUES ('468', '261', 'http://iamzcr.com/article/detail.html?id=263', '183.6.88.24', '1708248381', null);
INSERT INTO `sl_read` VALUES ('469', '269', 'http://iamzcr.com/article/detail.html?id=261', '183.6.88.24', '1708248382', null);
INSERT INTO `sl_read` VALUES ('470', '248', 'http://iamzcr.com/article/tags.html?tid=374', '183.6.88.24', '1708248552', null);
INSERT INTO `sl_read` VALUES ('471', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708248777', null);
INSERT INTO `sl_read` VALUES ('472', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708249102', null);
INSERT INTO `sl_read` VALUES ('473', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708250206', null);
INSERT INTO `sl_read` VALUES ('474', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708250207', null);
INSERT INTO `sl_read` VALUES ('475', '269', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708250207', null);
INSERT INTO `sl_read` VALUES ('476', '254', 'https://www.google.com/', '183.6.88.38', '1708250371', null);
INSERT INTO `sl_read` VALUES ('477', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1708250380', null);
INSERT INTO `sl_read` VALUES ('478', '257', 'none', '60.188.9.89', '1708252151', null);
INSERT INTO `sl_read` VALUES ('479', '269', 'http://www.iamzcr.com/', '183.6.88.38', '1708257629', null);
INSERT INTO `sl_read` VALUES ('480', '256', 'http://www.iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708257962', null);
INSERT INTO `sl_read` VALUES ('481', '269', 'none', '183.6.88.38', '1708258098', null);
INSERT INTO `sl_read` VALUES ('482', '269', 'none', '183.6.88.38', '1708258107', null);
INSERT INTO `sl_read` VALUES ('483', '269', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.38', '1708259002', null);
INSERT INTO `sl_read` VALUES ('484', '264', 'http://iamzcr.com/article/detail.html?id=269', '183.6.88.38', '1708259002', null);
INSERT INTO `sl_read` VALUES ('485', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1708259022', null);
INSERT INTO `sl_read` VALUES ('486', '263', 'none', '185.191.171.4', '1708267835', null);
INSERT INTO `sl_read` VALUES ('487', '263', 'http://iamzcr.com/', '183.6.88.38', '1708272236', null);
INSERT INTO `sl_read` VALUES ('488', '256', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708272241', null);
INSERT INTO `sl_read` VALUES ('489', '269', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708272243', null);
INSERT INTO `sl_read` VALUES ('490', '250', 'http://iamzcr.com/article/tags.html?tid=372', '116.22.59.250', '1708284307', null);
INSERT INTO `sl_read` VALUES ('491', '248', 'http://iamzcr.com/article/detail.html?id=250', '116.22.59.250', '1708284311', null);
INSERT INTO `sl_read` VALUES ('492', '264', 'http://iamzcr.com/article/tags.html?tid=376', '116.22.59.250', '1708284326', null);
INSERT INTO `sl_read` VALUES ('493', '262', 'none', '85.208.96.194', '1708298669', null);
INSERT INTO `sl_read` VALUES ('494', '269', 'none', '88.99.95.199', '1708315237', null);
INSERT INTO `sl_read` VALUES ('495', '264', 'none', '88.99.95.199', '1708315254', null);
INSERT INTO `sl_read` VALUES ('496', '263', 'none', '88.99.95.199', '1708315273', null);
INSERT INTO `sl_read` VALUES ('497', '262', 'none', '88.99.95.199', '1708315297', null);
INSERT INTO `sl_read` VALUES ('498', '261', 'none', '88.99.95.199', '1708315323', null);
INSERT INTO `sl_read` VALUES ('499', '256', 'none', '88.99.95.199', '1708315350', null);
INSERT INTO `sl_read` VALUES ('500', '268', 'none', '88.99.95.199', '1708316979', null);
INSERT INTO `sl_read` VALUES ('501', '267', 'none', '88.99.95.199', '1708316985', null);
INSERT INTO `sl_read` VALUES ('502', '265', 'none', '88.99.95.199', '1708316991', null);
INSERT INTO `sl_read` VALUES ('503', '259', 'none', '88.99.95.199', '1708316999', null);
INSERT INTO `sl_read` VALUES ('504', '258', 'none', '88.99.95.199', '1708317003', null);
INSERT INTO `sl_read` VALUES ('505', '257', 'none', '88.99.95.199', '1708317008', null);
INSERT INTO `sl_read` VALUES ('506', '254', 'none', '88.99.95.199', '1708317014', null);
INSERT INTO `sl_read` VALUES ('507', '253', 'none', '88.99.95.199', '1708317021', null);
INSERT INTO `sl_read` VALUES ('508', '252', 'none', '88.99.95.199', '1708317029', null);
INSERT INTO `sl_read` VALUES ('509', '251', 'none', '88.99.95.199', '1708317037', null);
INSERT INTO `sl_read` VALUES ('510', '250', 'none', '88.99.95.199', '1708317046', null);
INSERT INTO `sl_read` VALUES ('511', '261', 'none', '85.208.96.200', '1708317056', null);
INSERT INTO `sl_read` VALUES ('512', '249', 'none', '88.99.95.199', '1708317058', null);
INSERT INTO `sl_read` VALUES ('513', '248', 'none', '88.99.95.199', '1708317068', null);
INSERT INTO `sl_read` VALUES ('514', '263', 'http://iamzcr.com/', '183.6.88.38', '1708321849', null);
INSERT INTO `sl_read` VALUES ('515', '256', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708321859', null);
INSERT INTO `sl_read` VALUES ('516', '269', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708321867', null);
INSERT INTO `sl_read` VALUES ('517', '248', 'http://iamzcr.com/article/tags.html?tid=374', '183.6.88.38', '1708321896', null);
INSERT INTO `sl_read` VALUES ('518', '269', 'http://iamzcr.com/article/columns.html?cid=374', '113.111.0.240', '1708325967', null);
INSERT INTO `sl_read` VALUES ('519', '263', 'http://iamzcr.com/about/index.html', '113.111.0.240', '1708325978', null);
INSERT INTO `sl_read` VALUES ('520', '256', 'none', '185.191.171.2', '1708327696', null);
INSERT INTO `sl_read` VALUES ('521', '263', 'http://iamzcr.com/', '223.104.76.229', '1708330629', null);
INSERT INTO `sl_read` VALUES ('522', '264', 'http://iamzcr.com/', '223.104.76.229', '1708330668', null);
INSERT INTO `sl_read` VALUES ('523', '269', 'http://iamzcr.com/article/detail.html?id=264', '223.104.76.229', '1708330713', null);
INSERT INTO `sl_read` VALUES ('524', '248', 'http://iamzcr.com/article/detail.html?id=269', '223.104.76.229', '1708330767', null);
INSERT INTO `sl_read` VALUES ('525', '262', 'http://iamzcr.com/', '223.104.76.229', '1708330778', null);
INSERT INTO `sl_read` VALUES ('526', '256', 'http://iamzcr.com/article/detail.html?id=269', '223.104.76.229', '1708330819', null);
INSERT INTO `sl_read` VALUES ('527', '257', 'http://iamzcr.com/article/tags.html?tid=387', '223.104.76.229', '1708330851', null);
INSERT INTO `sl_read` VALUES ('528', '258', 'http://iamzcr.com/article/tags.html?tid=387', '223.104.76.229', '1708330861', null);
INSERT INTO `sl_read` VALUES ('529', '259', 'http://iamzcr.com/article/tags.html?tid=387', '223.104.76.229', '1708330877', null);
INSERT INTO `sl_read` VALUES ('530', '256', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708335303', null);
INSERT INTO `sl_read` VALUES ('531', '269', 'http://iamzcr.com/article/detail.html?id=256', '183.6.88.24', '1708335312', null);
INSERT INTO `sl_read` VALUES ('532', '269', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338735', null);
INSERT INTO `sl_read` VALUES ('533', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338746', null);
INSERT INTO `sl_read` VALUES ('534', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338807', null);
INSERT INTO `sl_read` VALUES ('535', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338808', null);
INSERT INTO `sl_read` VALUES ('536', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338808', null);
INSERT INTO `sl_read` VALUES ('537', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338808', null);
INSERT INTO `sl_read` VALUES ('538', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338808', null);
INSERT INTO `sl_read` VALUES ('539', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338809', null);
INSERT INTO `sl_read` VALUES ('540', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338809', null);
INSERT INTO `sl_read` VALUES ('541', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708338809', null);
INSERT INTO `sl_read` VALUES ('542', '270', 'http://iamzcr.com/article/tags.html?tid=384', '223.104.76.229', '1708340052', null);
INSERT INTO `sl_read` VALUES ('543', '270', 'none', '116.179.32.212', '1708342624', null);
INSERT INTO `sl_read` VALUES ('544', '269', 'none', '217.182.175.146', '1708345316', null);
INSERT INTO `sl_read` VALUES ('545', '263', 'http://iamzcr.com/', '183.6.88.38', '1708346805', null);
INSERT INTO `sl_read` VALUES ('546', '262', 'http://iamzcr.com/article/detail.html?id=263', '183.6.88.38', '1708346806', null);
INSERT INTO `sl_read` VALUES ('547', '261', 'http://iamzcr.com/article/detail.html?id=262', '183.6.88.38', '1708346807', null);
INSERT INTO `sl_read` VALUES ('548', '264', 'http://iamzcr.com/article/detail.html?id=261', '183.6.88.38', '1708346808', null);
INSERT INTO `sl_read` VALUES ('549', '270', 'http://iamzcr.com/article/detail.html?id=264', '183.6.88.38', '1708346808', null);
INSERT INTO `sl_read` VALUES ('550', '256', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708346821', null);
INSERT INTO `sl_read` VALUES ('551', '269', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708346824', null);
INSERT INTO `sl_read` VALUES ('552', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708350001', null);
INSERT INTO `sl_read` VALUES ('553', '271', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.38', '1708350037', null);
INSERT INTO `sl_read` VALUES ('554', '271', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.24', '1708350705', null);
INSERT INTO `sl_read` VALUES ('555', '271', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.24', '1708350706', null);
INSERT INTO `sl_read` VALUES ('556', '271', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.24', '1708350761', null);
INSERT INTO `sl_read` VALUES ('557', '271', 'none', '116.179.32.198', '1708351026', null);
INSERT INTO `sl_read` VALUES ('558', '270', 'http://iamzcr.com/', '223.104.76.229', '1708354357', null);
INSERT INTO `sl_read` VALUES ('559', '248', 'http://iamzcr.com/article/detail.html?id=270', '223.104.76.229', '1708354466', null);
INSERT INTO `sl_read` VALUES ('560', '271', 'http://iamzcr.com/article/detail.html?id=270', '223.104.76.229', '1708354470', null);
INSERT INTO `sl_read` VALUES ('561', '269', 'http://iamzcr.com/index/index.html', '223.104.76.229', '1708354541', null);
INSERT INTO `sl_read` VALUES ('562', '264', 'http://iamzcr.com/article/tags.html?tid=376', '223.104.76.229', '1708354805', null);
INSERT INTO `sl_read` VALUES ('563', '264', 'http://iamzcr.com/article/tags.html?tid=376', '223.104.76.229', '1708354808', null);
INSERT INTO `sl_read` VALUES ('564', '268', 'none', '217.182.134.106', '1708376269', null);
INSERT INTO `sl_read` VALUES ('565', '270', 'none', '217.182.134.106', '1708376271', null);
INSERT INTO `sl_read` VALUES ('566', '262', 'none', '23.22.35.162', '1708380554', null);
INSERT INTO `sl_read` VALUES ('567', '263', 'none', '3.224.220.101', '1708380557', null);
INSERT INTO `sl_read` VALUES ('568', '261', 'none', '3.224.220.101', '1708380561', null);
INSERT INTO `sl_read` VALUES ('569', '264', 'none', '23.22.35.162', '1708380566', null);
INSERT INTO `sl_read` VALUES ('570', '269', 'none', '3.224.220.101', '1708380569', null);
INSERT INTO `sl_read` VALUES ('571', '270', 'none', '3.224.220.101', '1708380573', null);
INSERT INTO `sl_read` VALUES ('572', '263', 'none', '113.215.189.105', '1708384617', null);
INSERT INTO `sl_read` VALUES ('573', '264', 'none', '220.181.108.83', '1708387337', null);
INSERT INTO `sl_read` VALUES ('574', '264', 'none', '113.215.189.84', '1708387512', null);
INSERT INTO `sl_read` VALUES ('575', '258', 'none', '113.215.188.22', '1708387595', null);
INSERT INTO `sl_read` VALUES ('576', '270', 'none', '113.215.189.45', '1708388019', null);
INSERT INTO `sl_read` VALUES ('577', '257', 'none', '113.215.189.115', '1708389744', null);
INSERT INTO `sl_read` VALUES ('578', '269', 'none', '113.215.189.121', '1708391740', null);
INSERT INTO `sl_read` VALUES ('579', '270', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708395123', null);
INSERT INTO `sl_read` VALUES ('580', '264', 'http://iamzcr.com/article/detail.html?id=270', '183.6.88.24', '1708395133', null);
INSERT INTO `sl_read` VALUES ('581', '271', 'none', '47.92.68.55', '1708399098', null);
INSERT INTO `sl_read` VALUES ('582', '256', 'none', '47.92.78.126', '1708399180', null);
INSERT INTO `sl_read` VALUES ('583', '248', 'none', '3.224.220.101', '1708401585', null);
INSERT INTO `sl_read` VALUES ('584', '271', 'none', '23.22.35.162', '1708401589', null);
INSERT INTO `sl_read` VALUES ('585', '256', 'none', '52.70.240.171', '1708401590', null);
INSERT INTO `sl_read` VALUES ('586', '272', 'http://iamzcr.com/article/tags.html?tid=377', '183.6.88.38', '1708402409', null);
INSERT INTO `sl_read` VALUES ('587', '265', 'none', '23.22.35.162', '1708404506', null);
INSERT INTO `sl_read` VALUES ('588', '256', 'none', '52.70.240.171', '1708404509', null);
INSERT INTO `sl_read` VALUES ('589', '251', 'none', '23.22.35.162', '1708405354', null);
INSERT INTO `sl_read` VALUES ('590', '252', 'none', '3.224.220.101', '1708405666', null);
INSERT INTO `sl_read` VALUES ('591', '253', 'none', '3.224.220.101', '1708405669', null);
INSERT INTO `sl_read` VALUES ('592', '267', 'none', '23.22.35.162', '1708407102', null);
INSERT INTO `sl_read` VALUES ('593', '259', 'none', '23.22.35.162', '1708409361', null);
INSERT INTO `sl_read` VALUES ('594', '257', 'none', '52.70.240.171', '1708409366', null);
INSERT INTO `sl_read` VALUES ('595', '258', 'none', '23.22.35.162', '1708409369', null);
INSERT INTO `sl_read` VALUES ('596', '268', 'none', '52.70.240.171', '1708410037', null);
INSERT INTO `sl_read` VALUES ('597', '249', 'none', '52.70.240.171', '1708417862', null);
INSERT INTO `sl_read` VALUES ('598', '250', 'none', '23.22.35.162', '1708417866', null);
INSERT INTO `sl_read` VALUES ('599', '269', 'none', '3.224.220.101', '1708418253', null);
INSERT INTO `sl_read` VALUES ('600', '264', 'none', '52.70.240.171', '1708419901', null);
INSERT INTO `sl_read` VALUES ('601', '269', 'none', '52.70.240.171', '1708419905', null);
INSERT INTO `sl_read` VALUES ('602', '263', 'none', '52.70.240.171', '1708419909', null);
INSERT INTO `sl_read` VALUES ('603', '262', 'none', '23.22.35.162', '1708419913', null);
INSERT INTO `sl_read` VALUES ('604', '261', 'none', '23.22.35.162', '1708419917', null);
INSERT INTO `sl_read` VALUES ('605', '270', 'none', '23.22.35.162', '1708419921', null);
INSERT INTO `sl_read` VALUES ('606', '254', 'none', '23.22.35.162', '1708420129', null);
INSERT INTO `sl_read` VALUES ('607', '272', 'none', '3.224.220.101', '1708422009', null);
INSERT INTO `sl_read` VALUES ('608', '273', 'http://iamzcr.com/', '183.6.88.38', '1708422412', null);
INSERT INTO `sl_read` VALUES ('609', '273', 'http://iamzcr.com/', '223.104.67.225', '1708423150', null);
INSERT INTO `sl_read` VALUES ('610', '273', 'none', '116.179.32.151', '1708423213', null);
INSERT INTO `sl_read` VALUES ('611', '273', 'http://iamzcr.com/article/tags.html?tid=375', '183.6.88.24', '1708424003', null);
INSERT INTO `sl_read` VALUES ('612', '273', 'http://iamzcr.com/article/tags.html?tid=375', '183.6.88.24', '1708424007', null);
INSERT INTO `sl_read` VALUES ('613', '273', 'http://iamzcr.com/article/tags.html?tid=375', '183.6.88.38', '1708424661', null);
INSERT INTO `sl_read` VALUES ('614', '273', 'http://iamzcr.com/article/tags.html?tid=375', '183.6.88.24', '1708424853', null);
INSERT INTO `sl_read` VALUES ('615', '273', 'http://iamzcr.com/article/tags.html?tid=375', '183.6.88.38', '1708425288', null);
INSERT INTO `sl_read` VALUES ('616', '262', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1708425307', null);
INSERT INTO `sl_read` VALUES ('617', '273', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708429051', null);
INSERT INTO `sl_read` VALUES ('618', '261', 'http://iamzcr.com/', '223.104.67.225', '1708437524', null);
INSERT INTO `sl_read` VALUES ('619', '273', 'http://iamzcr.com/', '223.104.67.225', '1708437530', null);
INSERT INTO `sl_read` VALUES ('620', '256', 'http://iamzcr.com/article/tags.html?tid=384', '223.104.67.225', '1708437632', null);
INSERT INTO `sl_read` VALUES ('621', '269', 'http://iamzcr.com/article/tags.html?tid=384', '223.104.67.225', '1708437646', null);
INSERT INTO `sl_read` VALUES ('622', '270', 'http://iamzcr.com/article/tags.html?tid=384', '223.104.67.225', '1708437687', null);
INSERT INTO `sl_read` VALUES ('623', '270', 'http://iamzcr.com/article/tags.html?tid=384', '223.104.67.225', '1708437715', null);
INSERT INTO `sl_read` VALUES ('624', '262', 'http://iamzcr.com/index/index.html', '223.104.67.225', '1708437764', null);
INSERT INTO `sl_read` VALUES ('625', '271', 'none', '23.22.35.162', '1708443613', null);
INSERT INTO `sl_read` VALUES ('626', '270', 'none', '3.224.220.101', '1708443617', null);
INSERT INTO `sl_read` VALUES ('627', '262', 'none', '3.224.220.101', '1708443621', null);
INSERT INTO `sl_read` VALUES ('628', '261', 'none', '3.224.220.101', '1708443626', null);
INSERT INTO `sl_read` VALUES ('629', '264', 'none', '52.70.240.171', '1708443630', null);
INSERT INTO `sl_read` VALUES ('630', '263', 'none', '3.224.220.101', '1708443633', null);
INSERT INTO `sl_read` VALUES ('631', '248', 'none', '52.70.240.171', '1708443637', null);
INSERT INTO `sl_read` VALUES ('632', '251', 'none', '23.22.35.162', '1708445046', null);
INSERT INTO `sl_read` VALUES ('633', '265', 'none', '52.70.240.171', '1708445498', null);
INSERT INTO `sl_read` VALUES ('634', '249', 'none', '52.70.240.171', '1708445501', null);
INSERT INTO `sl_read` VALUES ('635', '272', 'none', '3.224.220.101', '1708445505', null);
INSERT INTO `sl_read` VALUES ('636', '250', 'none', '3.224.220.101', '1708445846', null);
INSERT INTO `sl_read` VALUES ('637', '256', 'none', '52.70.240.171', '1708447709', null);
INSERT INTO `sl_read` VALUES ('638', '248', 'none', '52.70.240.171', '1708447969', null);
INSERT INTO `sl_read` VALUES ('639', '271', 'none', '94.23.203.107', '1708448663', null);
INSERT INTO `sl_read` VALUES ('640', '252', 'none', '3.224.220.101', '1708451649', null);
INSERT INTO `sl_read` VALUES ('641', '259', 'none', '52.70.240.171', '1708452305', null);
INSERT INTO `sl_read` VALUES ('642', '258', 'none', '23.22.35.162', '1708452309', null);
INSERT INTO `sl_read` VALUES ('643', '268', 'none', '23.22.35.162', '1708456069', null);
INSERT INTO `sl_read` VALUES ('644', '254', 'none', '52.70.240.171', '1708456073', null);
INSERT INTO `sl_read` VALUES ('645', '250', 'none', '52.70.240.171', '1708456077', null);
INSERT INTO `sl_read` VALUES ('646', '267', 'none', '52.70.240.171', '1708457865', null);
INSERT INTO `sl_read` VALUES ('647', '271', 'none', '23.22.35.162', '1708457869', null);
INSERT INTO `sl_read` VALUES ('648', '272', 'none', '52.70.240.171', '1708458173', null);
INSERT INTO `sl_read` VALUES ('649', '257', 'none', '3.224.220.101', '1708459233', null);
INSERT INTO `sl_read` VALUES ('650', '273', 'none', '23.22.35.162', '1708463250', null);
INSERT INTO `sl_read` VALUES ('651', '259', 'none', '3.224.220.101', '1708463253', null);
INSERT INTO `sl_read` VALUES ('652', '273', 'none', '54.38.85.37', '1708464000', null);
INSERT INTO `sl_read` VALUES ('653', '253', 'none', '23.22.35.162', '1708464081', null);
INSERT INTO `sl_read` VALUES ('654', '252', 'none', '52.70.240.171', '1708464085', null);
INSERT INTO `sl_read` VALUES ('655', '265', 'none', '23.22.35.162', '1708465938', null);
INSERT INTO `sl_read` VALUES ('656', '268', 'none', '52.70.240.171', '1708465941', null);
INSERT INTO `sl_read` VALUES ('657', '249', 'none', '23.22.35.162', '1708465945', null);
INSERT INTO `sl_read` VALUES ('658', '273', 'none', '66.249.66.168', '1708466350', null);
INSERT INTO `sl_read` VALUES ('659', '253', 'none', '52.70.240.171', '1708468069', null);
INSERT INTO `sl_read` VALUES ('660', '251', 'none', '23.22.35.162', '1708468174', null);
INSERT INTO `sl_read` VALUES ('661', '254', 'none', '3.224.220.101', '1708470038', null);
INSERT INTO `sl_read` VALUES ('662', '273', 'none', '3.224.220.101', '1708470489', null);
INSERT INTO `sl_read` VALUES ('663', '264', 'none', '60.188.9.138', '1708470677', null);
INSERT INTO `sl_read` VALUES ('664', '257', 'none', '52.70.240.171', '1708471061', null);
INSERT INTO `sl_read` VALUES ('665', '258', 'none', '23.22.35.162', '1708471066', null);
INSERT INTO `sl_read` VALUES ('666', '267', 'none', '52.70.240.171', '1708473246', null);
INSERT INTO `sl_read` VALUES ('667', '273', 'none', '113.215.189.201', '1708474190', null);
INSERT INTO `sl_read` VALUES ('668', '264', 'http://iamzcr.com/', '183.6.88.38', '1708484153', null);
INSERT INTO `sl_read` VALUES ('669', '273', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708484158', null);
INSERT INTO `sl_read` VALUES ('670', '271', 'http://iamzcr.com/article/tags.html?tid=383', '183.6.88.38', '1708484315', null);
INSERT INTO `sl_read` VALUES ('671', '270', 'none', '60.188.9.202', '1708503402', null);
INSERT INTO `sl_read` VALUES ('672', '263', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708508451', null);
INSERT INTO `sl_read` VALUES ('673', '273', 'http://iamzcr.com/index/index.html', '183.6.88.24', '1708508460', null);
INSERT INTO `sl_read` VALUES ('674', '273', 'none', '185.191.171.5', '1708513369', null);
INSERT INTO `sl_read` VALUES ('675', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524687', null);
INSERT INTO `sl_read` VALUES ('676', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524715', null);
INSERT INTO `sl_read` VALUES ('677', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524716', null);
INSERT INTO `sl_read` VALUES ('678', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524716', null);
INSERT INTO `sl_read` VALUES ('679', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524716', null);
INSERT INTO `sl_read` VALUES ('680', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('681', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('682', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('683', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('684', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('685', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524717', null);
INSERT INTO `sl_read` VALUES ('686', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('687', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('688', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('689', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('690', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('691', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524718', null);
INSERT INTO `sl_read` VALUES ('692', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524719', null);
INSERT INTO `sl_read` VALUES ('693', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524719', null);
INSERT INTO `sl_read` VALUES ('694', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708524722', null);
INSERT INTO `sl_read` VALUES ('695', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708524776', null);
INSERT INTO `sl_read` VALUES ('696', '273', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1708524782', null);
INSERT INTO `sl_read` VALUES ('697', '274', 'none', '66.249.66.169', '1708536508', null);
INSERT INTO `sl_read` VALUES ('698', '270', 'none', '85.208.96.210', '1708548734', null);
INSERT INTO `sl_read` VALUES ('699', '270', 'none', '66.249.66.168', '1708552437', null);
INSERT INTO `sl_read` VALUES ('700', '263', 'none', '60.188.9.34', '1708557177', null);
INSERT INTO `sl_read` VALUES ('701', '256', 'none', '113.215.188.224', '1708557192', null);
INSERT INTO `sl_read` VALUES ('702', '261', 'none', '113.215.189.129', '1708557213', null);
INSERT INTO `sl_read` VALUES ('703', '270', 'none', '113.215.189.201', '1708564358', null);
INSERT INTO `sl_read` VALUES ('704', '262', 'none', '113.215.189.201', '1708565017', null);
INSERT INTO `sl_read` VALUES ('705', '273', 'none', '113.215.189.195', '1708572142', null);
INSERT INTO `sl_read` VALUES ('706', '269', 'none', '185.191.171.17', '1708584460', null);
INSERT INTO `sl_read` VALUES ('707', '268', 'none', '66.249.66.168', '1708588415', null);
INSERT INTO `sl_read` VALUES ('708', '274', 'none', '52.70.240.171', '1708591066', null);
INSERT INTO `sl_read` VALUES ('709', '263', 'http://iamzcr.com/', '221.238.143.39', '1708591142', null);
INSERT INTO `sl_read` VALUES ('710', '270', 'http://iamzcr.com/article/columns.html?cid=374', '116.229.104.36', '1708600091', null);
INSERT INTO `sl_read` VALUES ('711', '263', 'http://iamzcr.com/', '163.123.192.55', '1708600775', null);
INSERT INTO `sl_read` VALUES ('712', '252', 'http://iamzcr.com/article/month.html?month=2017-06', '163.123.192.55', '1708600807', null);
INSERT INTO `sl_read` VALUES ('713', '273', 'none', '52.167.144.166', '1708601087', null);
INSERT INTO `sl_read` VALUES ('714', '270', 'none', '157.55.39.52', '1708601092', null);
INSERT INTO `sl_read` VALUES ('715', '263', 'none', '157.55.39.52', '1708601093', null);
INSERT INTO `sl_read` VALUES ('716', '262', 'none', '157.55.39.52', '1708601094', null);
INSERT INTO `sl_read` VALUES ('717', '264', 'none', '52.167.144.166', '1708601098', null);
INSERT INTO `sl_read` VALUES ('718', '264', 'http://iamzcr.com/', '171.11.23.241', '1708601223', null);
INSERT INTO `sl_read` VALUES ('719', '270', 'http://iamzcr.com/', '61.149.238.89', '1708601969', null);
INSERT INTO `sl_read` VALUES ('720', '248', 'http://iamzcr.com/article/detail.html?id=270', '61.149.238.89', '1708601985', null);
INSERT INTO `sl_read` VALUES ('721', '261', 'none', '157.55.39.11', '1708602110', null);
INSERT INTO `sl_read` VALUES ('722', '272', 'none', '66.249.65.241', '1708602265', null);
INSERT INTO `sl_read` VALUES ('723', '273', 'http://iamzcr.com/', '223.104.68.163', '1708602343', null);
INSERT INTO `sl_read` VALUES ('724', '252', 'http://iamzcr.com/article/month.html?month=2017-06', '116.30.100.110', '1708602857', null);
INSERT INTO `sl_read` VALUES ('725', '273', 'http://iamzcr.com/', '219.140.33.52', '1708603237', null);
INSERT INTO `sl_read` VALUES ('726', '263', 'http://iamzcr.com/', '111.18.97.5', '1708604605', null);
INSERT INTO `sl_read` VALUES ('727', '269', 'http://iamzcr.com/article/columns.html?cid=374', '111.18.97.5', '1708604618', null);
INSERT INTO `sl_read` VALUES ('728', '263', 'http://iamzcr.com/', '111.183.47.92', '1708605457', null);
INSERT INTO `sl_read` VALUES ('729', '263', 'none', '157.55.39.58', '1708605459', null);
INSERT INTO `sl_read` VALUES ('730', '274', 'none', '52.167.144.189', '1708605484', null);
INSERT INTO `sl_read` VALUES ('731', '262', 'http://iamzcr.com/', '114.84.240.26', '1708605485', null);
INSERT INTO `sl_read` VALUES ('732', '248', 'none', '52.167.144.189', '1708605485', null);
INSERT INTO `sl_read` VALUES ('733', '273', 'none', '69.160.160.52', '1708617924', null);
INSERT INTO `sl_read` VALUES ('734', '272', 'none', '69.160.160.52', '1708617924', null);
INSERT INTO `sl_read` VALUES ('735', '261', 'none', '69.160.160.52', '1708617925', null);
INSERT INTO `sl_read` VALUES ('736', '265', 'none', '69.160.160.52', '1708617926', null);
INSERT INTO `sl_read` VALUES ('737', '248', 'none', '69.160.160.52', '1708617926', null);
INSERT INTO `sl_read` VALUES ('738', '249', 'none', '69.160.160.52', '1708617927', null);
INSERT INTO `sl_read` VALUES ('739', '251', 'none', '69.160.160.52', '1708617927', null);
INSERT INTO `sl_read` VALUES ('740', '257', 'none', '69.160.160.52', '1708617927', null);
INSERT INTO `sl_read` VALUES ('741', '250', 'none', '69.160.160.52', '1708617928', null);
INSERT INTO `sl_read` VALUES ('742', '274', 'none', '193.70.81.103', '1708628823', null);
INSERT INTO `sl_read` VALUES ('743', '263', 'none', '116.179.32.98', '1708637579', null);
INSERT INTO `sl_read` VALUES ('744', '257', 'http://iamzcr.com/article/tags.html?tid=387', '39.144.65.173', '1708639972', null);
INSERT INTO `sl_read` VALUES ('745', '261', 'http://iamzcr.com/', '27.115.124.53', '1708640004', null);
INSERT INTO `sl_read` VALUES ('746', '248', 'http://iamzcr.com/article/detail.html?id=261', '27.115.124.109', '1708640007', null);
INSERT INTO `sl_read` VALUES ('747', '251', 'http://iamzcr.com/article/tags.html?tid=379', '39.144.65.173', '1708640057', null);
INSERT INTO `sl_read` VALUES ('748', '248', 'http://iamzcr.com/article/detail.html?id=251', '39.144.65.173', '1708640093', null);
INSERT INTO `sl_read` VALUES ('749', '274', 'none', '116.179.32.141', '1708640692', null);
INSERT INTO `sl_read` VALUES ('750', '263', 'http://iamzcr.com/', '223.104.40.35', '1708654176', null);
INSERT INTO `sl_read` VALUES ('751', '248', 'http://iamzcr.com/article/detail.html?id=263', '223.104.40.35', '1708654191', null);
INSERT INTO `sl_read` VALUES ('752', '274', 'http://iamzcr.com/article/detail.html?id=248', '223.104.40.35', '1708654196', null);
INSERT INTO `sl_read` VALUES ('753', '274', 'http://iamzcr.com/article/tags.html?tid=388', '183.6.88.38', '1708656478', null);
INSERT INTO `sl_read` VALUES ('754', '262', 'http://iamzcr.com/', '65.75.194.71', '1708659273', null);
INSERT INTO `sl_read` VALUES ('755', '263', 'http://iamzcr.com/', '65.75.194.71', '1708659282', null);
INSERT INTO `sl_read` VALUES ('756', '272', 'http://iamzcr.com/article/tags.html?tid=377', '183.6.88.38', '1708674119', null);
INSERT INTO `sl_read` VALUES ('757', '249', 'none', '60.188.11.1', '1708676975', null);
INSERT INTO `sl_read` VALUES ('758', '250', 'none', '66.249.73.18', '1708682651', null);
INSERT INTO `sl_read` VALUES ('759', '269', 'none', '66.249.66.168', '1708696151', null);
INSERT INTO `sl_read` VALUES ('760', '263', 'http://iamzcr.com/', '14.19.175.208', '1708701569', null);
INSERT INTO `sl_read` VALUES ('761', '248', 'http://iamzcr.com/article/tags.html?tid=374', '14.19.175.208', '1708701588', null);
INSERT INTO `sl_read` VALUES ('762', '273', 'http://iamzcr.com/article/detail.html?id=248', '14.19.175.208', '1708701592', null);
INSERT INTO `sl_read` VALUES ('763', '274', 'http://iamzcr.com/article/tags.html?tid=388', '14.19.175.208', '1708701628', null);
INSERT INTO `sl_read` VALUES ('764', '268', 'none', '185.191.171.3', '1708767272', null);
INSERT INTO `sl_read` VALUES ('765', '250', 'none', '85.208.96.197', '1708774261', null);
INSERT INTO `sl_read` VALUES ('766', '271', 'none', '85.208.96.198', '1708780137', null);
INSERT INTO `sl_read` VALUES ('767', '249', 'none', '85.208.96.208', '1708780214', null);
INSERT INTO `sl_read` VALUES ('768', '256', 'none', '60.188.11.110', '1708780796', null);
INSERT INTO `sl_read` VALUES ('769', '252', 'none', '85.208.96.204', '1708782378', null);
INSERT INTO `sl_read` VALUES ('770', '263', 'none', '46.101.9.216', '1708786451', null);
INSERT INTO `sl_read` VALUES ('771', '262', 'none', '46.101.9.216', '1708786452', null);
INSERT INTO `sl_read` VALUES ('772', '267', 'none', '85.208.96.212', '1708789442', null);
INSERT INTO `sl_read` VALUES ('773', '274', 'none', '85.208.96.193', '1708795111', null);
INSERT INTO `sl_read` VALUES ('774', '264', 'none', '185.191.171.7', '1708802328', null);
INSERT INTO `sl_read` VALUES ('775', '272', 'none', '220.181.108.166', '1708868730', null);
INSERT INTO `sl_read` VALUES ('776', '264', 'none', '220.181.108.93', '1708873700', null);
INSERT INTO `sl_read` VALUES ('777', '263', 'http://iamzcr.com/', '180.121.234.181', '1708888564', null);
INSERT INTO `sl_read` VALUES ('778', '262', 'none', '101.67.29.241', '1708908994', null);
INSERT INTO `sl_read` VALUES ('779', '273', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1708913123', null);
INSERT INTO `sl_read` VALUES ('780', '259', 'http://iamzcr.com/article/tags.html?tid=376', '183.6.88.24', '1708913713', null);
INSERT INTO `sl_read` VALUES ('781', '275', 'http://iamzcr.com/article/detail.html?id=259', '183.6.88.24', '1708913716', null);
INSERT INTO `sl_read` VALUES ('782', '270', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.24', '1708913731', null);
INSERT INTO `sl_read` VALUES ('783', '263', 'http://iamzcr.com/', '183.6.88.24', '1708915492', null);
INSERT INTO `sl_read` VALUES ('784', '264', 'http://iamzcr.com/article/detail.html?id=263', '183.6.88.24', '1708915504', null);
INSERT INTO `sl_read` VALUES ('785', '274', 'http://iamzcr.com/article/tags.html?tid=388', '65.75.194.71', '1708920473', null);
INSERT INTO `sl_read` VALUES ('786', '274', 'none', '101.67.29.111', '1708927222', null);
INSERT INTO `sl_read` VALUES ('787', '248', 'none', '37.187.94.3', '1708948548', null);
INSERT INTO `sl_read` VALUES ('788', '249', 'none', '37.187.94.3', '1708948558', null);
INSERT INTO `sl_read` VALUES ('789', '250', 'none', '37.187.94.3', '1708948566', null);
INSERT INTO `sl_read` VALUES ('790', '251', 'none', '37.187.94.3', '1708948569', null);
INSERT INTO `sl_read` VALUES ('791', '252', 'none', '37.187.94.3', '1708948572', null);
INSERT INTO `sl_read` VALUES ('792', '253', 'none', '37.187.94.3', '1708948576', null);
INSERT INTO `sl_read` VALUES ('793', '254', 'none', '37.187.94.3', '1708948583', null);
INSERT INTO `sl_read` VALUES ('794', '256', 'none', '37.187.94.3', '1708948586', null);
INSERT INTO `sl_read` VALUES ('795', '257', 'none', '37.187.94.3', '1708948591', null);
INSERT INTO `sl_read` VALUES ('796', '258', 'none', '37.187.94.3', '1708948594', null);
INSERT INTO `sl_read` VALUES ('797', '259', 'none', '37.187.94.3', '1708948600', null);
INSERT INTO `sl_read` VALUES ('798', '259', 'http://iamzcr.com/article/tags.html?tid=376', '65.75.194.71', '1708965647', null);
INSERT INTO `sl_read` VALUES ('799', '275', 'http://iamzcr.com/article/detail.html?id=259', '65.75.194.71', '1708965650', null);
INSERT INTO `sl_read` VALUES ('800', '249', 'none', '65.75.194.71', '1708965667', null);
INSERT INTO `sl_read` VALUES ('801', '275', 'none', '94.23.203.180', '1708992253', null);
INSERT INTO `sl_read` VALUES ('802', '249', 'none', '65.75.194.71', '1709007848', null);
INSERT INTO `sl_read` VALUES ('803', '273', 'http://iamzcr.com/index/index.html', '65.75.194.71', '1709007991', null);
INSERT INTO `sl_read` VALUES ('804', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709008014', null);
INSERT INTO `sl_read` VALUES ('805', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709016442', null);
INSERT INTO `sl_read` VALUES ('806', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709017114', null);
INSERT INTO `sl_read` VALUES ('807', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709017119', null);
INSERT INTO `sl_read` VALUES ('808', '273', 'http://iamzcr.com/index/index.html', '65.75.194.71', '1709017233', null);
INSERT INTO `sl_read` VALUES ('809', '273', 'http://iamzcr.com/index/index.html', '65.75.194.71', '1709017347', null);
INSERT INTO `sl_read` VALUES ('810', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709017369', null);
INSERT INTO `sl_read` VALUES ('811', '276', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709018708', null);
INSERT INTO `sl_read` VALUES ('812', '276', 'http://iamzcr.com/index/index.html', '65.75.194.71', '1709024942', null);
INSERT INTO `sl_read` VALUES ('813', '265', 'none', '185.191.171.14', '1709028133', null);
INSERT INTO `sl_read` VALUES ('814', '274', 'http://iamzcr.com/article/tags.html?tid=388', '65.75.194.71', '1709029038', null);
INSERT INTO `sl_read` VALUES ('815', '273', 'http://iamzcr.com/article/tags.html?tid=384', '65.75.194.71', '1709029210', null);
INSERT INTO `sl_read` VALUES ('816', '257', 'http://iamzcr.com/article/tags.html?tid=387', '65.75.194.71', '1709029231', null);
INSERT INTO `sl_read` VALUES ('817', '272', 'none', '85.208.96.209', '1709042395', null);
INSERT INTO `sl_read` VALUES ('818', '263', 'http://iamzcr.com/index/index.html', '14.145.43.201', '1709044382', null);
INSERT INTO `sl_read` VALUES ('819', '276', 'http://iamzcr.com/', '116.22.59.106', '1709046154', null);
INSERT INTO `sl_read` VALUES ('820', '248', 'http://iamzcr.com/article/detail.html?id=276', '116.22.59.106', '1709046186', null);
INSERT INTO `sl_read` VALUES ('821', '276', 'none', '101.67.49.33', '1709059090', null);
INSERT INTO `sl_read` VALUES ('822', '264', 'none', '220.181.108.158', '1709077900', null);
INSERT INTO `sl_read` VALUES ('823', '276', 'none', '116.179.32.230', '1709078100', null);
INSERT INTO `sl_read` VALUES ('824', '275', 'none', '220.181.108.159', '1709078300', null);
INSERT INTO `sl_read` VALUES ('825', '263', 'http://iamzcr.com/', '110.87.122.198', '1709090138', null);
INSERT INTO `sl_read` VALUES ('826', '276', 'http://iamzcr.com/index/index.html', '110.87.122.198', '1709090161', null);
INSERT INTO `sl_read` VALUES ('827', '276', 'none', '113.215.189.240', '1709093768', null);
INSERT INTO `sl_read` VALUES ('828', '276', 'http://iamzcr.com/', '65.75.194.71', '1709097147', null);
INSERT INTO `sl_read` VALUES ('829', '276', 'http://iamzcr.com/', '65.75.194.71', '1709105858', null);
INSERT INTO `sl_read` VALUES ('830', '274', 'http://iamzcr.com/article/tags.html?tid=388', '65.75.194.71', '1709105866', null);
INSERT INTO `sl_read` VALUES ('831', '273', 'http://iamzcr.com/article/tags.html?tid=387', '65.75.194.71', '1709105904', null);
INSERT INTO `sl_read` VALUES ('832', '277', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1709110124', null);
INSERT INTO `sl_read` VALUES ('833', '263', 'http://iamzcr.com/index/index.html', '183.6.88.38', '1709110152', null);
INSERT INTO `sl_read` VALUES ('834', '276', 'http://iamzcr.com/article/detail.html?id=277', '183.6.88.38', '1709110157', null);
INSERT INTO `sl_read` VALUES ('835', '276', 'http://iamzcr.com/article/detail.html?id=276', '183.6.88.38', '1709110222', null);
INSERT INTO `sl_read` VALUES ('836', '277', 'http://iamzcr.com/article/detail.html?id=276', '183.6.88.38', '1709110228', null);
INSERT INTO `sl_read` VALUES ('837', '277', 'http://iamzcr.com/article/detail.html?id=276', '183.6.88.38', '1709110249', null);
INSERT INTO `sl_read` VALUES ('838', '276', 'none', '65.108.2.171', '1709113895', null);
INSERT INTO `sl_read` VALUES ('839', '277', 'none', '149.202.65.189', '1709130013', null);
INSERT INTO `sl_read` VALUES ('840', '273', 'http://iamzcr.com/', '14.19.141.230', '1709157806', null);
INSERT INTO `sl_read` VALUES ('841', '277', 'http://iamzcr.com/', '14.19.141.230', '1709157809', null);
INSERT INTO `sl_read` VALUES ('842', '277', 'http://iamzcr.com/', '14.19.141.230', '1709158151', null);
INSERT INTO `sl_read` VALUES ('843', '276', 'http://iamzcr.com/article/detail.html?id=277', '14.19.141.230', '1709158153', null);
INSERT INTO `sl_read` VALUES ('844', '273', 'http://iamzcr.com/article/tags.html?tid=384', '14.19.141.230', '1709158159', null);
INSERT INTO `sl_read` VALUES ('845', '269', 'http://iamzcr.com/article/tags.html?tid=384', '14.19.141.230', '1709158173', null);
INSERT INTO `sl_read` VALUES ('846', '271', 'http://iamzcr.com/article/tags.html?tid=383', '14.19.141.230', '1709158250', null);
INSERT INTO `sl_read` VALUES ('847', '271', 'http://iamzcr.com/article/tags.html?tid=383', '14.19.141.230', '1709158325', null);
INSERT INTO `sl_read` VALUES ('848', '263', 'http://iamzcr.com/article/tags.html?tid=274', '14.19.141.230', '1709158435', null);
INSERT INTO `sl_read` VALUES ('849', '274', 'none', '14.19.141.230', '1709158439', null);
INSERT INTO `sl_read` VALUES ('850', '275', 'none', '14.19.141.230', '1709158459', null);
INSERT INTO `sl_read` VALUES ('851', '262', 'http://iamzcr.com/index/index.html', '14.19.141.230', '1709158555', null);
INSERT INTO `sl_read` VALUES ('852', '277', 'http://iamzcr.com/', '183.6.88.38', '1709168255', null);
INSERT INTO `sl_read` VALUES ('853', '278', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709169752', null);
INSERT INTO `sl_read` VALUES ('854', '278', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709170606', null);
INSERT INTO `sl_read` VALUES ('855', '278', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709170613', null);
INSERT INTO `sl_read` VALUES ('856', '279', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709170628', null);
INSERT INTO `sl_read` VALUES ('857', '279', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709172147', null);
INSERT INTO `sl_read` VALUES ('858', '279', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709172230', null);
INSERT INTO `sl_read` VALUES ('859', '279', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709172489', null);
INSERT INTO `sl_read` VALUES ('860', '279', 'http://iamzcr.com/article/columns.html?cid=376', '65.75.194.71', '1709172599', null);
INSERT INTO `sl_read` VALUES ('861', '265', 'http://iamzcr.com/article/tags.html?tid=372', '65.75.194.71', '1709172626', null);
INSERT INTO `sl_read` VALUES ('862', '265', 'http://iamzcr.com/article/tags.html?tid=372', '65.75.194.71', '1709173252', null);
INSERT INTO `sl_read` VALUES ('863', '276', 'http://iamzcr.com/index/index.html', '65.75.194.71', '1709174926', null);
INSERT INTO `sl_read` VALUES ('864', '274', 'http://iamzcr.com/article/tags.html?tid=388', '65.75.194.71', '1709174935', null);
INSERT INTO `sl_read` VALUES ('865', '277', 'http://iamzcr.com/article/tags.html?tid=384', '183.6.88.38', '1709180324', null);
INSERT INTO `sl_read` VALUES ('866', '261', 'http://iamzcr.com/article/detail.html?id=277', '183.6.88.38', '1709180561', null);
INSERT INTO `sl_read` VALUES ('867', '262', 'http://iamzcr.com/article/detail.html?id=261', '183.6.88.38', '1709180562', null);
INSERT INTO `sl_read` VALUES ('868', '263', 'http://iamzcr.com/article/detail.html?id=262', '183.6.88.38', '1709180563', null);
INSERT INTO `sl_read` VALUES ('869', '279', 'http://iamzcr.com/article/columns.html?cid=376', '183.6.88.38', '1709184210', null);
INSERT INTO `sl_read` VALUES ('870', '271', 'none', '66.249.69.200', '1709194094', null);
INSERT INTO `sl_read` VALUES ('871', '254', 'none', '85.208.96.204', '1709206802', null);
INSERT INTO `sl_read` VALUES ('872', '253', 'none', '116.179.32.88', '1709214906', null);
INSERT INTO `sl_read` VALUES ('873', '277', 'none', '116.179.32.157', '1709215106', null);
INSERT INTO `sl_read` VALUES ('874', '279', 'none', '220.181.108.176', '1709215106', null);
INSERT INTO `sl_read` VALUES ('875', '263', 'http://iamzcr.com/', '171.219.187.165', '1709222852', null);
INSERT INTO `sl_read` VALUES ('876', '274', 'none', '14.19.141.230', '1709223012', null);
INSERT INTO `sl_read` VALUES ('877', '263', 'none', '85.208.96.210', '1709227741', null);
INSERT INTO `sl_read` VALUES ('878', '249', 'none', '14.19.141.230', '1709229553', null);
INSERT INTO `sl_read` VALUES ('879', '253', 'none', '185.191.171.7', '1709230890', null);
INSERT INTO `sl_read` VALUES ('880', '251', 'none', '85.208.96.199', '1709230964', null);
INSERT INTO `sl_read` VALUES ('881', '249', 'none', '14.19.141.230', '1709231746', null);
INSERT INTO `sl_read` VALUES ('882', '269', 'none', '66.249.69.192', '1709233866', null);
INSERT INTO `sl_read` VALUES ('883', '262', 'none', '85.208.96.202', '1709241276', null);
INSERT INTO `sl_read` VALUES ('884', '261', 'http://www.iamzcr.com/', '27.115.124.53', '1709255823', null);
INSERT INTO `sl_read` VALUES ('885', '248', 'http://www.iamzcr.com/article/detail.html?id=261', '27.115.124.53', '1709255826', null);
INSERT INTO `sl_read` VALUES ('886', '279', 'http://iamzcr.com/article/columns.html?cid=376', '14.19.169.178', '1709268636', null);
INSERT INTO `sl_read` VALUES ('887', '276', 'none', '185.191.171.11', '1709276997', null);
INSERT INTO `sl_read` VALUES ('888', '276', 'none', '66.249.69.192', '1709279459', null);
INSERT INTO `sl_read` VALUES ('889', '280', 'none', '185.36.194.34', '1709284298', null);
INSERT INTO `sl_read` VALUES ('890', '280', 'none', '185.36.194.34', '1709291861', null);
INSERT INTO `sl_read` VALUES ('891', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291881', null);
INSERT INTO `sl_read` VALUES ('892', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291891', null);
INSERT INTO `sl_read` VALUES ('893', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291892', null);
INSERT INTO `sl_read` VALUES ('894', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291892', null);
INSERT INTO `sl_read` VALUES ('895', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291893', null);
INSERT INTO `sl_read` VALUES ('896', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291893', null);
INSERT INTO `sl_read` VALUES ('897', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291894', null);
INSERT INTO `sl_read` VALUES ('898', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709291896', null);
INSERT INTO `sl_read` VALUES ('899', '280', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709292466', null);
INSERT INTO `sl_read` VALUES ('900', '273', 'none', '220.181.108.114', '1709337322', null);
INSERT INTO `sl_read` VALUES ('901', '280', 'none', '116.179.32.17', '1709337522', null);
INSERT INTO `sl_read` VALUES ('902', '274', 'https://www.baidu.com/link?url=90CdTAB1iSoNI8oOr3sV9QRWkxT1V6HBem8_UNoNT36KBqDnrOHN8OswrNtv2sRh70duErT7CHA3A8LoKyM05a&wd=&eqid=c1a9895300016f950000000665e2c54b', '14.19.174.197', '1709360471', null);
INSERT INTO `sl_read` VALUES ('903', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360656', null);
INSERT INTO `sl_read` VALUES ('904', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360657', null);
INSERT INTO `sl_read` VALUES ('905', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360657', null);
INSERT INTO `sl_read` VALUES ('906', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360658', null);
INSERT INTO `sl_read` VALUES ('907', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360658', null);
INSERT INTO `sl_read` VALUES ('908', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360658', null);
INSERT INTO `sl_read` VALUES ('909', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360658', null);
INSERT INTO `sl_read` VALUES ('910', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360659', null);
INSERT INTO `sl_read` VALUES ('911', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360659', null);
INSERT INTO `sl_read` VALUES ('912', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360659', null);
INSERT INTO `sl_read` VALUES ('913', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360659', null);
INSERT INTO `sl_read` VALUES ('914', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360659', null);
INSERT INTO `sl_read` VALUES ('915', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360660', null);
INSERT INTO `sl_read` VALUES ('916', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360660', null);
INSERT INTO `sl_read` VALUES ('917', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360660', null);
INSERT INTO `sl_read` VALUES ('918', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360660', null);
INSERT INTO `sl_read` VALUES ('919', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360660', null);
INSERT INTO `sl_read` VALUES ('920', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360661', null);
INSERT INTO `sl_read` VALUES ('921', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360661', null);
INSERT INTO `sl_read` VALUES ('922', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360661', null);
INSERT INTO `sl_read` VALUES ('923', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360661', null);
INSERT INTO `sl_read` VALUES ('924', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360661', null);
INSERT INTO `sl_read` VALUES ('925', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360662', null);
INSERT INTO `sl_read` VALUES ('926', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360662', null);
INSERT INTO `sl_read` VALUES ('927', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360662', null);
INSERT INTO `sl_read` VALUES ('928', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360662', null);
INSERT INTO `sl_read` VALUES ('929', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360662', null);
INSERT INTO `sl_read` VALUES ('930', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360663', null);
INSERT INTO `sl_read` VALUES ('931', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360663', null);
INSERT INTO `sl_read` VALUES ('932', '277', 'http://iamzcr.com/article/columns.html?cid=374', '14.19.174.197', '1709360663', null);
INSERT INTO `sl_read` VALUES ('933', '273', 'none', '66.249.79.70', '1709369607', null);
INSERT INTO `sl_read` VALUES ('934', '265', 'none', '220.181.108.93', '1709378588', null);
INSERT INTO `sl_read` VALUES ('935', '263', 'none', '128.199.133.89', '1709380853', null);
INSERT INTO `sl_read` VALUES ('936', '281', 'http://iamzcr.com/article/tags.html?tid=375', '14.19.174.197', '1709382490', null);
INSERT INTO `sl_read` VALUES ('937', '279', 'none', '66.249.66.78', '1709383107', null);
INSERT INTO `sl_read` VALUES ('938', '277', 'none', '157.245.78.31', '1709383313', null);
INSERT INTO `sl_read` VALUES ('939', '281', 'http://iamzcr.com/article/tags.html?tid=375', '14.19.174.197', '1709384731', null);
INSERT INTO `sl_read` VALUES ('940', '281', 'http://iamzcr.com/article/tags.html?tid=375', '14.19.174.197', '1709384821', null);
INSERT INTO `sl_read` VALUES ('941', '281', 'http://iamzcr.com/article/tags.html?tid=375', '14.19.174.197', '1709385243', null);
INSERT INTO `sl_read` VALUES ('942', '281', 'http://iamzcr.com/article/tags.html?tid=375', '14.19.174.197', '1709385262', null);
INSERT INTO `sl_read` VALUES ('943', '267', 'none', '116.179.32.147', '1709388480', null);
INSERT INTO `sl_read` VALUES ('944', '281', 'none', '220.181.108.166', '1709388680', null);
INSERT INTO `sl_read` VALUES ('945', '279', 'none', '217.182.134.106', '1709395520', null);
INSERT INTO `sl_read` VALUES ('946', '280', 'none', '217.182.134.106', '1709395525', null);
INSERT INTO `sl_read` VALUES ('947', '280', 'none', '66.249.66.169', '1709407010', null);
INSERT INTO `sl_read` VALUES ('948', '270', 'none', '66.249.66.167', '1709409707', null);
INSERT INTO `sl_read` VALUES ('949', '257', 'none', '85.208.96.210', '1709410813', null);
INSERT INTO `sl_read` VALUES ('950', '270', 'none', '66.249.66.169', '1709412348', null);
INSERT INTO `sl_read` VALUES ('951', '281', 'none', '38.242.209.100', '1709412668', null);
INSERT INTO `sl_read` VALUES ('952', '280', 'none', '66.249.66.168', '1709414982', null);
INSERT INTO `sl_read` VALUES ('953', '281', 'none', '66.249.66.78', '1709417684', null);
INSERT INTO `sl_read` VALUES ('954', '279', 'none', '60.188.9.221', '1709420154', null);
INSERT INTO `sl_read` VALUES ('955', '259', 'none', '185.191.171.19', '1709427612', null);
INSERT INTO `sl_read` VALUES ('956', '277', 'none', '85.208.96.198', '1709428513', null);
INSERT INTO `sl_read` VALUES ('957', '280', 'none', '66.249.66.79', '1709437109', null);
INSERT INTO `sl_read` VALUES ('958', '264', 'none', '220.181.108.103', '1709438819', null);
INSERT INTO `sl_read` VALUES ('959', '258', 'none', '85.208.96.195', '1709442284', null);
INSERT INTO `sl_read` VALUES ('960', '276', 'none', '143.110.234.139', '1709445834', null);
INSERT INTO `sl_read` VALUES ('961', '276', 'http://iamzcr.com/article/tags.html?tid=384', '14.19.157.18', '1709447968', null);
INSERT INTO `sl_read` VALUES ('962', '277', 'http://iamzcr.com/article/tags.html?tid=384', '14.19.157.18', '1709448862', null);
INSERT INTO `sl_read` VALUES ('963', '262', 'none', '143.110.154.100', '1709451345', null);
INSERT INTO `sl_read` VALUES ('964', '275', 'none', '185.191.171.11', '1709456986', null);
INSERT INTO `sl_read` VALUES ('965', '261', 'none', '216.244.66.243', '1709462743', null);
INSERT INTO `sl_read` VALUES ('966', '252', 'none', '101.67.49.86', '1709470197', null);
INSERT INTO `sl_read` VALUES ('967', '263', 'none', '216.244.66.243', '1709490323', null);
INSERT INTO `sl_read` VALUES ('968', '279', 'none', '85.208.96.193', '1709495199', null);
INSERT INTO `sl_read` VALUES ('969', '261', 'none', '143.110.150.70', '1709505272', null);
INSERT INTO `sl_read` VALUES ('970', '262', 'none', '216.244.66.243', '1709506628', null);
INSERT INTO `sl_read` VALUES ('971', '273', 'none', '216.244.66.243', '1709512071', null);
INSERT INTO `sl_read` VALUES ('972', '265', 'none', '220.181.108.91', '1709520321', null);
INSERT INTO `sl_read` VALUES ('973', '277', 'http://iamzcr.com/index/index.html', '185.36.194.34', '1709521217', null);
INSERT INTO `sl_read` VALUES ('974', '251', 'none', '101.67.50.124', '1709522610', null);
INSERT INTO `sl_read` VALUES ('975', '273', 'http://iamzcr.com/article/detail.html?id=273', '121.14.40.50', '1709523931', null);
INSERT INTO `sl_read` VALUES ('976', '277', 'http://iamzcr.com/article/month.html?month=2023-12', '121.14.40.50', '1709523961', null);
INSERT INTO `sl_read` VALUES ('977', '252', 'none', '116.179.32.83', '1709548372', null);
INSERT INTO `sl_read` VALUES ('978', '277', 'none', '216.244.66.243', '1709549435', null);
INSERT INTO `sl_read` VALUES ('979', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709549722', null);
INSERT INTO `sl_read` VALUES ('980', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553058', null);
INSERT INTO `sl_read` VALUES ('981', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553059', null);
INSERT INTO `sl_read` VALUES ('982', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553059', null);
INSERT INTO `sl_read` VALUES ('983', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553060', null);
INSERT INTO `sl_read` VALUES ('984', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553061', null);
INSERT INTO `sl_read` VALUES ('985', '283', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.34', '1709553063', null);
INSERT INTO `sl_read` VALUES ('986', '277', 'http://iamzcr.com/index/index.html', '14.19.179.37', '1709553163', null);
INSERT INTO `sl_read` VALUES ('987', '273', 'none', '64.227.125.117', '1709557140', null);
INSERT INTO `sl_read` VALUES ('988', '248', 'none', '165.227.180.254', '1709563095', null);
INSERT INTO `sl_read` VALUES ('989', '270', 'none', '116.179.32.110', '1709563706', null);
INSERT INTO `sl_read` VALUES ('990', '283', 'none', '220.181.108.146', '1709563906', null);
INSERT INTO `sl_read` VALUES ('991', '263', 'http://iamzcr.com/index/index.html', '185.36.194.34', '1709568614', null);
INSERT INTO `sl_read` VALUES ('992', '281', 'none', '159.89.177.97', '1709575718', null);
INSERT INTO `sl_read` VALUES ('993', '264', 'none', '159.203.140.224', '1709578886', null);
INSERT INTO `sl_read` VALUES ('994', '265', 'none', '157.245.78.31', '1709579729', null);
INSERT INTO `sl_read` VALUES ('995', '283', 'none', '64.227.125.86', '1709580664', null);
INSERT INTO `sl_read` VALUES ('996', '272', 'none', '159.203.94.121', '1709591394', null);
INSERT INTO `sl_read` VALUES ('997', '272', 'none', '116.179.32.26', '1709598930', null);
INSERT INTO `sl_read` VALUES ('998', '271', 'none', '159.203.94.241', '1709602436', null);
INSERT INTO `sl_read` VALUES ('999', '269', 'none', '143.110.170.185', '1709621381', null);
INSERT INTO `sl_read` VALUES ('1000', '274', 'none', '134.209.204.153', '1709628142', null);
INSERT INTO `sl_read` VALUES ('1001', '277', 'http://iamzcr.com/', '116.22.58.201', '1709629632', null);
INSERT INTO `sl_read` VALUES ('1002', '276', 'http://iamzcr.com/', '116.22.58.201', '1709629635', null);
INSERT INTO `sl_read` VALUES ('1003', '273', 'http://iamzcr.com/article/columns.html?cid=374', '116.22.58.201', '1709629652', null);
INSERT INTO `sl_read` VALUES ('1004', '270', 'http://iamzcr.com/article/columns.html?cid=374', '116.22.58.201', '1709629655', null);
INSERT INTO `sl_read` VALUES ('1005', '269', 'http://iamzcr.com/article/columns.html?cid=374', '116.22.58.201', '1709629665', null);
INSERT INTO `sl_read` VALUES ('1006', '263', 'http://iamzcr.com/', '183.62.22.202', '1709631579', null);
INSERT INTO `sl_read` VALUES ('1007', '257', 'none', '157.245.78.31', '1709637594', null);
INSERT INTO `sl_read` VALUES ('1008', '265', 'none', '39.173.107.13', '1709638685', null);
INSERT INTO `sl_read` VALUES ('1009', '279', 'http://iamzcr.com/article/columns.html?cid=376', '116.22.58.201', '1709643078', null);
INSERT INTO `sl_read` VALUES ('1010', '276', 'none', '216.244.66.243', '1709645435', null);
INSERT INTO `sl_read` VALUES ('1011', '268', 'none', '220.181.108.178', '1709650250', null);
INSERT INTO `sl_read` VALUES ('1012', '280', 'none', '159.203.140.106', '1709656928', null);
INSERT INTO `sl_read` VALUES ('1013', '277', 'none', '39.173.107.91', '1709662055', null);
INSERT INTO `sl_read` VALUES ('1014', '259', 'none', '144.126.209.76', '1709668629', null);
INSERT INTO `sl_read` VALUES ('1015', '270', 'none', '185.191.171.7', '1709671167', null);
INSERT INTO `sl_read` VALUES ('1016', '253', 'none', '143.110.226.182', '1709678350', null);
INSERT INTO `sl_read` VALUES ('1017', '262', 'none', '66.249.74.39', '1709681004', null);
INSERT INTO `sl_read` VALUES ('1018', '281', 'none', '66.249.74.39', '1709681005', null);
INSERT INTO `sl_read` VALUES ('1019', '281', 'none', '66.249.65.163', '1709681006', null);
INSERT INTO `sl_read` VALUES ('1020', '252', 'none', '64.227.125.117', '1709683061', null);
INSERT INTO `sl_read` VALUES ('1021', '283', 'none', '66.249.74.39', '1709683701', null);
INSERT INTO `sl_read` VALUES ('1022', '281', 'none', '185.191.171.5', '1709686565', null);
INSERT INTO `sl_read` VALUES ('1023', '273', 'none', '101.67.29.102', '1709689388', null);
INSERT INTO `sl_read` VALUES ('1024', '248', 'none', '85.208.96.203', '1709689674', null);
INSERT INTO `sl_read` VALUES ('1025', '261', 'none', '85.208.96.194', '1709690235', null);
INSERT INTO `sl_read` VALUES ('1026', '256', 'none', '165.22.118.232', '1709691586', null);
INSERT INTO `sl_read` VALUES ('1027', '272', 'none', '66.249.65.167', '1709696025', null);
INSERT INTO `sl_read` VALUES ('1028', '273', 'http://iamzcr.com/article/detail.html?id=273', '101.44.250.240', '1709697631', null);
INSERT INTO `sl_read` VALUES ('1029', '269', 'none', '66.249.65.165', '1709698125', null);
INSERT INTO `sl_read` VALUES ('1030', '250', 'none', '138.68.186.24', '1709707508', null);
INSERT INTO `sl_read` VALUES ('1031', '267', 'none', '66.249.65.167', '1709711739', null);
INSERT INTO `sl_read` VALUES ('1032', '258', 'none', '137.184.10.255', '1709712102', null);
INSERT INTO `sl_read` VALUES ('1033', '263', 'none', '66.249.65.166', '1709712995', null);
INSERT INTO `sl_read` VALUES ('1034', '280', 'none', '85.208.96.193', '1709714967', null);
INSERT INTO `sl_read` VALUES ('1035', '270', 'none', '165.22.126.41', '1709715116', null);
INSERT INTO `sl_read` VALUES ('1036', '283', 'none', '66.249.74.38', '1709715507', null);
INSERT INTO `sl_read` VALUES ('1037', '248', 'none', '220.181.108.168', '1709716659', null);
INSERT INTO `sl_read` VALUES ('1038', '248', 'none', '66.249.74.37', '1709718018', null);
INSERT INTO `sl_read` VALUES ('1039', '283', 'none', '39.173.107.82', '1709718793', null);
INSERT INTO `sl_read` VALUES ('1040', '248', 'none', '66.249.74.37', '1709721130', null);
INSERT INTO `sl_read` VALUES ('1041', '269', 'none', '85.208.96.206', '1709721484', null);
INSERT INTO `sl_read` VALUES ('1042', '264', 'none', '66.249.66.169', '1709721785', null);
INSERT INTO `sl_read` VALUES ('1043', '273', 'none', '185.191.171.4', '1709726913', null);
INSERT INTO `sl_read` VALUES ('1044', '263', 'http://iamzcr.com/', '116.22.59.184', '1709733621', null);
INSERT INTO `sl_read` VALUES ('1045', '283', 'none', '116.22.59.184', '1709733623', null);
INSERT INTO `sl_read` VALUES ('1046', '273', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.184', '1709736363', null);
INSERT INTO `sl_read` VALUES ('1047', '276', 'http://iamzcr.com/index/index.html', '116.22.59.184', '1709736878', null);
INSERT INTO `sl_read` VALUES ('1048', '248', 'http://iamzcr.com/article/tags.html?tid=374', '116.22.59.184', '1709736886', null);
INSERT INTO `sl_read` VALUES ('1049', '280', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.184', '1709737173', null);
INSERT INTO `sl_read` VALUES ('1050', '267', 'none', '165.22.112.120', '1709739722', null);
INSERT INTO `sl_read` VALUES ('1051', '254', 'none', '159.203.94.121', '1709744013', null);
INSERT INTO `sl_read` VALUES ('1052', '279', 'none', '159.203.140.224', '1709745564', null);
INSERT INTO `sl_read` VALUES ('1053', '261', 'none', '101.67.50.56', '1709749853', null);
INSERT INTO `sl_read` VALUES ('1054', '284', 'none', '159.203.80.96', '1709750985', null);
INSERT INTO `sl_read` VALUES ('1055', '249', 'none', '165.22.118.181', '1709757690', null);
INSERT INTO `sl_read` VALUES ('1056', '268', 'none', '143.244.189.31', '1709757937', null);
INSERT INTO `sl_read` VALUES ('1057', '281', 'none', '39.173.105.146', '1709770539', null);
INSERT INTO `sl_read` VALUES ('1058', '275', 'none', '137.184.10.255', '1709771632', null);
INSERT INTO `sl_read` VALUES ('1059', '251', 'none', '64.225.98.40', '1709772149', null);
INSERT INTO `sl_read` VALUES ('1060', '279', 'none', '216.244.66.243', '1709784205', null);
INSERT INTO `sl_read` VALUES ('1061', '249', 'none', '216.244.66.243', '1709787335', null);
INSERT INTO `sl_read` VALUES ('1062', '273', 'none', '66.249.66.167', '1709791850', null);
INSERT INTO `sl_read` VALUES ('1063', '262', 'none', '66.249.66.169', '1709794550', null);
INSERT INTO `sl_read` VALUES ('1064', '285', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.184', '1709796085', null);
INSERT INTO `sl_read` VALUES ('1065', '285', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.184', '1709796097', null);
INSERT INTO `sl_read` VALUES ('1066', '248', 'none', '60.188.9.194', '1709796340', null);
INSERT INTO `sl_read` VALUES ('1067', '284', 'none', '66.249.66.168', '1709797250', null);
INSERT INTO `sl_read` VALUES ('1068', '264', 'none', '216.244.66.243', '1709797292', null);
INSERT INTO `sl_read` VALUES ('1069', '271', 'none', '66.249.66.168', '1709799951', null);
INSERT INTO `sl_read` VALUES ('1070', '265', 'none', '216.244.66.243', '1709800407', null);
INSERT INTO `sl_read` VALUES ('1071', '274', 'none', '216.244.66.243', '1709810067', null);
INSERT INTO `sl_read` VALUES ('1072', '284', 'none', '39.173.107.165', '1709811360', null);
INSERT INTO `sl_read` VALUES ('1073', '285', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.184', '1709812604', null);
INSERT INTO `sl_read` VALUES ('1074', '286', 'http://iamzcr.com/article/detail.html?id=285', '116.22.59.184', '1709812610', null);
INSERT INTO `sl_read` VALUES ('1075', '286', 'http://iamzcr.com/article/detail.html?id=285', '116.22.59.184', '1709812655', null);
INSERT INTO `sl_read` VALUES ('1076', '286', 'none', '116.179.32.209', '1709823492', null);
INSERT INTO `sl_read` VALUES ('1077', '286', 'none', '220.181.108.90', '1709823492', null);
INSERT INTO `sl_read` VALUES ('1078', '274', 'none', '116.22.59.184', '1709825752', null);
INSERT INTO `sl_read` VALUES ('1079', '287', 'none', '116.22.59.184', '1709825758', null);
INSERT INTO `sl_read` VALUES ('1080', '253', 'none', '216.244.66.243', '1709826232', null);
INSERT INTO `sl_read` VALUES ('1081', '285', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.35', '1709827270', null);
INSERT INTO `sl_read` VALUES ('1082', '274', 'http://iamzcr.com/article/detail.html?id=274', '223.93.159.105', '1709827888', null);
INSERT INTO `sl_read` VALUES ('1083', '285', 'none', '66.249.66.169', '1709831553', null);
INSERT INTO `sl_read` VALUES ('1084', '284', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.35', '1709831810', null);
INSERT INTO `sl_read` VALUES ('1085', '288', 'http://iamzcr.com/article/detail.html?id=284', '185.36.194.35', '1709831814', null);
INSERT INTO `sl_read` VALUES ('1086', '288', 'http://iamzcr.com/article/detail.html?id=284', '185.36.194.35', '1709831851', null);
INSERT INTO `sl_read` VALUES ('1087', '285', 'none', '101.67.49.172', '1709835313', null);
INSERT INTO `sl_read` VALUES ('1088', '281', 'none', '216.244.66.243', '1709842645', null);
INSERT INTO `sl_read` VALUES ('1089', '271', 'none', '216.244.66.243', '1709842650', null);
INSERT INTO `sl_read` VALUES ('1090', '283', 'http://iamzcr.com/article/detail.html?id=283', '140.206.236.106', '1709856198', null);
INSERT INTO `sl_read` VALUES ('1091', '288', 'none', '39.173.107.29', '1709869282', null);
INSERT INTO `sl_read` VALUES ('1092', '268', 'none', '185.191.171.3', '1709877340', null);
INSERT INTO `sl_read` VALUES ('1093', '288', 'http://iamzcr.com/article/detail.html?id=284', '185.36.194.35', '1709880013', null);
INSERT INTO `sl_read` VALUES ('1094', '263', 'http://iamzcr.com/article/detail.html?id=288', '185.36.194.35', '1709880345', null);
INSERT INTO `sl_read` VALUES ('1095', '262', 'http://iamzcr.com/article/detail.html?id=263', '185.36.194.35', '1709880347', null);
INSERT INTO `sl_read` VALUES ('1096', '289', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.35', '1709882795', null);
INSERT INTO `sl_read` VALUES ('1097', '281', 'http://iamzcr.com/article/tags.html?tid=375', '185.36.194.35', '1709882991', null);
INSERT INTO `sl_read` VALUES ('1098', '256', 'none', '85.208.96.197', '1709883390', null);
INSERT INTO `sl_read` VALUES ('1099', '286', 'none', '66.249.66.167', '1709883705', null);
INSERT INTO `sl_read` VALUES ('1100', '276', 'none', '66.249.66.169', '1709886403', null);
INSERT INTO `sl_read` VALUES ('1101', '269', 'none', '216.244.66.243', '1709887607', null);
INSERT INTO `sl_read` VALUES ('1102', '271', 'none', '85.208.96.200', '1709889848', null);
INSERT INTO `sl_read` VALUES ('1103', '268', 'none', '216.244.66.243', '1709890749', null);
INSERT INTO `sl_read` VALUES ('1104', '248', 'none', '216.244.66.243', '1709897187', null);
INSERT INTO `sl_read` VALUES ('1105', '270', 'none', '216.244.66.243', '1709897194', null);
INSERT INTO `sl_read` VALUES ('1106', '269', 'none', '39.173.107.201', '1709902017', null);
INSERT INTO `sl_read` VALUES ('1107', '267', 'none', '85.208.96.199', '1709907046', null);
INSERT INTO `sl_read` VALUES ('1108', '273', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709908824', null);
INSERT INTO `sl_read` VALUES ('1109', '283', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709908832', null);
INSERT INTO `sl_read` VALUES ('1110', '281', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709908934', null);
INSERT INTO `sl_read` VALUES ('1111', '281', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709908934', null);
INSERT INTO `sl_read` VALUES ('1112', '274', 'none', '185.191.171.5', '1709913028', null);
INSERT INTO `sl_read` VALUES ('1113', '290', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709915369', null);
INSERT INTO `sl_read` VALUES ('1114', '290', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709915926', null);
INSERT INTO `sl_read` VALUES ('1115', '290', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709916381', null);
INSERT INTO `sl_read` VALUES ('1116', '290', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709916384', null);
INSERT INTO `sl_read` VALUES ('1117', '281', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709916390', null);
INSERT INTO `sl_read` VALUES ('1118', '281', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709917581', null);
INSERT INTO `sl_read` VALUES ('1119', '290', 'http://iamzcr.com/article/detail.html?id=281', '116.22.59.59', '1709917592', null);
INSERT INTO `sl_read` VALUES ('1120', '290', 'http://iamzcr.com/article/detail.html?id=281', '185.36.194.35', '1709919632', null);
INSERT INTO `sl_read` VALUES ('1121', '289', 'none', '112.13.112.31', '1709924985', null);
INSERT INTO `sl_read` VALUES ('1122', '286', 'none', '217.76.60.59', '1709936911', null);
INSERT INTO `sl_read` VALUES ('1123', '287', 'none', '217.76.60.59', '1709936912', null);
INSERT INTO `sl_read` VALUES ('1124', '264', 'none', '185.191.171.9', '1709939397', null);
INSERT INTO `sl_read` VALUES ('1125', '283', 'none', '185.191.171.3', '1709944513', null);
INSERT INTO `sl_read` VALUES ('1126', '270', 'http://iamzcr.com/article/detail.html?id=270', '223.93.159.81', '1709956687', null);
INSERT INTO `sl_read` VALUES ('1127', '290', 'none', '101.67.29.114', '1709958950', null);
INSERT INTO `sl_read` VALUES ('1128', '290', 'none', '94.23.209.55', '1709960182', null);
INSERT INTO `sl_read` VALUES ('1129', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962847', null);
INSERT INTO `sl_read` VALUES ('1130', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962911', null);
INSERT INTO `sl_read` VALUES ('1131', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962915', null);
INSERT INTO `sl_read` VALUES ('1132', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962915', null);
INSERT INTO `sl_read` VALUES ('1133', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962916', null);
INSERT INTO `sl_read` VALUES ('1134', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962916', null);
INSERT INTO `sl_read` VALUES ('1135', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962916', null);
INSERT INTO `sl_read` VALUES ('1136', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962916', null);
INSERT INTO `sl_read` VALUES ('1137', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962916', null);
INSERT INTO `sl_read` VALUES ('1138', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962917', null);
INSERT INTO `sl_read` VALUES ('1139', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962917', null);
INSERT INTO `sl_read` VALUES ('1140', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962917', null);
INSERT INTO `sl_read` VALUES ('1141', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962917', null);
INSERT INTO `sl_read` VALUES ('1142', '282', 'http://iamzcr.com/article/tags.html?tid=375', '116.22.59.59', '1709962917', null);
INSERT INTO `sl_read` VALUES ('1143', '280', 'none', '216.244.66.243', '1709967761', null);
INSERT INTO `sl_read` VALUES ('1144', '273', 'none', '116.179.32.140', '1709970941', null);
INSERT INTO `sl_read` VALUES ('1145', '254', 'none', '216.244.66.243', '1709971264', null);
INSERT INTO `sl_read` VALUES ('1146', '290', 'none', '116.179.32.71', '1709972760', null);
INSERT INTO `sl_read` VALUES ('1147', '280', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.123.251', '1709975449', null);
INSERT INTO `sl_read` VALUES ('1148', '283', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.123.251', '1709976761', null);
INSERT INTO `sl_read` VALUES ('1149', '282', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.123.251', '1709976783', null);
INSERT INTO `sl_read` VALUES ('1150', '276', 'http://iamzcr.com/article/month.html?month=2023-11', '1.64.123.251', '1709976874', null);
INSERT INTO `sl_read` VALUES ('1151', '279', 'https://www.google.com.hk/', '112.118.195.138', '1709976895', null);
INSERT INTO `sl_read` VALUES ('1152', '281', 'none', '66.249.66.168', '1709977949', null);
INSERT INTO `sl_read` VALUES ('1153', '257', 'none', '216.244.66.243', '1709988087', null);
INSERT INTO `sl_read` VALUES ('1154', '263', 'http://www.iamzcr.com/index/index.html', '1.64.30.190', '1709992008', null);
INSERT INTO `sl_read` VALUES ('1155', '285', 'none', '1.64.30.190', '1709992034', null);
INSERT INTO `sl_read` VALUES ('1156', '263', 'http://iamzcr.com/index/index.html', '1.64.30.190', '1709992919', null);
INSERT INTO `sl_read` VALUES ('1157', '290', 'http://iamzcr.com/article/detail.html?id=263', '1.64.30.190', '1709992926', null);
INSERT INTO `sl_read` VALUES ('1158', '248', 'http://iamzcr.com/article/detail.html?id=290', '1.64.30.190', '1709992931', null);
INSERT INTO `sl_read` VALUES ('1159', '276', 'http://iamzcr.com/index/index.html', '1.64.30.190', '1709992943', null);
INSERT INTO `sl_read` VALUES ('1160', '277', 'http://iamzcr.com/article/detail.html?id=276', '1.64.30.190', '1709992955', null);
INSERT INTO `sl_read` VALUES ('1161', '267', 'none', '216.244.66.243', '1710002284', null);
INSERT INTO `sl_read` VALUES ('1162', '277', 'http://iamzcr.com/article/detail.html?id=277', '101.91.134.151', '1710004694', null);
INSERT INTO `sl_read` VALUES ('1163', '291', 'http://www.iamzcr.com/article/tags.html?tid=375', '14.19.141.241', '1710009273', null);
INSERT INTO `sl_read` VALUES ('1164', '263', 'none', '116.179.32.234', '1710014878', null);
INSERT INTO `sl_read` VALUES ('1165', '291', 'none', '116.179.32.46', '1710017579', null);
INSERT INTO `sl_read` VALUES ('1166', '291', 'none', '220.181.108.146', '1710017579', null);
INSERT INTO `sl_read` VALUES ('1167', '282', 'none', '220.181.108.81', '1710020479', null);
INSERT INTO `sl_read` VALUES ('1168', '265', 'none', '65.108.64.210', '1710021150', null);
INSERT INTO `sl_read` VALUES ('1169', '267', 'none', '65.108.64.210', '1710021152', null);
INSERT INTO `sl_read` VALUES ('1170', '275', 'none', '216.244.66.243', '1710029865', null);
INSERT INTO `sl_read` VALUES ('1171', '268', 'none', '101.67.49.19', '1710040087', null);
INSERT INTO `sl_read` VALUES ('1172', '291', 'none', '195.191.219.131', '1710042528', null);
INSERT INTO `sl_read` VALUES ('1173', '252', 'none', '216.244.66.243', '1710043896', null);
INSERT INTO `sl_read` VALUES ('1174', '250', 'none', '216.244.66.243', '1710043907', null);
INSERT INTO `sl_read` VALUES ('1175', '283', 'https://www.google.com.hk/', '1.64.30.190', '1710049956', null);
INSERT INTO `sl_read` VALUES ('1176', '272', 'none', '216.244.66.243', '1710054279', null);
INSERT INTO `sl_read` VALUES ('1177', '282', 'none', '66.249.66.77', '1710054830', null);
INSERT INTO `sl_read` VALUES ('1178', '259', 'none', '216.244.66.243', '1710057840', null);
INSERT INTO `sl_read` VALUES ('1179', '282', 'none', '185.177.116.248', '1710060542', null);
INSERT INTO `sl_read` VALUES ('1180', '263', 'http://www.iamzcr.com/index/index.html', '1.64.123.251', '1710065829', null);
INSERT INTO `sl_read` VALUES ('1181', '372', 'none', '1.64.123.251', '1710065833', null);
INSERT INTO `sl_read` VALUES ('1182', '372', 'none', '112.118.195.138', '1710065838', null);
INSERT INTO `sl_read` VALUES ('1183', '280', 'none', '112.118.195.138', '1710065848', null);
INSERT INTO `sl_read` VALUES ('1184', '280', 'none', '116.22.59.49', '1710066624', null);
INSERT INTO `sl_read` VALUES ('1185', '280', 'http://www.iamzcr.com/article/tags.html?tid=375', '1.64.30.190', '1710071186', null);
INSERT INTO `sl_read` VALUES ('1186', '293', 'none', '1.64.123.251', '1710071204', null);
INSERT INTO `sl_read` VALUES ('1187', '270', 'none', '220.181.108.114', '1710089492', null);
INSERT INTO `sl_read` VALUES ('1188', '293', 'none', '220.181.108.147', '1710089695', null);
INSERT INTO `sl_read` VALUES ('1189', '256', 'none', '216.244.66.243', '1710092411', null);
INSERT INTO `sl_read` VALUES ('1190', '251', 'none', '216.244.66.243', '1710095908', null);
INSERT INTO `sl_read` VALUES ('1191', '294', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.30.190', '1710096497', null);
INSERT INTO `sl_read` VALUES ('1192', '288', 'none', '185.191.171.17', '1710097445', null);
INSERT INTO `sl_read` VALUES ('1193', '280', 'none', '66.249.66.78', '1710098618', null);
INSERT INTO `sl_read` VALUES ('1194', '291', 'none', '66.249.66.77', '1710105262', null);
INSERT INTO `sl_read` VALUES ('1195', '276', 'none', '66.249.66.79', '1710105264', null);
INSERT INTO `sl_read` VALUES ('1196', '276', 'none', '66.249.66.169', '1710112461', null);
INSERT INTO `sl_read` VALUES ('1197', '290', 'none', '66.249.66.169', '1710125617', null);
INSERT INTO `sl_read` VALUES ('1198', '290', 'none', '85.208.96.201', '1710135202', null);
INSERT INTO `sl_read` VALUES ('1199', '269', 'none', '116.179.32.135', '1710137871', null);
INSERT INTO `sl_read` VALUES ('1200', '294', 'none', '116.179.32.160', '1710138071', null);
INSERT INTO `sl_read` VALUES ('1201', '294', 'http://iamzcr.com/article/tags.html?tid=375', '112.118.195.138', '1710138652', null);
INSERT INTO `sl_read` VALUES ('1202', '273', 'http://iamzcr.com/index/index.html', '116.22.59.49', '1710144735', null);
INSERT INTO `sl_read` VALUES ('1203', '287', 'none', '66.249.66.168', '1710144929', null);
INSERT INTO `sl_read` VALUES ('1204', '287', 'none', '216.244.66.243', '1710147112', null);
INSERT INTO `sl_read` VALUES ('1205', '273', 'none', '66.249.66.167', '1710147628', null);
INSERT INTO `sl_read` VALUES ('1206', '265', 'none', '185.191.171.14', '1710148030', null);
INSERT INTO `sl_read` VALUES ('1207', '276', 'http://iamzcr.com/article/detail.html?id=276', '112.65.212.118', '1710149464', null);
INSERT INTO `sl_read` VALUES ('1208', '289', 'none', '185.191.171.16', '1710153804', null);
INSERT INTO `sl_read` VALUES ('1209', '272', 'none', '85.208.96.201', '1710160659', null);
INSERT INTO `sl_read` VALUES ('1210', '283', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.30.190', '1710164841', null);
INSERT INTO `sl_read` VALUES ('1211', '283', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.123.251', '1710170006', null);
INSERT INTO `sl_read` VALUES ('1212', '283', 'http://iamzcr.com/article/tags.html?tid=375', '1.64.123.251', '1710174094', null);
INSERT INTO `sl_read` VALUES ('1213', '272', 'none', '65.21.232.254', '1710179642', null);
INSERT INTO `sl_read` VALUES ('1214', '283', 'none', '65.21.232.254', '1710179645', null);
INSERT INTO `sl_read` VALUES ('1215', '293', 'none', '65.21.232.254', '1710179648', null);
INSERT INTO `sl_read` VALUES ('1216', '294', 'none', '65.21.232.254', '1710179650', null);
INSERT INTO `sl_read` VALUES ('1217', '284', 'none', '216.244.66.243', '1710182366', null);
INSERT INTO `sl_read` VALUES ('1218', '282', 'none', '101.67.29.99', '1710191575', null);
INSERT INTO `sl_read` VALUES ('1219', '283', 'none', '216.244.66.243', '1710192254', null);
INSERT INTO `sl_read` VALUES ('1220', '287', 'none', '66.249.66.169', '1710195916', null);
INSERT INTO `sl_read` VALUES ('1221', '276', 'none', '66.249.66.77', '1710198647', null);
INSERT INTO `sl_read` VALUES ('1222', '276', 'none', '66.249.66.167', '1710199729', null);
INSERT INTO `sl_read` VALUES ('1223', '276', 'none', '66.249.66.168', '1710200815', null);
INSERT INTO `sl_read` VALUES ('1224', '258', 'none', '216.244.66.243', '1710202552', null);
INSERT INTO `sl_read` VALUES ('1225', '294', 'none', '66.249.66.79', '1710203926', null);
INSERT INTO `sl_read` VALUES ('1226', '290', 'none', '66.249.66.167', '1710204049', null);
INSERT INTO `sl_read` VALUES ('1227', '287', 'none', '66.249.66.169', '1710208670', null);
INSERT INTO `sl_read` VALUES ('1228', '269', 'http://iamzcr.com/article/detail.html?id=269', '140.206.236.18', '1710217066', null);
INSERT INTO `sl_read` VALUES ('1229', '283', 'none', '66.249.66.78', '1710230527', null);
INSERT INTO `sl_read` VALUES ('1230', '287', 'none', '66.249.66.168', '1710236702', null);
INSERT INTO `sl_read` VALUES ('1231', '257', 'none', '220.181.108.165', '1710239908', null);
INSERT INTO `sl_read` VALUES ('1232', '279', 'none', '66.249.75.16', '1710240303', null);
INSERT INTO `sl_read` VALUES ('1233', '289', 'none', '66.249.72.40', '1710242964', null);
INSERT INTO `sl_read` VALUES ('1234', '290', 'none', '66.249.72.40', '1710243002', null);
INSERT INTO `sl_read` VALUES ('1235', '288', 'http://iamzcr.com/article/detail.html?id=288', '223.93.149.154', '1710243718', null);
INSERT INTO `sl_read` VALUES ('1236', '285', 'none', '216.244.66.243', '1710243780', null);
INSERT INTO `sl_read` VALUES ('1237', '294', 'none', '101.67.50.93', '1710247136', null);
INSERT INTO `sl_read` VALUES ('1238', '288', 'none', '216.244.66.243', '1710250615', null);
INSERT INTO `sl_read` VALUES ('1239', '283', 'none', '66.249.75.15', '1710287128', null);
INSERT INTO `sl_read` VALUES ('1240', '286', 'none', '216.244.66.243', '1710291266', null);
INSERT INTO `sl_read` VALUES ('1241', '291', 'none', '216.244.66.243', '1710294478', null);
INSERT INTO `sl_read` VALUES ('1242', '290', 'none', '216.244.66.243', '1710304340', null);
INSERT INTO `sl_read` VALUES ('1243', '263', 'http://iamzcr.com/', '113.65.210.48', '1710308334', null);
INSERT INTO `sl_read` VALUES ('1244', '274', 'none', '113.65.210.48', '1710321917', null);
INSERT INTO `sl_read` VALUES ('1245', '294', 'none', '113.65.210.48', '1710321919', null);
INSERT INTO `sl_read` VALUES ('1246', '291', 'http://iamzcr.com/article/tags.html?tid=375', '113.65.210.48', '1710322307', null);
INSERT INTO `sl_read` VALUES ('1247', '273', 'none', '85.208.96.201', '1710329816', null);
INSERT INTO `sl_read` VALUES ('1248', '287', 'none', '85.208.96.203', '1710333330', null);
INSERT INTO `sl_read` VALUES ('1249', '286', 'none', '185.191.171.5', '1710353001', null);
INSERT INTO `sl_read` VALUES ('1250', '277', 'none', '185.191.171.8', '1710363734', null);
INSERT INTO `sl_read` VALUES ('1251', '290', 'http://iamzcr.com/article/detail.html?id=290', '223.93.159.51', '1710375751', null);
INSERT INTO `sl_read` VALUES ('1252', '294', 'none', '185.191.171.8', '1710382364', null);
INSERT INTO `sl_read` VALUES ('1253', '276', 'none', '185.191.171.2', '1710384660', null);
INSERT INTO `sl_read` VALUES ('1254', '276', 'none', '66.249.79.69', '1710389881', null);
INSERT INTO `sl_read` VALUES ('1255', '263', 'none', '45.12.179.113', '1710416488', null);
INSERT INTO `sl_read` VALUES ('1256', '262', 'none', '104.239.90.105', '1710416492', null);
INSERT INTO `sl_read` VALUES ('1257', '261', 'none', '154.194.8.207', '1710416497', null);
INSERT INTO `sl_read` VALUES ('1258', '277', 'none', '171.22.248.173', '1710416503', null);
INSERT INTO `sl_read` VALUES ('1259', '276', 'none', '23.109.208.144', '1710416506', null);
INSERT INTO `sl_read` VALUES ('1260', '273', 'none', '154.194.8.5', '1710416508', null);
INSERT INTO `sl_read` VALUES ('1261', '270', 'none', '45.61.97.198', '1710416620', null);
INSERT INTO `sl_read` VALUES ('1262', '269', 'none', '45.138.117.234', '1710416622', null);
INSERT INTO `sl_read` VALUES ('1263', '256', 'none', '45.61.97.240', '1710416623', null);
INSERT INTO `sl_read` VALUES ('1264', '264', 'none', '217.69.126.163', '1710416630', null);
INSERT INTO `sl_read` VALUES ('1265', '267', 'none', '216.173.80.151', '1710416633', null);
INSERT INTO `sl_read` VALUES ('1266', '271', 'none', '64.64.127.94', '1710416637', null);
INSERT INTO `sl_read` VALUES ('1267', '279', 'none', '217.69.127.74', '1710416640', null);
INSERT INTO `sl_read` VALUES ('1268', '294', 'none', '84.33.243.220', '1710416651', null);
INSERT INTO `sl_read` VALUES ('1269', '248', 'none', '104.239.19.53', '1710416653', null);
INSERT INTO `sl_read` VALUES ('1270', '249', 'none', '64.137.80.93', '1710416656', null);
INSERT INTO `sl_read` VALUES ('1271', '265', 'none', '185.102.48.195', '1710416657', null);
INSERT INTO `sl_read` VALUES ('1272', '272', 'none', '45.192.146.117', '1710416660', null);
INSERT INTO `sl_read` VALUES ('1273', '250', 'none', '31.223.189.89', '1710416661', null);
INSERT INTO `sl_read` VALUES ('1274', '268', 'none', '185.242.93.76', '1710416663', null);
INSERT INTO `sl_read` VALUES ('1275', '274', 'none', '64.137.80.93', '1710416666', null);
INSERT INTO `sl_read` VALUES ('1276', '259', 'none', '84.33.200.62', '1710416670', null);
INSERT INTO `sl_read` VALUES ('1277', '258', 'none', '64.137.77.185', '1710416676', null);
INSERT INTO `sl_read` VALUES ('1278', '257', 'none', '84.247.60.223', '1710416680', null);
INSERT INTO `sl_read` VALUES ('1279', '282', 'none', '217.69.126.235', '1710416687', null);
INSERT INTO `sl_read` VALUES ('1280', '291', 'none', '5.157.130.218', '1710416691', null);
INSERT INTO `sl_read` VALUES ('1281', '280', 'none', '84.33.200.46', '1710416694', null);
INSERT INTO `sl_read` VALUES ('1282', '283', 'none', '104.239.19.240', '1710416698', null);
INSERT INTO `sl_read` VALUES ('1283', '253', 'none', '104.239.88.111', '1710416700', null);
INSERT INTO `sl_read` VALUES ('1284', '252', 'none', '154.194.8.225', '1710416704', null);
INSERT INTO `sl_read` VALUES ('1285', '251', 'none', '38.170.161.27', '1710416708', null);
INSERT INTO `sl_read` VALUES ('1286', '281', 'none', '156.238.9.12', '1710416712', null);
INSERT INTO `sl_read` VALUES ('1287', '293', 'none', '23.109.225.157', '1710416714', null);
INSERT INTO `sl_read` VALUES ('1288', '292', 'none', '154.85.101.193', '1710416716', null);
INSERT INTO `sl_read` VALUES ('1289', '290', 'none', '154.85.101.208', '1710416719', null);
INSERT INTO `sl_read` VALUES ('1290', '288', 'none', '154.194.8.56', '1710416721', null);
INSERT INTO `sl_read` VALUES ('1291', '275', 'none', '194.116.249.214', '1710416723', null);
INSERT INTO `sl_read` VALUES ('1292', '286', 'none', '167.160.180.87', '1710416726', null);
INSERT INTO `sl_read` VALUES ('1293', '287', 'none', '156.238.9.96', '1710416728', null);
INSERT INTO `sl_read` VALUES ('1294', '254', 'none', '194.31.162.201', '1710416733', null);
INSERT INTO `sl_read` VALUES ('1295', '276', 'none', '66.249.66.78', '1710429343', null);
INSERT INTO `sl_read` VALUES ('1296', '293', 'none', '216.244.66.243', '1710463792', null);
INSERT INTO `sl_read` VALUES ('1297', '289', 'none', '216.244.66.243', '1710474303', null);
INSERT INTO `sl_read` VALUES ('1298', '250', 'none', '112.13.112.96', '1710475475', null);
INSERT INTO `sl_read` VALUES ('1299', '284', 'none', '66.249.66.169', '1710506533', null);
INSERT INTO `sl_read` VALUES ('1300', '279', 'http://iamzcr.com/article/columns.html?cid=376', '120.230.252.60', '1710519584', null);
INSERT INTO `sl_read` VALUES ('1301', '280', 'http://iamzcr.com/article/detail.html?id=280', '112.65.211.16', '1710521049', null);
INSERT INTO `sl_read` VALUES ('1302', '281', 'none', '66.249.66.169', '1710552434', null);
INSERT INTO `sl_read` VALUES ('1303', '275', 'none', '85.208.96.208', '1710555748', null);
INSERT INTO `sl_read` VALUES ('1304', '294', 'http://iamzcr.com/article/tags.html?tid=375', '120.230.252.60', '1710560700', null);
INSERT INTO `sl_read` VALUES ('1305', '250', 'none', '120.230.252.60', '1710562805', null);
INSERT INTO `sl_read` VALUES ('1306', '293', 'none', '66.249.66.167', '1710564854', null);
INSERT INTO `sl_read` VALUES ('1307', '276', 'none', '66.249.66.167', '1710567553', null);
INSERT INTO `sl_read` VALUES ('1308', '280', 'none', '66.249.66.169', '1710570259', null);
INSERT INTO `sl_read` VALUES ('1309', '276', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1310', '273', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1311', '262', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1312', '263', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1313', '277', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1314', '261', 'none', '183.234.187.219', '1710580506', null);
INSERT INTO `sl_read` VALUES ('1315', '249', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1316', '294', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1317', '287', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1318', '282', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1319', '283', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1320', '286', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1321', '291', 'none', '183.234.187.219', '1710580507', null);
INSERT INTO `sl_read` VALUES ('1322', '268', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1323', '280', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1324', '250', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1325', '271', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1326', '267', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1327', '264', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1328', '256', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1329', '269', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1330', '270', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1331', '252', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1332', '248', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1333', '276', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1334', '273', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1335', '274', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1336', '251', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1337', '265', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1338', '272', 'none', '183.234.187.219', '1710580508', null);
INSERT INTO `sl_read` VALUES ('1339', '262', 'none', '183.234.187.219', '1710580509', null);
INSERT INTO `sl_read` VALUES ('1340', '279', 'none', '183.234.187.219', '1710580509', null);
INSERT INTO `sl_read` VALUES ('1341', '263', 'none', '183.234.187.219', '1710580509', null);
INSERT INTO `sl_read` VALUES ('1342', '261', 'none', '217.182.175.222', '1710594710', null);
INSERT INTO `sl_read` VALUES ('1343', '262', 'none', '217.182.175.222', '1710594712', null);
INSERT INTO `sl_read` VALUES ('1344', '263', 'none', '217.182.175.222', '1710594717', null);
INSERT INTO `sl_read` VALUES ('1345', '293', 'none', '85.208.96.207', '1710607839', null);
INSERT INTO `sl_read` VALUES ('1346', '280', 'http://iamzcr.com/article/tags.html?tid=375', '120.230.252.60', '1710612968', null);
INSERT INTO `sl_read` VALUES ('1347', '276', 'none', '220.181.108.81', '1710615762', null);
INSERT INTO `sl_read` VALUES ('1348', '279', 'none', '85.208.96.193', '1710616023', null);
INSERT INTO `sl_read` VALUES ('1349', '268', 'http://iamzcr.com/article/detail.html?id=268', '112.65.212.101', '1710623370', null);
INSERT INTO `sl_read` VALUES ('1350', '292', 'none', '85.208.96.193', '1710626545', null);
INSERT INTO `sl_read` VALUES ('1351', '282', 'none', '85.208.96.197', '1710630895', null);
INSERT INTO `sl_read` VALUES ('1352', '287', 'http://iamzcr.com/article/detail.html?id=287', '223.93.149.170', '1710641948', null);
INSERT INTO `sl_read` VALUES ('1353', '281', 'http://iamzcr.com/article/detail.html?id=281', '101.91.136.248', '1710643490', null);
INSERT INTO `sl_read` VALUES ('1354', '253', 'none', '116.179.32.173', '1710655103', null);
INSERT INTO `sl_read` VALUES ('1355', '261', 'http://iamzcr.com/', '123.6.49.50', '1710662938', null);
INSERT INTO `sl_read` VALUES ('1356', '248', 'http://iamzcr.com/article/detail.html?id=261', '123.6.49.41', '1710662941', null);
INSERT INTO `sl_read` VALUES ('1357', '294', 'none', '216.244.66.243', '1710677691', null);
INSERT INTO `sl_read` VALUES ('1358', '286', 'none', '116.179.32.77', '1710715842', null);
INSERT INTO `sl_read` VALUES ('1359', '284', 'http://iamzcr.com/article/detail.html?id=284', '223.93.149.212', '1710716585', null);
INSERT INTO `sl_read` VALUES ('1360', '282', 'none', '216.244.66.243', '1710717817', null);
INSERT INTO `sl_read` VALUES ('1361', '262', 'http://iamzcr.com/', '117.173.87.135', '1710737102', null);
INSERT INTO `sl_read` VALUES ('1362', '250', 'none', '39.173.105.148', '1710744018', null);
INSERT INTO `sl_read` VALUES ('1363', '282', 'http://iamzcr.com/article/detail.html?id=282', '140.206.236.24', '1710746512', null);
INSERT INTO `sl_read` VALUES ('1364', '271', 'none', '220.181.108.94', '1710749068', null);
INSERT INTO `sl_read` VALUES ('1365', '277', 'none', '116.179.32.35', '1710761411', null);
INSERT INTO `sl_read` VALUES ('1366', '272', 'none', '220.181.108.82', '1710779889', null);
INSERT INTO `sl_read` VALUES ('1367', '294', 'http://iamzcr.com/article/detail.html?id=294', '112.65.212.102', '1710803746', null);
INSERT INTO `sl_read` VALUES ('1368', '280', 'none', '185.191.171.12', '1710812721', null);
INSERT INTO `sl_read` VALUES ('1369', '249', 'none', '185.191.171.5', '1710820275', null);
INSERT INTO `sl_read` VALUES ('1370', '286', 'https://www.google.com/', '223.104.244.52', '1710827435', null);
INSERT INTO `sl_read` VALUES ('1371', '252', 'none', '220.181.108.93', '1710837416', null);
INSERT INTO `sl_read` VALUES ('1372', '269', 'none', '85.208.96.206', '1710837636', null);
INSERT INTO `sl_read` VALUES ('1373', '252', 'none', '185.191.171.13', '1710838029', null);
INSERT INTO `sl_read` VALUES ('1374', '262', 'none', '185.191.171.15', '1710839640', null);
INSERT INTO `sl_read` VALUES ('1375', '250', 'none', '185.191.171.10', '1710840052', null);
INSERT INTO `sl_read` VALUES ('1376', '275', 'http://iamzcr.com/article/detail.html?id=275', '101.91.136.240', '1710840952', null);
INSERT INTO `sl_read` VALUES ('1377', '264', 'http://iamzcr.com/article/tags.html?tid=383', '120.230.252.60', '1710841106', null);
INSERT INTO `sl_read` VALUES ('1378', '263', 'none', '185.191.171.8', '1710852951', null);
INSERT INTO `sl_read` VALUES ('1379', '270', 'none', '185.191.171.16', '1710853530', null);
INSERT INTO `sl_read` VALUES ('1380', '291', 'none', '185.191.171.10', '1710854614', null);
INSERT INTO `sl_read` VALUES ('1381', '261', 'http://iamzcr.com/', '120.230.252.60', '1710863660', null);
INSERT INTO `sl_read` VALUES ('1382', '281', 'none', '185.191.171.3', '1710867181', null);
INSERT INTO `sl_read` VALUES ('1383', '269', 'none', '116.179.32.222', '1710885748', null);
INSERT INTO `sl_read` VALUES ('1384', '276', 'none', '116.179.32.177', '1710892122', null);
INSERT INTO `sl_read` VALUES ('1385', '279', 'http://iamzcr.com/article/detail.html?id=279', '223.93.159.55', '1710902259', null);
INSERT INTO `sl_read` VALUES ('1386', '288', 'none', '66.249.73.68', '1710903901', null);
INSERT INTO `sl_read` VALUES ('1387', '288', 'none', '220.181.108.90', '1710930095', null);
INSERT INTO `sl_read` VALUES ('1388', '292', 'none', '220.181.108.159', '1710930769', null);
INSERT INTO `sl_read` VALUES ('1389', '274', 'none', '116.179.32.214', '1710947274', null);
INSERT INTO `sl_read` VALUES ('1390', '256', 'http://iamzcr.com/article/detail.html?id=256', '140.206.236.110', '1710981217', null);
INSERT INTO `sl_read` VALUES ('1391', '281', 'none', '66.249.66.167', '1711005022', null);
INSERT INTO `sl_read` VALUES ('1392', '281', 'none', '66.249.66.169', '1711010876', null);
INSERT INTO `sl_read` VALUES ('1393', '288', 'none', '85.208.96.205', '1711015904', null);
INSERT INTO `sl_read` VALUES ('1394', '286', 'http://iamzcr.com/article/detail.html?id=286', '112.65.212.3', '1711019058', null);
INSERT INTO `sl_read` VALUES ('1395', '294', 'none', '216.244.66.243', '1711020268', null);
INSERT INTO `sl_read` VALUES ('1396', '253', 'none', '85.208.96.201', '1711024835', null);
INSERT INTO `sl_read` VALUES ('1397', '280', 'none', '66.249.66.168', '1711040773', null);
INSERT INTO `sl_read` VALUES ('1398', '276', 'none', '66.249.66.167', '1711040893', null);
INSERT INTO `sl_read` VALUES ('1399', '284', 'none', '66.249.66.167', '1711046173', null);
INSERT INTO `sl_read` VALUES ('1400', '268', 'none', '85.208.96.210', '1711048103', null);
INSERT INTO `sl_read` VALUES ('1401', '283', 'none', '85.208.96.204', '1711051079', null);
INSERT INTO `sl_read` VALUES ('1402', '279', 'none', '66.249.66.167', '1711051694', null);
INSERT INTO `sl_read` VALUES ('1403', '283', 'none', '220.181.108.92', '1711054025', null);
INSERT INTO `sl_read` VALUES ('1404', '271', 'none', '185.191.171.16', '1711058233', null);
INSERT INTO `sl_read` VALUES ('1405', '276', 'none', '66.249.66.78', '1711063178', null);
INSERT INTO `sl_read` VALUES ('1406', '285', 'none', '66.249.66.168', '1711063213', null);
INSERT INTO `sl_read` VALUES ('1407', '254', 'none', '85.208.96.203', '1711072321', null);
INSERT INTO `sl_read` VALUES ('1408', '275', 'none', '116.179.32.80', '1711084559', null);
INSERT INTO `sl_read` VALUES ('1409', '273', 'none', '185.191.171.1', '1711087979', null);
INSERT INTO `sl_read` VALUES ('1410', '274', 'none', '85.208.96.196', '1711091020', null);
INSERT INTO `sl_read` VALUES ('1411', '251', 'none', '185.191.171.2', '1711093718', null);
INSERT INTO `sl_read` VALUES ('1412', '263', 'http://iamzcr.com/', '36.21.208.7', '1711124040', null);
INSERT INTO `sl_read` VALUES ('1413', '264', 'none', '101.67.49.43', '1711133921', null);
INSERT INTO `sl_read` VALUES ('1414', '248', 'none', '157.55.39.54', '1711140701', null);
INSERT INTO `sl_read` VALUES ('1415', '275', 'none', '116.179.32.72', '1711167516', null);
INSERT INTO `sl_read` VALUES ('1416', '263', 'none', '116.179.32.71', '1711201110', null);
INSERT INTO `sl_read` VALUES ('1417', '268', 'none', '185.229.119.178', '1711207452', null);
INSERT INTO `sl_read` VALUES ('1418', '269', 'none', '185.229.119.178', '1711207454', null);
INSERT INTO `sl_read` VALUES ('1419', '270', 'none', '185.229.119.178', '1711207456', null);
INSERT INTO `sl_read` VALUES ('1420', '271', 'none', '185.229.119.178', '1711207458', null);
INSERT INTO `sl_read` VALUES ('1421', '274', 'none', '185.229.119.178', '1711207460', null);
INSERT INTO `sl_read` VALUES ('1422', '263', 'none', '101.67.50.6', '1711220597', null);
INSERT INTO `sl_read` VALUES ('1423', '249', 'http://iamzcr.com/article/detail.html?id=249', '101.91.134.228', '1711238321', null);
INSERT INTO `sl_read` VALUES ('1424', '267', 'http://iamzcr.com/article/detail.html?id=267', '140.206.236.66', '1711247118', null);
INSERT INTO `sl_read` VALUES ('1425', '257', 'none', '85.208.96.193', '1711254656', null);
INSERT INTO `sl_read` VALUES ('1426', '270', 'http://iamzcr.com/article/detail.html?id=270', '223.93.159.102', '1711257441', null);
INSERT INTO `sl_read` VALUES ('1427', '279', 'http://iamzcr.com/article/detail.html?id=279', '223.93.159.124', '1711266833', null);
INSERT INTO `sl_read` VALUES ('1428', '272', 'none', '185.191.171.13', '1711268922', null);

-- ----------------------------
-- Table structure for sl_tags
-- ----------------------------
DROP TABLE IF EXISTS `sl_tags`;
CREATE TABLE `sl_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sl_tags
-- ----------------------------
INSERT INTO `sl_tags` VALUES ('372', '1', 'env', 'zcr', '环境搭建', '1', '1', '1686389500', null);
INSERT INTO `sl_tags` VALUES ('373', '1', 'front', 'zcr', '前端', '2', '1', '1686399448', null);
INSERT INTO `sl_tags` VALUES ('374', '1', 'pgsql', 'zcr', 'PostgreSQL', '0', '1', '1686476329', '1706684449');
INSERT INTO `sl_tags` VALUES ('375', '1', 'golang', 'zcr', 'Golang', '1', '1', '1686586812', null);
INSERT INTO `sl_tags` VALUES ('376', '1', 'php', 'zcr', 'PHP', '2', '1', '1686586826', null);
INSERT INTO `sl_tags` VALUES ('377', '1', 'mongodb', 'zcr', 'Mongodb', '1', '1', '1686586848', null);
INSERT INTO `sl_tags` VALUES ('378', '1', 'mysql', 'zcr', 'Mysql', '6', '1', '1686586862', null);
INSERT INTO `sl_tags` VALUES ('379', '1', 'python', 'zcr', 'Python', '7', '1', '1686587185', null);
INSERT INTO `sl_tags` VALUES ('380', '1', 'nginx', 'zcr', 'Nginx', '1', '1', '1686587442', null);
INSERT INTO `sl_tags` VALUES ('381', '1', 'vue', 'zcr', 'VUE', '5', '1', '1686626184', null);
INSERT INTO `sl_tags` VALUES ('382', '1', 'design', 'zcr', '架构设计', '0', '1', '1705245154', null);
INSERT INTO `sl_tags` VALUES ('383', '1', 'data', 'zcr', '大数据', '666', '1', '1706684329', '1706684417');
INSERT INTO `sl_tags` VALUES ('384', '3', 'sdk', 'zcr', '设计一个的发行SDK系统', '1', '1', '1708247871', null);
INSERT INTO `sl_tags` VALUES ('387', '3', 'php_f', 'zcr', '构建自己的小型PHP框架', '2', '1', '1708247950', null);
INSERT INTO `sl_tags` VALUES ('388', '3', 'design-php', 'zcr', '设计模式-PHP', '0', '1', '1708484292', '1708524566');

-- ----------------------------
-- Table structure for sl_website
-- ----------------------------
DROP TABLE IF EXISTS `sl_website`;
CREATE TABLE `sl_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) DEFAULT NULL,
  `value` text,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_website
-- ----------------------------
INSERT INTO `sl_website` VALUES ('3', 'website', '{\"admin_name\":\"\\u5806\\u6808\\u4eba\\u751f\\u7ba1\\u7406\\u540e\\u53f0\",\"website_name\":\"\\u5806\\u6808\\u4eba\\u751f\",\"keyword\":\"\\u535a\\u5ba2,\\u5806\\u6808\\u4eba\\u751f,php,golang,\\u6846\\u67b6,\\u7b14\\u8bb0\",\"desc\":\"\\u4e00\\u4e2a\\u5206\\u4eab\\u6280\\u672f\\u7b14\\u8bb0\\u548c\\u751f\\u6d3b\\u70b9\\u6ef4\\u7684\\u535a\\u5ba2\",\"icp\":\"\",\"icp_url\":\"\",\"github_url\":\"\",\"blog_url\":\"\",\"upload_url\":\"\",\"cdn_url\":\"http:\\/\\/cdn.iamzcr.com\\/\",\"logo\":\"\\/logo\\/2023061019561549474.png\"}', null, null);
