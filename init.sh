#!/bin/bash

# creates symlinks for dot files and copies them over to the appropriate locations

installSymLinks() {
    local homeFiles=($(ls -A "home"))
    for file in "${homeFiles[@]}"; do
        ln -svf "$PWD/home/$file" "$HOME"
    done

    local configFiles=($(ls -A ".config"))
    for file in "${configFiles[@]}"; do
        ln -svf "$PWD/.config/$file" "$HOME/.config/"
    done
}

installSymLinks