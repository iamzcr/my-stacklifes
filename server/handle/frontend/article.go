package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
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
	appGin.Success(list)
}

func (h *ArticleHandler) ArticleDetail(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	detailData, err := h.srv.GetFrontDetail(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	//appGin.Success(detailData)
	appGin.SuccessHtml(detailData, "article.html")
}

// 分类获取文章目录列表
func (h *ArticleHandler) CategoryArticleList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")

	list, err := h.srv.GetFrontCategoryArticleList(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	//appGin.Success(list)
	appGin.SuccessHtml(list, "category.html")
}

// 标签获取文章列表
func (h *ArticleHandler) TagsArticleList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")

	list, err := h.srv.GetFrontTagsArticleList(id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	//appGin.Success(list)
	appGin.SuccessHtml(list, "tag.html")

}
