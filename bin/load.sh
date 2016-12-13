#!/bin/bash
set -euo pipefail

dumpfile=$1
[[ -f $dumpfile ]]

container=$(docker-compose ps | grep postgres | awk '{ print $1 }')
cat $dumpfile | docker exec -i $container pg_restore --dbname=pad --format=c --username=postgres

