### ~/.zshrc
### Author: David Leong
### Updated: 22 Apr 2020

### constants
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=vim
export PATH=$PATH:$HOME/local/bin
export PATH=$PATH:/sbin:/usr/local/bin
export ALIASES=$HOME/.aliases
export CLICOLOR=1

### setopt
setopt auto_menu
setopt nobeep
setopt complete_aliases
setopt complete_in_word
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt extended_history
setopt path_dirs

### autoloads
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz select-word-style && select-word-style default
autoload -U compinit && compinit

### zstyles
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

### aliases
source $ALIASES

### git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{yello}%b%f'

### prompt
PROMPT='%F{green}%m%f:%1~ '\$vcs_info_msg_0_'%# '
#RPROMPT='[%F{cyan}%!%f][%F{magenta}%D{%y%m%d}%f|%F{yellow}%*%f]'
RPROMPT='[%F{cyan}%!%f][%F{yellow}%*%f]'

