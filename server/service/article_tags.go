package service

import (
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
func (s *ArticleTagsService) GetAid(tid int) []int {
	var (
		acticleTags []models.ArticleTags
		aids        []int
	)
	s.dbClient.MysqlClient.Model(&models.ArticleTags{}).Where("tid=?", tid).Select("aid,tid").Find(&acticleTags)
	for _, acticleTag := range acticleTags {
		aids = append(aids, acticleTag.Aid)
	}
	return aids
}
