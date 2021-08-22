//Consts
.equ STDOUT, 1
.equ WRITE,  64

.text

.global print_word
.type print_word, @function
print_word:
	mov x2, x1          // arg 1 is message size
	mov x1, x0          // arg 0 is message
	mov     x0, #STDOUT // set STDOUT
	mov     w8, #WRITE  // write is syscall #64 for write mode
	svc     #0          // invoke syscall
	ret                 // return 
