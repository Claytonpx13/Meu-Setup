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
wget -O /etc/default/grub https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/etc/default/grub

mkdir -p /etc/skel/.config
wget -O /etc/skel/.config/user-dirs.dirs https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.config/user-dirs.dirs

mkdir -p /etc/skel/.local/bin
wget -O /etc/skel/.local/bin/cleaner https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.local/bin/cleaner
wget -O /etc/skel/.bashrc https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.bashrc
wget -O /etc/skel/.profile https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.profile

wget -O /etc/vim/vimrc https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/etc/vim/vimrc

wget -O /etc/bash.bashrc https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/etc/bash.bashrc
wget -O /etc/hostname https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/etc/hostname
wget -O /etc/nftables.conf https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/etc/nftables.conf
echo "nameserver 1.1.1.2
nameserver 1.0.0.2" > /etc/resolv.conf

mkdir /home/clayton/.config
wget -O /home/clayton/.config/user-dirs.dirs https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.config/user-dirs.dirs

mkdir -p /home/clayton/.local/bin
wget -O /home/clayton/.local/bin/cleaner https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.local/bin/cleaner

wget -O /home/clayton/.bashrc https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.bashrc
wget -O /home/clayton/.profile https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.profile
wget -O /home/clayton/.selected_editor https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/home/clayton/.selected_editor

mkdir -p /root/.local/bin
wget -O /root/.local/bin/autoUpdate https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/root/.local/bin/autoUpdate
wget -O /root/.local/bin/cleaner https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/root/.local/bin/cleaner

wget -O /root/.bashrc https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/root/.bashrc
wget -o /root/.profile https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/root/.profile

mkdir -p /usr/local/etc/nftables.d
wget -O /usr/local/etc/nftables.d/portScan.nft https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/usr/local/etc/nftables.d/portScan.nft
wget -O /usr/local/etc/nftables.d/valveSteam.nft https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/usr/local/etc/nftables.d/valveSteam.nft

# Configurações do agendador de tarefas
mkdir -p /var/spool/cron/crontabs
wget -O /var/spool/cron/crontabs/clayton https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/var/spool/cron/crontabs/clayton
wget -O /var/spool/cron/crontabs/root https://raw.githubusercontent.com/Claytonpx13/Meu-Setup/master/main/var/spool/cron/crontabs/root

# Atualizando o Grub
update-grub

# Subindo as regras de firewall
systemctl start nftables.service
systemctl enable nftables.service

# Atribuindo permissões em arquivos
chown -R clayton.clayton /home/clayton
chmod +x /home/clayton/.local/bin/cleaner
chmod +x /root/.local/bin/autoUpdate
chmod +x /root/.local/bin/cleaner

# Criando Diretórios
mkdir /home/clayton/Desktop
mkdir /home/clayton/Downloads
mkdir /home/clayton/Modelos
mkdir /home/clayton/Documentos
mkdir /home/clayton/Músicas
mkdir /home/clayton/Imagens
mkdir /home/clayton/Vídeos
