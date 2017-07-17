#!/bin/sh

export DISPLAY=:99.0

# unit test
yarn run test-single-run

# end to end test
(yarn start > /dev/null &) && (yarn run protractor)


