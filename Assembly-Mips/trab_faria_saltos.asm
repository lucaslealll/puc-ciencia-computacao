# A) LE 2 NUMEROS INTEIROS DO TERMINAL E MOSTRA O MAIOR ENTRE ELES

# declara as variaveis (RAM)
.data
	numero1:	.asciiz		"COLOQUE O PRIMEIRO NUMERO:"
	numero2:	.asciiz		"COLOQUE O SEGUNDO NUMERO:"
	igual:		.asciiz		"OS NUMEROS SAO IGUAIS"
	msgResp:	.asciiz		"O MAIOR NUMERO E:"

# onde ta a o programa
.text

# PRIMEIRO NUMERO
	li $v0, 4
	la $a0, numero1
	syscall
	
	li $v0, 5
	syscall
	move $t1,$v0
	
	# T1 = PRIMEIRO NUMERO
	
# SEGUNDO NUMERO
	li $v0, 4
	la $a0, numero2
	syscall

	li $v0, 5
	syscall
	move $t2, $v0
	
	# T2 = SEGUNDO NUMERO
	
# VERIFICA 
	blt $t2, $t1, printaT1
	blt $t1, $t2, printaT2
	beq $t1, $t2, printaIgual
	
printaT1:	
	li $v0, 4
	la $a0, msgResp
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10 # break
	syscall
	
printaT2:	
	li $v0, 4
	la $a0, msgResp
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10 # break
	syscall
	
printaIgual:
	li $v0, 4
	la $a0, igual
	syscall