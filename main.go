package main

import (
	"flag"
	"fmt"
	"io"
	"os"
)

func main() {
	var str string
	flag.StringVar(&str, "c", "default", "指定配置文件文件路径")
	flag.Parse()
	if str == "default" {
		fmt.Println("未读取到配置文件路径")
		return
	}
	fmt.Println("读取到配置文件路径: ", str)
	open, err := os.Open(str)
	if err != nil {
		fmt.Println("打开配置文件失败: ", err)
		return
	}
	all, err := io.ReadAll(open)
	if err != nil {
		fmt.Println("读取配置文件失败: ", err)
		return
	}
	fmt.Println("读取到配置文件,内容为: ", string(all))
}
