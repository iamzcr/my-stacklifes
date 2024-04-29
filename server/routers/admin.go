package routers

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/handle/admin"
)

func AdminRoutersInit(r *gin.Engine) {
	loginHandler := admin.NewLoginHandler()
	categoryHandler := admin.NewCategoryHandler()
	adminRouter := r.Group("/admin") //可以加载这个后面
	adminRouter.POST("/login", loginHandler.Login)
	{
		adminRouter.GET("/category/list", categoryHandler.CategoryList)
	}
}
