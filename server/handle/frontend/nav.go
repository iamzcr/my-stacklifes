package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type NavHandler struct {
	srv *service.NavService
}

func NewNavHandler() *NavHandler {
	return &NavHandler{
		srv: service.NewNavService(),
	}
}

func (h *NavHandler) GetNavList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	list, err := h.srv.GetFrontendNav(ctx)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}
