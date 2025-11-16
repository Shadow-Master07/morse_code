	.file	"cliArgs.c"
	.intel_syntax noprefix
	.text
	.globl	readToken
	.def	readToken;	.scl	2;	.type	32;	.endef
	.seh_proc	readToken
readToken:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -4[rbp], 64
	mov	DWORD PTR -8[rbp], 0
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L9
	mov	eax, 0
	jmp	.L3
.L9:
	nop
.L5:
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR -20[rbp], eax
	cmp	DWORD PTR -20[rbp], -1
	je	.L4
	mov	eax, DWORD PTR -20[rbp]
	mov	ecx, eax
	mov	rax, QWORD PTR __imp_isspace[rip]
	call	rax
	test	eax, eax
	jne	.L5
.L4:
	cmp	DWORD PTR -20[rbp], -1
	jne	.L6
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	free
	mov	eax, 0
	jmp	.L3
.L6:
	mov	eax, DWORD PTR -8[rbp]
	add	eax, 1
	cmp	DWORD PTR -4[rbp], eax
	jg	.L7
	sal	DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	realloc
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L7
	mov	eax, 0
	jmp	.L3
.L7:
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -20[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	fgetc
	mov	DWORD PTR -20[rbp], eax
	cmp	DWORD PTR -20[rbp], -1
	je	.L8
	mov	eax, DWORD PTR -20[rbp]
	mov	ecx, eax
	mov	rax, QWORD PTR __imp_isspace[rip]
	call	rax
	test	eax, eax
	je	.L6
.L8:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -16[rbp]
.L3:
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "r\0"
.LC1:
	.ascii "morse.txt\0"
.LC2:
	.ascii "Could not open morse.txt\12\0"
.LC3:
	.ascii "File opening failed\12\0"
.LC4:
	.ascii " \0"
	.text
	.globl	runCtfMode
	.def	runCtfMode;	.scl	2;	.type	32;	.endef
	.seh_proc	runCtfMode
runCtfMode:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	lea	rdx, .LC0[rip]
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L11
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC2[rip]
	mov	r9, rdx
	mov	r8d, 25
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 2
	call	exit
.L11:
	mov	edx, 0
	mov	ecx, 0
	call	createNode
	mov	rdx, QWORD PTR .refptr.treeHead[rip]
	mov	QWORD PTR [rdx], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	readFile
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	fclose
	cmp	DWORD PTR 16[rbp], 1
	jne	.L12
	lea	rdx, .LC0[rip]
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L13
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC3[rip]
	mov	r9, rdx
	mov	r8d, 20
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 2
	call	exit
.L13:
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -32[rbp], 0
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	traverseTree
	movsx	eax, al
	lea	rdx, -40[rbp]
	mov	ecx, eax
	call	insertQueue
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	free
.L14:
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	call	readToken
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	jne	.L15
	mov	rax, QWORD PTR -40[rbp]
	mov	rcx, rax
	call	printQueue
	jmp	.L16
.L12:
	cmp	DWORD PTR 16[rbp], 0
	jne	.L16
	mov	QWORD PTR -48[rbp], 0
	lea	rdx, .LC4[rip]
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	strtok
	mov	QWORD PTR -8[rbp], rax
	jmp	.L17
.L18:
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	traverseTree
	movsx	eax, al
	lea	rdx, -48[rbp]
	mov	ecx, eax
	call	insertQueue
	lea	rax, .LC4[rip]
	mov	rdx, rax
	mov	ecx, 0
	call	strtok
	mov	QWORD PTR -8[rbp], rax
.L17:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L18
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, rax
	call	printQueue
.L16:
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	deleteTree
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	QWORD PTR [rax], 0
	nop
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Real-world Mode: Type Morse codes (e.g., .-- or -.-.), or 'exit' to quit.\0"
.LC6:
	.ascii "Morse> \0"
.LC7:
	.ascii "%s\0"
.LC8:
	.ascii "exit\0"
.LC9:
	.ascii "Character: %c\12\0"
.LC10:
	.ascii "Invalid Morse Code\0"
	.text
	.globl	runRealMode
	.def	runRealMode;	.scl	2;	.type	32;	.endef
	.seh_proc	runRealMode
runRealMode:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	lea	rdx, .LC0[rip]
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L20
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, .LC2[rip]
	mov	r9, rdx
	mov	r8d, 25
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	ecx, 2
	call	exit
.L20:
	mov	edx, 0
	mov	ecx, 0
	call	createNode
	mov	rdx, QWORD PTR .refptr.treeHead[rip]
	mov	QWORD PTR [rdx], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	call	readFile
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	call	fclose
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	puts
.L32:
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -33[rbp]
	lea	rcx, .LC7[rip]
	mov	rdx, rax
	call	scanf
	lea	rdx, .LC8[rip]
	lea	rax, -33[rbp]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	je	.L34
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 1
	mov	DWORD PTR -16[rbp], 0
	jmp	.L23
.L29:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	movzx	eax, BYTE PTR -33[rbp+rax]
	cmp	al, 46
	jne	.L24
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L25
.L24:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	movzx	eax, BYTE PTR -33[rbp+rax]
	cmp	al, 45
	jne	.L26
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L25
.L26:
	mov	DWORD PTR -12[rbp], 0
	jmp	.L27
.L25:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L28
	mov	DWORD PTR -12[rbp], 0
	jmp	.L27
.L28:
	add	DWORD PTR -16[rbp], 1
.L23:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	movzx	eax, BYTE PTR -33[rbp+rax]
	test	al, al
	jne	.L29
.L27:
	cmp	DWORD PTR -12[rbp], 0
	je	.L30
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR 24[rax]
	test	al, al
	je	.L30
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR 24[rax]
	movsx	eax, al
	lea	rcx, .LC9[rip]
	mov	edx, eax
	call	printf
	jmp	.L31
.L30:
	lea	rax, .LC10[rip]
	mov	rcx, rax
	call	puts
.L31:
	jmp	.L32
.L34:
	nop
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	deleteTree
	mov	rax, QWORD PTR .refptr.treeHead[rip]
	mov	QWORD PTR [rax], 0
	nop
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "Usage: %s --mode ctf|real\12\0"
.LC12:
	.ascii "--mode\0"
.LC13:
	.ascii "ctf\0"
.LC14:
	.ascii "real\0"
.LC15:
	.ascii "--morse\0"
.LC16:
	.ascii "--file\0"
	.align 8
.LC17:
	.ascii "Usage: %s --mode ctf|real [--morse \"<morse_string>\" | --file <filename>]\12\0"
	.align 8
.LC18:
	.ascii "Usage: %s --mode ctf|real [--morse <morse_string> | --file <filename>]\12\0"
	.text
	.globl	cliParser
	.def	cliParser;	.scl	2;	.type	32;	.endef
	.seh_proc	cliParser
cliParser:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 72
	.seh_stackalloc	72
	lea	rbp, 64[rsp]
	.seh_setframe	rbp, 64
	.seh_endprologue
	mov	DWORD PTR 32[rbp], ecx
	mov	QWORD PTR 40[rbp], rdx
	mov	DWORD PTR -4[rbp], -1
	mov	DWORD PTR -8[rbp], -1
	mov	QWORD PTR -16[rbp], 0
	cmp	DWORD PTR 32[rbp], 1
	jg	.L36
	mov	rax, QWORD PTR 40[rbp]
	mov	rbx, QWORD PTR [rax]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	lea	rax, .LC11[rip]
	mov	r8, rbx
	mov	rdx, rax
	call	fprintf
	mov	ecx, 1
	call	exit
.L36:
	mov	DWORD PTR -20[rbp], 1
	jmp	.L37
.L43:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L38
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC13[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L39
	mov	DWORD PTR -4[rbp], 0
.L39:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC14[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L40
	mov	DWORD PTR -4[rbp], 1
.L40:
	add	DWORD PTR -20[rbp], 1
.L38:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC15[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L41
	mov	DWORD PTR -8[rbp], 0
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	strlen
	add	rax, 2
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	strcpy
	add	DWORD PTR -20[rbp], 1
.L41:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC16[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L42
	mov	DWORD PTR -8[rbp], 1
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	strlen
	add	rax, 2
	mov	rcx, rax
	call	malloc
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 40[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	strcpy
	add	DWORD PTR -20[rbp], 1
.L42:
	add	DWORD PTR -20[rbp], 1
.L37:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR 32[rbp]
	jl	.L43
	cmp	DWORD PTR -4[rbp], -1
	je	.L44
	cmp	DWORD PTR -8[rbp], -1
	jne	.L45
.L44:
	mov	rax, QWORD PTR 40[rbp]
	mov	rbx, QWORD PTR [rax]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	lea	rax, .LC17[rip]
	mov	r8, rbx
	mov	rdx, rax
	call	fprintf
	mov	ecx, 4
	call	exit
.L45:
	cmp	DWORD PTR -4[rbp], 0
	jne	.L46
	mov	rdx, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	mov	ecx, eax
	call	runCtfMode
	jmp	.L47
.L46:
	cmp	DWORD PTR -4[rbp], 1
	jne	.L48
	mov	rdx, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR -8[rbp]
	mov	ecx, eax
	call	runRealMode
	jmp	.L47
.L48:
	mov	rax, QWORD PTR 40[rbp]
	mov	rbx, QWORD PTR [rax]
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	lea	rax, .LC18[rip]
	mov	r8, rbx
	mov	rdx, rax
	call	fprintf
	cmp	QWORD PTR -16[rbp], 0
	je	.L49
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	free
.L49:
	mov	ecx, 4
	call	exit
.L47:
	cmp	QWORD PTR -16[rbp], 0
	je	.L51
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	free
.L51:
	nop
	add	rsp, 72
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	createNode;	.scl	2;	.type	32;	.endef
	.def	readFile;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	traverseTree;	.scl	2;	.type	32;	.endef
	.def	insertQueue;	.scl	2;	.type	32;	.endef
	.def	printQueue;	.scl	2;	.type	32;	.endef
	.def	strtok;	.scl	2;	.type	32;	.endef
	.def	deleteTree;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.treeHead, "dr"
	.p2align	3, 0
	.globl	.refptr.treeHead
	.linkonce	discard
.refptr.treeHead:
	.quad	treeHead
