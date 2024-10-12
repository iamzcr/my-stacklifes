package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type IndexHandler struct {
	srv     *service.ArticleService
	cateSrv *service.CategoryService
}

func NewIndexHandler() *IndexHandler {
	return &IndexHandler{
		srv:     service.NewArticleService(),
		cateSrv: service.NewCategoryService(),
	}
}

func (h *IndexHandler) Index(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.FrontArticleListReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetFrontList(ctx, query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.SuccessHtml(list, "index.html")
}
