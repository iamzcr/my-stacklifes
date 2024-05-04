package tools

import (
	"regexp"
)

var emailRegexp = `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`
var urlRegexp = `^(http|https)://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(?:/[^/]*)*$`

func ValidEmail(email string) bool {
	re := regexp.MustCompile(emailRegexp)
	isValid := re.MatchString(email)
	return isValid
}

func ValidUrl(url string) bool {
	re := regexp.MustCompile(urlRegexp)
	isValid := re.MatchString(url)
	return isValid
}
