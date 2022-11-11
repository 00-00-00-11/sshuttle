#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    exec "$@"
else
    # Execute sshuttle
    exec /usr/bin/sshuttle -e "$SSH_ARGS" $SSHUTTLE_ARGS
fi