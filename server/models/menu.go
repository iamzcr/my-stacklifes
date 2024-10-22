package models

type Menu struct {
	Id     int    `json:"id"  form:"id" `
	Name   string `json:"name" form:"name"  binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Mark   string `json:"mark" form:"mark" `
	Parent int    `json:"parent"  form:"parent" binding:"required"`
	Author string `json:"author"  form:"author"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Icon   string `json:"icon" form:"icon"  `
	Weight string `json:"weight" form:"weight,default=1"`
	Status string `json:"status" form:"status,default=1"`
	CommonField
}

func (c *Menu) TableName() string {
	return "sl_menu"
}

type MenuUpdateReq struct {
	Id     int    `json:"id"`
	Url    string `json:"url"  form:"url"   binding:"required"`
	Icon   string `json:"icon"`
	Name   string `json:"name" form:"name"  binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Parent int    `json:"parent" form:"parent,default=0"`
	Weight string `json:"weight" form:"weight"`
	Author string `json:"author" form:"author,default=nicholas"`
	Mark   string `json:"mark" form:"mark"`
}

type MenuCreateReq struct {
	Url    string `json:"url"  form:"url" binding:"required"`
	Icon   string `json:"icon"`
	Name   string `json:"name" form:"name" binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Parent int    `json:"parent" form:"parent,default=0"`
	Weight string `json:"weight" form:"weight"`
	Author string `json:"author" form:"author,default=nicholas"`
	Mark   string `json:"mark" form:"mark"`
}

type MenuListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}
type MenuInfo struct {
	Id         int    `json:"id"`
	Name       string `json:"name"`
	Type       int    `json:"type"`
	Mark       string `json:"mark"`
	Parent     int    `json:"parent"`
	ParentName string `json:"parent_name"`
	Author     string `json:"author"`
	Url        string `json:"url"`
	Icon       string `json:"icon"`
	Weight     string `json:"weight"`
	Status     string `json:"status"`
}
type MenuListRes struct {
	Total int64      `json:"total"`
	List  []MenuInfo `json:"list"`
}

type MenuMine struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Parent string `json:"parent" form:"parent"`
}

type MenuNoPageReq struct {
	Parent int `json:"parent" form:"parent"`
	Status int `json:"status" form:"status" `
}

type MenuNoPageListRes struct {
	List []MenuMine `json:"list"`
}

type MenuAssignList struct {
	MenuInfo    interface{}
	MenuParents interface{}
}

type MenuDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
