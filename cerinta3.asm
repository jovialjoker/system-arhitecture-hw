.data
    formatPrintf:.asciz "%d\n"
    sir: .space 512
    vector: .space 2048
    cuvant: .space 4
    spatiu: .asciz " "
    contor: .long 0
    na: .long 0
    nb: .long 0
    nc: .long 0
    nd: .long 0
    ne: .long 0
    nf: .long 0
    ng: .long 0
    nh: .long 0
    ni: .long 0
    nj: .long 0
    nk: .long 0
    nl: .long 0
    nm: .long 0
    nn: .long 0
    no: .long 0
    np: .long 0
    nq: .long 0
    nr: .long 0
    ns: .long 0
    nt: .long 0
    nu: .long 0
    nv: .long 0
    nw: .long 0
    nx: .long 0
    ny: .long 0
    nz: .long 0
    sdiv: .asciz "div"
    slet: .asciz "let"
    sadd: .asciz "add"
    smul: .asciz "mul"
    ssub: .asciz "sub"
    aux: .space 4
    auy: .space 4
.text

.global main

main:
    pushl $sir
    call gets
    popl %ebx

    pushl $spatiu
    pushl $sir
    call strtok
    popl %ebx
    popl %ebx
    movl %eax, cuvant
    pushl cuvant
et_for:
    pushl $spatiu
    pushl $0
    call strtok
    popl %ebx
    popl %ebx
b1:
    cmp $0, %eax
    je et_part2
    movl $1, %edx
    addl %edx, contor
    movl %eax, cuvant
    pushl cuvant
comparare:
    pushl %eax
    pushl $slet
    call strcmp
    popl %ebx
    popl %ebx
    cmp $0, %eax
    je et_let
    
    jmp et_for

et_let:
    popl %eax #il scoate pe let de pe stiva
    popl %eax
    popl %ebx
    movl %eax, aux
    movl %ebx, auy
    movl $3, %edx
    subl %edx, contor
    pushl %eax
    call atoi 
    popl %edx

    cmp $0, %eax
    je is_var
    
    movl %eax, %ebx
    movl auy, %eax
    jmp atribuire
is_var:
    pushl auy
    call atoi 
    popl %edx
    movl %eax, %ebx
    movl aux, %eax
    jmp atribuire

atribuire:
    movl %eax, %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $97, %al
    je atr_a
    cmp $98, %al
    je atr_b
    cmp $99, %al
    je atr_c
    cmp $100, %al
    je atr_d
    cmp $101, %al
    je atr_e
    cmp $102, %al
    je atr_f
    cmp $103, %al
    je atr_g
    cmp $104, %al
    je atr_h
    cmp $105, %al
    je atr_i
    cmp $106, %al
    je atr_j
    cmp $107, %al
    je atr_k
    cmp $108, %al
    je atr_l
    cmp $109, %al
    je atr_m
    cmp $110, %al
    je atr_n
    cmp $111, %al
    je atr_o
    cmp $112, %al
    je atr_p
    cmp $113, %al
    je atr_q
    cmp $114, %al
    je atr_r
    cmp $115, %al
    je atr_s
    cmp $116, %al
    je atr_t
    cmp $117, %al
    je atr_u
    cmp $118, %al
    je atr_v
    cmp $119, %al
    je atr_w
    cmp $120, %al
    je atr_x
    cmp $121, %al
    je atr_y
    cmp $122, %al
    je atr_z
atr_a:
    addl %ebx, na
    jmp et_for
atr_b:
    addl %ebx, nb
    jmp et_for
atr_c:
    addl %ebx, nc
    jmp et_for
atr_d:
    addl %ebx, nd
    jmp et_for
atr_e:
    addl %ebx, ne
    jmp et_for
atr_f:
    addl %ebx, nf
    jmp et_for
atr_g:
    addl %ebx, ng
    jmp et_for
atr_h:
    addl %ebx, nh
    jmp et_for
atr_i:
    addl %ebx, ni
    jmp et_for
atr_j:
    addl %ebx, nj
    jmp et_for
atr_k:
    addl %ebx, nk
    jmp et_for
atr_l:
    addl %ebx, nl
    jmp et_for
atr_m:
    addl %ebx, nm
    jmp et_for
atr_n:
    addl %ebx, nn
    jmp et_for
atr_o:
    addl %ebx, no
    jmp et_for
atr_p:
    addl %ebx, np
    jmp et_for
atr_q:
    addl %ebx, nq
    jmp et_for
atr_r:
    addl %ebx, nr
    jmp et_for
atr_s:
    addl %ebx, ns
    jmp et_for
atr_t:
    addl %ebx, nt
    jmp et_for
atr_u:
    addl %ebx, nu
    jmp et_for
atr_v:
    addl %ebx, nv
    jmp et_for
atr_w:
    addl %ebx, nw
    jmp et_for
atr_x:
    addl %ebx, nx
    jmp et_for
atr_y:
    addl %ebx, ny
    jmp et_for
atr_z:
    addl %ebx, nz
    jmp et_for

et_part2:
    //facem un vector in care vor pune de la sf la inceput ce avem pe stiva
    movl contor, %ecx
    lea vector, %edi
et_for2:
    popl %eax
    movl %eax, (%edi, %ecx, 4)
    
    cmp $0, %ecx 
    je inceput_prbl

    movl $1, %edx
    subl %edx, %ecx
    jmp et_for2

inceput_prbl:
    movl %ecx, aux

    pushl (%edi, %ecx, 4)
    call atoi
    popl %ebx

    cmp $0, %eax
    jne e_nr
    
    cmp $0, %eax
    je e_sir
    
cont:
    movl aux, %ecx
    cmp contor, %ecx
    je et_exit
    incl %ecx
    jmp inceput_prbl

e_nr:
    pushl %eax
    jmp cont
e_sir:
    movl aux, %ecx
    pushl (%edi, %ecx, 4)
    call strlen
    popl %ebx
    cmp $1, %eax
    je e_variabila
    jmp e_operatie

e_operatie:
    movl aux, %ecx
    movl (%edi, %ecx, 4), %esi
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
    popl %eax
    popl %ebx
    addl %ebx, %eax
    pushl %eax
    jmp cont

et_sub:
    popl %eax
    popl %ebx
    subl %eax, %ebx
    pushl %ebx
    jmp cont

et_mul:
    popl %eax
    popl %ebx
    mull %ebx
    pushl %eax
    jmp cont

et_div:
    popl %ebx
    popl %eax
    xorl %edx, %edx
    divl %ebx
    pushl %eax
    jmp cont

e_variabila:
    movl aux, %ecx
    movl (%edi, %ecx, 4), %esi
    xorl %ecx, %ecx
    movb (%esi, %ecx, 1), %al
    cmp $97, %al
    je inl_a
    cmp $98, %al
    je inl_b
    cmp $99, %al
    je inl_c
    cmp $100, %al
    je inl_d
    cmp $101, %al
    je inl_e
    cmp $102, %al
    je inl_f
    cmp $103, %al
    je atr_g
    cmp $104, %al
    je inl_h
    cmp $105, %al
    je inl_i
    cmp $106, %al
    je inl_j
    cmp $107, %al
    je inl_k
    cmp $108, %al
    je inl_l
    cmp $109, %al
    je inl_m
    cmp $110, %al
    je inl_n
    cmp $111, %al
    je inl_o
    cmp $112, %al
    je inl_p
    cmp $113, %al
    je inl_q
    cmp $114, %al
    je inl_r
    cmp $115, %al
    je inl_s
    cmp $116, %al
    je inl_t
    cmp $117, %al
    je inl_u
    cmp $118, %al
    je inl_v
    cmp $119, %al
    je inl_w
    cmp $120, %al
    je inl_x
    cmp $121, %al
    je inl_y
    cmp $122, %al
    je inl_z

inl_a:
    pushl na
    jmp cont
inl_b:
    pushl nb
    jmp cont
inl_c:
    pushl nc
    jmp cont
inl_d:
    pushl nd
    jmp cont
inl_e:
    pushl ne
    jmp cont
inl_f:
    pushl nf
    jmp cont
inl_g:
    pushl ng
    jmp cont
inl_h:
    pushl nh
    jmp cont
inl_i:
    pushl ni
    jmp cont
inl_j:
    pushl nj
    jmp cont
inl_k:
    pushl nk
    jmp cont
inl_l:
    pushl nl
    jmp cont
inl_m:
    pushl nm
    jmp cont
inl_n:
    pushl nn
    jmp cont
inl_o:
    pushl no
    jmp cont
inl_p:
    pushl np
    jmp cont
inl_q:
    pushl nq
    jmp cont
inl_r:
    pushl nr
    jmp cont
inl_s:
    pushl ns
    jmp cont
inl_t:
    pushl nt
    jmp cont
inl_u:
    pushl nu
    jmp cont
inl_v:
    pushl nv
    jmp cont
inl_w:
    pushl nw
    jmp cont
inl_x:
    pushl nx
    jmp cont
inl_y:
    pushl ny
    jmp cont
inl_z:
    pushl nz
    jmp cont

et_exit:
    pushl $formatPrintf
    call printf
    popl %ebx
    popl %ebx
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80