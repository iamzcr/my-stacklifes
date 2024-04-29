package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	utils "my-stacklifes/pkg/tools"
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
	s.dbClient.MysqlClient.Where("username=?", req.Name).Find(&admin)
	if admin.Id == 0 {
		return nil, errors.New("admin error")
	}
	password := utils.GenPassword(req.Password, admin.Salt)
	if password != admin.Password {
		return nil, errors.New("admin error")
	}

	Authentication := ""

	return models.TokenInfo{
		Authentication: Authentication,
		Username:       admin.Username,
		Id:             admin.Id,
	}, nil
}
