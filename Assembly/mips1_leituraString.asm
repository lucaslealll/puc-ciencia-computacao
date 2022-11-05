# PROGRAMA QUE LE UMA STRING DO TERMINAL

.data
	pergunta: 	.asciiz 	"Qual seu nome? "
	saudacao:	.asciiz  	"Olá, "

# declarar a string e o seu tamanho em .data, para ficar salva na RAM
# .space refere-se ao numero de bytes
	nome: 		.space 		25	# a funcao .space define o numero de bytes para a variavel nome

.text
	li, $v0, 4 		# imprime uma string
	la  $a0, pergunta	# carrega o endereco de memoria do vetor de caracter 'pergunta' em a0
	syscall			# sistema imprime o que esta em a0
	
# recebe a string e armazena
	li $v0, 8 	# le a string  da tela...v0 recebe o valor
	la $a0, nome	# carrega o nome(string) para o registrador a0
	la $a1, 25	# a1 recebe o tamanho de bytes a ser lido
	syscall
		
	li, $v0, 4 		# imprime uma string
	la  $a0, saudacao	# carrega o endereco de memoria do vetor de caracter 'saudacao' em a0
	syscall			# sistema imprime o que esta em a0
	
# imprime a string 
	li, $v0, 4	# imprime um valor na tela
	la  $a0, nome	# move o valor de t0 para a0
	syscall		# sistema imprime o que esta em a0
