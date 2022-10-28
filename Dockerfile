# syntax=docker/dockerfile:1.4

FROM node:18-alpine

RUN <<EOF

npm install -g \
  release-it \
  @csmith/release-it-calver-plugin

EOF

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ /entrypoint.sh ]
