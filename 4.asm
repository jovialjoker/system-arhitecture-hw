.data

.text
.global main

main:
    movl $729, %eax
    decl %eax
    movl $1, %ecx
    shr %ecx, %eax
    movl $2, %ecx
    shr %ecx, %eax
    movl $4, %ecx
    shr %ecx, %eax
    movl $8, %ecx
    shr %ecx, %eax
    movl $16, %ecx
    shr %ecx, %eax
    incl %eax
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80