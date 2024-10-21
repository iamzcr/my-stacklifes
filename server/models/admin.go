package models

type Admin struct {
	Id             int    `json:"id" form:"id"`
	Username       string `json:"username" form:"username"`
	Password       string `json:"password" form:"password"`
	Salt           string `json:"salt" form:"salt"`
	GroupId        int    `json:"group_id" form:"group_id"`
	Name           int    `json:"name" form:"name"`
	ExpirationTime int64  `json:"expiration_time" form:"expiration_time"`
	LoginNum       int    `json:"login_num" form:"login_num"  gorm:"default:0"`
	Status         int    `json:"status" form:"status"  gorm:"default:1"`
	LastLoginTime  int    `json:"last_login_time" form:"last_login_time"`
	LastLoginIp    string `json:"last_login_ip" form:"last_login_ip"`
	Lang           string `json:"lang" form:"lang" gorm:"default:'zh'"`
	CommonField
}

func (m *Admin) TableName() string {
	return "sl_admin"
}

type AdminListReq struct {
	PageInfo
	Username string `json:"username" form:"username"`
}

type AdminListRes struct {
	Total int64   `json:"total"`
	List  []Admin `json:"list"`
}

type AdminCreateReq struct {
	Username string `json:"username" form:"username" binding:"required"`
	Password string `json:"password" form:"password" `
	GroupId  int    `json:"group_id" form:"group_id" binding:"required"`
}

type AdminDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type AdminFieldReq struct {
	Id     int `json:"id" form:"id" binding:"required"`
	Status int `json:"status" form:"status"`
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
