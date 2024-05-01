package models

type Menu struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Type   string `json:"type" form:"type"`
	Mark   string `json:"mark" form:"mark"`
	Parent string `json:"parent" form:"parent"`
	Author string `json:"author" form:"author"`
	Url    string `json:"url" form:"url"`
	Icon   string `json:"icon" form:"icon"`
	Weight string `json:"weight" form:"weight"`
	Status string `json:"status" form:"status"`
}

type MenuInfo struct {
	Menu
	CommonField
}

func (c *Menu) TableName() string {
	return "sl_Menu"
}

type MenuReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type MenuListRes struct {
	Total int64  `json:"total"`
	List  []Menu `json:"list"`
}
