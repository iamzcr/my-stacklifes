package models

type Directory struct {
	Id     int    `json:"id"`
	Name   string `json:"name"`
	Cid    int    `json:"cid"`
	Mark   string `json:"mark"`
	Type   int    `json:"type"`
	Author string `json:"author"`
	Weight int    `json:"weight"`
	Status int    `json:"status"`
	CommonField
}

func (c *Directory) TableName() string {
	return "sl_directory"
}

type DirectoryMine struct {
	Id   int    `json:"id"`
	Mark string `json:"mark"`
	Cid  string `json:"cid"`
	Name string `json:"name"`
}

type DirectoryListReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type DirectoryListRes struct {
	Total int64       `json:"total"`
	Draw  int64       `json:"draw"`
	List  []Directory `json:"list"`
}

type DirectoryNoPageReq struct {
	Cid    int `json:"cid" form:"cid"`
	Status int `json:"status" form:"status,default=1" `
}

type DirectoryNoPageListRes struct {
	List []DirectoryMine `json:"list"`
}

type DirectoryUpdateReq struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name" binding:"required"`
	Cid    int    `json:"cid" form:"cid" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type DirectoryCreateReq struct {
	Name   string `json:"name" form:"name" binding:"required"`
	Cid    int    `json:"cid" form:"cid" binding:"required"`
	Mark   string `json:"mark" form:"mark"`
	Type   int    `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight int    `json:"weight" form:"weight" binding:"required"`
	Status int    `json:"status" form:"status"`
}

type DirectoryDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
