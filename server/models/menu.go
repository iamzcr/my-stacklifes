package models

type Menu struct {
	Id     int    `json:"id"  form:"id" `
	Name   string `json:"name" form:"name"  binding:"required"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Parent int    `json:"parent"  form:"parent,default=0" binding:"required"`
	Weight int    `json:"weight" form:"weight,default=0" binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Status int    `json:"status" form:"status,default=1"`
	Author string `json:"author" form:"author,default=nicholas"`
	Icon   string `json:"icon" form:"icon"`
	Mark   string `json:"mark" form:"mark" `
	CommonField
}

func (c *Menu) TableName() string {
	return "sl_menu"
}

type MenuUpdateReq struct {
	Id     int    `json:"id"  form:"id"  binding:"required"`
	Name   string `json:"name" form:"name"  binding:"required"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Parent int    `json:"parent"  form:"parent,default=0" binding:"required"`
	Weight int    `json:"weight" form:"weight,default=0" binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Status int    `json:"status" form:"status,default=1"`
	Author string `json:"author" form:"author,default=nicholas"`
	Icon   string `json:"icon" form:"icon"`
	Mark   string `json:"mark" form:"mark" `
}

type MenuCreateReq struct {
	Name   string `json:"name" form:"name"  binding:"required"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Parent int    `json:"parent"  form:"parent,default=0" binding:"required"`
	Weight int    `json:"weight" form:"weight,default=0" binding:"required"`
	Type   int    `json:"type" form:"type,default=1"`
	Status int    `json:"status" form:"status,default=1"`
	Author string `json:"author" form:"author,default=nicholas"`
	Icon   string `json:"icon" form:"icon"`
	Mark   string `json:"mark" form:"mark" `
}

type MenuListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
	Status int    `json:"status" form:"status" `
}

type MenuListRes struct {
	Total int64      `json:"total"`
	List  []MenuInfo `json:"list"`
}

type MenuInfo struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Type        int    `json:"type"`
	Mark        string `json:"mark"`
	Parent      int    `json:"parent"`
	Author      string `json:"author"`
	Url         string `json:"url"`
	Icon        string `json:"icon"`
	Weight      int    `json:"weight"`
	Status      int    `json:"status"`
	CreateTime  string `json:"create_time"`
	UpdatedTime string `json:"updated_time"`
	ParentName  string `json:"parent_name"`
	StatusName  string `json:"status_name"`
	TypeName    string `json:"type_name"`
}

type MenuMine struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
}

type MenuAssignList struct {
	MenuInfo    interface{}
	MenuParents interface{}
}

type MenuDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
