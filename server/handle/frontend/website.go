package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type WebsiteHandler struct {
	srv *service.WebsiteService
}

func NewWebsiteHandler() *WebsiteHandler {
	return &WebsiteHandler{
		srv: service.NewWebsiteService(),
	}
}

func (h *WebsiteHandler) FrontendList(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	res, err := h.srv.FrontendList(ctx)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
