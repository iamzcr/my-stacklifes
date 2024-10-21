package models

type CommonField struct {
	CreateTime  int64 `gorm:"column:create_time;type:timestamp" json:"create_time"`
	UpdatedTime int64 `gorm:"column:update_time;type:timestamp" json:"updated_time"`
}

type PageInfo struct {
	Page     int   `form:"page" json:"page"`
	PageSize int   `form:"page_size" json:"page_size"`
	Total    int64 `form:"total" json:"total"`
}

func (p *PageInfo) GetPageInfo() (limit, offset int) {
	if p.Page < 1 {
		p.Page = 1
	}
	limit = p.PageSize
	if p.PageSize < 1 {
		limit = 5
	}
	offset = (p.Page - 1) * limit
	return
}
