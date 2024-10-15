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
	CommonField
}

func (c *Category) TableName() string {
	return "sl_category"
}

type CategoryMine struct {
	Id   int    `json:"id"`
	Mark string `json:"mark"`
	Name string `json:"name"`
}

type CategoryListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
}

type CategoryListRes struct {
	Total int64      `json:"total"`
	List  []Category `json:"list"`
}

type CategoryNoPageReq struct {
	Parent int `json:"parent" form:"parent,default=0"`
	Status int `json:"status" form:"status,default=1" `
}
type CategoryNoPageListRes struct {
	List []CategoryMine `json:"list"`
}

type CategoryNavListReq struct {
	Parent int `json:"parent" form:"parent,default=0"`
	Status int `json:"status" form:"status,default=1" `
	Type   int `json:"type" form:"type,default=1" `
}
type CategoryNavListRes struct {
	List []CategoryMine `json:"list"`
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

type CategoryDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
