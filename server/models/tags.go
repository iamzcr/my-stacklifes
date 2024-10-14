package models

type Tags struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Mark   string `json:"mark"`
	Type   int    `json:"type"`
	Author string `json:"author"`
	Weight int    `json:"weight"`
	Status int    `json:"status"`
	CommonField
}

type TagsMine struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
	Mark string `json:"mark"`
}

func (c *Tags) TableName() string {
	return "sl_tags"
}

type TagsListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type TagsListRes struct {
	Total int64  `json:"total"`
	List  []Tags `json:"list"`
}

type TagsNoPageReq struct {
	Name string `json:"name" form:"name"`
}
type TagsNoPageListRes struct {
	List   []TagsMine `json:"list"`
	Status int        `json:"status" form:"status,default=1" `
}
type TagsUpdateReq struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
}

type TagsCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
}

type TagsDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type TagsFieldReq struct {
	Id     int `json:"id" form:"id" binding:"required"`
	Status int `json:"status" form:"status"`
}
