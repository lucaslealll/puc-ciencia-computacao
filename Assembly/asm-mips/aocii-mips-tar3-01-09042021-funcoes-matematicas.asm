.data
    msg:     .asciiz 	"Digite um número: "
    result:  .asciiz    "\nOs resultado de [+ - x ÷] são respectivamente:\n"
    zero:    .double	0.0

.text
# ENTRADA DE DADOS

    ldc1 $f2, zero

    la $a0, msg
    jal printMsg # PRINTA MSG
        jal scanNum
            add.d $f16, $f2, $f0

    ldc1 $f2, zero
    la $a0, msg
    jal printMsg # PRINTA MSG
        jal scanNum
            add.d $f18, $f2, $f0

###### MENSAGEM DE RESULTADO

    la $a0, result
    jal printMsg # PRINTA MSG RESULTADO

    jal soma
        jal n
    jal subt
        jal n
    jal multi
        jal n
    jal divis

###### PROCESSAMENTO E SAIDA
    jal fim

###### FUNÇÕES ######
# IMPRIME MENSAGEM
printMsg:
	li $v0, 4
	syscall
	jr $ra # volta para a chamada da função

# LE DOUBLE
scanNum:
	li $v0, 7 # Double fica em $f0
	syscall
	jr $ra # volta para a chamada da função

# IMPRIME DOUBLE
printNum:
    li $v0, 3
	syscall
    jr $ra
	
n:
    la $a0, '\n'
    li $v0, 11
    syscall
    jr $ra

fim:
    li $v0, 10
    syscall

###### OPERAÇÕES ######
soma:
    add.d $f12, $f16, $f18
    li, $v0, 3
    syscall
    jr $ra

subt:
    sub.d $f12, $f16, $f18
    li, $v0, 3
    syscall
    jr $ra

multi:
    mul.d $f12, $f16, $f18
    li, $v0, 3
    syscall
    jr $ra

divis:
    div.d $f12, $f16, $f18
    li, $v0, 3
    syscall
    jr $ra