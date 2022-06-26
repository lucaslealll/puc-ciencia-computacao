# int func(int g, int h, int i, int j){
#
# 	int f
# 	f = (g+h) - (i+j)
# 	return f
# }

.data
	equacao: 	.asciiz	"f = (g+h) - (i+j)\n"
	msg: 	 	.asciiz "Digite o valor para n: "
	resultado: 	.asciiz	"\nResultado final é: "

.text

	# IMPRIME A EQUAÇÃO
	la $a0, equacao
	jal imprimeString
	
	# ENTRADA E ARMAZENAMENTO DE VALOR
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s1, $v0
	# ENTRADA E ARMAZENAMENTO DE VALOR	
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s2, $v0
	# ENTRADA E ARMAZENAMENTO DE VALOR	
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s3, $v0
	# ENTRADA E ARMAZENAMENTO DE VALOR		
	la $a0, msg
	jal imprimeString
	jal leInteiro
	move $s4, $v0

# equacao
	# f = (g+h) - (i+j)
	add $t0, $s1, $s2 # t0 = g + h
	add $t1, $s3, $s4 # t1 = i + j
	sub $t2, $t0, $t1 # t2 = t0 + t1
		
	# imprime resultado
	la $a0, resultado
	jal imprimeString
	
	move $a0, $t2
	jal imprimeInteiro
		
	# ENCERRA O PROGRAMA!!!
	j encerra
	
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

encerra:
	# encerra o programa
	li, $v0, 10
	syscall