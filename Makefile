PPROF_TIME = 60
DISCORD_WEBHOOK_URL = https://discordapp.com/api/webhooks/843376296494759936/JonlLt7GF29nU3xreu7wbttm1xbuN6Rixsu8vL6qsllo1EFyPbCYitphw6J0HIg0f4yV
all: build

.PHONY: clean
clean:
	rm -rf torb

deps:
	gb vendor restore

.PHONY: build
build:
	go build ./src/torb

.PHONY: restart
restart:
	sudo systemctl restart torb.go

.PHONY: pprof
##		GO111MODULE=on go run api.go main.go
pprof:
		go tool pprof -png -output pprof.png http://localhost:6060/debug/pprof/profile?seconds=$(PPROF_TIME)
		curl -X POST -F img=@pprof.png $(DISCORD_WEBHOOK_URL) 