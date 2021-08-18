.PHONY: build
.NOTPARALLEL:
build: clean
	as -o userinput.o userinput.s
	ld -s -o userinput userinput.o

.PHONY: clean
clean:
	rm -rf userinput userinput.o
