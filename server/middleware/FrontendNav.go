package middleware

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/service"
)

func GetFrontendNav(ctx *gin.Context) interface{} {
	var cateSrv = service.NewCategoryService()
	query := models.CategoryNavListReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		return nil
	}
	cateList, _ := cateSrv.GetNavList(ctx, query)
	return cateList
}
