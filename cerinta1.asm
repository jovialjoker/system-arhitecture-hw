.data
   strhexa: .space 257
   strbin: .space 49
   formatScanf: .asciz "%s"
   formatPrintfs: .asciz "%s"
   formatPrintfd: .asciz "%d "
   formatPrintfdn: .asciz "-%d "
   indexSb2: .long 0
   let_afis: .asciz "let "
   add_afis: .asciz "add "
   sub_afis: .asciz "sub "
   mul_afis: .asciz "mul "
   div_afis: .asciz "div "
   aux: .long 0
   suma: .long 0
   afisa: .asciz "a "
   afisb: .asciz "b "
   afisc: .asciz "c "
   afisd: .asciz "d "
   afise: .asciz "e "
   afisf: .asciz "f "
   afisg: .asciz "g "
   afish: .asciz "h "
   afisi: .asciz "i "
   afisj: .asciz "j "
   afisk: .asciz "k "
   afisl: .asciz "l "
   afism: .asciz "m "
   afisn: .asciz "n "
   afiso: .asciz "o "
   afisp: .asciz "p "
   afisq: .asciz "q "
   afisr: .asciz "r "
   afiss: .asciz "s "
   afist: .asciz "t "
   afisu: .asciz "u "
   afisv: .asciz "v "
   afisw: .asciz "w "
   afisx: .asciz "x "
   afisy: .asciz "y "
   afisz: .asciz "z "
   terminator: .asciz "\n"
.text

.global main
main:
   pushl $strhexa
   pushl $formatScanf
   call scanf
   popl %ebx
   popl %ebx
   movl $strhexa, %edi
   movl $strbin, %esi
   xorl %ecx, %ecx

et_for:
   movb (%edi, %ecx, 1), %al

   cmp $0, %al
   je et_exit
   cmp $48, %al
   je chr_0
   cmp $49, %al
   je chr_1
   cmp $50, %al
   je chr_2
   cmp $51, %al
   je chr_3
   cmp $52, %al
   je chr_4
   cmp $53, %al
   je chr_5
   cmp $54, %al
   je chr_6
   cmp $55, %al
   je chr_7
   cmp $56, %al
   je chr_8
   cmp $57, %al
   je chr_9
   cmp $65, %al
   je chr_A
   cmp $66, %al
   je chr_B
   cmp $67, %al
   je chr_C
   cmp $68, %al
   je chr_D
   cmp $69, %al
   je chr_E
   cmp $70, %al
   je chr_F

cont:
   movl indexSb2, %eax
   cmp $12, %eax
   je decodare

   incl %ecx
   jmp et_for



chr_0:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
	jmp cont
chr_1:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_2:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_3:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_4:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_5:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_6:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_7:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_8:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_9:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_A:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_B:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_C:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_D:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_E:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont
chr_F:
   pushl %ecx
	
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
   movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	
	popl %ecx
   jmp cont


decodare:
   movl %ecx, %eax
   movl %eax, aux
   movl $1, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je bit0
   cmp $49, %al
   je operatie

decodare_cont:
   movl aux, %ecx
   movl $0, %eax
   movl %eax, indexSb2
   xorl %eax, %eax
   movl %eax, suma
   incl %ecx
   jmp et_for

bit0:
baza_10:
   movl $4, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_8
puterea_7:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_7  
puterea_6:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_6
puterea_5:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_5
puterea_4:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_4
puterea_3:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_3
puterea_2:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_2
puterea_1:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_1
puterea_0:
   incl %ecx
   movb (%esi, %ecx, 1), %al
   cmp $49, %al
   je sum_0
   xorl %edx, %edx
   movl suma, %eax
   movl $2, %ebx
   divl %ebx
   movl %eax, suma
   

bit0_cont:
   movl $2, %ecx
   movb (%esi, %ecx, 1), %ah
   cmp $48, %ah
   je integer
   cmp $49, %ah
   je variable
sum_8:
   movl $256, %eax
   addl %eax, suma
   jmp puterea_7
sum_7:
   movl $128, %eax
   addl %eax, suma
   jmp puterea_6
sum_6:
   movl $64, %eax
   addl %eax, suma
   jmp puterea_5
sum_5:
   movl $32, %eax
   addl %eax, suma
   jmp puterea_4
sum_4:
   movl $16, %eax
   addl %eax, suma
   jmp puterea_3
sum_3:
   movl $8, %eax
   addl %eax, suma
   jmp puterea_2
sum_2:
   movl $4, %eax
   addl %eax, suma
   jmp puterea_1
sum_1:
   movl $2, %eax
   addl %eax, suma
   jmp puterea_0
sum_0:
   movl $1, %eax
   add %eax, suma
   jmp bit0_cont

integer:
   movl $3, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je afis_pozitiv
   cmp $49, %al
   je afis_negativ
afis_pozitiv:
   pushl suma
   pushl $formatPrintfd
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_negativ:
   pushl suma
   pushl $formatPrintfdn
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

variable:
   movl suma, %eax
   cmp $97, %eax
   je afis_a
   cmp $98, %eax
   je afis_b
   cmp $99, %eax
   je afis_c
   cmp $100, %eax
   je afis_d
   cmp $101, %eax
   je afis_e
   cmp $102, %eax
   je afis_f
   cmp $103, %eax
   je afis_g
   cmp $104, %eax
   je afis_h
   cmp $105, %eax
   je afis_i
   cmp $106, %eax
   je afis_j
   cmp $107, %eax
   je afis_k
   cmp $108, %eax
   je afis_l
   cmp $109, %eax
   je afis_m
   cmp $110, %eax
   je afis_n
   cmp $111, %eax
   je afis_o
   cmp $112, %eax
   je afis_p
   cmp $113, %eax
   je afis_q
   cmp $114, %eax
   je afis_r
   cmp $115, %eax
   je afis_s
   cmp $116, %eax
   je afis_t
   cmp $117, %eax
   je afis_u
   cmp $118, %eax
   je afis_v
   cmp $119, %eax
   je afis_w
   cmp $120, %eax
   je afis_x
   cmp $121, %eax
   je afis_y
   cmp $122, %eax
   je afis_z
afis_a:
   pushl $afisa
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_b:
   pushl $afisb
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_c:
   pushl $afisc
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_d:
   pushl $afisd
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_e:
   pushl $afise
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_f:
   pushl $afisf
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_g:
   pushl $afisg
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_h:
   pushl $afish
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_i:
   pushl $afisi
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_j:
   pushl $afisj
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_k:
   pushl $afisk
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_l:
   pushl $afisl
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_m:
   pushl $afism
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_n:
   pushl $afisn
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_o:
   pushl $afiso
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_p:
   pushl $afisp
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_q:
   pushl $afisq
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_r:
   pushl $afisr
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_s:
   pushl $afiss
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_t:
   pushl $afist
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_u:
   pushl $afisu
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_v:
   pushl $afisv
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_w:
   pushl $afisw
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_x:
   pushl $afisx
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_y:
   pushl $afisy
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
afis_z:
   pushl $afisz
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont
   
operatie:
   movl $9, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je bit10
   cmp $49, %al
   je et_div

bit10:
   movl $10, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je et_let_add
   cmp $49, %al
   je et_sub_mul 

et_let_add:
   movl $11, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je et_let
   cmp $49, %al
   je et_add

et_sub_mul:
   movl $11, %ecx
   movb (%esi, %ecx, 1), %al
   cmp $48, %al
   je et_sub
   cmp $49, %al
   je et_mul

et_let:
   pushl $let_afis
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

et_add:
   pushl $add_afis
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

et_sub:
   pushl $sub_afis
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

et_mul:
   pushl $mul_afis
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

et_div:
   pushl $div_afis
   pushl $formatPrintfs
   call printf
   popl %ebx
   popl %ebx
   pushl $0
   call fflush
   popl %ebx
   jmp decodare_cont

et_exit:
   movl $4, %eax
   movl $1, %ebx
   mov $terminator, %ecx
   movl $2, %edx
   int $0x80
   movl $1, %eax
   xorl %ebx, %ebx
   int $0x80