package models

type Menu struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Type   string `json:"type"`
	Mark   string `json:"mark"`
	Parent string `json:"parent"`
	Author string `json:"author"`
	Url    string `json:"url"`
	Icon   string `json:"icon"`
	Weight string `json:"weight"`
	Status string `json:"status"`
	CommonField
}

type MenuMine struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Parent string `json:"parent" form:"parent"`
}

func (c *Menu) TableName() string {
	return "sl_Menu"
}

type MenuUpdateReq struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Type   string `json:"type"`
	Mark   string `json:"mark"`
	Parent string `json:"parent"`
	Author string `json:"author"`
	Url    string `json:"url"`
	Icon   string `json:"icon"`
	Weight string `json:"weight"`
}

type MenuCreateReq struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Type   string `json:"type"`
	Mark   string `json:"mark"`
	Parent string `json:"parent"`
	Author string `json:"author"`
	Url    string `json:"url"`
	Icon   string `json:"icon"`
	Weight string `json:"weight"`
}

type MenuReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type MenuListRes struct {
	Total int64  `json:"total"`
	List  []Menu `json:"list"`
}

type MenuNoPageReq struct {
	Parent int `json:"parent" form:"parent,default=0"`
	Status int `json:"status" form:"status,default=1" `
}

type MenuNoPageListRes struct {
	List []MenuMine `json:"list"`
}

type MenuDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
