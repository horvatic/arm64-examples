//Consts
.equ STDIN,  0	// linux input console
.equ READ,   63 

.text
.global read_word
.type read_word, @function
read_word:

    mov x2, x1  	// arg 1 is buffer size
    mov x1, x0		// arg 0 is biffer

    //Read User Input
    mov x0,STDIN	// linux input console
    mov x8,READ   	// request to read data
    svc 0        	// trigger system read input
    ret
