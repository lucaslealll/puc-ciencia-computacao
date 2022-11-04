#!/bin/bash

# ################################## # 
# PUC MINAS - POÇOS DE CALDAS        #
# CURSO DE CIÊNCIA DA COMPUTAÇÃO     #
# DISCIPLINA DE LABORATÓRIO DE REDES #
#                                    #
# LUCAS OMAR ANDRADE LEAL            #
# 10 DE SETEMBRO DE 2022             #
# ################################## #

# . Obter o endere�o l�gico (IP) local com aux�lio do comando ifconfig

# . Obter as informa��es auxiliares MASCARA e BRADCAST

# . Calcular o endere�o de rede (NET ID)

# . Determinar o intervalo do dom�nio de BRADCAST (NetID ... BradCast)

# . Elaborar os la�os necess�rios para percorrer todos os hosts da rede local

# . Apresentar os end. l�gicos e seus endere�os de hardware  em formato de tabela (duas colunas)



# ALGUMAS DEFINIÇÕES DE CORES PARA OUTPUT NO TERMINAL
red='\033[1;31m'
green='\033[1;32m'
rcor='\e[0m'

clear

echo -e "${green}Lab Redes - Mapermento ARP | Lucas Omar Andrade Leal${rcor}\n"

# SELEÇÃO DOS DADOS EM CAMPOS ESPECÍFICOS DO COMANDO ifconfig
# DEFINIÇÃO DO IP, NETMASK E BROADCAST
ip=$(ifconfig | grep 'inet ' | tail -1 |  awk '{print $2}')
mask=$(ifconfig | grep netmask | tail -1 | awk '{OFS="\t"; print $4}')
broadcast=$(ifconfig | grep broadcast | tail -1 | awk '{OFS="\t"; print $6}')

# FILTRO PARA DEFINIÇÃO DA REDE E DO INTERVALO
rede=$(ifconfig | grep broadcast | tail -1 | awk $'{print $6}' | cut -d '.' -f '1-3')
intervalo=$(ifconfig | grep broadcast | tail -1 | awk $'{print $6}' | cut -d '.' -f '4')

# APRESENTAÇÃO DE DADOS
echo -e "${green}IP \t\t NetMask \t Broadcast \t Rede \t\t Intervalo${rcor}"
echo -e "${ip} \t ${mask} \t ${broadcast} \t ${rede} \t ${intervalo}\n"
echo -e "${green}Address \t HWaddress${rcor}"
arp -ne | awk '{print $1 " \t " $3 " "}' | tail -n +2


# INICIO DE MAPEAMENTO COM LAÇO FOR 
echo -e "\nIniciando mapeamento de hosts na rede"
read -p "Deseja continuar? [Y/n] " option
option=${option,,}

# VERIFICAÇÃO DE OPÇÃO DO USUÁRIO
while [ $option != "y" ] && [ $option != "n" ]; do
    echo -e "\n${red}[Err!]${rcor}\nOpcao nao listada\nDeseja, ou nao, continuar a operacao de mapeamento?"
    read -p "Digite Y para SIM e N para NAO [Y/n] " option
    option=${option,,} # TO LOWER PARA O CARACTERE QUE A PESSOA COLOCAR
done

if [ "$option" == "y" ]; then
    for (( c=1; c -le $bdt_f; c++ )) do
        echo -e "${green}ping -c 1 ${rede}.${c} ${rcor}"
        ping -c 1 ${rede}.${c} | grep 'packets'
        echo
        # ping -c 1 ${rede}.${c} > /dev/null 2>&1 && arp -na | grep -E "${NET}${i}" | awk '{print $1"\t"$2}'
    done
fi

