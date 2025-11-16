	.file	"dsa.c"
	.intel_syntax noprefix
	.text
	.globl	insertQueue
	.def	insertQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	insertQueue
insertQueue:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	eax, ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	BYTE PTR 16[rbp], al
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L2
	mov	ecx, 24
	call	malloc
	mov	rdx, rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rdx]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rdx]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	edx, BYTE PTR 16[rbp]
	mov	BYTE PTR [rax], dl
	jmp	.L4
.L2:
	mov	ecx, 24
	call	malloc
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	movzx	edx, BYTE PTR 16[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR 16[rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
.L4:
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	printQueue
	.def	printQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	printQueue
printQueue:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	je	.L9
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR -8[rbp], rax
.L8:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	ecx, eax
	call	putchar
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR 16[rbp]
	jne	.L8
	mov	ecx, 10
	call	putchar
	jmp	.L5
.L9:
	nop
.L5:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	popQueue
	.def	popQueue;	.scl	2;	.type	32;	.endef
	.seh_proc	popQueue
popQueue:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L11
	mov	eax, 0
	jmp	.L12
.L11:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -1[rbp], al
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	cmp	rdx, rax
	jne	.L13
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], 0
	jmp	.L14
.L13:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rdx]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 16[rdx]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	free
.L14:
	movzx	eax, BYTE PTR -1[rbp]
.L12:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	traverseTree
	.def	traverseTree;	.scl	2;	.type	32;	.endef
	.seh_proc	traverseTree
traverseTree:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	strlen
	mov	DWORD PTR -16[rbp], eax
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L16
.L20:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 46
	jne	.L17
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L18
.L17:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L22
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L18
.L22:
	nop
.L18:
	add	DWORD PTR -12[rbp], 1
.L16:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L20
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR 24[rax]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	insertTree
	.def	insertTree;	.scl	2;	.type	32;	.endef
	.seh_proc	insertTree
insertTree:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	eax, ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	mov	BYTE PTR 16[rbp], al
	cmp	BYTE PTR 16[rbp], 32
	jne	.L24
	mov	BYTE PTR 16[rbp], 32
.L24:
	mov	edx, DWORD PTR 32[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	giveAddress
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR 32[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 46
	jne	.L25
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	QWORD PTR -8[rbp], rax
	jmp	.L26
.L25:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 16
	mov	QWORD PTR -8[rbp], rax
.L26:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L27
	mov	eax, DWORD PTR 32[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	createNode
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rdx], rax
.L27:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	edx, BYTE PTR 16[rbp]
	mov	BYTE PTR 24[rax], dl
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "' ' (space)\0"
.LC1:
	.ascii "%c\12\0"
	.text
	.globl	printDataPreOrder
	.def	printDataPreOrder;	.scl	2;	.type	32;	.endef
	.seh_proc	printDataPreOrder
printDataPreOrder:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	je	.L34
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	test	al, al
	je	.L32
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	cmp	al, 32
	jne	.L33
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	puts
	jmp	.L32
.L33:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	movsx	eax, al
	lea	rcx, .LC1[rip]
	mov	edx, eax
	call	printf
.L32:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rcx, rax
	call	printDataPreOrder
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rcx, rax
	call	printDataPreOrder
	jmp	.L29
.L34:
	nop
.L29:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	printDataInOrder
	.def	printDataInOrder;	.scl	2;	.type	32;	.endef
	.seh_proc	printDataInOrder
printDataInOrder:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	je	.L40
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rcx, rax
	call	printDataInOrder
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	test	al, al
	je	.L38
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	cmp	al, 32
	jne	.L39
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	puts
	jmp	.L38
.L39:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR 24[rax]
	movsx	eax, al
	lea	rcx, .LC1[rip]
	mov	edx, eax
	call	printf
.L38:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rcx, rax
	call	printDataInOrder
	jmp	.L35
.L40:
	nop
.L35:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Memory allocation failed in pushStack\12\0"
	.text
	.globl	pushStack
	.def	pushStack;	.scl	2;	.type	32;	.endef
	.seh_proc	pushStack
pushStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	eax, ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	BYTE PTR 16[rbp], al
	mov	ecx, 16
	call	malloc
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L42
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC2[rip]
	mov	r9, rdx
	mov	r8d, 38
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 1
	call	exit
.L42:
	mov	rax, QWORD PTR -8[rbp]
	movzx	edx, BYTE PTR 16[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "Stack underflow in popStack\12\0"
	.text
	.globl	popStack
	.def	popStack;	.scl	2;	.type	32;	.endef
	.seh_proc	popStack
popStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L44
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC3[rip]
	mov	r9, rdx
	mov	r8d, 28
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L44:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	free
	movzx	eax, BYTE PTR -9[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "Stack is empty in peekStack\12\0"
	.text
	.globl	peekStack
	.def	peekStack;	.scl	2;	.type	32;	.endef
	.seh_proc	peekStack
peekStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	jne	.L47
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC4[rip]
	mov	r9, rdx
	mov	r8d, 28
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L47:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR [rax]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	isStackEmpty
	.def	isStackEmpty;	.scl	2;	.type	32;	.endef
	.seh_proc	isStackEmpty
isStackEmpty:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	sete	al
	movzx	eax, al
	pop	rbp
	ret
	.seh_endproc
	.globl	clearStack
	.def	clearStack;	.scl	2;	.type	32;	.endef
	.seh_proc	clearStack
clearStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	jmp	.L52
.L53:
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	popStack
.L52:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	isStackEmpty
	test	eax, eax
	je	.L53
	nop
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	stackSize
	.def	stackSize;	.scl	2;	.type	32;	.endef
	.seh_proc	stackSize
stackSize:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L55
.L56:
	add	DWORD PTR -4[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR 16[rbp], rax
.L55:
	cmp	QWORD PTR 16[rbp], 0
	jne	.L56
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "Stack is empty in printStack\12\0"
.LC6:
	.ascii "%c \0"
	.text
	.globl	printStack
	.def	printStack;	.scl	2;	.type	32;	.endef
	.seh_proc	printStack
printStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	jne	.L59
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	r9, rdx
	mov	r8d, 29
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L59:
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L60
.L61:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	lea	rcx, .LC6[rip]
	mov	edx, eax
	call	printf
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
.L60:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L61
	mov	ecx, 10
	call	putchar
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Stack is empty in reverseStack\12\0"
	.text
	.globl	reverseStack
	.def	reverseStack;	.scl	2;	.type	32;	.endef
	.seh_proc	reverseStack
reverseStack:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L63
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC7[rip]
	mov	r9, rdx
	mov	r8d, 31
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L63:
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	jmp	.L64
.L65:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -16[rbp], rax
.L64:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L65
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Stack is empty in duplicateTop\12\0"
	.text
	.globl	duplicateTop
	.def	duplicateTop;	.scl	2;	.type	32;	.endef
	.seh_proc	duplicateTop
duplicateTop:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L67
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	r9, rdx
	mov	r8d, 31
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L67:
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rdx, QWORD PTR 16[rbp]
	mov	ecx, eax
	call	pushStack
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Stack is empty in stackToString\12\0"
	.align 8
.LC10:
	.ascii "Memory allocation failed in stackToString\12\0"
	.text
	.globl	stackToString
	.def	stackToString;	.scl	2;	.type	32;	.endef
	.seh_proc	stackToString
stackToString:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	cmp	QWORD PTR 16[rbp], 0
	jne	.L69
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC9[rip]
	mov	r9, rdx
	mov	r8d, 32
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L69:
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	stackSize
	mov	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	add	eax, 1
	cdqe
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L70
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC10[rip]
	mov	r9, rdx
	mov	r8d, 42
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 1
	call	exit
.L70:
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L71
.L72:
	mov	eax, DWORD PTR -12[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -12[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
.L71:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L72
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Invalid string in pushMultiple\12\0"
	.text
	.globl	pushMultiple
	.def	pushMultiple;	.scl	2;	.type	32;	.endef
	.seh_proc	pushMultiple
pushMultiple:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	cmp	QWORD PTR 24[rbp], 0
	jne	.L75
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC11[rip]
	mov	r9, rdx
	mov	r8d, 31
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 4
	call	exit
.L75:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L76
.L77:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rdx, QWORD PTR 16[rbp]
	mov	ecx, eax
	call	pushStack
	add	DWORD PTR -4[rbp], 1
.L76:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L77
	nop
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	giveAddress;	.scl	2;	.type	32;	.endef
	.def	createNode;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.treeHead, "dr"
	.p2align	3, 0
	.globl	.refptr.treeHead
	.linkonce	discard
.refptr.treeHead:
	.quad	treeHead
