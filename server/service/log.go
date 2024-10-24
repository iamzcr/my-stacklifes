package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
	"time"
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
		logs    []models.Log
		logList []models.LogInfo
		total   int64
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
	for _, log := range logs {
		logList = append(logList, models.LogInfo{
			Id:         log.Id,
			Ip:         log.Ip,
			Content:    log.Content,
			CreateTime: tools.UnixToTime(log.CreateTime),
			Username:   log.Username,
		})
	}
	return models.LogListRes{
		Total: total,
		List:  logList,
	}, nil
}
func (s *LogService) Create(ctx *gin.Context, req models.LogCreateReq) (interface{}, error) {
	var log models.Log

	log.Ip = ctx.ClientIP()
	log.Content = req.Content
	log.CreateTime = time.Now().Unix()
	err := s.dbClient.MysqlClient.Create(&log).Error
	if err != nil {
		return nil, err
	}

	return log.Id, nil
}
