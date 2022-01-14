.data
    v:.space 100
    n:.space 4
    formatscanf: .asciz "%d"
    formatprinf: .asciz "%d\n"
    x:.space 4
    left:.space 4
    right:.space 4
    doi: .long 2
.text
.global main
binarysearch:
    pushl %ebp
    movl %esp, %ebp
    pushl %edi
    pushl %ebx
    movl $v, %edi
    movl 12(%ebp), %eax #left
    movl %eax, left
    movl 16(%ebp), %edx #right
    movl %edx, right
    cmp %edx, %eax
    jl bs
    movl $-1, %eax
    jmp binarysearch_exit

bs:
    addl %edx, %eax
    xorl %edx, %edx
    divl doi
    
    movl (%edi, %eax, 4), %ebx
    cmp x, %ebx
    je binarysearch_exit
    cmp x, %ebx
    jg bs_st
    pushl x
    pushl right
    pushl %eax
    pushl v
    call binarysearch
    popl %ebx
    popl %ebx
    popl %ebx
    popl %ebx
    jmp binarysearch_exit
bs_st:
    pushl x
    pushl %eax
    pushl left
    pushl v
    call binarysearch
    popl %ebx
    popl %ebx
    popl %ebx
    popl %ebx
    
binarysearch_exit:
    popl %ebx
    popl %edi
    popl %ebp
    ret
main:
    pushl $n
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx
    xorl %ecx, %ecx
    movl $v, %edi
for_citire:
    cmp n, %ecx
    je citirex
    pushl %ecx

    pushl $x
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx 

    popl %ecx
    movl x, %eax
    movl %eax, (%edi, %ecx, 4)
    incl %ecx
    jmp for_citire

citirex:
    pushl $x
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx
intrare_bs:
    movl n, %eax
    decl %eax
    movl %eax, n
    movl $v, %edi
    pushl x
    pushl n
    pushl $0
    pushl %edi
    call binarysearch
    popl %ebx
    popl %ebx
    popl %ebx
    popl %ebx
    iesire_bs:
    cmp $-1, %eax
    je nu_gasit
    afis:
        pushl %eax
        pushl $formatprinf
        call printf
        popl %ebx
        popl %ebx
        jmp et_exit
    nu_gasit:
        movl $-1, %eax
        jmp afis
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80