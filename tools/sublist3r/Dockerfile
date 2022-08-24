FROM python:3.9-alpine as base
FROM base as builder
# install & plugin

COPY requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

FROM base
RUN apk update
RUN apk add py3-requests py3-dnspython
# copy only the dependencies installation from the 1st stage image
RUN mkdir /sublist3r
COPY --from=builder /root/.local /root/.local
COPY sublist3r.py sublist3r.py
COPY sublist3r.sh sublist3r.sh
COPY ./subbrute ./subbrute
ENV PATH=/root/.local/bin:$PATH

ENTRYPOINT ["/bin/sh"]