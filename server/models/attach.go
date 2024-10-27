package models

type Attach struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Link   string `json:"link" form:"link"`
	Path   string `json:"path" form:"path"`
	Type   string `json:"type" form:"type"`
	Status string `json:"status" form:"status"`
	CommonField
}

func (c *Attach) TableName() string {
	return "sl_attach"
}

type AttachInfo struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Link   string `json:"link" `
	Path   string `json:"path"`
	Type   string `json:"type"`
	Status string `json:"status"`
}

type AttachReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type AttachListRes struct {
	Total int64    `json:"total"`
	List  []Attach `json:"list"`
}
