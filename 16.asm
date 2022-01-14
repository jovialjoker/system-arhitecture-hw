.data
    v: .long 1245, 342, 543523, 343, 4234, 1245, 543523
    n: .long 7
    m1: .long 999998
    m2: .long 999999

.text
.global main

main:
    xorl %ecx, %ecx
    movl $v, %edi
for:
    cmp n, %ecx
    je et_exit
    movl (%edi, %ecx, 4), %eax
    cmp m2, %eax
    jg for_incr
    cmp m1, %eax
    jle schimbare
    movl (%edi, %ecx, 4), %ebx
    movl %ebx, m2
    jmp for_incr
    schimbare:
        movl m1, %edx
        movl %edx, m2
        movl (%edi, %ecx, 4), %ebx
        movl %ebx, m1
    for_incr:
    incl %ecx
    jmp for

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
