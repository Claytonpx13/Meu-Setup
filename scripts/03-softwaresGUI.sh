#!/bin/bash
# ------------------------------------------------------------------------------
# softwareGUI - Instalação de pacotes
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 30-04-2021
#
# Descrição:
#      Instala automaticamente os principais softwares GUI
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

deb=(gnome-core firefox firefox-l10n-pt-br vlc vlc-l10n telegram-desktop \
     qbittorrent chromium chromium-l10n gnome-screenshot gimp lollypop   \
     libreoffice libreoffice-l10n-pt-br)

for pacote in ${deb[@]}
do
	echo apt install ${pacote} -y --no-install-recommends
done

