package models

type AdminGroup struct {
	Id          int    `json:"id" form:"id"`
	Mark        string `json:"mark" form:"mark"`
	Name        string `json:"name" form:"name"`
	Description string `json:"description" form:"description"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
}

type AdminGroupInfo struct {
	AdminGroup
	CommonField
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

type AdminGroupPageReq struct {
	Name string `json:"name" form:"name"`
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
