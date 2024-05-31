package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type OptionHandler struct {
	srv *service.OptionService
}

func NewOptionHandler() *OptionHandler {
	return &OptionHandler{
		srv: service.NewOptionService(),
	}
}

func (h *OptionHandler) GetFilter(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.FilterListReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetFilterList(ctx, query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}
