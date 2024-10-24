package admin

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
func (h *MessageHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	appGin.SuccessAdminHtml("", "message/list.html")
}
func (h *MessageHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	listReq := models.MessageReq{}
	err := ctx.ShouldBindQuery(&listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetList(ctx, listReq)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *MessageHandler) Delete(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		reqDel models.MessageDelReq
	)
	err := ctx.ShouldBind(&reqDel)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Delete(ctx, reqDel)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
