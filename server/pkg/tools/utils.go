package tools

import (
	"bytes"
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"github.com/mozillazg/go-pinyin"
	"github.com/yuin/goldmark"
	highlighting "github.com/yuin/goldmark-highlighting/v2"
	"github.com/yuin/goldmark/extension"
	"github.com/yuin/goldmark/parser"
	"github.com/yuin/goldmark/renderer/html"
	"math/rand"
	"regexp"
	"strings"
	"time"
)

func Md5(str string) string {
	hash := md5.New()
	hash.Write([]byte(str))
	hashedBytes := hash.Sum(nil)
	md5Str := hex.EncodeToString(hashedBytes)
	return md5Str
}

func GenPassword(salt, password string) (pwd string) {
	pwd = Md5(fmt.Sprintf("%s%s", salt, password))
	return
}

func CreateSalt() (slat string) {
	randStr := createRandStr()
	slat = Md5(randStr)
	return
}

func createRandInt() (randInt int) {
	rand.Seed(time.Now().UnixNano())
	randInt = rand.Intn(1000)
	return
}

func createRandStr() (randString string) {
	rand.Seed(time.Now().UnixNano())
	strLength := 8
	randStr := make([]byte, strLength)
	for i := 0; i < strLength; i++ {
		randStr[i] = Charset[rand.Intn(len(Charset))]
	}
	randString = string(randStr)
	return
}

func SetExpiration() (timestamp int64) {
	now := time.Now()
	oneYearLater := now.AddDate(1, 0, 0)
	timestamp = oneYearLater.Unix()
	return
}

func ConvertMarkdownToHTML(markdownContent []byte) (string, error) {
	var buf bytes.Buffer
	md := goldmark.New(
		goldmark.WithExtensions(extension.GFM, extension.DefinitionList, highlighting.NewHighlighting(
			highlighting.WithStyle("dracula"),
		)),
		goldmark.WithParserOptions(parser.WithAutoHeadingID()),
		goldmark.WithRendererOptions(html.WithHardWraps()),
	)
	if err := md.Convert(markdownContent, &buf); err != nil {
		return "", err
	}
	return buf.String(), nil
}

func UnixToTime(timestamp int64) string {
	t := time.Unix(timestamp, 0)
	return t.Format("2006-01-02 15:04:05")
}

// 中文转拼音
func ConvertToPinyin(text string) string {
	a := pinyin.NewArgs()
	a.Style = pinyin.Normal
	// 正则表达式匹配中文、字母和数字
	re := regexp.MustCompile(`[^\x00-\x7F]+|[a-zA-Z]+|\d+`)
	matches := re.FindAllString(text, -1)
	var result []string
	for _, match := range matches {
		if strings.IndexAny(match, "0123456789") != -1 || strings.IndexAny(match, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != -1 {
			result = append(result, match) // 保留字母和数字部分
		} else {
			py := pinyin.Pinyin(match, a)
			if len(py) > 1 {
				var pinyinStr []string
				for _, p := range py {
					pinyinStr = append(pinyinStr, strings.Join(p, ""))
				}
				result = append(result, strings.Join(pinyinStr, "")) // 添加拼音
			} else {
				result = append(result, strings.Join(py[0], "")) // 添加完整拼音
			}
		}
	}

	return strings.Join(result, "")
}
