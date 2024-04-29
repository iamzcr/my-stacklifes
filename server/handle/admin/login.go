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
		ag  = app.Gin{C: ctx}
		req models.LoginReq
	)
	res, err := h.srv.LoginCheck(ctx, req)
	if err != nil {
		ag.Error(exception.ERROR, err.Error(), nil)
		return
	}
	ag.Success(res)
}
