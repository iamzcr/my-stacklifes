package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type ArticleHandler struct {
	srv *service.ArticleService
}

func NewArticleHandler() *ArticleHandler {
	return &ArticleHandler{
		srv: service.NewArticleService(),
	}
}

func (h *ArticleHandler) ArticleList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	detailData, err := h.srv.GetDetail(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(detailData)
}
func (h *ArticleHandler) ArticleDetail(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	detailData, err := h.srv.GetDetail(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(detailData)
}
