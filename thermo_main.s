	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$3, -8(%rbp)
	jge	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.1(%rip), %rdi
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$0, -4(%rbp)
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	jmp	LBB0_19
LBB0_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_atoi
	leaq	L_.str.2(%rip), %rdi
	movq	_THERMO_SENSOR_PORT@GOTPCREL(%rip), %rcx
	movw	%ax, %dx
	movw	%dx, (%rcx)
	movzwl	(%rcx), %esi
	movb	$0, %al
	callq	_printf
	movq	_THERMO_SENSOR_PORT@GOTPCREL(%rip), %rcx
	movl	$128000, -20(%rbp)      ## imm = 0x1F400
	movzwl	(%rcx), %esi
	cmpl	-20(%rbp), %esi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	jbe	LBB0_4
## %bb.3:
	leaq	L_.str.3(%rip), %rdi
	movq	_THERMO_SENSOR_PORT@GOTPCREL(%rip), %rax
	movzwl	(%rax), %esi
	movl	-20(%rbp), %edx
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	jmp	LBB0_19
LBB0_4:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movsbl	(%rax), %ecx
	cmpl	$67, %ecx
	je	LBB0_6
## %bb.5:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movsbl	(%rax), %ecx
	cmpl	$99, %ecx
	jne	LBB0_7
LBB0_6:
	movq	_THERMO_STATUS_PORT@GOTPCREL(%rip), %rax
	movzbl	(%rax), %ecx
	movb	%cl, %dl
	movb	%dl, (%rax)
	jmp	LBB0_12
LBB0_7:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movsbl	(%rax), %ecx
	cmpl	$70, %ecx
	je	LBB0_9
## %bb.8:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movsbl	(%rax), %ecx
	cmpl	$102, %ecx
	jne	LBB0_10
LBB0_9:
	movq	_THERMO_STATUS_PORT@GOTPCREL(%rip), %rax
	movzbl	(%rax), %ecx
	orl	$1, %ecx
	movb	%cl, %dl
	movb	%dl, (%rax)
	jmp	LBB0_11
LBB0_10:
	leaq	L_.str.4(%rip), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.5(%rip), %rdi
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	jmp	LBB0_19
LBB0_11:
	jmp	LBB0_12
LBB0_12:
	leaq	-24(%rbp), %rax
	xorl	%esi, %esi
	movl	$4, %ecx
	movl	%ecx, %edx
	movq	%rax, %rdi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	_memset
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	callq	_set_temp_from_ports
	leaq	L_.str.6(%rip), %rdi
	movl	%eax, -28(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str.7(%rip), %rdi
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.8(%rip), %rdi
	movswl	-24(%rbp), %esi
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.9(%rip), %rdi
	movsbl	-22(%rbp), %esi
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.10(%rip), %rdi
	movl	%eax, -104(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$10, %ecx
	movswl	-24(%rbp), %esi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	movl	%esi, %eax
	cltd
	idivl	%ecx
	movl	%eax, -32(%rbp)
	movswl	-24(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jge	LBB0_14
## %bb.13:
	imull	$-1, -36(%rbp), %eax
	movl	%eax, -36(%rbp)
LBB0_14:
	leaq	L_.str.13(%rip), %rdi
	leaq	L_.str.12(%rip), %rax
	leaq	L_.str.11(%rip), %rcx
	movsbl	-22(%rbp), %edx
	cmpl	$0, %edx
	cmovneq	%rcx, %rax
	movq	%rax, -48(%rbp)
	movl	-32(%rbp), %esi
	movl	-36(%rbp), %edx
	movq	-48(%rbp), %rcx
	movb	$0, %al
	callq	_printf
	cmpl	$0, -28(%rbp)
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	je	LBB0_16
## %bb.15:
	leaq	L_.str.14(%rip), %rdi
	movl	-28(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -116(%rbp)        ## 4-byte Spill
	jmp	LBB0_19
LBB0_16:
	leaq	L_.str.15(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	-52(%rbp), %rsi
	movl	$0, -52(%rbp)
	movl	-24(%rbp), %edi
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	callq	_set_display_from_temp
	leaq	L_.str.16(%rip), %rdi
	movl	%eax, -28(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str.17(%rip), %rdi
	movl	%eax, -124(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.18(%rip), %rdi
	movl	%eax, -128(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.19(%rip), %rdi
	movl	%eax, -132(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.20(%rip), %rdi
	movl	%eax, -136(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	-52(%rbp), %edi
	movl	%eax, -140(%rbp)        ## 4-byte Spill
	callq	_showbits
	leaq	L_.str.21(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	%eax, -144(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.23(%rip), %rdi
	movl	%eax, -148(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	cmpl	$0, -28(%rbp)
	movl	%eax, -152(%rbp)        ## 4-byte Spill
	je	LBB0_18
## %bb.17:
	leaq	L_.str.24(%rip), %rdi
	movl	-28(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -156(%rbp)        ## 4-byte Spill
	jmp	LBB0_19
LBB0_18:
	leaq	L_.str.25(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -160(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_thermo_update
	leaq	L_.str.26(%rip), %rdi
	movl	%eax, -164(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.27(%rip), %rdi
	movl	%eax, -168(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.19(%rip), %rdi
	movl	%eax, -172(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.20(%rip), %rdi
	movl	%eax, -176(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movq	_THERMO_DISPLAY_PORT@GOTPCREL(%rip), %rdi
	movl	(%rdi), %edi
	movl	%eax, -180(%rbp)        ## 4-byte Spill
	callq	_showbits
	leaq	L_.str.21(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	%eax, -184(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.23(%rip), %rdi
	movl	%eax, -188(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.28(%rip), %rdi
	movl	%eax, -192(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	%eax, -196(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_print_thermo_display
	movl	$0, -4(%rbp)
LBB0_19:
	movl	-4(%rbp), %eax
	addq	$208, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"usage: %s {sensor_val} {C | F}\n"

L_.str.1:                               ## @.str.1
	.asciz	"  sensor_val: positive integer\n"

L_.str.2:                               ## @.str.2
	.asciz	"THERMO_SENSOR_PORT set to: %u\n"

L_.str.3:                               ## @.str.3
	.asciz	"Sensor value %u exceeds max %u\n"

L_.str.4:                               ## @.str.4
	.asciz	"Unknown display mode: '%s'\n"

L_.str.5:                               ## @.str.5
	.asciz	"Should be 'C' or 'F'\n"

L_.str.6:                               ## @.str.6
	.asciz	"set_temp_from_sensors(&temp );\n"

L_.str.7:                               ## @.str.7
	.asciz	"temp is {\n"

L_.str.8:                               ## @.str.8
	.asciz	"  .tenths_degrees = %d\n"

L_.str.9:                               ## @.str.9
	.asciz	"  .is_fahrenheit  = %d\n"

L_.str.10:                              ## @.str.10
	.asciz	"}\n"

L_.str.11:                              ## @.str.11
	.asciz	"deg F"

L_.str.12:                              ## @.str.12
	.asciz	"deg C"

L_.str.13:                              ## @.str.13
	.asciz	"Simulated temp is: %d.%d %s\n"

L_.str.14:                              ## @.str.14
	.asciz	"set_temp_from_ports() returned non-zero: %d\n"

L_.str.15:                              ## @.str.15
	.asciz	"\nChecking results for display bits\n"

L_.str.16:                              ## @.str.16
	.asciz	"set_display_from_temp(temp, &display);\n"

L_.str.17:                              ## @.str.17
	.asciz	"\ndisplay is:\n"

L_.str.18:                              ## @.str.18
	.asciz	"        3         2         1         0\n"

L_.str.19:                              ## @.str.19
	.asciz	"index: 10987654321098765432109876543210\n"

L_.str.20:                              ## @.str.20
	.asciz	"bits:  "

L_.str.21:                              ## @.str.21
	.asciz	"\n"

L_.str.22:                              ## @.str.22
	.asciz	"guide:  |    |    |    |    |    |    |\n"

L_.str.23:                              ## @.str.23
	.asciz	"index:  30        20        10        0\n"

L_.str.24:                              ## @.str.24
	.asciz	"set_display_from_temp() returned non-zero: %d\n"

L_.str.25:                              ## @.str.25
	.asciz	"\nRunning thermo_update()\n"

L_.str.26:                              ## @.str.26
	.asciz	"\nTHERMO_DISPLAY_PORT is:\n"

L_.str.27:                              ## @.str.27
	.asciz	"index:  3         2         1    0    0\n"

L_.str.28:                              ## @.str.28
	.asciz	"\nThermometer Display:\n"


.subsections_via_symbols
