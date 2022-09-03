#=============================================================================================
#                    VARI�VEIS GLOBAIS UTILIZADAS EM TODOS OS SCRIPTS                        #
#=============================================================================================
#
# Declarando as vari�veis utilizadas na verifica��o e valida��o da vers�o do Ubuntu Server 
#
# Vari�vel da Hora Inicial do Script, utilizada para calcular o tempo de execu��o do script
# op��o do comando date: +%T (Time)
HORAINICIAL=$(date +%T)
#
# Vari�veis para validar o ambiente, verificando se o usu�rio � "Root" e vers�o do "Ubuntu"
# op��es do comando id: -u (user)
# op��es do comando: lsb_release: -r (release), -s (short), 
USUARIO=$(id -u)
UBUNTU=$(lsb_release -rs)
#
# Vari�vel do Caminho e Nome do arquivo de Log utilizado em todos os script
# op��o da vari�vel de ambiente $0: Nome do comando/script executado
# op��o do redirecionador | (piper): Conecta a sa�da padr�o com a entrada padr�o de outro comando
# op��es do comando cut: -d (delimiter), -f (fields)
LOGSCRIPT="/var/log/$(echo $0 | cut -d'/' -f2)"
#
# Exportando o recurso de Noninteractive do Debconf para n�o solicitar telas de configura��o e
# nenhuma intera��o durante a instala��o ou atualiza��o do sistema via Apt ou Apt-Get. Ele 
# aceita a resposta padr�o para todas as perguntas.
export DEBIAN_FRONTEND="noninteractive"