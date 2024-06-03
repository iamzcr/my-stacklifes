package models

type Admin struct {
	Id            uint   `json:"id" form:"id"`
	Username      string `json:"username" form:"username"`
	Password      string `json:"password" form:"password"`
	Salt          string `json:"salt" form:"salt"`
	GroupId       int    `json:"group_id" form:"group_id"`
	Expiration    int    `json:"expiration" form:"expiration"`
	LoginNum      int    `json:"login_num" form:"login_num"`
	LastLoginTime int    `json:"last_login_time" form:"last_login_time"`
	LastLoginIp   string `json:"last_login_ip" form:"last_login_ip"`
	Lang          string `json:"lang" form:"lang"`
}

func (m *Admin) TableName() string {
	return "sl_admin"
}

type AdminListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type AdminCreateReq struct {
	Username   string `json:"username" form:"username" binding:"required"`
	Password   string `json:"password" form:"password" binding:"required"`
	Salt       string `json:"salt" form:"salt"`
	GroupId    int    `json:"group_id" form:"group_id" binding:"required"`
	Expiration int    `json:"expiration" form:"expiration"`
	Lang       string `json:"lang" form:"lang"`
}

type AdminDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
type AdminListRes struct {
	Total int64   `json:"total"`
	List  []Admin `json:"list"`
}

type TokenInfo struct {
	Id             uint   `json:"id"`
	Authentication string `json:"authentication"`
	Username       string `json:"password"`
}
type LoginReq struct {
	Name     string `json:"name"`
	Password string `json:"password"`
}
