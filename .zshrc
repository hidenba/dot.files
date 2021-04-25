# Customize to your needs...

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

REPORTTIME=10

function history-all { history -E 1 } # 全履歴の一覧を出力する

# プロンプトのカラー表示を有効
autoload -U colors
colors
force_color_prompt=yes

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

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

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

GEM_EXE_DIR=`gem env | grep "EXECUTABLE DIRECTORY" | awk '{print $4}'`
export PATH=$GEM_EXE_DIR:$PATH

if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="%F{red}%n:%f%F{green}%d%f [%m] %%
"
else
# ルートユーザー以外の場合
PROMPT="%F{cyan}%n:%f%F{green}%d%f [%m] %%
"
fi

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
