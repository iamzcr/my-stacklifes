package models

type Category struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Mark   string `json:"mark" form:"name"`
	Type   string `json:"type" form:"name"`
	Author string `json:"author" form:"author"`
	Parent string `json:"parent" form:"name"`
	Weight string `json:"weight" form:"name"`
	CommonField
}

func (category *Category) TableName() string {
	return "sl_article"
}

type CategoryInfo struct {
	Id     uint   `json:"id"`
	Name   string `json:"name" form:"name"`
	Mark   string `json:"mark" form:"name"`
	Type   string `json:"type" form:"name"`
	Author string `json:"author" form:"author"`
	Parent string `json:"parent" form:"name"`
	Weight string `json:"weight" form:"name"`
}
