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

//func (s *TagsService) GetNoPageList(ctx *gin.Context, req models.TagsNoPageReq) (interface{}, error) {
//	db := s.dbClient.MysqlClient
//	if req.Parent != 0 {
//		db = db.Where("parent=?", req.Parent)
//	}
//}

func (s *TagsService) GetList(ctx *gin.Context, req models.TagsListReq) (interface{}, error) {
	var (
		categories []models.Tags
		total      int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&categories).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.TagsListRes{
		Total: total,
		List:  categories,
	}, nil
}

func (s *TagsService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var TagsInfo models.Tags

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&TagsInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if TagsInfo.Id == 0 {
		return nil, errors.New("Tags error")
	}
	return TagsInfo, nil
}

func (s *TagsService) Create(ctx *gin.Context, req models.TagsCreateReq) (interface{}, error) {
	var (
		Tags  models.Tags
		count int64
	)
	s.dbClient.MysqlClient.Model(Tags).
		Where("name=?", req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	Tags.Name = req.Name
	Tags.Mark = req.Mark
	Tags.Type = req.Type
	Tags.Author = req.Author
	Tags.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&Tags).Error
	if err != nil {
		return nil, err
	}
	return Tags.Id, nil
}

func (s *TagsService) Update(ctx *gin.Context, req models.TagsUpdateReq) (interface{}, error) {
	var (
		Tags  models.Tags
		count int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Tags)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(Tags).
		Where("id != ? and name=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	Tags.Name = req.Name
	Tags.Mark = req.Mark
	Tags.Type = req.Type
	Tags.Author = req.Author
	Tags.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&Tags).Error
	if err != nil {
		return nil, err
	}
	return Tags.Id, nil
}
func (s *TagsService) Delete(ctx *gin.Context, req models.TagsDelReq) (interface{}, error) {
	var (
		Tags     models.Tags
		articles []models.Article
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&Tags)
	if Tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("cid=?", req.Id).Find(&articles)
	if len(articles) > 0 {
		return nil, errors.New("该标签已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&Tags).Error
	if err != nil {
		return nil, err
	}
	return Tags.Id, nil
}
