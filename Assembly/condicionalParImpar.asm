.data
	msg:	.asciiz "Digite um número: "
	par:	.asciiz "O número é PAR!!!"
	impar:	.asciiz "O número é IMPAR!!!"
	
# 'lo' e 'hi' nao fazem parte dos 32 registradores...são especificos para divisao

.text
	# imprime mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	# recebe o numero do terminal
	li $v0, 5
	syscall
	
	# divide por 2 para ver se é par ou impar
	li  $t0, 2
	div $v0, $t0
	
	# 'lo' recebe a parte inteira do resto da divisao
	# 'hi' recebe a parte decimal do resto da divisao
	
	mfhi $t1	# t1 possui o resto da divisao... valor de hi
	
	# verifica se o valor de t1 é igual a 0
	beq $t1, $zero, imprimePar	# se t1 for igual a 0, executa o programa sequencia depois de imprimePar
	
	# caso seja impar
	li $v0, 4
	la $a0, impar
	syscall
	
	# encerra o programa
	li $v0, 10
	syscall
		
imprimePar:
	li $v0, 4
	la $a0, par
	syscall














	