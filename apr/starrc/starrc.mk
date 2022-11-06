
extraction: finish
	rm -rf starrc/extraction && mkdir -p starrc/extraction && cd starrc/extraction && \
	envsubst < ../star_rcxt.asic.cmd > run.cmd && \
	StarXtract -clean run.cmd