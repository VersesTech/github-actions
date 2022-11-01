FROM python:3.11-alpine

RUN apk add --update --no-cache \
      git \
    && pip3 install \
      bumpver

COPY bumpver.toml /bumpver.toml

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
