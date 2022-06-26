# CRIAR UMA FUNÇÃO QUE IMPLEMENTE OPERAÇÕES DE MULTIPLICAÇÃO
# SEM USAR INSTRUÇÃO MULT


.data
	msg0:	.asciiz		"MULTIPLICACAO [X]\n"
	msg1:	.asciiz		"Entre com o primeiro valor: "
	msg2:	.asciiz		"Entre com o segundo valor: "	
	rslt: 	.asciiz		"\nResultado final é: "
	
.text
	la $a0, msg0
	jal print

	la $a0, msg1
	jal print
	jal scan
	move $s1, $v0

	la $a0, msg2
	jal print
	jal scan
	move $s2, $v0

	jal multi

## Funções ##
multi:	beq $t0, $s2, resultado
	
	add $s3, $s3, $s1 # SOMA
	
	add $t0, $t0, 1
	j multi

resultado:
	la $a0, rslt
	jal print
	li $v0, 1
	move $a0, $s3
	syscall
	
	# encerra
	li, $v0, 10
	syscall
		
print:
	li $v0, 4
	syscall
	jr $ra # volta para a chamada da função

printInt:
	li $v0, 1
	syscall
	jr $ra
	
scan:
	li $v0, 5
	syscall
	jr $ra # volta para a chamada da função