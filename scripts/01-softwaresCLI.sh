#!/bin/bash
# ------------------------------------------------------------------------------
# softwareCLI - Instalação de pacotes
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 30-04-2021
#
# Descrição:
#      Instala automaticamente os principais softwares CLI
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

apt update

apt purge mawk -y

deb=(bc curl deborphan gnupg2 apt-transport-https \
     nftables p7zip-full sudo vim wget youtube-dl \
     gawk apt-transport-tor sudo bash-completion)

for pacote in ${deb[@]}
do
	apt install ${pacote} -y --no-install-recommends
done
