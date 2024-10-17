package models

import "html/template"

type Article struct {
	Id          int                    `json:"id" `
	Title       string                 `json:"title"`
	Cid         int                    `json:"cid" `
	Did         int                    `json:"did" `
	Author      string                 `json:"author"`
	Desc        string                 `json:"desc"`
	Keyword     string                 `json:"keyword" `
	Thumb       string                 `json:"thumb" `
	Summary     string                 `json:"summary" `
	Content     string                 `json:"content"`
	ContentHtml template.HTML          `json:"content_html"`
	IsHot       int                    `json:"is_hot"`
	IsNew       int                    `json:"is_new"`
	IsRecom     int                    `json:"is_recom" `
	Weight      int                    `json:"weight"`
	PublicTime  int64                  `json:"public_time"`
	Month       string                 `json:"month"`
	Status      int                    `json:"status"`
	ExtraFields map[string]interface{} `json:"extra_fields" gorm:"-"` //存放回显中文
	CommonField
}

type ArticleMine struct {
	Id          int                    `json:"id" `
	Title       string                 `json:"title"`
	Cid         int                    `json:"cid" `
	Did         int                    `json:"did" `
	Author      string                 `json:"author"`
	IsHot       int                    `json:"is_hot"`
	IsNew       int                    `json:"is_new"`
	IsRecom     int                    `json:"is_recom" `
	Weight      int                    `json:"weight"`
	PublicTime  int64                  `json:"public_time"`
	Status      int                    `json:"status"`
	ExtraFields map[string]interface{} `json:"extra_fields" gorm:"-"` //存放回显中文
}

type ArticleUpdateReq struct {
	Id         int    `json:"id" form:"id"`
	Title      string `json:"title" form:"title"`
	Cid        int    `json:"cid" form:"cid"`
	Did        int    `json:"did" form:"did"`
	Author     string `json:"author" form:"author"`
	Desc       string `json:"desc" form:"desc"`
	Keyword    string `json:"keyword" form:"keyword"`
	Thumb      string `json:"thumb" form:"thumb"`
	Summary    string `json:"summary" form:"summary"`
	Content    string `json:"content" form:"content"`
	IsHot      int    `json:"is_hot"   form:"is_hot,default=0"`
	IsNew      int    `json:"is_new"   form:"is_new,default=0"`
	IsRecom    int    `json:"is_recom" form:"is_recom,default=0"`
	Weight     int    `json:"weight" form:"weight"`
	PublicTime int64  `json:"public_time" form:"public_time"`
	Month      string `json:"month" form:"month"`
}

type ArticleCreateReq struct {
	Title      string `json:"title" form:"title"`
	Cid        int    `json:"cid" form:"cid"`
	Did        int    `json:"did" form:"did"`
	Author     string `json:"author" form:"author"`
	Desc       string `json:"desc" form:"desc"`
	Keyword    string `json:"keyword" form:"keyword"`
	Thumb      string `json:"thumb" form:"thumb"`
	Summary    string `json:"summary" form:"summary"`
	Content    string `json:"content" form:"content"`
	IsHot      int    `json:"is_hot"   form:"is_hot,default=0"`
	IsNew      int    `json:"is_new"   form:"is_new,default=0"`
	IsRecom    int    `json:"is_recom" form:"is_recom,default=0"`
	Weight     int    `json:"weight" form:"weight"`
	PublicTime int64  `json:"public_time" form:"public_time"`
	Month      string `json:"month" form:"month"`
}

type ArticleFieldReq struct {
	Id      int  `json:"id" form:"id" binding:"required"`
	Status  *int `json:"status" form:"status" binding:"omitempty"`
	IsHot   *int `json:"is_hot" form:"is_hot" binding:"omitempty"`
	IsNew   *int `json:"is_new" form:"is_new" binding:"omitempty"`
	IsRecom *int `json:"is_recom" form:"is_recom" binding:"omitempty"`
}

func (article *Article) TableName() string {
	return "sl_article"
}

type ArticleReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
}
type ArticleListRes struct {
	Total int64         `json:"total"`
	List  []ArticleMine `json:"list"`
}

type FrontArticleInfo struct {
	Id         int    `json:"id" `
	Title      string `json:"title"`
	Cid        int    `json:"cid"`
	Did        int    `json:"did"`
	Author     string `json:"author"`
	PublicTime int64  `json:"public_time" `
}
type FrontArticle struct {
	Article
	TagIds               []int
	TagNames             []string
	CategoryName         string
	DirectoryArticleList []DirectoryArticle
}

type FrontArticleListReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
	Cid   int    `json:"cid" form:"cid"`
	Tid   int    `json:"tid" form:"tid"`
	IsHot int    `json:"is_hot"   form:"is_hot,default=0"`
}

type FrontArticleListRes struct {
	Total int64              `json:"total"`
	List  []FrontArticleInfo `json:"list"`
}

type FrontCategoryArticleListReq struct {
	Cid int `json:"cid" form:"cid"  binding:"required"`
}

type FrontDirectoryArticleListRes struct {
	DirectoryArticleList []DirectoryArticle `json:"list"`
}
type DirectoryArticle struct {
	DirectoryID   int                `json:"d_id"`
	DirectoryName string             `json:"d_name"`
	Articles      []FrontArticleInfo `json:"d_articles"`
}

func (am *ArticleMine) AddExtraField(key string, value interface{}) {
	if am.ExtraFields == nil {
		am.ExtraFields = make(map[string]interface{})
	}
	am.ExtraFields[key] = value
}
