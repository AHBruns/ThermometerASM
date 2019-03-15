	.file	"thermo_update.c"
	.text
	.globl	set_temp_from_ports
	.type	set_temp_from_ports, @function
set_temp_from_ports:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movzwl	THERMO_SENSOR_PORT(%rip), %eax
	cmpw	$-1536, %ax
	jbe	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movzbl	THERMO_STATUS_PORT(%rip), %eax
	cmpb	$1, %al
	jbe	.L4
	movl	$1, %eax
	jmp	.L3
.L4:
	movzbl	THERMO_STATUS_PORT(%rip), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 2(%rax)
	movzwl	THERMO_SENSOR_PORT(%rip), %eax
	movzwl	%ax, %eax
	addl	$32, %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	subw	$500, %ax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movw	%dx, (%rax)
	movq	-8(%rbp), %rax
	movzbl	2(%rax), %eax
	cmpb	$1, %al
	jne	.L5
	movzwl	THERMO_SENSOR_PORT(%rip), %eax
	movzwl	%ax, %eax
	addl	$32, %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	leal	-500(%rax), %edx
	movl	%edx, %eax
	sall	$3, %eax
	leal	(%rax,%rdx), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addw	$320, %ax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movw	%dx, (%rax)
.L5:
	movl	$0, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	set_temp_from_ports, .-set_temp_from_ports
	.section	.rodata
.LC0:
	.string	"--"
	.text
	.globl	set_display_from_temp
	.type	set_display_from_temp, @function
set_display_from_temp:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-96(%rbp), %rax
	movl	$0, (%rax)
	movzbl	-82(%rbp), %eax
	cmpb	$1, %al
	je	.L7
	movzbl	-82(%rbp), %eax
	testb	%al, %al
	je	.L7
	movq	-96(%rbp), %rax
	movl	$-1, (%rax)
	movl	$1, %eax
	jmp	.L24
.L7:
	movzbl	-82(%rbp), %eax
	cmpb	$1, %al
	jne	.L9
	movzwl	-84(%rbp), %eax
	cmpw	$-580, %ax
	jl	.L10
	movzwl	-84(%rbp), %eax
	cmpw	$1220, %ax
	jle	.L9
.L10:
	movq	-96(%rbp), %rax
	movl	$-1, (%rax)
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L24
.L9:
	movzbl	-82(%rbp), %eax
	testb	%al, %al
	jne	.L11
	movzwl	-84(%rbp), %eax
	cmpw	$-500, %ax
	jl	.L12
	movzwl	-84(%rbp), %eax
	cmpw	$500, %ax
	jle	.L11
.L12:
	movq	-96(%rbp), %rax
	movl	$-1, (%rax)
	movl	$1, %eax
	jmp	.L24
.L11:
	movl	$0, -76(%rbp)
	movzwl	-84(%rbp), %eax
	testw	%ax, %ax
	jns	.L13
	movl	$1, -76(%rbp)
	movzwl	-84(%rbp), %eax
	negl	%eax
	movw	%ax, -84(%rbp)
.L13:
	movl	$63, -48(%rbp)
	movl	$6, -44(%rbp)
	movl	$91, -40(%rbp)
	movl	$79, -36(%rbp)
	movl	$102, -32(%rbp)
	movl	$109, -28(%rbp)
	movl	$125, -24(%rbp)
	movl	$7, -20(%rbp)
	movl	$127, -16(%rbp)
	movl	$111, -12(%rbp)
	movl	$0, -56(%rbp)
	movl	$64, -52(%rbp)
	movzwl	-84(%rbp), %eax
	movswl	%ax, %edx
	imull	$-31981, %edx, %edx
	shrl	$16, %edx
	addl	%eax, %edx
	sarw	$9, %dx
	sarw	$15, %ax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movswl	%cx, %eax
	imull	$26215, %eax, %eax
	shrl	$16, %eax
	movl	%eax, %edx
	sarw	$2, %dx
	movl	%ecx, %eax
	sarw	$15, %ax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movswl	%dx, %eax
	movl	%eax, -72(%rbp)
	movzwl	-84(%rbp), %eax
	movswl	%ax, %edx
	imull	$5243, %edx, %edx
	shrl	$16, %edx
	sarw	$3, %dx
	sarw	$15, %ax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movswl	%cx, %eax
	imull	$26215, %eax, %eax
	shrl	$16, %eax
	movl	%eax, %edx
	sarw	$2, %dx
	movl	%ecx, %eax
	sarw	$15, %ax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movswl	%dx, %eax
	movl	%eax, -68(%rbp)
	movzwl	-84(%rbp), %eax
	movswl	%ax, %edx
	imull	$26215, %edx, %edx
	shrl	$16, %edx
	sarw	$2, %dx
	sarw	$15, %ax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movswl	%cx, %eax
	imull	$26215, %eax, %eax
	shrl	$16, %eax
	movl	%eax, %edx
	sarw	$2, %dx
	movl	%ecx, %eax
	sarw	$15, %ax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movswl	%dx, %eax
	movl	%eax, -64(%rbp)
	movzwl	-84(%rbp), %ecx
	movswl	%cx, %eax
	imull	$26215, %eax, %eax
	shrl	$16, %eax
	movl	%eax, %edx
	sarw	$2, %dx
	movl	%ecx, %eax
	sarw	$15, %ax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movswl	%dx, %eax
	movl	%eax, -60(%rbp)
	movzbl	-82(%rbp), %eax
	cmpb	$1, %al
	jne	.L14
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$2, %eax
	leal	2(%rax), %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L15
.L14:
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$2, %eax
	leal	1(%rax), %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
.L15:
	cmpl	$0, -72(%rbp)
	je	.L16
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-72(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L16:
	cmpl	$0, -68(%rbp)
	je	.L18
	cmpl	$1, -76(%rbp)
	jne	.L18
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L18:
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	cmpl	$0, -68(%rbp)
	je	.L19
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-68(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L19:
	cmpl	$0, -64(%rbp)
	je	.L20
	cmpl	$1, -76(%rbp)
	jne	.L20
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L20:
	cmpl	$0, -64(%rbp)
	je	.L21
	cmpl	$0, -76(%rbp)
	jne	.L21
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L17
.L21:
	cmpl	$1, -76(%rbp)
	jne	.L22
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L23
.L22:
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
.L23:
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	sall	$7, %eax
	movl	%eax, %edx
	movl	-60(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
.L17:
	movl	$0, %eax
.L24:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	set_display_from_temp, .-set_display_from_temp
	.globl	thermo_update
	.type	thermo_update, @function
thermo_update:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	set_temp_from_ports
	testl	%eax, %eax
	jne	.L27
	movl	-12(%rbp), %eax
	leaq	THERMO_DISPLAY_PORT(%rip), %rsi
	movl	%eax, %edi
	call	set_display_from_temp
	movl	$0, %eax
	jmp	.L29
.L27:
	movl	$1, %eax
.L29:
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	thermo_update, .-thermo_update
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
