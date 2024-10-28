package service

import "my-stacklifes/pkg/constant"

type CommonService struct {
}

func NewCommonService() *CommonService {
	return &CommonService{}
}

func (s *CommonService) GetStatusMap() (statusMap map[int]string) {
	statusMap = map[int]string{
		constant.StatusTrue:  constant.StatusTrueName,
		constant.StatusFalse: constant.StatusFalseName,
	}
	return
}
