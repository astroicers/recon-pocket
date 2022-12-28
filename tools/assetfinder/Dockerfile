FROM golang:1.18-alpine3.15 AS builder
WORKDIR /workspace/example
ENV GO111MODULE=on CGO_ENABLED=0
# download dependency
RUN apk --no-cache add git
RUN go install github.com/tomnomnom/assetfinder@latest

FROM alpine:latest
# Copy from builder
COPY --from=builder /go/bin/assetfinder /bin/assetfinder
RUN mkdir /assetfinder
COPY assetfinder.sh assetfinder.sh
ENTRYPOINT ["/bin/sh"]