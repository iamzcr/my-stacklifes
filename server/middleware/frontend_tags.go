package middleware

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/service"
)

func GetFrontendTags(ctx *gin.Context) interface{} {
	tagList, _ := service.NewTagsService().GetTagsList(ctx)
	return tagList
}
