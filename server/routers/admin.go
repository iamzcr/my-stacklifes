package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
)

func AdminRoutersInit(r *gin.Engine) {
	loginHandler := admin.NewLoginHandler()
	//分类
	categoryHandler := admin.NewCategoryHandler()
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
	//权限
	permitHandler := admin.NewPermitHandler()
	adminRouter := r.Group("/admin") //可以加载这个后面
	adminRouter.POST("/login", loginHandler.Login)
	{
		adminRouter.GET("/category/list", categoryHandler.List)
		adminRouter.GET("/category/info/:id", categoryHandler.Info)
		adminRouter.POST("/category/edit", categoryHandler.Edit)

		adminRouter.GET("/tags/list", tagsHandler.List)
		adminRouter.GET("/tags/info", categoryHandler.List)
		adminRouter.GET("/tags/edit", categoryHandler.List)

		adminRouter.GET("/article/list", articleHandler.List)
		adminRouter.GET("/article/info", categoryHandler.List)
		adminRouter.GET("/article/edit", categoryHandler.List)

		adminRouter.GET("/menu/list", categoryHandler.List)
		adminRouter.GET("/menu/info", categoryHandler.List)
		adminRouter.GET("/menu/edit", categoryHandler.List)

		adminRouter.GET("/lang/list", langHandler.List)
		adminRouter.POST("/lang/info", langHandler.Info)
		adminRouter.POST("/lang/edit", langHandler.Edit)

		adminRouter.GET("/permit/list", permitHandler.List)
		adminRouter.GET("/permit/info", categoryHandler.List)
		adminRouter.GET("/permit/edit", categoryHandler.List)

		adminRouter.GET("/attach/list", attachHandler.List)
		adminRouter.GET("/attach/info", attachHandler.List)
		adminRouter.GET("/attach/edit", attachHandler.List)

		adminRouter.GET("/log/list", logHandler.List)
		adminRouter.GET("/admin_group/list", adminGroupHandler.List)
	}
}
