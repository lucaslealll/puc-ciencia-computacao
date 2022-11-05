# PROGRAMA QUE IMPRIME UM INTEIRO

# colocar especificacao de variaveis... dados da memória principal
.data	
	# o ponto na frente de um nome, define o tipo de dado. nesse caso, um char
	idade: .word 56		# word é o tamanho da palavra do SO, logo reconhece o valor de inteiro 
	idade2: .word 22

# colocar instrucoes dos programas
.text
	li $v0, 1 		# imprimir int no terminal
	lw $a0, idade		# lw para caarregar o tipo word no conteudo do endereco de 'idade' para o registrador a0
	syscall			# imprime o que esta no registrador $a0 
	
	li $v0, 1 		# imprimir int no terminal
	lw $a0, idade2		# lw para caarregar o tipo word no conteudo do endereco de 'idade2' para o registrador a0
	syscall			# imprime o que esta no registrador $a0
	
	li $v0, 10 		# encerra o programa manualmente
	syscall
