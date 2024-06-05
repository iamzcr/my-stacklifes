package service

import (
	"github.com/gin-gonic/gin"
	"my-stacklifes/database/mysql"
	"my-stacklifes/models"
)

type NavService struct {
	dbClient *mysql.DbClient
}

func NewNavService() *NavService {
	return &NavService{
		dbClient: mysql.NewDbClient(),
	}
}
func (s *NavService) GetFrontendNav(ctx *gin.Context) (interface{}, error) {
	var (
		categorys []models.CategoryMine
		headerNav models.NavHeader
		NavHeader []models.NavHeader
	)
	db := s.dbClient.MysqlClient
	err := db.Model(&models.Category{}).Where("status = ?", 1).Select("id,mark,name").
		Order("weight ASC").Find(&categorys).Error

	if err != nil {
		return nil, err
	}
	for _, category := range categorys {
		headerNav = models.NavHeader{
			Path: category.Mark,
			Name: category.Name,
			Icon: category.Mark,
		}
		NavHeader = append(NavHeader, headerNav)
	}
	return models.NavListRes{
		NavHeader: NavHeader,
	}, nil
}
