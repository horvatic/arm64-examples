//Consts
.equ BUFFER_SIZE,   100
.equ SYS_STDIN,  0                // linux input console
.equ SYS_STDOUT, 1                // linux output console
.equ SYS_READ,   63 
.equ SYS_WRITE,  64 
.equ SYS_EXIT,   93 

.data
enterText:		.asciz "Enter text: "
carriageReturn:  	.asciz "\n"

//Read Buffer
.bss 
buffer:    .skip    BUFFER_SIZE

.text
.global _start 

quadEnterText:        .quad  enterText
quadBuffer:           .quad  buffer
quadCarriageReturn:   .quad  carriageReturn

writeMessage:
    mov x2,0                   // reset size counter to 0

checkSize:                     // get size of input
    ldrb w1,[x0,x2]            // load char with offset of x2
    add x2,x2,#1               // add 1 char read legnth
    cbz w1,output              // if char found
    b checkSize                // loop

output:
    mov x8,SYS_WRITE               
    mov x1,x0                  // move string address into system call func parm
    mov x0,SYS_STDOUT              
    svc 0                      // trigger system write
    ret                        


_start:
    //Output enter text
    ldr x0,quadEnterText	// load enter message
    bl writeMessage		// output enter message

    //Read User Input
    mov x0,SYS_STDIN           	// linux input console
    ldr x1,quadBuffer      	// load buffer address 
    mov x2,BUFFER_SIZE      	// load buffer size 
    mov x8,SYS_READ            	// request to read data
    svc 0                  	// trigger system read input

    //Output User Message
    mov x2, #0			// prep end of string
    ldr x1,quadBuffer      	// load buffer address 
    strb w2,[x1, x0]        	// store x2 0 byte at the end of input string, offset x0
    ldr x0,quadBuffer      	// load buffer address 
    bl writeMessage
    
    //Output newline
    ldr x0,quadCarriageReturn   
    bl writeMessage

    //End Program
    mov x8, SYS_EXIT          	// request to exit program
    mov x0, 0             	// return code
    svc 0                 	// trigger end of program
 
