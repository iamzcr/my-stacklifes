package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type LogService struct {
	dbClient *mysql.DbClient
}

func NewLogService() *LogService {
	return &LogService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *LogService) GetList(ctx *gin.Context, req models.LogReq) (interface{}, error) {
	var (
		logs  []models.Log
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Content) > 0 {
		db = db.Where("content LIKE ?", "%"+req.Content+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&logs).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.LogListRes{
		Total: total,
		List:  logs,
	}, nil
}
