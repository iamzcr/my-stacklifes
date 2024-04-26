package models

import (
	"time"
)

type CommonField struct {
	CreateTime  time.Time `json:"create_time"`
	UpdatedTime time.Time `json:"update_time"`
}
