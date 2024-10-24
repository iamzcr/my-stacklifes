package models

type Message struct {
	Id      int    `json:"id" form:"id"`
	Name    string `json:"name" form:"name"`
	Ip      string `json:"ip" form:"ip"`
	Email   string `json:"email" form:"email"`
	Url     string `json:"url" form:"url"`
	IsReply int8   `json:"is_reply" form:"is_reply"`
	Content string `json:"content" form:"content"`
	CommonField
}

func (c *Message) TableName() string {
	return "sl_message"
}

type MessageInfo struct {
	Id         int    `json:"id"`
	Name       string `json:"name"`
	Ip         string `json:"ip"`
	Email      string `json:"email"`
	Url        string `json:"url"`
	IsReply    int8   `json:"is_reply"`
	Content    string `json:"content"`
	CreateTime string `json:"create_time"`
}

type MessageReq struct {
	PageInfo
	Name string `json:"name" form:"name"`
}
type MessageListRes struct {
	Total int64         `json:"total"`
	List  []MessageInfo `json:"list"`
}

type MsgCreateReq struct {
	Name    string `json:"name" form:"name" binding:"required"`
	Email   string `json:"email" form:"email" binding:"required"`
	Content string `json:"content" form:"content" binding:"required"`
	Url     string `json:"url" form:"url"`
}

type MessageDelReq struct {
	Id int `json:"id" form:"id" binding:"required"`
}
