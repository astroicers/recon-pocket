FROM python:3.9-alpine as base
FROM base as builder
# install & plugin
COPY ./dnsrecon/requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

FROM base
COPY --from=builder /root/.local /root/.local
RUN mkdir /app
COPY ./dnsrecon /app
COPY ./subdomain_live.txt subdomain_live.txt
COPY dnsrecon.sh dnsrecon.sh
RUN apk add --no-cache build-base libffi-dev libxml2-dev libxslt-dev

ENTRYPOINT ["/bin/sh"]