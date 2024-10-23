package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
)

type MenuService struct {
	dbClient *mysql.DbClient
}

func NewMenuService() *MenuService {
	return &MenuService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *MenuService) GetList(ctx *gin.Context, req models.MenuListReq) (interface{}, error) {
	var (
		menus []models.Menu
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&menus).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.MenuListRes{
		Total: total,
		List:  menus,
	}, nil
}

func (s *MenuService) Create(ctx *gin.Context, req models.MenuCreateReq) (interface{}, error) {
	var (
		menu  models.Menu
		count int64
	)
	db := s.dbClient.MysqlClient
	db.Where("name=?", req.Name).Count(&count)
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
	menu.Status = req.Status
	err := db.Create(&menu).Error
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
	db.Where("id != ? and name=?", req.Id, req.Name).Count(&count)
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
	err := db.Save(&menu).Error
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
	db.Where("id=?", req.Id).Find(&menu)
	if menu.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	db.Where("parent=?", req.Id).Find(&menu).Count(&count)
	if count > 0 {
		return nil, errors.New("该菜单下有子菜单")
	}
	err := db.Delete(&menu).Error
	if err != nil {
		return nil, err
	}
	return menu.Id, nil
}

func (s *MenuService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var menu models.Menu
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&menu)
	if res.Error != nil {
		return nil, res.Error
	}
	if menu.Id == 0 {
		return nil, errors.New("website error")
	}
	return menu, nil
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

func (s *MenuService) GetParentList() (interface{}, error) {
	var menus []models.MenuMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Menu{}).Debug().Where("status = ?", constant.STATUS_TRUE).
		Where("parent=?", constant.TOP_PARENT).
		Select("id,parent,name").
		Order("id DESC").Find(&menus).Error
	if err != nil {
		return nil, err
	}
	return menus, nil
}

func (s *MenuService) GetTreeList(ctx *gin.Context, req models.MenuListReq) (interface{}, error) {
	var (
		menus []models.Menu
		total int64
	)
	db := s.dbClient.MysqlClient
	db = db.Model(&models.Menu{}).Where("status = ?", 1)
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
