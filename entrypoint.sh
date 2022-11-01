#!/bin/sh

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@github.verses.io"

release-it --ci --config ./.release-it.json --dry-run 
