package service

import (
	"errors"
	"fmt"
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

func (s *LangService) GetList(ctx *gin.Context, req models.LangListReq) (interface{}, error) {
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
	if LangInfo.Id < 0 {
		return nil, errors.New("Lang error")
	}
	return LangInfo, nil
}
func (s *LangService) Create(ctx *gin.Context, req models.LangCreateReq) (interface{}, error) {
	var (
		Lang  models.Lang
		count int64
	)

	s.dbClient.MysqlClient.Model(Lang).
		Where("lang = ?", req.Lang).
		Count(&count)
	fmt.Println(req)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	Lang.Name = req.Name
	Lang.Lang = req.Lang
	err := s.dbClient.MysqlClient.Save(&Lang).Error
	if err != nil {
		return nil, err
	}
	return Lang.Id, nil
}

func (s *LangService) Update(ctx *gin.Context, req models.LangUpdateReq) (interface{}, error) {
	var (
		Lang  models.Lang
		count int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Lang)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(Lang).
		Where("id != ? and lang=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	Lang.Name = req.Name
	Lang.Lang = req.Lang
	err := s.dbClient.MysqlClient.Save(&Lang).Error
	if err != nil {
		return nil, err
	}
	return Lang.Id, nil
}
func (s *LangService) Delete(ctx *gin.Context, req models.LangDelReq) (interface{}, error) {
	var lang models.Lang
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&lang)
	if lang.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	err := s.dbClient.MysqlClient.Delete(&lang).Error
	if err != nil {
		return nil, err
	}
	return lang.Id, nil
}
