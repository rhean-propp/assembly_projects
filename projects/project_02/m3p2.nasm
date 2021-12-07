global _start
section .text

_start:

    mov rdx, 0x1234
    push rdx
    push 0x68732f6e
    mov rbx, 0x69622f2f
    push rbx
    push 0xabcd
    pop rdi
    pop rsi
    pop rcx
    
    mov rax, 60
    mov rdi, 0
    syscall