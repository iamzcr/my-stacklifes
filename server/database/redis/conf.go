package redis

type Config struct {
	Host     string `yaml:"host"`
	Port     int    `yaml:"port"`
	Password string `yaml:"pwd"`
	DB       int    `yaml:"db"`
}
