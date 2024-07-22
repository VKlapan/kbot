FROM quay.io/projectquay/golang:1.20 AS builder

ARG GOOS
ARG GOARCH

WORKDIR /go/src/app
COPY . .

RUN echo `GOOS=${GOOS} GOARCH=${GOARCH}`
RUN make build GOOS=${GOOS} GOARCH=${GOARCH}

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["./kbot"]