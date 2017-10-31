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
alias de="docker-compose exec"
alias dr="docker-compose run"
alias d="docker-compose"

alias ps="ps aux"
alias la="ls -lhAF"
alias cl="make -f ~/Makefile clean"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias -g G='| grep'
alias -g L='| less'
alias -g T='| tail'

alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'

[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# export RBENV_ROOT=/usr/local/opt/rbenv

case "$TERM" in
  dumb | emacs)
    PROMPT="%m:%~> "
    unsetopt zle
    ;;
esac

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
