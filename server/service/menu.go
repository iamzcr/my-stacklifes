package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
	"time"
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
		menus       []models.Menu
		parentMenus []models.Menu
		total       int64
		menuList    []models.MenuInfo
		parentMap   = make(map[int]string)
		statusMap   = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		typeMap = map[int]string{
			constant.MenuNavType: constant.MenuNavTypeName,
		}
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
	db.Where("parent=?", constant.TopParent).Select("id,name").Order("id DESC").Find(&parentMenus)
	for _, parentMenu := range parentMenus {
		parentMap[parentMenu.Id] = parentMenu.Name
	}
	for _, menuTemp := range menus {
		parentName := "顶级菜单"
		if _, ok := parentMap[menuTemp.Parent]; ok {
			parentName = parentMap[menuTemp.Parent]
		}
		menuList = append(menuList, models.MenuInfo{
			Id:         menuTemp.Id,
			Name:       menuTemp.Name,
			Author:     menuTemp.Author,
			Status:     menuTemp.Status,
			Weight:     menuTemp.Weight,
			ParentName: parentName,
			StatusName: statusMap[menuTemp.Status],
			TypeName:   typeMap[menuTemp.Type],
			Parent:     menuTemp.Parent,
			Type:       menuTemp.Type,
			Mark:       menuTemp.Mark,
			Url:        menuTemp.Url,
			Icon:       menuTemp.Icon,
			CreateTime: tools.UnixToTime(menuTemp.CreateTime),
			UpdateTime: tools.UnixToTime(menuTemp.UpdateTime),
		})

	}
	return models.MenuListRes{
		Total: total,
		List:  menuList,
	}, nil
}

func (s *MenuService) Create(ctx *gin.Context, req models.MenuCreateReq) (interface{}, error) {
	var menu models.Menu

	db := s.dbClient.MysqlClient
	db.Where("name=?", req.Name).First(&menu)
	if menu.Id > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	menu.Name = req.Name
	menu.Mark = tools.ConvertToPinyin(req.Name)
	menu.Parent = req.Parent
	menu.Url = req.Url
	menu.Weight = req.Weight
	menu.CreateTime = time.Now().Unix()
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

	db.Where("id=?", req.Id).First(&menu)
	if menu.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&menu).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	menu.Name = req.Name
	menu.Parent = req.Parent
	menu.Url = req.Url
	menu.Weight = req.Weight
	menu.UpdateTime = time.Now().Unix()
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
	db.Where("id=?", req.Id).First(&menu)
	if menu.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&menu).Where("parent=?", req.Id).Count(&count)
	if count > 0 {
		return nil, errors.New("该菜单下有子菜单,不能删除")
	}

	err := db.Delete(&menu).Error
	if err != nil {
		return nil, err
	}

	_, _ = NewLogService().Create(ctx, models.LogCreateReq{Content: "del menu"})
	return menu.Id, nil
}

func (s *MenuService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var menu models.Menu

	res := s.dbClient.MysqlClient.Where("id=?", id).First(&menu)
	if res.Error != nil {
		return nil, res.Error
	}
	if menu.Id <= 0 {
		return nil, errors.New("menu error")
	}

	return menu, nil
}

func (s *MenuService) GetParentList(ctx *gin.Context) (interface{}, error) {
	var menuLists []models.MenuMine
	var menus []models.MenuMine

	db := s.dbClient.MysqlClient
	err := db.Model(&models.Menu{}).Where("status = ?", constant.StatusTrue).
		Where("parent=?", constant.TopParent).
		Select("id,parent,name").
		Order("id DESC").Find(&menus).Error
	if err != nil {
		return nil, err
	}

	menuLists = append(menuLists, models.MenuMine{Id: 0, Name: "顶级菜单", Parent: 0})
	for _, menu := range menus {
		menuLists = append(menuLists, menu)
	}

	return menuLists, nil
}

func (s *MenuService) GetTreeList() interface{} {
	var menus []models.Menu
	var menuTreeLists []models.MenuTree

	db := s.dbClient.MysqlClient
	err := db.Where("status = ?", constant.StatusTrue).
		Select("id,parent,name,url,weight").
		Order("weight DESC").Find(&menus).Error
	if err != nil {
		return nil
	}

	for _, menu := range menus {
		menuTreeLists = append(menuTreeLists, models.MenuTree{
			Id:     menu.Id,
			Parent: menu.Parent,
			Name:   menu.Name,
			Url:    menu.Url,
		})
	}
	menuTreeLists = s.buildMenuTree(menuTreeLists, 0)

	return menuTreeLists
}

func (s *MenuService) buildMenuTree(menus []models.MenuTree, parent int) []models.MenuTree {
	var menuTree []models.MenuTree

	for _, menu := range menus {
		if menu.Parent == parent {
			children := s.buildMenuTree(menus, menu.Id)
			menu.Children = children
			menuTree = append(menuTree, menu)
		}
	}

	return menuTree
}
