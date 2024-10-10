package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/spf13/pflag"
	"my-stacklifes/conf"
	"my-stacklifes/database/mysql"
	"my-stacklifes/database/redis"
	"my-stacklifes/loggers"
	"my-stacklifes/routers"
)

func main() {
	pflag.Parse()
	appConfig, err := conf.InitConfig()
	//初始化配置
	if err != nil {
		fmt.Println("config init:", err)
	}
	fmt.Println(appConfig)

	//初始化mysql
	err = mysql.InitMysql(&appConfig.MySQL)
	if err != nil {
		fmt.Println("mysql init:", err)
	}

	//初始化redis
	err = redis.InitRedis(&appConfig.Redis)
	if err != nil {
		fmt.Println("mysql init:", err)
	}

	// init logger
	loggers.InitLogger(&appConfig.Loggers)
	loggers.Info("http server startup")

	r := gin.Default()

	//路由分组抽离成文件，注册路由
	routers.AdminRoutersInit(r)
	//启动web服务
	err = r.Run(appConfig.Common.AdminListenPort)
	if err != nil {
		fmt.Println("admin run err:", err)
		return
	}
}
