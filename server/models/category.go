package models

type Category struct {
	Id   int    `json:"id" form:"id"`
	Name string `json:"name" form:"name"`
}

func (category *Category) TableName() string {
	return "sl_article"
}
