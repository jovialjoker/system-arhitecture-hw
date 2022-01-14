.data
    sir: .space 512
    spatiu: .asciz " "
    cuvant: .space 4
    formatPrintf: .asciz "%d\n"
    x: .space 4
.text
.global main

main:
    pushl $sir
    call gets
    popl %ebx

et_strtok:
    pushl $spatiu
    pushl $sir
    call strtok
    popl %ebx
    popl %ebx

    movl %eax, cuvant

    pushl cuvant
    call atoi
    popl %ebx
    movl %eax, x

    pushl x

et_for:
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx

    cmp $0, %eax
    je et_afis

verificare_operatii:
    movl %eax, cuvant
    movl cuvant, %edi
    xorl %ecx, %ecx
    movb (%edi, %ecx, 1), %al
    cmp $97, %al
    je et_add
    cmp $100, %al
    je et_div
    cmp $109, %al
    je et_mul
    cmp $115, %al
    je et_sub

call_atoi:
    pushl cuvant
    call atoi
    popl %ebx
    movl %eax, x
    pushl x

    jmp et_for

et_add:
    popl %eax
    popl %ebx
    addl %ebx, %eax
    pushl %eax
    jmp et_for

et_sub:
    popl %eax
    popl %ebx
    subl %eax, %ebx
    pushl %ebx
    jmp et_for

et_mul:
    popl %eax
    popl %ebx
    mull %ebx
    pushl %eax
    jmp et_for

et_div:
    popl %ebx
    popl %eax
    xorl %edx, %edx
    divl %ebx
    pushl %eax
    jmp et_for

et_afis:
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80