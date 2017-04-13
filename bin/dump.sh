#!/bin/bash
set -euo pipefail

docker-compose exec postgres pg_dump --format=c --username=postgres pad

