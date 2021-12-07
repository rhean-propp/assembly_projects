global _start
section .text

_start: 
        mov rax, 0x5
        stc             ; Set Carry Flag
        adc rax, 0x1    ; Computes the sum of rax and 0x1 operands, plus 1 since the carry flag is set.



        mov rax, 60     ; System call number for exit function.
        mov rdi, 0      ; Paramater pass to exit function.
        syscall         ; interrupt

section .data