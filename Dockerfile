FROM golang:alpine as base

RUN apk add --no-cache git upx

WORKDIR /fargate

ADD go.mod .
RUN go mod download

ADD . /fargate
RUN go build -ldflags="-s -w"
RUN upx --brute fargatecli

FROM alpine

LABEL REPO="https://github.com/TransmitLive/fargatecli"
LABEL MAINTAINER="Transmit DevOps"

RUN apk add --no-cache ca-certificates

COPY --from=0 /fargate/fargatecli /usr/local/bin/fargate
