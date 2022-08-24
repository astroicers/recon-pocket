FROM golang:1.18-alpine3.15 as builder
# download dependency
RUN apk --no-cache add git
RUN go install github.com/lc/gau/v2/cmd/gau@latest

FROM alpine:3.15
# Copy from builder
COPY --from=builder /go/bin/gau /bin/gau
RUN mkdir /gau
COPY gau.sh gau.sh
COPY subdomain_live.txt subdomain_live.txt

ENTRYPOINT ["/bin/sh"]