FROM golang:1.18-alpine3.15 AS builder
WORKDIR /workspace/example
ENV GO111MODULE=on CGO_ENABLED=0
# download dependency
RUN apk add git
RUN go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

FROM alpine:latest
RUN apk -U upgrade --no-cache
RUN apk add --no-cache bind-tools ca-certificates
# Copy from builder
COPY --from=builder /go/bin/subfinder /bin/subfinder
RUN mkdir /subfinder
COPY subfinder.sh subfinder.sh

ENTRYPOINT ["/bin/sh"]