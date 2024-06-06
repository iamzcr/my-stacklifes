package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type CommentHandler struct {
	srv *service.CommentService
}

func NewCommentHandler() *CommentHandler {
	return &CommentHandler{
		srv: service.NewCommentService(),
	}
}

func (h *CommentHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	listReq := models.CommentReq{}
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