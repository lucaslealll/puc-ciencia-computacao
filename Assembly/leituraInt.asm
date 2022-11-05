# PROGRAMA QUE LE VALOR INTEIRO DO TERMINAL

.data
	saudacao: 	.asciiz 	"Qual sua idade? "
	saida:		.asciiz  	"Sua idade é: "

.text
	li, $v0, 4 		# imprime uma string
	la $a0, saudacao	# carrega o endereco de memoria do vetor de caracter 'saudacao' em a0
	syscall			# sistema imprime o que esta em a0
	
	li $v0, 5 	# le um inteiro da tela...v0 recebe o valor
	syscall
	
	move $t0, $v0	# t0 recebe o valor de v0 (valor digitado pelo usuario)
	
	li, $v0, 4 	# imprime uma string
	la $a0, saida	# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall		# sistema imprime o que esta em a0
	
	li, $v0, 1	# imprime um valor na tela
	move $a0, $t0	# move o valor de t0 para a0
	syscall		# sistema imprime o que esta em a0