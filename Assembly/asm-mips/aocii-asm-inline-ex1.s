	.file	"aocii-asm-inline-ex1.c"
	.intel_syntax noprefix
	.text
#APP
	sum:;   pushq %rbp;   movq %rsp, %rbp;   movq 8(%rbp), %rax;   addq 12(%rbp), %rax;   movq %rbp, %rsp
   popq %rbp
   ret
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
#NO_APP
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	mov	esi, 5
	mov	edi, 14
	call	sum@PLT
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
