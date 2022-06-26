# Implemente um programa em Assembly que verifica se o vetor 
# possui algum valor armazenado diferente de 0. Exiba uma 
# mensagem informando se existe ou não algum valor diferente de 0 no vetor.

.data
#	vetor: 	.word -99, -1, 5, 4, 12, -33, -7, -21, 15, 1, -6, -47	
	vetor:	.word   0,  0, 0, 0,  0,   0,  0,   0,  0, 0,  0,   0
	len:	.word 12
	
	msgPossui: 	.asciiz "\n-> O vetor possui valor diferente de 0!"
	msgNaoPossui:	.asciiz "\n-> O vetor não possui valor diferente de 0!"
	
.text
	la $s0, vetor		# vetor 
	la $s1, len		# tamanho do vetor
	lw $t1, 0($s1)		# posicao na memoria
	li $t2, 0		# contador = 0
	li $s2, 0		# verificador
				
while:	beq $t2, 12, resposta	# if contador == 10 vai imprimir a resposta

	lw  $a0, 0($s0)		# a0 recebe o conteudo na posicao 0 de s0
	add $s0, $s0, 4		# s0 soma 4 bits
	
	move $s3, $a0		# s3 recebe o valor atual de a0
	
	bne $s3, 0, possui
		
	# add 1 ao contador
	add $t2, $t2, 1 
	j while

resposta:
	li $v0, 4
	la $a0, msgNaoPossui
	syscall	
	jal saida

possui:
	li $v0, 4
	la $a0, msgPossui
	syscall
	jal saida
	
espaco:	li $v0, 11
	la $a0, ' '
	syscall
	jr $ra
	
saida:	li $v0, 10
	syscall
