package models

type AdminGroup struct {
	Id          int    `json:"id"  gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Mark        string `json:"mark"`
	Name        string `json:"name"`
	Description string `json:"description"`
	MenuPermit  string `json:"menu_permit"`
	MenuModules string `json:"menu_modules"`
	AllowIp     string `json:"allow_ip"`
	Status      int    `json:"status" gorm:"column:status;type:int(11);default:1"`

	CommonField
}

func (ug *AdminGroup) TableName() string {
	return "sl_admin_group"
}

type AdminGroupInfo struct {
	Id          int    `json:"id"`
	Mark        string `json:"mark"`
	Name        string `json:"name"`
	Description string `json:"description"`
	MenuPermit  string `json:"menu_permit"`
	StatusName  string `json:"status_name"`
	MenuModules string `json:"menu_modules"`
	AllowIp     string `json:"allow_ip"`
	CreateTime  string `json:"create_time"`
}

type AdminGroupUpdateReq struct {
	Id          int    `json:"id" form:"id"  binding:"required"`
	Name        string `json:"name" form:"name" binding:"required"`
	Mark        string `json:"mark" form:"mark"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
	Description string `json:"description" form:"description"`
}

type AdminGroupCreateReq struct {
	Name        string `json:"name" form:"name" binding:"required"`
	Mark        string `json:"mark" form:"mark"`
	Description string `json:"description" form:"description"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
}

type AdminGroupListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Status int    `json:"status" form:"status,default=1" `
}

type AdminGroupListRes struct {
	Total int64            `json:"total"`
	List  []AdminGroupInfo `json:"list"`
}

type AdminGroupDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type AdminGroupMine struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}
