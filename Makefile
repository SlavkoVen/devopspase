APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=slavkoven
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X github.com/slavkoven/kbot/cmd.appVersion=$(VERSION)"

image:
	docker buildx build --platform=linux/${TARGETARCH} -t docker.io/${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} .

push:
	docker push docker.io/${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot
