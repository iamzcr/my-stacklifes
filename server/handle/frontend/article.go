package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
	"strconv"
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
	info, err := h.srv.GetFrontDetail(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	//appGin.Success(detailData)
	appGin.SuccessHtml(info, "article.html")
}

// 分类获取文章目录列表
func (h *ArticleHandler) CategoryArticleList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	cid, _ := strconv.Atoi(id)
	list, err := h.srv.GetFrontCategoryArticleList(ctx, cid)
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
	tid, _ := strconv.Atoi(id)
	list, err := h.srv.GetFrontTagsArticleList(ctx, tid)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	//appGin.Success(list)
	appGin.SuccessHtml(list, "tag.html")

}
