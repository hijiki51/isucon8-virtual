all: build

.PHONY: clean
clean:
	rm -rf torb

deps:
	gb vendor restore

.PHONY: build
build:
	GOPATH=`pwd`:`pwd`/vendor go build -v torb

.PHONY: pprof
##		GO111MODULE=on go run api.go main.go
pprof:
		go tool pprof -png -output pprof.png http://localhost:6060/debug/pprof/profile?seconds=60
		curl -X POST -F img=@pprof.png $(DISCORD_WEBHOOK_URL) 