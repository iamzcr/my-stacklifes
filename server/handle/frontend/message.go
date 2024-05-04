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
	msgForm := models.Message{}
	err := ctx.ShouldBind(&msgForm)
	res, err := h.srv.Update(ctx, msgForm)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
