package admin

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type CategoryHandler struct {
	srv *service.CategoryService
}

func NewCategoryHandler() *CategoryHandler {
	return &CategoryHandler{
		srv: service.NewCategoryService(),
	}
}

func (h *CategoryHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.CategoryReq{}
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

func (h *CategoryHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *CategoryHandler) Edit(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		req    models.Category
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
