## 说明

本logger主要是对zap库的封装，便于使用。

##### 日志功能

- 将日志信息记录到日志文件里
- 日志切割-能够根据日志文件大小或时间间隔进行切割
- 支持不同的日志级别(eg：info,debug,warn,error,fatal)
- 支持按日志级别分类输出到不同日志文件
- 能够打印基本信息，如调用文件/函数名和行号，日志时间，IP等

##### 使用方法

```go
log.Info("user_id is 1")
log.Warn("user is not exist")
log.Error("params error")
log.Warnf("params is empty")
...
```
