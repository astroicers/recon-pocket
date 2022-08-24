FROM alpine:3.15

RUN apk add bind-tools
RUN mkdir /dig
COPY dig.sh dig.sh
COPY subdomain_live.txt subdomain_live.txt

ENTRYPOINT ["/bin/sh"]