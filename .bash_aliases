#!/bin/bash
alias so="source"
alias xcp="kitty +kitten clipboard"
alias gdiff="git difftool --no-symlinks --dir-diff"
alias img="kitty +kitten icat"
alias apti="sudo apt-get install"
alias apts="apt-cache search"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias vs="cd /opt/vivaldi-snapshot/resources/vivaldi"
alias :q="exit"
alias x="xdg-open"

alias dragon="dragon 2>/dev/null"
alias :v="(cd ~/.config/nvim/ && nvim init.lua lua/*)"
alias :i="(cd ~/.config/regolith/i3/ && nvim config)"
alias upd="sudo apt update && sudo apt upgrade"
alias ll="lsd -la"
alias lt="lsd -a --tree"
alias dots="cd ~/Documents/dotfiles"

alias cd="z"

#oc() {
    #nvim $(git diff main.. --name-only | grep -e '\.vue$|\.js$')
#}

goto() {
    shortcut_locations="$HOME/.config/shortcut-locations"
    test -f "$shortcut_locations" && cd "$(cat $shortcut_locations | fzf)"
}

rebasei()
{
    commits=$(git rev-list main.. --count)
    git rebase -i HEAD~$commits
}

activ()
{
    folder=$(pwd)
    ln -sfn "$folder" ~/Documents/custobar/custobar
}

# dc() {
#     pushd ~/Documents/custobar/compose/
#     docker-compose "$1"
#     popd
# }

fco() {
    branch="$(git branch -l | fzf)"
    git checkout $branch
}
alias dc="docker compose"
alias e="$EDITOR"
alias wpl="pushd ~/Documents/custobar/compose/ && docker-compose --env-file .env.webpack logs -f webpack  && popd"
alias dlog="pushd ~/Documents/custobar/compose/ && docker-compose --env-file .env.webpack logs -f django  && popd"
alias co="cd ~/Documents/custobar/compose"

alias m="docker compose exec django python manage.py"
alias b="docker compose exec django bash"
alias code="tmux a -t code"
alias comp="tmux a -t compose"
