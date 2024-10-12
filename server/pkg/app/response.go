package app

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/exception"
	"net/http"
	"reflect"
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
	v := reflect.ValueOf(data)
	typeOfData := v.Type()

	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		fieldName := typeOfData.Field(i).Name
		fieldValue := field.Interface()
		fmt.Printf("Field Name: %s, Field Value: %v\n", fieldName, fieldValue)
	}
	g.C.HTML(http.StatusOK, view, gin.H{
		"data": data,
	})
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
