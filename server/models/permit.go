package models

type Permit struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Type    string `json:"type" form:"type"`
	Parent  string `json:"parent" form:"parent"`
	Modules string `json:"modules" form:"modules"`
	Status  string `json:"status" form:"status"`
}

type PermitInfo struct {
	Permit
	CommonField
}

func (c *Permit) TableName() string {
	return "sl_permit"
}

type PermitReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type PermitListRes struct {
	Total int64    `json:"total"`
	List  []Permit `json:"list"`
}
