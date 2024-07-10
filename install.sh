#!/bin/sh

add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y tmux stew tig neovim xclip bat git fzf zsh fd-find ripgrep

ln -s $(which fdfind) ~/.local/bin/fd

# https://github.com/mwh/dragon
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.ll log --oneline
git config --global alias.d diff
git config --global core.editor nvim
git config --global user.email "sami@pell.fi"
git config --global user.name "Sami Pellinen":w


if ! command -v lsd > /dev/null
then
    lsd_deb_name="lsd_0.21.0_amd64.deb"
    lsd_repo_url="https://github.com/Peltoche/lsd"
    wget "$lsd_repo_url/releases/download/0.21.0/$lsd_deb_name" && dpkg -i $lsd_deb_name && rm $lsd_deb_name
fi
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
curl -sS https://starship.rs/install.sh | sh

cat "$PWD/init/.bash_history" >> ~/.bash_history
cat "$PWD/init/.config/shortcut-locations" >> ~/.config/shortcut-locations

tmux source-file ~/.tmux.conf

wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && mv greenclip ~/.local/bin
sudo apt install zoxide x11-xkb-utils x11-server-utils
sudo apt install x11-xserver-utils
sudo apt install python3.10-venv
sudo apt install tig
