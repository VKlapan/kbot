APP=$(shell basename $(shell git remote get-url origin))
REGESTRY=europe-central2-docker.pkg.dev/devopskubernetes40-demo/course
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
GOOS ?=linux
GOARCH ?=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	echo `GOOS=${GOOS} GOARCH=${GOARCH}`
	CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build -v -o kbot -ldflags "-X="github.com/vit-um/kbot/cmd.appVersion=${VERSION}


image:
	docker build --build-arg GOOS=${GOOS} --build-arg GOARCH=${GOARCH} . -t ${REGESTRY}/${APP}:${VERSION}-${GOARCH}

push:
	docker push ${REGESTRY}/${APP}:${VERSION}-${GOARCH}

clean:
	rm -rf kbot
	docker rmi ${REGESTRY}/${APP}:${VERSION}-${GOARCH}