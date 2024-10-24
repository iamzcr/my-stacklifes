package models

type Read struct {
	Id      int    `json:"id"  gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Aid     int    `json:"aid"`
	Ip      string `json:"ip" `
	Referer string `json:"referer"`
	CommonField
}

type ReadInfo struct {
	Id           int    `json:"id"`
	Aid          int    `json:"aid"`
	Ip           string `json:"ip"`
	Referer      string `json:"referer"`
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
	Aid     int    `json:"aid" form:"aid" binding:"required"`
	Ip      string `json:"ip" form:"ip"`
	Referer string `json:"referer" form:"referer"`
}
