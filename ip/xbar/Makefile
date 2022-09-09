XBAR_PERI = xbar_periph
XBAR_MAIN = xbar_main

all: peri

peri:
	rm -rf tmp
	mkdir tmp
	../opentitan/util/tlgen.py -t hjson/$(XBAR_PERI).hjson -o tmp
	cp tmp/rtl/autogen/* rtl
	rm -rf tmp

main:
	rm -rf tmp
	mkdir tmp
	../opentitan/util/tlgen.py -t hjson/$(XBAR_MAIN).hjson -o tmp
	cp tmp/rtl/autogen/* rtl
	rm -rf tmp