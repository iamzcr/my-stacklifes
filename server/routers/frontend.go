package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
)

func FrontendRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	messageHandler := frontend.NewMessageHandler()
	frontendRouter := r.Group("/api") //可以加载这个后面
	{
		frontendRouter.GET("/tags", articleHandler.ArticleList)
		frontendRouter.GET("/article", articleHandler.ArticleList)
		frontendRouter.POST("/message", messageHandler.Update)
		frontendRouter.GET("/articles/detail/:id", articleHandler.ArticleDetail)
	}
}
