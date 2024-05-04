package models

type Comment struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Ip      string `json:"ip" form:"ip"`
	Aid     string `json:"aid" form:"aid"`
	Refer   string `json:"refer" form:"refer"`
	Email   string `json:"email" form:"email"`
	Url     string `json:"url" form:"url"`
	IsReply int8   `json:"is_reply" form:"is_reply"`
	Content string `json:"content" form:"content"`
}

type CommentInfo struct {
	Comment
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
