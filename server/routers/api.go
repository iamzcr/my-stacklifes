package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
)

func ApiRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	websiteHandler := frontend.NewWebsiteHandler()
	navHandler := frontend.NewNavHandler()
	apiRouter := r.Group("api") //可以加载这个后面
	{
		apiRouter.GET("/article", articleHandler.ArticleList)
		apiRouter.GET("/category/:id", articleHandler.CategoryArticleList)
		apiRouter.GET("/tag/:id", articleHandler.TagsArticleList)
		apiRouter.GET("/article/detail/:id", articleHandler.ArticleDetail)
		apiRouter.GET("/nav", navHandler.GetNavList)
		apiRouter.GET("/website", websiteHandler.WebsiteFrontendList)

		apiRouter.POST("/message", messageHandler.Update)
		apiRouter.POST("/comment", commentHandler.Update)
	}
}
