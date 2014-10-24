# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="birara"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump brew ruby rbenv bundler rails)

source $ZSH/oh-my-zsh.sh

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

source ~/perl5/perlbrew/etc/bashrc
export PATH=~/.cpanm:$PATH

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
