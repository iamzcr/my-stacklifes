package models

type Article struct {
	Id    int    `json:"id" form:"id"`
	Title string `json:"title" form:"title"`
}

func (article *Article) TableName() string {
	return "sl_article"
}
