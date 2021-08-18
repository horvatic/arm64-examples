//Consts
.equ STDOUT, 1
.equ WRITE,  64

.macro print msg, len
	ldr     x1, =\msg   // Load message into reg 1 for system call
	ldr     x2, =\len   // Load message length
	mov     x0, #STDOUT // set STDOUT
	mov     w8, #WRITE  // set write mode
	svc     #0          // invoke syscall
.endm
