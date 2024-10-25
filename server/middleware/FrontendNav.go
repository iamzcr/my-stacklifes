package middleware

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/service"
)

func GetFrontendNav(ctx *gin.Context) interface{} {
	categoryList, _ := service.NewCategoryService().GetNavList(ctx)
	return categoryList
}
