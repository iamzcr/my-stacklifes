package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type CategoryService struct {
	dbClient *mysql.DbClient
}

func NewCategoryService() *CategoryService {
	return &CategoryService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *CategoryService) GetList(ctx *gin.Context, req models.CategoryListReq) (interface{}, error) {
	var (
		categories []models.Category
		total      int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Debug().Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&categories).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.CategoryListRes{
		Total: total,
		List:  categories,
	}, nil
}

func (s *CategoryService) GetNoPageList(ctx *gin.Context, req models.CategoryNoPageReq) (interface{}, error) {
	var categorys []models.CategoryMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Category{}).Where("status = ?", req.Status).Select("id,mark,name").
		Order("id DESC").Find(&categorys).Error

	if err != nil {
		return nil, err
	}
	return models.CategoryNoPageListRes{
		List: categorys,
	}, nil
}

func (s *CategoryService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var categoryInfo models.Category

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&categoryInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if categoryInfo.Id == 0 {
		return nil, errors.New("category error")
	}
	return categoryInfo, nil
}

func (s *CategoryService) Create(ctx *gin.Context, req models.CategoryCreateReq) (interface{}, error) {
	var (
		category models.Category
		count    int64
	)
	s.dbClient.MysqlClient.Model(category).
		Where("name=?", req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	category.Name = req.Name
	category.Mark = req.Mark
	category.Parent = req.Parent
	category.Type = req.Type
	category.Author = req.Author
	category.Weight = req.Weight
	err := s.dbClient.MysqlClient.Create(&category).Error
	if err != nil {
		return nil, err
	}
	return category.Id, nil
}

func (s *CategoryService) Update(ctx *gin.Context, req models.CategoryUpdateReq) (interface{}, error) {
	var (
		category models.Category
		count    int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&category)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(category).
		Where("id != ? and name=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	category.Name = req.Name
	category.Mark = req.Mark
	category.Parent = req.Parent
	category.Type = req.Type
	category.Author = req.Author
	category.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&category).Error
	if err != nil {
		return nil, err
	}
	return category.Id, nil
}

func (s *CategoryService) Delete(ctx *gin.Context, req models.CategoryDelReq) (interface{}, error) {
	var (
		category models.Category
		articles []models.Article
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&category)
	if category.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("cid=?", req.Id).Find(&articles)
	if len(articles) > 0 {
		return nil, errors.New("该分类已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&category).Error
	if err != nil {
		return nil, err
	}
	return category.Id, nil
}

func (s *CategoryService) GetNavList(ctx *gin.Context, req models.CategoryNavListReq) (interface{}, error) {
	var categorys []models.CategoryMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Category{}).Where("status = ?", req.Status).Where("type = ?", req.Type).Select("id,mark,name").
		Order("weight DESC").Find(&categorys).Error

	if err != nil {
		return nil, err
	}
	return models.CategoryNavListRes{
		List: categorys,
	}, nil
}
