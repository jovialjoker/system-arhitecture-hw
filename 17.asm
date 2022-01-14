.data
    v: .long 1245, 342, 543523, 342, 4234, 1245, 543523
    n: .long 6

.text
.global main

main:
    movl n, %ecx
    movl $v, %edi
    movl (%edi, %ecx, 4), %eax
    decl %ecx
for_loop:
    xorl (%edi, %ecx, 4), %eax
    loop for_loop
    xorl (%edi, %ecx, 4), %eax
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
