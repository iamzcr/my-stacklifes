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

func (s *ArticleService) GetList(ctx *gin.Context, req models.ArticleReq) (interface{}, error) {
	var (
		articles []models.Article
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Title) > 0 {
		db = db.Where("title LIKE ?", "%"+req.Title+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&articles).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.ArticleListRes{
		Total: total,
		List:  articles,
	}, nil
}

func (s *ArticleService) GetDetail(ctx *gin.Context, id string) (interface{}, error) {
	var (
		article models.Article
	)
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&article)
	if res.Error != nil {
		return nil, res.Error
	}
	if article.Id == 0 {
		return nil, errors.New("article error")
	}
	return models.Article{Id: article.Id, Title: article.Title, Content: article.Content}, nil
}
