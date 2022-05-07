add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y tmux stew tig neovim xclip bat git

# https://github.com/mwh/dragon

git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.ll log --oneline
git config --global alias.d diff

lsd_deb_name="lsd_0.21.0_amd64.deb"
lsd_repo_url="https://github.com/Peltoche/lsd"
wget "$lsd_repo_url/releases/download/0.21.0/$lsd_deb_name" && dpkg -i $lsd_deb_name && rm $lsd_deb_name

