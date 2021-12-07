global _start
    extern printf                   ;                           ; external function call
    extern exit                     ;                           ; external function call
    extern scanf

section .data
    format: db '%d', 10, 0          ; [ FUNCTION PARAMETER ]    ; data byte     ; 10 = new line, 0 = NULL
    title: db 10, 'Fib Numbers', 10,0   ; [ FUNCTION PAREMETER ]    ; 10 = new line, 0 = NULL
    instr: db 'Please enter a number: ', 0       ; Used to pass to print call
    specifier: db '%d', 0

section .bss
    input: resb 1                   ; Allocates 1 byte

section .text
_start:
        push rbp                    ; [ PROLOGUE ]              ; push rbp onto the stack
        mov rbp, rsp                ; [ PROLOGUE ]              ; copy the value of rsp to rbp
        sub rsp, 8                  ; [ PROLOGUE ]              ; subtract 8 from the rsp register

        mov rdi, instr              ;
        push rdi                    ;
        xor rax, rax                ;
        call printf                 ;                           ; Prints: Please enter a number

        lea rdi, [specifier]          
        lea rsi, [input]
        push rdi                    ; Put rdi in the stack for scanf to use.
        xor rax, rax                ; Clear the rax register
        call scanf

        mov rdi, title              ; [ FUNCTION PARAMETER ]    ; copy the value of title into the rdi register
        push rdi                    ;                           ; push the address of rdi onto the stack
        xor rax, rax                ;                           ; clear the rax register
        call printf                 ;                           ; call the external printf function
        mov rcx, [input]            ; [ COUNTER ]               ; copy the value 10 into the rcx register
        mov rax, 0                  ; [ X Variable ]            ; copy the value 0 into the rax register            
        mov rbx, 1                  ; [ Y Variable ]            ; copy the value 1 into the rbx register

loop1:
        push rax                    ;                           ; push rax onto the stack
        push rcx                    ;                           ; push rcx onto the stack
        mov rdi, format             ; [ FUNCTION PARAMETER ]    ; move the data in format into the rdi register
        mov rsi, rax                ;                           ; copies the value in rax to the rsi register      ; rax stays the same        
        xor rax, rax                ;                           ; clear the rax register after the copy
        call printf                 ;                           ; call the external printf function [pass the variables from the registers: ]
        pop rcx                     ;                           ; pop rxc off the stack.
        pop rax                     ;                           ; pop rax off the stack.
        mov rdx, rax                ;                           ; Mov the value in rdx into rax
        mov rax, rbx                ; [ X = Y ]                 ; move the value in rbx into rax.
        add rbx, rdx                ;                           ; Add rdx to rbx and update rbx
        dec rcx                     ; [ LOOP CONTROL ]          ; Sets the ZF flag to 0 if c is 0   ; Decrement the c variable by 1 ;
        jne loop1                   ; [ LOOP JUMP ]             ; Jump if ZF flag is != 0       ; If rxc == 0, dont jump
        pop rbx                     ; [ EPILOGUE ]              ; pop rbx off the stack
        add rsp, 8                  ; [ EPILOGUE ]              ; add 8 to the value in rsp register.
        mov rsp, rbp                ; [ EPILOGUE ]              ; copy the value from the rbp register to the rsp register
        pop rbp                     ; [ EPILOGUE ]              ; ]op rbp off the stack
        call exit                   ; [ EPILOGUE ]              ; call the exit function to close the program