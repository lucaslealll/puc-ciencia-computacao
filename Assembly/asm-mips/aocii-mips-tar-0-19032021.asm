# int func(int g, int h, int i, int j){
#
# 	int f
# 	f = (g+h) - (i+j)
# 	return f
# }


.data
	msg0:	.asciiz		"f = (g+h) - (i+j)\n"
	msg1:	.asciiz		"Entre com um valor: "

.text
		
	
while: 	beq $t0, 3, r
	
	la $a0, msg1
	jal printf
	
	jal scanf
	
	addi $t0, $t0, 1
	j while
	
fim:
	li $v0, 10
	syscall	
	
printf:	li $v0, 4
	syscall
	jr $ra
	
scanf:	li $v0, 1
	syscall
	jr $ra
