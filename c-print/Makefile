.PHONY: build
.NOTPARALLEL:
build: clean
	gcc core/main.c arm64/hello.s arm64/print.s arm64/add.s -o prog
.PHONY: clean
clean:
	rm -rf prog
