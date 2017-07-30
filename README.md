# Deploy with existing dump

    git submodule update --init
    docker-compose up -d postgres
    docker-compose logs postgres  # wait for it
    ./bin/load.sh pad.pgdump
    docker-compose up -d

# API
```
apikey=$(dc exec etherpad cat APIKEY.txt)

# version
curl http://localhost:9001/api?apikey=$apikey
```

