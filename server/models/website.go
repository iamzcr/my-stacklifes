package models

type Website struct {
	Id    int    `json:"id"`
	Key   string `json:"key"`
	Name  string `json:"name"`
	Value string `json:"value"`
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
	Key   string `json:"key"`
	Name  string `json:"name"`
	Value string `json:"value"`
}

type WebsiteDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type WebsiteFrontendList struct {
	List []WebsiteMine `json:"list"`
}
