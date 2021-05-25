# build stage
FROM golang:alpine AS build-env
LABEL maintainer="dev@jpillora.com"
RUN apk update
RUN apk add git
ENV CGO_ENABLED 0
ADD . /src
WORKDIR /src
RUN go build \
    -mod vendor \
    -ldflags "-X github.com/qbee-io/tcpforwarder/share.BuildVersion=$(git describe --abbrev=0 --tags)" \
    -o tcpforwarder
# container stage
FROM alpine
RUN apk update && apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=build-env /src/tcpforwarder /app/tcpforwarder
ENTRYPOINT ["/app/tcpforwarder"]