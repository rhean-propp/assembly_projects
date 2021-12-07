global _start
	extern printf
	extern scanf
	extern exit
section .data
	enter: db "Enter: ", 0x0
	specifier: db "%s",
section .bss
	input: resb 30
section .text
_start:
	;push rbp                    ; [ PROLOGUE ]              ; push rbp onto the stack
	;mov rbp, rsp                ; [ PROLOGUE ]              ; copy the value of rsp to rbp
	;sub rsp, 8                  ; [ PROLOGUE ]              ; subtract 8 from the rsp register
	
	mov rdi, enter              ;
	push rdi                    ;
	xor rax, rax                ;
	call printf                 ;                           ; Prints: Please enter a number

	lea rdi, [specifier]          
	lea rsi, [input]
	push rdi                    ; Put rdi in the stack for scanf to use.
	xor rax, rax                ; Clear the rax register
	call scanf

	lea rdi, [input]            ;
	push rdi                    ;
	xor rax, rax                ;
	call printf                 ;                           ; Prints: Please enter a number
	
	mov rdi, 0		; Epilogue
	xor rax, rax	; Epilogue
	call exit		; Epilogue