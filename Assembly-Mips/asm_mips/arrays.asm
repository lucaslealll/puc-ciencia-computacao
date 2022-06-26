.data
	meuArray:
		.align 2
		.space 16 # Aloca 4 espaços
		
.text
	move $t0, $zero # índice do array
	move $t1, $zero # valor a ser colocado no array (auxiliar)
	li   $t2, 16 	# tamanho do array

loop:
	sw   $t1, meuArray($t0)
	addi $t0, $t0, 4 # adiciona 4 ao contador
	addi $t1, $t1, 1 # adiciona 1 ao valor do array
	beq  $t0, 16, saiDoLoop
j loop

saiDoLoop:
	move $t0, $zero
	imprime:
		beq $t0, $t2, saiDaImpressao
		li  $v0, 1
		lw  $a0, meuArray($t0)
		syscall
		addi $t0, $t0, 4
	j imprime
		
saiDaImpressao:	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	