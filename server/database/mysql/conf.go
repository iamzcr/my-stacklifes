package mysql

import "time"

type Config struct {
	Host            string        `yaml:"host"`
	Port            int           `yaml:"port"`
	Username        string        `yaml:"username"`
	Password        string        `yaml:"pwd"`
	DbName          string        `yaml:"dbname"`
	MaxOpenConn     int           `yaml:"max_open_conn"`
	MaxIdleConn     int           `yaml:"max_idle_conn"`
	MaxConnLifeTime time.Duration `yaml:"max_conn_life_time"`
}
