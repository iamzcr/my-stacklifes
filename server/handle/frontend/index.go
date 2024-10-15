package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type IndexHandler struct {
	srv    *service.ArticleService
	tagSrv *service.TagsService
}
type IndexList struct {
	ArticleList interface{}
}

func NewIndexHandler() *IndexHandler {
	return &IndexHandler{
		srv:    service.NewArticleService(),
		tagSrv: service.NewTagsService(),
	}
}

func (h *IndexHandler) Index(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	articleQuery := models.FrontArticleListReq{}
	err := ctx.ShouldBindQuery(&articleQuery)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetFrontList(ctx, articleQuery)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.SuccessHtml(list, "index.html")
}
