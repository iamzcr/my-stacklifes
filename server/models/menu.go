package models

type Menu struct {
	Id     int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT" `
	Name   string `json:"name" `
	Url    string `json:"url"  `
	Parent int    `json:"parent" gorm:"column:parent;type:int(11);default:0"`
	Type   int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Status int    `json:"status" gorm:"column:status;type:int(11);default:1" `
	Weight int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	Author string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	Icon   string `json:"icon"`
	Mark   string `json:"mark" `
	CommonField
}

func (c *Menu) TableName() string {
	return "sl_menu"
}

type MenuUpdateReq struct {
	Id     int    `json:"id"  form:"id"  binding:"required"`
	Name   string `json:"name" form:"name"  binding:"required"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Parent int    `json:"parent"  form:"parent,default=0"`
	Type   int    `json:"type" form:"type,default=1"`
	Status int    `json:"status" form:"status,default=1"`
	Weight int    `json:"weight" form:"weight,default=0"`
	Author string `json:"author" form:"author,default=nicholas"`
	Icon   string `json:"icon" form:"icon"`
	Mark   string `json:"mark" form:"mark" `
}

type MenuCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Url    string `json:"url"  form:"url" binding:"required"`
	Parent int    `json:"parent" form:"parent,default=0" `
	Weight int    `json:"weight" form:"weight,default=0"`
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
	Weight      int    `json:"weight"`
	Url         string `json:"url"`
	Icon        string `json:"icon"`
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

// Menu 结构体表示菜单项
type MenuTree struct {
	Id       int
	Name     string
	Url      string
	Parent   int
	Children []MenuTree
}

type MenuDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
