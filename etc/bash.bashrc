# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='\[\e[1;32m\]\342\224\214\342\224\200\[\e[1;32m\][\[\e[1;36m\]\u\[\e[1;33m\]@\[\e[1;37m\]\h\[\e[1;32m\]]\[\e[1;32m\]\342\224\200\[\e[1;32m\][\[\e[1;37m\]\w\[\e[1;32m\]]\[\e[1;32m\]\342\224\200[\[\e[1;37m\]\t\[\e[1;32m\]]\n\[\e[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\e[1;32m\] \$ \[\e[0m\]'

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

### Aliases
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### Funções
function getUpdates()
{
    # Procura e instala pacotes dos repositórios oficiais do sistema
    # assim como pacotes flatpak caso também estejam presentes.
    sudo apt update
    sudo apt full-upgrade -y
    flatpak update -y
}

# Conversão para maiúscula.
function upper()
{
    # Lê a sequencia de caracteres da entrada padrão
    # da função e realiza a conversão a conversão dos caracteres para maiúsculo.
    tr '[:lower:]' '[:upper:]'
}

# Conversão para minúscula.
function lower()
{
    # Lê a sequencia de caracteres da entrada padrão
    # da função e realiza a conversão a conversão dos caracteres para minúsculo.
    tr '[:upper:]' '[:lower:]'
}

