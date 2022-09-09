XBAR = xbar_periph

all:
	mkdir tmp
	../opentitan/util/tlgen.py -t hjson/$(XBAR).hjson -o tmp
	cp tmp/rtl/autogen/* rtl
	rm -rf tmp