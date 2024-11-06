package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"html/template"
	"net/http"
	"test_template/tools"
	"time"
)

func main() {

	r := gin.Default()
	//自定义模板函数  注意要把这个函数放在加载模板前
	r.SetFuncMap(template.FuncMap{
		"UnixToTime": tools.UnixToTime,
	})
	r.LoadHTMLGlob("../../templates/frontend/*")
	r.Static("/static", "../../templates/assets/frontend")
	r.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", gin.H{
			"message": "test",
			"time":    time.Now().Unix(), //分配时间戳到模板
		})
	})
	//启动web服务
	err := r.Run(":8089")
	if err != nil {
		fmt.Println("frontend run err:", err)
		return
	}
}
