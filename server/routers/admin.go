package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
)

func AdminRoutersInit(r *gin.Engine) {
	loginHandler := admin.NewLoginHandler()
	indexHandler := admin.NewIndexHandler()
	//分类
	categoryHandler := admin.NewCategoryHandler()
	directoryHandler := admin.NewDirectoryHandler()
	attachHandler := admin.NewAttachHandler()
	//标签
	tagsHandler := admin.NewTagsHandler()
	//语言
	langHandler := admin.NewLangHandler()
	//文章
	articleHandler := admin.NewArticleHandler()
	//日志
	logHandler := admin.NewLogHandler()
	//用户组
	adminGroupHandler := admin.NewAdminGroupHandler()
	adminsHandler := admin.NewAdminHandler()
	//用户组
	optionHandler := admin.NewOptionHandler()
	//权限
	permitHandler := admin.NewPermitHandler()
	menuHandler := admin.NewMenuHandler()
	websiteHandler := admin.NewWebsiteHandler()
	msgHandler := admin.NewMessageHandler()
	commentHandler := admin.NewCommentHandler()
	readHandler := admin.NewReadHandler()
	adminRouter := r.Group("admin") //可以加载这个后面
	adminRouter.GET("/login", loginHandler.Login)
	adminRouter.POST("/auth", loginHandler.Auth)
	adminRouter.Use()
	{
		adminRouter.GET("/", indexHandler.Index)
		adminRouter.GET("/option/getFilter", optionHandler.GetFilter)
		adminRouter.GET("/lang/list", langHandler.List)
		adminRouter.GET("/lang/list_json", langHandler.ListJson)
		adminRouter.GET("/lang/info/:id", langHandler.Info)
		adminRouter.POST("/lang/update", langHandler.Update)
		adminRouter.POST("/lang/create", langHandler.Create)
		adminRouter.POST("/lang/delete", langHandler.Delete)
		adminRouter.POST("/lang/change_field", langHandler.ChangeField)

		adminRouter.GET("/category/list", categoryHandler.List)
		adminRouter.GET("/category/list_json", categoryHandler.ListJson)
		adminRouter.GET("/category/edit", categoryHandler.List)
		adminRouter.GET("/category/info/:id", categoryHandler.Info)
		adminRouter.GET("/category/no_page_list", categoryHandler.NoPageList)
		adminRouter.POST("/category/update", categoryHandler.Update)
		adminRouter.POST("/category/create", categoryHandler.Create)
		adminRouter.POST("/category/delete", categoryHandler.Delete)

		adminRouter.GET("/directory/list", directoryHandler.List)
		adminRouter.GET("/directory/info/:id", directoryHandler.Info)
		adminRouter.GET("/directory/no_page_list", directoryHandler.NoPageList)
		adminRouter.POST("/directory/update", directoryHandler.Update)
		adminRouter.POST("/directory/create", directoryHandler.Create)
		adminRouter.POST("/directory/delete", directoryHandler.Delete)

		adminRouter.GET("/admin_group/list", adminGroupHandler.List)
		adminRouter.GET("/admin_group/list_json", adminGroupHandler.ListJson)
		adminRouter.GET("/admin_group/no_page_list", adminGroupHandler.NoPageList)
		adminRouter.GET("/admin_group/info/:id", adminGroupHandler.Info)
		adminRouter.POST("/admin_group/update", adminGroupHandler.Update)
		adminRouter.POST("/admin_group/create", adminGroupHandler.Create)
		adminRouter.POST("/admin_group/delete", adminGroupHandler.Delete)

		adminRouter.GET("/admin/list", adminsHandler.List)
		adminRouter.GET("/admin/list_json", adminsHandler.ListJson)
		adminRouter.GET("/admin/info/:id", adminsHandler.Info)
		adminRouter.POST("/admin/create", adminsHandler.Create)
		adminRouter.POST("/admin/change_field", adminsHandler.ChangeField)
		adminRouter.POST("/admin/delete", adminsHandler.Delete)

		adminRouter.GET("/website/list", websiteHandler.List)
		adminRouter.GET("/website/list_json", websiteHandler.ListJson)
		adminRouter.GET("/website/info/:id", websiteHandler.Info)
		adminRouter.POST("/website/create", websiteHandler.Create)
		adminRouter.POST("/website/delete", websiteHandler.Delete)

		adminRouter.GET("/tags/list", tagsHandler.List)
		adminRouter.GET("/tags/list_json", tagsHandler.ListJson)
		adminRouter.GET("/tags/info/:id", tagsHandler.Info)
		adminRouter.POST("/tags/create", tagsHandler.Create)
		adminRouter.POST("/tags/update", tagsHandler.Update)
		adminRouter.POST("/tags/delete", tagsHandler.Delete)
		adminRouter.POST("/tags/change_field", tagsHandler.ChangeField)

		adminRouter.GET("/permit/list", permitHandler.List)
		adminRouter.GET("/permit/list_json", permitHandler.ListJson)
		adminRouter.GET("/permit/info/:id", permitHandler.Info)
		adminRouter.GET("/permit/no_page_list", permitHandler.NoPageList)
		adminRouter.POST("/permit/update", permitHandler.Update)
		adminRouter.POST("/permit/create", permitHandler.Create)
		adminRouter.POST("/permit/delete", permitHandler.Delete)

		adminRouter.GET("/menu/list", menuHandler.List)
		adminRouter.GET("/menu/list_json", menuHandler.ListJson)
		adminRouter.GET("/menu/no_page_list", menuHandler.NoPageList)
		adminRouter.GET("/menu/info/:id", menuHandler.Info)
		adminRouter.POST("/menu/create", menuHandler.Create)
		adminRouter.POST("/menu/update", menuHandler.Update)
		adminRouter.POST("/menu/delete", menuHandler.Delete)

		adminRouter.GET("/log/list", logHandler.List)
		adminRouter.GET("/log/list_json", logHandler.ListJson)
		adminRouter.GET("/msg/list", msgHandler.List)
		adminRouter.GET("/read/list", readHandler.List)
		adminRouter.GET("/comment/list", commentHandler.List)

		adminRouter.GET("/article/list", articleHandler.List)
		adminRouter.GET("/article/list_json", articleHandler.ListJson)
		adminRouter.GET("/article/edit", articleHandler.Edit)
		adminRouter.GET("/article/info/:id", articleHandler.Info)
		adminRouter.POST("/article/create", articleHandler.Create)
		adminRouter.POST("/article/update", articleHandler.Update)
		adminRouter.POST("/article/change_field", articleHandler.ChangeField)

		adminRouter.GET("/attach/list", attachHandler.List)
		adminRouter.GET("/attach/list_json", attachHandler.ListJson)
		adminRouter.GET("/attach/info", attachHandler.List)
		adminRouter.GET("/attach/edit", attachHandler.List)

	}
}
