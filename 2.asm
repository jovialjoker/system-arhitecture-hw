.data
    formatprinf: .asciz "%s\n"
    negativ: .asciz "negativ"
    pozitiv: .asciz "pozitiv"
    zero: .asciz "zero"
.text
.global main

main:
    movl $1, %eax
    cmp $0, %eax
    je afis_zero

    cmp $0, %eax
    jl afis_negativ

    pushl $pozitiv
    pushl $formatprinf
    call printf
    popl %ebx
    popl %ebx
    jmp et_exit
afis_negativ:
    pushl $negativ
    pushl $formatprinf
    call printf
    popl %ebx
    popl %ebx
    jmp et_exit
afis_zero:
    pushl $zero
    pushl $formatprinf
    call printf
    popl %ebx
    popl %ebx
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
