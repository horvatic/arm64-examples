.PHONY: build
.NOTPARALLEL:
build: clean
	as -o server.o server.s
	ld -s -o server server.o

.PHONY: clean
clean:
	rm -rf server server.o
