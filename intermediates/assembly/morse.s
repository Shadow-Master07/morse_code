	.file	"morse.c"
	.intel_syntax noprefix
	.text
	.globl	treeHead
	.bss
	.align 8
treeHead:
	.space 8
	.text
	.globl	giveAddress
	.def	giveAddress;	.scl	2;	.type	32;	.endef
	.seh_proc	giveAddress
giveAddress:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	rax, QWORD PTR treeHead[rip]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L2
.L7:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 46
	jne	.L3
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	jne	.L4
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 46
	mov	rcx, rax
	call	createNode
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rdx], rax
.L4:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L5
.L3:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L5
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	jne	.L6
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, 45
	mov	rcx, rax
	call	createNode
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rdx], rax
.L6:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
.L5:
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	eax, DWORD PTR 24[rbp]
	sub	eax, 1
	cmp	DWORD PTR -12[rbp], eax
	jl	.L7
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	readFile
	.def	readFile;	.scl	2;	.type	32;	.endef
	.seh_proc	readFile
readFile:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -8[rbp], 0
	jmp	.L10
.L13:
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, 1
	cdqe
	mov	BYTE PTR -32[rbp+rax], 0
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -8[rbp], eax
	movzx	eax, BYTE PTR -32[rbp]
	mov	BYTE PTR -9[rbp], al
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -4[rbp]
	add	eax, 2
	cdqe
	movzx	edx, BYTE PTR -32[rbp+rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	BYTE PTR -41[rbp+rax], dl
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L12
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	BYTE PTR -41[rbp+rax], 0
	lea	rax, -41[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -8[rbp], eax
	movsx	eax, BYTE PTR -9[rbp]
	mov	ecx, DWORD PTR -8[rbp]
	lea	rdx, -41[rbp]
	mov	r8d, ecx
	mov	ecx, eax
	call	insertTree
.L10:
	mov	rdx, QWORD PTR 16[rbp]
	lea	rax, -32[rbp]
	mov	r8, rdx
	mov	edx, 10
	mov	rcx, rax
	call	fgets
	test	rax, rax
	jne	.L13
	nop
	nop
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	call	__main
	mov	rdx, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 16[rbp]
	mov	ecx, eax
	call	cliParser
	mov	eax, 0
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	createNode;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	insertTree;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	cliParser;	.scl	2;	.type	32;	.endef
