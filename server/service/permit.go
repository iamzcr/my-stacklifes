package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type PermitService struct {
	dbClient *mysql.DbClient
}

func NewPermitService() *PermitService {
	return &PermitService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *PermitService) GetList(ctx *gin.Context, req models.PermitListReq) (interface{}, error) {
	var (
		permit []models.Permit
		total  int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&permit).Error
	if err != nil {
		return nil, err
	}
	db.Model(permit).Count(&total)
	if err != nil {
		return nil, err
	}

	return models.PermitListRes{
		Total: total,
		List:  permit,
	}, nil
}

func (s *PermitService) PermitNoPageList(ctx *gin.Context, req models.PermitNoPageReq) (interface{}, error) {
	var (
		permit []models.PermitMine
		total  int64
	)
	db := s.dbClient.MysqlClient

	err := db.Model(&models.Permit{}).Where("permit = ?", req.Parent).Order("id DESC").
		Select("id,name,parent").Find(&permit).Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.PermitNoPageListRes{
		List: permit,
	}, nil
}

func (s *PermitService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var permitInfo models.Permit
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&permitInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if permitInfo.Id == 0 {
		return nil, errors.New("Permit error")
	}
	return permitInfo, nil
}

func (s *PermitService) Create(ctx *gin.Context, req models.PermitCreateReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	s.dbClient.MysqlClient.Model(permit).Where("name=?", req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	permit.Name = req.Name
	permit.Type = req.Type
	permit.Parent = req.Parent
	permit.Modules = req.Modules
	err := s.dbClient.MysqlClient.Create(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}

func (s *PermitService) Update(ctx *gin.Context, req models.PermitUpdateReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&permit)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	permit.Name = req.Name
	permit.Type = req.Type
	permit.Parent = req.Parent
	permit.Modules = req.Modules
	err := s.dbClient.MysqlClient.Save(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}

func (s *PermitService) Delete(ctx *gin.Context, req models.PermitDelReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&permit)
	if permit.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("parent=?", req.Id).Find(&permit).Count(&count)
	if count > 0 {
		return nil, errors.New("该权限有子权限")
	}
	err := s.dbClient.MysqlClient.Delete(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}
