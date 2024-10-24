package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
)

type PermitService struct {
	dbClient *mysql.DbClient
}

func NewPermitService() *PermitService {
	return &PermitService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *PermitService) GetList(ctx *gin.Context, req models.PermitListReq) (interface{}, error) {
	var (
		permits       []models.Permit
		parentPermits []models.Permit
		total         int64
		permitList    []models.PermitInfo
		parentMap     = make(map[int]string)
		statusMap     = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		typeMap = map[int]string{
			constant.PermitDefaultType: constant.PermitDefaultTypeName,
		}
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}

	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&permits).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	db.Where("parent=?", constant.TopParent).Select("id,name").Order("id DESC").Find(&parentPermits)
	for _, parentPermit := range parentPermits {
		parentMap[parentPermit.Id] = parentPermit.Name
	}
	for _, permitTemp := range permits {
		parentName := "父级权限"
		if _, ok := parentMap[permitTemp.Parent]; ok {
			parentName = parentMap[permitTemp.Parent]
		}
		permitList = append(permitList, models.PermitInfo{
			Id:          permitTemp.Id,
			Name:        permitTemp.Name,
			Author:      permitTemp.Author,
			Status:      permitTemp.Status,
			Weight:      permitTemp.Weight,
			ParentName:  parentName,
			StatusName:  statusMap[permitTemp.Status],
			TypeName:    typeMap[permitTemp.Type],
			Parent:      permitTemp.Parent,
			Type:        permitTemp.Type,
			Mark:        permitTemp.Mark,
			Modules:     permitTemp.Modules,
			CreateTime:  tools.UnixToTime(permitTemp.CreateTime),
			UpdatedTime: tools.UnixToTime(permitTemp.UpdatedTime),
		})
	}
	return models.PermitListRes{
		Total: total,
		List:  permitList,
	}, nil
}
func (s *PermitService) Create(ctx *gin.Context, req models.PermitCreateReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	db := s.dbClient.MysqlClient
	db.Where("name=?", req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	permit.Name = req.Name
	permit.Mark = tools.ConvertToPinyin(req.Name)
	permit.Parent = req.Parent
	permit.Modules = req.Modules
	permit.Weight = req.Weight
	err := db.Create(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}

func (s *PermitService) Update(ctx *gin.Context, req models.PermitUpdateReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	db := s.dbClient.MysqlClient
	res := db.Where("id=?", req.Id).Find(&permit)
	if res.Error != nil {
		return nil, res.Error
	}
	db.Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("记录已存在")
	}
	permit.Name = req.Name
	permit.Parent = req.Parent
	permit.Modules = req.Modules
	permit.Weight = req.Weight
	err := db.Save(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}

func (s *PermitService) Delete(ctx *gin.Context, req models.PermitDelReq) (interface{}, error) {
	var (
		permit models.Permit
		count  int64
	)
	db := s.dbClient.MysqlClient
	db.Where("id=?", req.Id).Find(&permit)
	if permit.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	db.Where("parent=?", req.Id).Find(&permit).Count(&count)
	if count > 0 {
		return nil, errors.New("该权限有子权限")
	}
	err := s.dbClient.MysqlClient.Delete(&permit).Error
	if err != nil {
		return nil, err
	}
	return permit.Id, nil
}

func (s *PermitService) GetParentList(ctx *gin.Context) (interface{}, error) {
	var permitLists []models.PermitMine
	var permits []models.PermitMine
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Menu{}).Where("status = ?", constant.StatusTrue).
		Where("parent=?", constant.TopParent).
		Select("id,parent,name").
		Order("id DESC").Find(&permits).Error
	if err != nil {
		return nil, err
	}
	permitLists = append(permitLists, models.PermitMine{Id: 0, Name: "顶级菜单", Parent: 0})
	for _, permit := range permits {
		permitLists = append(permitLists, permit)
	}
	return permitLists, nil
}

func (s *PermitService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var permit models.Permit
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&permit)
	if res.Error != nil {
		return nil, res.Error
	}
	if permit.Id == 0 {
		return nil, errors.New("permit error")
	}
	return permit, nil
}
