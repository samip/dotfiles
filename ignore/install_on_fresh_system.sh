#!/bin/sh

pushd ..

stow_params="--target=$HOME --ignore=ignore/ --ignore=*.md"

# Hack to enable overwriting default configs
# Stow will create a symlink and overwrite the files inside your repository and git will undo the changes and return to the original files but the symlinks will stay there.
stow . --adopt "$stow_params"
git restore .

stow . "$stow_params"
pushd ignore
./install.sh
./install_etc_hosts_addon
popd
