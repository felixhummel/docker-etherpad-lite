build:
	docker build -t etherpad-lite:$$(cd etherpad-lite && git rev-parse --short HEAD) .
notes:
	git submodule add https://github.com/ether/etherpad-lite.git etherpad-lite
