# int func(int g, int h, int i, int j){
#
# 	int f
# 	f = (g+h) - (i+j)
# 	return f
# }

.data
	vetor: 	.word -99, -1, 5, 4, 12, -33, -7, -21, 15, 1, -6, -47	
	len:	.word 12
	msg: 	.asciiz "n1: "

.text
	la $s0, vetor		# vetor 
	la $s1, len		# tamanho do vetor
	lw $t1, 0($s1)		# posicao na memoria
	li $t2, 0		# contador = 0
				
while:	beq $t2, 10, imprimeResposta	# if contador == 10 vai imprimir a resposta

	lw  $a0, 0($s0)		# a0 recebe o conteudo na posicao 0 de s0
	add $s0, $s0, 4		# s0 soma 4 bits
	
	move $s3, $a0		# recebe valor	
	
	# add 1 ao contador
	add $t2, $t2, 1 
	j while

imprimeResposta:

	li $s5, 51
	add $s4, $s5, $s3
	la $a0, msg
	jal imprimeString
	
	move $a0, $s4
	jal imprimeInteiro
	
	j saida

saida:
	li $v0, 10
	syscall

imprimeString:
	li $v0, 4
	syscall
	jr $ra

imprimeInteiro:
	li $v0, 1
	syscall
	jr $ra
