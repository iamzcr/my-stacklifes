package models

type Tags struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Mark   string `json:"mark"`
	Type   int    `json:"type"`
	Author string `json:"author"`
	Weight int    `json:"weight"`
	Status int    `json:"status"`
}

type TagsInfo struct {
	Tags
	CommonField
}

func (c *Tags) TableName() string {
	return "sl_tags"
}

type TagsListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type TagsNoPageReq struct {
	Name string `json:"name" form:"name"`
}

type TagsUpdateReq struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type TagsCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type TagsDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
type TagsListRes struct {
	Total int64  `json:"total"`
	List  []Tags `json:"list"`
}
