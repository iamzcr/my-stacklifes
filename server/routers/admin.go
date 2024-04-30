package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
)

func AdminRoutersInit(r *gin.Engine) {
	loginHandler := admin.NewLoginHandler()
	categoryHandler := admin.NewCategoryHandler()
	logHandler := admin.NewLogHandler()
	adminGroupHandler := admin.NewAdminGroupHandler()
	adminRouter := r.Group("/admin") //可以加载这个后面
	adminRouter.POST("/login", loginHandler.Login)
	{
		adminRouter.GET("/category/list", categoryHandler.CategoryList)
		adminRouter.GET("/category/info", categoryHandler.CategoryList)
		adminRouter.GET("/category/edit", categoryHandler.CategoryList)

		adminRouter.GET("/tags/list", categoryHandler.CategoryList)
		adminRouter.GET("/tags/info", categoryHandler.CategoryList)
		adminRouter.GET("/tags/edit", categoryHandler.CategoryList)

		adminRouter.GET("/article/list", categoryHandler.CategoryList)
		adminRouter.GET("/article/info", categoryHandler.CategoryList)
		adminRouter.GET("/article/edit", categoryHandler.CategoryList)

		adminRouter.GET("/menu/list", categoryHandler.CategoryList)
		adminRouter.GET("/menu/info", categoryHandler.CategoryList)
		adminRouter.GET("/menu/edit", categoryHandler.CategoryList)

		adminRouter.GET("/permit/list", categoryHandler.CategoryList)
		adminRouter.GET("/permit/info", categoryHandler.CategoryList)
		adminRouter.GET("/permit/edit", categoryHandler.CategoryList)

		adminRouter.GET("/log/list", logHandler.LogList)
		adminRouter.GET("/admin_group/list", adminGroupHandler.AdminGroupList)
	}
}
