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

type AdminGroupService struct {
	dbClient *mysql.DbClient
}

func NewAdminGroupService() *AdminGroupService {
	return &AdminGroupService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AdminGroupService) GetList(ctx *gin.Context, req models.AdminGroupListReq) (interface{}, error) {
	var (
		adminGroups    []models.AdminGroup
		total          int64
		adminGroupList []models.AdminGroupInfo
		statusMap      = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&adminGroups).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	for _, temp := range adminGroups {
		adminGroupList = append(adminGroupList, models.AdminGroupInfo{
			Id:          temp.Id,
			Name:        temp.Name,
			StatusName:  statusMap[temp.Status],
			Mark:        temp.Mark,
			Description: temp.Description,
			MenuModules: temp.MenuModules,
			MenuPermit:  temp.MenuPermit,
			AllowIp:     temp.AllowIp,
			CreateTime:  tools.UnixToTime(temp.CreateTime),
		})

	}
	return models.AdminGroupListRes{
		Total: total,
		List:  adminGroupList,
	}, nil
}

func (s *AdminGroupService) GetAdminGroupList(ctx *gin.Context, req models.AdminGroupListReq) (interface{}, error) {
	var adminGroups []models.AdminGroupInfo
	db := s.dbClient.MysqlClient
	err := db.Model(&models.AdminGroup{}).
		Where("status = ?", constant.StatusTrue).
		Select("id,name").
		Order("id DESC").Find(&adminGroups).Error

	if err != nil {
		return nil, err
	}
	return adminGroups, nil
}

func (s *AdminGroupService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var adminGroupInfo models.AdminGroup
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&adminGroupInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if adminGroupInfo.Id <= 0 {
		return nil, errors.New("AdminGroup error")
	}

	return adminGroupInfo, nil
}

func (s *AdminGroupService) Create(ctx *gin.Context, req models.AdminGroupCreateReq) (interface{}, error) {
	var adminGroup models.AdminGroup

	db := s.dbClient.MysqlClient

	db.Where("name=?", req.Name).First(&adminGroup)
	if adminGroup.Id > 0 {
		return nil, errors.New("记录已存在")
	}

	adminGroup.Name = req.Name
	adminGroup.Mark = tools.ConvertToPinyin(req.Name)
	adminGroup.Description = req.Description
	adminGroup.CreateTime = time.Now().Unix()
	err := db.Save(&adminGroup).Error
	if err != nil {
		return nil, err
	}

	return adminGroup.Id, nil
}

func (s *AdminGroupService) Update(ctx *gin.Context, req models.AdminGroupUpdateReq) (interface{}, error) {
	var (
		adminGroup models.AdminGroup
		count      int64
	)

	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&adminGroup)
	if adminGroup.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Model(&adminGroup).Where("id != ? and name=?", req.Id, req.Name).Count(&count)
	if count > 0 {
		return nil, errors.New("已存在有相同的名称记录")
	}

	adminGroup.Name = req.Name
	adminGroup.Description = req.Description
	adminGroup.UpdatedTime = time.Now().Unix()
	err := s.dbClient.MysqlClient.Save(&adminGroup).Error
	if err != nil {
		return nil, err
	}

	return adminGroup.Id, nil
}

func (s *AdminGroupService) Delete(ctx *gin.Context, req models.AdminGroupDelReq) (interface{}, error) {
	var (
		adminGroup models.AdminGroup
		admin      models.Admin
	)
	db := s.dbClient.MysqlClient

	db.Where("id=?", req.Id).First(&adminGroup)
	if adminGroup.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	db.Where("group_id=?", req.Id).First(&admin)
	if admin.Id > 0 {
		return nil, errors.New("该用户组已被使用")
	}

	err := db.Model(&adminGroup).Delete(&adminGroup).Error
	if err != nil {
		return nil, err
	}

	return adminGroup.Id, nil
}
