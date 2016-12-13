Piping STDIN to "docker-compose exec" resulted in BrokenPipeError for me.
That's why both dump and load use "docker exec" instead.

There is no need to replace the bash by the docker client process, but "exec
docker exec" just looks too funny not to write it. :>

