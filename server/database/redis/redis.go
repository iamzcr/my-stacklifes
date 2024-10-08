package redis

import (
	"github.com/go-redis/redis"
	"log"
)

var RedisClient *redis.Client

func InitRedis(cfg *RedisConfig) (err error) {
	RedisClient = redis.NewClient(&redis.Options{
		Addr:     cfg.Host,     // Redis服务器地址和端口
		Password: cfg.Password, // Redis密码，如果没有密码则留空
		DB:       cfg.DB,       // 使用默认的数据库
	})
	// ping 连接是否成功
	_, err = RedisClient.Ping().Result()
	if err != nil {
		log.Fatalf("redis.Setup, fail to client ping error : %v", err)
	}
	return
}

type RdClient struct {
	RedisClient *redis.Client
}

func GetRdClient() *redis.Client {
	return RedisClient
}

func NewRdClient() *RdClient {
	return &RdClient{RedisClient: GetRdClient()}
}
