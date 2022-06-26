# x = (((-7+3,57) / (2*2)) * (3,14 - ((2^3) / 5)))
# x = -1.3205500000000001

.data
   equacao:  .asciiz   "x = (((-7.0+3,57) / (2*2.0)) * (3,14 - ((2.0^3) / 5)))\n\n"
   msga:	    .asciiz   "Digite um valor para 'a', Ex: 2.0: "
   msgb:	    .asciiz   "Digite um valor para 'b', Ex: 7.0:"
   b2:       .double   3.57
   pi:       .double   3.14
   zero:     .double   0.0
   dois:     .double   2.0
   tres:     .double   3.0
   cinco:    .double   5.0
   result:   .asciiz   "\nX = "

.text
# MOSTRA A EQUAÇÃO
   li $v0,4
   la $a0, equacao
   syscall

# ENTRADA DE DADOS
   ldc1  $f2, zero # DETERMINA QUE F2 VALE ZERO
   la $a0, msga
   jal printMsg # PRINTA MSGA
   jal scanNum # RECEBE O VALOR QUE O USUARIO ENTRA NO TECLADO
      add.d $f16, $f2, $f0 # ARMAZENA VALOR DE A EM F16

   ldc1  $f2, zero # DETERMINA QUE F2 VALE ZERO
   la $a0, msgb
   jal printMsg # PRINTA MSGB
   jal scanNum # RECEBE O VALOR QUE O USUARIO ENTRA NO TECLADO
      add.d $f18, $f2, $f0 # ARMAZENA VALOR DE B EM F18 
      sub.d $f18, $f2, $f0 # TRANSFORMA F16 EM NEGATIVO

###### PROCESSAMENTO E SAIDA
   jal operaco
   
jal fim

###### OPERAÇÕES ######
#    ((-7+3,57) / 2*2) * (3,14 - ((2^3) / 5))

operaco:
   ldc1  $f6, b2  # F2 = 3.57
   #-b + 3.57
   add.d $f20, $f18, $f6

         # mov.d $f12, $f20
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall

   #2a
   ldc1  $f2, dois  # F2 = 3.57
   mul.d $f22, $f16, $f2

         # mov.d $f12, $f22
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall

   #(-b + 3.57)/2a =======>>> F24
   div.d $f24, $f20, $f22

         # mov.d $f12, $f24
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall
   # a³
   # fazer laço de multiplicação
   mul.d $f26, $f16, $f16
   mul.d $f26, $f26, $f16 # F26 ====> a³

         # mov.d $f12, $f26
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall
   # a³/5
   ldc1  $f4, cinco
   div.d $f28, $f26, $f4

         # mov.d $f12, $f28
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall

   # 3.14 - a³/5
   ldc1  $f2, pi
   sub.d $f30, $f2, $f28

         # mov.d $f12, $f30
         # li $v0, 3
         # syscall
         # la $a0, '\n'
         # li $v0, 11
         # syscall

#  ((-7+3,57) / 2*2) * (3,14 - ((2^3) / 5))
   mul.d $f20, $f24, $f30
   
   mov.d $f12, $f20
   li $v0, 3
   syscall

jr $ra


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
	
n: la $a0, '\n'
   li $v0, 11
   syscall
jr $ra

fim:li $v0, 10
   syscall
