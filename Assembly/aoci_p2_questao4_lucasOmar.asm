# ALUNO - LUCAS OMAR ANDRADE LEAL - lucasomarandradeleal@gmail.com
# 10/12/2020
# PROVA 2
# QUESTAO 4
# $ java -jar Mars4_5.jar aoci_p2_questao4_lucasOmar.asm nc

# QUESTÃO 3 - Fazer um programa em assembly do MIPS que seja uma tradução do trecho de código na linguagem C dado abaixo.
# a = 10;
# b = 20;
# c = 30;
# while (a < 200) {
#  a = b+c;  
#  c = c+1;  
# } 
.data
	valorA: 	.asciiz		"\nVALOR DE A: "
	valorB: 	.asciiz		"\nVALOR DE B: "
	contador: 	.asciiz		"\nCONTADOR:   "
.text

	move $t0, $zero		# t0 recebe o valor de 0
	
	li $t1, 10 # a		# t1 recebe o valor de 10
	li $t2, 20 # b		# t2 recebe o valor de 20
	li $t3, 30 # c		# t3 recebe o valor de 30
	
	while:
		beq  $t0, 199, saida	# verifica se t0 é igal a 10
		
		add  $t1, $t2, $t3 	#  a = b + c;  
		addi $t3, $t3, 1 	#  c = c + 1;  
		
		addi $t0, $t0, 1	# add 1 ao contador 
		b while			# comando jump... Faz pular para uma linha de codigo
		
		# encerra o programa	
		li $v0, 10
		syscall
	
	saida:	# string valor de A
		li, $v0, 4
		la $a0, valorA
		syscall
		# valor de A		
		li $v0, 1
		move $a0, $t1
		syscall
		
		# string valor de B
		li, $v0, 4
		la $a0, valorB
		syscall
		# valor de B		
		li $v0, 1
		move $a0, $t3
		syscall
		
		# string valor do contador
		li, $v0, 4
		la $a0, contador
		syscall
		# valor contador	
		li $v0, 1
		move $a0, $t0
		syscall
