global _start           ; make _start available globally to the linker
section .text           ; The section to follow is to be placed in the code section

_start:                 ; This represents a label; a way for us to refer to a memory location in the code section.
    MOV eax, 0x48       ; Part a
    MOV edx, [mem1]     ; Part b
    MOV ecx, edx        ; Part c
    SUB edx, ecx        ; Part d
    ADD [mem1], eax     ; Part e

    ;; The code below is similar to performing an exit(0); in C.
    XOR rax, rax        ; Take the contents of rax and makes it zero.
    ADD rax, 60         ; Adds the value 60 to RAX
    MOV rdx, 0x0        ; Moves 0 into RDX (contains the status code)
    SYSCALL             ; Systemcall is performing an exit operation

section .data
    mem1: dw 0x12           ; Define Word
