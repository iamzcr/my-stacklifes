package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type LogHandler struct {
	srv *service.LogService
}

func NewLogHandler() *LogHandler {
	return &LogHandler{
		srv: service.NewLogService(),
	}
}

func (h *LogHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.LogReq{}
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
