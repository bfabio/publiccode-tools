#!/bin/bash

set -o xtrace
set -o errexit

/usr/local/bin/docker-entrypoint.sh

elasticdump --input "$ELASTIC_DUMP_FILE" --output "$ELASTIC_SERVER"

exec $@
