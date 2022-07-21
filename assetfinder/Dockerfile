FROM golang:1.18.0-alpine3.15 AS builder
WORKDIR /workspace/example
ENV GO111MODULE=on CGO_ENABLED=0
# download dependency
RUN apk add git
RUN go install github.com/tomnomnom/assetfinder@latest

FROM alpine:latest AS release
# Copy from builder
COPY --from=builder /go/bin/assetfinder /bin/assetfinder
RUN mkdir /assetfinder
COPY assetfinder.sh assetfinder.sh
ENTRYPOINT ["/bin/sh"]