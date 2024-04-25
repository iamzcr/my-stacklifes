package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/service/frontend"
	"net/http"
)

func AdminRoutersInit(r *gin.Engine) {
	AdminRouter := r.Group("/api") //可以加载这个后面
	{
		AdminRouter.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, map[string]interface{}{
				"success": true,
				"msg":     "api",
			})
		})
		AdminRouter.GET("/articles", frontend.ArticleList)
		AdminRouter.GET("/articles/detail", frontend.ArticleDetail)
	}
}
