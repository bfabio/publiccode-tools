#!/bin/bash

TIMEOUT=60

/usr/local/bin/docker-entrypoint.sh &

echo Waiting for Elasticsearch to start...

count=0
while true; do
    RES="$(curl -sLf -m 2 -w "%{http_code}\n" "http://localhost:9200/" -o /dev/null)"
    if [ "$RES" -ne "000" ]; then
        break
    fi

    count=$((count + 1))
    if [ $count -gt $TIMEOUT ]; then
        echo "Can't connect to Elasticsearch after $TIMEOUT seconds"
        exit 0
    fi
    sleep 1
done

echo Populating elasticsearch with development data...
elasticdump --input "$ELASTIC_DUMP_FILE" --output http://localhost:9200

echo "***************************************"
echo "* Don't use this image in production  *"
echo "***************************************"

exec $@
