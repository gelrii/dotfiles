# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## BASH HISTORY SETTINGS ##
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Set history file size
export HISTSIZE=2000

# Make Bash append rather than overwrite the history on disk
shopt -s histappend

# don't truncate the history file
export HISTFILESIZE=""

# Write history before accepting a new command
# then read back the merged list
if [ $TERM = xterm ] || [ $TERM = rxvt ]
then
        export PROMPT_COMMAND='history -a; history -c; history -r;echo -ne "\033]0;${PWD}\007"'
else
        export PROMPT_COMMAND='history -a; history -c; history -r'
fi

# Ignore certain useless history entries
export  HISTIGNORE=*history*:ls:ll:la:cd:pwd:gpg:exit:su:df:clear

# Window size sanity check
shopt -s checkwinsize

# User/root variables definition
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored XTERM promp
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 2 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Prompt
# \u user - \h host - \w working directory - \A time - \n new line
# setaf 2 green - sgr0 default
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 2)\]┌────╼ \[$(tput sgr0)\][ssh] \u@\h:\w [\A]\n\[$(tput setaf 2)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput sgr0)\]└╼ \"; else echo \"\[$(tput setaf 2)\]└╼ \"; fi) \[$(tput sgr0)\]"
else
export PS1="\[$(tput setaf 2)\]┌────╼ \[$(tput sgr0)\]\u@\h:\w [\A]\n\[$(tput setaf 2)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 2)\]└╼ \"; else echo \"\[$(tput setaf 2)\]└╼ \"; fi) \[$(tput sgr0)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG

# I this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Colour support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Auto-completion 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Go back with ..
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

# Colour man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Auto cd
shopt -s autocd

# Execute ls after changing directory
function cd()
{
 builtin cd "$*" && ls
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Set default text editor to nano instead of vi
export EDITOR=nano
