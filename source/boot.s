.section .init
.globl _start
_start:
    .section .text
    mov sp,#0x8000

    bl kernel

hang: b hang
