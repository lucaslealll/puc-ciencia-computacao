# AOCI  - CLAUDIO FARIA - CC PUC MINAS
# ALUNO - Lucas 
# Mips Salto Condicional e Incondicional
# 07/12/2020
#
# $ java -jar Mars4_5.jar aoci_mips1_saltos.asm nc

# a) Fazer um programa para ler dois números inteiros do console e imprimir o maior deles na tela.
.data
	valor1: 	.asciiz 	"Digite o primeiro valor: "
	valor2:		.asciiz  	"Digite o segundo valor: "
	igual:		.asciiz  	"Os valores são iguais!!!"
	resposta: 	.asciiz 	"O maior valor é: "
	
	# t1 = valor1
	# t2 = valor2

.text
# ENTRA COM VALOR 1
	li, $v0, 4 	# imprime uma string
	la $a0, valor1	# carrega o endereco de memoria do vetor de caracter 'valor1' em a0
	syscall		# sistema imprime o que esta em a0
	li $v0, 5 	# le um inteiro da tela...v0 recebe o valor
	syscall
	move $t1, $v0	# t0 recebe o valor de v0 (valor digitado pelo usuario)

# ENTRA COM VALOR 2	
	li, $v0, 4 	# imprime uma string
	la $a0, valor2	# carrega o endereco de memoria do vetor de caracter 'valor2' em a0
	syscall		# sistema imprime o que esta em a0
	li $v0, 5 	# le um inteiro da tela...v0 recebe o valor
	syscall
	move $t2, $v0	# t1 recebe o valor de v0 (valor digitado pelo usuario)
	
	blt $t2, $t1, printaT1		# se t2 for menor que t1, vai para a linha printaT1
	blt $t1, $t2, printaT2		# se t1 for menor que t1, vai para a linha printaT2
	beq $t1, $t2, printaIgual	# se t1 for menor que t1, vai para a linha printaIgual

printaT1:
	# RESPOSTA
	li, $v0, 4 		# imprime uma string
	la $a0, resposta	# carrega o endereco de memoria do vetor de caracter 'resposta' em a0
	syscall
	
	li, $v0, 1		# imprime um valor na tela
	move $a0,$t1		# move o valor de t1 para a0
	syscall			# sistema imprime o que esta em a0

	# finaliza o programa	
	li $v0, 10
	syscall
	
printaT2:
	# RESPOSTA
	li, $v0, 4 		# imprime uma string
	la $a0, resposta	# carrega o endereco de memoria do vetor de caracter 'resposta' em a0
	syscall
	
	li, $v0, 1		# imprime um valor na tela
	move $a0,$t2		# move o valor de t2 para a0
	syscall			# sistema imprime o que esta em a0

	# finaliza o programa
	li $v0, 10	
	syscall
	
printaIgual:
	# RESPOSTA
	li, $v0, 4 	# imprime uma string
	la $a0, igual	# carrega o endereco de memoria do vetor de caracter 'resposta' em a0
	syscall		# sistema imprime o que esta em a0