.PHONY: build
.NOTPARALLEL:
build: clean
	gcc core/main.c hello/hello.s io/print.s io/readInput.s -o prog

.PHONY: clean
clean:
	rm -rf prog
