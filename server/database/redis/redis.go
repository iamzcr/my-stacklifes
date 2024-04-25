package redis

import (
	"github.com/go-redis/redis"
	"log"
	"my-stacklifes/conf"
)

var RedisClient *redis.Client

func InitRedis() (err error) {
	RedisClient = redis.NewClient(&redis.Options{
		Addr:     conf.AppConfig.Redis.Host,     // Redis服务器地址和端口
		Password: conf.AppConfig.Redis.Password, // Redis密码，如果没有密码则留空
		DB:       conf.AppConfig.Redis.DB,       // 使用默认的数据库
	})
	// ping 连接是否成功
	_, err = RedisClient.Ping().Result()
	if err != nil {
		log.Fatalf("redis.Setup, fail to client ping error : %v", err)
	}
	return
}
