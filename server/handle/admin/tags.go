package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type TagsHandler struct {
	srv *service.TagsService
}

func NewTagsHandler() *TagsHandler {
	return &TagsHandler{
		srv: service.NewTagsService(),
	}
}
func (h *TagsHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	assignData := "assignData"
	appGin.SuccessAdminHtml(assignData, "tags/list.html")
}
func (h *TagsHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	listReq := models.TagsListReq{}
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

func (h *TagsHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *TagsHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.TagsCreateReq
	)
	err := ctx.ShouldBind(&reqCreate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Create(ctx, reqCreate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *TagsHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.TagsUpdateReq
	)
	err := ctx.ShouldBind(&reqUpdate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.Update(ctx, reqUpdate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *TagsHandler) Delete(ctx *gin.Context) {

	var (
		appGin = app.Gin{C: ctx}
		reqDel models.TagsDelReq
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

func (h *TagsHandler) ChangeField(ctx *gin.Context) {
	var (
		appGin   = app.Gin{C: ctx}
		reqField models.TagsFieldReq
	)
	err := ctx.ShouldBind(&reqField)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	res, err := h.srv.ChangeField(ctx, reqField)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}
