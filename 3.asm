.data

.text
.global main

main:
    movl $1, %eax
    movl $2, %ebx
    xorl %ebx, %eax
    xorl %eax, %ebx
    xorl %ebx, %eax
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80