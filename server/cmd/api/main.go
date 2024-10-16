package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/spf13/pflag"
	"my-stacklifes/conf"
	"my-stacklifes/database/mysql"
	"my-stacklifes/loggers"
	"my-stacklifes/routers"
)

func main() {
	//初始化配置
	pflag.Parse()
	appConfig, err := conf.InitConfig()
	if err != nil {
		fmt.Println("config init:", err)
	}

	//初始化mysql
	err = mysql.InitMysql(&appConfig.MySQL)
	if err != nil {
		fmt.Println("mysql init:", err)
	}

	// init logger
	loggers.InitLogger(&appConfig.Loggers)
	loggers.Info("http server startup")

	r := gin.Default()
	r.LoadHTMLGlob("../../templates/frontend/*")
	//路由分组
	//路由分组抽离成文件，注册路由
	routers.ApiRoutersInit(r)
	fmt.Println("app_config:", appConfig)
	//启动web服务
	err = r.Run(appConfig.Common.FrontendListenPort)
	if err != nil {
		fmt.Println("frontend run err:", err)
		return
	}
}
