global _start
section .text

_start:
    mov al, 0xaa        ; MOVE 0xaa into the al register.
    add al, 0xaa        ; ADD oxaa into to the al register

    jb exit_with_10     ; Jump to exit_with_10 if it exists below to the exit_with_10 statement. 

    mov rax, 60     ; System call number for exit function
    mov rdi, 0      ; Parameter pass to exit function
    syscall         ; Interrupt 

    exit_with_10:       ; Resume the program after the JUMP command
    
    mov rax, 60     ; System call number for exit function
    mov rdi, 60     ; Parameter pass to exit function
    syscall         ; Interrupt

section .data