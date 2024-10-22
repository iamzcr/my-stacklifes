package models

type Website struct {
	Id    int    `json:"id" form:"id" `
	Name  string `json:"name" form:"name"`
	Key   string `json:"key" form:"key"`
	Value string `json:"value" form:"value" `
	CommonField
}
type WebsiteMine struct {
	Key   string `json:"key"`
	Name  string `json:"name"`
	Value string `json:"value"`
}

func (c *Website) TableName() string {
	return "sl_website"
}

type WebsiteListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type WebsiteListRes struct {
	Total int64     `json:"total"`
	List  []Website `json:"list"`
}

type WebsiteCreateReq struct {
	Name  string `json:"name" form:"name" binding:"required"`
	Key   string `json:"key" form:"key" binding:"required"`
	Value string `json:"value" form:"value" binding:"required"`
}

type WebsiteUpdateReq struct {
	Id    int    `json:"id" form:"id"  binding:"required"`
	Name  string `json:"name" form:"name" binding:"required"`
	Key   string `json:"key" form:"key" binding:"required"`
	Value string `json:"value" form:"value" binding:"required"`
}

type WebsiteDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type WebsiteFrontendList struct {
	List []WebsiteMine `json:"list"`
}
