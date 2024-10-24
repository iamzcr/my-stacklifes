package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
	"time"
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
		websites    []models.Website
		total       int64
		websiteList []models.WebsiteInfo
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&websites).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	for _, temp := range websites {
		websiteList = append(websiteList, models.WebsiteInfo{
			Id:         temp.Id,
			Name:       temp.Name,
			Key:        temp.Key,
			Value:      temp.Value,
			CreateTime: tools.UnixToTime(temp.CreateTime),
		})
	}
	return models.WebsiteListRes{
		Total: total,
		List:  websiteList,
	}, nil
}

func (s *WebsiteService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var websiteInfo models.Website

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&websiteInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if websiteInfo.Id <= 0 {
		return nil, errors.New("记录不存在")
	}

	return websiteInfo, nil
}

func (s *WebsiteService) Create(ctx *gin.Context, req models.WebsiteCreateReq) (interface{}, error) {
	var website models.Website

	db := s.dbClient.MysqlClient

	db.Where("key=?", req.Key).First(&website)
	if website.Id > 0 {
		return nil, errors.New("存在相同的key")
	}

	website.Name = req.Name
	website.Key = req.Key
	website.Value = req.Value
	website.CreateTime = time.Now().Unix()
	err := db.Save(&website).Error
	if err != nil {
		return nil, err
	}

	return website.Id, nil
}

func (s *WebsiteService) Update(ctx *gin.Context, req models.WebsiteUpdateReq) (interface{}, error) {
	var (
		website models.Website
		count   int64
	)
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&website)
	if website.Id <= 0 {
		return nil, errors.New("记录不存在")
	}

	db.Model(&website).Where("id != ? and key=?", req.Id, req.Key).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的key记录")
	}

	website.Name = req.Name
	website.Key = req.Key
	website.Value = req.Value
	website.UpdatedTime = time.Now().Unix()
	err := s.dbClient.MysqlClient.Save(&website).Error
	if err != nil {
		return nil, err
	}

	return website.Id, nil
}

func (s *WebsiteService) Delete(ctx *gin.Context, req models.WebsiteDelReq) (interface{}, error) {
	var website models.Website
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&website)
	if website.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	err := db.Delete(&website).Error
	if err != nil {
		return nil, err
	}

	return website.Id, nil
}

func (s *WebsiteService) FrontendList(ctx *gin.Context) (interface{}, error) {
	var websiteList []models.WebsiteInfo

	db := s.dbClient.MysqlClient
	err := db.Model(&models.Website{}).
		Order("id DESC").
		Select("key,value,name").
		Find(&websiteList).Error
	if err != nil {
		return nil, err
	}

	return models.WebsiteFrontendList{
		List: websiteList,
	}, nil
}
