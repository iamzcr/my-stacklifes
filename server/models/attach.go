package models

type Attach struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Link   string `json:"link" form:"link"`
	Path   string `json:"path" form:"path"`
	Type   string `json:"type" form:"type"`
	Status string `json:"status" form:"status"`
}
type AttachInfo struct {
	Attach
	CommonField
}

func (c *Attach) TableName() string {
	return "sl_attach"
}

type AttachReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type AttachListRes struct {
	Total int64    `json:"total"`
	List  []Attach `json:"list"`
}
