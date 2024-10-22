package models

type Comment struct {
	Id      int    `json:"id"  form:"id"`
	Aid     int    `json:"aid"  form:"aid"`
	Referer string `json:"referer"  form:"referer" `
	Name    string `json:"name" form:"name"`
	Ip      string `json:"ip" form:"ip"`
	Email   string `json:"email" form:"email"`
	Url     string `json:"url" form:"url"`
	IsReply int8   `json:"is_reply" form:"is_reply"`
	Content string `json:"content" form:"content"`

	CommonField
}

func (c *Comment) TableName() string {
	return "sl_comment"
}

type CommentReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}

type CommentListRes struct {
	Total int64     `json:"total"`
	List  []Comment `json:"list"`
}

type CommentCreateReq struct {
	Name    string `json:"name" form:"name" binding:"required"`
	Email   string `json:"email" form:"email" binding:"required"`
	Content string `json:"content" form:"content" binding:"required"`
	Url     string `json:"url" form:"url"`
	Aid     int    `json:"aid" form:"aid"`
}

type CommentDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
