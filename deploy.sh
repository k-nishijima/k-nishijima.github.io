#!/bin/bash

cd `dirname $0`
\rm -rf docs/*

hugo


git commit -a -m "deploy `date +"%Y%m%d%H%M%S"`"
git push origin source
# git subtree push --prefix docs/ origin master --force

git push github.com:k-nishijima/k-nishijima.github.io `git subtree split --prefix=docs/ --onto=github.com:k-nishijima/k-nishijima.github.io/master`:master --force
