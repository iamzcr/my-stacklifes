package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/constant"
	"my-stacklifes/pkg/tools"
)

type AttachService struct {
	dbClient *mysql.DbClient
}

func NewAttachService() *AttachService {
	return &AttachService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *AttachService) GetList(ctx *gin.Context, req models.AttachListReq) (interface{}, error) {
	var (
		attachs    []models.Attach
		attachList []models.AttachInfo
		total      int64
		statusMap  = map[int]string{
			constant.StatusTrue:  constant.StatusTrueName,
			constant.StatusFalse: constant.StatusFalseName,
		}
		typeMap = map[int]string{
			constant.ImageType: constant.ImageTypeName,
		}
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&attachs).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	for _, temp := range attachs {
		attachList = append(attachList, models.AttachInfo{
			Id:         temp.Id,
			Name:       temp.Name,
			Status:     temp.Status,
			Type:       temp.Type,
			Link:       temp.Link,
			Path:       temp.Path,
			StatusName: statusMap[temp.Status],
			TypeName:   typeMap[temp.Type],
			CreateTime: tools.UnixToTime(temp.CreateTime),
		})

	}
	return models.AttachListRes{
		Total: total,
		List:  attachList,
	}, nil
}

func (s *AttachService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var attachInfo models.Attach

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&attachInfo)
	if res.Error != nil {
		return nil, res.Error
	}
	if attachInfo.Id <= 0 {
		return nil, errors.New("Attach error")
	}

	return attachInfo, nil
}

func (s *AttachService) Create(ctx *gin.Context, req models.AttachCreateReq) (interface{}, error) {
	var attach models.Attach

	attach.Name = req.Name
	attach.Path = req.Path
	attach.Link = req.Link
	err := s.dbClient.MysqlClient.Save(&attach).Error
	if err != nil {
		return nil, err
	}

	return attach.Id, nil
}
