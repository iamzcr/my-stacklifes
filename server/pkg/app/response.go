package app

import "C"
import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/exception"
	"net/http"
)

type Gin struct {
	C *gin.Context
}

type Response struct {
	Code int         `json:"code"`
	Msg  string      `json:"message"`
	Data interface{} `json:"data"`
}

// Response setting gin.JSON
func (g *Gin) Response(httpCode, errCode int, data interface{}) {
	g.C.JSON(httpCode, Response{
		Code: errCode,
		Msg:  exception.GetMsg(errCode),
		Data: data,
	})
	return
}

func (g *Gin) Success(data interface{}) {
	g.C.JSON(http.StatusOK, Response{
		Code: exception.SUCCESS,
		Msg:  exception.GetMsg(exception.SUCCESS),
		Data: data,
	})
	return
}

func (g *Gin) SuccessHtml(data interface{}, view string) {
	navs, _ := g.C.Get("navs")
	tags, _ := g.C.Get("tags")
	hotArticles, _ := g.C.Get("hotArticles")
	g.C.HTML(http.StatusOK, view, gin.H{
		"data":         data,
		"navs":         navs,
		"tags":         tags,
		"hot_articles": hotArticles,
	})
}

func (g *Gin) SuccessAdminHtml(data interface{}, view string) {
	menuTree, _ := g.C.Get("menuTree")
	var h = gin.H{
		"data":     data,
		"menuTree": menuTree,
	}
	fmt.Printf("%#v\n", h)

	g.C.HTML(http.StatusOK, view, h)
}

// Error setting gin.JSON
func (g *Gin) Error(errCode int, msg string, data interface{}) {
	if msg == "" {
		msg = exception.GetMsg(errCode)
	}
	g.C.JSON(http.StatusOK, Response{
		Code: errCode,
		Msg:  msg,
		Data: data,
	})
	return
}
