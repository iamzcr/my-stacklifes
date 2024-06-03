package models

type ArticleTags struct {
	Id  int `json:"id" form:"id"`
	AId int `json:"aid" form:"aid"`
	TId int `json:"tid" form:"tid"`
}

type ArticleTagsInfo struct {
	AdminGroup
	CommonField
}

func (ug *ArticleTags) TableName() string {
	return "sl_article_tags"
}
