package conf

import (
	"fmt"
	"github.com/joho/godotenv"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"time"
)

type CommonConfig struct {
	Name               string `yaml:"name"`
	FrontendListenPort string `yaml:"frontend_listen_port"`
	AdminListenPort    string `yaml:"admin_listen_port"`
	LoginJwtSecret     string `yaml:"login_jwt_secret"`
}
type RedisConfig struct {
	Host     string `yaml:"host"`
	Port     int    `yaml:"port"`
	Password string `yaml:"pwd"`
	DB       int    `yaml:"db"`
}

type MySQLConfig struct {
	Host            string        `yaml:"host"`
	Port            int           `yaml:"port"`
	Username        string        `yaml:"username"`
	Password        string        `yaml:"pwd"`
	DbName          string        `yaml:"dbname"`
	MaxOpenConn     int           `yaml:"max_open_conn"`
	MaxIdleConn     int           `yaml:"max_idle_conn"`
	MaxConnLifeTime time.Duration `yaml:"max_conn_life_time"`
}
type OrmConfig struct {
	ShowLog    bool          `yaml:"show_log"`
	ShowSqlLog time.Duration `yaml:"slow_sql_log"`
}
type Config struct {
	Redis  RedisConfig  `yaml:"redis"`
	MySQL  MySQLConfig  `yaml:"mysql"`
	Orm    OrmConfig    `yaml:"orm"`
	Common CommonConfig `yaml:"app"`
}

var AppConfig = &Config{}

func InitConfig() (err error) {

	// 获取当前 main.go 文件的目录路径
	dir, err := filepath.Abs(filepath.Dir("."))
	if err != nil {
		log.Fatal(err)
	}

	//env方式加载
	err = godotenv.Load(filepath.Join(dir, "..", "..", ".env"))
	if err != nil {
		fmt.Println("无法加载.env文件:", err)
		// 处理错误逻辑
	}
	envmysql := os.Getenv("MYSQL_HOST")
	fmt.Println(envmysql)
	// 打开文件
	file, err := os.Open(filepath.Join(dir, "..", "..", "conf", "conf.yaml"))
	if err != nil {
		log.Fatalf("无法打开文件：%v", err)
	}
	defer func(file *os.File) {
		err := file.Close()
		if err != nil {
			log.Fatalf("close：%v", err)
		}
	}(file) // 在函数结束时关闭文件

	// 读取文件内容
	yamlFile, err := ioutil.ReadAll(file)
	if err != nil {
		log.Fatalf("无法读取文件：%v", err)
	}

	err = yaml.Unmarshal(yamlFile, &AppConfig)
	if err != nil {
		log.Fatalf("无法解析YAML文件：%v", err)
	}
	return
}
