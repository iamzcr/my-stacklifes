package models

type Category struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Mark   string `json:"mark"`
	Type   int    `json:"type"`
	Author string `json:"author"`
	Parent int    `json:"parent"`
	Weight int    `json:"weight"`
	Status int    `json:"status"`
}

type CategoryInfo struct {
	Category
	CommonField
}

func (c *Category) TableName() string {
	return "sl_category"
}

type CategoryListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
}

type CategoryNoPageReq struct {
	Parent int `json:"parent" form:"parent"`
}

type CategoryUpdateReq struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Parent int    `json:"parent" form:"parent" binding:"omitempty"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type CategoryCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Parent int    `json:"parent" form:"parent" binding:"omitempty"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type CategoryListRes struct {
	Total int64      `json:"total"`
	List  []Category `json:"list"`
}

type CategoryDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
