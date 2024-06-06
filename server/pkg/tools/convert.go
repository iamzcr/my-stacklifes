package tools

import (
	"my-stacklifes/pkg/app"
)

func GetStatusDisplay(status int) (display string) {
	display, ok := app.StatusMatch[status]
	if !ok {
		display = "未知状态"
	}
	return
}
