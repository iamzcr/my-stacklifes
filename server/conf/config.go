package conf

import (
	"fmt"
	"github.com/joho/godotenv"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"log"
	"my-stacklifes/database/mysql"
	"my-stacklifes/database/redis"
	"my-stacklifes/loggers"
	"os"
	"path/filepath"
	"time"
)

type CommonConfig struct {
	Name               string        `yaml:"name"`
	FrontendListenPort string        `yaml:"frontend_listen_port"`
	AdminListenPort    string        `yaml:"admin_listen_port"`
	LoginJwtSecret     string        `yaml:"login_jwt_secret"`
	LoginJwtExpiration time.Duration `yaml:"login_jwt_expiration"`
}

type Config struct {
	Redis   redis.RedisConfig    `yaml:"redis"`
	MySQL   mysql.MysqlConfig    `yaml:"mysql"`
	Orm     mysql.OrmConfig      `yaml:"orm"`
	Loggers loggers.LoggerConfig `yaml:"loggers"`
	Common  CommonConfig         `yaml:"app"`
}

var AppConfig = &Config{}

func InitConfig() (AppConfig *Config, err error) {

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

	// Get values from .env file
	appFrontendListenPort := os.Getenv("APP_FRONTEND_LISTEN_PORT")
	mysqlPassword := os.Getenv("MYSQL_PASSWORD")
	TEST := os.Getenv("TEST")

	fmt.Println("DB_HOST:", appFrontendListenPort)
	fmt.Println("DB_PORT:", mysqlPassword)
	fmt.Println("TEST:", TEST)
	// 打开文件
	file, err := os.Open(filepath.Join(dir, "..", "..", "conf", "conf.yaml"))
	if err != nil {
		log.Fatalf("无法加载conf.yaml文件：%v", err)
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
