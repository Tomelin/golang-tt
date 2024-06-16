package main

import (
	"flag"
	"fmt"
)

func main() {
	useMessage := flag.String("message", "Bem vindo ao treinamento de Docker da TargetTrust", "display message output")
	useUser := flag.String("user", "Fulano", "display user output")
	flag.Parse()

if *useUser == "Fulano"{
	fmt.Println(fmt.Sprintf("%s!", *useMessage))
	return
}
	fmt.Println(fmt.Sprintf("%s, %s!", *useUser, *useMessage))
}