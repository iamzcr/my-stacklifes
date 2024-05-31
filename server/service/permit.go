package service

import (
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
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&permit).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.PermitListRes{
		Total: total,
		List:  permit,
	}, nil
}
