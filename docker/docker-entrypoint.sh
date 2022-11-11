#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    exec "$@"
else
    # Execute sshuttle
    exec /usr/bin/sshuttle $SSHUTTLE_ARGS
fi
