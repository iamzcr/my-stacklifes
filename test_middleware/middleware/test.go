package middleware

import (
	"github.com/gin-gonic/gin"
)

func GetMenuTree(ctx *gin.Context) interface{} {
	var menuSrv = service.NewMenuService()
	treeList := menuSrv.GetTreeList()
	return treeList
}
