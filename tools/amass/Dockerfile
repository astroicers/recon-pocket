FROM golang:1.18-alpine3.15 as builder
# download dependency
RUN apk --no-cache add git
RUN go install -v github.com/OWASP/Amass/v3/...@master

FROM alpine:3.15
# Copy from builder
COPY --from=builder /go/bin/amass /bin/amass
RUN apk --no-cache add ca-certificates
ENV HOME /
RUN addgroup user \
    && adduser user -D -G user \
    && mkdir /.config \
    && mkdir /.config/amass \
    && chown -R user:user /.config
RUN mkdir /amass
COPY amass.sh amass.sh
USER user
ENTRYPOINT ["/bin/sh"]