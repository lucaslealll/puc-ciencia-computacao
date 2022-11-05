# PROGRAMA QUE DIVIDE INTEIROS

# 'lo' e 'hi' nao fazem parte dos 32 registradores...são especificos para divisao

# sem dados a serem gravados na RAM, logo, nao precisa do .data

# colocar instrucoes dos programas
.text
	li $t0, 32		# t0 recebe imediatamente (sem necessidade de variavel extra) o valore de 32
	li $t1, 5		# t1 recebe imediatamente (sem necessidade de variavel extra) o valore de 5
	
	div $t0, $t1		# divide o valor de t0 por t1
	
	# 'lo' recebe a parte inteira do resto da divisao (6)
	# 'hi' recebe a parte decimal do resto da divisao (2)
	
	# move a parte inteira para s0
	mflo $s0
	
	# move a parte decimal para s1
	mfhi $s1