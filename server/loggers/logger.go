package loggers

import (
	"fmt"
	"go.uber.org/zap"
)

var log *zap.Logger

type Fields map[string]interface{}

type Logger interface {
	Info(args ...interface{})
	Warn(args ...interface{})
	Error(args ...interface{})
}

func InitLogger(cfg *LoggerConfig) *zap.Logger {
	var err error
	log, err = newZapLogger(cfg)
	if err != nil {
		_ = fmt.Errorf("init newZapLogger err: %v", err)
	}
	return log
}

func GetLogger() *zap.Logger {
	return log
}

func Info(msg string, fields ...zap.Field) {
	log.Info(msg, fields...)
}

func Warn(msg string, fields ...zap.Field) {
	log.Warn(msg, fields...)
}

func Error(msg string, fields ...zap.Field) {
	log.Error(msg, fields...)
}
