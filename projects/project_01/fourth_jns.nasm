global _start
section .text

_start:
    mov al, 0x1        ; MOVE 0xaa into the al register.
    sub al, 0x3        ; ADD oxaa into to the al register

    jns exit_with_10     ; Jump to exit_with_10 if it exists below to the exit_with_10 statement. 

    mov rax, 60     ; System call number for exit function
    mov rdi, 0      ; Parameter pass to exit function
    syscall         ; Interrupt 

    exit_with_10:       ; Resume the program after the JUMP command
    
    mov rax, 60     ; System call number for exit function
    mov rdi, 60     ; Parameter pass to exit function
    syscall         ; Interrupt

section .data