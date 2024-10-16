package models

type Permit struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Type    string `json:"type" form:"type"`
	Parent  int    `json:"parent" form:"parent" gorm:"default:1"`
	Modules string `json:"modules" form:"modules"`
	Status  string `json:"status" form:"status"`
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
	Type    string `json:"type" form:"type"`
	Parent  int    `json:"parent" form:"parent,default=0"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
}

type PermitCreateReq struct {
	Name    string `json:"name" form:"name"  binding:"required"`
	Type    string `json:"type" form:"type,default=admin" `
	Parent  int    `json:"parent" form:"parent,default=0"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
}

type PermitDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
