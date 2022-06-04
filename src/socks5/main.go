package main

import (
	"flag"
	"log"

	"github.com/armon/go-socks5"
)

func main() {
	type Options struct {
		Address string
		Port    string
	}
	var options Options
	flag.StringVar(&options.Address, "a", "[::]", "Address to bind")
	flag.StringVar(&options.Port, "p", "10808", "Port to listen")
	flag.Parse()
	if server, err := socks5.New(&socks5.Config{}); err != nil {
		panic(err)
	} else {
		log.Printf("%s", "Listening on "+options.Address+":"+options.Port)
		log.Print(server.ListenAndServe("tcp", options.Address+":"+options.Port))
	}
}
