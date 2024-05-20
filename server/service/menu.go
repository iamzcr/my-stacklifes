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
		categories []models.Menu
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

	return models.MenuListRes{
		Total: total,
		List:  categories,
	}, nil
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

func (s *MenuService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var menuInfo models.Menu

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&menuInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if menuInfo.Id == 0 {
		return nil, errors.New("Menu error")
	}
	return menuInfo, nil
}
func (s *MenuService) Update(ctx *gin.Context, req models.Menu) (interface{}, error) {
	var (
		menu  models.Menu
		count int64
	)
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&menu)
	if res.Error != nil {
		return nil, res.Error
	}
	if menu.Id > 0 {
		s.dbClient.MysqlClient.Model(menu).
			Where("id != ? and name=?", req.Id, req.Name).
			Count(&count)
		if count > 0 {
			return nil, errors.New("记录已存在")
		}
		return nil, errors.New("不存在该记录")
	} else {

	}

	//
	//Menu.Name = req.Name
	//err := s.dbClient.MysqlClient.Save(&Menu).Error
	//if err != nil {
	//	return nil, err
	//}
	return menu, nil
}
