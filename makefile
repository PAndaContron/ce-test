NAME        ?= CETEST
COMPRESSED  ?= NO
ICON        ?= iconc.png
DESCRIPTION ?= "C SDK Demo"

include $(CEDEV)/include/.makefile

clear-dirs:
	rm -rf bin obj

all: clear-dirs
	sed -e "s,ROM,$(CEDEV)/CEmu/ti-84ce.rom,g" -e "s,NAME,$(NAME),g" <run-template.json >run.json

run: all
	$(CEDEV)/CEmu/CEmu -t run.json
