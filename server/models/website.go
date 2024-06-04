package models

type Website struct {
	Id    int    `json:"id"`
	Key   string `json:"key"`
	Name  string `json:"name"`
	Value string `json:"value"`
}
type WebsiteInfo struct {
	Website
	CommonField
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
type WebsiteNoPageListRes struct {
	List []Website `json:"list"`
}

type WebsiteCreateReq struct {
	Key   string `json:"key"`
	Name  string `json:"name"`
	Value string `json:"value"`
}

type WebsiteDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
