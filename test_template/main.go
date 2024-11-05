package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func visit(rootPath string) filepath.WalkFunc {
	return func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		// Skip printing the .idea directory
		if info.IsDir() && info.Name() == ".idea" {
			return filepath.SkipDir
		}

		// Get the relative path
		relPath, err := filepath.Rel(rootPath, path)
		if err != nil {
			return err
		}

		if relPath == "." {
			return nil
		}

		depth := strings.Count(relPath, string(filepath.Separator)) - 1
		indent := strings.Repeat("  ", depth)
		if depth > 0 {
			indent += "---"
		}
		fmt.Printf("%s %s\n", indent, relPath)
		return nil
	}
}

func main() {
	dir := filepath.Dir(os.Args[0]) // Get the directory of the running executable
	root := filepath.Join(dir, "test_template")
	err := filepath.Walk(root, visit(root))
	if err != nil {
		fmt.Println(err)
	}
}
