FROM node:18-alpine

RUN apk add --update --no-cache \
      git \
    && npm install -g \
      release-it \
      @csmith/release-it-calver-plugin

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
