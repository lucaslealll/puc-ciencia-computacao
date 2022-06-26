.data
vetor: .word 13, 34, 16, 61, 28
       .word 24, 58, 11, 26, 41
       .word 19, 7, 38, 12, 77
len:   .word 15

.text
	la $s0,vetor
	la $s1,len
	lw $t1,0($s1)
	li $t2,0        #i = 0
	
volta:	lw $a0,0($s0)
	add $s0,$s0,4
	li $v0,1
	syscall
	
	# imprime '\n'
	li $a0, ' '	 
	li $v0, 11 	 
	syscall


	add $t2,$t2,1     # i = i + 1
	beq $t2,$t1, out  # if i == 15 fim
	b volta
	
out: 	li $v0, 10
	syscall	
	
	
	
	

	 	 	 	 	 	 	 	 	 	 	 	 
