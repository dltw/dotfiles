### ~/.zshrc

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
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt nobeep
setopt complete_aliases
setopt complete_in_word
setopt correct_all
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt share_history
setopt noautoremoveslash
setopt nolistbeep
setopt path_dirs

### autoloads
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload predict-on
autoload history-search-end
autoload -Uz select-word-style && select-word-style default
autoload -Uz zmv
autoload -U url-quote-magic
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

### prompt

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{yellow}$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{red}✗"
    fi
  fi
}

vim_prompt() {
  if [ ! -z $VIMRUNTIME ]; then
    echo ":%F{green}sh ";
  fi
}

PROMPT='%F{green}%m%f:$(vim_prompt)%F{reset}%~$(git_prompt)%f %# '
RPROMPT='[%F{green}%!%f][%F{magenta}%D{%Y-%m-%f}%f|%F{yellow}%*%f]'

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-git-prompt/zshrc.sh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

