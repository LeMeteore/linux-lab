
    .text
    .globl _start

_start:
                        /* syscall write(int fd, const void *buf, size_t count) */
    mov     %r0, $1     /* fd -> stdout */
    ldr     %r1, =msg   /* buf -> msg */
    mov     %r2, #len   /* count -> len(msg) */

    mov     %r7, $4     /* write is syscall #4 */
    swi     $0          /* invoke syscall */

                        /* syscall exit(int status) */
    mov     %r0, $0     /* status -> 0 */
    mov     %r7, $1     /* exit is syscall #1 */
    swi     $0          /* invoke syscall */

    .section .rodata    /* rodata section*/
msg:
    .ascii "Hello, ARM!\n"
    len = . - msg
