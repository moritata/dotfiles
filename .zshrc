#
# $id$
#

autoload -U compinit
compinit
zstyle ':completion:*' list-colors ''
#HOSTNAME=`hostname | awk -F'.' '{print $1}'`
#export HOSTNAME

bindkey -e
bindkey "^?" backward-delete-char
alias screen='screen -U -t ${HOST%%.*}'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  #eval "`dircolors -b`"
  #alias ls='ls --color=auto'
  alias vi='vim'
  EDITOR=vim
  export EDITOR
  #alias dir='ls --color=auto --format=vertical'
  #alias vdir='ls --color=auto --format=long'
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

case ${UID} in
0)
  PROMPT="%B%{\e[36m%}%/#%{\e[m%}%b "
  PROMPT2="%B%{\e[36m%}%_#%{[m%}%b "
  SPROMPT="%B%{\e[36m%}%r is correct? [n,y,a,e]:%{\e[m%}%b "
  BPROMPT=$"%{\e[34m%}%n@%U%m%u%{\e[37m%}"
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{\e[34m%}${HOST%%.*}\e[37m%}:${PROMPT}"
  PROMPT="${BPROMPT}:${PROMPT}"
  ;;
*)
  PROMPT=$'%{\e[36m%}%~$%{\e[m%} '
  PROMPT2=$'%{\e[36m%}%_$%{\e[m%} '
  SPROMPT=$'%{\e[[36m%}%r is correct? [n,y,a,e]:%{\e[m%} '
  BPROMPT=$'%{\e[33m%}%n@%U%m%u%{\e[37m%}'
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="${BPROMPT}:${PROMPT}"
  ;;
esac

#TERM="xterm-256color"
#TERM="screen-256color"
TERM="xterm"

case "${TERM}" in
  kterm*|xterm)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  ;;
esac

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt auto_pushd
#setopt correct
setopt list_packed
# setopt nolistbeep

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

ssh_screen(){
 eval server=\${$#}
 screen -t $server ssh "$@"
}
#if [ x"$TERM" = x"screen-bce" || x"$TERM" = x"xterm-256color" ]; then
if [[ "$TERM" = "screen-bce" || "$TERM" = "xterm-256color" || "$TERM" = "xterm" ]]; then
  alias xssh=ssh_screen
fi


export TERM

#JAVA_HOME="/usr/java"
#PATH=${JAVA_HOME}/bin:${PATH}
#export JAVA_HOME PATH

#
### Sybase Product Environment variables
#
#SYBASE_ASE="ASE-15_0"

#export SYBASE_ASE
#PATH="/opt/sybase/ASE-15_0/bin:/opt/sybase/ASE-15_0/install":$PATH
#export PATH
#LD_LIBRARY_PATH="/opt/sybase/ASE-15_0/lib":$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH
#SYBASE="/opt/sybase"
#export SYBASE
#SYBASE_OCS="OCS-15_0"
#export SYBASE_OCS
#PATH="/opt/sybase/OCS-15_0/bin":$PATH
#export PATH
#LD_LIBRARY_PATH="/opt/sybase/OCS-15_0/lib:/opt/sybase/OCS-15_0/lib3p":$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH
#INCLUDE="/opt/sybase/OCS-15_0/include":$INCLUDE
#export INCLUDE
#LIB="/opt/sybase/OCS-15_0/lib":$LIB
#export LIB
#SYBASE_JRE="/opt/sybase/shared/jre142"
#export SYBASE_JRE
#SYBASE_SYSAM="SYSAM-2_0"
#export SYBASE_SYSAM
#PATH="/opt/sybase/ua/bin":$PATH
#export PATH
#SYBASE_UA="/opt/sybase/ua"
#export SYBASE_UA
#SCROOT="/opt/sybase/shared/sybcentral43"
#export SCROOT
#PATH="/opt/sybase/RPL-15_0/bin":$PATH
#export PATH
#SYBROOT="/opt/sybase"
#export SYBROOT

#
### Oracle Product Environment variables
#
#ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
#ORACLE_OWNER=oracle
#ORACLE_SID=XE
#LSNR=$ORACLE_HOME/bin/lsnrctl
#SQLPLUS=$ORACLE_HOME/bin/sqlplus
#export ORACLE_HOME ORACLE_OWNER ORACLE_SID LSNR SQLPLUS NLS_LANG
#PATH=$ORACLE_HOME/bin:$PATH

#NLS_LANG=Japanese_Japan.UTF8
LANG=ja_JP.UTF-8
#
export LANG

## Amaqzon Web Service Environment
AWS_CREDENTIAL_FILE=/home/ec2-user/.aws/credential-file.txt
EC2_PRIVATE_KEY=~/.aws/pk-ULUGJGSZJ7KBOTULIFST73LZI757AGYT.pem
EC2_CERT=~/.aws/cert-ULUGJGSZJ7KBOTULIFST73LZI757AGYT.pem
EC2_URL=http://ec2.ap-northeast-1.amazonaws.com/
export AWS_CREDENTIAL_FILE EC2_PRIVATE_KEY EC2_CERT EC2_URL

PATH=~/bin:/usr/local/bin:$PATH
export PATH

[[ -s "/home/morita/.rvm/scripts/rvm" ]] && source "/home/morita/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH
