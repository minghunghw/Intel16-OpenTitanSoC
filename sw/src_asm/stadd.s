li s0, 0x40000000 # DCCM base address
li x28, 10
li x29, 20
add x30, x28, x29
sw x30, 8(s0)
li x28, 15
li x29, 25
add x30, x28, x29
sw x30, 16(s0)
