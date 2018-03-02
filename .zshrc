# Customize to your needs...

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

REPORTTIME=10

function history-all { history -E 1 } # 全履歴の一覧を出力する

# プロンプトのカラー表示を有効
autoload -U colors
colors

# デフォルトの補完機能を有効
autoload -U compinit
compinit

# 補完侯補をEmacsのキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd
setopt hist_ignore_dups
setopt autopushd
setopt share_history
setopt pushd_ignore_dups

alias rr="rm -rf"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias g="git"
alias b="bundle"

alias dec="docker-compose exec app bin/rails c"
alias deg="docker-compose exec app bin/rails g"
alias deb="docker-compose exec app bundle"
alias drb="docker-compose run --rm app bundle"
alias dra="docker-compose run --rm app"
alias drd="docker-compose run --rm db"
alias dea="docker-compose exec app"
alias ded="docker-compose exec db"
alias docker-compose-app-solargraph="docker-compose run --rm app solargraph"
alias de="docker-compose exec"
alias dr="docker-compose run"
alias d="docker-compose"
alias peco="TERM=xterm peco"

alias ps="ps aux"
alias la="ls -lhAF"

alias -g G='| grep'
alias -g L='| less'
alias -g T='| tail'

alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias emacs='emacs -nw'

export EDITOR=='emacs'

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export PATH="$HOME/.rbenv/shims:$PATH"

function peco-select-history() {
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | LANG=ja_JP.UTF-8 peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N peco-select-history
bindkey '^R' peco-select-history

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
