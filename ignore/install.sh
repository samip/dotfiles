#!/bin/sh

is_wsl() {
    grep -qEi "(Microsoft|WSL)" /proc/sys/kernel/osrelease
}

add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo  apt-get install -y tmux stow tig neovim xclip bat git fd-find ripgrep \
    xclip screen curl ca-certificates build-essential

# Check if running in WSL
if ! is_wsl; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    if ! command -v greenclip > /dev/null
    then
        wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && mv greenclip ~/.local/bin
    fi

    sudo apt-get install -y x11-xkb-utils x11-xserver-utils
fi

if ! command -v docker > /dev/null
then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

if ! command -v tldr > /dev/null
then
    if ! command -v pipx > /dev/null; then
        sudo apt-get install -y pipx
    fi
    pipx install tldr
fi

if ! command -v fd > /dev/null
then
    sudo ln -s $(which fdfind) /usr/bin/fd
fi

if ! command -v bat > /dev/null
then
    sudo ln -s $(which batcat) /usr/bin/bat
fi

dragon_path="/opt/dragon"
if [ ! -d "$dragon_path" ]
then
    sudo mkdir -p "$dragon_path"
    sudo chown $USER:$USER "$dragon_path"
    sudo git clone https://github.com/mwh/dragon.git "$dragon_path"
    pushd "$dragon_path"
    sudo apt-get install -y libgtk-3-dev
    make install
    popd
fi

# https://github.com/mwh/dragon

if ! command -v fzf > /dev/null
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    # ~/.fzf/install --all
fi

git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.ll log --oneline
git config --global alias.d diff
git config --global core.editor nvim
git config --global user.email "sami@pell.fi"
git config --global user.name "Sami Pellinen"
git config --global init.defaultBranch master

# aliased to ll
if ! command -v lsd > /dev/null
then
    lsd_deb_name="lsd_0.21.0_amd64.deb"
    lsd_repo_url="https://github.com/Peltoche/lsd"
    wget "$lsd_repo_url/releases/download/0.21.0/$lsd_deb_name" && dpkg -i $lsd_deb_name && rm $lsd_deb_name
fi

if ! command -v nvm > /dev/null
then
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

if ! command -v starship > /dev/null
then
    curl -sS https://starship.rs/install.sh | sudo sh
fi

if ! command -v zoxide > /dev/null
then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

tpm_path="$HOME/.tmux/plugins/tpm"
if [ ! -d "$tpm_path" ]
then
    mkdir -p "$tpm_path"
    git clone https://github.com/tmux-plugins/tpm "$tpm_path"
fi
bash "$tpm_path/bin/install_plugins"

tmux source-file ~/.tmux.conf