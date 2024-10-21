package admin

import (
	"fmt"
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
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "attach/list.html")
}

func (h *AttachHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.AttachReq{}
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

	var (
		appGin = app.Gin{C: ctx}
		req    models.Attach
	)
	err := ctx.ShouldBind(&req)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	fmt.Println(req)
	res, err := h.srv.Update(ctx, req)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
