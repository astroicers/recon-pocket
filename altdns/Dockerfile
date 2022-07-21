FROM python:3.9-alpine as base
FROM base as builder
# install & plugin

COPY requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

FROM base
# copy only the dependencies installation from the 1st stage image
RUN mkdir /altdns
COPY --from=builder /root/.local /root/.local
COPY altdns.sh altdns.sh
COPY words.txt words.txt
ENV PATH=/root/.local/bin:$PATH

ENTRYPOINT ["/bin/sh"]