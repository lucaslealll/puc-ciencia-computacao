# ALUNO - LUCAS OMAR ANDRADE LEAL - lucasomarandradeleal@gmail.com
# 10/12/2020
# PROVA 2
# QUESTAO 5
# $ java -jar Mars4_5.jar aoci_p2_questao5_lucasOmar.asm nc

.data
	msg: 	.asciiz "O valor total é: " 
	
	vetor:  .word 13, 34, 16, 61, 28
          	.word 24, 58, 11, 26, 41
           	.word 19,  7, 38, 12, 77
	len: 	.word 15

.text
	li $s0, 0	# 465

	la $s1,vetor	# s1 recebe o vetor
	la $t1,len	# 11 recebe o tamanho do vetor
	lw $t2,0($t1)	# t2 recebe o tamanha de t1
	li $t3,0        # t3 = 0
	
	
while:	lw $a0,0($s1)	# carrega o endereço a partir de s1
	add $s1,$s1,4	# add 4 para andar na memoria
	li $v0,1	# printa o valor de a0
	syscall
	
	add $s0, $s0, $a0	# faz a soma dos valores do vetor
	
	# imprime ' '
	li $a0, ' '	 
	li $v0, 11 	 
	syscall

	add $t3,$t3,1     # i = i + 1
	beq $t3,$t2, out  # if i == 15 sai
	
	b while 	# repete while
	
out: 	# imprime '\n'
	li $a0, '\n'	 
	li $v0, 11 	 
	syscall
	
	# printa mensagem do valor
	li $v0, 4
	la $a0, msg
	syscall	
	# printa o valor total
	li $v0, 1
	move $a0, $s0
	syscall

	# fecha o programa	
	li $v0, 10
	syscall	
