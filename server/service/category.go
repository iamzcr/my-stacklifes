package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
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
		categorys       []models.Category
		parentCategorys []models.Category
		categoryList    []models.CategoryInfo
		parentMap       = make(map[int]string)
		statusMap       = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		typeMap = map[int]string{
			constant.MenuNavType: constant.MenuNavTypeName,
		}
		total int64
	)

	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}

	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&categorys).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}

	db.Where("parent=?", constant.TopParent).Select("id,name").Order("id DESC").Find(&parentCategorys)
	for _, parentCategory := range parentCategorys {
		parentMap[parentCategory.Id] = parentCategory.Name
	}

	for _, temp := range categorys {
		parentName := "顶级分类"
		if _, ok := parentMap[temp.Parent]; ok {
			parentName = parentMap[temp.Parent]
		}
		categoryList = append(categoryList, models.CategoryInfo{
			Id:         temp.Id,
			Name:       temp.Name,
			Author:     temp.Author,
			Status:     temp.Status,
			Weight:     temp.Weight,
			Type:       temp.Type,
			Mark:       temp.Mark,
			StatusName: statusMap[temp.Status],
			TypeName:   typeMap[temp.Type],
			ParentName: parentName,
			CreateTime: tools.UnixToTime(temp.CreateTime),
		})

	}
	return models.CategoryListRes{
		Total: total,
		List:  categoryList,
	}, nil
}

func (s *CategoryService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var category models.Category

	res := s.dbClient.MysqlClient.Where("id=?", id).First(&category)
	if res.Error != nil {
		return nil, res.Error
	}
	if category.Id == 0 {
		return nil, errors.New("category error")
	}
	return category, nil
}

func (s *CategoryService) Create(ctx *gin.Context, req models.CategoryCreateReq) (interface{}, error) {
	var category models.Category

	db := s.dbClient.MysqlClient
	db.Model(&category).Where("name=?", req.Name).First(&category)
	if category.Id > 0 {
		return nil, errors.New("记录已存在")
	}

	category.Name = req.Name
	category.Mark = tools.ConvertToPinyin(req.Name)
	category.Weight = req.Weight
	err := db.Create(&category).Error
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

	db := s.dbClient.MysqlClient
	res := db.Where("id=?", req.Id).First(&category)
	if res.Error != nil {
		return nil, res.Error
	}
	if category.Id <= 0 {
		return nil, errors.New("记录不存在")
	}

	db.Model(&category).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	category.Name = req.Name
	category.Weight = req.Weight
	err := db.Save(&category).Error
	if err != nil {
		return nil, err
	}

	return category.Id, nil
}

func (s *CategoryService) Delete(ctx *gin.Context, req models.CategoryDelReq) (interface{}, error) {
	var (
		category     models.Category
		article      models.Article
		articleCount int64
	)
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).Find(&category)
	if category.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&article).Where("cid=?", req.Id).Count(&articleCount)
	if articleCount > 0 {
		return nil, errors.New("该分类下有文章，不能删除")
	}

	err := db.Delete(&category).Error
	if err != nil {
		return nil, err
	}

	return category.Id, nil
}

// frontend获取分类导航
func (s *CategoryService) GetNavList(ctx *gin.Context) (interface{}, error) {
	var (
		categoryList []models.CategoryMine
		category     []models.Category
	)

	db := s.dbClient.MysqlClient

	err := db.Model(&category).
		Where("status = ?", constant.StatusTrue).
		Where("type = ?", constant.CategoryNavType).
		Select("id,mark,name").
		Order("weight DESC").Find(&categoryList).Error
	if err != nil {
		return nil, err
	}

	return models.CategoryNavListRes{
		List: categoryList,
	}, nil
}
