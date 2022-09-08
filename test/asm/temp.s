li s0, 0x400d0000 #tempsenseor base address
li s1, 0x40080000 #gpio base address
li x12, 1
sw x12, 0x0c(s0) #set enable to 1
sw x12, 0x10(s0) #select LC2
lw x18, 0x14(s0) #read done1=1
lw x19, 0x10(s0) #read reg1=69
sw x19, 0x10(s1) #send out to gpio direct out