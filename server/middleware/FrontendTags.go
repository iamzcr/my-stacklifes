package middleware

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/service"
)

func GetFrontendTags(ctx *gin.Context) interface{} {
	var tagSrv = service.NewTagsService()
	query := models.TagsNoPageListRes{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		return nil
	}
	tagList, _ := tagSrv.GetNoPageList(ctx, query)
	fmt.Println(tagList)
	return tagList
}
