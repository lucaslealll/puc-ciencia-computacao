# FUNÇÕES E PROCEDIMENTOS



# .data é local onde se especifica as variaveis que vao para a RAM
.data

	msg:		.asciiz		"Digite um valor: "
	saida:		.asciiz  	"O valor flutuante digitado é: "
	
# .text é o local onde se implementa o codigo principal
.text

	# o .main: ´e uma funcao implicita de todo o programa
	.main: