package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type CategoryService struct {
	dbClient *mysql.DbClient
}

func NewCategoryService() *CategoryService {
	return &CategoryService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *CategoryService) GetList(ctx *gin.Context, req models.CategoryReq) (interface{}, error) {
	var (
		categories []models.Category
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

	return models.CategoryListRes{
		Total: total,
		List:  categories,
	}, nil
}

func (s *CategoryService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var categoryInfo models.Category

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&categoryInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if categoryInfo.Id == 0 {
		return nil, errors.New("category error")
	}
	return categoryInfo, nil
}
func (s *CategoryService) Update(ctx *gin.Context, req models.Category) (interface{}, error) {
	var (
		category models.Category
		count    int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&category)
	if res.Error != nil {
		return nil, res.Error
	}
	if category.Id > 0 {
		s.dbClient.MysqlClient.Model(category).
			Where("id != ? and name=?", req.Id, req.Name).
			Count(&count)
		if count > 0 {
			return nil, errors.New("记录已存在")
		}
		return nil, errors.New("不存在该记录")
	} else {

	}

	//
	//category.Name = req.Name
	//err := s.dbClient.MysqlClient.Save(&category).Error
	//if err != nil {
	//	return nil, err
	//}
	return category, nil
}
