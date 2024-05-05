package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type LogFailService struct {
	dbClient *mysql.DbClient
}

func NewLogFailService() *LogFailService {
	return &LogFailService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *LogFailService) GetList(ctx *gin.Context, req models.LogFailReq) (interface{}, error) {
	var (
		logFails []models.LogFail
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Content) > 0 {
		db = db.Where("content LIKE ?", "%"+req.Content+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&logFails).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.LogFailListRes{
		Total: total,
		List:  logFails,
	}, nil
}
