FROM alpine:3.15

RUN apk add curl
RUN mkdir /crt_sh
COPY crt_sh.sh crt_sh.sh

ENTRYPOINT ["/bin/sh"]