# AOCI - CLAUDIO FARIA - CC PUC MINAS
# ALUNO - LUCAS OMAR ANDRADE LEAL - lucasomarandradeleal@gmail.com
# Mips Load Word / Store Word
# 23/11/2020
#
# $ java -jar Mars4_5.jar aoci_mips1_LwSw.asm nc

# a) Fazer um programa para colocar os valores 01, 02, 03, 04, 05, 06 a partir do endereço de memória 0x10010000.

.text

	li   $s1, 0x10010000 	# loadImmediate no endereço de memoria 0x10010000 a variavel $s1
	
	addi $t0, $zero, 1	# additionImmediateWhithOverflow t0 recebe 0 + 1
	sw   $t0, 0($s1) 		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 0
	
	addi $t0, $zero, 2	# additionImmediateWhithOverflow t0 recebe 0 + 2
	sw   $t0, 4($s1) 		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 4
	
	addi $t0, $zero, 3	# additionImmediateWhithOverflow t0 recebe 0 + 3
	sw   $t0, 8($s1)		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 8
	
	addi $t0, $zero, 4 	# additionImmediateWhithOverflow t0 recebe 0 + 4
	sw   $t0 12($s1) 		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 12
	
	addi $t0, $zero, 5	# additionImmediateWhithOverflow t0 recebe 0 + 5
	sw   $t0, 16($s1) 		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 16
	
	addi $t0, $zero, 6 	# additionImmediateWhithOverflow t0 recebe 0 + 6
	sw   $t0, 20($s1) 		# storeWord t0 é gravado no espaço de memoria contando a partidir de s1, com offset 20
		
		
# b) Fazer um programa para somar os 6 primeiros valores do endereço de memória 0x10010000.
# O resultado da soma deverá ser armazenado no registrador $S0.

	addi $s0, $zero, 0 	# additionImmediateWhithOverflow s0 recebe 0 + 0
	
	lw  $t0, 0($s1) 		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 0
	add $s0, $s0, $t0		# s0 = s0 + t0 ; s0 = 0 + 1
	
	lw  $t0, 4($s1) 		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 4
	add $s0, $s0, $t0 	# s0 = s0 + t0 ; s0 = 1 + 2
	
	lw  $t0, 8($s1) 		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 8
	add $s0, $s0, $t0 	# s0 = s0 + t0 ; s0 = 3 + 3
	
	lw  $t0, 12($s1) 		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 2
	add $s0, $s0, $t0 	# s0 = s0 + t0 ; s0 = 6 + 4
	
	lw  $t0, 16($s1)		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 16
	add $s0, $s0, $t0 	# s0 = s0 + t0 ; s0 = 10 + 5
	
	lw  $t0, 20($s1) 		# loadWord t0 recebe a palavra do espaço de memoria contando a partidir de s1, com offset 20
	add $s0, $s0, $t0 	# s0 = s0 + t0 ; s0 = 15 + 6
	

	li   $v0, 1 		# loadImmediate a variavel $v0 recebendo o valor 1
	move $a0, $s0 		# move o conteudo de a0 para s0

syscall				# syscall chama o sistema operacional










