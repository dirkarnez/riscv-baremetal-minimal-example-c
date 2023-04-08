PROG_NAME 	= riscv-example
RISCV64_GCC = riscv-none-elf-gcc
GCC_FLAGS	= -march=rv64g -mabi=lp64 -static -mcmodel=medany \
			  -fvisibility=hidden -fno-builtin \
			  -nostdlib -nostartfiles

LD_FLAGS=-T example.ld

.PHONY: all clean
all: $(PROG_NAME)

start.o: 
	$(RISCV64_GCC) $(GCC_FLAGS) -c start.s

main.o: main.c
	$(RISCV64_GCC) $(GCC_FLAGS) -c main.c

$(PROG_NAME): start.o main.o
	$(RISCV64_GCC) $(GCC_FLAGS) -o $@ start.o main.o $(LD_FLAGS)

clean:
	rm *.o $(PROG_NAME)