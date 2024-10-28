package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type AttachHandler struct {
	srv *service.AttachService
}

func NewAttachHandler() *AttachHandler {
	return &AttachHandler{
		srv: service.NewAttachService(),
	}
}

func (h *AttachHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	appGin.SuccessAdminHtml("", "attach/list.html")
}

func (h *AttachHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.AttachListReq{}
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

func (h *AttachHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *AttachHandler) Edit(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	appGin.SuccessAdminHtml("", "attach/edit.html")
}

func (h *AttachHandler) Create(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		req    models.AttachCreateReq
	)
	err := ctx.ShouldBind(&req)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Create(ctx, req)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
