package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"html/template"
	"net/http"
	"test_template/tools"
)

type Test struct {
	Name string
	Age  int8
}

var AssignTest []Test

func main() {

	r := gin.Default()
	//自定义模板函数  注意要把这个函数放在加载模板前
	r.SetFuncMap(template.FuncMap{
		"UnixToTime": tools.UnixToTime,
	})
	r.LoadHTMLGlob("../../templates/frontend/*")
	r.Static("/static", "../../templates/assets/frontend")

	assignTest := append(AssignTest, Test{Name: "test", Age: 10}, Test{Name: "test1", Age: 20})
	r.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.html", gin.H{
			"assignTest": assignTest,
		})
	})
	//启动web服务
	err := r.Run(":8089")
	if err != nil {
		fmt.Println("frontend run err:", err)
		return
	}
}
