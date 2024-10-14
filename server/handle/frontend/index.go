package frontend

import (
	"fmt"
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
	TagList     interface{}
	NavList     interface{}
}

func NewIndexHandler() *IndexHandler {
	return &IndexHandler{
		srv:    service.NewArticleService(),
		tagSrv: service.NewTagsService(),
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
	var indexList = &IndexList{}
	articleList, err := h.srv.GetFrontList(ctx, query)
	tagList, err := h.tagSrv.GetNoPageList(ctx, models.TagsNoPageListRes{})
	indexList.ArticleList = articleList
	indexList.TagList = tagList

	fmt.Println(indexList)

	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.SuccessHtml(indexList, "index.html")
}
