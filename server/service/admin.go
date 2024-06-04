package service

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
)

type AdminService struct {
	dbClient *mysql.DbClient
}

func NewAdminService() *AdminService {
	return &AdminService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AdminService) GetList(ctx *gin.Context, req models.AdminListReq) (interface{}, error) {
	var (
		admins []models.Admin
		total  int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Username) > 0 {
		db = db.Where("username LIKE ?", "%"+req.Username+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&admins).
		Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.AdminListRes{
		Total: total,
		List:  admins,
	}, nil
}

func (s *AdminService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var AdminInfo models.Admin

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&AdminInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if AdminInfo.Id == 0 {
		return nil, errors.New("Admin error")
	}
	return AdminInfo, nil
}

func (s *AdminService) Create(ctx *gin.Context, req models.AdminCreateReq) (interface{}, error) {
	var (
		admin models.Admin
		count int64
	)
	s.dbClient.MysqlClient.Model(admin).
		Where("username=?", req.Username).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	admin.Username = req.Username
	if len(req.Password) <= 0 {
		req.Password = fmt.Sprintf("%s%s", req.Username, "123456")
	}
	admin.Password = req.Password
	admin.GroupId = req.GroupId

	admin.Expiration = tools.SetExpiration()
	admin.Salt = tools.CreateSalt()
	admin.Password = tools.GenPassword(admin.Salt, req.Password)
	err := s.dbClient.MysqlClient.Save(&admin).Error
	if err != nil {
		return nil, err
	}
	return req.Password, nil
}

func (s *AdminService) Delete(ctx *gin.Context, req models.AdminDelReq) (interface{}, error) {
	var (
		Admin models.Admin
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Admin)
	if Admin.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	err := s.dbClient.MysqlClient.Delete(&Admin).Error
	if err != nil {
		return nil, err
	}
	return Admin.Id, nil
}

func (s *AdminService) ChangeField(ctx *gin.Context, req models.AdminFieldReq) (interface{}, error) {
	var (
		Admin models.Admin
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Admin)
	if Admin.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	Admin.Status = req.Status
	err := s.dbClient.MysqlClient.Save(&Admin).Error
	if err != nil {
		return nil, err
	}
	return Admin.Id, nil
}
