package service

import (
	"errors"
	"github.com/gin-gonic/gin"
	"html/template"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
	"strconv"
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
		articles []models.ArticleMine
		total    int64
	)
	db := s.dbClient.MysqlClient.Model(&models.Article{})
	if len(req.Title) > 0 {
		db.Where("title LIKE ?", "%"+req.Title+"%")
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
	for i := range articles {
		articles[i].AddExtraField("status_name", tools.GetStatusDisplay(articles[i].Status))
		articles[i].AddExtraField("new_name", tools.GetStatusDisplay(articles[i].IsNew))
		articles[i].AddExtraField("hot_name", tools.GetStatusDisplay(articles[i].IsHot))
		articles[i].AddExtraField("recom_name", tools.GetStatusDisplay(articles[i].IsRecom))
	}
	return models.ArticleListRes{
		Total: total,
		List:  articles,
	}, nil
}

func (s *ArticleService) GetInfo(ctx *gin.Context, id string) (interface{}, error) {
	var article models.Article

	res := s.dbClient.MysqlClient.Where("id=?", id).Find(&article)
	if res.Error != nil {
		return nil, res.Error
	}
	if article.Id == 0 {
		return nil, errors.New("Article error")
	}
	return article, nil
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
		DirectoryArticleList: returnArticleList,
	}, nil
}

func (s *ArticleService) GetFrontTagsArticleList(id string) (interface{}, error) {
	var (
		articleTags = NewArticleTagsService()
		articles    []models.FrontArticleInfo
		total       int64
	)
	aid, err := articleTags.GetAid(id)
	if err != nil {
		return nil, err
	}
	db := s.dbClient.MysqlClient
	err = db.Model(&models.Article{}).Where("id IN (?)", aid).Find(&articles).Count(&total).Error
	if err != nil {
		return nil, err
	}
	return models.FrontArticleListRes{
		Total: total,
		List:  articles,
	}, nil
}

func (s *ArticleService) GetFrontDetail(ctx *gin.Context, id string) (interface{}, error) {
	var (
		article              models.Article
		preFrontArticleInfo  models.FrontArticleInfo
		nextFrontArticleInfo models.FrontArticleInfo
		category             models.Category
		articleTags          []models.ArticleTags
		tags                 []models.Tags
		tagIds               []int
		tagNames             []string
		tagMap               = make(map[int]string)
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

	_ = db.Where("id<?", id).Debug().Select("id,cid").Order("id DESC").Limit(1).Find(&preFrontArticleInfo).Error
	_ = db.Where("id>?", id).Debug().Select("id,cid").Order("id DESC").Limit(1).Find(&nextFrontArticleInfo).Error

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
		tagIds = append(tagIds, articleTag.Tid)
		if _, ok := tagMap[articleTag.Tid]; ok {
			tagNames = append(tagNames, tagMap[articleTag.Tid])
		}
	}
	//记录阅读人数,这里可以考虑用个异步
	readService := NewReadService()
	_, _ = readService.Create(ctx, models.ReadCreateReq{
		Aid:     article.Id,
		Ip:      ctx.ClientIP(),
		Referer: ctx.Request.Referer(),
	})
	content, _ := tools.ConvertMarkdownToHTML([]byte(article.Content))
	contentHtml := template.HTML(content)
	tempList, err := NewArticleService().GetFrontCategoryArticleList(ctx, strconv.Itoa(article.Cid))
	// 使用类型断言将接口类型转换为 models.FrontDirectoryArticleListRes 类型 ,这里应该有更好的处理方式
	if res, ok := tempList.(models.FrontDirectoryArticleListRes); ok {
		return models.FrontArticle{
			Article: models.Article{
				Id:          article.Id,
				Title:       article.Title,
				Cid:         article.Cid,
				Author:      article.Author,
				Desc:        article.Desc,
				Keyword:     article.Keyword,
				Thumb:       article.Thumb,
				Summary:     article.Summary,
				Content:     article.Content,
				ContentHtml: contentHtml,
				IsHot:       article.IsHot,
				IsNew:       article.IsNew,
				IsRecom:     article.IsRecom,
				Weight:      article.Weight,
				PublicTime:  article.PublicTime,
				Month:       article.Month,
			},
			TagIds:               tagIds,
			TagNames:             tagNames,
			CategoryName:         category.Name,
			DirectoryArticleList: res.DirectoryArticleList,
			PreArticle:           preFrontArticleInfo,
			NextArticle:          nextFrontArticleInfo,
		}, nil
	} else {
		return nil, errors.New("类型断言失败")
	}
}

func (s *ArticleService) Create(ctx *gin.Context, req models.ArticleCreateReq) (interface{}, error) {
	var (
		article models.Article
	)
	article.Title = req.Title
	article.Cid = req.Cid
	article.Did = req.Did
	article.Author = req.Author
	article.Desc = req.Desc
	article.Keyword = req.Keyword
	article.Thumb = req.Thumb
	article.Summary = req.Summary
	article.Content = req.Content
	article.IsHot = req.IsHot
	article.IsNew = req.IsNew
	article.IsRecom = req.IsRecom
	article.Weight = req.Weight
	article.PublicTime = req.PublicTime
	article.Month = req.Month
	err := s.dbClient.MysqlClient.Model(article).Create(&article).Error
	if err != nil {
		return nil, err
	}
	return article.Id, nil
}

func (s *ArticleService) Update(ctx *gin.Context, req models.ArticleUpdateReq) (interface{}, error) {
	var (
		article models.Article
		count   int64
	)
	db := s.dbClient.MysqlClient
	err := db.Model(article).Where("id=?", req.Id).Find(&article).Count(&count).Error
	if err != nil || count < 1 {
		return nil, errors.New("更新出错")
	}

	article.Title = req.Title
	article.Cid = req.Cid
	article.Did = req.Did
	article.Author = req.Author
	article.Desc = req.Desc
	article.Keyword = req.Keyword
	article.Thumb = req.Thumb
	article.Summary = req.Summary
	article.Content = req.Content
	article.IsHot = req.IsHot
	article.IsNew = req.IsNew
	article.IsRecom = req.IsRecom
	article.Weight = req.Weight
	article.PublicTime = req.PublicTime
	article.Month = req.Month
	err = db.Model(article).Save(&article).Error
	if err != nil {
		return nil, err
	}
	return article.Id, nil
}

func (s *ArticleService) ChangeField(ctx *gin.Context, req models.ArticleFieldReq) (interface{}, error) {
	var (
		article models.Article
		count   int64
	)
	db := s.dbClient.MysqlClient
	db.Model(article).Where("id=?", req.Id).Count(&count)
	if count <= 0 {
		return nil, errors.New("不存在该记录")
	}

	updateData := make(map[string]interface{})
	if req.Status != nil {
		updateData["status"] = *req.Status
	}
	if req.IsHot != nil {
		updateData["is_hot"] = *req.IsHot
	}
	if req.IsNew != nil {
		updateData["is_new"] = *req.IsNew
	}
	if req.IsRecom != nil {
		updateData["is_recom"] = *req.IsRecom
	}
	err := db.Model(&article).Where("id=?", req.Id).Updates(updateData).Error
	if err != nil {
		return nil, err
	}
	return req.Id, nil
}
