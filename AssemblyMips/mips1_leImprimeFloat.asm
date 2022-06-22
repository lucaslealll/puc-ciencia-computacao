# PROGRAMA QUE LE E IMPRIME VALOR FLUTUANTE

# float precisa de 32 bits para ser armazenado, logo, um unico registrador
# double precisa de 64 bits para ser armazenado, logo, dois registradores
# trabalha-se com os registradores do tipo f0 até f31 (Fica na area de Coproc1)

.data
	msg:		.asciiz		"Digite um valor flutuante: "
	saida:		.asciiz  	"O valor flutuante digitado é: "
	zero: 		.float 		0.0 	# recebe o valor do float
	
.text
	li, $v0, 4	# imprime uma string
	la $a0, msg	# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall		# sistema imprime o que esta em a0

# le o numero flutuante do terminal
	li $v0, 6	# le o valor flutuante
	syscall		# o flutuante lido esta em f0, e nao em v0

	# lwc1 atribui o valor na area de Coproc1
	lwc1 $f1, zero		# atribui o valor de 'zero' ao registrador f1
	add.s $f12, $f1, $f0	# atribui o valor flutuante da soma de f1 + f0 ao registrador f12

	li, $v0, 4	# imprime uma string
	la $a0, saida	# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall		# sistema imprime o que esta em a0

# imprime o valor flutuante
	li, $v0, 2			# imprime um ponto flutuante
	syscall				# sistema imprime o que esta em a0
