.data
    m: .space 4
    n: .space 4
    x: .space 4
    v: .space 481
    fr: .space 481
    formatscanf: .asciz "%d"
    trein: .space 4
    formatprintf: .asciz "%d "
    formatprintfs: .asciz "%s"
    trei: .long 3
    terminator: .asciz "\n"
    nplus1: .space 4
    poz: .long 0
    aux1: .space 4
    aux2: .space 4
    ok: .long 1
.text
.global main

main:
    pushl $n
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx
    movl n, %eax
    mull trei
    movl %eax, trein
    movl n, %eax
    addl $1, %eax 
    movl %eax, nplus1
    pushl $m
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx
    xorl %ecx, %ecx
    movl $v, %edi
    movl $fr, %esi
citire_vector:
    cmp trein, %ecx
    je intrare_bt

    pushl %ecx
    pushl $x
    pushl $formatscanf
    call scanf
    popl %ebx
    popl %ebx
    popl %ecx
    
    movl x, %eax
    movl %eax, (%edi, %ecx, 4)
    movl (%esi, %eax, 4), %edx
    incl %edx
    movl %edx, (%esi, %eax, 4)

    incl %ecx
    jmp citire_vector

intrare_bt:
    pushl poz
    call btrack
    popl %ebx
    jmp e_solutie

btrack:
    pregatire_stiva:
        pushl %ebp
        movl %esp, %ebp
        pushl %ebx
        pushl %edi
        pushl %esi
    instructiuni:
        movl 8(%ebp), %eax
        movl %eax, poz
        movl $v, %edi
        movl $fr, %esi
        movl poz, %ecx
        cmp $0, (%edi, %ecx, 4)
        jne verificare
        movl $1, %ecx
        jmp for_bt
        verificare:
            movl trein, %eax
            subl $1, %eax
            cmp poz, %eax
            je apelare_afis
            jmp cont
            apelare_afis:
                call afis 
                jmp bt_exit
            cont:
                incl %ecx
                pushl %ecx
                call btrack
                popl %ebx
                jmp bt_exit
            
        for_bt:
            cmp nplus1, %ecx
            je bt_exit
            pushl poz
            pushl %ecx
            //apelare procedura de conditie
            pushl %ecx
            pushl poz
            call conditie
            popl %ebx
            popl %ebx
            popl %ecx
            popl poz
            a:
            cmp $0, %eax
            je for_bt_cont
            //salvam valorile actuale din vectori pentru a le restaura dupa apelul recursiv al bt-ului
            movl poz, %edx
            movl (%edi, %edx, 4), %eax
            movl %eax, aux1
            movl (%esi, %ecx, 4), %eax 
            movl %eax, aux2
            movl %ecx, (%edi, %edx, 4)
            movl (%esi, %ecx, 4), %eax
            incl %eax
            movl %eax, (%esi, %ecx, 4)

            movl trein, %eax
            subl $1, %eax
            cmp poz, %eax
            je apelare_afis_2
            jmp poz_urm
            apelare_afis_2:
                call afis 
                jmp bt_exit
            //apelam procedura pt pozitia poz+1
            poz_urm:
                pushl %ecx
                movl poz, %ecx
                incl %ecx
                pushl %ecx
                call btrack
                popl %ebx
                popl %ecx
                //restauram valorile in vectori
                movl 8(%ebp), %eax
                movl %eax, poz
                movl poz, %edx
                movl (%edi, %edx, 4), %ebx
                
                movl $fr, %esi
                movl aux2, %eax
                movl %eax, (%esi, %ebx, 4)
                movl aux1, %eax
                movl %eax, (%edi, %edx, 4)

        for_bt_cont:
            incl %ecx
            jmp for_bt


bt_exit:
    popl %esi 
	popl %edi
	popl %ebx
	popl %ebp 
    ret

conditie:
    //initializare stiva
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %edi
    pushl %esi
    movl 8(%ebp), %eax
    movl %eax, poz
    movl 12(%ebp), %eax
    movl %eax, x
    movl $v, %edi
    movl $fr, %esi
    if:
        movl (%esi, %eax, 4), %ebx
        cmp $3, %ebx
        jne else
        movl $0, %eax
        jmp conditie_exit
    else:
        movl $1, %eax 
        movl poz, %ecx
        incl %ecx
        movl poz, %edx
        addl m, %edx 
        while_dr:
            cmp $0, %eax
            je conditie_exit
            cmp %ecx, %edx
            jl change_i
            cmp trein, %ecx
            jg change_i

            movl (%edi, %ecx, 4), %ebx
            cmp x, %ebx
            jne while_dr_cont
            xorl %eax, %eax
            jmp conditie_exit
            while_dr_cont:
                incl %ecx
                jmp while_dr
        
        change_i:
            movl poz, %ecx
            subl $1, %ecx
            movl poz, %edx
            subl m, %edx
            while_st:
                cmp $0, %eax
                je conditie_exit
                cmp %ecx, %edx
                jg conditie_exit
                cmp $0, %ecx
                jl conditie_exit
                movl (%edi, %ecx, 4), %ebx
                cmp x, %ebx
                jne while_st_cont
                xorl %eax, %eax
                jmp conditie_exit
                while_st_cont:
                    subl $1, %ecx
                    jmp while_st

conditie_exit:
    popl %esi 
	popl %edi
	popl %ebx
	popl %ebp 
    ret

afis:
    pushl %edi
    movl $v, %edi
    xorl %ecx, %ecx
    afis_for:
        cmp trein, %ecx
        je afis_exit

        pushl %ecx
        pushl (%edi, %ecx, 4)
        pushl $formatprintf
        call printf
        popl %ebx
        popl %ebx
        popl %ecx
        incl %ecx
        jmp afis_for
afis_exit:
    xorl %edx, %edx
    movl %edx, n
    movl %edx, ok
    movl trein, %edx
    incl %edx
    movl %edx, m
    popl %edi
    ret

e_solutie:
    movl ok, %eax
    cmp $0, %eax
    je et_exit
    pushl $-1
    pushl $formatprintf
    call printf
    popl %ebx
    popl %ebx
et_exit:
    pushl $terminator
    pushl $formatprintfs
    call printf
    popl %ebx
    popl %ebx
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80

