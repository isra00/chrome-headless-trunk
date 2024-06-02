#!/bin/bash

# Run the NSSDB updating utility in background
import_cert.sh $HOME &

if [ -z "$NODEBUG" ]; then
  DEBUG_OPTS="--remote-debugging-address=$DEBUG_ADDRESS --remote-debugging-port=$DEBUG_PORT"
fi

CHROME_ARGS="--disable-gpu --headless --no-sandbox $DEBUG_OPTS --user-data-dir=/data --disable-dev-shm-usage"

if [ -n "$CHROME_OPTS" ]; then
  CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
fi

# Start Chrome
sh -c "/usr/bin/google-chrome-unstable $CHROME_ARGS"
