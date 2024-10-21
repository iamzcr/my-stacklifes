package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type LangHandler struct {
	srv *service.LangService
}

func NewLangHandler() *LangHandler {
	return &LangHandler{
		srv: service.NewLangService(),
	}
}

func (h *LangHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "lang/list.html")
}

func (h *LangHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.LangListReq{}
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

func (h *LangHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *LangHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.LangCreateReq
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

func (h *LangHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.LangUpdateReq
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

func (h *LangHandler) Delete(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		reqDel models.LangDelReq
	)
	err := ctx.ShouldBind(&reqDel)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Delete(ctx, reqDel)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *LangHandler) ChangeField(ctx *gin.Context) {
	var (
		appGin   = app.Gin{C: ctx}
		reqField models.LangChangeFieldReq
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
