package service

import (
	"errors"
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
func (s *ArticleTagsService) GetAid(tid int) ([]int, error) {
	var (
		acticleTags []models.ArticleTags
		aids        []int
		count       int64
	)
	s.dbClient.MysqlClient.Where("tid=?", tid).Select("aid,tid").Find(&acticleTags).Count(&count)
	if count <= 0 {
		return nil, errors.New("没有文章绑定该标签")
	}
	for _, acticleTag := range acticleTags {
		aids = append(aids, acticleTag.Aid)
	}
	return aids, nil
}
