#!/bin/sh

# fetch all tags
git fetch

# Delete remote and local tags
git push origin --delete $(git tag -l)
git tag -d $(git tag -l)

# trigger
git tag build-0.0.1
git push --tags
