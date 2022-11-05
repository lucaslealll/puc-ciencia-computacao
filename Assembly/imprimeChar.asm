# PROGRAMA QUE IMPRIME UM CARACTERE

# colocar especificacao de variaveis... dados da memória principal
.data	
	# o ponto na frente de um nome, define o tipo de dado. nesse caso, um char
	caractere: .byte 'A'

# colocar instrucoes dos programas
.text
	li $v0, 4 		# imprimir char no terminal
	la $a0, caractere	# carrega o conteudo do endereco de 'caractere' para o registrador a0
	syscall			# imprime o que esta no registrador $a0 
	
	li $v0, 10 		# encerra o programa manualmente
	syscall
