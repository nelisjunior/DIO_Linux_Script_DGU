#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como C�digo: Script de Cria��o de Estrutura de Usu�rios, Diret�rios e Permiss�es"
#
source 00-settings.sh
#
LOG=$LOGSCRIPT
#
clear
if [ "$USUARIO" == "0" ]
	then
		echo -e "O usu�rio � Root, continuando com o script..."
		sleep 3
	else
		echo -e "Usu�rio n�o � Root ($USUARIO)"
		echo -e "Caso voc� n�o tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi
#
clear
echo -e "In�cio do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n"
sleep 3
#
clear
echo -e "Criando os diret�rios. Por favor, aguarde..."
sleep 3
#
	mkdir /home/publico &>> $LOG
	mkdir /home/adm &>> $LOG
	mkdir /home/ven &>> $LOG
	mkdir /home/sec &>> $LOG
#
clear
echo -e "Diret�rios criados!"
sleep 3
#
clear
echo -e "Criando grupos de usu�rios. Por favor, aguarde..."
sleep 3
#
	groupadd GRP_ADM &>> $LOG
	groupadd GRP_VEN &>> $LOG
	groupadd GRP_SEC &>> $LOG
#
clear
echo -e "Grupos criados!"
sleep 3
#
clear
echo "Criando usu�rios. Por favor, aguarde..."
sleep 3
#
	useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM &>> $LOG
	useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM &>> $LOG
	useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM &>> $LOG
#
	useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN &>> $LOG
	useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN &>> $LOG
	useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN &>> $LOG
#
	useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC &>> $LOG
	useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC &>> $LOG
	useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC &>> $LOG
#
clear
echo -e "Usu�rios criados!"
sleep 3
#
clear
echo "Especificando permiss�es dos diret�rios. Por favor, aguarde..."
sleep 3
#
	chown root:GRP_ADM /home/adm &>> $LOG
	chown root:GRP_VEN /home/ven &>> $LOG
	chown root:GRP_SEC /home/sec &>> $LOG
#
	chmod 770 /home/adm &>> $LOG
	chmod 770 /home/ven &>> $LOG
	chmod 770 /home/sec &>> $LOG
	chmod 777 /home/publico &>> $LOG
#
clear
echo -e "Especifica��es finalizadas!"
sleep 3
#
echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")"
#
sleep 3s
clear
#
exit 1
