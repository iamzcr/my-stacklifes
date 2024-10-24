package middleware

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/service"
)

func GetFrontendTags(ctx *gin.Context) interface{} {
	var tagSrv = service.NewTagsService()
	query := models.TagsListReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		return nil
	}
	tagList, _ := tagSrv.GetTagsList(ctx, query)
	return tagList
}
