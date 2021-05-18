#!/bin/bash
# ------------------------------------------------------------------------------
# install - Menu de Instalação/Configuração do sistema
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 01-05-2021
#
# Descrição:
#      Instala pacotes e restuara as configurações do sistema salvas no github.
#    Este script funciona apenas como uma chamada para os demais scripts de
#    configuração/instalação.
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

# Baixar e execultar scripts
echo "Instalando softwares CLI"
sleep 3
wget -O - https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/scripts/01-softwaresCLI.sh | bash
echo "Mundado repos"
sleep 3
wget -O - https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/scripts/02-debian_sid.sh | bash
echo "Instalando softwares GUI"
sleep 3
wget -O - https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/scripts/03-softwaresGUI.sh | bash
echo "Instalando Flatpaks"
sleep 3
wget -O - https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/scripts/04-flatinstall.sh | bash
echo "Configuracoes finais"
sleep 3
wget -O - https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/scripts/05-config.sh | bash
echo
echo Concluido.
