package models

type NavListRes struct {
	NavHeader []NavHeader `json:"nav_header"`
}

type NavHeader struct {
	Path string `json:"path"`
	Name string `json:"name"`
	Icon string `json:"icon"`
}
