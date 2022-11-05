# PROGRAMA QUE LE E IMPRIME VALOR FLUTUANTE

# double precisa de 64 bits para ser armazenado, logo, dois registradores
# utiliza de 2 em 2 registradores
# trabalha-se com os registradores do tipo f0 até f31 (Fica na area de Coproc1)

.data
	msg:		.asciiz		"Digite um valor: "
	saida:		.asciiz  	"O valor flutuante digitado é: "
	zero: 		.double 	0.0 	# recebe o valor do float
	
.text
	li, $v0, 4		# imprime uma string
	la $a0, msg		# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall			# sistema imprime o que esta em a0

# le o numero double do terminal
	li $v0, 7		# le o valor double
	syscall			# o flutuante lido esta em f0, e nao em v0

	# lwc1 atribui o valor na area de Coproc1
	ldc1 $f2, zero		# atribui o valor de 'zero' ao registrador f2
	add.d $f12, $f2, $f0	# atribui o valor double da soma de f1 + f0 ao registrador f12

	li, $v0, 4		# imprime uma string
	la $a0, saida		# carrega o endereco de memoria do vetor de caracter 'saida' em a0
	syscall			# sistema imprime o que esta em a0

# imprime o valor flutuante
	li, $v0, 3		# imprime um double 
	syscall			# sistema imprime o que esta em a0
