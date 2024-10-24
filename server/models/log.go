package models

type Log struct {
	Id       int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Username string `json:"username" gorm:"column:username;type:string;default:nicholas" `
	Type     int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Ip       string `json:"ip" `
	Content  string `json:"content"`
	CommonField
}

func (c *Log) TableName() string {
	return "sl_log"
}

type LogInfo struct {
	Id         int    `json:"id"`
	Username   string `json:"username"`
	CreateTime string `json:"create_time"`
	Type       int    `json:"type"`
	Ip         string `json:"ip"`
	Content    string `json:"content"`
}

type LogCreateReq struct {
	Content  string `json:"content"  form:"content" binding:"required"`
	Username string `json:"username" form:"author,default=nicholas"`
	Ip       string `json:"ip"  form:"ip"`
	Type     int    `json:"type" form:"type,default=1"`
}

type LogReq struct {
	PageInfo
	Content string `json:"content" form:"content"`
}

type LogListRes struct {
	Total int64     `json:"total"`
	List  []LogInfo `json:"list"`
}
