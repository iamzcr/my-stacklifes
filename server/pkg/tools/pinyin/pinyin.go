package pinyin

import (
	"github.com/mozillazg/go-pinyin"
	"strings"
)

func Pinyin(hans string) string {
	py := pinyin.NewArgs()
	py.Style = pinyin.FirstLetter // 设置拼音风格为首字母
	py.Heteronym = false          // 不启用多音字模式
	py.Separator = ""             // 不设置分隔符

	abbr := pinyin.LazyPinyin(hans, py)

	firstLetterLower := strings.ToLower(abbr[0])
	return firstLetterLower
}
