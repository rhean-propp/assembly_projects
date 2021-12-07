extern printf
extern exit

global _start
funct1:
    push rbp                        ; Prologue
    mov rbp, rsp                    ; Prologue
    sub rsp, 0x10                   ; Prologue
    mov DWORD [rbp-0x4], edi        ; 0x54   | Move var2 onto the stack
    mov DWORD [rbp-0x8], esi        ; 0x1234 | Move var3 onto the stack | Size operand error | Changed RSI to ESI
    mov DWORD [rbp-0xc], edx        ; 0x2345 | Move var4 onto the stack
    mov rdi, format2                ; Load string into rdi
    xor rax, rax                    ; Clear return register
    call printf                     ; Print format string 2
    mov eax, DWORD [rbp-0x4]        ; 0x54   | Move var2 into eax
    and eax, 0xa                    ; 0x0    | var2 = var2 & 0xA
    or edx, eax                     ; 0x0    | var4 = var4 | var2 
    mov eax, DWORD [rbp-0xc]        ; 0x0    | Mov var4 into eax.              
    and eax, 0x28                   ; 0x0    | And
    add eax, edx                    ; 0x0    | 
    leave                           ; Epilogue
    ret                             ; Epilogue

funct2:
    push rbp                            ; Prologue
    mov rbp, rsp                        ; Prologue | Added line. | This line was added to prevent the seg fault
    sub rsp, 0x20                       ; Prologue
    mov QWORD [rbp-0x8], rdi            ; Loading format 3 string onto the stack.
    mov QWORD [rbp-0x10], rsi           ; *p3 | Load pointer onto the stack
    mov QWORD [rbp-0x18], rdx           ; *p4 | Load pointer onto the stack
    mov QWORD [rbp-0x20], rcx           ; *p1 | Load pointer onto the stack
    mov rax, QWORD [rbp-0x10]           ; Move a varable from the stack into rax
    mov edx, DWORD [rax]                ; Mov the variable from rax into the edx register
    mov rax, QWORD [rbp-0x18]           ; Move the varaible from th estack into rax
    mov eax, DWORD [rax]                ; Move the value in rax into eax.
    lea ecx, [rdx+rax*1]                ; Load the variable into ecx
    mov rax, QWORD [rbp-0x18]           ; Store the value on the stack into rax
    mov edx, DWORD [rax]                ; Store the value from rax into edx.
    mov rax, QWORD [rbp-0x10]           ; store the value from the stack into rax
    mov esi, DWORD [rax]                ; Store the value in rax into esi
    mov rax, QWORD [rbp-0x8]            ; Store the value from the stack into rax
    mov rdi, rax                        ; Store rax into rdi
    xor rax, rax                        ; Clear rax
    call printf                         ; Print format 3
    nop                                 ; does nothing
    leave                               ; Epilogue
    ret                                 ; Epilogue

_start:
    push rbp                            ; Prologue
    mov rbp, rsp                        ; Prologue
    sub rsp, 0x20                       ; Prologue
    xor eax, eax                        ; Clear eax
    mov rdi, format1                    ; Changed from rsi to rdi. | The wrong register was being used.
    xor rax, rax                        ; Clear rax
    call printf                         ; Print format string 1.
    mov DWORD [rbp-0x18], 0x1248        ; Declare var1
    mov DWORD [rbp-0xc], 0x54           ; Declare var2
    mov DWORD [rbp-0x14], 0x1234        ; Declare var3
    mov DWORD [rbp-0x10], 0x2345        ; Declare var4
    mov edx, DWORD [rbp-0x10]           ; Move var4 into edx
    mov ecx, DWORD [rbp-0x14]           ; Mov var3 into ecx
    mov eax, DWORD [rbp-0xc]            ; Mov var2 into eax
    mov esi, ecx                        ; Copy var3 into esi
    mov edi, eax                        ; Copy var2 into edi
    call funct1                         ; Call funct1
    mov DWORD [rbp-0x18], eax           ; 0x0 ?
    lea rcx, [rbp-0x18]                 ;           | Load address of var1 into register.       | Pointer? | *p1 = &var1
    lea rdx, [rbp-0x10]                 ;           | Load address of var4 into rdx             | Pointer? | *p4 = &var4
    lea rax, [rbp-0x14]                 ;           | Load address of var3 into rax             | Pointer? | *p3 = &var3
    mov rsi, rax                        ; Copy address of var3 into RSI.
    mov rdi, format3                    ; Load format 3 string into print
    call funct2
    mov rdi, format4
    xor rax, rax
    call printf                         ; Print format 4
    mov edi, 0x64                       ; Epilogue
    call exit                           ; Epilogue

section .data
    format1 db "Entered Main", 0xa, 0x0
    format2 db "Entered function1", 0xa, 0x0
    format3 db "First value: %#x + second val: %#x = %#x", 0xa, 0x0
    format4 db "Exiting program", 0xa, 0x0