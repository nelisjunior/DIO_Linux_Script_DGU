#!/bin/bash
#
clear
echo -e "Aguarde: atualizando o servidor..."
sleep 3
#
	apt-get update
	apt-get upgrade -y
#
clear
echo -e "Servidor atualizado!"
sleep 3
#
clear
echo -e "Aguarde: instalando apache2..."
sleep 3
#
        apt-get install apache2 -y
#
clear
echo -e "Apache instalado!"
sleep 3
#
clear
echo -e "Aguarde: instalando unzip..."
sleep 3
	apt-get install unzip -y
#
clear
echo -e "Baixando e copiando os arquivos da aplicação..."
sleep 3
#
	cd /tmp
	wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
	unzip main.zip
	cd linux-site-dio-main
	cp -R * /var/www/html/
#
clear
echo -e "Aplicação instalada com sucesso!"
sleep 3
#
clear
echo -e "Script finalizado!"
sleep 3
exit
