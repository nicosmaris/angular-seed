#!/bin/bash
#
p=../_site/$TRAVIS_BUILD_NUMBER
mkdir -p $p
cp -R $1 $p
# if there is client side code, deploy it too
find . -type d -name bower_components -exec cp -R {} $p \;

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

git config user.name "deploy.sh"
git config user.email "deploy.sh@gmail.com"

git clone "https://$GH_TOKEN@github.com/nicosmaris/front-end-ci.git"
cd front-end-ci
git checkout gh-pages
cp -R ../$p .
touch .

git add -A .
git commit -m "build $TRAVIS_BUILD_NUMBER has commit $TRAVIS_COMMIT of branch $TRAVIS_BRANCH" 
git push

