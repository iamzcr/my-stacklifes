package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type AdminGroupHandler struct {
	srv *service.AdminGroupService
}

func NewAdminGroupHandler() *AdminGroupHandler {
	return &AdminGroupHandler{
		srv: service.NewAdminGroupService(),
	}
}

func (h *AdminGroupHandler) AdminGroupList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.AdminGroupReq{}
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
