#!/bin/bash

is_wsl() {
    grep -qEi "(Microsoft|WSL)" /proc/sys/kernel/osrelease
}

is_wsl && export wsl_clip='clip.exe'

alias so="source"
alias xcp="kitty +kitten clipboard"
alias gdiff="git difftool --no-symlinks --dir-diff"
alias img="kitty +kitten icat"
alias apti="sudo apt-get install"
alias apts="apt-cache search"
alias setclip="${wsl_clip:-"xclip -selection c"}"
alias :q="exit"
alias x="xdg-open"
alias ff="ls | fzf --header 'Use CTRL-C to cancel' --reverse --preview='bat {}'"
alias dragon="dragon 2>/dev/null"
alias :v="cd ~/.config/nvim/ && nvim -O init.lua lua/plugins.lua"
alias :i="cd ~/.config/regolith3/i3/config.d && nvim -O *"
alias upd="sudo apt update && sudo apt upgrade"
alias ll="lsd -la"
alias lt="lsd -a --tree"
alias dots='[ -d ~/dotfiles ] && cd ~/dotfiles || cd ~/Documents/dotfiles'
alias cd="z"

# https://github.com/kharvd/gpt-cli?
alias robo="gpt --model claude-3-opus-20240229"

#oc() {
    #nvim $(git diff main.. --name-only | grep -e '\.vue$|\.js$')
#}

tm() {
  if [[ -z "$1" ]]; then
    dir=$(pwd)
  else
    dir=$(zoxide query "$1")
    if [[ $? != 0 ]]; then
      echo "No result"
      return
    fi
  fi
  dir_name="$(basename "$dir")"
  tmux new-session -s "$dir_name" -c "$dir" || tmux attach -t "$dir_name"
}


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

fco() {
    branch="$(git branch -l | fzf)"
    git checkout $branch
}


exit_if_screen() {
    if [[ "$TERM" == "screen" ]]; then
        exit
    fi
}

function boot_windows {
    WINDOWS_TITLE=`grep -i "^menuentry 'Windows" /boot/grub/grub.cfg|head -n 1|cut -d"'" -f2`
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}
alias dc="docker compose"
alias e="$EDITOR"
alias wpl="pushd ~/Documents/custobar/compose/ && docker-compose --env-file .env.webpack logs -f webpack  && popd"
alias dlog="pushd ~/Documents/custobar/compose/ && docker-compose --env-file .env.webpack logs -f django  && popd"
alias co="cd ~/Documents/custobar/compose"

alias m="docker compose exec django python manage.py"
alias b="docker compose exec django bash"
alias lastcmd="fc -ln -1"
alias td="tmux new-ses -s $(basename $(pwd))"
