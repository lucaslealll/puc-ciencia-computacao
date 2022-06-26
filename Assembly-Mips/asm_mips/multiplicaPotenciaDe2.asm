# PROGRAMA QUE MULTIPLICA POTENCIA DE 2 VALORES

# a multiplicacao por potencia segue e logica de deslocamento dos bites de um binario
# deslocando para a esquerda a potencia se aumenta na base 2... 2¹,2²,2³,2⁴

# sem dados a serem gravados na RAM, logo, nao precisa do .data

# colocar instrucoes dos programas
.text
	li $t1, 1		# t1 recebe imediatamente (sem necessidade de variavel extra) o valore de 10
	
	sll $s0, $t1, 3	# s0 recebe o valor de t1 multiplicado por 2 deslocado 10 casas para a esquerda...equivalente a 2^10
	
	li $v0, 1
	move $a0, $s0		# move valor de registradores. Move s0 para a0
	syscall