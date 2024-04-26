package routers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func AdminRoutersInit(r *gin.Engine) {
	AdminRouter := r.Group("/admin") //可以加载这个后面
	{
		AdminRouter.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, map[string]interface{}{
				"success": true,
				"msg":     "admin",
			})
		})
	}
}
