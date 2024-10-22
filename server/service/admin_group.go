package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"github.com/mozillazg/go-pinyin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type AdminGroupService struct {
	dbClient *mysql.DbClient
}

func NewAdminGroupService() *AdminGroupService {
	return &AdminGroupService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AdminGroupService) GetList(ctx *gin.Context, req models.AdminGroupListReq) (interface{}, error) {
	var (
		adminGroups []models.AdminGroup
		total       int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&adminGroups).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.AdminGroupListRes{
		Total: total,
		List:  adminGroups,
	}, nil
}

func (s *AdminGroupService) GetNoPageList(ctx *gin.Context, req models.AdminGroupNoPageReq) (interface{}, error) {
	var adminGroups []models.AdminGroupMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.AdminGroup{}).
		Where("status = ?", req.Status).
		Select("id,mark,name").
		Order("id DESC").Find(&adminGroups).Error

	if err != nil {
		return nil, err
	}
	return models.AdminGroupNoPageListRes{
		List: adminGroups,
	}, nil
}

func (s *AdminGroupService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var adminGroupInfo models.AdminGroup
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&adminGroupInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if adminGroupInfo.Id == 0 {
		return nil, errors.New("AdminGroup error")
	}
	return adminGroupInfo, nil
}

func (s *AdminGroupService) Create(ctx *gin.Context, req models.AdminGroupCreateReq) (interface{}, error) {
	var (
		adminGroup models.AdminGroup
		count      int64
	)
	s.dbClient.MysqlClient.Model(adminGroup).Where("name=?", req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	a := pinyin.NewArgs()
	a.Style = pinyin.Normal
	adminGroup.Name = req.Name
	adminGroup.Description = req.Description
	adminGroup.Mark = pinyin.Slug(req.Name, pinyin.NewArgs())
	err := s.dbClient.MysqlClient.Save(&adminGroup).Error
	if err != nil {
		return nil, err
	}
	return adminGroup.Id, nil
}

func (s *AdminGroupService) Update(ctx *gin.Context, req models.AdminGroupUpdateReq) (interface{}, error) {
	var (
		adminGroup models.AdminGroup
		count      int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&adminGroup)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(adminGroup).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	adminGroup.Name = req.Name
	adminGroup.Description = req.Description
	err := s.dbClient.MysqlClient.Save(&adminGroup).Error
	if err != nil {
		return nil, err
	}
	return adminGroup.Id, nil
}

func (s *AdminGroupService) Delete(ctx *gin.Context, req models.AdminGroupDelReq) (interface{}, error) {
	var (
		adminGroup models.AdminGroup
		admin      []models.Admin
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&adminGroup)
	if adminGroup.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("group_id=?", req.Id).Find(&admin)
	if len(admin) > 0 {
		return nil, errors.New("该用户组已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&adminGroup).Error
	if err != nil {
		return nil, err
	}
	return adminGroup.Id, nil
}
