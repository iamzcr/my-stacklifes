package service

import (
	"errors"
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

func (s *TagsService) GetList(ctx *gin.Context, req models.TagsListReq) (interface{}, error) {
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

func (s *TagsService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var tagsInfo models.Tags
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&tagsInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if tagsInfo.Id == 0 {
		return nil, errors.New("Tags error")
	}
	return tagsInfo, nil
}

func (s *TagsService) Create(ctx *gin.Context, req models.TagsCreateReq) (interface{}, error) {
	var (
		tags  models.Tags
		count int64
	)
	s.dbClient.MysqlClient.Model(tags).Where("name=?", req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	tags.Name = req.Name
	tags.Mark = req.Mark
	tags.Type = req.Type
	tags.Author = req.Author
	tags.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}

func (s *TagsService) Update(ctx *gin.Context, req models.TagsUpdateReq) (interface{}, error) {
	var (
		tags  models.Tags
		count int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&tags)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(tags).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	tags.Name = req.Name
	tags.Mark = req.Mark
	tags.Type = req.Type
	tags.Author = req.Author
	tags.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}

func (s *TagsService) Delete(ctx *gin.Context, req models.TagsDelReq) (interface{}, error) {
	var (
		tags        models.Tags
		articleTags []models.ArticleTags
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&tags)
	if tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("tid=?", req.Id).Find(&articleTags)
	if len(articleTags) > 0 {
		return nil, errors.New("该标签已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}

func (s *TagsService) ChangeField(ctx *gin.Context, req models.TagsFieldReq) (interface{}, error) {
	var (
		tags models.Tags
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&tags)
	if tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	tags.Status = req.Status
	err := s.dbClient.MysqlClient.Save(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}
