package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
)

type MessageService struct {
	dbClient *mysql.DbClient
}

func NewMessageService() *MessageService {
	return &MessageService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *MessageService) GetList(ctx *gin.Context, req models.MessageReq) (interface{}, error) {
	var (
		message []models.Message
		total   int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&message).Error
	if err != nil {
		return nil, err
	}
	err = db.Model(message).Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.MessageListRes{
		Total: total,
		List:  message,
	}, nil
}

func (s *MessageService) Update(ctx *gin.Context, req models.MsgCreateReq) (interface{}, error) {
	var message models.Message
	if len(req.Name) <= 0 || len(req.Content) <= 0 {
		return nil, errors.New("params is null")
	}
	if !tools.ValidEmail(req.Email) {
		return nil, errors.New("email error")
	}
	message.Name = req.Name
	message.Url = req.Url
	message.Email = req.Email
	message.Content = req.Content
	message.Ip = ctx.ClientIP()
	err := s.dbClient.MysqlClient.Create(&message).Error
	if err != nil {
		return nil, err
	}
	return message, nil
}

func (s *MessageService) Delete(ctx *gin.Context, req models.MessageDelReq) (interface{}, error) {
	var message models.Message
	s.dbClient.MysqlClient.Where("id=?", req.Id).Find(&message)
	if message.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}
	err := s.dbClient.MysqlClient.Delete(&message).Error
	if err != nil {
		return nil, err
	}
	return message.Id, nil
}
