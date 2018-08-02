nolibc: crt0.S main.c
	riscv64-unknown-elf-gcc -nostdlib -O3 crt0.S -o nolibc main.c

clean:
		rm -rf nolibc
