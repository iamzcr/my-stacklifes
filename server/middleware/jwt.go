package middleware

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"gorm.io/gorm/logger"
	"my-stacklifes/pkg/app"
	"my-stacklifes/pkg/exception"
	"net/http"
	"strings"
	"time"
)

type JWTHeader struct {
	Authorization string `header:"Authorization" validate:"required"`
}

func JWT() gin.HandlerFunc {
	return func(c *gin.Context) {
		var code int
		var data interface{}
		var ag = app.Gin{C: c}

		code = exception.SUCCESS
		var headers JWTHeader
		validateErr := app.BindHeader(c, &headers)
		if len(validateErr) > 0 {
			ag.Error(e.INVALID_PARAMS, "", validateErr)
			c.Abort()
			return
		}
		token := strings.TrimPrefix(headers.Authorization, "Bearer ")
		if token == "" {
			code = e.INVALID_PARAMS
			c.Next()
			return
		}
		claims, err := jwt.ParseToken(token)
		if err != nil {
			code = exception.TOKEN_INVALID
			logger.Error("token err", zap.String("token", token), zap.Error(err))
		} else if time.Now().Unix() > claims.ExpiresAt {
			code = exception.TOKEN_INVALID
			logger.Error("token expire", zap.String("token", token))
		}
		if code != exception.SUCCESS {
			ag.Response(http.StatusUnauthorized, code, data)
			c.Abort()
			return
		}

		var user models.User
		err = daos.GetDB().Where("name", claims.Subject).Find(&user).Error
		if err != nil {
			ag.Response(http.StatusUnauthorized, e.ERROR, nil)
			c.Abort()
			return
		}
		authInfo := &models.AuthInfo{
			Name:   claims.Subject,
			Avatar: user.Avatar,
			Role:   []string{"admin"},
		}
		c.Set(enum.UserValueAuth, authInfo)
		c.Next()
	}

}
