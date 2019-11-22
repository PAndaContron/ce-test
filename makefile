NAME        ?= DEMO
COMPRESSED  ?= NO
ICON        ?= iconc.png
DESCRIPTION ?= "C SDK Demo"

include $(CEDEV)/include/.makefile
all:
	bash make-json.bash $(NAME)
