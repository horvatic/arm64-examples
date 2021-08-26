.PHONY: build
.NOTPARALLEL:
build: clean
	as -o hello.o hello.s
	ld -s -o hello hello.o

.PHONY: clean
clean:
	rm -rf hello hello.o
