package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"time"
)

type ReadService struct {
	dbClient *mysql.DbClient
}

func NewReadService() *ReadService {
	return &ReadService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *ReadService) GetList(ctx *gin.Context, req models.ReadReq) (interface{}, error) {
	var (
		reads []models.Read
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Ip) > 0 {
		db = db.Where("ip LIKE ?", "%"+req.Ip+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&reads).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.ReadListRes{
		Total: total,
		List:  reads,
	}, nil
}

func (s *ReadService) Create(ctx *gin.Context, req models.ReadCreateReq) (interface{}, error) {
	var (
		read models.Read
		//count int64
	)
	/**
	s.dbClient.MysqlClient.Model(read).
		Where("ip=?", req.Ip).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	*/
	read.Ip = req.Ip
	read.Referer = req.Referer
	read.Aid = req.Aid
	read.CreateTime = time.Now().Unix()
	err := s.dbClient.MysqlClient.Create(&read).Error
	if err != nil {
		return nil, err
	}
	return read.Id, nil
}
