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
func (s *ArticleTagsService) GetAid(tid int64) []int {
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

func (s *ArticleTagsService) SetAid(tid []int64, aid int64) ([]int, error) {
	var (
		acticleTags []models.ArticleTagsMine
		aids        []int
		count       int64
	)
	s.dbClient.MysqlClient.Model(&models.ArticleTags{}).Where("tid=?", id).Find(&acticleTags).Count(&count)
	for _, acticleTag := range acticleTags {
		aids = append(aids, acticleTag.Aid)
	}
	if count < 0 {
		return nil, errors.New("no acticle")
	}
	return aids, nil
}
