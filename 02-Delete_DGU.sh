#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões"
#
source 00-settings.sh
#
LOG=$LOGSCRIPT
#
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
echo -e "Início do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")"
sleep 3s
#
clear
#
echo -e "Removendo usuários. Por favor, aguarde..." 
sleep 3s
#
	userdel carlos -f -r &>> $LOG
	userdel maria -f -r &>> $LOG
	userdel joao -f -r &>> $LOG
#
	userdel debora -f -r &>> $LOG
	userdel sebastiana -f -r &>> $LOG
	userdel roberto -f -r &>> $LOG
#
	userdel josefina -f -r &>> $LOG
	userdel amanda -f -r &>> $LOG
	userdel rogerio -f -r &>> $LOG
#
clear
echo -e "Usuários removidos!\n"
#
sleep 3s
clear
#
echo -e "Removendo grupos de usuários. Por favor, aguarde..."
#
sleep 3
clear
#
	groupdel GRP_ADM &>> $LOG
	groupdel GRP_VEN &>> $LOG
	groupdel GRP_SEC &>> $LOG
#
clear
echo -e "Grupos Removidos!\n"
#
sleep 3s
#
clear
echo -e "Removendo diretórios. Por favor, aguarde..."
#
sleep 3s
#
	rmdir -rf /home/publico &>> $LOG
	rmdir -rf /home/adm &>> $LOG
	rmdir -rf /home/ven &>> $LOG
	rmdir -rf /home/sec &>> $LOG
#
clear
echo -e "Diretórios excluídos!"
#
sleep 3s
clear
#
echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")"
#
sleep 3s
clear
#
exit 1
