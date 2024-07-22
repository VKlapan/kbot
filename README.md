# kbot

https://t.me/@vklapan_bot

# commands

/hello

# usage

1. Clone the project https://github.com/VKlapan/kbot.git
2. Run
   go build -ldflags "-X="github.com/VKlapan/cmd.appVersion=v1.0.0

3. Set environment variable from telegram
   bash export TELE_TOKEN={{your token}}

4. Run bash ./kbot start

#Dockerfile and Makefile

To build an image for difference OS and ARCH use params:

make image GOOS=OS_NAME GOARCH=ARCH_NAME

# for linix and amd64

# make image GOOS=linux GOARCH=amd64

OR

docker build --tag=TAG_NAME --build-arg GOOS=OS_NAME --build-arg GOARCH=ARCH_NAME .

# for windows and arm64

# docker build --tag=demo1 --build-arg GOOS=windows --build-arg GOARCH=arm64 .

The list of OS_NAME and ARCH_NAME find by link: https://go.dev/doc/install/source#environment
