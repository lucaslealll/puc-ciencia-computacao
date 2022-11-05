.data
	msgEntrada:	.asciiz "Digite um número positivo: "
	msgPar:		.asciiz "O número é par!!!\n"
	msgImpar:	.asciiz "O número é impar!!!\n"

.text
	la $a0,msgEntrada
	jal imprimeString
# le o numero
	jal leInteiro
# verifica
	move $a0, $v0
	jal verifica
# imprime a msg
	beq $v0, $zero, imprimePar
		la $a0, msgImpar
		jal imprimeString
	jal encerra

## Funções ##
imprimeString:
	li $v0, 4
	syscall
	jr $ra # volta para a chamada da função

leInteiro:
	li $v0, 5
	syscall
	jr $ra # volta para a chamada da função
	
verifica:
	li $t0, 2
	div $a0, $t0 # divide por 2 para saber o resto
	mfhi $v0
	jr $ra # volta para a chamada da função

imprimePar:
	la $a0, msgPar
	jal imprimeString
	jal encerra

encerra:
	li $v0, 10
	syscall
