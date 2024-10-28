package models

type Tags struct {
	Id     int    `json:"id" json:"id"  gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Name   string `json:"name"`
	Mark   string `json:"mark"`
	Weight int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	Type   int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Status int    `json:"status" gorm:"column:status;type:int(11);default:1" `
	Author string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	CommonField
}

func (c *Tags) TableName() string {
	return "sl_tags"
}

type TagsInfo struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Mark        string `json:"mark"`
	Type        int    `json:"type"`
	Author      string `json:"author"`
	Weight      int    `json:"weight"`
	Status      int    `json:"status"`
	CreateTime  string `json:"create_time"`
	UpdatedTime string `json:"updated_time"`
	StatusName  string `json:"status_name"`
	TypeName    string `json:"type_name"`
}
type TagsMine struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
	Mark string `json:"mark"`
}
type TagsListRes struct {
	Total int64      `json:"total"`
	List  []TagsInfo `json:"list"`
}
type TagsListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Status int    `json:"status" form:"status,default=1" `
}

type TagsUpdateReq struct {
	Id     int    `json:"id" form:"id"  binding:"required"`
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
}

type TagsCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
}

type TagsDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type TagsFieldReq struct {
	Id     int `json:"id" form:"id" binding:"required"`
	Status int `json:"status" form:"status"  binding:"required"`
}
