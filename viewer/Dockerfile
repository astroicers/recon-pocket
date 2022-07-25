FROM python:3.9-alpine as base
FROM base as builder
# install & plugin

COPY requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

FROM base
# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
RUN mkdir /app /treasure
WORKDIR /app
COPY viewer.py viewer.py
COPY viewer.sh viewer.sh
ENTRYPOINT [ "/bin/sh" ]