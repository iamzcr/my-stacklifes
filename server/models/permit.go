package models

type Permit struct {
	Id      int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT" `
	Modules string `json:"modules"`
	Name    string `json:"name" `
	Parent  int    `json:"parent" gorm:"column:parent;type:int(11);default:0"`
	Weight  int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	Type    int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Status  int    `json:"status" gorm:"column:status;type:int(11);default:1"`
	Author  string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	Mark    string `json:"mark" `
	CommonField
}

func (c *Permit) TableName() string {
	return "sl_permit"
}

type PermitUpdateReq struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"  binding:"required"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
	Type    int    `json:"type" form:"type,default=1"`
	Parent  int    `json:"parent" form:"parent,default=0"`
	Weight  int    `json:"weight" form:"weight"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Mark    string `json:"mark" form:"mark"`
}

type PermitCreateReq struct {
	Name    string `json:"name" form:"name"  binding:"required"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
	Parent  int    `json:"parent" form:"parent,default=0" `
	Weight  int    `json:"weight" form:"weight,default=0"`
	Type    int    `json:"type" form:"type,default=1"`
	Status  int    `json:"status" form:"status,default=1"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Mark    string `json:"mark" form:"mark" `
}
type PermitListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
	Status int    `json:"status" form:"status" `
}

type PermitInfo struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Modules     string `json:"modules"`
	Type        int    `json:"type"`
	Mark        string `json:"mark"`
	Parent      int    `json:"parent"`
	Author      string `json:"author"`
	Weight      int    `json:"weight"`
	Status      int    `json:"status"`
	CreateTime  string `json:"create_time"`
	UpdatedTime string `json:"updated_time"`
	ParentName  string `json:"parent_name"`
	StatusName  string `json:"status_name"`
	TypeName    string `json:"type_name"`
}

type PermitListRes struct {
	Total int64        `json:"total"`
	List  []PermitInfo `json:"list"`
}

type PermitMine struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent"`
}

type PermitAssignList struct {
	PermitInfo    interface{}
	PermitParents interface{}
}

type PermitDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
