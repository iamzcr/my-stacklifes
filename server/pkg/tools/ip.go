package tools

import (
	"fmt"
	"net"
	"net/http"
	"sync"
)

var (
	once     sync.Once
	clientIP = "127.0.0.1"
)

func GetClientIP(r *http.Request) (string, error) {
	ip, _, err := net.SplitHostPort(r.RemoteAddr)
	if err != nil {
		return "", fmt.Errorf("获取客户端IP失败：%v", err)
	}

	userIP := net.ParseIP(ip)
	if userIP == nil {
		return "", fmt.Errorf("无效的客户端IP：%s", ip)
	}

	return userIP.String(), nil
}
