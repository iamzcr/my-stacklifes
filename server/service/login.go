package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"

	"my-stacklifes/pkg/jwt"
	"my-stacklifes/pkg/tools"
)

type LoginService struct {
	dbClient *mysql.DbClient
}

func NewLoginService() *LoginService {
	return &LoginService{
		dbClient: mysql.NewDbClient(),
	}
}
func (s *LoginService) LoginCheck(ctx *gin.Context, req models.LoginReq) (interface{}, error) {
	var admin models.Admin

	//查找账号
	s.dbClient.MysqlClient.Where("username=?", req.Username).Find(&admin)
	if admin.Id == 0 {
		return nil, errors.New("admin error")
	}
	//验证密码
	password := tools.GenPassword(admin.Salt, req.Password)
	if password != admin.Password {
		return nil, errors.New("admin error")
	}

	//存储令牌
	authentication, err := jwt.CreateToken(admin.Username)
	if err != nil {
		return nil, errors.New("admin error")
	}

	return models.TokenInfo{
		Authentication: authentication,
		Username:       admin.Username,
		Id:             admin.Id,
	}, nil
}
