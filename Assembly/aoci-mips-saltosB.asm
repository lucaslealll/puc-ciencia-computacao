# AOCI  - CLAUDIO FARIA - CC PUC MINAS
# ALUNO - Lucas 
# Mips Salto Condicional e Incondicional
# 07/12/2020
#
# $ java -jar Mars4_5.jar aoci_mips1_saltosB.asm nc

# b) Fazer um programa encontrar o menor elemento de um vetor e imprimi-lo na tela.
# Considere a seguinte implementação do segmentos e dados:

#.data
	# vetor:.word 13, 34, 16, 61, 28
	#	.word 24, 58, 11, 26, 41
	#	.word 19, 7, 38, 12, 77
	# len: 	.word 15
 
.data
	mostraVetor: 	.asciiz 	"\nO vetor é: "
	contador: 	.asciiz 	"\nO numero de itens do vetor de "
	resposta:	.asciiz 	"\nO menor valor do vetor é "
	
	vetor:		.word 13, 34, 16, 61, 28
			.word 24, 58, 11, 26, 41
			.word 19, 7, 38, 12, 77
	len:	 	.word 15

.text
	la $s0, vetor		# vetor 
	la $s1, len		# tamanho do vetor
	lw $t1, 0($s1)		# posicao na memoria
	li $t2, 0		# contador = 0
	li $t3, 100 		# menor valor
	
	# O vetor é:
	li $v0, 4
	la $a0, mostraVetor
	syscall
				
while:	lw  $a0, 0($s0)		# a0 recebe o conteudo na posicao 0 de s0
	add $s0, $s0, 4		# s0 soma 4 bits
	
	move $t3, $a0
	
	# imprime o valor de a0
	li  $v0, 1		
	syscall
	# imprime 'espaco'
	li $a0, ' '	 
	li $v0, 11 	 
	syscall
	
	blt $a0, $t3, muda
		
	# add 1 ao contador
	add $t2, $t2, 1     		
	
	beq $t2, $t1, imprimeResposta	# if contador == 15 vai imprimir a resposta
	j while
	
muda:
	li $t3, 0
	add $t3, $zero,$a0
	b while

imprimeResposta:
	# mensagem de contador
	li, $v0, 4
	la, $a0, contador
	syscall
	# mostra o numero
	li,  $v0, 1
	move $a0, $t2
	syscall
	
	# mensagem de menorValor
	li, $v0, 4
	la, $a0, resposta
	syscall
	# mostra o numero
	li,  $v0, 1
	move $a0, $t3
	syscall
	
	# imprime '\n'
	li $a0, '\n'
	li $v0, 11
	syscall
