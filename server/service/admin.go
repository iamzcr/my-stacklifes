package service

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
)

type AdminService struct {
	dbClient *mysql.DbClient
}

func NewAdminService() *AdminService {
	return &AdminService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AdminService) GetList(ctx *gin.Context, req models.AdminListReq) (interface{}, error) {
	var (
		groupMap       = make(map[int]string)
		adminGroupList []models.AdminGroupMine
		admins         []models.Admin
		adminList      []models.AdminInfo
		statusMap      = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		total int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Username) > 0 {
		db = db.Where("username LIKE ?", "%"+req.Username+"%")
	}

	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&admins).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}

	//分类map
	db.Model(&models.AdminGroup{}).
		Select("id,name").Order("id DESC").Find(&adminGroupList)
	for _, adminGroup := range adminGroupList {
		groupMap[adminGroup.Id] = adminGroup.Name
	}

	for _, temp := range admins {
		adminList = append(adminList, models.AdminInfo{
			Id:             temp.Id,
			Username:       temp.Username,
			LoginNum:       temp.LoginNum,
			Name:           temp.Name,
			Status:         temp.Status,
			Lang:           temp.Lang,
			LastLoginIp:    temp.LastLoginIp,
			StatusName:     statusMap[temp.Status],
			GroupName:      groupMap[temp.GroupId],
			CreateTime:     tools.UnixToTime(temp.CreateTime),
			UpdateTime:     tools.UnixToTime(temp.UpdateTime),
			ExpirationTime: tools.UnixToTime(temp.ExpirationTime),
			LastLoginTime:  tools.UnixToTime(temp.LastLoginTime),
		})
	}

	return models.AdminListRes{
		Total: total,
		List:  adminList,
	}, nil
}

func (s *AdminService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var admin models.Admin

	res := s.dbClient.MysqlClient.Where("id=?", id).First(&admin)
	if res.Error != nil {
		return nil, res.Error
	}
	if admin.Id == 0 {
		return nil, errors.New("Admin error")
	}

	return admin, nil
}

func (s *AdminService) Create(ctx *gin.Context, req models.AdminCreateReq) (interface{}, error) {
	var admin models.Admin
	db := s.dbClient.MysqlClient
	db.Where("username=?", req.Username).First(&admin)
	if admin.Id > 0 {
		return nil, errors.New("记录已存在")
	}

	admin.Username = req.Username
	if len(req.Password) <= 0 {
		req.Password = fmt.Sprintf("%s%s", req.Username, constant.Password)
	}
	if req.ExpirationTime == 0 {
		req.ExpirationTime = tools.SetExpiration()
	}
	admin.Password = req.Password
	admin.Name = req.Name
	admin.GroupId = req.GroupId
	admin.ExpirationTime = req.ExpirationTime
	admin.Salt = tools.CreateSalt()
	admin.Password = tools.GenPassword(admin.Salt, req.Password)
	err := db.Create(&admin).Error
	if err != nil {
		return nil, err
	}

	return req.Password, nil
}

func (s *AdminService) Delete(ctx *gin.Context, req models.AdminDelReq) (interface{}, error) {
	var admin models.Admin

	db := s.dbClient.MysqlClient
	db.Where("id=?", req.Id).First(&admin)
	if admin.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	err := db.Delete(&admin).Error
	if err != nil {
		return nil, err
	}
	return admin.Id, nil
}
