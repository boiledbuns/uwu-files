#!/bin/bash

# creates symlinks for dot files and copies them over to the appropriate locations

installSymLinks() {
    local homeFiles=(".zshrc" ".bash_aliases" ".vimrc")
    for file in "${homeFiles[@]}"; do
        ln -svf "$PWD/home/$file" "$HOME"
    done

    local configFiles=($(ls -A ".config"))
    for file in "${configFiles[@]}"; do
        echo $file
        ln -svf "$PWD/.config/$file" "$HOME/.config/"
    done

    # emacs 
    echo "emacs config files:"
    local emacsConfig=($(ls -A "emacs"))
    for file in "${emacsConfig[@]}"; do
        ln -svf "$PWD/emacs/$file" "$HOME/.emacs.d/"
    done
}

installSymLinks
