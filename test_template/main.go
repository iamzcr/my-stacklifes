/*
一个将当前路径下文件树打印的程序, 忽略 . 开头文件
*/

package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

func getPath(path string, indent string) {
	files, err := ioutil.ReadDir(path)
	if err != nil {
		fmt.Println("read file path error", err)
		return
	}
	// 忽略以 . 开头的文件
	for i := 0; i < len(files); i++ {
		if files[i].Name()[0] == '.' {
			files = append(files[:i], files[i+1:]...)
		}
	}
	dirs := make([]string, 0)

	// 先打印文件
	for _, fi := range files {
		if !fi.IsDir() {
			dirs = append(dirs, fi.Name())
		}
	}

	lenFile := len(dirs)

	// 再打印文件夹
	for _, fi := range files {
		if fi.IsDir() {
			dirs = append(dirs, fi.Name())
		}
	}

	// 最后一个文件的分支用 └── 表示, 更美观
	for i := 0; i < len(dirs); i++ {
		if i == len(dirs)-1 {
			fmt.Println(indent + "└── " + dirs[i])
			if i >= lenFile {
				getPath(path+"\\"+dirs[i], indent+"   ")
			}
		} else {
			fmt.Println(indent + "├── " + dirs[i])
			if i >= lenFile {
				getPath(path+"\\"+dirs[i], indent+"│  ")
			}
		}

	}
}

func main() {
	exPath, err := os.Getwd() // 获取程序执行的当前路径
	if err != nil {
		fmt.Println("路径错误")
	}
	dirName := filepath.Base(exPath)
	fmt.Println(dirName)
	getPath(exPath, "")
}
