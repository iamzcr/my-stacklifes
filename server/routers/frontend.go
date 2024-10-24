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
		c.Set("navs", middleware.GetFrontendNav(c))
		c.Set("hotArticles", middleware.GetFrontendHotArticles(c))
		c.Next()
	})

	articleHandler := frontend.NewArticleHandler()
	indexHandler := frontend.NewIndexHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	r.GET("/", indexHandler.Index)
	r.GET("/article", articleHandler.ArticleList)
	r.GET("/category/:id", articleHandler.CategoryArticleList)
	r.GET("/tag/id/:id", articleHandler.TagsArticleList)
	r.GET("/article/detail/:cid/:id", articleHandler.ArticleDetail)
	r.POST("/message/create", messageHandler.Create)
	r.POST("/comment/create", commentHandler.Create)
}
