package models

type LogFail struct {
	Id       int    `json:"id" form:"id"`
	Type     string `json:"type" form:"type"`
	Username string `json:"username" form:"username"`
	Ip       string `json:"ip" form:"ip"`
	Content  string `json:"content" form:"content"`
}

type LogFailInfo struct {
	LogFail
	CommonField
}

func (c *LogFail) TableName() string {
	return "sl_log_fail"
}

type LogFailReq struct {
	PageInfo
	Content string `json:"username" form:"username"`
}

type LogFailListRes struct {
	Total int64     `json:"total"`
	List  []LogFail `json:"list"`
}
