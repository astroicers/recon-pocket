FROM alpine:3.15

RUN apk add --no-cache wget
RUN mkdir /git-hound /app
RUN wget https://github.com/tillson/git-hound/releases/download/v1.4/git-hound_1.4_Linux_x86_64.tar.gz
RUN tar xf git-hound_1.4_Linux_x86_64.tar.gz -C /app
RUN cp /app/git-hound /bin/git-hound
COPY git-hound.sh git-hound.sh
COPY config.yaml config.yaml
COPY regexes.txt regexes.txt
COPY subdomain_live.txt subdomain_live.txt

ENTRYPOINT ["/bin/sh"]