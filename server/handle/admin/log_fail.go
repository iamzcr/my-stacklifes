package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type LogFailHandler struct {
	srv *service.LogFailService
}

func NewLogFailHandler() *LogFailHandler {
	return &LogFailHandler{
		srv: service.NewLogFailService(),
	}
}

func (h *LogFailHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.LogFailReq{}
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
