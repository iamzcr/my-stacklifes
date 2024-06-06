package tools

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
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