#!/bin/sh
git fetch
git push orgin --delete $(git tag -l)
git tag -d $(git tag -l)
git tag build-0.0.1
