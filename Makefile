VSN = 17.1-1
IMG_BUILD = stoo/erlang_build:$(VSN)
IMG = stoo/erlang:$(VSN)

PREFIX = erlang-17.1

.PHONY: all build image clean

all: image

build: image/$(PREFIX).tar.gz

image/$(PREFIX).tar.gz:
	docker build -t "$(IMG_BUILD)" build
	docker run -i --rm "$(IMG_BUILD)" \
	    tar zcf - -C / opt/$(PREFIX) >$(PREFIX).tar.gz.tmp
	mv $(PREFIX).tar.gz.tmp image/$(PREFIX).tar.gz

image: image/$(PREFIX).tar.gz
	docker build -t "$(IMG)" image

clean:
	rm -f image/$(PREFIX).tar.gz
