# Deploy with existing dump

    docker-compose up -d postgres
    docker-compose logs postgres  # wait for it
    ./bin/load.sh pad.pgdump
    docker-compose up -d

