.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

mov r0,#16
mov r1,#1
bl SetGpioFunction

loop$:
    mov r0,#16
    mov r1,#0
    bl SetGpio

    mov r0,#0x3F0000
    wait1$:
            sub r0,#1
            cmp r0,#0
            bne wait1$

    mov r0,#16
    mov r1,#1
    bl SetGpio

    mov r0,#0x3F0000
    wait2$:
            sub r0,#1
            cmp r0,#0
            bne wait2$

    b loop$