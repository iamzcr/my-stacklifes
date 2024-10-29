package admin

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"my-stacklifes/service"
)

type ArticleHandler struct {
	srv *service.ArticleService
}

func NewArticleHandler() *ArticleHandler {
	return &ArticleHandler{
		srv: service.NewArticleService(),
	}
}
func (h *ArticleHandler) List(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	categoryList, _ := service.NewCategoryService().GetCategoryList(ctx)
	assignList := models.ArticleAssignList{
		CategoryList: categoryList,
	}
	appGin.SuccessAdminHtml(assignList, "article/list.html")
}

func (h *ArticleHandler) ListJson(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	query := models.ArticleReq{}
	err := ctx.ShouldBindQuery(&query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	list, err := h.srv.GetList(ctx, query)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(list)
}

func (h *ArticleHandler) Edit(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	info, _ := h.srv.GetInfo(ctx, id)
	categoryList, _ := service.NewCategoryService().GetCategoryList(ctx)
	directoryList, _ := service.NewDirectoryService().GetDirectoryList(ctx)
	tagsList, _ := service.NewTagsService().GetAllTagsList(ctx)
	statusMap := service.NewCommonService().GetStatusMap(ctx)
	assignList := models.ArticleAssignList{
		Info:          info,
		CategoryList:  categoryList,
		DirectoryList: directoryList,
		TagsList:      tagsList,
		StatusMap:     statusMap,
	}
	appGin.SuccessAdminHtml(assignList, "article/edit.html")
}

func (h *ArticleHandler) Info(ctx *gin.Context) {
	var appGin = app.Gin{C: ctx}
	id := ctx.Param("id")
	infoData, err := h.srv.GetInfo(ctx, id)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(infoData)
}

func (h *ArticleHandler) Create(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqCreate models.ArticleCreateReq
	)

	if err := ctx.Bind(&reqCreate); err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	// 在这里处理 Markdown 内容的逻辑
	markdownContent := ctx.PostForm("content")
	reqCreate.Content = markdownContent

	res, err := h.srv.Create(ctx, reqCreate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *ArticleHandler) Update(ctx *gin.Context) {

	var (
		appGin    = app.Gin{C: ctx}
		reqUpdate models.ArticleUpdateReq
	)
	if err := ctx.ShouldBind(&reqUpdate); err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	// 在这里处理 Markdown 内容的逻辑
	markdownContent := ctx.PostForm("content")
	reqUpdate.Content = markdownContent

	res, err := h.srv.Update(ctx, reqUpdate)
	if err != nil {
		appGin.Error(exception.ERROR, err.Error(), nil)
		return
	}
	appGin.Success(res)
}

func (h *ArticleHandler) ChangeField(ctx *gin.Context) {
	var (
		appGin   = app.Gin{C: ctx}
		reqField models.ArticleFieldReq
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
