package models

type Lang struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Lang    string `json:"lang" form:"lang"`
	Parent  string `json:"parent" form:"parent"`
	Default string `json:"default" form:"default"`
	Status  string `json:"status" form:"status"`
}

type LangInfo struct {
	Lang
	CommonField
}

func (c *Lang) TableName() string {
	return "sl_Lang"
}

type LangReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type LangListRes struct {
	Total int64  `json:"total"`
	List  []Lang `json:"list"`
}
