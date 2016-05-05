include config.mk

build: marccook

marccook: marccook.pod
	install -T -m 0755 $< $@

install: marccook
	install $< $(PREFIX)/bin/

.PHONY: build install
