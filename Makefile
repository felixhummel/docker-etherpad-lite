build:
	docker build -t etherpad-lite:$$(cd etherpad-lite && git rev-parse --short HEAD) .
	docker tag etherpad-lite:$(cd etherpad-lite && git rev-parse --short HEAD) etherpad-lite:latest
notes:
	git submodule add https://github.com/ether/etherpad-lite.git etherpad-lite
	docker-compose exec --user postgres postgres psql pad pad -c 'select * from store'
