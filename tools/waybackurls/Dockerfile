FROM golang:1.18-alpine3.15 as builder
# download dependency
RUN apk --no-cache add git
RUN go install github.com/tomnomnom/waybackurls@latest

FROM alpine:3.15
# Copy from builder
COPY --from=builder /go/bin/waybackurls /bin/waybackurls
RUN mkdir /waybackurls
COPY waybackurls.sh waybackurls.sh
COPY subdomain_live.txt subdomain_live.txt

ENTRYPOINT ["/bin/sh"]