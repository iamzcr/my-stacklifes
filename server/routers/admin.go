package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
	"net/http"
)

func AdminRoutersInit(r *gin.Engine) {
	loginHandler := admin.NewLoginHandler()
	AdminRouter := r.Group("/admin") //可以加载这个后面
	{
		AdminRouter.POST("/login", loginHandler.Login)
		AdminRouter.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, map[string]interface{}{
				"success": true,
				"msg":     "admin",
			})
		})
	}
}
