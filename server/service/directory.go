package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
)

type DirectoryService struct {
	dbClient *mysql.DbClient
}

func NewDirectoryService() *DirectoryService {
	return &DirectoryService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *DirectoryService) GetList(ctx *gin.Context, req models.DirectoryListReq) (interface{}, error) {
	var (
		directorys []models.Directory
		total      int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Offset(offset).Limit(limit).Order("id DESC").Find(&directorys).Error
	if err != nil {
		return nil, err
	}
	err = db.Model(&directorys).Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.DirectoryListRes{
		Total: total,
		List:  directorys,
	}, nil
}

func (s *DirectoryService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var directory models.Directory

	res := s.dbClient.MysqlClient.Where("id=?", id).First(&directory)
	if res.Error != nil {
		return nil, res.Error
	}
	if directory.Id == 0 {
		return nil, errors.New("Directory error")
	}

	return directory, nil
}

func (s *DirectoryService) Create(ctx *gin.Context, req models.DirectoryCreateReq) (interface{}, error) {
	var directory models.Directory

	db := s.dbClient.MysqlClient
	db.Where("name=?", req.Name).First(&directory)
	if directory.Id > 0 {
		return nil, errors.New("记录已存在")
	}

	directory.Name = req.Name
	directory.Mark = tools.ConvertToPinyin(req.Name)
	directory.Cid = req.Cid
	directory.Weight = req.Weight
	err := db.Create(&directory).Error
	if err != nil {
		return nil, err
	}

	return directory.Id, nil
}

func (s *DirectoryService) Update(ctx *gin.Context, req models.DirectoryUpdateReq) (interface{}, error) {
	var (
		directory models.Directory
		count     int64
	)
	db := s.dbClient.MysqlClient
	res := db.Where("id=?", req.Id).Find(&directory)
	if res.Error != nil {
		return nil, res.Error
	}
	if directory.Id <= 0 {
		return nil, errors.New("记录不存在")
	}

	db.Model(directory).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	directory.Name = req.Name
	directory.Cid = req.Cid
	directory.Weight = req.Weight
	err := db.Save(&directory).Error
	if err != nil {
		return nil, err
	}

	return directory.Id, nil
}

func (s *DirectoryService) Delete(ctx *gin.Context, req models.DirectoryDelReq) (interface{}, error) {
	var (
		directory    models.Directory
		article      models.Article
		articleCount int64
	)
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).Find(&directory)
	if directory.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&article).Where("did=?", req.Id).Count(&articleCount)
	if articleCount > 0 {
		return nil, errors.New("该分类目录下有文章，不能删除")
	}

	err := s.dbClient.MysqlClient.Delete(&directory).Error
	if err != nil {
		return nil, err
	}

	return directory.Id, nil
}

func (s *DirectoryService) GetListByCid(cid string) ([]models.DirectoryMine, []int, error) {
	db := s.dbClient.MysqlClient
	var directorys []models.DirectoryMine
	var directoryIds []int

	err := db.Model(&models.Directory{}).Where("cid = ?", cid).
		Order("weight DESC").Find(&directorys).Error
	if err != nil {
		return nil, nil, err
	}
	for _, directory := range directorys {
		directoryIds = append(directoryIds, directory.Id)
	}

	return directorys, directoryIds, nil
}
