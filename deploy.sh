#!/bin/bash
#
# Updates branch gh-pages
rev=$(git rev-parse --short HEAD)

mkdir -p _site
cp -R app _site/
cp index.html _site/
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

cd _site

git init
git config user.name "Travis"
git config user.email "deploy.sh@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/nicosmaris/front-end-ci.git"
git fetch upstream && git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
