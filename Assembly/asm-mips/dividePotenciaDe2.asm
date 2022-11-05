# PROGRAMA QUE DIVIDE POTENCIA DE 2 VALORES

# a divisao por potencia segue e logica de deslocamento dos bites de um binario
# deslocando para a direit a potencia se diminui na base 2...
#srl só salva a parte inteira da divisao

# sem dados a serem gravados na RAM, logo, nao precisa do .data

# colocar instrucoes dos programas
.text
	#dividindo 32 / 4 (move 2x para a direita)
	li $t0, 32		# t0 recebe imediatamente (sem necessidade de variavel extra) o valore de 32

	srl $s0, $t0, 2		# s0 recebe o valor da divisao de t0 por 2 elevado a 2... 2² = 4
	
	# 'lo' recebe a parte inteira do resto da divisao (6)
	# 'hi' recebe a parte decimal do resto da divisao (2)
	
	# move a parte inteira para s0
	mflo $s1
	
	# move a parte decimal para s1
	mfhi $s2