package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/spf13/pflag"
	"html/template"
	"my-stacklifes/conf"
	"my-stacklifes/database/mysql"
	"my-stacklifes/loggers"
	"my-stacklifes/pkg/tools"
	"my-stacklifes/routers"
)

func main() {
	//初始化配置
	pflag.Parse()
	appConfig, err := conf.InitConfig()
	fmt.Println(appConfig)
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

	//自定义模板函数  注意要把这个函数放在加载模板前
	r.SetFuncMap(template.FuncMap{
		"UnixToTime": tools.UnixToTime,
	})
	r.LoadHTMLGlob("../../templates/frontend/*")

	r.Static("/static", "../../templates/assets/frontend")
	//路由分组
	//路由分组抽离成文件，注册路由
	routers.FrontendRoutersInit(r)
	//启动web服务
	err = r.Run(appConfig.Common.FrontendListenPort)
	if err != nil {
		fmt.Println("frontend run err:", err)
		return
	}
}
