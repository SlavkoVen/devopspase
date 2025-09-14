APP=kbot
REGISTRY=ghcr.io/slavkoven
VERSION=v1.0.0-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint ./...

test:
	go test -v ./...

get:
	go get ./...

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X github.com/slavkoven/kbot/cmd.appVersion=$(VERSION)"

image:
	docker buildx build --platform=${TARGETOS}/${TARGETARCH} \
		-t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH} .

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

clean:
	rm -rf kbot
