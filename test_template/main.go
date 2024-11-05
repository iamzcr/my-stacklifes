package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func visit(path string, info os.FileInfo, err error) error {
	if err != nil {
		return err
	}

	// Skip printing the .idea directory
	if info.IsDir() && (info.Name() == "." || info.Name() == ".idea") {
		return filepath.SkipDir
	}
	depth := strings.Count(path, string(os.PathSeparator)) - strings.Count(".", string(os.PathSeparator))
	indent := strings.Repeat("  ", depth)
	if depth > 0 {
		indent += "--"
	}
	fmt.Printf("%s %s\n", indent, path)
	return nil
}

func main() {
	root := "."
	err := filepath.Walk(root, visit)
	if err != nil {
		fmt.Println(err)
	}
}
