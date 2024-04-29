package models

type Admin struct {
	Id       uint   `json:"id" form:"id"`
	Username string `json:"username" form:"username"`
	Password string `json:"password" form:"password"`
	Salt     string `json:"salt" form:"salt"`
}

func (m *Admin) TableName() string {
	return "sl_admin"
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
