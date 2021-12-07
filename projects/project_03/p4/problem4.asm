extern printf
extern exit
extern scanf

global _start
section .data
    format1 db "Entered Main", 0xa, 0x0
    format2 db "Please enter a string: ", 0xa, 0x0
    format3 db "%s", 0x0
    format4 db "Match found", 0xa, 0x0
    ;format5 db "The length is: %d", 0xa, 0x0        ; [ DEBUG ] Printing out the length

section .text
length:
    push rbp
    mov rbp, rsp
    mov QWORD [rbp-0x18], rdi
    xor rcx, rcx                        ; Set the counter to 0.
check:
    mov rax, QWORD [rbp-0x18]           ; Loading the array into rax
    add rax, rcx                        ; Looking at index of array.
    mov al, BYTE [rax]                  ; Views 1 byte within the character array.
    add rcx, 0x1                        ; Increase counter by 1     | RCX = Counter
    cmp al, 0x0                         ; Checks each individual character with NULL
    jne check                           ; Loop

    mov rax, rcx                        ; Epilogue | Prepping return value    
    pop rbp                             ; Epilogue
    ret                                 ; Epilogue
entangle:
    push rbp                            ; Prologue
    mov rbp, rsp                        ; Prologue
    sub rsp, 0x30                       ; Prologue

    mov QWORD [rbp-0x18], rdi           ; char new_array[20] | 
    mov QWORD [rbp-0x20], rsi           ; char array[20]     | 
    mov QWORD [rbp-0x24], rdx           ; length             | length of char array[20] | [ CHANGE ] Changed this to RDX. Mismatch in operand sizes.
    mov QWORD [rbp-0x4], 0x0            ; count
    mov QWORD [rbp-0x8], 0x0            ; flag
    ; xor -> [rbp-0x28]
        xor rax, rax                    ; Clear
        xor rbx, rbx                    ; Clear
        xor rcx, rcx                    ; Clear
        mov ecx, DWORD [rbp-0x4]        ; count = 0
while:
    mov al, BYTE [rsi + rcx]            ; 
    mov bl, BYTE [rdi + rcx]            ; 
    test al, 0xFF                       ; 
    je flag_0                           ; 
    test dl, 0xFF                       ; 
    je flag_0                           ; 
    xor al, 0x22                        ; array[count] ^ 0x22
    mov DWORD [rbp-0x28], eax           ; store value onto the stack. xor arr2[count] ^ 0x22 
    cmp al, bl                          ; (al) arr2[count] = arr1[count](bl)
    jne flag_1
    mov edx, DWORD [rbp-0x24]           ; Removed the second edx. Invalid combination of opcode and operands.
    sub edx, 1
    mov DWORD [rbp-0x24], edx
    add ecx, 1
    mov DWORD [rbp-0x24], ecx
    jmp while

flag_1:
    mov DWORD [rbp-0x8], 1                    ;flag = 1
flag_0:
    mov eax, DWORD [rbp-0x8]
    ;cmp eax, 0x0                           ; [ CHANGE ] removed and replaced below
    ;jne Done                               ; [ CHANGE ] removed and replaced below
    xor eax, eax
    mov rdi, format4
    call printf
    cmp eax, 0x0                            ; [ CHANGE ] replaced here
    jne Done                                ; [ CHANGE ] replaced here
Done:
    leave
    ret

_start:
    push rbp                                ; Prologue
    mov rbp, rsp                            ; Prologue
    sub rsp, 0x50                           ; Prologue

    xor eax, eax                            ; Clear EAX
    mov rax, 0x5146504d55514352

    mov edx, 0x0
    mov QWORD [rbp-0x40], rax               ; char array [20]
    mov QWORD [rbp-0x38], rdx
    mov DWORD [rbp-0x30], 0x0
    mov rdi, format1
    xor eax, eax
    call printf
    mov rdi, format2
    mov eax, 0x0
    call printf

    lea rdi, [rbp-0x20]                     ; Prepping user input into RDI
    call length                             ; Getting the length of the user input array
    sub RAX, 1                              ; Used for getting the correct length

    mov DWORD [rbp-0x44], eax               ; Move RET value from length onto the stack.
    mov QWORD [rbp-0x20], 0x0               ; char new_array[20]
    mov QWORD [rbp-0x18], 0x0               ; Clear value
    mov DWORD [rbp-0x10], 0x0               ; Clear value

    lea rsi, [rbp-0x20]                     ; Get user input here
    sub rsp, 0x8
    lea rdi, [format3]
    xor rax, rax
    call scanf

    add rsp, 0x8
    mov edx, DWORD [rbp-0x44]               ; Prep length   | Length of char array[20]
    lea rsi, [rbp-0x40]                     ; Prep entangle | char array[20]
    lea rdi, [rbp-0x20]                     ; Prep entangle | char new_array[20]
    call entangle

    xor rdi, rdi                            ; Epilogue
    mov edi, 0x100                          ; Epilogue
    call exit                               ; Epilogue