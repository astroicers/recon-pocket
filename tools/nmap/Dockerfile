FROM alpine:3.15

RUN apk add nmap nmap-scripts
RUN mkdir /nmap
COPY nmap_quick_tcp.sh nmap_quick_tcp.sh
COPY nmap_full_tcp.sh nmap_full_tcp.sh
COPY subdomain_live.txt subdomain_live.txt

ENTRYPOINT ["/bin/sh"]