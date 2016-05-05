include config.mk

build: marccook

marccook: marccook.pod
	perl -MPOSIX=strftime -pe "s/%VERSION%/$(shell cat VERSION)/; s/%LASTMOD%/strftime('%Y-%m-%d',localtime((stat q{$<})[9]))/e" $< > $@
	chmod 0755 $@

install: marccook
	install $< $(PREFIX)/bin/

.PHONY: build install
