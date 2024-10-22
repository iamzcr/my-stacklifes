package models

type Permit struct {
	Id      int    `json:"id"`
	Name    string `json:"name"`
	Type    int    `json:"type"`
	Parent  int    `json:"parent"`
	Modules string `json:"modules"`
	Status  string `json:"status"`
	Weight  string `json:"weight"`
	Author  string `json:"author"`
	Mark    string `json:"mark"`
	CommonField
}

type PermitMine struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Parent int    `json:"parent" form:"parent" gorm:"default:1"`
}

func (c *Permit) TableName() string {
	return "sl_permit"
}

type PermitListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type PermitListRes struct {
	Total int64    `json:"total"`
	List  []Permit `json:"list"`
}

type PermitNoPageReq struct {
	Parent int `json:"parent" form:"parent,default=0" `
}

type PermitNoPageListRes struct {
	List []PermitMine `json:"list"`
}

type PermitUpdateReq struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"  binding:"required"`
	Type    int    `json:"type" form:"type,default=1"`
	Parent  int    `json:"parent" form:"parent,default=0"`
	Weight  string `json:"weight" form:"weight"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Mark    string `json:"mark" form:"mark"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
}

type PermitCreateReq struct {
	Name    string `json:"name" form:"name"  binding:"required"`
	Type    int    `json:"type" form:"type,default=1"`
	Parent  int    `json:"parent" form:"parent,default=0"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
}

type PermitDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
