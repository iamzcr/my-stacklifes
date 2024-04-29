package models

type Log struct {
	Id       int    `json:"id" form:"id"`
	Username string `json:"username" form:"username"`
	Content  string `json:"content" form:"content"`
}

type LogInfo struct {
	Log
	CommonField
}

func (c *Log) TableName() string {
	return "sl_log"
}

type LogReq struct {
	PageInfo
	Content string `json:"username" form:"username"`
}

type LogListRes struct {
	Total int64 `json:"total"`
	List  []Log `json:"list"`
}
