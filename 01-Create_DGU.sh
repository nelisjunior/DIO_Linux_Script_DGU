#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões"
#
source 00-settings.sh
#
LOG=$LOGSCRIPT
#
clear
if [ "$USUARIO" == "0" ]
	then
		echo -e "O usuário é Root, continuando com o script..."
		sleep 3
	else
		echo -e "Usuário não é Root ($USUARIO)"
		echo -e "Caso você não tenha executado o script com o comando: sudo -i"
		echo -e "Execute novamente o script para verificar o ambiente."
		exit 1
fi
#
clear
echo -e "Início do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n"
sleep 3
#
clear
echo -e "Criando os diretórios. Por favor, aguarde..."
sleep 3
#
	mkdir /home/publico &>> $LOG
	mkdir /home/adm &>> $LOG
	mkdir /home/ven &>> $LOG
	mkdir /home/sec &>> $LOG
#
clear
echo -e "Diretórios criados!"
sleep 3
#
clear
echo -e "Criando grupos de usuários. Por favor, aguarde..."
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
echo "Criando usuários. Por favor, aguarde..."
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
echo -e "Usuários criados!"
sleep 3
#
clear
echo "Especificando permissões dos diretórios. Por favor, aguarde..."
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
echo -e "Especificações finalizadas!"
sleep 3
#
echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")"
#
sleep 3s
clear
#
exit 1
