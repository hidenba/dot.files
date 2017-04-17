rbenv init - | source
eval (direnv hook fish)

balias rr "rm -rf"
balias rm "rm -i"
balias cp "cp -i"
balias mv "mv -i"
balias g "git"
balias b "bundle"
balias bi "bundle install"
balias r "rails"
balias rs "rails s"
balias rc "rails c"

set -x EDITOR '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'

function fish_user_key_bindings
    bind \cs peco_select_ghq_repository
    bind \cr peco_select_history
    bind \cx\ck peco_kill
    bind \cx\cb hub_browse
end

function hub_browse
    hub browse
end
