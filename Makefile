.PHONY: all build image clean

all: image

build: image/erlang-17.0.tar.gz

image/erlang-17.0.tar.gz:
	docker build -t "stoo/erlang_build:17.0-1" build
	docker run -i --rm "stoo/erlang_build:17.0-1" \
	    tar zcf - -C / opt/erlang-17.0 >erlang-17.0.tar.gz.tmp
	mv erlang-17.0.tar.gz.tmp image/erlang-17.0.tar.gz

image: image/erlang-17.0.tar.gz
	docker build -t "stoo/erlang:17.0-1" image

latest: image
	docker build -t "stoo/erlang:latest" image

clean:
	rm -f image/erlang-17.0.tar.gz
