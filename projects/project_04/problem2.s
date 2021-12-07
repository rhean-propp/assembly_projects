// aarch64-linux-gnu-as -g problem2.s -o problem2.o
// aarch64-linux-gnu-ld -e main -lc -dynamic-linker /lib/ld-linux-aarch64.so.1 problem2.o -o problem2

.extern printf
.extern scanf
.extern exit

.global _start
.data
        enter: .asciz "Enter: "
        newline: .asciz "\n"
        specifier: .asciz "%s"
        storage: .space 30

.align 4
.text
_start:

        ldr x0, =[enter]
        bl printf

        ldr x0, =specifier
        ldr x1, =storage
        bl scanf

        ldr x0, =[storage]
        bl printf

        ldr x0, =[newline]
        bl printf

        mov x0, 0
        b exit