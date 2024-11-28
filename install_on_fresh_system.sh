#!/bin/bash

stow_params="--target=$HOME source=.."

# Hack to enable overwriting default configs
# Stow will create a symlink and overwrite the files inside your repository and git will undo the changes and return to the original files but the symlinks will stay there.
stow . --adopt $stow_params
git restore .

source ~/.bashrc

stow . $stow_params
pushd $SCRIPT_PATH
./install.sh
./install_etc_hosts_addon.sh
popd
