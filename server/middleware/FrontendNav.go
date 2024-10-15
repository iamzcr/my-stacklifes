package middleware

import (
	"github.com/gin-gonic/gin"
)

func GetFrontendNav() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Set("nav", "test")
		c.Next()
	}
}
