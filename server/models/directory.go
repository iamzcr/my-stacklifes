package models

type Directory struct {
	Id     int    `json:"id" gorm:"column:id;type:int(11);primary_key;AUTO_INCREMENT"`
	Name   string `json:"name"`
	Cid    int    `json:"cid"`
	Mark   string `json:"mark"`
	Type   int    `json:"type" gorm:"column:type;type:int(11);default:1"`
	Author string `json:"author" gorm:"column:author;type:string;default:nicholas"`
	Parent int    `json:"parent" gorm:"column:parent;type:int(11);default:0"`
	Weight int    `json:"weight" gorm:"column:weight;type:int(11);default:0"`
	Status int    `json:"status"  gorm:"column:status;type:int(11);default:1"`
	CommonField
}

func (c *Directory) TableName() string {
	return "sl_directory"
}

type DirectoryInfo struct {
	Id           int    `json:"id"`
	Name         string `json:"name"`
	Mark         string `json:"mark"`
	Cid          string `json:"cid"`
	CategoryName string `json:"category_name"`
	Type         int    `json:"type"`
	Author       string `json:"author"`
	Weight       int    `json:"weight"`
	Status       int    `json:"status"`
	Parent       int    `json:"parent"`
	ParentName   string `json:"parent_name"`
	CreateTime   string `json:"create_time"`
	UpdatedTime  string `json:"updated_time"`
	StatusName   string `json:"status_name"`
	TypeName     string `json:"type_name"`
}

type DirectoryListRes struct {
	Total int64           `json:"total"`
	List  []DirectoryInfo `json:"list"`
}

type DirectoryListReq struct {
	PageInfo
	Name   string `json:"name" form:"name"`
	Cid    int    `json:"cid" form:"cid"`
	Status int    `json:"status" form:"status,default=1" `
}

type DirectoryUpdateReq struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name" binding:"required"`
	Cid    int    `json:"cid" form:"cid" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Parent int    `json:"parent" form:"parent"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type DirectoryCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Cid    int    `json:"cid" form:"cid" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Parent int    `json:"parent" form:"parent"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type DirectoryDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}

type DirectoryMine struct {
	Id   int    `json:"id"`
	Mark string `json:"mark"`
	Cid  string `json:"cid"`
	Name string `json:"name"`
}

type DirectoryAssignList struct {
	Info         interface{}
	CategoryList interface{}
}
