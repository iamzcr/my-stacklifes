package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"html/template"
	"net/http"
	"test_template/tools"
)

func main() {

	r := gin.Default()

	//自定义模板函数  注意要把这个函数放在加载模板前
	r.SetFuncMap(template.FuncMap{
		"UnixToTime": tools.UnixToTime,
	})
	r.LoadHTMLGlob("../../templates/frontend/*")

	r.Static("/static", "../../templates/assets/frontend")
	r.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index", gin.H{
			"message": "test",
		})
	})
	//启动web服务
	err := r.Run(":8080")
	if err != nil {
		fmt.Println("frontend run err:", err)
		return
	}
}
