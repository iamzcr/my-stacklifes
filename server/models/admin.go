package models

type Admin struct {
	Id             int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Username       string `json:"username"`
	Password       string `json:"password"`
	Salt           string `json:"salt"`
	GroupId        int    `json:"group_id"`
	Name           string `json:"name" `
	ExpirationTime int64  `json:"expiration_time"`
	LoginNum       int    `json:"login_num" `
	Status         int    `json:"status"  gorm:"column:status;type:int(11);default:1"`
	LastLoginTime  int64  `json:"last_login_time" `
	LastLoginIp    string `json:"last_login_ip"`
	Lang           string `json:"lang"  gorm:"column:lang;string;default:zh"`
	CommonField
}

func (m *Admin) TableName() string {
	return "sl_admin"
}

type AdminInfo struct {
	Id             int    `json:"id" `
	Username       string `json:"username"`
	Password       string `json:"password"`
	Salt           string `json:"salt"`
	GroupId        int    `json:"group_id"`
	Name           string `json:"name" `
	LoginNum       int    `json:"login_num" `
	Status         int    `json:"status" `
	LastLoginTime  string `json:"last_login_time" `
	LastLoginIp    string `json:"last_login_ip"`
	Lang           string `json:"lang"`
	CreateTime     string `json:"create_time"`
	UpdateTime     string `json:"update_time"`
	StatusName     string `json:"status_name"`
	GroupName      string `json:"group_name"`
	ExpirationTime string `json:"expiration_time" `
}

type AdminListRes struct {
	Total int64       `json:"total"`
	List  []AdminInfo `json:"list"`
}

type AdminListReq struct {
	PageInfo
	Username string `json:"username" form:"username"`
}

type AdminCreateReq struct {
	Username       string `json:"username" form:"username" binding:"required"`
	Password       string `json:"password" form:"password" `
	Name           string `json:"name" form:"name" `
	ExpirationTime string `json:"expiration_time" form:"expiration_time" binding:"required" `
	Status         int    `json:"status" form:"status,default=1"`
	Lang           string `json:"lang"  form:"author,default=zh" `
	GroupId        int    `json:"group_id" form:"group_id" binding:"required"`
}

type AdminDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type AdminAssignList struct {
	Info        interface{}
	AdminGroups interface{}
}

type TokenInfo struct {
	Id             int    `json:"id"`
	Authentication string `json:"authentication"`
	Username       string `json:"username"`
}
type LoginReq struct {
	Username string `json:"username"  form:"username" `
	Password string `json:"password" form:"password"`
}
