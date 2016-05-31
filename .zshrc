autoload -U  colors compinit promptinit bashcompinit
colors
compinit
promptinit
bashcompinit


export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:/home/dcsapak/scripts

alias clearcache='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias mv='mv -iv'
alias mkdir='mkdir -p'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'
alias df='df -kTh'
alias ls='ls -l --color'
alias hidden="ls -d .*"
alias vi='vim'
alias fullupgrade='sudo apt-get update && sudo apt-get dist-upgrade'
alias grep='grep --color'
[[ -e /etc/os-release ]] && source /etc/os-release

bindkey ";5C" forward-word
bindkey ";5D" backward-word

function extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}


function git_branch()
{
  git_status="$(git status 2> /dev/null)"
  pattern="On branch ([^[:space:]]*)"
  if [[ ${git_status} =~ "Your branch is ahead of" ]]; then
    state="+"
  elif [[ ${git_status} =~ "nothing to commit" ]]; then
    state="✔"
  else
    state="·"
  fi
  [[ ${git_status} =~ ${pattern} ]] && branch=${match[1]} && echo "  ${branch} ${state} "
}

function prompt_change()
{
  echo -n '%{\e[2;32;100m%}%{\e[100m%}'
}

function prompt_prefix_tc()
{
  echo '%{\e[38;5;232;42m%}'
}

function prompt_suffix()
{
  echo -n '❯'
  [[ -n "$SSH_CLIENT" ]] && echo -n '%F{cyan}❯'
  [[ ! $EUID -ne 0 ]] && echo -n '%F{red}❯'
  echo -n '%b'
}

function prompt_suffix_tc()
{
  echo -n '%{\e[90;49m%}'
  [[ -n "$SSH_CLIENT" ]] && echo -n '%F{cyan}❯'
  [[ ! $EUID -ne 0 ]] && echo -n '%F{red}❯'
  echo -n '%f'
}

case ${TERM} in
  xterm-* | screen | rxvt*256color)
    export TERM=rxvt-unicode-256color
  #  eval $(dircolors <(awk '/^TERM/ && !x {print "TERM rxvt-unicode-256color"; x=1} 1' <(dircolors -p)))
    PROMPT='$(prompt_prefix_tc) %0~ %b$(prompt_change)$(git_branch)%B$(prompt_suffix_tc) %b'
    ;;
  rxvt*)
    PROMPT='%B%F{magenta}✭ %B%F{black}%0~ %F{white}$(git_branch)$(prompt_suffix) %b'
    ;;
  *)
    prompt redhat
    ;;
esac

#LS_COLORS='di=1;37'
#export  LS_COLORS

zstyle ':completion:*' menu select

zstyle ':completion:*' special-dirs true

setopt completealiases

setopt PROMPT_SUBST

setopt HIST_IGNORE_DUPS

setopt noclobber

setopt correct

SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

ttyctl -f
