package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/service/frontend"
	"net/http"
)

func FrontendRoutersInit(r *gin.Engine) {
	FrontendRouter := r.Group("/api") //可以加载这个后面
	{
		FrontendRouter.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, map[string]interface{}{
				"success": true,
				"msg":     "api",
			})
		})
		FrontendRouter.GET("/articles", frontend.ArticleList)
		FrontendRouter.GET("/articles/detail", frontend.ArticleDetail)
	}
}
