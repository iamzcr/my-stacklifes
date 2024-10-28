package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/pkg/constant"
)

type CommonService struct {
}

func NewCommonService() *CommonService {
	return &CommonService{}
}

func (s *CommonService) GetStatusMap(ctx *gin.Context) (statusMap map[int]string) {
	statusMap = map[int]string{
		constant.StatusTrue:  constant.StatusTrueName,
		constant.StatusFalse: constant.StatusFalseName,
	}
	return
}
