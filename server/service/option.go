package service

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"my-stacklifes/models"
)

type OptionService struct {
	MapOption *models.OptionFilter
}

func NewOptionService() *OptionService {
	return &OptionService{
		MapOption: &models.OptionFilter{},
	}
}

func (s *OptionService) GetFilterList(ctx *gin.Context, req models.FilterListReq) (interface{}, error) {
	fmt.Println(req.Filter)
	return nil, nil
}
