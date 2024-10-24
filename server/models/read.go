package models

type Read struct {
	Id      int    `json:"id" form:"id"`
	Aid     int    `json:"aid" form:"aid"`
	Ip      string `json:"ip" form:"ip"`
	Referer string `json:"referer" form:"referer"`
	CommonField
}

type ReadInfo struct {
	Id           int    `json:"id" form:"id"`
	Aid          int    `json:"aid" form:"aid"`
	Ip           string `json:"ip" form:"ip"`
	Referer      string `json:"referer" form:"referer"`
	CreateTime   string `json:"create_time"`
	ArticleTitle string `json:"article_title"`
}

func (c *Read) TableName() string {
	return "sl_read"
}

type ReadReq struct {
	PageInfo
	Ip string `json:"ip" form:"ip"`
}

type ReadListRes struct {
	Total int64      `json:"total"`
	List  []ReadInfo `json:"list"`
}

type ReadCreateReq struct {
	Aid     int    `json:"aid" form:"aid"`
	Ip      string `json:"ip" form:"ip"`
	Referer string `json:"referer" form:"referer"`
}
