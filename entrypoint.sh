#!/bin/bash

TIMEOUT=30
remaining=$TIMEOUT

echo Waiting for postgres to come up.

until pg_isready -q -hpostgres -Upad -dpad; do
  echo $remaining
  if [[ $remaining == 0 ]]; then
    echo "timeout"
    exit 1
  fi
  sleep 1
  let remaining-=1
done
echo
exec $@
