package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {

	r := gin.Default()
	r.LoadHTMLGlob("../../templates/admin/**/*")
	r.Static("/static", "../../templates/assets/admin")
	r.GET("/admin", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index/index", gin.H{
			"message": "test",
		})
	})
	//启动web服务
	err := r.Run("8081")
	if err != nil {
		fmt.Println("admin run err:", err)
		return
	}
}
