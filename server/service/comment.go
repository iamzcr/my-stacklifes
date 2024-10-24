package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
	"time"
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
		comments    []models.Comment
		commentList []models.CommentInfo
		total       int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Name) > 0 {
		db = db.Where("name LIKE ?", "%"+req.Name+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&comments).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}
	srvArticle := NewArticleService()
	for _, temp := range comments {
		commentList = append(commentList, models.CommentInfo{
			Id:           temp.Id,
			Name:         temp.Name,
			Aid:          temp.Aid,
			Ip:           temp.Ip,
			Email:        temp.Email,
			Url:          temp.Url,
			IsReply:      temp.IsReply,
			Referer:      temp.Referer,
			Content:      temp.Content,
			ArticleTitle: srvArticle.GetArticleTitle(temp.Aid),
			CreateTime:   tools.UnixToTime(temp.CreateTime),
		})
	}
	return models.CommentListRes{
		Total: total,
		List:  commentList,
	}, nil
}

func (s *CommentService) Create(ctx *gin.Context, req models.CommentCreateReq) (interface{}, error) {
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
	comment.Referer = ctx.Request.Referer()
	comment.Email = req.Email
	comment.Ip = ctx.ClientIP()
	comment.CreateTime = time.Now().Unix()
	err := s.dbClient.MysqlClient.Create(&comment).Error
	if err != nil {
		return nil, err
	}

	return comment.Id, nil
}

func (s *CommentService) Delete(ctx *gin.Context, req models.CommentDelReq) (interface{}, error) {
	var comment models.Comment

	db := s.dbClient.MysqlClient
	db.Where("id=?", req.Id).First(&comment)
	if comment.Id <= 0 {
		return nil, errors.New("不存在该记录")
	}

	err := db.Delete(&comment).Error
	if err != nil {
		return nil, err
	}

	return comment.Id, nil
}
