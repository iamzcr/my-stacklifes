package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type TagsService struct {
	dbClient *mysql.DbClient
}

func NewTagsService() *TagsService {
	return &TagsService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *TagsService) GetList(ctx *gin.Context, req models.TagsReq) (interface{}, error) {
	var (
		tags  []models.Tags
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&tags).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.TagsListRes{
		Total: total,
		List:  tags,
	}, nil
}
