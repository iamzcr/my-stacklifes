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
	Status     int    `json:"status" gorm:"column:status;type:int(11);default:1"`
	PublicTime int64  `json:"public_time"`
	Month      string `json:"month"`
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
	Tid           []int         `json:"tid" `
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
	Status        int           `json:"status"`
	PublicTime    string        `json:"public_time"`
	Month         string        `json:"month"`
	CreateTime    string        `json:"create_time"`
	UpdateTime    string        `json:"update_time"`
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
	Tid        []int  `json:"tid" form:"tid"`
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
	Status     int    `json:"status"   form:"status,default=0"`
	PublicTime string `json:"public_time" form:"public_time"  binding:"required"`
	Month      string `json:"month" form:"month"`
}

type ArticleCreateReq struct {
	Title      string `json:"title" form:"title"  binding:"required"`
	Cid        int    `json:"cid" form:"cid"  binding:"required"`
	Did        int    `json:"did" form:"did"`
	Tid        []int  `json:"tid" form:"tid"`
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
	Status     int    `json:"status"   form:"status,default=0"`
	PublicTime string `json:"public_time" form:"public_time"  binding:"required"`
	Month      string `json:"month" form:"month"`
}

type ArticleListRes struct {
	Total int64         `json:"total"`
	List  []ArticleInfo `json:"list"`
}
type ArticleReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
}

type ArticleAssignList struct {
	Info          interface{}
	CategoryList  interface{}
	DirectoryList interface{}
	TagsList      interface{}
	StatusMap     interface{}
}

type ArticleFieldReq struct {
	Id      int  `json:"id" form:"id" binding:"required"`
	Status  *int `json:"status" form:"status" binding:"omitempty"`
	IsHot   *int `json:"is_hot" form:"is_hot" binding:"omitempty"`
	IsNew   *int `json:"is_new" form:"is_new" binding:"omitempty"`
	IsRecom *int `json:"is_recom" form:"is_recom" binding:"omitempty"`
}

type FrontArticleListRes struct {
	Total int64         `json:"total"`
	List  []ArticleInfo `json:"list"`
}

type FrontArticleListReq struct {
	Title string `json:"title" form:"title"`
	Cid   int    `json:"cid" form:"cid"`
	Tid   int    `json:"tid" form:"tid"`
	IsHot int    `json:"is_hot"   form:"is_hot,default=0"`
	PageInfo
}

type DirectoryArticleListRes struct {
	ArticleList          []ArticleInfo      `json:"article_list"`
	DirectoryArticleList []DirectoryArticle `json:"directory_article_list"`
}

type DirectoryArticle struct {
	DirectoryID   int           `json:"directory_id"`
	DirectoryName string        `json:"directory_name"`
	ArticleList   []ArticleInfo `json:"article_list"`
}

type ArticleDetail struct {
	Info                 ArticleInfo        `json:"info"`
	DirectoryArticleList []DirectoryArticle `json:"directory_article_list"`
	PreArticle           ArticleInfo        `json:"pre_article"`  //上一篇
	NextArticle          ArticleInfo        `json:"next_article"` //下一篇
}
