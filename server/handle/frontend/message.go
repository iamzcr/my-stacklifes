package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type MessageHandler struct {
	srv *service.MessageService
}

func NewMessageHandler() *MessageHandler {
	return &MessageHandler{
		srv: service.NewMessageService(),
	}
}

func (h *MessageHandler) Update(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	msgCreateReq := models.MsgCreateReq{}
	err := ctx.ShouldBind(&msgCreateReq)
	res, err := h.srv.Update(ctx, msgCreateReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
