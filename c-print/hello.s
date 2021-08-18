.include "hello.inc"

.data

msgone:
	.ascii        "Hello!\n"
lenone = . - msgone
msgtwo:
	.ascii        "Good bye!\n"
lentwo = . - msgtwo

.text

.global print_hello
.type print_hello, @function
print_hello:
	print msgone, lenone
	print msgtwo, lentwo
	ret


