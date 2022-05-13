#!/bin/sh

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y tmux stew tig neovim xclip bat git fzf

# https://github.com/mwh/dragon

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.ll log --oneline
git config --global alias.d diff

if ! command -v lsd &> /dev/null
then
    lsd_deb_name="lsd_0.21.0_amd64.deb"
    lsd_repo_url="https://github.com/Peltoche/lsd"
    wget "$lsd_repo_url/releases/download/0.21.0/$lsd_deb_name" && dpkg -i $lsd_deb_name && rm $lsd_deb_name
fi

cat "$PWD/init/.bash_history" >> ~/.bash_history
cat "$PWD/init/.config/shortcut-locations" >> ~/.config/shortcut-locations

# source ~/.bashrc
tmux source-file ~/.tmux.conf
