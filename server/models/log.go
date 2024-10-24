package models

type Log struct {
	Id       int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Username string `json:"username" `
	Type     string `json:"type"`
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
	Type       string `json:"type"`
	Ip         string `json:"ip"`
	Content    string `json:"content"`
}

type LogReq struct {
	PageInfo
	Content string `json:"content" form:"content"`
}

type LogListRes struct {
	Total int64     `json:"total"`
	List  []LogInfo `json:"list"`
}
