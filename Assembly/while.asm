.text

	move $t0, $zero		# t0 recebe o valor de 0
	
	while:
		beq  $t0, 10, saida	# verifica se t0 é igal a 10
		addi $t0, $t0, 1	# add 1 ao 
		j while			# comando jump... Faz pular para uma linha de codigo
	
	saida:	# rotulo de saida do loop
		li $v0, 1
		move $v0, $t0
		syscall