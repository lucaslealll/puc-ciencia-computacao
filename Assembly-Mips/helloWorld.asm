# PROGRAMA QUE FAZ UM HELLO WORLD 

# colocar especificacao de variaveis... dados da memória principal
.data
	# o ponto na frente de um nome, define o tipo de dado. nesse caso, vetor de caracter
	msg:.asciiz 	"\tHello world\n" # define um vetor de caracteres e coloca o '\0' no final

# colocar instrucoes dos programas
.text

	li $v0, 4 	# imprimir string no terminal
	la $a0, msg	# carrega o conteudo do endereco de msg para o registrador a0
	
	syscall 	# imprime o que esta no registrador $a0 
