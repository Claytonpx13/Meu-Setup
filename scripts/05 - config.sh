#!/bin/bash
# ------------------------------------------------------------------------------
# config - Copia minhas configurações para o sistema atual
#
# Autor: Clayton Pereira
# Contato: Telegram: @Clayton_Pereira
# Data da ultima modificação: 30-04-2021
#
# Descrição:
#      Baixa do github minhas configurações principais do sistema e substitui a
#    configuração atual.
#
# Licença: GPLv3 <https://www.gnu.org/licenses/gpl-3.0.txt>
# ------------------------------------------------------------------------------

# Verificar se o usuário 'clayton' existe!
if ! grep "^clayton" /etc/passwd
then
	# Se o usuário não existir, ele será criado
	useradd clayton --create-home --shell /bin/bash --comment "Clayton Pereira"
fi

# Adicionando permissões de uso do sudo
adduser clayton sudo
echo "clayton ALL=(ALL:ALL) ALL" > /etc/sudoers.d/clayton
chmod 0440 /etc/sudoers.d/clayton

# Criando Diretórios e copiando arquivos
wget -O /etc/default/grub link

mkdir -p /etc/skel/.config
wget -O /etc/skel/.config/user-dirs.dirs

mkdir -p /etc/skel/.local/bin
wget -O /etc/skel/.local/bin/cleaner link
wget -O /etc/skel/.bash_logout
wget -O /etc/skel/.bashrc
wget -O /etc/skel/.profile

wget -O /etc/vim/vimrc

wget -O /etc/bash.bashrc
wget -O /etc/hostname
wget -O /etc/nftables.conf
wget -O /etc/resolv.conf

mkdir /home/clayton/.config
wget -O /home/clayton/.config/user-dirs.dirs

mkdir -p /home/clayton/.local/bin
wget -O /home/clayton/.local/bin/cleaner

wget -O /home/clayton/.bashrc
wget -O /home/clayton/.profile
wget -O /home/clayton/.selected_editor

mkdir -p /root/.local/bin
wget -O /root/.local/bin/autoUpdate
wget -O /root/.local/bin/cleaner
wget -O /root/.local/bin/scan

mkdir -p /root/.quarentena

wget -O /root/.bashrc
wget -o /root/.profile

mkdir -p /usr/local/etc/nftables.d
wget -O /usr/local/etc/nftables.d/portScan.nft
wget -O /usr/local/etc/nftables.d/valveSteam.nft

# Configurações do agendador de tarefas
mkdir -p /var/spool/cron/crontabs
wget -O /var/spool/cron/crontabs/clayton
wget -O /var/spool/cron/crontabs/root

# Atualizando o Grub
update-grub

# Subindo as regras de firewall
systemctl start nftables.service
systemctl enable nftables.service

