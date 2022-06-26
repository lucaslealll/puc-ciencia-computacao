# int main(){int vet[12] = {-99, -1, 5, 4, 12, -33, -7, -21, 15, 1, -6, -47};
# int n1 = 0
# int n2 = 51;
# n1 = vet[9] + n2;
# printf("n1: %d \n", n1);}

.data
	vetor: 	.word -99, -1, 5, 4, 12, -33, -7, -21, 15, 1, -6, -47	
	len:	.word 12

.text
	la $s0, vetor		# vetor 
	la $s1, len		# tamanho do vetor
	lw $t1, 0($s1)		# posicao na memoria
	li $t2, 0		# contador = 0
				
while:	beq $t2, 12, saida	# if contador == 10 vai imprimir a resposta

	lw  $a0, 0($s0)		# a0 recebe o conteudo na posicao 0 de s0
	add $s0, $s0, 4		# s0 soma 4 bits
	
	move $s3, $a0		# recebe valor	
	
	li $v0, 1
	syscall
	
	jal espaco
	
	# add 1 ao contador
	add $t2, $t2, 1 
	j while

espaco:
	li $v0, 11
	la $a0, ' '
	syscall
	jr $ra
	
saida: li $a0, 10
	syscall
