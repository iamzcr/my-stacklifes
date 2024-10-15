package middleware

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func GetFrontendNav() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Set("nav", "test")
		fmt.Println("nav set in middleware:", c.MustGet("nav"))
		c.Next()
	}
}
