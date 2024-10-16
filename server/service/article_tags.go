package service

import (
	"errors"
	"fmt"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type ArticleTagsService struct {
	dbClient *mysql.DbClient
}

func NewArticleTagsService() *ArticleTagsService {
	return &ArticleTagsService{
		dbClient: mysql.NewDbClient(),
	}
}
func (s *ArticleTagsService) GetAid(id string) ([]int, error) {
	var (
		acticleTags []models.ArticleTagsMine
		aids        []int
		count       int64
	)
	s.dbClient.MysqlClient.Model(&models.ArticleTags{}).Debug().Where("tid=?", id).Find(&acticleTags).Count(&count)
	fmt.Println(acticleTags)
	for _, acticleTag := range acticleTags {
		aids = append(aids, acticleTag.AId)
	}
	if count < 0 {
		return nil, errors.New("no acticle")
	}
	return aids, nil
}
