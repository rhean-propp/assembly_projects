global _start           ; make _start available globally to the linker
section .text           ; The section to follow is to be placed in the code section

_start:                 ; This represents a label; a way for us to refer to a memory location in the code section.
    mov ecx, 0x3478     ; Copy the value 0x3478 and place it into the register ecx, overwriting the value in it.     
    mov edx, 0x2456     ; Copy the value 0x2456 and place it into the register ecx, overwriting the value in it.
    add edx, ecx        ; Add the value in ecx to edx, overwriting the contents of edx.
    mov eax, [ebx-4]    ; Go to memory location calculated by [ebx-4], get the value there, then place the value into eax. HINT: pointers

    ;; The code below is similar to performing an exit(0); in C.
    xor rax, rax        ; Take the contents of rax and makes it zero.
    add rax, 60         ; Adds the value 60 to RAX
    mov rdx, 0x0        ; Moves 0 into RDX (contains the status code)
    syscall             ; Systemcall is performing an exit operation