package mysql

import (
	"database/sql"
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
	"log"
	"os"
)

var MysqlClient *gorm.DB

func InitMysql(cfg *MysqlConfig) (err error) {
	connectMsg := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=%t&loc=%s",
		cfg.Username,
		cfg.Password,
		cfg.Host,
		cfg.Port,
		cfg.DbName,
		true,
		"Local")
	mysqlDB, err := sql.Open("mysql", connectMsg)
	if err != nil {
		log.Panicf("open mysql failed. database name: %s, err: %+v", cfg.DbName, err)
	}
	mysqlDB.SetMaxOpenConns(cfg.MaxOpenConn)
	mysqlDB.SetMaxIdleConns(cfg.MaxIdleConn)
	mysqlDB.SetConnMaxLifetime(cfg.MaxConnLifeTime)

	//禁止外键约束, 生产环境不建议使用外键约束
	var ormConfig = &gorm.Config{DisableForeignKeyConstraintWhenMigrating: true}
	// 打印所有SQL
	if cfg.OrmConfig.ShowLog {
		ormConfig.Logger = logger.Default.LogMode(logger.Info)
	} else {
		ormConfig.Logger = logger.Default.LogMode(logger.Silent)
	}
	// 只打印慢查询
	if cfg.OrmConfig.ShowSqlLog > 0 {
		ormConfig.Logger = logger.New(
			//将标准输出作为Writer
			log.New(os.Stdout, "\r\n", log.LstdFlags),
			logger.Config{
				//设定慢查询时间阈值
				SlowThreshold: cfg.OrmConfig.ShowSqlLog,
				Colorful:      true,
				//设置日志级别，只有指定级别以上会输出慢查询日志
				LogLevel: logger.Warn,
			},
		)
	}
	ormConfig.NamingStrategy = schema.NamingStrategy{
		//表名禁止自动复数
		SingularTable: true,
	}

	MysqlClient, err = gorm.Open(mysql.New(mysql.Config{Conn: mysqlDB}), ormConfig)
	if err != nil {
		log.Panicf("database connection failed. database name: %s, err: %+v", cfg.DbName, err)
	}
	MysqlClient.Set("gorm:table_options", "CHARSET=utf8mb4")
	return
}

type DbClient struct {
	MysqlClient *gorm.DB
}

func GetMysqlClient() *gorm.DB {
	return MysqlClient
}

func NewDbClient() *DbClient {
	return &DbClient{MysqlClient: GetMysqlClient()}
}
