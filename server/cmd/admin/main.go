package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/conf"
	"my-stacklifes/database/mysql"
	"my-stacklifes/database/redis"
	"my-stacklifes/routers"
)

func main() {
	//初始化配置
	err := conf.InitConfig()
	if err != nil {
		fmt.Println("config init:", err)
	}
	//初始化mysql
	err = mysql.InitMysql()
	if err != nil {
		fmt.Println("mysql init:", err)
	}
	//初始化redis
	err = redis.InitRedis()
	if err != nil {
		fmt.Println("redis init:", err)
	}
	r := gin.Default()

	//路由分组
	//路由分组抽离成文件，注册路由
	routers.AdminRoutersInit(r)
	//启动web服务
	err = r.Run(conf.AppConfig.Common.AdminListenPort)
	if err != nil {
		fmt.Println("admin run err:", err)
		return
	}
}
