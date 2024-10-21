package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type DirectoryHandler struct {
	srv *service.DirectoryService
}

func NewDirectoryHandler() *DirectoryHandler {
	return &DirectoryHandler{
		srv: service.NewDirectoryService(),
	}
}

func (h *DirectoryHandler) Add(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "directory/edit.html")
}

func (h *DirectoryHandler) Edit(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	info, _ := h.srv.GetInfo(ctx, id)
	appGin.SuccessAdminHtml(info, "directory/edit.html")
}

func (h *DirectoryHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "directory/list.html")
}

func (h *DirectoryHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	listReq := models.DirectoryListReq{}
	err := ctx.ShouldBindQuery(&listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetList(ctx, listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *DirectoryHandler) NoPageList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	listReq := models.DirectoryNoPageReq{}
	err := ctx.ShouldBindQuery(&listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetNoPageList(listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *DirectoryHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *DirectoryHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.DirectoryCreateReq
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

func (h *DirectoryHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.DirectoryUpdateReq
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

func (h *DirectoryHandler) Delete(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		reqDel models.DirectoryDelReq
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
