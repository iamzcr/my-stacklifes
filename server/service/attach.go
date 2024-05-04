package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type AttachService struct {
	dbClient *mysql.DbClient
}

func NewAttachService() *AttachService {
	return &AttachService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AttachService) GetList(ctx *gin.Context, req models.AttachReq) (interface{}, error) {
	var (
		categories []models.Attach
		total      int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&categories).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.AttachListRes{
		Total: total,
		List:  categories,
	}, nil
}

func (s *AttachService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var AttachInfo models.Attach

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&AttachInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if AttachInfo.Id == 0 {
		return nil, errors.New("Attach error")
	}
	return AttachInfo, nil
}
func (s *AttachService) Update(ctx *gin.Context, req models.Attach) (interface{}, error) {
	var (
		Attach models.Attach
		count  int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Attach)
	if res.Error != nil {
		return nil, res.Error
	}
	if Attach.Id > 0 {
		s.dbClient.MysqlClient.Model(Attach).
			Where("id != ? and name=?", req.Id, req.Name).
			Count(&count)
		if count > 0 {
			return nil, errors.New("记录已存在")
		}
		return nil, errors.New("不存在该记录")
	} else {
	}
	//
	//Attach.Name = req.Name
	//err := s.dbClient.MysqlClient.Save(&Attach).Error
	//if err != nil {
	//	return nil, err
	//}
	return Attach, nil
}
