# PROGRAMA QUE VERIFICA SE UM NUMERO É MAIOR, MENOR OU IGUAL A ZERO

.data
	msg:	.asciiz 	"Digite um número: "
	igual: 	.asciiz 	"O número é IGUAL A ZERO!!!"
	maior:	.asciiz 	"O número é MAIOR QUE ZERO!!!"
	menor:	.asciiz		"O número é MENOR QUE ZERO!!!"
	
.text
	# imprime mensagem para o usuario
	li $v0, 4
	la $a0, msg
	syscall
	
	# recebe o numero do terminal
	li $v0, 5
	syscall
	
	add $t1, $zero, $v0	# t0 recebe o valor 
	
	# verifica se o valor de t1 é igual a 0
	beq $t1, $zero, imprimeIgual		# se t0 for igual a 0, executa o programa sequencia depois de imprimeIgual
	bgt $t1, $zero, imprimeMaior		# se t0 for maior que 0, executa o programa sequencia depois de imprimeMaior
	blt $t1, $zero, imprimeMenor		# se t0 for menor que 0, executa o programa sequencia depois de imprimeMenor

imprimeIgual:	
# caso seja igual
	li $v0, 4
	la $a0, igual
	syscall
	# encerra o programa
	li $v0, 10
	syscall

imprimeMaior:	
# caso seja maior
	li $v0, 4
	la $a0, maior
	syscall
	# encerra o programa
	li $v0, 10
	syscall

imprimeMenor:	
# caso seja menor
	li $v0, 4
	la $a0, menor
	syscall














	
