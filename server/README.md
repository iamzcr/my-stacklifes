# my-stacklifes

#### 线上地址

http://iamzcr.com

#### 技术栈

服务端：golang1.22

数据库：redis6.0+，mysql5.7+

frontend服务ui模板：https://designmodo.github.io/Flat-UI/

admin服务ui模板：https://github.com/ColorlibHQ/gentelella

富文本编辑器：https://ui.toast.com/

#### 下载项目

git clone https://github.com/iamzcr/my-stacklifes.git

#### 项目配置

```sh
cd my-stacklifes/server/conf
vim conf.yml
```

#### 复制.env.explame到.env

目前frontend端口和mysql密码，支持配置在.env，分别为：

```shell
APP_FRONTEND_LISTEN_PORT=:8080
MYSQL_PASSWORD=root123456
```

不配置.env，默认读取`my-stacklifes/server/conf/conf.yml`配置文件

#### admin服务运行

```sh
cd my-stacklifes/server/cmd/admin
go run main.go
```

#### frontend服务运行

```sh
cd my-stacklifes/server/cmd/frontend
go run main.go
```

#### 使用supervisor，以管理frontend服务为例

```shell
cd my-stacklifes/server/cmd/frontend
#生成二进制可执行文件
/usr/local/go/bin/go build main.go
```

添加配置

```shell
[program:my-stacklifes]
directory=/存放目录/my-stacklifes/server/cmd/frontend/
command=/存放目录/my-stacklifes/server/cmd/frontend/main 
user=root
autostart=true
autorestart=true
stderr_logfile=/存放目录/my-stacklifes/server/cmd/frontend/stderr.log
stdout_logfile=/存放目录/my-stacklifes/server/cmd/frontend/stdout.log
```

启动服务

```shell
supervisorctl restart my-stacklifes
```

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) 2023-present, IAMZCR
