#!/bin/bash
#
p=_site/$TRAVIS_BRANCH/$TRAVIS_COMMIT
mkdir -p $p
cp -R . $p
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

cd $p

git init
git config user.name "deploy.sh"
git config user.email "deploy.sh@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/nicosmaris/front-end-ci.git"
git fetch upstream && git reset upstream/gh-pages

touch .

git add -A .
git commit -m "Add commit $TRAVIS_COMMIT of branch $TRAVIS_BRANCH" 
git push -q upstream HEAD:gh-pages
