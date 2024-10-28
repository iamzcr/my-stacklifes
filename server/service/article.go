package service

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"html/template"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
	"my-stacklifes/pkg/tools"
	"time"
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
		articlesList []models.ArticleInfo
		articles     []models.Article
		total        int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Title) > 0 {
		db.Where("title LIKE ?", "%"+req.Title+"%")
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").Find(&articles).
		Limit(-1).Offset(-1).Count(&total).Error
	if err != nil {
		return nil, err
	}

	//分类map
	categoryMap := NewCategoryService().GetCategoryMap(ctx)
	//分类目录map
	directoryMap := NewDirectoryService().GetDirectoryMap(ctx)
	statusMap := NewCommonService().GetStatusMap(ctx)
	for _, temp := range articles {
		directoryName := "-"
		if _, ok := directoryMap[temp.Did]; ok {
			directoryName = directoryMap[temp.Did]
		}
		articlesList = append(articlesList, models.ArticleInfo{
			Id:            temp.Id,
			Title:         temp.Title,
			CategoryName:  categoryMap[temp.Cid],
			DirectoryName: directoryName,
			Author:        temp.Author,
			Status:        temp.Status,
			Weight:        temp.Weight,
			StatusName:    statusMap[temp.Status],
			IsNew:         temp.IsNew,
			IsRecom:       temp.IsRecom,
			IsHot:         temp.IsHot,
			HotName:       statusMap[temp.IsHot],
			RecomName:     statusMap[temp.IsRecom],
			NewName:       statusMap[temp.IsNew],
			PublicTime:    tools.UnixToTime(temp.PublicTime),
			CreateTime:    tools.UnixToTime(temp.CreateTime),
			UpdateTime:    tools.UnixToTime(temp.UpdateTime),
		})

	}
	return models.ArticleListRes{
		Total: total,
		List:  articlesList,
	}, nil
}

func (s *ArticleService) Create(ctx *gin.Context, req models.ArticleCreateReq) (interface{}, error) {
	fmt.Println(req)
	var article models.Article
	article.Title = req.Title
	article.Cid = req.Cid
	article.Did = req.Did
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
	article.CreateTime = time.Now().Unix()
	article.Month = req.Month
	err := s.dbClient.MysqlClient.Create(&article).Error
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
	err := db.Where("id=?", req.Id).First(&article).Count(&count).Error
	if err != nil {
		return nil, err
	}
	if count <= 0 {
		return nil, errors.New("文章不存在了")
	}

	article.Title = req.Title
	article.Cid = req.Cid
	article.Did = req.Did
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
	article.UpdateTime = time.Now().Unix()
	err = db.Save(&article).Error
	if err != nil {
		return nil, err
	}
	return article.Id, nil
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

func (s *ArticleService) GetArticleTitle(id int) string {
	var article models.Article
	res := s.dbClient.MysqlClient.Where("id=?", id).Select("id,title").First(&article)
	if res.Error != nil {
		return "-"
	}
	return article.Title
}

func (s *ArticleService) GetFrontList(ctx *gin.Context, req models.FrontArticleListReq) (interface{}, error) {
	var (
		articles []models.Article
		total    int64
	)
	db := s.dbClient.MysqlClient
	if len(req.Title) > 0 {
		db = db.Where("title LIKE ?", "%"+req.Title+"%")
	}
	if req.Cid > 0 {
		db = db.Where("cid = ?", req.Cid)
	}
	if req.IsHot > 0 {
		db = db.Where("is_hot = ?", req.Cid)
	}
	limit, offset := req.GetPageInfo()
	err := db.Limit(limit).Offset(offset).Order("id DESC").
		Select("id,cid,did,title,public_time,author").Find(&articles).Count(&total).Error
	if err != nil {
		return nil, err
	}
	//分类map
	articleList := s.handleArticleList(ctx, articles)
	return models.FrontArticleListRes{
		Total: total,
		List:  articleList,
	}, nil
}

// 标签目录列表
func (s *ArticleService) GetFrontTagsArticleList(ctx *gin.Context, tid int) (interface{}, error) {
	var (
		articles []models.Article
		total    int64
	)
	aidList, err := NewArticleTagsService().GetAidList(tid)
	if err != nil {
		return nil, err
	}

	db := s.dbClient.MysqlClient
	err = db.Where("id IN (?)", aidList).
		Select("id,cid,did,title,public_time,author").Find(&articles).Count(&total).Error
	if err != nil {
		return nil, err
	}

	articleList := s.handleArticleList(ctx, articles)
	return models.FrontArticleListRes{
		Total: total,
		List:  articleList,
	}, nil
}

// 分类下的文章列表
func (s *ArticleService) GetFrontCategoryArticleList(ctx *gin.Context, cid int) (interface{}, error) {
	var (
		articles []models.Article
	)
	list, err := s.GetDirectoryArticleList(ctx, cid)
	if err != nil {
		return nil, err
	}
	db := s.dbClient.MysqlClient
	err = db.Model(&models.Article{}).Select("id,title,cid,did,author,public_time").
		Where("cid = ?", cid).Order("weight DESC").Limit(5).Find(&articles).Error
	if err != nil {
		return nil, err
	}
	articleList := s.handleArticleList(ctx, articles)
	return models.DirectoryArticleListRes{
		DirectoryArticleList: list,
		ArticleList:          articleList,
	}, nil
}

// 分类目录下文章列表
func (s *ArticleService) GetDirectoryArticleList(ctx *gin.Context, cid int) ([]models.DirectoryArticle, error) {
	var (
		directoryArticle     models.DirectoryArticle
		articleList          []models.ArticleInfo
		directoryArticleList []models.DirectoryArticle
	)
	db := s.dbClient.MysqlClient
	//分类目录
	directoryService := NewDirectoryService()
	directorys, directoryIds, err := directoryService.GetListByCid(cid)
	if err != nil {
		return nil, err
	}
	err = db.Model(&models.Article{}).Select("id,title,cid,did").
		Where("did IN (?)", directoryIds).Find(&articleList).Error
	if err != nil {
		return nil, err
	}

	for _, directory := range directorys {
		directoryArticle = models.DirectoryArticle{
			DirectoryID:   directory.Id,
			DirectoryName: directory.Name,
			ArticleList:   []models.ArticleInfo{},
		}

		for _, article := range articleList {
			if article.Did == directory.Id {
				directoryArticle.ArticleList = append(directoryArticle.ArticleList, article)
			}
		}
		directoryArticleList = append(directoryArticleList, directoryArticle)
	}
	if err != nil {
		return nil, err
	}

	return directoryArticleList, nil
}

func (s *ArticleService) GetFrontDetail(ctx *gin.Context, id string) (interface{}, error) {

	var (
		article     models.Article
		preArticle  models.ArticleInfo
		nextArticle models.ArticleInfo
		articleTags []models.ArticleTags
		tagIds      []int
		tagNames    []string
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

	_ = db.Model(&article).Where("id<?", id).Select("id,cid").Order("id DESC").First(&preArticle).Error
	_ = db.Model(&article).Where("id>?", id).Select("id,cid").Order("id DESC").First(&nextArticle).Error
	if err != nil {
		return nil, err
	}

	tagMap := NewTagsService().GetTagsMap(ctx)
	for _, articleTag := range articleTags {
		tagIds = append(tagIds, articleTag.Tid)
		if _, ok := tagMap[articleTag.Tid]; ok {
			tagNames = append(tagNames, tagMap[articleTag.Tid])
		}
	}

	categoryMap := NewCategoryService().GetCategoryMap(ctx)

	//记录阅读人数,这里可以考虑用个异步
	_, _ = NewReadService().Create(ctx, models.ReadCreateReq{
		Aid: article.Id,
	})
	content, _ := tools.ConvertMarkdownToHTML([]byte(article.Content))
	contentHtml := template.HTML(content)
	tempList, err := NewArticleService().GetDirectoryArticleList(ctx, article.Cid)
	categoryName := "-"
	if _, ok := categoryMap[article.Cid]; ok {
		categoryName = categoryMap[article.Cid]
	}
	Info := models.ArticleInfo{
		Id:           article.Id,
		Title:        article.Title,
		Cid:          article.Cid,
		Did:          article.Did,
		Author:       article.Author,
		Desc:         article.Desc,
		Keyword:      article.Keyword,
		Content:      article.Content,
		ContentHtml:  contentHtml,
		PublicTime:   tools.UnixToTime(article.PublicTime),
		CategoryName: categoryName,
	}

	return models.ArticleDetail{
		Info:                 Info,
		PreArticle:           preArticle,
		NextArticle:          nextArticle,
		DirectoryArticleList: tempList,
	}, nil

}

func (s *ArticleService) handleArticleList(ctx *gin.Context, articles []models.Article) []models.ArticleInfo {
	var articleList []models.ArticleInfo
	//分类map
	categoryMap := NewCategoryService().GetCategoryMap(ctx)
	for _, temp := range articles {
		categoryName := "-"
		if _, ok := categoryMap[temp.Cid]; ok {
			categoryName = categoryMap[temp.Cid]
		}
		articleList = append(articleList, models.ArticleInfo{
			Id:           temp.Id,
			Title:        temp.Title,
			Cid:          temp.Cid,
			Did:          temp.Did,
			CategoryName: categoryName,
			Author:       temp.Author,
			PublicTime:   tools.UnixToTime(temp.PublicTime),
		})
	}
	return articleList
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
