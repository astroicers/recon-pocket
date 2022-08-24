FROM alpine:3.15

RUN apk add whois
RUN mkdir /whois
COPY whois.sh whois.sh

ENTRYPOINT ["/bin/sh"]