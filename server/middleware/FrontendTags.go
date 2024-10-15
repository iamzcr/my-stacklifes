package middleware

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/service"
)

func GetFrontendTags(ctx *gin.Context) interface{} {
	var tagSrv = service.NewTagsService()
	tagList, _ := tagSrv.GetNoPageList(ctx, models.TagsNoPageListRes{})
	fmt.Println(tagList)
	return tagList
}
