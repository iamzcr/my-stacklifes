package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type MenuService struct {
	dbClient *mysql.DbClient
}

func NewMenuService() *MenuService {
	return &MenuService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *MenuService) GetList(ctx *gin.Context, req models.MenuReq) (interface{}, error) {
	var (
		menus []models.Menu
		count int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&menus).Count(&count).Error
	if err != nil {
		return nil, err
	}

	return models.MenuListRes{
		Total: count,
		List:  menus,
	}, nil
}

func (s *MenuService) GetNoPageList(ctx *gin.Context, req models.MenuNoPageReq) (interface{}, error) {
	var menus []models.MenuMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Menu{}).Where("status = ?", req.Status).Select("id,parent,name").
		Order("id DESC").Find(&menus).Error

	if err != nil {
		return nil, err
	}
	return models.MenuNoPageListRes{
		List: menus,
	}, nil
}

func (s *MenuService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var menu models.Menu

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&menu)
	if res.Error != nil {
		return nil, res.Error
	}
	if menu.Id == 0 {
		return nil, errors.New("category error")
	}
	return menu, nil
}

func (s *MenuService) Create(ctx *gin.Context, req models.MenuCreateReq) (interface{}, error) {
	var (
		menu  models.Menu
		count int64
	)
	db := s.dbClient.MysqlClient
	db.Model(menu).
		Where("name=?", req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	menu.Name = req.Name
	menu.Type = req.Type
	menu.Mark = req.Mark
	menu.Parent = req.Parent
	menu.Author = req.Author
	menu.Url = req.Url
	menu.Icon = req.Icon
	menu.Weight = req.Weight
	err := db.Model(menu).Create(&menu).Error
	if err != nil {
		return nil, err
	}
	return menu.Id, nil
}

func (s *MenuService) Delete(ctx *gin.Context, req models.MenuDelReq) (interface{}, error) {
	var (
		menu  models.Menu
		count int64
	)
	db := s.dbClient.MysqlClient
	db.Model(menu).Where("id=?", req.Id).Find(&menu)
	if menu.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	db.Model(menu).Where("parent=?", req.Id).Find(&menu).Count(&count)
	if count > 0 {
		return nil, errors.New("该菜单下有子菜单")
	}
	err := db.Model(menu).Delete(&menu).Error
	if err != nil {
		return nil, err
	}
	return menu.Id, nil
}

func (s *MenuService) Update(ctx *gin.Context, req models.MenuUpdateReq) (interface{}, error) {
	var (
		menu  models.Menu
		count int64
	)
	db := s.dbClient.MysqlClient
	res := db.Model(menu).Where("id=?", req.Id).Find(&menu)
	if res.Error != nil {
		return nil, res.Error
	}
	db.Model(menu).
		Where("id != ? and name=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	menu.Name = req.Name
	menu.Type = req.Type
	menu.Mark = req.Mark
	menu.Parent = req.Parent
	menu.Author = req.Author
	menu.Url = req.Url
	menu.Icon = req.Icon
	menu.Weight = req.Weight
	err := db.Model(menu).Save(&menu).Error
	if err != nil {
		return nil, err
	}
	return menu.Id, nil
}

func (s *MenuService) GetTreeList(ctx *gin.Context, req models.MenuReq) (interface{}, error) {
	var (
		menus []models.Menu
		total int64
	)
	db := s.dbClient.MysqlClient
	db = db.Where("status = ?", 1)
	err := db.Order("id DESC").
		Find(&menus).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.MenuListRes{
		Total: total,
		List:  menus,
	}, nil
}
