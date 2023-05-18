#!/bin/csh -f

cd /net/trenton/v/minghung/Intel16-OpenTitanSoC/ip/map_top

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/usr/caen/vcs-2020.12-SP2-1/linux64/bin/vcselab $* \
    -o \
    simv_top \
    -nobanner \

cd -

