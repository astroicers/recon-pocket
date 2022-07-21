FROM python:3.9-alpine as base
FROM base as builder
# install & plugin
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

FROM base
COPY --from=builder /root/.local /root/.local

WORKDIR /usr/src/app
COPY . .
ENTRYPOINT [ "python" ]