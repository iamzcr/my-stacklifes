package models

type Lang struct {
	Id      int    `json:"id"  gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Name    string `json:"name"`
	Lang    string `json:"lang"`
	Weight  int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	Author  string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	Default int    `json:"default"  gorm:"column:default;type:int(11);default:1"`
	Status  int    `json:"status"  gorm:"column:status;type:int(11);default:1"`
	CommonField
}

func (c *Lang) TableName() string {
	return "sl_lang"
}

type LangInfo struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Weight      int    `json:"weight"`
	Default     int    `json:"default"`
	Status      int    `json:"status"`
	Author      string `json:"author"`
	CreateTime  string `json:"create_time"`
	UpdatedTime string `json:"updated_time"`
	StatusName  string `json:"status_name"`
	DefaultName string `json:"default_name"`
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
	Id      int    `json:"id" form:"id" binding:"required"`
	Name    string `json:"name" form:"name" binding:"required"`
	Lang    string `json:"lang" form:"lang" binding:"required"`
	Weight  int    `json:"weight" form:"weight,default=0"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Status  int    `json:"status" form:"status,default=1"`
	Default int    `json:"default" form:"default,default=1"`
}

type LangCreateReq struct {
	Name    string `json:"name" form:"name" binding:"required"`
	Lang    string `json:"lang" form:"lang" binding:"required"`
	Weight  int    `json:"weight" form:"weight,default=0"`
	Author  string `json:"author" form:"author,default=nicholas"`
	Status  int    `json:"status" form:"status,default=1"`
	Default int    `json:"default" form:"default,default=1"`
}

type LangDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type LangAssignList struct {
	Info       interface{}
	LangConfig interface{}
}
