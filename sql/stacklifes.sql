/*
Navicat MySQL Data Transfer

Source Server         : 172.16.50.47
Source Server Version : 80039
Source Host           : 172.16.50.47:3306
Source Database       : stacklifes

Target Server Type    : MYSQL
Target Server Version : 80039
File Encoding         : 65001

Date: 2024-10-17 20:44:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sl_admin
-- ----------------------------
DROP TABLE IF EXISTS `sl_admin`;
CREATE TABLE `sl_admin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '用户自增id',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` varchar(64) NOT NULL COMMENT '密码掩码',
  `group_id` int NOT NULL DEFAULT '0' COMMENT '用户组id',
  `eid` int DEFAULT NULL,
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '电话',
  `department` varchar(64) DEFAULT '' COMMENT '所在部门',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `create_time` int DEFAULT '0' COMMENT '创建用户时间戳',
  `expiration` int DEFAULT '0' COMMENT '用户过期时间戳',
  `login_num` int NOT NULL DEFAULT '0' COMMENT '累计登陆次数',
  `last_login_time` int DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(64) DEFAULT '' COMMENT '最后登录ip',
  `lang` varchar(255) DEFAULT NULL,
  `login_flag` varchar(16) DEFAULT '' COMMENT '登录跳转验证',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

-- ----------------------------
-- Records of sl_admin
-- ----------------------------
INSERT INTO `sl_admin` VALUES ('377', 'nicholas', 'f31f413a2c4164ae89513383a3c08ea5', 'b16574c54c98b9512edbecb8fa4f47f2', '1', null, 'nicholas', '', '', null, '0', '2147483647', '85', '1710860215', '120.230.252.60', null, '', '1');
INSERT INTO `sl_admin` VALUES ('380', 'admin', '50029fc296985a142931182b0ef3764f', 'b4fd1d2cb085390fbbadae65e07876a7', '1', null, 'admin', '', '', null, '0', '2147483647', '0', '1683297155', '183.6.88.24', null, '', '1');

-- ----------------------------
-- Table structure for sl_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `sl_admin_group`;
CREATE TABLE `sl_admin_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组自增id',
  `mark` varchar(11) NOT NULL COMMENT '用户组标识',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `description` varchar(256) NOT NULL DEFAULT '' COMMENT '描述',
  `menu_permit` text COMMENT '央服权限数据',
  `menu_modules` text COMMENT '央服权限模块',
  `allow_ip` text COMMENT 'ip白名单',
  `create_time` int DEFAULT '0' COMMENT '创建用户组时间戳',
  `update_time` int DEFAULT NULL COMMENT '更新操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 COMMENT='用户组';

-- ----------------------------
-- Records of sl_admin_group
-- ----------------------------
INSERT INTO `sl_admin_group` VALUES ('1', 'super', '超级管理员', '拥有所有权限', '[\"347\",\"348\",\"349\",\"350\",\"351\",\"352\",\"353\",\"370\",\"381\",\"382\",\"383\",\"384\",\"385\",\"386\",\"387\",\"388\"]', '[\"menu\\/*\",\"permit\\/*\",\"usergroup\\/*\",\"log\\/*\",\"website\\/*\",\"user\\/index\",\"user\\/add\",\"user\\/updatedata\",\"user\\/changestatus\",\"user\\/password\",\"lang\\/*\",\"columns\\/*\",\"article\\/*\",\"tags\\/*\",\"attach\\/*\",\"upload\\/*\",\"read\\/*\",\"comment\\/*\",\"message\\/*\"]', null, '1487580864', '1487580864');

-- ----------------------------
-- Table structure for sl_article
-- ----------------------------
DROP TABLE IF EXISTS `sl_article`;
CREATE TABLE `sl_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL,
  `did` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `summary` text,
  `content` longtext,
  `is_hot` tinyint DEFAULT NULL,
  `is_new` tinyint DEFAULT NULL,
  `is_recom` tinyint DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `public_time` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '素材类型，1图片，2视频',
  `month` varchar(255) DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sl_article
-- ----------------------------
INSERT INTO `sl_article` VALUES ('295', '317', '379', 'nginx安装和配置', null, null, 'nicholas', null, null, '\r\n\r\n官方文档\r\n\r\nhttp://nginx.org/download\r\n\r\n下载\r\n\r\n```bash\r\nwget http://nginx.org/download/nginx-1.21.1.tar.gz\r\n```\r\n\r\n\r\n安装依赖包\r\n\r\n```bash\r\nyum -y install pcre-devel openssl openssl-devel gcc\r\n```\r\n\r\n\r\n解压\r\n\r\n```bash\r\ntar -zxvf nginx-1.21.1.tar.gz\r\ncd nginx-1.21.1/\r\n```\r\n\r\n编译，安装\r\n\r\n```bash\r\n./configure --prefix=/usr/local/nginx\r\nmake && make install\r\n```\r\n\r\n查看安装目录：\r\n\r\n```bash\r\nwhereis nginx\r\n```\r\n\r\n查看版本\r\n\r\n```bash\r\n/usr/local/nginx/sbin/nginx -v\r\n```\r\n\r\n启动\r\n\r\n```bash\r\n/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf\r\n```\r\n\r\n重启\r\n\r\n```bash\r\n/usr/local/nginx/sbin/nginx -s reload\r\n```\r\n\r\n停止\r\n\r\n```bash\r\n/usr/local/nginx/sbin/nginx -s stop\r\n```\r\n\r\n查看进程\r\n\r\n```bash\r\nps -ef|grep nginx\r\n```\r\n\r\n测试，配置Nginx，新建存放项目目录，`mkdir -p  /data/test/html/`，在此目录下新建文件index.html，打开Nginx配置文件，`vim /usr/local/nginx/conf/nginx.conf`，修改root指向配置，\r\n\r\n```bash\r\nlocation / {\r\n        root   /data/test/html/;\r\n        index  index.html index.htm;\r\n}\r\n```\r\n\r\n重启Nginx，curl访问，查看是否能访问到index.html的内容\r\n\r\n```bash\r\ncurl \"http://127.0.0.1/\"\r\n//输出\r\ntest\r\n```', null, null, null, null, '1665969060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('296', '317', '380', 'gitea安装和配置', null, null, 'nicholas', null, null, '文档地址\r\n\r\nhttps://docs.gitea.com/installation/install-from-binary\r\n\r\n下载安装\r\n\r\n```bash\r\nwget -O gitea https://github.com/go-gitea/gitea/releases/download/v1.21.11/gitea-1.21.11-linux-amd64\r\nchmod +x gitea\r\n```\r\n\r\n新建用户和用户组\r\n\r\n```bash\r\ngroupadd --system git\r\nadduser \\\r\n   --system \\\r\n   --shell /bin/bash \\\r\n   --comment \'Git Version Control\' \\\r\n   --gid git \\\r\n   --home-dir /home/git \\\r\n   --create-home \\\r\n   git\r\n```\r\n\r\n创建数据目录\r\n\r\n```bash\r\nmkdir -p /var/lib/gitea/{custom,data,log}\r\nchown -R git:git /var/lib/gitea/  #存放仓库相关文件的目录\r\nchmod -R 750 /var/lib/gitea/\r\nmkdir /etc/gitea\r\nchown root:git /etc/gitea  #存放配置文件app.ini的目录\r\nchmod 770 /etc/gitea\r\n```\r\n复制二进制文件到全局位置\r\n\r\n```bash\r\ncp gitea /usr/local/bin/gitea\r\n```\r\n\r\n新建启动文件：gitea.service\r\n\r\n```bash\r\n[Unit]\r\nDescription=Gitea (Git with a cup of tea)\r\nAfter=syslog.target\r\nAfter=network.target\r\n[Service]\r\nRestartSec=2s\r\nType=simple\r\nUser=git\r\nGroup=git\r\nWorkingDirectory=/var/lib/gitea/\r\nExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini\r\nRestart=always\r\nEnvironment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea\r\n[Install]\r\nWantedBy=multi-user.target\r\n```\r\n\r\n其他配置可参考\r\n\r\nhttps://github.com/go-gitea/gitea/blob/release/v1.21/contrib/systemd/gitea.service\r\n\r\n复制配置文件\r\n\r\n```bash\r\nmv gitea.service /etc/systemd/system\r\n```\r\n\r\n激活 gitea 并将它作为系统自启动服务\r\n\r\n```bash\r\n sudo systemctl enable gitea\r\n sudo systemctl start gitea\r\n```\r\n\r\n访问：http://你的虚拟机ip:3000/，初始化gitea，注意如果访问不了，查看防火墙是否关闭。\r\n\r\n如果配置保存中出现需要更高版本的git，安装高版本的git，卸载老版本\r\n\r\n```bash\r\nyum remove git\r\n```\r\n\r\n下载并安装\r\n\r\n```bash\r\nwget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.8.2.tar.gz\r\ntar zxvf git-2.8.2.tar.gz\r\ncd git-2.8.2\r\n#依赖安装\r\nyum install -y curl-devel expat-devel gcc gettext-devel openssl-devel zlib-devel asciidoc xmlto perl-devel perl-CPAN autoconf*\r\nautoconf\r\n#编译安装\r\n./configure\r\nmake && make install\r\n```\r\n\r\n配置环境变量\r\n\r\n```bash\r\necho \"export PATH=$PATH:/usr/local/git/bin\" >> /etc/bashrc\r\nsource /etc/bashrc\r\n```\r\n\r\n测试，从命令行创建一个新的仓库\r\n\r\n```bash\r\ntouch README.md\r\ngit init\r\ngit checkout -b main\r\ngit add README.md\r\ngit commit -m \"first commit\"\r\n```\r\n\r\n从命令行推送已经创建的仓库\r\n\r\n```bash\r\ngit remote add origin http://你的虚拟机ip:3000/zcr/test.git\r\ngit push -u origin main\r\n```\r\n', null, null, null, null, '1665969060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('297', '317', '377', 'redis安装和配置', null, null, 'nicholas', null, null, '\r\n官方地址\r\n\r\nhttps://github.com/redis/redis/releases\r\n\r\n下载解压\r\n\r\n```shell\r\nwget https://github.com/redis/redis/archive/refs/tags/6.2.14.tar.gz\r\ntar xzvf 6.2.14.tar.gz\r\n```\r\n安装\r\n```shell\r\nyum -y install gcc gcc-c++ libstdc++-devel\r\ncd redis-6.2.14\r\nmake \r\ncd src \r\nmake install PREFIX=/usr/local/redis\r\n```\r\n移动配置文件到安装目录下\r\n```shell\r\ncd ../ \r\nmkdir -p /usr/local/redis/etc\r\nmv redis.conf /usr/local/redis/etc\r\n```\r\n配置redis为后台启动，将daemonize no 改成daemonize yes，设置redis端口和密码，将port 6379 改成 port 你的端口，去掉requirepass注释，并设置requirepass 你的密码。\r\n\r\n```shell\r\nvi /usr/local/redis/etc/redis.conf\r\n```\r\n开启redis\r\n```shell\r\n/usr/local/redis/bin/redis-server /usr/local/redis/etc/redis.conf\r\n```\r\n登录操作redis\r\n```shell\r\n/usr/local/redis/bin/redis-cli -p 端口 -h 主机\r\n//如果设置了密码，你需要执行下面命令才能操作redis\r\nauth 你的密码\r\n```\r\n关闭redis\r\n```shell\r\n/usr/local/redis/bin/redis-cli shutdown\r\n```\r\n指定端口和密码关闭\r\n```shell\r\n/usr/local/redis/bin/redis-cli -p 端口 -a 密码 shutdown\r\n```\r\n', null, null, null, null, '1665969060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('298', '317', '381', 'golang安装和配置', null, null, 'nicholas', null, null, '\r\n官方地址\r\n\r\nhttps://go.dev/\r\n\r\n下载\r\n\r\n```bash\r\nwget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz\r\n```\r\n\r\n安装\r\n\r\n```bash\r\ntar -xvf go1.22.0.linux-amd64.tar.gz \r\nmv go  /usr/local\r\n```\r\n\r\n查看版本和env\r\n\r\n```bash\r\n/usr/local/go/bin/go version\r\n/usr/local/go/bin/go env\r\n```\r\n\r\n设置环境变量，创建一个目录用于GOPATH\r\n\r\n```bash\r\nmkdir /home/go\r\n```\r\n\r\n打开.bashrc文件\r\n\r\n```bash\r\nvim $HOME/.bashrc\r\n```\r\n\r\n添加环境变量\r\n\r\n```bash\r\nGOROOT=/usr/local/go\r\nGOPATH=/home/go\r\nPATH=$PATH:$GOROOT/bin:$GOPATH/bin\r\n```\r\n\r\n生效配置\r\n\r\n```bash\r\nsource  $HOME/.bashrc\r\n```\r\n\r\n开启模块支持\r\n\r\n```bash\r\ngo env  -w GO111MODULE=on\r\n```\r\n\r\n由于有些包下载速度或者网络上有问题，修改代理。\r\n\r\n```bash\r\ngo env -w GOPROXY=https://goproxy.cn,direct\r\n```', null, null, null, null, '1665969060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('299', '317', '382', 'php安装和配置', null, null, 'nicholas', null, null, '\r\n官网下载\r\n\r\nhttps://www.php.net/releases/\r\n\r\n\r\n下载\r\n\r\n```bash\r\nwget https://www.php.net/distributions/php-7.3.33.tar.gz --no-check-certificate\r\n```\r\n\r\n安装依赖\r\n\r\n```bash\r\nyum -y install libxml2 libxml2-devel sqlite-devel openssl openssl-devel oniguruma oniguruma-devel libcurl-devel autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel pcre-devel libxslt libxslt-devel wget \r\n```\r\n\r\n\r\n解压并进入目录。\r\n\r\n```bash\r\ntar -xzvf php-7.3.33.tar.gz\r\ncd php-7.3.33\r\n```\r\n生成configure配置文件。这里可能由于php版本不一样，某些配置可能变更或者废弃，可以通过./configure --help查看\r\n\r\n```bash\r\n./configure \\\r\n--prefix=/usr/local/php \\\r\n--exec-prefix=/usr/local/php \\\r\n--bindir=/usr/local/php/bin \\\r\n--sbindir=/usr/local/php/sbin \\\r\n--includedir=/usr/local/php/include \\\r\n--libdir=/usr/local/php/lib/php \\\r\n--mandir=/usr/local/php/php/man \\\r\n--with-config-file-path=/usr/local/php/etc \\\r\n--with-curl \\\r\n--with-freetype-dir \\\r\n--with-gd \\\r\n--with-gettext \\\r\n--with-iconv-dir \\\r\n--with-kerberos \\\r\n--with-libdir=lib64 \\\r\n--with-libxml-dir \\\r\n--with-mysqli \\\r\n--with-openssl \\\r\n--with-pcre-regex \\\r\n--with-pdo-mysql \\\r\n--with-pdo-sqlite \\\r\n--with-pear \\\r\n--with-png-dir \\\r\n--with-xmlrpc \\\r\n--with-xsl \\\r\n--with-zlib \\\r\n--enable-fpm \\\r\n--enable-bcmath \\\r\n--enable-libxml \\\r\n--enable-inline-optimization \\\r\n--enable-mbregex \\\r\n--enable-mbstring \\\r\n--enable-opcache \\\r\n--enable-pcntl \\\r\n--enable-shmop \\\r\n--enable-soap \\\r\n--enable-sockets \\\r\n--enable-sysvsem \\\r\n--enable-xml \\\r\n--enable-zip \\\r\n--enable-mbstring \\\r\n--enable-pcntl\r\n```\r\n编译安装。\r\n\r\n```bash\r\nmake && make install\r\n```\r\n查看安装版本。\r\n\r\n```bash\r\n/usr/local/php/bin/php --version\r\n```\r\n在php-7.3.33复制php.ini到配置目录。\r\n\r\n```bash\r\ncp php.ini-production /usr/local/php/etc/php.ini\r\n```\r\n在php-7.3.33复制目录下的 sapi/fpm/init.d.php-fpm 文件拷贝到系统配置 /etc/init.d 目录下，并重命名为 php-fpm，并且给可执行权限。\r\n\r\n```bash\r\ncp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm \r\nchmod +x /etc/init.d/php-fpm\r\n```\r\n添加php-fpm 配置文件，在php安装目录下的 /usr/local/php/etc/php-fpm.conf.default 文件拷贝到同目录下，并重命名为 php-fpm.conf。\r\n\r\n```bash\r\ncp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf\r\n```\r\n添加 www.conf 配置文件，将php安装目录下的 /usr/local/php/etc/php-fpm.d/www.conf.default 文件拷贝同目录下并重命名为 www.conf。\r\n\r\n```bash\r\ncp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf\r\n```\r\n添加php安装目录到系统环境变量，创建并打开文件php.sh。\r\n\r\n```bash\r\nvim /etc/profile.d/php.sh \r\nexport PATH=$PATH:/usr/local/php/bin/:/usr/local/php/sbin/\r\n```\r\n使用source立即生效刚刚添加的php环境变量 。\r\n\r\n```bash\r\nsource /etc/profile.d/php.sh\r\n```\r\n启动php\r\n\r\n```bash\r\nservice php-fpm start\r\n```\r\n查看php进程和fastcgi监听端口(默认是9000)。\r\n\r\n```bash\r\n查看php进程\r\nps aux|grep php\r\n查看fastcgi监听的端口\r\nnetstat -tnl |grep 9000\r\n```\r\n设置开机启动PHP服务。\r\n\r\n```bash\r\n配置系统配置目录下的 php-fpm 文件为可执行权限\r\nchmod +x /etc/init.d/php-fpm\r\n将系统配置目录下的 `php-fpm` 添加到 `系统服务`\r\nchkconfig --add php-fpm\r\n设置 `php-fpm` `系统服务` 为开机启动\r\nchkconfig php-fpm on\r\n```', null, null, null, null, '1665969060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('300', '317', '377', 'redis主从集群配置', null, null, 'nicholas', null, null, 'redis的主从配置实际上是配置多个实例，然后通过命令、配置、启动方式去配置是作为主实例还是从实例。主从配置的时候，需要把aof持久化关闭，rdb持久化开启。\r\n\r\n新建/myconfig/myredis文件夹，复制一份基础配置到/myconfig/myredis文件夹。\r\n\r\n```shell\r\ncp /usr/local/redis/etc/redis.conf /myconfig/myredis/redis.conf\r\n```\r\n\r\n在/myconfig/myredis文件夹新建四个实例配置分别是\r\n\r\nredis_25001.conf(主),redis_25002.conf(从),redis_25003.conf(从),redis_25004.conf(从)\r\n\r\n25001实例配置\r\n\r\n```shell\r\n#include包含基础配置文件\r\ninclude /myconfig/myredis/redis.conf\r\n# 监听的IP地址和端口\r\nbind 0.0.0.0\r\nport 25001\r\n#进程号\r\npidfile /var/run/redis_25001.pid\r\n#配置rdb持久化文件\r\ndbfilename dump25001.rdb\r\n#密码\r\nmasterauth 你的主库授权密码\r\n```\r\n\r\n25002实例的配置\r\n\r\n```shell\r\n#include包含基础配置文件\r\ninclude /myconfig/myredis/redis.conf\r\n#监听的IP地址和端口\r\nbind 0.0.0.0\r\nport 25002\r\n#进程号\r\npidfile /var/run/redis_25002.pid\r\n#配置rdb持久化文件\r\ndbfilename dump25002.rdb\r\n#密码\r\nmasterauth 你的主库授权密码\r\n```\r\n\r\n25003实例的配置\r\n\r\n```shell\r\n#include包含基础配置文件\r\n#默认基础配置一般放这里;/usr/local/redis/etc/redis.conf,可以复制一份到自己定义的目录下\r\ninclude /myconfig/myredis/redis.conf\r\n#监听的IP地址和端口\r\nbind 0.0.0.0\r\nport 25003\r\n#进程号\r\npidfile /var/run/redis_25003.pid\r\n#配置rdb持久化文件\r\ndbfilename dump25003.rdb\r\n#密码\r\nmasterauth 你的主库授权密码\r\n```\r\n\r\n25004实例配置\r\n\r\n```shell\r\n#include包含基础配置文件\r\ninclude /myconfig/myredis/redis.conf\r\n#监听的IP地址和端口\r\nbind 0.0.0.0\r\nport 25004\r\n#进程号\r\npidfile /var/run/redis_25004.pid\r\n#配置rdb持久化文件\r\ndbfilename dump25004.rdb\r\n#密码\r\nmasterauth 你的主库授权密码\r\n#配置文件指定主库\r\nreplicaof 127.0.0.1 25001\r\n```\r\n\r\n分别启动四个实例\r\n\r\n```shell\r\ncd /usr/local/redis/bin && ./redis-server /myconfig/myredis/redis_25001.conf\r\ncd /usr/local/redis/bin && ./redis-server /myconfig/myredis/redis_25002.conf\r\ncd /usr/local/redis/bin && ./redis-server /myconfig/myredis/redis_25003.conf\r\ncd /usr/local/redis/bin && ./redis-server /myconfig/myredis/redis_25004.conf\r\n```\r\n\r\n查看redis进程,看看是否都启动成功。\r\n\r\n```shell\r\nps aux|grep redis\r\n```\r\n\r\n登录查看目前redis主从信息，此时应该都是master。\r\n\r\n```shell\r\ninfo  replication\r\n输出\r\n# Replication\r\nrole:master\r\nconnected_slaves:0\r\nmaster_failover_state:no-failover\r\nmaster_replid:f04f09d212543ff4168600afa6c2e4a4cff3abe5\r\nmaster_replid2:0000000000000000000000000000000000000000\r\nmaster_repl_offset:0\r\nsecond_repl_offset:-1\r\nrepl_backlog_active:0\r\nrepl_backlog_size:1048576\r\nrepl_backlog_first_byte_offset:0\r\nrepl_backlog_histlen:0\r\n```\r\n\r\n设置主从有三种方式\r\n\r\n一是启动的时候slaveof或者replicaof（临时）指定主库，这里用25001的机器作为25001的从库启动。\r\n\r\n```shell\r\ncd /usr/local/redis/bin && ./redis-server /myconfig/myredis/redis_25002.conf --slaveof 127.0.0.1 25001\r\n```\r\n\r\n二是登录到客户端，通过命令设置(临时)指定主库 客户端登录25003，设置作为25001的从库。\r\n\r\n```shell\r\n--slaveof 127.0.0.1 25001\r\n```\r\n\r\n三是通过实例配置文件(永久)配置指定主库，对于25004,因为在实例配置文件的时候就指定了25001作为主库，所以不需要指定，启动就作为从库。\r\n\r\n登录再次查看目前redis主从信息，此时只有25001端口实例是master。三个从库实例\r\n\r\n```shell\r\ninfo  replication\r\n输出\r\n# Replication\r\nrole:master\r\nconnected_slaves:3\r\nslave0:ip=127.0.0.1,port=25003,state=online,offset=2182,lag=0\r\nslave1:ip=127.0.0.1,port=25002,state=online,offset=2182,lag=0\r\nslave2:ip=127.0.0.1,port=25004,state=online,offset=2182,lag=0\r\nmaster_failover_state:no-failover\r\nmaster_replid:4847c391e22378bf7b0b1541332d18a43d4a09ec\r\nmaster_replid2:0000000000000000000000000000000000000000\r\nmaster_repl_offset:2182\r\nsecond_repl_offset:-1\r\nrepl_backlog_active:1\r\nrepl_backlog_size:1048576\r\nrepl_backlog_first_byte_offset:1\r\nrepl_backlog_histlen:2182\r\n```\r\n\r\n查看数据是否能主从同步.\r\n\r\n```shell\r\nset domain iamzcr.com\r\nget domain\r\n#输出\r\niamzcr.com\r\n```\r\n', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('301', '377', '383', '构建自己的小型PHP框架(一)', null, null, 'nicholas', null, null, '前面框架已经可以通过路由访问了，我们总不可能把业务写在各个路由的回调里面吧，所以需要按一般框架实现MVC.\r\n新增目录application,application目录下新建model，controller，view，开始我们的MVC\r\n进入controller，新增类CommonController\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n\r\n  class CommonController\r\n  {\r\n    public $params = [];\r\n    public function __construct()\r\n    {\r\n      $this->params = $_POST;\r\n    }\r\n  }\r\n?>\r\n```\r\n新增类IndexController继承CommmonController\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n  \r\n  class IndexController extends CommonController\r\n  {\r\n    public function Welcome()\r\n    {\r\n      echo \"hello\";\r\n    }\r\n  }\r\n?>\r\n```\r\n打开config/routes.php，配置路由指向Controller\r\n原来的路由\r\n```php\r\n<?php\r\n\r\n  use NoahBuscher\\Macaw\\Macaw;\r\n\r\n  Macaw::get(\'/\', function() {\r\n    echo \"success\";\r\n  });\r\n  \r\n  Macaw::get(\'(:all)\', function($error) {\r\n    echo \'routes fail\'.$error;\r\n  });\r\n  \r\n  Macaw::dispatch();\r\n?>\r\n```\r\n配置后的路由\r\n```php\r\n<?php\r\n  \r\n  use NoahBuscher\\Macaw\\Macaw;\r\n  \r\n  Macaw::get(\'index/welcome\', \'Application\\controller\\IndexController@Index\');\r\n  \r\n  Macaw::get(\'(:all)\', function ($fu) {\r\n    echo \'invalid routes\' . $fu;\r\n  });\r\n  \r\n  Macaw::dispatch();\r\n?>\r\n```\r\n访问下http://127.0.0.14016/index/welcome，结果\r\n```php\r\nClass \'Application\\controller\\IndexController\' not found\r\n```\r\n为什么呢，原来我们框架还没配置PSR-4规范（也可以用PSR-0规范去处理，但是不推荐）\r\n打开composer.json，配置命名空间指向目录\r\n修改前\r\n```php\r\n{\r\n  \"name\": \"root/sh_framework\",\r\n  \"require\": {\r\n      \"noahbuscher/macaw\": \"dev-master\"\r\n  }\r\n}\r\n```\r\n修改后\r\n```php\r\n{\r\n  \"name\": \"root/framework\",\r\n  \"require\": {\r\n      \"noahbuscher/macaw\": \"dev-master\"\r\n  },\r\n  \"autoload\": {\r\n      \"psr-4\": {\r\n          \"Application\\\\\": \"application/\"\r\n      }\r\n  }\r\n}\r\n```\r\n运行\r\n```bash\r\n/usr/local/bin/php composer.phar dump-autoload\r\n```\r\n\r\n这个时候，就把我们的命名空间指向到对应的目录里面了，继续访问上面的路由看看会不会输出：hello\r\n我们的model也可以使用了，一个简单的api框架已完成。\r\n我们的view可以直接PHP输出，如在view目录下新建welcome.php\r\n\r\n```php\r\n<?php\r\n  echo \"这是一个view\";\r\n?>\r\n```\r\n修改下IndexController的welcome方法，require你的welcome.php\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n\r\n  class IndexController extends CommonController\r\n  {\r\n    public function Welcome()\r\n    {\r\n      require dirname(__FILE__).\'/../view/wecome.php\';\r\n    }\r\n  }\r\n\r\n?>\r\n```\r\n结果会输出：这是一个view。\r\n利用composer引入各种你需要的类库\r\n当我们需要操作mongodb扩展的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require mongodb/mongodb\r\n```\r\n\r\n当我们需要http请求的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require guzzlehttp/guzzle\r\n```\r\n\r\n当我们需要操作redis的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require /usr/local/php/bin/php composer.phar require guzzlehttp/guzzle\r\n```\r\n\r\n至此，一个简单的PHP框架搭建完成。可以继续在这基础上完善自己额外需要的功能，比如加入中间件，加入验证等', null, null, null, null, '1664989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('302', '377', '383', '构建自己的小型PHP框架(二)', null, null, 'nicholas', null, null, '前面框架已经可以通过路由访问了，我们总不可能把业务写在各个路由的回调里面吧，所以需要按一般框架实现MVC.\r\n新增目录application,application目录下新建model，controller，view，开始我们的MVC\r\n进入controller，新增类CommonController\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n\r\n  class CommonController\r\n  {\r\n    public $params = [];\r\n    public function __construct()\r\n    {\r\n      $this->params = $_POST;\r\n    }\r\n  }\r\n?>\r\n```\r\n新增类IndexController继承CommmonController\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n  \r\n  class IndexController extends CommonController\r\n  {\r\n    public function Welcome()\r\n    {\r\n      echo \"hello\";\r\n    }\r\n  }\r\n?>\r\n```\r\n打开config/routes.php，配置路由指向Controller\r\n原来的路由\r\n```php\r\n<?php\r\n\r\n  use NoahBuscher\\Macaw\\Macaw;\r\n\r\n  Macaw::get(\'/\', function() {\r\n    echo \"success\";\r\n  });\r\n  \r\n  Macaw::get(\'(:all)\', function($error) {\r\n    echo \'routes fail\'.$error;\r\n  });\r\n  \r\n  Macaw::dispatch();\r\n?>\r\n```\r\n配置后的路由\r\n```php\r\n<?php\r\n  \r\n  use NoahBuscher\\Macaw\\Macaw;\r\n  \r\n  Macaw::get(\'index/welcome\', \'Application\\controller\\IndexController@Index\');\r\n  \r\n  Macaw::get(\'(:all)\', function ($fu) {\r\n    echo \'invalid routes\' . $fu;\r\n  });\r\n  \r\n  Macaw::dispatch();\r\n?>\r\n```\r\n访问下http://127.0.0.14016/index/welcome，结果\r\n```php\r\nClass \'Application\\controller\\IndexController\' not found\r\n```\r\n为什么呢，原来我们框架还没配置PSR-4规范（也可以用PSR-0规范去处理，但是不推荐）\r\n打开composer.json，配置命名空间指向目录\r\n修改前\r\n```php\r\n{\r\n  \"name\": \"root/sh_framework\",\r\n  \"require\": {\r\n      \"noahbuscher/macaw\": \"dev-master\"\r\n  }\r\n}\r\n```\r\n修改后\r\n```php\r\n{\r\n  \"name\": \"root/framework\",\r\n  \"require\": {\r\n      \"noahbuscher/macaw\": \"dev-master\"\r\n  },\r\n  \"autoload\": {\r\n      \"psr-4\": {\r\n          \"Application\\\\\": \"application/\"\r\n      }\r\n  }\r\n}\r\n```\r\n运行\r\n```bash\r\n/usr/local/bin/php composer.phar dump-autoload\r\n```\r\n\r\n这个时候，就把我们的命名空间指向到对应的目录里面了，继续访问上面的路由看看会不会输出：hello\r\n我们的model也可以使用了，一个简单的api框架已完成。\r\n我们的view可以直接PHP输出，如在view目录下新建welcome.php\r\n\r\n```php\r\n<?php\r\n  echo \"这是一个view\";\r\n?>\r\n```\r\n修改下IndexController的welcome方法，require你的welcome.php\r\n```php\r\n<?php\r\n  namespace Application\\controller;\r\n\r\n  class IndexController extends CommonController\r\n  {\r\n    public function Welcome()\r\n    {\r\n      require dirname(__FILE__).\'/../view/wecome.php\';\r\n    }\r\n  }\r\n\r\n?>\r\n```\r\n结果会输出：这是一个view。\r\n\r\n利用composer引入各种你需要的类库\r\n\r\n当我们需要操作mongodb扩展的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require mongodb/mongodb\r\n```\r\n\r\n当我们需要http请求的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require guzzlehttp/guzzle\r\n```\r\n\r\n当我们需要操作redis的时候\r\n\r\n```bash\r\n/usr/local/php/bin/php composer.phar require /usr/local/php/bin/php composer.phar require guzzlehttp/guzzle\r\n```\r\n\r\n至此，一个简单的PHP框架搭建完成。可以继续在这基础上完善自己额外需要的功能，比如加入中间件，加入验证等', null, null, null, null, '1664889060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('303', '317', '380', '使用supervisor管理项目进程', null, null, 'nicholas', null, null, '##### supervisor管理自己本地项目\r\n\r\n\r\n安装supervisor\r\n\r\n```bash\r\nyum install -y epel-release \r\nyum install -y supervisor  \r\n```\r\n以管理my-stacklifes博客为例，编译生成二进制可执行文件。\r\n\r\n```shell\r\n cd /data/my-stacklifes/server/cmd/frontend/ && /usr/local/go/bin/go build main.go\r\n```\r\n\r\nyum安装完之后，如果存在配置文件，默认放在/etc下面，查看最后一行，可以/etc/supervisord.d/目录下新建对应的项目进程文件。\r\n\r\n```bash\r\ncat /etc/supervisord.conf\r\n[include]\r\nfiles = supervisord.d/*.ini\r\n```\r\n\r\n创建my-stacklifes.ini项目启动文件\r\n\r\n```bash\r\ntouch /etc/supervisord.d/my-stacklifes.ini\r\n```\r\n\r\n配置kaisa.ini项目启动文件\r\n\r\n```bash\r\n# 新建一个应用并设置一个名称，这里设置为 my-stacklifes\r\n[program:my-stacklifes]\r\n# 设置命令在指定的目录内执行，注意输入你的项目所在目录\r\ndirectory=/data/my-stacklifes/server/cmd/frontend/\r\n# 这里为您要管理的项目的启动命令,这里的main是二进制文件\r\ndirectory=/data/my-stacklifes/server/cmd/frontend/main\r\n# 以哪个用户来运行该进程\r\nuser=root\r\n# supervisor 启动时自动该应用\r\nautostart=true\r\n# 进程退出后自动重启进程\r\nautorestart=true\r\n# stderr 日志输出位置\r\nstderr_logfile=/data/my-stacklifes/server/cmd/frontend/stderr.log\r\n# stdout 日志输出位置\r\nstdout_logfile=/data/my-stacklifes/server/cmd/frontend/stdout.log\r\n```\r\n\r\n启动 supervisor\r\n\r\n```bash\r\nsupervisord -c /etc/supervisord.conf\r\n```\r\n\r\n关闭 supervisor\r\n\r\n```bash\r\n supervisorctl shutdown\r\n```\r\n\r\n使用 supervisorctl 管理项目\r\n\r\n```bash\r\n# 启动 my-stacklifes 应用\r\nsupervisorctl start my-stacklifes\r\n# 重启 my-stacklifes 应用\r\nsupervisorctl restart my-stacklifes\r\n# 停止 my-stacklifes 应用\r\nsupervisorctl stop my-stacklifes\r\n# 查看所有被管理项目运行状态\r\nsupervisorctl status\r\n```\r\n\r\n如果修改了配置，执行重新加载配置\r\n\r\n```shell\r\n# 重新加载配置文件\r\nsupervisorctl update\r\n# 重新启动所有程序\r\nsupervisorctl reload\r\n```\r\n\r\n', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('304', '317', '391', 'mongodb安装和配置', null, null, 'nicholas', null, null, 'MongoDB官网\r\nhttps://www.mongodb.com/try/download/community\r\n下载对应版本\r\n```bash\r\nwget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-4.0.28.tgz\r\n```\r\n\r\n解压\r\n\r\n```bash\r\ntar -zxvf mongodb-linux-x86_64-rhel70-4.0.28.tgz \r\n```\r\n\r\n移动解压后的目录\r\n\r\n```bash\r\nmv mongodb-linux-x86_64-rhel70-4.0.28 /usr/local/mongodb4.0\r\n```\r\n\r\n新增日志和数据存放日志目录\r\n\r\n```bash\r\nmkdir -p /data/mongodb/data && \\\r\nmkdir -p /data/mongodb/log\r\n```\r\n\r\n新增配置文件/data/mongodb/mongod.conf，配置的##注释可以去掉，防止格式报错\r\n\r\n```bash\r\ncd /data/mongodb\r\nvi mongod.conf\r\nsystemLog:\r\n  ##指定日志的输出目标为文件。\r\n  destination: file\r\n  path: \"/data/mongodb/log/mongod.log\"\r\n  ##启用日志追加模式，新的日志将追加到现有日志文件末尾。\r\n  logAppend: true\r\nstorage:\r\n  dbPath: \"/data/mongodb/data\"\r\n  journal:\r\n	##启用日志功能，确保数据持久化到磁盘。\r\n    enabled: true\r\n  ##指定存储引擎为WiredTiger。\r\n  engine: wiredTiger\r\n  wiredTiger:\r\n    engineConfig:\r\n	  ##设置WiredTiger的缓存大小为300MB。\r\n      configString : cache_size=300M\r\n	  ##使用单独的目录存储索引文件。\r\n      directoryForIndexes: true\r\nprocessManagement:\r\n  ##以守护进程的方式运行MongoDB，即将其转变为后台进程。\r\n  fork: true\r\nnet:\r\n  bindIp: 127.0.0.1\r\n  port: 23001\r\n```\r\n\r\n启动MongoDB\r\n\r\n```bash\r\n/usr/local/mongodb4.0/bin/mongod --config /data/mongodb/mongod.conf\r\n```\r\n\r\n客户端登录并创建数据库和集合\r\n\r\n```bash\r\n/usr/local/mongodb4.0/bin/mongo 127.0.0.1:23001\r\nuse test\r\ndb.test_user.insertOne({\"uid\":1,\"account\":\"A1\"})\r\ndb.test_user.find()\r\n```\r\n\r\n关闭MongoDB\r\n\r\n```bash\r\n/usr/local/mongodb4.0/bin/mongod --config /data/stacksdk/mongodb/mongod.conf --shutdown\r\n```', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('305', '317', '391', 'mongodb副本集集群配置', null, null, 'nicholas', null, null, 'MongoDB中的副本集(Replica Set)是一组维护相同数据集的mongod服务。副本集可提供冗余和高可用性。也可以说，副本集类似于有自动故障恢复功能的主从集群。通俗的讲就是用多台机器进行同一数据的异步同步，从而使多台机器拥有同一数据的多个副本，并且当主库当掉时在不需要用户干预的情况下自动切换其他备份服务器做主库。而且还可以利用副本服务器做只读服务器，实现读写分离，提高负载。\r\n\r\n副本集有两种类型三种角色\r\n\r\n两种类型\r\n\r\n- 主节点(Primary)类型：数据操作的主要连接点，可读写。\r\n- 次要（辅助、从）节点(Secondaries）类型：数据冗余备份节点，可以读或选举。\r\n\r\n三种角色\r\n\r\n- 主要成员(Primary) ：主要接收所有写操作。就是主节点。\r\n- 副本成员(Replicate)：从主节点通过复制操作以维护相同的数据集，即备份数据，不可写操作，但可以读操作(但需要配置)。是默认的一种从节点类型。\r\n- 仲裁者(Arbiter)：不保留任何数据的副本，只具有投票选举作用。当然也可以将仲裁服务器维护为副本集的一部分，即副本成员同时也可以是仲裁者。也是一种从节点类型。\r\n\r\n创建主节点建立存放数据和日志的目录\r\n\r\n```bash\r\nmkdir -p /data/mongodb/replica_sets/myrs_23001/log \\ &&\r\nmkdir -p /data/mongodb/replica_sets/myrs_23001/db\r\n```\r\n\r\n新建或修改配置文件\r\n\r\n```bash\r\nvim /data/mongodb/replica_sets/myrs_23001/mongod.conf\r\nsystemLog:\r\n  destination: file\r\n  path: /data/mongodb/replica_sets/myrs_23001/log/mongod.log\r\n  logAppend: true\r\nstorage:\r\n  dbPath: /data/mongodb/replica_sets/myrs_23001/db\r\n  journal:\r\n    enabled: true\r\n  engine: wiredTiger\r\n  wiredTiger:\r\n    engineConfig:\r\n      configString: cache_size=300M\r\n      directoryForIndexes: true\r\nprocessManagement:\r\n  fork: true\r\nnet:\r\n  bindIp: 127.0.0.1\r\n  port: 23001\r\nreplication:\r\n  replSetName: myrs\r\n```\r\n\r\n配置解析\r\n\r\n```bash\r\nsystemLog:\r\n  ##指定日志的输出目标为文件。\r\n  destination: file\r\n  path: \"/data/mongodb/replica_sets/myrs_23001/log/mongod.log\"\r\n  ##启用日志追加模式，新的日志将追加到现有日志文件末尾。\r\n  logAppend: true\r\nstorage:\r\n  dbPath: \"/data/mongodb/replica_sets/myrs_23001/db\"\r\n  journal:\r\n	##启用日志功能，确保数据持久化到磁盘。\r\n    enabled: true\r\n  ##指定存储引擎为WiredTiger。\r\n  engine: wiredTiger\r\n  wiredTiger:\r\n    engineConfig:\r\n	  ##设置WiredTiger的缓存大小为300MB。\r\n      configString: cache_size=300M\r\n	  ##使用单独的目录存储索引文件。\r\n      directoryForIndexes: true\r\nprocessManagement:\r\n  ##以守护进程的方式运行MongoDB，即将其转变为后台进程。\r\n  fork: true\r\nnet:\r\n  bindIp: 127.0.0.1\r\n  port: 23001\r\nreplication:\r\n  ##副本集的名称\r\n  replSetName: myrs\r\n```\r\n\r\n和配置第一个副本集一样，继续配置其他两个实例，端口为23002，23002，数据存放目录分别为\r\n\r\n```bash\r\nmkdir -p /data/mongodb/replica_sets/myrs_23002/log \\ &&\r\nmkdir -p /data/mongodb/replica_sets/myrs_23002/db\r\n\r\nmkdir -p /data/mongodb/replica_sets/myrs_23003/log  \\ &&\r\nmkdir -p /data/mongodb/replica_sets/myrs_23003/db\r\n```\r\n\r\n配置完后，分别启动三个服务\r\n\r\n```bash\r\ncd /usr/local/mongodb4.0/bin/\r\n./mongod --config /data/mongodb/replica_sets/myrs_23001/mongod.conf \r\n./mongod --config /data/mongodb/replica_sets/myrs_23002/mongod.conf \r\n./mongod --config /data/mongodb/replica_sets/myrs_23003/mongod.conf\r\n```\r\n\r\n初始化副本集\r\n\r\n使用客户端命令连接任意一个节点，但这里尽量要连接主节点(23001节点)，连接上之后，很多命令无法使用，比如show dbs等，必须初始化副本集才行。\r\n\r\n```bash\r\n./mongo 127.0.0.1:23001\r\n```\r\n\r\n初始化\r\n\r\n```bash\r\nrs.initiate(configuration)\r\nconfiguration:可选，如果没有配置，则使用默认，一般不填。\r\n```\r\n\r\n查看副本集的配置内，返回包含当前副本集配置的文档。\r\n\r\n```bash\r\nrs.conf(configuration)\r\nconfiguration：可选，如果没有配置，则使用默认主节点配置。\r\n```\r\n\r\n添加副本节点\r\n\r\n```bash\r\nrs.add(\"127.0.0.1:23002\")\r\n```\r\n\r\n添加仲裁节点，该节点不存放任何业务数据的,\r\n\r\n```bash\r\nrs.addArb(\"127.0.0.1:23003\")\r\n```\r\n\r\n查看副本集状态\r\n\r\n```bash\r\nrs.status()\r\n```\r\n\r\n集群测试，主节点插入数据\r\n\r\n```bash\r\n./mongo 127.0.0.1:23001\r\nuse test\r\ndb.test_user.insertOne({\"uid\":1,\"account\":\"A1\"})\r\ndb.test_user.find()\r\n```\r\n\r\n登录从节点查看数据\r\n\r\n```bash\r\n./mongo 127.0.0.1:23002\r\nshow dbs;\r\n```\r\n\r\n发现不能读取集合的数据。当前从节点只是一个备份，不是奴隶节点，无法读取数据。因为默认情况下，从节点是没有读写权限的，可以增加读的权限。\r\n\r\n设置为奴隶节点，允许在从成员上运行读的操作语法:\r\n\r\n```bash\r\nrs.slaveok()或者rs.slaveOk(true)//该方法已被弃用\r\n//使用下面的\r\nrs.secondaryOk()\r\n```', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('306', '317', '378', 'mysql安装和配置', null, null, 'nicholas', null, null, '查看是否已经安装\r\n\r\n```bash\r\nrpm -qa |grep -i mysql\r\nrpm -qa |grep -i mariadb\r\n```\r\n\r\n先卸载，卸载对应版本\r\n\r\n```bash\r\n// 普通删除模式。\r\nrpm -e mysql-libs-5.1.52-1.el6_0.1.x86_64　\r\n// 强力删除模式，使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除。\r\nrpm -e --nodeps mysql-libs-5.1.52-1.el6_0.1.x86_64　　\r\nrpm -e --nodeps mariadb-libs-5.5.56-2.el7.x86_64\r\n```\r\n\r\n安装依赖\r\n\r\n```bash\r\nyum install libaio\r\n```\r\n\r\n下载\r\nhttps://downloads.mysql.com/archives/community/\r\n\r\n```bash\r\nwget https://downloads.mysql.com/archives/get/p/23/file/mysql-5.7.44-1.el7.x86_64.rpm-bundle.tar\r\n```\r\n\r\n解压\r\n\r\n```bash\r\ntar -xvf mysql-5.7.44-1.el7.x86_64.rpm-bundle.tar \r\n```\r\n\r\n在mysql的安装文件目录下执行:(必须按照顺序执行)\r\n\r\n```bash\r\nrpm -ivh mysql-community-common-5.7.44-1.el7.x86_64.rpm && \\\r\nrpm -ivh mysql-community-libs-5.7.44-1.el7.x86_64.rpm && \\\r\nrpm -ivh mysql-community-devel-5.7.44-1.el7.x86_64.rpm && \\\r\nrpm -ivh mysql-community-libs-compat-5.7.44-1.el7.x86_64.rpm && \\\r\nrpm -ivh mysql-community-client-5.7.44-1.el7.x86_64.rpm && \\\r\nrpm -ivh mysql-community-server-5.7.44-1.el7.x86_64.rpm \r\n```\r\n\r\n查看版本\r\n\r\n```bash\r\nmysql --version\r\n```\r\n\r\n初始化服务\r\n\r\n为了保证数据库目录与文件的所有者为mysql登录用户，如果你是以root身份运行mysql服务，需要执行下面的命令初始化:\r\n\r\n```bash\r\nmysqld --initialize --user=mysql\r\n```\r\n\r\n说明:--initialize选项默认以\"安全\"模式来初始化，则会为root用户生成一个密码并将该密码标记为过期，登录后你需要设置一个新的密码。生成的临时密码会往日志中记录一份。查看密码:\r\n\r\n```bash\r\ncat /var/log/mysqld.log \r\n```\r\n\r\n查看MySQL服务是否自启动，默认是enabled。\r\n\r\n```bash\r\nsystemctl list-unit-files|grep mysqld.service\r\n设置开机自启动\r\nsystemctl enable mysqld.service\r\n设置开机不自启动\r\nsystemctl disable mysqld.service\r\n```\r\n\r\n启动\r\n\r\n```bash\r\n systemctl start mysqld\r\n```\r\n\r\n登录\r\n\r\n```bash\r\nmysql -uroot -p\r\n```\r\n\r\n修改密码\r\n\r\n```bash\r\nALTER USER \'root\'@\'localhost\' IDENTIFIED BY \'root\';\r\n```\r\n\r\n设置远程链接，查看是否能远程\r\n\r\n```bash\r\ntelnet ip地址 3306\r\n```\r\n\r\n登录mysql客户端，授权允许远程链接\r\n\r\n```bash\r\nuse mysql\r\nupdate user set host=\'%\'  where user =\'root\';\r\n```\r\n\r\nmysql8可能还需要执行下面命令\r\n\r\n```bash\r\nALTER USER \'root\'@\'%\' IDENTIFIED WITH mysql_native_password BY \'abc123\';\r\n```\r\n\r\n刷新权限\r\n\r\n```bash\r\nFLUSH PRIVILEGES;\r\n```\r\n\r\n查看字符集\r\n\r\n```bash\r\nshow variables like \'character%\';\r\n```', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('307', '378', '397', 'debezium采集mongodb数据的到kafka', null, null, 'nicholas', null, null, 'MongoDB连接器使用MongoDB的 oplog来捕获更改，因此该连接器仅适用于MongoDB副本集或分片集群。\r\n下载mongo对应版本的debezium连接器\r\nhttps://debezium.io/releases/1.7/\r\n```bash\r\nwget  https://repo1.maven.org/maven2/io/debezium/debezium-connector-mongodb/1.7.2.Final/debezium-connector-mongodb-1.7.2.Final-plugin.tar.gz\r\n#新建存放连接器目录\r\nmkdir -p /opt/module/debezium/connector\r\n#解压\r\ntar -zxvf debezium-connector-mongodb-1.7.2.Final-plugin.tar.gz -C /opt/module/debezium/connector\r\n```\r\n重启kafka连接器\r\n```bash\r\n/usr/local/kafka3/bin/connect-distributed.sh  -daemon /usr/local/kafka3/config/connect-distributed.properties \r\n```\r\n注册mongodb连接\r\n```bash\r\n#注册信息\r\n{\r\n  \"name\": \"zcr-mongodb-connector\",\r\n  \"config\": {\r\n    \"connector.class\": \"io.debezium.connector.mongodb.MongoDbConnector\",\r\n    \"mongodb.hosts\": \"myrs/127.0.0.1:23001\",\r\n    \"mongodb.name\": \"test\",\r\n    \"collection.include.list\": \".*\"\r\n  }\r\n}\r\n```\r\n注册信息解析\r\n- name：连接器的名称。\r\n- connector.class：指定要使用的连接器类，此处为 MongoDB 连接器。\r\n- mongodb.hosts：MongoDB 主机的地址和端口。\r\n- mongodb.name\": \"test\"：MongoDB 数据库的名称。\r\n- collection.include.list: \"*\"：要包含在监视中的集合列表，此处为 \"*\"，表示所有集合。\r\n\r\n注册mongodb连接器\r\n\r\n```bash\r\ncurl -i -X POST -H \"Accept:application/json\" -H \"Content-Type:application/json\" localhost:8083/connectors/ -d \'{\r\n  \"name\": \"zcr-mongodb-connector\",\r\n  \"config\": {\r\n    \"connector.class\": \"io.debezium.connector.mongodb.MongoDbConnector\",\r\n    \"mongodb.hosts\": \"myrs/127.0.0.1:23001\",\r\n    \"mongodb.name\": \"test\",\r\n    \"collection.include.list\": \".*\"\r\n  }\r\n}\'\r\n#输出\r\nHTTP/1.1 201 Created\r\nDate: Wed, 24 Apr 2024 08:17:13 GMT\r\nLocation: http://localhost:8083/connectors/zcr-mongodb-connector\r\nContent-Type: application/json\r\nContent-Length: 260\r\nServer: Jetty(9.4.48.v20220622)\r\n\r\n#查看限制连接器情况\r\ncurl -H \"Accept:application/json\" localhost:8083/connectors/\r\n[\"zcr-mysql-connector\",\"zcr-mongodb-connector\"]\r\n```\r\n\r\n测试mongo插入一条数据\r\n\r\n```bash\r\ndb.test_table.insert({\"name\": \"test\",\"age\" :30})\r\n```\r\n\r\n消费该数据\r\n\r\n```bash\r\n/usr/local/kafka3/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic  test.test.test_table --from-beginning \r\n{\"schema\":{\"type\":\"struct\",\"fields\":[{\"type\":\"string\",\"optional\":true,\"name\":\"io.debezium.data.Json\",\"version\":1,\"field\":\"after\"},{\"type\":\"string\",\"optional\":true,\"name\":\"io.debezium.data.Json\",\"version\":1,\"field\":\"patch\"},{\"type\":\"string\",\"optional\":true,\"name\":\"io.debezium.data.Json\",\"version\":1,\"field\":\"filter\"},{\"type\":\"struct\",\"fields\":[{\"type\":\"string\",\"optional\":false,\"field\":\"version\"},{\"type\":\"string\",\"optional\":false,\"field\":\"connector\"},{\"type\":\"string\",\"optional\":false,\"field\":\"name\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"ts_ms\"},{\"type\":\"string\",\"optional\":true,\"name\":\"io.debezium.data.Enum\",\"version\":1,\"parameters\":{\"allowed\":\"true,last,false\"},\"default\":\"false\",\"field\":\"snapshot\"},{\"type\":\"string\",\"optional\":false,\"field\":\"db\"},{\"type\":\"string\",\"optional\":true,\"field\":\"sequence\"},{\"type\":\"string\",\"optional\":false,\"field\":\"rs\"},{\"type\":\"string\",\"optional\":false,\"field\":\"collection\"},{\"type\":\"int32\",\"optional\":false,\"field\":\"ord\"},{\"type\":\"int64\",\"optional\":true,\"field\":\"h\"},{\"type\":\"int64\",\"optional\":true,\"field\":\"tord\"},{\"type\":\"string\",\"optional\":true,\"field\":\"stxnid\"}],\"optional\":false,\"name\":\"io.debezium.connector.mongo.Source\",\"field\":\"source\"},{\"type\":\"string\",\"optional\":true,\"field\":\"op\"},{\"type\":\"int64\",\"optional\":true,\"field\":\"ts_ms\"},{\"type\":\"struct\",\"fields\":[{\"type\":\"string\",\"optional\":false,\"field\":\"id\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"total_order\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"data_collection_order\"}],\"optional\":true,\"field\":\"transaction\"}],\"optional\":false,\"name\":\"test.test.test_table.Envelope\"},\"payload\":{\"after\":\"{\\\"_id\\\": {\\\"$oid\\\": \\\"6628c13ba762afd74f035fbb\\\"},\\\"name\\\": \\\"test\\\",\\\"age\\\": 30.0}\",\"patch\":null,\"filter\":null,\"source\":{\"version\":\"1.7.2.Final\",\"connector\":\"mongodb\",\"name\":\"test\",\"ts_ms\":1713946939000,\"snapshot\":\"false\",\"db\":\"test\",\"sequence\":null,\"rs\":\"myrs\",\"collection\":\"test_table\",\"ord\":2,\"h\":4449335239969700278,\"tord\":null,\"stxnid\":null},\"op\":\"c\",\"ts_ms\":1713946939135,\"transaction\":null}}\r\n```', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('308', '378', '397', 'debezium采集mysql数据的到kafka', null, null, 'nicholas', null, null, '下载mysql对应版本的debezium连接器\r\n\r\nhttps://debezium.io/releases/1.7/\r\n\r\n下载\r\n\r\n```bash\r\nwget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/1.7.2.Final/debezium-connector-mysql-1.7.2.Final-plugin.tar.gz\r\n#新建存放连接器目录\r\nmkdir -p /opt/module/debezium/connector\r\n#解压\r\ntar -zxvf debezium-connector-mysql-1.7.2.Final-plugin.tar.gz  -C /opt/module/debezium/connector\r\n```\r\n\r\nMysq需要开启binlog\r\n\r\n编辑my . cnf文件在[mysqld]选项中，，binlog_format指定mysql的binlog日志格式，必须是row格式\r\n\r\n```sql\r\nlog_bin=mysql_bin\r\nbinlog_format=row\r\n```\r\n\r\n创建测试数据库表\r\n\r\n```sql\r\nCREATE DATABASE test;\r\n\r\nCREATE TABLE `cap_table` (\r\n  `id` int(11) NOT NULL AUTO_INCREMENT,\r\n  `name` varchar(10) NOT NULL,\r\n  `status` char(1) DEFAULT \'1\',\r\n  PRIMARY KEY (`id`)\r\n) ENGINE=InnoDB ;\r\n\r\ninsert into cap_table (`name`,status)  value(\'张三\', 1);\r\n```\r\n\r\n配置kafka插件连接器\r\n\r\n```bash\r\nvim /usr/local/kafka3/config/connect-distributed.properties\r\n#kafka集群地址\r\nbootstrap.servers=localhost:9092,localhost:9093\r\n#配置监听插件的路径\r\nplugin.path=/opt/module/debezium/connector\r\n```\r\n\r\nkafka 启动连接器\r\n\r\n```bash\r\n/usr/local/kafka3/bin/kafka-server-start.sh -daemon  /usr/local/kafka3/config/kraft/server.properties\r\n/usr/local/kafka3/bin/connect-distributed.sh  -daemon /usr/local/kafka3/config/connect-distributed.properties \r\n```\r\n\r\n查看连接器启动日志\r\n\r\n```bash\r\ncat /usr/local/kafka3/logs/connectDistributed.out \r\n```\r\n\r\n检测kafka连接器的服务状态，Debezium服务器的默认HTTP端口为8083\r\n\r\n```bash\r\ncurl -H \"Accept:application/json\" localhost:8083/\r\n#正常输出\r\n{\"version\":\"3.3.1\",\"commit\":\"e23c59d00e687ff5\",\"kafka_cluster_id\":\"4guwVNnTTeK_C3ILOsy49g\"}\r\n```\r\n\r\n检查向Kafka Connect 注册的连接器列表\r\n\r\n```bash\r\ncurl -H \"Accept:application/json\" localhost:8083/connectors/\r\n#正常输出,因为还没注册\r\n[]\r\n```\r\n\r\nkafka注册mysql连接器\r\n\r\n```bash\r\n#注册信息\r\n{\r\n  \"name\": \"zcr-mysql-connector\",\r\n  \"config\": {\r\n    \"connector.class\": \"io.debezium.connector.mysql.MySqlConnector\",\r\n    \"database.hostname\": \"localhost\",\r\n    \"database.port\": 3306,\r\n    \"database.user\": \"root\",\r\n    \"database.password\": \"new_password\",\r\n    \"database.server.id\": \"2024\",\r\n    \"database.server.name\": \"bigdata\",\r\n    \"database.include.list\": \"test\",\r\n    \"database.history.kafka.bootstrap.servers\": \"localhost:9092\",\r\n    \"database.history.kafka.topic\": \"schema-changes.inventory\"\r\n  }\r\n}\r\n```\r\n\r\n说明:\r\n\r\n- name:连接器名字\r\n- database.include.list：要监控的数据库列表\r\n- database.server.name ：服务器名，会成为topic 的前缀\r\n\r\n发送请求向kafka注册mysql连接器\r\n\r\n```bash\r\ncurl -i -X POST -H \"Accept:application/json\" -H \"Content-Type:application/json\" localhost:8083/connectors/ -d \'{\r\n  \"name\": \"zcr-mysql-connector\",\r\n  \"config\": {\r\n    \"connector.class\": \"io.debezium.connector.mysql.MySqlConnector\",\r\n    \"database.hostname\": \"localhost\",\r\n    \"database.port\": 3306,\r\n    \"database.user\": \"root\",\r\n    \"database.password\": \"root\",\r\n    \"database.server.id\": \"2024\",\r\n    \"database.server.name\": \"bigdata\",\r\n    \"database.include.list\": \"test\",\r\n    \"database.history.kafka.bootstrap.servers\": \"localhost:9092\",\r\n    \"database.history.kafka.topic\": \"schema-changes.inventory\"\r\n  }\r\n}\'\r\n#成功返回\r\nHTTP/1.1 201 Created\r\nDate: Wed, 24 Apr 2024 07:51:18 GMT\r\nLocation: http://localhost:8083/connectors/zcr-mysql-connector\r\nContent-Type: application/json\r\nContent-Length: 483\r\nServer: Jetty(9.4.48.v20220622)\r\n\r\n#查看限制连接器情况\r\ncurl -H \"Accept:application/json\" localhost:8083/connectors/\r\n[\"zcr-mysql-connector\"]\r\n```\r\n\r\n查看当前topic\r\n\r\n```bash\r\n/usr/local/kafka3/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list\r\n__consumer_offsets\r\n\r\n可以看到有个bigdata.test.cap_table的topic\r\n```\r\n\r\n消费该topic\r\n\r\n```bash\r\n/usr/local/kafka3/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic bigdata.test.cap_table\r\n```\r\n\r\n往mysql插入数据\r\n\r\n```bash\r\ninsert into cap_table (`name`,status)  value(\'test\', 1);\r\n```\r\n\r\n上面的消费能看到具体的消费情况\r\n\r\n```bash\r\n{\"schema\":{\"type\":\"struct\",\"fields\":[{\"type\":\"struct\",\"fields\":[{\"type\":\"int32\",\"optional\":false,\"field\":\"id\"},{\"type\":\"string\",\"optional\":false,\"field\":\"name\"},{\"type\":\"string\",\"optional\":true,\"default\":\"1\",\"field\":\"status\"}],\"optional\":true,\"name\":\"bigdata.test.cap_table.Value\",\"field\":\"before\"},{\"type\":\"struct\",\"fields\":[{\"type\":\"int32\",\"optional\":false,\"field\":\"id\"},{\"type\":\"string\",\"optional\":false,\"field\":\"name\"},{\"type\":\"string\",\"optional\":true,\"default\":\"1\",\"field\":\"status\"}],\"optional\":true,\"name\":\"bigdata.test.cap_table.Value\",\"field\":\"after\"},{\"type\":\"struct\",\"fields\":[{\"type\":\"string\",\"optional\":false,\"field\":\"version\"},{\"type\":\"string\",\"optional\":false,\"field\":\"connector\"},{\"type\":\"string\",\"optional\":false,\"field\":\"name\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"ts_ms\"},{\"type\":\"string\",\"optional\":true,\"name\":\"io.debezium.data.Enum\",\"version\":1,\"parameters\":{\"allowed\":\"true,last,false\"},\"default\":\"false\",\"field\":\"snapshot\"},{\"type\":\"string\",\"optional\":false,\"field\":\"db\"},{\"type\":\"string\",\"optional\":true,\"field\":\"sequence\"},{\"type\":\"string\",\"optional\":true,\"field\":\"table\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"server_id\"},{\"type\":\"string\",\"optional\":true,\"field\":\"gtid\"},{\"type\":\"string\",\"optional\":false,\"field\":\"file\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"pos\"},{\"type\":\"int32\",\"optional\":false,\"field\":\"row\"},{\"type\":\"int64\",\"optional\":true,\"field\":\"thread\"},{\"type\":\"string\",\"optional\":true,\"field\":\"query\"}],\"optional\":false,\"name\":\"io.debezium.connector.mysql.Source\",\"field\":\"source\"},{\"type\":\"string\",\"optional\":false,\"field\":\"op\"},{\"type\":\"int64\",\"optional\":true,\"field\":\"ts_ms\"},{\"type\":\"struct\",\"fields\":[{\"type\":\"string\",\"optional\":false,\"field\":\"id\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"total_order\"},{\"type\":\"int64\",\"optional\":false,\"field\":\"data_collection_order\"}],\"optional\":true,\"field\":\"transaction\"}],\"optional\":false,\"name\":\"bigdata.test.cap_table.Envelope\"},\"payload\":{\"before\":null,\"after\":{\"id\":5,\"name\":\"test\",\"status\":\"1\"},\"source\":{\"version\":\"1.7.2.Final\",\"connector\":\"mysql\",\"name\":\"bigdata\",\"ts_ms\":1713945547000,\"snapshot\":\"false\",\"db\":\"test\",\"sequence\":null,\"table\":\"cap_table\",\"server_id\":1,\"gtid\":null,\"file\":\"mysql_bin.000001\",\"pos\":2095,\"row\":0,\"thread\":null,\"query\":null},\"op\":\"c\",\"ts_ms\":1713945547830,\"transaction\":null}}\r\n```', null, null, null, null, '1665989060', null, null, null, null);
INSERT INTO `sl_article` VALUES ('309', '372', '392', 'golang处理json处理', null, null, 'nicholas', null, null, 'golang提供了json处理的标准库encoding/json处理，对于结构体，转为json，属性和结构体必须是公有的。\r\n\r\n```go\r\ntype Stu struct {\r\n	ID     int      `json:\"id\"`\r\n	Sex    int      `json:\"sex\"`\r\n	Name   string   `json:\"name\"`\r\n	Number string   `json:\"number\"`\r\n	Hobby  []string `json:\"hobby\"`\r\n	Addr   Address  `json:\"address\"`\r\n}\r\ntype Address struct {\r\n	AddrName string\r\n	Phone    string\r\n}\r\n```\r\n\r\n结构体转json。\r\n\r\n```go\r\nvar stu = Stu{\r\n	ID:     1,\r\n	Sex:    2,\r\n	Name:   \"小明\",\r\n	Number: \"N123456\",\r\n	Hobby:  []string{\"写代码\", \"足球\"},\r\n}\r\nstu.Addr = Address{\r\n	AddrName: \"test\",\r\n	Phone:    \"123456789\",\r\n}\r\n\r\n//返回的是一个byte类型的切片\r\nstuByte, _ := json.Marshal(stu)\r\nstuJson := string(stuByte)\r\nfmt.Printf(\"%v\\n\", stuJson)\r\n```\r\n\r\njson转结构体。\r\n\r\n```go\r\nvar stuStr = `{\"id\":1,\"sex\":2,\"name\":\"小明\",\"number\":\"N123456\",\"hobby\":[\"写代码\",\"足球\"],\"address\":{\"AddrName\":\"test\",\"Phone\":\"123456789\"}}`\r\nvar stuStruct Stu\r\n//应该要修改stuStruct的值，所以需要传入地址\r\nerr := json.Unmarshal([]byte(stuStr), &stuStruct)\r\nif err != nil {\r\n	fmt.Printf(\"%v\\n\", err)\r\n}\r\nfmt.Printf(\"%#v\\n\", stuStruct)\r\n```\r\n\r\n还有一些更方便的json处理库，例如\r\nhttps://github.com/tidwall/gjson\r\n\r\n嵌套json字符串的提取。\r\n\r\n```go\r\nvar json = `{\"name\":{\"first\":\"Janet\",\"last\":\"Prichard\"},\"age\":47}`\r\nlast := gjson.Get(json, \"name.last\")\r\nage := gjson.Get(json, \"age\")\r\nfmt.Printf(\"last=%v,last-type=%T\\n\", last.String(), last.String())\r\nfmt.Printf(\"age=%v,age-type=%T\\n\", age.Int(), age.Int())\r\n```\r\n\r\n聚合计算\r\n\r\n```go\r\njsonData := `{\r\n	\"products\": [\r\n		{\"name\": \"苹果\", \"money\": 11},\r\n		{\"name\": \"香蕉\", \"money\": 1},\r\n		{\"name\": \"橘子\", \"money\": 1},\r\n	]\r\n}`\r\n\r\nresult := gjson.Get(jsonData, \"products.#(money < 2)\")\r\ncheapProducts := result.Array()\r\nfmt.Println(\"便宜的水果:\", cheapProducts)\r\n```', null, null, null, null, '1665989060', null, null, null, null);

-- ----------------------------
-- Table structure for sl_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `sl_article_tags`;
CREATE TABLE `sl_article_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL,
  `tid` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8mb3 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_article_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sl_attach
-- ----------------------------
DROP TABLE IF EXISTS `sl_attach`;
CREATE TABLE `sl_attach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '素材类型，1图片，2视频',
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sl_attach
-- ----------------------------

-- ----------------------------
-- Table structure for sl_category
-- ----------------------------
DROP TABLE IF EXISTS `sl_category`;
CREATE TABLE `sl_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `parent` varchar(255) DEFAULT '0',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `weight` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb3 COMMENT='菜单';

-- ----------------------------
-- Records of sl_category
-- ----------------------------
INSERT INTO `sl_category` VALUES ('370', '1', '0', 'redis', 'nicholas', 'Redis', '4', '1', '1686381488', '1706892828');
INSERT INTO `sl_category` VALUES ('371', '1', '0', 'env', 'nicholas', '环境配置', '5', '1', '1686381680', null);
INSERT INTO `sl_category` VALUES ('372', '1', '0', 'golang', 'nicholas', 'Golang', '1', '1', '1686586781', '1706892837');
INSERT INTO `sl_category` VALUES ('373', '1', '0', 'python', 'nicholas', 'StackSdk', '6', '1', '1686587161', '1686587886');
INSERT INTO `sl_category` VALUES ('375', '1', '0', 'mysq', 'nicholas', 'Mysql', '3', '1', '1686587492', null);
INSERT INTO `sl_category` VALUES ('377', '1', '0', 'php', 'nicholas', 'PHP', '2', '1', '1686587492', null);
INSERT INTO `sl_category` VALUES ('378', '1', '0', 'data', 'nicholas', '数据处理', '5', '1', '1686587492', null);

-- ----------------------------
-- Table structure for sl_comment
-- ----------------------------
DROP TABLE IF EXISTS `sl_comment`;
CREATE TABLE `sl_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_reply` int DEFAULT NULL,
  `content` text,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_comment
-- ----------------------------

-- ----------------------------
-- Table structure for sl_directory
-- ----------------------------
DROP TABLE IF EXISTS `sl_directory`;
CREATE TABLE `sl_directory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `cid` int DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `parent` varchar(255) DEFAULT '0',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `weight` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb3 COMMENT='菜单';

-- ----------------------------
-- Records of sl_directory
-- ----------------------------
INSERT INTO `sl_directory` VALUES ('377', '371', null, '0', null, 'nicholas', 'redis', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('378', '371', null, '0', null, 'nicholas', 'mysql', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('379', '371', null, '0', null, 'nicholas', 'nginx', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('380', '371', null, '0', null, 'nicholas', 'CI/CD', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('381', '371', null, '0', null, 'nicholas', 'golang', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('382', '371', null, '0', null, 'nicholas', 'php', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('383', '377', null, '0', null, 'nicholas', '构建一个PHP框架', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('384', '372', null, '0', null, 'nicholas', 'gin开发框架', '6', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('385', '375', null, '0', null, 'nicholas', '索引', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('386', '375', null, '0', null, 'nicholas', '事务', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('387', '373', null, '0', null, 'nicholas', '后台开发', '2', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('388', '373', null, '0', null, 'nicholas', 'api开发', '3', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('389', '373', null, '0', null, 'nicholas', '数据清洗', '4', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('390', '373', null, '0', null, 'nicholas', '架构设计', '1', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('391', '371', null, '0', null, 'nicholas', 'MongoDB', '0', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('392', '372', null, '0', null, 'nicholas', '常用库', '5', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('393', '372', null, '0', null, 'nicholas', 'GC机制', '4', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('394', '372', null, '0', null, 'nicholas', 'GMP模型', '3', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('395', '372', null, '0', null, 'nicholas', '协程', '2', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('396', '372', null, '0', null, 'nicholas', '面向对象', '1', '1', '0', null);
INSERT INTO `sl_directory` VALUES ('397', '378', null, '0', null, 'nicholas', 'CDC', '1', '1', '0', null);

-- ----------------------------
-- Table structure for sl_lang
-- ----------------------------
DROP TABLE IF EXISTS `sl_lang`;
CREATE TABLE `sl_lang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `default` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

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
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '日志表自增id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '简要描述',
  `create_time` int DEFAULT '0' COMMENT '创建时间',
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3 COMMENT='日志表';

-- ----------------------------
-- Records of sl_log
-- ----------------------------

-- ----------------------------
-- Table structure for sl_log_fail
-- ----------------------------
DROP TABLE IF EXISTS `sl_log_fail`;
CREATE TABLE `sl_log_fail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '登录名',
  `ip` varchar(128) DEFAULT NULL COMMENT '登录ip',
  `content` varchar(64) DEFAULT NULL COMMENT '错误信息',
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_ip` (`username`,`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sl_log_fail
-- ----------------------------

-- ----------------------------
-- Table structure for sl_menu
-- ----------------------------
DROP TABLE IF EXISTS `sl_menu`;
CREATE TABLE `sl_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '链接',
  `parent` int NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `icon` varchar(128) DEFAULT '' COMMENT '菜单图标',
  `weight` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `parent` (`parent`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb3 COMMENT='菜单';

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
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_reply` tinyint DEFAULT NULL,
  `content` text,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='留言表';

-- ----------------------------
-- Records of sl_message
-- ----------------------------

-- ----------------------------
-- Table structure for sl_permit
-- ----------------------------
DROP TABLE IF EXISTS `sl_permit`;
CREATE TABLE `sl_permit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '权限表自增id',
  `type` char(10) NOT NULL DEFAULT '' COMMENT '类型：央服center、单服single',
  `parent` varchar(100) NOT NULL DEFAULT '' COMMENT '权限分组名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '权限名称',
  `modules` text COMMENT '模块',
  `status` int DEFAULT '1',
  `create_time` int DEFAULT '0' COMMENT '创建时间',
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb3 COMMENT='权限表';

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
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1431 DEFAULT CHARSET=utf8mb3 COMMENT='文章栏目关联表';

-- ----------------------------
-- Records of sl_read
-- ----------------------------
INSERT INTO `sl_read` VALUES ('1430', '296', 'http://172.16.50.47:8080/', '172.16.50.35', '0', '0');

-- ----------------------------
-- Table structure for sl_tags
-- ----------------------------
DROP TABLE IF EXISTS `sl_tags`;
CREATE TABLE `sl_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(16) DEFAULT NULL COMMENT '菜单类型，中央服，单服',
  `mark` varchar(60) DEFAULT NULL,
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `weight` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int DEFAULT '0' COMMENT '创建菜单时间戳',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mark` (`mark`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE,
  KEY `type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb3 COMMENT='菜单';

-- ----------------------------
-- Records of sl_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sl_website
-- ----------------------------
DROP TABLE IF EXISTS `sl_website`;
CREATE TABLE `sl_website` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(32) DEFAULT NULL,
  `value` text,
  `update_time` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of sl_website
-- ----------------------------
