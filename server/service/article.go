package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type ArticleService struct {
	dbClient *mysql.DbClient
}

func NewArticleService() *ArticleService {
	return &ArticleService{
		dbClient: mysql.NewDbClient(),
	}
}

func (s *ArticleService) GetList(ctx *gin.Context, req models.ArticleReq) (interface{}, error) {
	var (
		articles []models.Article
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Title) > 0 {
		db = db.Where("title LIKE ?", "%"+req.Title+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&articles).
		Count(&total).Error
	if err != nil {
		return nil, err
	}

	return models.ArticleListRes{
		Total: total,
		List:  articles,
	}, nil
}

func (s *ArticleService) GetDetail(ctx *gin.Context, id string) (interface{}, error) {
	var (
		article models.Article
	)
	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&article)
	if res.Error != nil {
		return nil, res.Error
	}
	if article.Id == 0 {
		return nil, errors.New("article error")
	}
	return models.Article{Id: article.Id, Title: article.Title, Content: article.Content}, nil
}

func (s *ArticleService) GetFrontList(ctx *gin.Context, req models.FrontArticleListReq) (interface{}, error) {
	var (
		articles []models.FrontArticleInfo
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Title) > 0 {
		db = db.Where("title LIKE ?", "%"+req.Title+"%")
	}
	if req.Cid > 0 {
		db = db.Where("cid = ?", req.Cid)
	}
	limit, offset := req.GetPageInfo()
	err := db.Model(&models.Article{}).Limit(limit).
		Offset(offset).
		Order("id DESC").
		Find(&articles).
		Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.FrontArticleListRes{
		Total: total,
		List:  articles,
	}, nil
}
func (s *ArticleService) GetFrontCategoryArticleList(ctx *gin.Context, cid string) (interface{}, error) {
	var (
		articles          []models.FrontArticleInfo
		directoryArticle  models.DirectoryArticle
		returnArticleList []models.DirectoryArticle
	)
	db := s.dbClient.MysqlClient
	//分类目录
	directoryService := NewDirectoryService()
	directorys, directoryIds, err := directoryService.GetListByCid(cid)
	if err != nil {
		return nil, err
	}
	err = db.Model(&models.Article{}).Where("did IN (?)", directoryIds).Find(&articles).Error
	if err != nil {
		return nil, err
	}

	for _, directory := range directorys {
		directoryArticle = models.DirectoryArticle{
			DirectoryID:   directory.Id,
			DirectoryName: directory.Name,
			Articles:      []models.FrontArticleInfo{},
		}

		for _, article := range articles {
			if article.Did == directory.Id {
				directoryArticle.Articles = append(directoryArticle.Articles, article)
			}
		}
		returnArticleList = append(returnArticleList, directoryArticle)
	}
	if err != nil {
		return nil, err
	}
	return models.FrontDirectoryArticleListRes{
		List: returnArticleList,
	}, nil
}

func (s *ArticleService) GetFrontDetail(ctx *gin.Context, id string) (interface{}, error) {
	var (
		article     models.Article
		category    models.Category
		articleTags []models.ArticleTags
		tags        []models.Tags
		tagIds      []int
		tagNames    []string
		tagMap      = make(map[int]string)
	)

	db := s.dbClient.MysqlClient
	err := db.Where("id=?", id).Find(&article).Error
	if err != nil {
		return nil, err
	}
	if article.Id == 0 {
		return nil, errors.New("文章不存在")
	}
	err = db.Where("aid=?", id).Find(&articleTags).Error
	if err != nil {
		return nil, err
	}
	err = db.Where("id=?", article.Cid).Find(&category).Error
	if err != nil {
		return nil, err
	}
	err = db.Find(&tags).Error
	if err != nil {
		return nil, err
	}
	for _, tag := range tags {
		tagMap[tag.Id] = tag.Name
	}

	for _, articleTag := range articleTags {
		tagIds = append(tagIds, articleTag.TId)
		if _, ok := tagMap[articleTag.TId]; ok {
			tagNames = append(tagNames, tagMap[articleTag.TId])
		}
	}
	//记录阅读人数
	readService := NewReadService()
	_, _ = readService.Create(ctx, models.ReadCreateReq{
		Aid:     article.Id,
		Ip:      ctx.ClientIP(),
		Referer: ctx.Request.Referer(),
	})

	return models.FrontArticle{
		Article: models.Article{
			Id:         article.Id,
			Title:      article.Title,
			Cid:        0,
			Author:     article.Author,
			Desc:       article.Desc,
			Keyword:    article.Keyword,
			Thumb:      article.Thumb,
			Summary:    article.Summary,
			Content:    article.Content,
			IsHot:      article.IsHot,
			IsNew:      article.IsNew,
			IsRecom:    article.IsRecom,
			Weight:     article.Weight,
			PublicTime: article.PublicTime,
			Month:      article.Month,
		},
		TagIds:       tagIds,
		TagNames:     tagNames,
		CategoryName: category.Name,
	}, nil

}
