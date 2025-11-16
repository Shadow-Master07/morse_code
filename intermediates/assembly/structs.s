	.file	"structs.c"
	.intel_syntax noprefix
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Memory allocation failed\12\0"
	.text
	.globl	createNode
	.def	createNode;	.scl	2;	.type	32;	.endef
	.seh_proc	createNode
createNode:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	eax, edx
	mov	BYTE PTR 24[rbp], al
	mov	ecx, 32
	call	malloc
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L2
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC0[rip]
	mov	r9, rdx
	mov	r8d, 25
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 1
	call	exit
.L2:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR 24[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	movzx	edx, BYTE PTR 24[rbp]
	mov	BYTE PTR 25[rax], dl
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	deleteTree
	.def	deleteTree;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteTree
deleteTree:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	je	.L7
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rcx, rax
	call	deleteTree
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rcx, rax
	call	deleteTree
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	free
	jmp	.L4
.L7:
	nop
.L4:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
