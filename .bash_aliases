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
alias dc='docker-compose --env-file .env.webpack'
alias cb='cd ~/Documents/custobar/custobar'
alias dragon="dragon 2>/dev/null"
alias :v="(cd ~/.config/nvim/ && nvim init.lua)"
alias :i="(cd ~/.config/regolith/i3/ && nvim config)"
alias upd="sudo apt update && sudo apt upgrade"

oc() {
    nvim $(git diff main.. --name-only | grep -e '\.vue$|\.js$')
}
