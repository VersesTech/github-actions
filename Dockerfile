FROM node:18-alpine

RUN npm install -g \
      release-it \
      @csmith/release-it-calver-plugin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ /entrypoint.sh ]
