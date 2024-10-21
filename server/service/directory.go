package service

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
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

func (s *DirectoryService) GetNoPageList(req models.DirectoryNoPageReq) (interface{}, error) {
	var directorys []models.DirectoryMine
	db := s.dbClient.MysqlClient.Model(&models.Directory{})
	fmt.Println(req.Cid)
	fmt.Println(req.Status)
	if req.Cid != 0 {
		db.Where("cid = ?", req.Cid)
	}
	err := db.Where("status = ?", req.Status).Select("id,mark,cid,name").
		Order("id DESC").Find(&directorys).Error
	if err != nil {
		return nil, err
	}
	return models.DirectoryNoPageListRes{
		List: directorys,
	}, nil
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

func (s *DirectoryService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var DirectoryInfo models.Directory

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&DirectoryInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if DirectoryInfo.Id == 0 {
		return nil, errors.New("Directory error")
	}
	return DirectoryInfo, nil
}

func (s *DirectoryService) Create(ctx *gin.Context, req models.DirectoryCreateReq) (interface{}, error) {
	var (
		directory models.Directory
		count     int64
	)
	s.dbClient.MysqlClient.Model(directory).
		Where("name=?", req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	directory.Name = req.Name
	directory.Mark = req.Mark
	directory.Cid = req.Cid
	directory.Type = req.Type
	directory.Author = req.Author
	directory.Weight = req.Weight
	err := s.dbClient.MysqlClient.Create(&directory).Error
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
	res := s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&directory)
	if res.Error != nil {
		return nil, res.Error
	}
	s.dbClient.MysqlClient.Model(directory).
		Where("id != ? and name=?", req.Id, req.Name).
		Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	directory.Name = req.Name
	directory.Mark = req.Mark
	directory.Type = req.Type
	directory.Cid = req.Cid
	directory.Author = req.Author
	directory.Weight = req.Weight
	err := s.dbClient.MysqlClient.Save(&directory).Error
	if err != nil {
		return nil, err
	}
	return directory.Id, nil
}

func (s *DirectoryService) Delete(ctx *gin.Context, req models.DirectoryDelReq) (interface{}, error) {
	var (
		directory models.Directory
		articles  []models.Article
	)
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&directory)
	if directory.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	s.dbClient.MysqlClient.Where("did=?", req.Id).Find(&articles)
	if len(articles) > 0 {
		return nil, errors.New("该分类已被使用")
	}
	err := s.dbClient.MysqlClient.Delete(&directory).Error
	if err != nil {
		return nil, err
	}
	return directory.Id, nil
}
