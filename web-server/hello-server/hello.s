.data

.equ SYS_SOCKET, 198
.equ IPPROTO_IP, 0
.equ SOCK_STREAM, 1
.equ AF_INET, 2
.equ SYS_BIND, 200
.equ SYS_LISTEN, 201
.equ SYS_ACCEPT, 202
.equ SYS_SEND_TO, 206
.equ SYS_CLOSE, 57 
.equ PORT, 8080
.equ BACKLOG_QUEUE_SIZE, 1
.equ SYS_EXIT, 93

//C struct
//struct sockaddr {
//  sa_family_t sa_family;
//  char        sa_data[14];
//}
//struct sockaddr_in sa;
//sa.sin_family = AF_INET;
//sa.sin_port = htons(8080);
.equ PORT, (((((8080 & 0xFF) << 8) | (8080 >> 8)) << 16) | AF_INET) 

msg:
        .ascii        "HTTP/1.1 200 OK\r\nContent-Length: 13\r\nConnection: close\r\n\r\nHello, world!"
msglen = . - msg

.global _start
.text

_start:
    
    // s = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
    mov x8, SYS_SOCKET
    mov x2, IPPROTO_IP
    mov x1, SOCK_STREAM
    mov x0, AF_INET
    svc 0

    mov x6, x0       	// x6 = s

    movz    x1, PORT & 0xFFFF
    movk    x1, (PORT >> 16) & 0xFFFF, lsl 16
    str x1, [sp, -16]!  // store pointer with len
    
    // bind(s, &sa, sizeof(sa));  
    mov x8, SYS_BIND
    mov x1, sp
    mov x2, 16
    svc 0

    // listen(s, 1);
    mov x8, SYS_LISTEN
    mov x1, BACKLOG_QUEUE_SIZE //backlog argument defines the maximum length to which the queue of pending connections
    mov x0, x6
    svc 0
    
    // r = accept(s, 0, 0);
    mov x8, SYS_ACCEPT
    mov x2, xzr
    mov x1, xzr
    mov x0, x6
    svc 0

    //send(r, &msg[0], msglen, 0, NULL, 0). x0 return from accept is used as input for send
    mov x8, SYS_SEND_TO
    ldr x1, =msg
    ldr x2, =msglen
    mov x3, xzr
    mov x4, xzr
    mov x5, xzr
    svc 0

    //close(r)
    mov x8, SYS_CLOSE
    svc 0
    
    //close(s)
    mov x8, SYS_CLOSE
    mov x0, x6
    svc 0

    mov x8, SYS_EXIT    // exit is syscall
    mov x0, #0     	// return status 0
    svc 0         
