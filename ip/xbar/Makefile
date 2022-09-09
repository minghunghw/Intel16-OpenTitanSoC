XBAR = xbar_periph

all:
	../opentitan/util/tlgen.py -t hjson/$(XBAR).hjson -o tmp
	cp tmp/rtl/autogen/* rtl
	rm -rf tmp