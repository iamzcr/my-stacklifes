package models

import "html/template"

type Article struct {
	Id         int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Title      string `json:"title"`
	Cid        int    `json:"cid" `
	Did        int    `json:"did"  gorm:"column:did;type:int(11);default:0"`
	Author     string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	Desc       string `json:"desc"`
	Keyword    string `json:"keyword" `
	Thumb      string `json:"thumb" `
	Summary    string `json:"summary" `
	Content    string `json:"content"`
	IsHot      int    `json:"is_hot" gorm:"column:is_hot;type:int(11);default:0"`
	IsNew      int    `json:"is_new" gorm:"column:is_new;type:int(11);default:0"`
	IsRecom    int    `json:"is_recom" gorm:"column:is_recom;type:int(11);default:0"`
	Weight     int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	PublicTime int64  `json:"public_time"`
	Month      string `json:"month"`
	Status     int    `json:"status" gorm:"column:status;type:int(11);default:1"`
	CommonField
}

func (article *Article) TableName() string {
	return "sl_article"
}

type ArticleInfo struct {
	Id            int           `json:"id" `
	Title         string        `json:"title"`
	Cid           int           `json:"cid" `
	Did           int           `json:"did" `
	Author        string        `json:"author"`
	Desc          string        `json:"desc"`
	Keyword       string        `json:"keyword" `
	Thumb         string        `json:"thumb" `
	Summary       string        `json:"summary" `
	Content       string        `json:"content"`
	ContentHtml   template.HTML `json:"content_html"`
	IsHot         int           `json:"is_hot"`
	IsNew         int           `json:"is_new"`
	IsRecom       int           `json:"is_recom" `
	Weight        int           `json:"weight"`
	PublicTime    string        `json:"public_time"`
	Month         string        `json:"month"`
	Status        int           `json:"status"`
	CreateTime    string        `json:"create_time"`
	UpdatedTime   string        `json:"updated_time"`
	StatusName    string        `json:"status_name"`
	HotName       string        `json:"hot_name"`
	NewName       string        `json:"new_name"`
	RecomName     string        `json:"recom_name"`
	CategoryName  string        `json:"category_name"`
	DirectoryName string        `json:"directory_name"`
	TagsName      string        `json:"tags_name"`
}

type ArticleUpdateReq struct {
	Id         int    `json:"id" form:"id"  binding:"required"`
	Title      string `json:"title" form:"title"  binding:"required"`
	Cid        int    `json:"cid" form:"cid"  binding:"required"`
	Did        int    `json:"did" form:"did"`
	Author     string `json:"author" form:"author"`
	Desc       string `json:"desc" form:"desc"`
	Keyword    string `json:"keyword" form:"keyword"`
	Thumb      string `json:"thumb" form:"thumb"`
	Summary    string `json:"summary" form:"summary"`
	Content    string `json:"content" form:"content"  binding:"required"`
	IsHot      int    `json:"is_hot"   form:"is_hot,default=0"`
	IsNew      int    `json:"is_new"   form:"is_new,default=0"`
	IsRecom    int    `json:"is_recom" form:"is_recom,default=0"`
	Weight     int    `json:"weight"  form:"is_recom,default=0"`
	PublicTime int64  `json:"public_time" form:"public_time"`
	Month      string `json:"month" form:"month"`
	Status     int    `json:"status"   form:"status,default=0"`
}

type ArticleCreateReq struct {
	Title      string `json:"title" form:"title"  binding:"required"`
	Cid        int    `json:"cid" form:"cid"  binding:"required"`
	Did        int    `json:"did" form:"did"`
	Author     string `json:"author" form:"author"`
	Desc       string `json:"desc" form:"desc"`
	Keyword    string `json:"keyword" form:"keyword"`
	Thumb      string `json:"thumb" form:"thumb"`
	Summary    string `json:"summary" form:"summary"`
	Content    string `json:"content" form:"content"  binding:"required"`
	IsHot      int    `json:"is_hot"   form:"is_hot,default=0"`
	IsNew      int    `json:"is_new"   form:"is_new,default=0"`
	IsRecom    int    `json:"is_recom" form:"is_recom,default=0"`
	Weight     int    `json:"weight"  form:"is_recom,default=0"`
	PublicTime int64  `json:"public_time" form:"public_time"`
	Month      string `json:"month" form:"month"`
	Status     int    `json:"status"   form:"status,default=0"`
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

type ArticleListRes struct {
	Total int64         `json:"total"`
	List  []ArticleMine `json:"list"`
}
type ArticleReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
}

type ArticleFieldReq struct {
	Id      int  `json:"id" form:"id" binding:"required"`
	Status  *int `json:"status" form:"status" binding:"omitempty"`
	IsHot   *int `json:"is_hot" form:"is_hot" binding:"omitempty"`
	IsNew   *int `json:"is_new" form:"is_new" binding:"omitempty"`
	IsRecom *int `json:"is_recom" form:"is_recom" binding:"omitempty"`
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
	Category             Category
	DirectoryArticleList []DirectoryArticle //分类目录里面的文章
	PreArticle           Article            //上一篇
	NextArticle          Article            //下一篇
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
