package models

type FilterListReq struct {
	Filter []string `form:"filter[]"`
}

type OptionFilter struct {
	MapFilter map[string]Filter
}
type Filter struct {
	Key   string
	Value string
	Name  string
}
