package main

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/routers"
)

func main() {

	r := gin.Default()

	//路由分组
	//路由分组抽离成文件，注册路由
	routers.FrontendRoutersInit(r)
	//启动web服务
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
