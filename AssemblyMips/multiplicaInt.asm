# PROGRAMA QUE MULTIPLICA VALORES

# sem dados a serem gravados na RAM, logo, nao precisa do .data

# colocar instrucoes dos programas
.text
	li $t0, 12		# t0 recebe imediatamente (sem necessidade de variavel extra) o valore de 12
	li $t1, 10		# t1 recebe imediatamente (sem necessidade de variavel extra) o valore de 10
	
	mul $s0, $t0, $t1	# s0 recebe o valor de t0 x t2
	mul $s1, $t1, 5		# s1 recebe imediatamente o valor de s0 x 40

	
	li $v0, 1
	move $a0, $s0		# move valor de registradores. Move s0 para a0
	syscall