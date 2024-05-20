package admin

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type MenuHandler struct {
	srv *service.MenuService
}

func NewMenuHandler() *MenuHandler {
	return &MenuHandler{
		srv: service.NewMenuService(),
	}
}

func (h *MenuHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.MenuReq{}
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

func (h *MenuHandler) TreeList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.MenuReq{}
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

func (h *MenuHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *MenuHandler) Edit(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		req    models.Menu
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
