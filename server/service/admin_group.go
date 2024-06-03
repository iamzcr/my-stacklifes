package service

import (
	"errors"
	"github.com/gin-gonic/gin"
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

func (s *AdminGroupService) GetNoPageList(req models.AdminGroupNoPageReq) (interface{}, error) {
	var adminGroups []models.AdminGroup
	db := s.dbClient.MysqlClient
	err := db.Where("status = ?", req.Status).
		Order("id DESC").
		Find(&adminGroups).Error
	if err != nil {
		return nil, err
	}
	return models.AdminGroupListRes{
		List: adminGroups,
	}, nil
}
func (s *AdminGroupService) GetList(ctx *gin.Context, req models.AdminGroupListReq) (interface{}, error) {
	var (
		admin_groups []models.AdminGroup
		total        int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&admin_groups).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.AdminGroupListRes{
		Total: total,
		List:  admin_groups,
	}, nil
}

func (s *AdminGroupService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var AdminGroupInfo models.AdminGroup

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&AdminGroupInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if AdminGroupInfo.Id == 0 {
		return nil, errors.New("AdminGroup error")
	}
	return AdminGroupInfo, nil
}

func (s *AdminGroupService) Create(ctx *gin.Context, req models.AdminGroupCreateReq) (interface{}, error) {
	var (
		AdminGroup models.AdminGroup
		count      int64
	)
	s.dbClient.MysqlClient.Model(AdminGroup).
		Where("name=?", req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	AdminGroup.Name = req.Name
	AdminGroup.Mark = req.Mark

	err := s.dbClient.MysqlClient.Save(&AdminGroup).Error
	if err != nil {
		return nil, err
	}
	return AdminGroup.Id, nil
}

func (s *AdminGroupService) Update(ctx *gin.Context, req models.AdminGroupUpdateReq) (interface{}, error) {
	var (
		AdminGroup models.AdminGroup
		count      int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&AdminGroup)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(AdminGroup).
		Where("id != ? and name=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	AdminGroup.Name = req.Name
	AdminGroup.Mark = req.Mark
	err := s.dbClient.MysqlClient.Save(&AdminGroup).Error
	if err != nil {
		return nil, err
	}
	return AdminGroup.Id, nil
}

func (s *AdminGroupService) Delete(ctx *gin.Context, req models.AdminGroupDelReq) (interface{}, error) {
	var (
		AdminGroup models.AdminGroup
		articles   []models.Article
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&AdminGroup)
	if AdminGroup.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("cid=?", req.Id).Find(&articles)
	if len(articles) > 0 {
		return nil, errors.New("该分类已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&AdminGroup).Error
	if err != nil {
		return nil, err
	}
	return AdminGroup.Id, nil
}
