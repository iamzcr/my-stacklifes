package frontend

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database"
	"my-stacklifes/models"
	"net/http"
)

func ArticleList(ctx *gin.Context) {
	var articleList []models.Article
	database.MysqlDB.Find(&articleList)
	ctx.JSON(http.StatusOK, gin.H{
		"code": 1,
		"msg":  "success",
		"data": articleList,
	})
}
func ArticleDetail(ctx *gin.Context) {
	ctx.JSON(http.StatusOK, map[string]interface{}{
		"success": true,
		"msg":     "detail",
	})
}
