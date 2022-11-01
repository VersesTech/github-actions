#!/bin/sh

ls -al
env

cd "${GITHUB_WORKSPACE}" || exit

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@github.verses.io"

mkdir -p "${GITHUB_WORKSPACE}/release-dist/"
cd release-dist/

npm install \
  release-it
npm install --save-dev \
  @csmith/release-it-calver-plugin

./node_modules/.bin/release-it --ci --config "${GITHUB_WORKSPACE}/.release-it.json" -VV
