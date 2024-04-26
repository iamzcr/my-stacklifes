package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
	"net/http"
)

func FrontendRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	frontendRouter := r.Group("/api") //可以加载这个后面
	{
		frontendRouter.GET("/", func(c *gin.Context) {
			c.JSON(http.StatusOK, map[string]interface{}{
				"success": true,
				"msg":     "api",
			})
		})
		frontendRouter.GET("/article", articleHandler.ArticleList)
		frontendRouter.GET("/articles/detail/:id", articleHandler.ArticleDetail)
	}
}
