package middleware

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/service"
)

func GetFrontendHotArticles(ctx *gin.Context) interface{} {
	var acticleSrv = service.NewArticleService()
	query := models.FrontArticleListReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		return nil
	}
	acticleList, _ := acticleSrv.GetFrontList(ctx, query)
	return acticleList
}
