package models

type Menu struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Type   string `json:"type"`
	Mark   string `json:"mark"`
	Parent int    `json:"parent"`
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
	return "sl_menu"
}

type MenuUpdateReq struct {
	Id     int    `json:"id"`
	Url    string `json:"url"  binding:"required"`
	Icon   string `json:"icon"`
	Name   string `json:"name" form:"name"  binding:"required"`
	Type   string `json:"type" form:"type,default=1"`
	Parent int    `json:"parent" form:"parent,default=0"`
	Weight string `json:"weight" form:"weight"`
	Author string `json:"author" form:"author,default=nicholas"`
	Mark   string `json:"mark" form:"mark"`
}

type MenuCreateReq struct {
	Url    string `json:"url"  binding:"required"`
	Icon   string `json:"icon"`
	Name   string `json:"name" form:"name"  binding:"required"`
	Type   string `json:"type" form:"type,default=1"`
	Parent int    `json:"parent" form:"parent,default=0"`
	Weight string `json:"weight" form:"weight"`
	Author string `json:"author" form:"author,default=nicholas"`
	Mark   string `json:"mark" form:"mark"`
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
