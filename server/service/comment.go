package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
)

type CommentService struct {
	dbClient *mysql.DbClient
}

func NewCommentService() *CommentService {
	return &CommentService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *CommentService) GetList(ctx *gin.Context, req models.CommentReq) (interface{}, error) {
	var (
		categories []models.Comment
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
	return models.CommentListRes{
		Total: total,
		List:  categories,
	}, nil
}

func (s *CommentService) Update(ctx *gin.Context, req models.CommentCreateReq) (interface{}, error) {
	var comment models.Comment
	if req.Name == "" || req.Content == "" || req.Aid == 0 {
		return nil, errors.New("params is null")
	}
	if !tools.ValidEmail(req.Email) {
		return nil, errors.New("email error")
	}
	comment.Name = req.Name
	comment.Content = req.Content
	comment.Url = req.Url
	comment.Aid = req.Aid
	comment.Refer = ctx.Request.Referer()
	comment.Email = req.Email
	comment.Ip = ctx.ClientIP()
	err := s.dbClient.MysqlClient.Create(&comment).Error
	if err != nil {
		return nil, err
	}
	return comment, nil
}
