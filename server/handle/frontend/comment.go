package frontend

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

func (h *CommentHandler) Update(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	msgForm := models.Comment{}
	err := ctx.ShouldBind(&msgForm)
	res, err := h.srv.Update(ctx, msgForm)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
