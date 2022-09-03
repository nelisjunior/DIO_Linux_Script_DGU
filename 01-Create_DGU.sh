#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões"
#

source 00-settings.sh

LOG=$LOGSCRIPT


clear
if [ "$USUARIO" == "0" ]
	then
		echo -e "O usuário é Root, continuando com o script..."
		sleep 3
	else
		echo -e "Usuário não é Root ($USUARIO ($UBUNTU)"
		echo -e "Caso você não tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi


echo -e "Início do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
clear
echo

echo -e "Criando diretórios. Por favor, aguarde..." &>> $LOG
echo
sleep 3

mkdir /home/publico
mkdir /home/adm
mkdir /home/ven
mkdir /home/sec

echo -e "Diretórios criados!" &>> $LOG
clear

sleep 3

echo -e "Criando grupos de usuários. Por favor, aguarde..." &>> $LOG
echo
sleep 3

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo -e "Grupos criados!" &>> $LOG
clear

sleep 3

echo "Criando usuários. Por favor, aguarde..." &>> $LOG
echo
sleep 3

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo -e "Usuários criados!" &>> $LOG
clear

sleep 3

echo "Especificando permissões dos diretórios. Por favor, aguarde..." &>> $LOG
echo
sleep 3

chown root:GRP_ADM /home/adm
chown root:GRP_VEN /home/ven
chown root:GRP_SEC /home/sec

chmod 770 /home/adm
chmod 770 /home/ven
chmod 770 /home/sec
chmod 777 /home/publico

echo -e "Especificações finalizadas!" &>> $LOG

clear

sleep 3

echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
read
exit 1