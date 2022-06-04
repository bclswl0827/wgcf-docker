.PHONY: build

build:
	env GOOS=linux GOARCH=arm GOARM=7 go build -ldflags="-s -w" -o ../../bin/armv7l/socks5
	upx --lzma ../../bin/armv7l/socks5
	env GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -o ../../bin/aarch64/socks5
	upx --lzma ../../bin/aarch64/socks5
	env GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o ../../bin/x86_64/socks5
	upx --lzma ../../bin/x86_64/socks5
	env GOOS=linux GOARCH=386 go build -ldflags="-s -w" -o ../../bin/i386/socks5
	upx --lzma ../../bin/i386/socks5
 
