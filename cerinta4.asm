.data
    x: .space 512
    sir: .space 512
    nume: .space 4
    nr_linii: .space 4
    nr_col: .space 4
    i: .long 0
    j: .long 0
    elemente: .space 4
    index: .long 0
    spatiu: .asciz " "
    operand: .space 4
    formatprintf: .asciz "%d "
    formatprintfn: .asciz "-%d "
    formatsprinf: .asciz "%d"
    str_op: .space 4
    aux: .space 4
    terminator: .asciz "\n"
    cuvant: .space 4
.text
.global main

main:
    lea x, %edi
    pushl $sir
    call gets
    popl %ebx

    pushl $spatiu
    pushl $sir
    call strtok
    popl %ebx
    popl %ebx
    movl %eax, nume

    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    pushl %eax
    call atoi
    popl %ebx
    movl %eax, nr_linii
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    pushl %eax
    call atoi
    popl %ebx
    movl %eax, nr_col
    movl nr_linii, %eax
    mull nr_col
    movl %eax, elemente
    xorl %ecx, %ecx
et_forcitire1:
    cmp elemente, %ecx
    je operatie
    pushl %ecx
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    pushl %eax
    call atoi
    popl %ebx
    popl %ecx
    movl %eax, (%edi, %ecx, 4)
    incl %ecx
    jmp et_forcitire1

operatie:
    movl elemente, %eax
    //pt let
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    //pt operand
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    movl %eax, cuvant
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $114, %al
    je et_rot90

    pushl cuvant
    call atoi
    popl %ebx
    movl %eax, operand
    //pt operatie
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $97, %al
    je et_add
    cmp $100, %al
    je et_div
    cmp $109, %al
    je et_mul
    cmp $115, %al
    je et_sub

et_add:
    cmp elemente, %ecx
    je afis
    movl operand, %eax
    addl %eax, (%edi, %ecx, 4)
    incl %ecx
    jmp et_add
et_sub:
    cmp elemente, %ecx
    je afis
    movl operand, %eax
    subl %eax, (%edi, %ecx, 4)
    incl %ecx
    jmp et_sub
et_mul:
    cmp elemente, %ecx
    je afis
    movl operand, %ebx
    movl (%edi, %ecx, 4), %eax
    mull %ebx
    movl %eax, (%edi, %ecx, 4)
    incl %ecx
    jmp et_mul

et_div:
    pushl nr_linii
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    pushl nr_col
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    pushl operand
    pushl $formatsprinf
    pushl $str_op
    call sprintf
    popl %ebx
    popl %ebx
    popl %ebx
    movl $str_op, %eax
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $45, %al
    je operand_neg
    jmp operand_pos
operand_neg:
    movl operand, %eax
    subl operand, %eax
    subl operand, %eax
    movl %eax, operand
    xorl %ecx, %ecx
for_n:
    cmp elemente, %ecx
    je et_exit
    movl (%edi, %ecx, 4), %eax
    pushl %ecx
    pushl %eax
    pushl $formatsprinf
    pushl $str_op
    call sprintf
    popl %ebx
    popl %ebx
    popl %ebx
    movl $str_op, %eax
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $45, %al
    je el_p
    popl %ecx
    xorl %edx, %edx
    movl (%edi, %ecx, 4), %eax
    divl operand
    movl %eax, (%edi, %ecx, 4)
    pushl %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintfn
    call printf
    popl %ebx
    popl %ebx
    popl %ecx
cont1: 
    incl %ecx
    jmp for_n
el_p:
    popl %ecx
    movl (%edi, %ecx, 4), %eax
    subl (%edi, %ecx, 4), %eax
    subl (%edi, %ecx, 4), %eax
    movl %eax, (%edi, %ecx, 4)
    xorl %edx, %edx
    movl (%edi, %ecx, 4), %eax
    divl operand
    movl %eax, (%edi, %ecx, 4)
    pushl %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    popl %ecx
    jmp cont1
operand_pos:
    cmp elemente, %ecx
    je et_exit
    movl (%edi, %ecx, 4), %eax
    pushl %ecx
    pushl %eax
    pushl $formatsprinf
    pushl $str_op
    call sprintf
    popl %ebx
    popl %ebx
    popl %ebx
    movl $str_op, %eax
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $45, %al
    je el_n
    popl %ecx
    xorl %edx, %edx
    movl (%edi, %ecx, 4), %eax
    divl operand
    movl %eax, (%edi, %ecx, 4)
    pushl %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    popl %ecx
cont2: 
    incl %ecx
    jmp operand_pos
el_n:
    popl %ecx
    movl (%edi, %ecx, 4), %eax
    subl (%edi, %ecx, 4), %eax
    subl (%edi, %ecx, 4), %eax
    movl %eax, (%edi, %ecx, 4)
    xorl %edx, %edx
    movl (%edi, %ecx, 4), %eax
    divl operand
    movl %eax, (%edi, %ecx, 4)
    pushl %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintfn
    call printf
    popl %ebx
    popl %ebx
    popl %ecx
    jmp cont2
afis:
    pushl nr_linii
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    pushl nr_col
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    xorl %ecx, %ecx
afis_for:
    cmp elemente, %ecx
    je et_exit
    pushl %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    popl %ecx
    incl %ecx
    jmp afis_for
et_rot90:
    pushl nr_col
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    pushl nr_linii
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    movl nr_linii, %eax
    subl $1, %eax
    movl %eax, aux
    xorl %ecx, %ecx
    movl %ecx, i
forr1:
    cmp nr_col, %ecx
    je et_exit
    movl %ecx, i
    movl aux, %ecx
    movl %ecx, j
    forr2:
    movl j, %ecx
    movl j, %eax
    mull nr_col
    addl i, %eax
    movl %eax, %ecx
    pushl (%edi, %ecx, 4)
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
    movl j, %ecx
    cmp $0, %ecx
    je contr
    subl $1, %ecx
    movl %ecx, j
    jmp forr2
contr:
    movl i, %ecx
    incl %ecx
    jmp forr1
et_exit:
    pushl $0
    call fflush
    popl %ebx
    movl $4, %eax
    movl $1, %ebx
    mov $terminator, %ecx
    movl $2, %edx
    int $0x80
    movl $1,%eax
    xorl %ebx, %ebx
    int $0x80