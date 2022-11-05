# SOMA REGISTRADORES S0 E S1

.data
	msg1: 	.asciiz 	"Digite o valor para $S0: "
	msg2:	.asciiz  	"Digite o valor para $S1: "

.text
	li, $v0, 4	# imprime uma string
	la $a0, msg1	# carrega o endereco de memoria do vetor de caracter 'saudacao' em a0
	syscall		# sistema imprime o que esta em a0
	
	li $v0, 5 	# le um inteiro da tela...v0 recebe o valor
	syscall
	
	move $s0, $v0	# t0 recebe o valor de v0 (valor digitado pelo usuario)
	
	li, $v0, 4 	# imprime uma string
	la $a0, msg2	# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall		# sistema imprime o que esta em a0
	
	li $v0, 5 	# le um inteiro da tela...v0 recebe o valor
	syscall
	
	move $s1, $v0 	# move o valor de entrada que esta em v0 para s1
	
	add $s2, $s0, $s1 # soma s1 e s0 e guarda nao registrado s2
	
	li, $v0, 1	# imprime um valor na tela
	move $a0, $s2	# move o valor de s2 para a0
	syscall		# sistema imprime o que esta em a0
