package tools

import (
	"bytes"
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"github.com/yuin/goldmark"
	highlighting "github.com/yuin/goldmark-highlighting/v2"
	"github.com/yuin/goldmark/extension"
	"github.com/yuin/goldmark/parser"
	"github.com/yuin/goldmark/renderer/html"
	"math/rand"
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
