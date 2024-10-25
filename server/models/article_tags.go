package models

type ArticleTags struct {
	Id  int `json:"id" form:"id"`
	Aid int `json:"aid" form:"aid"`
	Tid int `json:"tid" form:"tid"`
	CommonField
}

func (ug *ArticleTags) TableName() string {
	return "sl_article_tags"
}
