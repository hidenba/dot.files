HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

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
alias brails="bundle exec rails"
alias brake="bundle exec rake"
alias rsp="rake spec"
alias rs="rails s"
alias rc="rails c"
alias rg="rails g"
alias rd="rails dbconsole"
alias be="bundle exec"


alias la="ls -lhAF"
alias cl="make -f ~/Makefile clean"

alias enw="emacs -nw"
alias -g G='| grep'
alias -g L='| less'
alias -g T='| tail'

alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

PROMPT="(｀〜´)ﾀﾘｰ "

RPROMPT="[%~]"

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

