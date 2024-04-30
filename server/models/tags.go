package models

type Tags struct {
	Id     int    `json:"id" form:"id"`
	Name   string `json:"name" form:"name"`
	Mark   string `json:"mark" form:"mark"`
	Type   string `json:"type" form:"type"`
	Author string `json:"author" form:"author"`
	Weight string `json:"weight" form:"weight"`
	Status string `json:"status" form:"status"`
}

type TagsInfo struct {
	Tags
	CommonField
}

func (c *Tags) TableName() string {
	return "sl_tags"
}

type TagsReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type TagsListRes struct {
	Total int64      `json:"total"`
	List  []Category `json:"list"`
}
