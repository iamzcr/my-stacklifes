package loggers

// Config  log config
type LoggerConfig struct {
	Development       bool   `yaml:"development"`
	DisableCaller     bool   `yaml:"disable_caller"`
	DisableStacktrace bool   `yaml:"disable_stacktrace"`
	Encoding          string `yaml:"encoding"`
	Level             string `yaml:"level"`
	Name              string `yaml:"name"`
	Writers           string `yaml:"writers"`
	LoggerFile        string `yaml:"logger_file"`
	LoggerWarnFile    string `yaml:"logger_warn_file"`
	LoggerErrorFile   string `yaml:"logger_error_file"`
	LogRollingPolicy  string `yaml:"log_rolling_policy"`
	LogBackupCount    uint   `yaml:"log_backup_count"`
}
