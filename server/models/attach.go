package models

type Attach struct {
	Id     int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Name   string `json:"name"`
	Link   string `json:"link"`
	Path   string `json:"path"`
	Type   int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Status int    `json:"status"  gorm:"column:status;type:int(11);default:1"`
	CommonField
}

func (c *Attach) TableName() string {
	return "sl_attach"
}

type AttachInfo struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Link        string `json:"link" `
	Path        string `json:"path"`
	Type        int    `json:"type"`
	Status      int    `json:"status"`
	CreateTime  string `json:"create_time"`
	UpdatedTime string `json:"updated_time"`
	StatusName  string `json:"status_name"`
	TypeName    string `json:"type_name"`
}

type AttachListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type AttachListRes struct {
	Total int64        `json:"total"`
	List  []AttachInfo `json:"list"`
}
type AttachCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Link   string `json:"link" form:"link"  binding:"required"`
	Path   string `json:"path" form:"mark"  binding:"required"`
	Type   int    `json:"type" form:"type"`
	Status int    `json:"status" form:"status"`
}
