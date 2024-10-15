package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/frontend"
	"my-stacklifes/middleware"
)

func FrontendRoutersInit(r *gin.Engine) {
	// 共享数据
	r.Use(func(c *gin.Context) {
		c.Set("tags", middleware.GetFrontendTags(c))
		c.Set("nav", middleware.GetFrontendNav(c))
		c.Next()
	})

	articleHandler := frontend.NewArticleHandler()
	indexHandler := frontend.NewIndexHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	websiteHandler := frontend.NewWebsiteHandler()
	navHandler := frontend.NewNavHandler()

	r.GET("/", indexHandler.Index)
	r.GET("/article", articleHandler.ArticleList)
	r.GET("/category/:id", articleHandler.CategoryArticleList)
	r.GET("/tag/:id", articleHandler.TagsArticleList)
	r.GET("/article/detail/:id", articleHandler.ArticleDetail)
	r.GET("/nav", navHandler.GetNavList)
	r.GET("/website", websiteHandler.WebsiteFrontendList)
	r.POST("/message", messageHandler.Update)
	r.POST("/comment", commentHandler.Update)
}
