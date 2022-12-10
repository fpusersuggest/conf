# $OpenBSD /root/.kshrc 
# nvim 09_12_2022
## Colors:
#BLACK="\033[0;30m"
#GRAY="\033[1;30m"
#RED="\033[0;31m"
#LRED="\033[1;31m"
#GREEN="\033[0;32m"
#LGREEN="\033[1;32m"
LLGREEN="\[\033[1;92m\]"
YELLOW="\[\033[0;33m\]"
#LYELLOW="\033[1;33m"
#BLUE="\033[0;34m"
LBLUE="\[\033[1;34m\]"
#PURPLE="\033[0;35m"
#PINK="\033[1;35m"
#CYAN="\033[0;36m"
#LCYAN="\033[1;36m"
#LGRAY="\033[0;37m"
WHITE="\[\033[1;37m\]"
#
### Backgrounds
#BLACKB="\033[0;40m"
#REDB="\033[0;41m"
#GREENB="\033[0;42m"
#YELLOWB="\033[0;43m"
#BLUEB="\033[0;44m"
#PURPLEB="\033[0;45m"
#CYANB="\033[0;46m"
#GREYB="\033[0;47m"
#
### Attributes:
UNDERLINE="\[\033[4m\]"
#BOLD="\033[1m"
#INVERT="\033[7m"
#
### Cursor movements
#CUR_UP="\033[1A"
#CUR_DN="\033[1B"
#CUR_LEFT="\033[1D"
#CUR_RIGHT="\033[1C"
#
### Start of display (top left)
#SOD="\033[1;1f"
# reset console
NORM="\[\033[0m\]"
#
#
alias lw-s_ssh='rcctl -f start sshd'
alias lw-h_ssh='rcctl -f stop sshd'
alias lw-rdate='rdate pool.ntp.org'
alias ls='colorls -G'
alias lw-update='syspatch ; fw_update -a ; pkg_add -uU'


# PS1='\a\e[1;32m\a[ ${USER}\a\e[m\a@${HOSTNAME%%.*} \a\e[33m\a$(pwd) \a\e[1;34m\a] \a\e[m\a$PS1S'

## check page https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/
## https://misc.flogisoft.com/bash/tip_colors_and_formatting
# PS1='\e[1;34m [ \e[1;92m\a`tput smul`\u`tput rmul`\e[1;0m\a@\e[1;34m\a\h \e[1;0m\t \e[33m\a\w \a\e[1;34m\a] \e[m\a\$ '

LBLUE="\[\033[1;49;34m\]"
YELLOW="\[\033[1;49;93m\]"
PATH=$PATH:~/.local/bin
PS1='$UNDERLINE$LLGREEN\u$NORM@$LBLUE\h $NORM\t $YELLOW\w $LLGREEN\$$NORM '
#PS1="\[\e[1;31m\]┌\[\e[m\]\[\e[1;31m\][\[\e[31m\]\u\[\e[33m\]@\[\e[1;32m\]\h\[\e[1;31m\]]\[\e[1;31m\]\[\e[1;31m\]─[\[\e[1;33m\]\$PWD\[\e[1;31m\]]─\[   \[\e[m\]\n\[\e[1;31m\]└\[\e[m\]\[\e[1;31m\][\[\e[m\]\j\[\e[1;31m\]]\[\e[m\]\[\e[1;31m\]─ \[\e[m\]"
#PS1="$LBLUE\u$NORM@$LBLUE\h $NORM\t $YELLOW\w $NORM\$ " 


