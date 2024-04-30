package service

import (
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

func (s *AdminGroupService) GetList(ctx *gin.Context, req models.AdminGroupReq) (interface{}, error) {
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
