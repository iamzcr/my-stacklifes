package admin

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

func (h *ArticleHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.ArticleReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetList(ctx, query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *ArticleHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *ArticleHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.ArticleCreateReq
	)
	err := ctx.ShouldBind(&reqCreate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Create(ctx, reqCreate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *ArticleHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.ArticleUpdateReq
	)
	err := ctx.ShouldBind(&reqUpdate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Update(ctx, reqUpdate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *ArticleHandler) ChangeField(ctx *gin.Context) {
	var (
		appGin   = app.Gin{C: ctx}
		reqField models.ArticleFieldReq
	)
	err := ctx.ShouldBind(&reqField)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.ChangeField(ctx, reqField)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
