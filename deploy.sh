#!/bin/bash
#
p=../_site/$TRAVIS_BUILD_NUMBER
mkdir -p $p
cp -R angular1 $p
cp .gitignore $p
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

cd ../_site

git init
git config user.name "deploy.sh"
git config user.email "deploy.sh@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/nicosmaris/front-end-ci.git"
git fetch upstream #&& git reset upstream/gh-pages

touch .

git add -A .
git commit -m "build $TRAVIS_BUILD_NUMBER has commit $TRAVIS_COMMIT of branch $TRAVIS_BRANCH" 
git push -q upstream HEAD:gh-pages

