package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
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
		tags      []models.Tags
		tagsList  []models.TagsInfo
		total     int64
		statusMap = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		typeMap = map[int]string{
			constant.TagsDefaultType: constant.TagsDefaultName,
		}
	)
	//初始化
	tagsList = make([]models.TagsInfo, 0)

	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}

	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&tags).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}

	for _, temp := range tags {
		tagsList = append(tagsList, models.TagsInfo{
			Id:         temp.Id,
			Name:       temp.Name,
			Author:     temp.Author,
			Status:     temp.Status,
			Weight:     temp.Weight,
			StatusName: statusMap[temp.Status],
			TypeName:   typeMap[temp.Type],
			Type:       temp.Type,
			Mark:       temp.Mark,
			CreateTime: tools.UnixToTime(temp.CreateTime),
		})

	}

	return models.TagsListRes{
		Total: total,
		List:  tagsList,
	}, nil
}

func (s *TagsService) Create(ctx *gin.Context, req models.TagsCreateReq) (interface{}, error) {
	var tags models.Tags

	db := s.dbClient.MysqlClient
	db.Where("name=?", req.Name).First(&tags)
	if tags.Id > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	tags.Name = req.Name
	tags.Mark = tools.ConvertToPinyin(req.Name)
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
	db := s.dbClient.MysqlClient
	res := db.Where("id=?", req.Id).First(&tags)
	if res.Error != nil {
		return nil, res.Error
	}

	if tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&tags).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	tags.Name = req.Name
	tags.Weight = req.Weight
	err := db.Save(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}

func (s *TagsService) Delete(ctx *gin.Context, req models.TagsDelReq) (interface{}, error) {
	var (
		tags             models.Tags
		ArticleTags      models.ArticleTags
		articleTagsCount int64
	)

	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&tags)
	if tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&ArticleTags).Where("tid=?", req.Id).Count(&articleTagsCount)
	if articleTagsCount > 0 {
		return nil, errors.New("该标签已被使用,不能删除")
	}

	err := db.Delete(&tags).Error
	if err != nil {
		return nil, err
	}

	return tags.Id, nil
}

func (s *TagsService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var tag models.Tags

	res := s.dbClient.MysqlClient.Where("id=?", id).First(&tag)
	if res.Error != nil {
		return nil, res.Error
	}
	if tag.Id <= 0 {
		return nil, errors.New("Tags error")
	}

	return tag, nil
}

func (s *TagsService) GetTagsList(ctx *gin.Context) (interface{}, error) {
	var (
		tagsList []models.TagsInfo
		tags     models.Tags
	)
	db := s.dbClient.MysqlClient
	err := db.Model(&tags).Where("status = ?", constant.StatusTrue).Select("id,mark,name").
		Order("id DESC").Find(&tagsList).Error
	if err != nil {
		return nil, err
	}

	return tagsList, nil
}

func (s *TagsService) GetTagsMap(ctx *gin.Context) map[int]string {
	var tagsMap = make(map[int]string)
	var tagsList []models.TagsMine
	db := s.dbClient.MysqlClient
	db.Model(&models.Tags{}).
		Select("id,name").Order("id DESC").Find(&tagsList)
	for _, tags := range tagsList {
		tagsMap[tags.Id] = tags.Name
	}
	return tagsMap
}

func (s *TagsService) ChangeField(ctx *gin.Context, req models.TagsFieldReq) (interface{}, error) {
	var tags models.Tags

	db := s.dbClient.MysqlClient
	db.Where("id=?", req.Id).First(&tags)
	if tags.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	tags.Status = req.Status
	err := db.Save(&tags).Error
	if err != nil {
		return nil, err
	}
	return tags.Id, nil
}
