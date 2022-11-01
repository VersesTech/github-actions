#!/bin/sh

ls -al
env

cd "${GITHUB_WORKSPACE}" || exit

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@github.verses.io"

# If no bumpver config exists, copy default
if test -f "${GITHUB_WORKSPACE}/bumpver.toml"; then
    echo "Using existing config provided by project."
else
    echo "Using default bumpver config."
    cp /bumpver.toml "${GITHUB_WORKSPACE}/bumpver.toml"
    git add "${GITHUB_WORKSPACE}/bumpver.toml"
    git commit -m "Add bumpver.toml"
fi

bumpver show -vv
bumpver update -vv


# mkdir -p "${GITHUB_WORKSPACE}/release-dist/"
# cd "${GITHUB_WORKSPACE}/release-dist/"

# npm install \
#   release-it
# npm install --save-dev \
#   @csmith/release-it-calver-plugin

# ./node_modules/.bin/release-it --ci --config "${GITHUB_WORKSPACE}/.release-it.json" -VV
