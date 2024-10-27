package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
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
	var info models.Lang

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&info)
	if res.Error != nil {
		return nil, res.Error
	}
	if info.Id < 0 {
		return nil, errors.New("Lang error")
	}

	return info, nil
}
func (s *LangService) Create(ctx *gin.Context, req models.LangCreateReq) (interface{}, error) {
	var lang models.Lang
	db := s.dbClient.MysqlClient
	db.Where("lang = ?", req.Lang).First(&lang)
	if lang.Id > 0 {
		return nil, errors.New("记录已存在")
	}

	lang.Name = req.Name
	lang.Lang = req.Lang
	err := db.Create(&lang).Error
	if err != nil {
		return nil, err
	}

	return lang.Id, nil
}

func (s *LangService) Update(ctx *gin.Context, req models.LangUpdateReq) (interface{}, error) {
	var (
		lang  models.Lang
		count int64
	)
	db := s.dbClient.MysqlClient

	res := db.Where("id=?", req.Id).First(&lang)
	if res.Error != nil {
		return nil, res.Error
	}
	if lang.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(lang).Where("id != ? and lang=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	lang.Name = req.Name
	lang.Lang = req.Lang
	err := db.Save(&lang).Error
	if err != nil {
		return nil, err
	}

	return lang.Id, nil
}

func (s *LangService) Delete(ctx *gin.Context, req models.LangDelReq) (interface{}, error) {
	var lang models.Lang
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&lang)
	if lang.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	err := db.Delete(&lang).Error
	if err != nil {
		return nil, err
	}

	return lang.Id, nil
}

func (s *LangService) LangConfig(ctx *gin.Context) interface{} {
	statusMap := map[string]string{
		constant.LangZh: constant.LangZhName,
	}
	return statusMap
}
