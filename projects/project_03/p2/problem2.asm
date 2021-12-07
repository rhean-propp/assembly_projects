extern printf
extern exit
global _start

section .text
_start:
    push rbp
    mov rbp,rsp
    sub rsp,0x10
    mov DWORD [rbp-0x10],0x3c; 60
    mov DWORD [rbp-0xc],0xaa ; 170
    mov DWORD [rbp-0x8],0x36 ; 54   
    mov DWORD [rbp-0x4],0xc8 ; 200
    mov edx, DWORD [rbp-0x10] ; 60
    mov ecx, DWORD [rbp-0x8]  ; 54
    mov eax, DWORD [rbp-0xc]  ; 170
    mov esi, ecx ; 54
    mov edi,eax ; 170
    call additup
                     
    mov DWORD [rbp-0x4], eax        ; ret resumes here
    mov edx, DWORD [rbp-0x4]
    mov esi, eax
    mov rdi, format1
    mov eax, 0x0
    call printf
    mov edi,0xa
    call exit

additup:
    ;and esp, 0xFFFFFFF0            ; This line is causing a seg fault.
    push rbp
    mov rbp, rsp                    ;
    sub rsp, 0x20
    mov DWORD [rbp-0x14], edi       ; 170
    mov DWORD [rbp-0x18], esi       ; 54
    mov DWORD [rbp-0x1c], edx       ; 60
    mov eax, DWORD [rbp-0x14]   ; 170---        // load
    and eax, 0xa                ; 10---         // and
    mov edx, eax                ; 10---         // load
    mov eax, DWORD [rbp-0x18]   ; 54---         // load
    and eax , 0x14              ; 20---         // and
    or edx , eax                ; 30---         // or
    mov eax, DWORD [rbp-0x1c]   ; 60---         // load
    and eax , 0x28              ; 40---         // and  a & 40
    add eax, edx                ; 70---         // ADD
    leave
    ret                 ; This ret instruction was placed here to execute the remainder of the code in the correct order.

section .data
    format1 db "My answer is >> Dec: %d Hex: %#x", 0xa, 0x0