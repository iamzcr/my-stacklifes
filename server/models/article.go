package models

type Article struct {
	Id         int    `json:"id" `
	Title      string `json:"title"`
	Cid        int    `json:"cid" `
	Author     string `json:"author"`
	Desc       string `json:"desc"`
	Keyword    string `json:"keyword" `
	Thumb      string `json:"thumb" `
	Summary    string `json:"summary" `
	Content    string `json:"content"`
	IsHot      uint8  `json:"is_hot"`
	IsNew      uint8  `json:"is_new"`
	IsRecom    uint8  `json:"is_recom" `
	Weight     uint8  `json:"weight"`
	PublicTime int64  `json:"public_time"`
	Month      string `json:"month"`
}
type FrontArticleInfo struct {
	Id         int    `json:"id" `
	Title      string `json:"title"`
	Cid        int    `json:"cid"`
	Did        int    `json:"did"`
	Author     string `json:"author"`
	PublicTime int64  `json:"public_time" `
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
type FrontCategoryArticleListReq struct {
	Cid int `json:"cid" form:"cid"  binding:"required"`
}

type FrontDirectoryArticleListRes struct {
	List []DirectoryArticle `json:"list"`
}
type DirectoryArticle struct {
	DirectoryID   int                `json:"d_id"`
	DirectoryName string             `json:"d_name"`
	Articles      []FrontArticleInfo `json:"d_articles"`
}
