package jwt

import (
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"my-stacklifes/conf"
	"my-stacklifes/database/redis"
)

func CreateToken(username string) (string, error) {
	// 创建一个新的 JWT 令牌
	token := jwt.New(jwt.SigningMethodHS256)
	// 设置令牌的声明（payload）
	claims := token.Claims.(jwt.MapClaims)
	claims["username"] = username
	// 使用密钥对令牌进行签名
	authentication, err := token.SignedString([]byte(conf.AppConfig.Common.LoginJwtSecret))
	if err != nil {
		return "", err
	}
	// 将令牌存储到 Redis 中，并设置过期时间
	err = redis.RedisClient.Set("login:"+username, authentication, conf.AppConfig.Common.LoginJwtExpiration).Err()
	if err != nil {
		return "", err
	}
	return authentication, nil
}

func verifyToken(authentication string) (*jwt.Token, error) {
	// 解析和验证令牌
	token, err := jwt.Parse(authentication, func(token *jwt.Token) (interface{}, error) {
		// 验证签名密钥
		return []byte(conf.AppConfig.Common.LoginJwtSecret), nil
	})
	if err != nil {
		return nil, err
	}
	// 检查令牌是否有效
	if _, ok := token.Claims.(jwt.Claims); !ok || !token.Valid {
		return nil, fmt.Errorf("invalid token")
	}
	return token, nil
}

// 从 Redis 中删除令牌
func deleteToken(adminID string) error {
	return redis.RedisClient.Del(adminID).Err()
}
