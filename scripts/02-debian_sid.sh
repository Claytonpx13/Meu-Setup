#!/bin/bash
# ------------------------------------------------------------------------------
# debian_sid - Atualiza o sistema para Debian sid GNU/Linux-Libre
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 30-04-2021
#
# Descrição:
#      Substitui os repos padrão do debian, pelo resopitório da versão sid
#    e adiciona o repositório do kernel Linux-Libre.
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

# Instalando a chave GPG do Linux-Libre
wget -O - https://jxself.org/gpg.asc | apt-key add -

# Escrevendo o arquivo /etc/apt/sources.list
echo "# Debian GNU/Linux (Sid)
deb https://deb.debian.org/debian sid main" > /etc/apt/sources.list

echo "# Kernel Linux-Libre
deb https://linux-libre.fsfla.org/pub/linux-libre/freesh freesh main" > /etc/apt/sources.list.d/linux-libre.list

# Atualizando o sistema
apt update
apt upgrade -y

# Instalando novo Kernel
apt install linux-libre -y

