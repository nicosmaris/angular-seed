#!/bin/sh

export DISPLAY=:99.0

# unit test
npm run test-single-run

# end to end test
(npm start > /dev/null &) && (npm run protractor)


