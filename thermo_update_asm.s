.text
.global  _set_temp_from_ports
_set_temp_from_ports:
  cmpw $0, _THERMO_SENSOR_PORT(%rip)
  jb .ret_1
  cmpw $64000, _THERMO_SENSOR_PORT(%rip)
  ja .ret_1
  cmpb $1, _THERMO_STATUS_PORT(%rip)
  ja .ret_1
  cmpb $0, _THERMO_STATUS_PORT(%rip)
  jb .ret_1
  # clear rcx and r8
  xorq %rcx, %rcx
  xorq %r8, %r8
  # load ports
  movb _THERMO_STATUS_PORT(%rip), %cl
  movw _THERMO_SENSOR_PORT(%rip), %r8w
  # + 32
  addl $32, %r8d
  # / 64
  xorq %rax, %rax
  xorq %rdx, %rdx
  movl %r8d, %eax
  cdq
  movl $64, %r8d
  idivl %r8d
  movl %eax, %r8d
  # - 500
  subl $500, %r8d
  # the if statement
  cmpb $1, %cl
  jne .ret_0
  # * 9
  movl %r8d, %eax
  imull $9, %r8d
  # / 5
  xorq %rax, %rax
  xorq %rdx, %rdx
  movl %r8d, %eax
  cdq
  movl $5, %r8d
  idivl %r8d
  movl %eax, %r8d
  # + 320
  addl $320, %r8d
.ret_0:
  movw %r8w, (%rdi)
  addq $2, %rdi
  movb %cl, (%rdi)
  movq $0, %rax
  ret
.ret_1:
  movq $1, %rax # return 1
  ret


.text
.global  _set_display_from_temp
_set_display_from_temp:
  # get temp out of the stack
  movl $0, (%rsi)
  movq %rdi, %rax
  ret
  # addq $2, %rdi
  # movb (%rdi), %cl
  # pushq %rdi
  # set display
  /*
  pushq %rsi
  movq (%rsi), %rsi
  movl $0, %esi
  # first if statement
  cmpb $1, %cl
  je .cont_1
  cmpb $0, %cl
  je .cont_1
  movl $-1, %esi
  movq $1, %rax
  ret
.cont_1:
  # second if statement
  cmpb $1, %cl
  jne .cont_2
  cmpw $-580, %r8w
  jge .cont_3
.cont_2:
  cmpw $1220, %r8w
  jg .cont_4
.cont_3:
  movl $-1, %esi
  movq $1, %rax
  ret
.cont_4:
  # third if statement
  cmpb $0, %cl
  jne .cont_5
  cmpw $-580, %r8w
  jge .cont_6
.cont_5:
  cmpw $1220, %r8w
  jg .cont_7
.cont_6:
  movl $-1, %esi
  movq $1, %rax
  ret
.cont_7:
  # negative
  movq $0, %r9
  cmpw $0, %r8w
  jl .cont_8
  movq $1, %r9
  negw %r8w
.cont_8:
  # farenheit or celcius
  cmpb $1, %cl
  jne .cont_9
  shll $2, %esi
  addl $2, %esi
  jmp .cont_10
.cont_9:
  shll $2, %esi
  addl $1, %esi
.cont_10:
  # rsi = *display, rcx = temp_hundreds, r10 = temp_tens, r11 = temp_ones,
  # rdi = temp_tenths, negative = r9
  # init vars
  # temp_hundreds
  xorq %rcx, %rcx
  pushw %r8w
  # / 1000
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $1000, %r8w
  idivw %r8w
  movw %ax, %r8w
  # % 10
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $10, %r8w
  idivw %r8w
  movw %dx, %r8w
  movw %r8w, %cx
  popw %r8w
  # temp_tens
  xorq %r10, %r10
  pushw %r8w
  # / 100
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $100, %r8w
  idivw %r8w
  movw %ax, %r8w
  # % 10
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $10, %r8w
  idivw %r8w
  movw %dx, %r8w
  movw %r8w, %r10w
  popw %r8w
  # temp_ones
  xorq %r11, %r11
  pushw %r8w
  # / 10
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $10, %r8w
  idivw %r8w
  movw %ax, %r8w
  # % 10
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $10, %r8w
  idivw %r8w
  movw %dx, %r8w
  movw %r8w, %r11w
  popw %r8w
  # temp_tenths
  xorq %rdi, %rdi
  pushw %r8w
  # % 10
  xorq %rax, %rax
  xorq %rdx, %rdx
  movw %r8w, %ax
  cwd
  movw $10, %r8w
  idivw %r8w
  movw %dx, %r8w
  movw %r8w, %di
  popw %r8w
  # rsi = *display, rcx = temp_hundreds, r10 = temp_tens, r11 = temp_ones,
  # rdi = temp_tenths, negative = r9
  # init bitmasks array
  push $0x5F
  push $0x7F
  push $0x07
  push $0x7D
  push $0x6D
  push $0x66
  push $0x4F
  push $0x5B
  push $0x06
  push $0x3F
  movq %rsp, %rax
  # init neg array
  push $0x40
  push $0x00
  movq %rsp, %rdx
  cmpl $0, %ecx
  je .cont_11
  shll $7, %esi
  addl (%rax, %rcx, 8), %esi
  shll $7, %esi
  addl (%rax, %r10, 8), %esi
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
  jmp .write_back_ret
.cont_11:
  cmpl $0, %r10d
  je .cont_12
  cmpl $1, %r9d
  jne .cont_12
  shll $7, %esi
  addl 8(%rdx), %esi
  shll $7, %esi
  addl (%rax, %r10, 8), %esi
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
  jmp .write_back_ret
.cont_12:
  shll $7, %esi
  addl (%rdx), %esi
  cmpl $0, %r10d
  je .cont_13
  shll $7, %esi
  addl (%rax, %r10, 8), %esi
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
  jmp .write_back_ret
.cont_13:
  cmpl $0, %r11d
  je .cont_14
  cmpl $1, %r9d
  jne .cont_14
  shll $7, %esi
  addl 8(%rdx), %esi
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
  jmp .write_back_ret
.cont_14:
  cmpl $0, %r11d
  je .cont_15
  cmpl $0, %r9d
  jne .cont_15
  shll $7, %esi
  addl (%rdx), %esi
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
  jmp .write_back_ret
.cont_15:
  cmpl $1, %r9d
  jne .cont_16
  shll $7, %esi
  addl 4(%rdx), %esi
  jmp .cont_17
.cont_16:
  shll $7, %esi
  addl (%rdx), %esi
.cont_17:
  shll $7, %esi
  addl (%rax, %r11, 8), %esi
  shll $7, %esi
  addl (%rax, %rdi, 8), %esi
.write_back_ret:
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %rax
  pop %r10 # display address
  pop %r11 # struct address
  movl %esi, (%r10)
  movb %cl, (%r11)
  subq $-2, %r11
  movw %r8w, (%r11)
  */
  movq $0, %rax
  ret
