# Leitura de um arquivo

# Para manipular arquivo, é necessário abrilos no modo que se quer usa-lo [leitura ou escrita]

# Registrador 1 para leitura
# Registrador 2 para escrita

# Abrir em modo de leitura -> ler -> fechar
# Abrir em modo de escrita -> escrever -> fechar

# Leitura:
    # Abrir o arquivo em modo de Leitura
        # Informar o nome o arquivo (diretório)
        # Salvar o descritor do arquivo
        # Ler usando o descritor (registrador)
        # Informar o nome do buffer que vai salvar o conteúdo
        # Informar o tamanho do buffer
    # Fechar o arquivo

# Programa que le o conteúdo de um arquivo e o imprime na tela

.data
    localArquivo: 	.asciiz "saudacao.txt"
    conteudoArquivo:	.space 1024

.text
    # Abrir o arquivo no modo leitura
    li $v0, 13              # Abrir arquivo
    la $a0, localArquivo    # Endereco do arquivo
    li $a1, 0               # Abrir em modo de leitura [0]
    syscall                 # Descritor do arquivo vai para $v0

    move $s0, $v0           # Copia do descritor [backup]
    
    move $a0, $s0
    li $v0, 14              # Ler conteudo do arquivo

    la $a1, conteudoArquivo # Buffer que armazena o conteudo
    li $a2, 1024            # Tamanho do buffer
    syscall

    # Imprimir conteudo do arquivo
    li $v0, 4
    move $a0, $a1
    syscall

    # Fechar o arquivo
    li $v0, 16
    move $a0, $s0 
    syscall
