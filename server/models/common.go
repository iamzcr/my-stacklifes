package models

type CommonField struct {
	CreateTime  int64 `gorm:"column:create_time;type:timestamp" json:"create_time"`
	UpdatedTime int64 `gorm:"column:update_time;type:timestamp" json:"updated_time"`
}

type PageInfo struct {
	Start  int   `form:"start" json:"start"`
	Length int   `form:"length" json:"length"`
	Total  int64 `form:"total" json:"total"`
}

func (p *PageInfo) GetPageInfo() (limit, offset int) {
	limit = p.Length
	offset = p.Start
	return
}
