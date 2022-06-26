# EQUAÇÃO: x = n1 –( n2  – n3 ) + n4

.data
	equacao: 	.asciiz	"x = n1 - ( n2 - n3 ) + n4\n"
	msg: 	 	.asciiz "Digite o valor para n: "
	resultado: 	.asciiz	"\nResultado final é: "

.text
	move $t0, $zero

	la $a0, equacao
	jal imprimeString
	
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s1, $v0
	
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s2, $v0
	
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s3, $v0
		
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s4, $v0

# equacao
	sub $t0, $s2, $s3
	sub $t1, $s1, $t0
	add $t2, $t1, $s4
		
	# imprime resultado
	la $a0, resultado
	jal imprimeString
	
	move $a0, $t2
	jal imprimeInteiro
	
	# encerra o programa
	li, $v0, 10
	syscall
	
	
## Funções ##
imprimeString:
	li $v0, 4
	syscall
	jr $ra # volta para a chamada da função

imprimeInteiro:
	li $v0, 1
	syscall
	jr $ra
	
leInteiro:
	li $v0, 5
	syscall
	jr $ra # volta para a chamada da função
