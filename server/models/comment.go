package models

type Comment struct {
	Id      int    `json:"id" `
	Name    string `json:"name" `
	Ip      string `json:"ip" `
	Aid     int    `json:"aid"`
	Refer   string `json:"refer" `
	Email   string `json:"email"`
	Url     string `json:"url"`
	IsReply int8   `json:"is_reply" `
	Content string `json:"content" `
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
