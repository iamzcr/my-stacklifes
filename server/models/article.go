package models

type Article struct {
	Id         int    `json:"id" form:"id"`
	Title      string `json:"title" form:"title"`
	Cid        int    `json:"cid" form:"cid"`
	Author     string `json:"author" form:"author"`
	Desc       string `json:"desc" form:"desc"`
	Keyword    string `json:"keyword" form:"keyword"`
	Thumb      string `json:"thumb" form:"thumb"`
	Summary    string `json:"summary" form:"summary"`
	Content    string `json:"content" form:"content"`
	IsHot      uint8  `json:"is_hot" form:"is_hot"`
	IsNew      uint8  `json:"is_new" form:"is_new"`
	IsRecom    uint8  `json:"is_recom" form:"is_recom"`
	Weight     uint8  `json:"weight" form:"weight"`
	PublicTime int64  `json:"public_time" form:"public_time"`
	Month      string `json:"month" form:"month"`
}
type FrontArticleInfo struct {
	Id         int    `json:"id" form:"id"`
	Title      string `json:"title" form:"title"`
	Cid        int    `json:"cid" form:"cid"`
	Author     string `json:"author" form:"author"`
	PublicTime int64  `json:"public_time" form:"public_time"`
}

func (article *FrontArticleInfo) TableName() string {
	return "sl_article"
}
func (article *Article) TableName() string {
	return "sl_article"
}

type FrontArticle struct {
	Article
	TagIds       []int
	TagNames     []string
	CategoryName string
}

type ArticleInfo struct {
	Article
	CommonField
}

type ArticleReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
}
type ArticleListRes struct {
	Total int64     `json:"total"`
	List  []Article `json:"list"`
}
type FrontArticleListRes struct {
	Total int64              `json:"total"`
	List  []FrontArticleInfo `json:"list"`
}

type FrontArticleListReq struct {
	PageInfo
	Title string `json:"title" form:"title"`
	Cid   int    `json:"cid" form:"cid"`
	Tid   int    `json:"tid" form:"tid"`
}
