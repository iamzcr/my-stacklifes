package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type ArticleService struct {
	dbClient *mysql.DbClient
}

func NewArticleService() *ArticleService {
	return &ArticleService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *ArticleService) GetList(ctx *gin.Context) (interface{}, error) {
	var (
		article models.Article
	)
	err := mysql.MysqlClient.Find(&article).Error
	if err != nil {
		return nil, err
	}
	if article.Id == 0 {
		return nil, errors.New("article error")
	}
	return models.ArticleInfo{
		Id:    article.Id,
		Title: article.Title,
		// 将 HTML 转换为 Markdown
		Content: article.Content,
		Author:  article.Author,
	}, nil
}

func (s *ArticleService) GetDetail(ctx *gin.Context, id string) (interface{}, error) {
	var (
		article models.Article
	)
	err := s.dbClient.MysqlClient.Where("id=?", id).Find(&article).Error
	if err != nil {
		return nil, err
	}
	if article.Id == 0 {
		return nil, errors.New("article error")
	}
	return models.ArticleInfo{
		Id:    article.Id,
		Title: article.Title,
		// 将 HTML 转换为 Markdown
		Content: article.Content,
		Author:  article.Author,
	}, nil
}
