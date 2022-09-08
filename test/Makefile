COMMON = common
ASM = asm
C = c
HEX = hex
# SOURCE_C = add
# SOURCE = $(C)/$(SOURCE_C).c
SOURCE_S = gpio
SOURCE = $(ASM)/$(SOURCE_S).s

CRT = $(COMMON)/crt.s
LINKERS = $(COMMON)/linker.lds
ASLINKERS = $(COMMON)/aslinker.lds

DEBUG_FLAG = -g
CFLAGS =  -mno-relax -march=rv32im -mabi=ilp32 -nostartfiles -std=gnu11 -mstrict-align -mno-div 
OFLAGS = -O0
ASFLAGS = -mno-relax -march=rv32im -mabi=ilp32 -nostartfiles -Wno-main -mstrict-align
OBJFLAGS = -SD -M no-aliases 
OBJDFLAGS = -SD -M numeric,no-aliases

GCC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
AS = riscv64-unknown-elf-as
ELF2HEX = elf2hex

# Programs
all:	assembly

compile: $(CRT) $(LINKERS)
	$(GCC) $(CFLAGS) $(OFLAGS) $(CRT) $(SOURCE) -T $(LINKERS) -o program.elf
	$(GCC) $(CFLAGS) $(DEBUG_FLAG) $(CRT) $(SOURCE) -T $(LINKERS) -o program.debug.elf
assemble: $(ASLINKERS)
	$(GCC) $(ASFLAGS) $(SOURCE) -T $(ASLINKERS) -o program.elf 
	cp program.elf program.debug.elf
disassemble: program.debug.elf
	$(OBJDUMP) $(OBJFLAGS) program.debug.elf > program.dump
	$(OBJDUMP) $(OBJDFLAGS) program.debug.elf > program.debug.dump
	rm program.debug.elf
hex: program.elf
	$(ELF2HEX) 4 4096 program.elf > program.hex
	cp program.hex $(HEX)/$(SOURCE_S).hex
	python trim.py $(SOURCE_S)
	rm program*

program: compile disassemble hex
	@:

debug_program:
	gcc -lm -g -std=gnu11 -DDEBUG $(SOURCE) -o debug_bin

assembly: assemble disassemble hex
	@:

clean:
	rm -rvf program.hex program.dump program.debug.dump program.elf program.debug.elf debug_bin	\

nuke:	clean
