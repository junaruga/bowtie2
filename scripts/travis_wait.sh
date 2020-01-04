#!/bin/bash

set -e

# Ping stdout every 9 minutes or Travis kills the job.
# as travis_wait does not show the command output while processing.
# https://docs.travis-ci.com/user/common-build-problems/#build-times-out-because-no-output-was-received
# Set sleep time as seconds without "m" (minute),
# as osx: sleep command does not support the format Nm.
while sleep 540; do
  echo "====[ $SECONDS seconds still running ]===="
done &

echo "+ $@"
"$@"

# Kill the background sleep process explicitly.
kill %1
