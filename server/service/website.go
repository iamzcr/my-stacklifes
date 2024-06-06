package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type WebsiteService struct {
	dbClient *mysql.DbClient
}

func NewWebsiteService() *WebsiteService {
	return &WebsiteService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *WebsiteService) GetList(ctx *gin.Context, req models.WebsiteListReq) (interface{}, error) {
	var (
		websites []models.Website
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&websites).
		Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.WebsiteListRes{
		Total: total,
		List:  websites,
	}, nil
}

func (s *WebsiteService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var websiteInfo models.Website

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&websiteInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if websiteInfo.Id == 0 {
		return nil, errors.New("website error")
	}
	return websiteInfo, nil
}

func (s *WebsiteService) Create(ctx *gin.Context, req models.WebsiteCreateReq) (interface{}, error) {
	var (
		website models.Website
		count   int64
	)
	s.dbClient.MysqlClient.Model(website).
		Where("key=?", req.Key).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	website.Name = req.Name
	website.Key = req.Key
	website.Value = req.Value
	err := s.dbClient.MysqlClient.Save(&website).Error
	if err != nil {
		return nil, err
	}
	return website.Id, nil
}

func (s *WebsiteService) Delete(ctx *gin.Context, req models.WebsiteDelReq) (interface{}, error) {
	var website models.Website
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&website)
	if website.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	err := s.dbClient.MysqlClient.Delete(&website).Error
	if err != nil {
		return nil, err
	}
	return website.Id, nil
}

func (s *WebsiteService) FrontendList(ctx *gin.Context) (interface{}, error) {
	var websites []models.WebsiteMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Website{}).Order("id DESC").Find(&websites).Error
	if err != nil {
		return nil, err
	}
	return models.WebsiteFrontendList{
		List: websites,
	}, nil
}
