# PROGRAMA QUE IMPRIME CONTAGEM REGRESSIVA DE UM NUMERO

.data
	msg:	.asciiz 	"Digite um número: "
	espaco: .byte 		' '
	
.text
	# imprime mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	# ler o numero
	li $v0, 5
	syscall
	
	move $t0, $v0		# salva o valor de v0 em t0
	move $t1, $zero		# t1 é o contador do programa... inicia com 0
	
	while:
		bgt $t1, $t0, sai	# enquanto o t1 for maior que t0
		
		# imprime numero
		li $v0, 1
		move $a0, $t1
		syscall
		
		#imprime espaco em branco
		li $v0, 4
		la $a0, espaco
		syscall
		
		# add 1 ao contador
		addi $t1, $t1, 1
		j while			# pula para a linha de comando laco...repeticao do codigo
		
	sai:
		# encerra o programa
		li, $v0, 10
		syscall
	

