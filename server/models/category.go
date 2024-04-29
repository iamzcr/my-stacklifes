package models

type Category struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Mark   string `json:"mark" form:"mark"`
	Type   string `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Parent string `json:"parent" form:"parent"`
	Weight string `json:"weight" form:"weight"`
	Status string `json:"status" form:"status"`
}

type CategoryInfo struct {
	Category
	CommonField
}

func (c *Category) TableName() string {
	return "sl_category"
}

type CategoryReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type CategoryListRes struct {
	Total int64      `json:"total"`
	List  []Category `json:"list"`
}
