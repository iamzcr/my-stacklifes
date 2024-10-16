package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type LoginHandler struct {
	srv *service.LoginService
}

func NewLoginHandler() *LoginHandler {
	return &LoginHandler{
		srv: service.NewLoginService(),
	}
}

func (h *LoginHandler) Login(ctx *gin.Context) {
	var (
		appGin = app.Gin{C: ctx}
	)
	appGin.SuccessAdminHtml("", "login.html")
}

func (h *LoginHandler) Auth(ctx *gin.Context) {
	var (
		appGin   = app.Gin{C: ctx}
		reqLogin models.LoginReq
	)
	err := ctx.ShouldBind(&reqLogin)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.LoginCheck(ctx, reqLogin)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
