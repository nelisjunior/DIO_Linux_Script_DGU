#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como C�digo: Script de Cria��o de Estrutura de Usu�rios, Diret�rios e Permiss�es"
#

source 00-settings.sh

LOG=$LOGSCRIPT


clear
if [ "$USUARIO" == "0" ]
	then
		echo -e "O usu�rio � Root, continuando com o script..."
		sleep 3
	else
		echo -e "Usu�rio n�o � Root ($USUARIO ($UBUNTU)"
		echo -e "Caso voc� n�o tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi


echo -e "In�cio do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
clear
echo

echo -e "Criando diret�rios. Por favor, aguarde..." &>> $LOG
echo
sleep 3

mkdir /home/publico
mkdir /home/adm
mkdir /home/ven
mkdir /home/sec

echo -e "Diret�rios criados!" &>> $LOG
clear

sleep 3

echo -e "Criando grupos de usu�rios. Por favor, aguarde..." &>> $LOG
echo
sleep 3

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo -e "Grupos criados!" &>> $LOG
clear

sleep 3

echo "Criando usu�rios. Por favor, aguarde..." &>> $LOG
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

echo -e "Usu�rios criados!" &>> $LOG
clear

sleep 3

echo "Especificando permiss�es dos diret�rios. Por favor, aguarde..." &>> $LOG
echo
sleep 3

chown root:GRP_ADM /home/adm
chown root:GRP_VEN /home/ven
chown root:GRP_SEC /home/sec

chmod 770 /home/adm
chmod 770 /home/ven
chmod 770 /home/sec
chmod 777 /home/publico

echo -e "Especifica��es finalizadas!" &>> $LOG

clear

sleep 3

echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
read
exit 1