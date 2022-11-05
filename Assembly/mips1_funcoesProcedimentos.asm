# FUNÇÕES E PROCEDIMENTOS
	# - jal (jump and link) realiza jump para algum rótulo de função e permite a volta à
	# chamada pelo registrador $ra
	# - jr (jump registrador) $ra volta para quem chamou a função
	# $a0~$a3 como registradores
	# $v0~$v1 como returns de função


# .data é local onde se especifica as variaveis que vao para a RAM
.data

	meuNome:	.asciiz		"Meu nome é Lucas "
	
# .text é o local onde se implementa o codigo principal
.text

	# o .main: ´e uma funcao implicita de todo o programa
	.main:

	la $a0, meuNome
	jal imprime

	li $v0, 10 # encerra o programa
	syscall

imprime:
	# imprime a mensagem
	li $v0, 4
	syscall
	jr $ra # volta para o ponto onde a função foi chamada