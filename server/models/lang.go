package models

type Lang struct {
	Id      int    `json:"id"`
	Name    string `json:"name"`
	Lang    string `json:"lang"`
	Default int    `json:"default"`
	Status  int    `json:"status"`
	CommonField
}

func (c *Lang) TableName() string {
	return "sl_lang"
}

type LangListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}
type LangListRes struct {
	Total int64  `json:"total"`
	List  []Lang `json:"list"`
}
type LangUpdateReq struct {
	Id   int    `json:"id" form:"id" binding:"required"`
	Name string `json:"name" form:"name" binding:"required"`
	Lang string `json:"lang" form:"lang" binding:"required"`
}

type LangCreateReq struct {
	Name string `json:"name" form:"name" binding:"required"`
	Lang string `json:"lang" form:"lang" binding:"required"`
}

type LangChangeFieldReq struct {
	Default int `json:"default" form:"default"`
	Status  int `json:"status" form:"status" `
}

type LangDelReq struct {
	Id int `json:"id" form:"id" validate:"required"`
}
