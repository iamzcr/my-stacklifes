package mysql

import "time"

type OrmConfig struct {
	ShowLog    bool          `yaml:"show_log"`
	ShowSqlLog time.Duration `yaml:"slow_sql_log"`
}

type MysqlConfig struct {
	Host            string        `yaml:"host"`
	Port            int           `yaml:"port"`
	Username        string        `yaml:"username"`
	Password        string        `yaml:"pwd"`
	DbName          string        `yaml:"dbname"`
	MaxOpenConn     int           `yaml:"max_open_conn"`
	MaxIdleConn     int           `yaml:"max_idle_conn"`
	MaxConnLifeTime time.Duration `yaml:"max_conn_life_time"`
	OrmConfig       OrmConfig
}
