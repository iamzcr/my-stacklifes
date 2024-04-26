package models

type Article struct {
	Id      int    `json:"id" form:"id"`
	Title   string `json:"title" form:"title"`
	Author  string `json:"author" form:"author"`
	Content string `json:"content" form:"content"`
}

type ArticleInfo struct {
	Id      int    `json:"id" form:"id"`
	Title   string `json:"title" form:"title"`
	Author  string `json:"author" form:"author"`
	Content string `json:"content" form:"content"`
}

func (article *Article) TableName() string {
	return "sl_article"
}
