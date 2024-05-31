package models

type Permit struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Type    string `json:"type" form:"type"`
	Parent  string `json:"parent" form:"parent"`
	Modules string `json:"modules" form:"modules"`
	Status  string `json:"status" form:"status"`
}

func (c *Permit) TableName() string {
	return "sl_permit"
}

type PermitInfo struct {
	Permit
	CommonField
}

type PermitListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type PermitNoPageReq struct {
	Parent int `json:"parent" form:"parent"`
}

type PermitUpdateReq struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"  binding:"required"`
	Type    string `json:"type" form:"type"`
	Parent  string `json:"parent" form:"parent"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
	Status  string `json:"status" form:"status"`
}

type PermitCreateReq struct {
	Name    string `json:"name" form:"name"  binding:"required"`
	Type    string `json:"type" form:"type" `
	Parent  string `json:"parent" form:"parent"`
	Modules string `json:"modules" form:"modules"  binding:"required"`
	Status  string `json:"status" form:"status"`
}
type PermitDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type PermitListRes struct {
	Total int64    `json:"total"`
	List  []Permit `json:"list"`
}
