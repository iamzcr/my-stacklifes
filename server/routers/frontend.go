package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
)

func FrontendRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	websiteHandler := frontend.NewWebsiteHandler()
	navHandler := frontend.NewNavHandler()
	frontendRouter := r.Group("/api") //可以加载这个后面
	{
		frontendRouter.GET("/article", articleHandler.ArticleList)
		frontendRouter.GET("/category/:id", articleHandler.CategoryArticleList)
		frontendRouter.GET("/tag/:id", articleHandler.ArticleList)
		frontendRouter.GET("/article/detail/:id", articleHandler.ArticleDetail)
		frontendRouter.GET("/nav", navHandler.GetNavList)
		frontendRouter.GET("/website", websiteHandler.FrontendList)

		frontendRouter.POST("/message", messageHandler.Update)
		frontendRouter.POST("/comment", commentHandler.Update)
	}
}
