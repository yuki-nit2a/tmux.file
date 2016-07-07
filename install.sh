#!/usr/bin/env bash

set -eu

readonly INSTALL_TO=$1
readonly DOTFILE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)/

symlink_files=(
    '.tmux.conf'
    '.tmux.conf.d'
)

for symlink_file in ${symlink_files[@]}; do
    ln -s "${DOTFILE_DIR}${symlink_file}" "${INSTALL_TO}${symlink_file}"
done

cp -r "${DOTFILE_DIR}skeleton/.tmux/" "${INSTALL_TO}"

git clone --recursive 'https://github.com/tmux-plugins/tpm' "${INSTALL_TO}.tmux/plugin/tpm"
