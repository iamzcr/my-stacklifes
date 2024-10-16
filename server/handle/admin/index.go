package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/app"
	"my-stacklifes/service"
)

type IndexHandler struct {
	srv *service.LoginService
}

func NewIndexHandler() *IndexHandler {
	return &IndexHandler{
		srv: service.NewLoginService(),
	}
}

func (h *IndexHandler) Index(ctx *gin.Context) {
	var (
		appGin = app.Gin{C: ctx}
	)
	appGin.SuccessAdminHtml("", "index.html")
}
