package service

import (
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
	err := s.dbClient.MysqlClient.Model(&categories).Count(&total).Error
	if err != nil {
		return nil, err
	}
	limit, offset := req.GetPageInfo()
	_ = s.dbClient.MysqlClient.
		Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&categories)
	return models.CategoryListRes{
		Total: total,
		List:  categories,
	}, nil
}
