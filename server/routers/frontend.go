package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
)

func FrontendRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	indexHandler := frontend.NewIndexHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	websiteHandler := frontend.NewWebsiteHandler()
	navHandler := frontend.NewNavHandler()
	frontendRouter := r.Group("/", indexHandler.Index) //可以加载这个后面
	{
		frontendRouter.GET("/article", articleHandler.ArticleList)
		frontendRouter.GET("/category/:id", articleHandler.CategoryArticleList)
		frontendRouter.GET("/tag/:id", articleHandler.TagsArticleList)
		frontendRouter.GET("/article/detail/:id", articleHandler.ArticleDetail)
		frontendRouter.GET("/nav", navHandler.GetNavList)
		frontendRouter.GET("/website", websiteHandler.WebsiteFrontendList)

		frontendRouter.POST("/message", messageHandler.Update)
		frontendRouter.POST("/comment", commentHandler.Update)
	}
}
