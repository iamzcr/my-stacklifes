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

func (s *CategoryService) GetList(ctx *gin.Context) (interface{}, error) {
	var (
		category models.Category
	)
	err := mysql.MysqlClient.Find(&category).Error
	if err != nil {
		return nil, err
	}
	if category.Id == 0 {
		return nil, errors.New("article error")
	}
	return models.ArticleInfo{
		Id:    category.Id,
		Title: category.Name,
		// 将 HTML 转换为 Markdown
		Content: category.Type,
		Author:  category.Author,
	}, nil
}
