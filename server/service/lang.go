package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type LangService struct {
	dbClient *mysql.DbClient
}

func NewLangService() *LangService {
	return &LangService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *LangService) GetList(ctx *gin.Context, req models.LangReq) (interface{}, error) {
	var (
		langs []models.Lang
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&langs).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.LangListRes{
		Total: total,
		List:  langs,
	}, nil
}

func (s *LangService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var LangInfo models.Lang

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&LangInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if LangInfo.Id == 0 {
		return nil, errors.New("Lang error")
	}
	return LangInfo, nil
}
func (s *LangService) Update(ctx *gin.Context, req models.Lang) (interface{}, error) {
	var (
		Lang  models.Lang
		count int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Lang)
	if res.Error != nil {
		return nil, res.Error
	}
	if Lang.Id > 0 {
		s.dbClient.MysqlClient.Model(Lang).
			Where("id != ? and name=?", req.Id, req.Name).
			Count(&count)
		if count > 0 {
			return nil, errors.New("记录已存在")
		}
		return nil, errors.New("不存在该记录")
	} else {

	}

	//
	//Lang.Name = req.Name
	//err := s.dbClient.MysqlClient.Save(&Lang).Error
	//if err != nil {
	//	return nil, err
	//}
	return Lang, nil
}
