package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type PermitHandler struct {
	srv *service.PermitService
}

func NewPermitHandler() *PermitHandler {
	return &PermitHandler{
		srv: service.NewPermitService(),
	}
}

func (h *PermitHandler) Edit(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	info, _ := h.srv.GetInfo(ctx, id)
	appGin.SuccessAdminHtml(info, "menu/edit.html")
}

func (h *PermitHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "permit/list.html")
}

func (h *PermitHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.PermitListReq{}
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

func (h *PermitHandler) NoPageList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.PermitNoPageReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.PermitNoPageList(ctx, query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *PermitHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *PermitHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.PermitCreateReq
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

func (h *PermitHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.PermitUpdateReq
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

func (h *PermitHandler) Delete(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		reqDel models.PermitDelReq
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
