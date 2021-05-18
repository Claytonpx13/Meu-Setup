#!/bin/bash
# ------------------------------------------------------------------------------
# flat_install - Instala pacotes Flatpak
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 30-04-2021
#
# Descrição:
#      Configura o repositório flathub e instala alguns pacotes flatpak
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

pacotes=(org.jdownloader.JDownloader)

for pacote in ${pacotes[@]}
do
	flatpak install flathub ${pacote} -y
done

