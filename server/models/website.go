package models

type Website struct {
	Id    int    `json:"id"  gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Name  string `json:"name"`
	Key   string `json:"key"`
	Value string `json:"value"`
	CommonField
}

func (c *Website) TableName() string {
	return "sl_website"
}

type WebsiteInfo struct {
	Id         int    `json:"id"`
	Name       string `json:"name"`
	Key        string `json:"key"`
	Value      string `json:"value"`
	CreateTime string `json:"create_time"`
}

type WebsiteListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type WebsiteListRes struct {
	Total int64         `json:"total"`
	List  []WebsiteInfo `json:"list"`
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
	List []WebsiteInfo `json:"list"`
}
