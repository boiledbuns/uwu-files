#!/bin/bash

# creates symlinks for dot files and copies them over to the appropriate locations

installSymLinks() {
    local homeFiles=(".zshrc" ".bash_aliases")
    for file in "${homeFiles[@]}"; do
        ln -svf "$PWD/home/$file" "$HOME"
    done
}

installSymLinks
