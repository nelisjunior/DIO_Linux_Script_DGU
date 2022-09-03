#!/bin/bash

#Script criado a partir do curso: "Infraestrutura como C�digo: Script de Cria��o de Estrutura de Usu�rios, Diret�rios e Permiss�es"
#
source 00-settings.sh
#
LOG=$LOGSCRIPT
#
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
echo -e "In�cio do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")"
sleep 3s
#
clear
#
echo -e "Removendo usu�rios. Por favor, aguarde..." 
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
echo -e "Usu�rios removidos!\n"
#
sleep 3s
clear
#
echo -e "Removendo grupos de usu�rios. Por favor, aguarde..."
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
echo -e "Removendo diret�rios. Por favor, aguarde..."
#
sleep 3s
#
	rmdir -rf /home/publico &>> $LOG
	rmdir -rf /home/adm &>> $LOG
	rmdir -rf /home/ven &>> $LOG
	rmdir -rf /home/sec &>> $LOG
#
clear
echo -e "Diret�rios exclu�dos!"
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
