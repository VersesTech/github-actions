#!/bin/sh

ls -al
env

cd "${GITHUB_WORKSPACE}" || exit

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@github.verses.io"

release-it --ci --config ./.release-it.json -VV
