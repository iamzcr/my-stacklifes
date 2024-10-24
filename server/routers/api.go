package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
	"my-stacklifes/handle/frontend"
)

func ApiRoutersInit(r *gin.Engine) {
	articleHandler := frontend.NewArticleHandler()
	messageHandler := frontend.NewMessageHandler()
	commentHandler := frontend.NewCommentHandler()
	websiteHandler := frontend.NewWebsiteHandler()
	navHandler := frontend.NewNavHandler()
	frontendApiRouter := r.Group("frontend/api") //可以加载这个后面
	{
		frontendApiRouter.GET("/article", articleHandler.ArticleList)
		frontendApiRouter.GET("/category/:id", articleHandler.CategoryArticleList)
		frontendApiRouter.GET("/tag/:id", articleHandler.TagsArticleList)
		frontendApiRouter.GET("/article/detail/:id", articleHandler.ArticleDetail)
		frontendApiRouter.GET("/nav", navHandler.GetNavList)
		frontendApiRouter.GET("/website", websiteHandler.WebsiteFrontendList)
		frontendApiRouter.POST("/message", messageHandler.Update)
		frontendApiRouter.POST("/comment", commentHandler.Update)
	}

	loginHandler := admin.NewLoginHandler()
	//分类
	adminCategoryHandler := admin.NewCategoryHandler()
	adminDirectoryHandler := admin.NewDirectoryHandler()
	adminAttachHandler := admin.NewAttachHandler()
	//标签
	adminTagsHandler := admin.NewTagsHandler()
	//语言
	adminLangHandler := admin.NewLangHandler()
	//文章
	adminArticleHandler := admin.NewArticleHandler()
	//日志
	adminLogHandler := admin.NewLogHandler()
	//用户组
	adminGroupHandler := admin.NewAdminGroupHandler()
	adminsHandler := admin.NewAdminHandler()
	//用户组
	adminOptionHandler := admin.NewOptionHandler()
	//权限
	adminPermitHandler := admin.NewPermitHandler()
	adminMenuHandler := admin.NewMenuHandler()
	adminWebsiteHandler := admin.NewWebsiteHandler()
	adminMsgHandler := admin.NewMessageHandler()
	adminCommentHandler := admin.NewCommentHandler()
	adminReadHandler := admin.NewReadHandler()

	adminRouter := r.Group("admin/api") //可以加载这个后面
	adminRouter.POST("/auth", loginHandler.Auth)
	adminRouter.Use()
	{
		adminRouter.GET("/option/getFilter", adminOptionHandler.GetFilter)
		adminRouter.GET("/lang/list", adminLangHandler.List)
		adminRouter.GET("/lang/info/:id", adminLangHandler.Info)
		adminRouter.POST("/lang/update", adminLangHandler.Update)
		adminRouter.POST("/lang/create", adminLangHandler.Create)
		adminRouter.POST("/lang/delete", adminLangHandler.Delete)
		adminRouter.POST("/lang/change_field", adminLangHandler.ChangeField)

		adminRouter.GET("/category/list", adminCategoryHandler.List)
		adminRouter.GET("/category/info/:id", adminCategoryHandler.Info)
		adminRouter.GET("/category/no_page_list", adminCategoryHandler.NoPageList)
		adminRouter.POST("/category/update", adminCategoryHandler.Update)
		adminRouter.POST("/category/create", adminCategoryHandler.Create)
		adminRouter.POST("/category/delete", adminCategoryHandler.Delete)

		adminRouter.GET("/directory/list", adminDirectoryHandler.List)
		adminRouter.GET("/directory/info/:id", adminDirectoryHandler.Info)
		adminRouter.GET("/directory/no_page_list", adminDirectoryHandler.NoPageList)
		adminRouter.POST("/directory/update", adminDirectoryHandler.Update)
		adminRouter.POST("/directory/create", adminDirectoryHandler.Create)
		adminRouter.POST("/directory/delete", adminDirectoryHandler.Delete)

		adminRouter.GET("/admin_group/list", adminGroupHandler.List)
		adminRouter.GET("/admin_group/no_page_list", adminGroupHandler.NoPageList)
		adminRouter.GET("/admin_group/info/:id", adminGroupHandler.Info)
		adminRouter.POST("/admin_group/update", adminGroupHandler.Update)
		adminRouter.POST("/admin_group/create", adminGroupHandler.Create)
		adminRouter.POST("/admin_group/delete", adminGroupHandler.Delete)

		adminRouter.GET("/admin/list", adminsHandler.List)
		adminRouter.GET("/admin/info/:id", adminsHandler.Info)
		adminRouter.POST("/admin/create", adminsHandler.Create)
		adminRouter.POST("/admin/change_field", adminsHandler.ChangeField)
		adminRouter.POST("/admin/delete", adminsHandler.Delete)

		adminRouter.GET("/website/list", adminWebsiteHandler.List)
		adminRouter.GET("/website/info/:id", adminWebsiteHandler.Info)
		adminRouter.POST("/website/create", adminWebsiteHandler.Create)
		adminRouter.POST("/website/delete", adminWebsiteHandler.Delete)

		adminRouter.GET("/tags/list", adminTagsHandler.List)
		adminRouter.GET("/tags/info/:id", adminTagsHandler.Info)
		adminRouter.POST("/tags/create", adminTagsHandler.Create)
		adminRouter.POST("/tags/update", adminTagsHandler.Update)
		adminRouter.POST("/tags/delete", adminTagsHandler.Delete)
		adminRouter.POST("/tags/change_field", adminTagsHandler.ChangeField)

		adminRouter.GET("/permit/list", adminPermitHandler.List)
		adminRouter.GET("/permit/info/:id", adminPermitHandler.Info)
		adminRouter.POST("/permit/update", adminPermitHandler.Update)
		adminRouter.POST("/permit/create", adminPermitHandler.Create)
		adminRouter.POST("/permit/delete", adminPermitHandler.Delete)

		adminRouter.GET("/menu/list", adminMenuHandler.List)
		adminRouter.GET("/menu/info/:id", adminMenuHandler.Info)
		adminRouter.POST("/menu/create", adminMenuHandler.Create)
		adminRouter.POST("/menu/update", adminMenuHandler.Update)
		adminRouter.POST("/menu/delete", adminMenuHandler.Delete)

		adminRouter.GET("/log/list", adminLogHandler.List)
		adminRouter.GET("/msg/list", adminMsgHandler.List)
		adminRouter.GET("/read/list", adminReadHandler.List)
		adminRouter.GET("/comment/list", adminCommentHandler.List)

		adminRouter.GET("/article/list_json", adminArticleHandler.ListJson)
		adminRouter.GET("/article/info/:id", adminArticleHandler.Info)
		adminRouter.POST("/article/create", adminArticleHandler.Create)
		adminRouter.POST("/article/update", adminArticleHandler.Update)
		adminRouter.POST("/article/change_field", adminArticleHandler.ChangeField)

		adminRouter.GET("/attach/list", adminAttachHandler.List)
		adminRouter.GET("/attach/info", adminAttachHandler.List)
		adminRouter.GET("/attach/edit", adminAttachHandler.List)

	}
}
