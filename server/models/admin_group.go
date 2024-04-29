package models

type UserGroup struct {
	Id          int    `json:"id" form:"id"`
	Mark        string `json:"mark" form:"mark"`
	Name        string `json:"name" form:"name"`
	Description string `json:"description" form:"description"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
	CommonField
}

type UserGroupInfo struct {
	Id          int    `json:"id" form:"id"`
	Mark        string `json:"mark" form:"mark"`
	Name        string `json:"name" form:"name"`
	Description string `json:"description" form:"description"`
	MenuPermit  string `json:"menu_permit" form:"menu_permit"`
	MenuModules string `json:"menu_modules" form:"menu_modules"`
	AllowIp     string `json:"allow_ip" form:"allow_ip"`
	CommonField
}

func (ug *UserGroup) TableName() string {
	return "sl_user_group"
}
