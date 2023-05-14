#setvar G_DEBUG "1"

#P1273 - wn, ln, nn (normal gate)
setvar G_LIBRARY_TYPE d04
setvar G_VT_TYPE(default) wn_ln_nn
setvar G_CORNER_NAME_TYPE nominal+MAX
setvar G_CORNER_DETAILS(nominal+VOLTAGE) "0.75"
setvar G_CORNER_DETAILS(nominal+TEMPERATURE) "70.00"
setvar G_CORNER_DETAILS(nominal+PROCESS) "tttt"
setvar G_PRESERVE_ADDITIONAL_LINK_LIBRARIES 1

