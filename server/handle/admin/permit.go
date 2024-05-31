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

func (h *PermitHandler) List(ctx *gin.Context) {
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
