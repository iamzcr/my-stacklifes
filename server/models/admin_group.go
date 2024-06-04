package models

type AdminGroup struct {
	Id          int    `json:"id" form:"id"`
	Mark        string `json:"mark" form:"mark"`
	Name        string `json:"name" form:"name"`
	Description string `json:"description" form:"description"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
	CommonField
}
type AdminGroupMine struct {
	Id   int    `json:"id"`
	Mark string `json:"mark"`
	Name string `json:"name"`
}

func (ug *AdminGroup) TableName() string {
	return "sl_admin_group"
}

type AdminGroupListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type AdminGroupListRes struct {
	Total int64        `json:"total"`
	List  []AdminGroup `json:"list"`
}

type AdminGroupNoPageReq struct {
	Status int `json:"status" form:"status,default=1" `
}

type AdminGroupNoPageListRes struct {
	List []AdminGroupMine `json:"list"`
}

type AdminGroupUpdateReq struct {
	Id          int    `json:"id" form:"id"`
	Name        string `json:"name" form:"name" binding:"required"`
	Mark        string `json:"mark" form:"mark"`
	Description string `json:"description" form:"description"`
}

type AdminGroupCreateReq struct {
	Name        string `json:"name" form:"name" binding:"required"`
	Mark        string `json:"mark" form:"mark"`
	Description string `json:"description" form:"description"`
}

type AdminGroupDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
