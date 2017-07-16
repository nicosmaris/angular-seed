#!/bin/sh

export DISPLAY=:99.0

npm run test-single-run
(npm start > /dev/null &) && (npm run protractor)


