#!/bin/bash
set -euo pipefail

dumpfile=$1
[[ ! -f $dumpfile ]]

container=$(docker-compose ps | grep postgres | awk '{ print $1 }')
docker exec -i $container pg_dump --format=c --username=postgres pad > $dumpfile

