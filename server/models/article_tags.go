package models

type ArticleTags struct {
	Id  int `json:"id" form:"id"`
	AId int `json:"aid" form:"aid"`
	TId int `json:"tid" form:"tid"`
	CommonField
}

func (ug *ArticleTags) TableName() string {
	return "sl_article_tags"
}

type ArticleTagsMine struct {
	AId int `json:"aid" form:"aid"`
	TId int `json:"tid" form:"tid"`
}