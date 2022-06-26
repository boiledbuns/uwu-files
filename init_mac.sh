#!/usr/bin/env bash
# note: requires associative arrays (present in bash 4 and above)
# will need to install bash unsing brew (mac default bash is 3.x.x)

# creates symlinks for dot files and copies them over to the appropriate locations
installSymLinks() {
    local HOME_CONFIG_PATH="$PWD/home"
    declare -A src_to_dst_map
    src_to_dst_map["$HOME_CONFIG_PATH/.zshrc"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.bash_aliases"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.vimrc"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.gitignore"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.tmux.conf"]="$HOME"
    src_to_dst_map["$PWD/.config/nvim"]="$HOME/.config"
    
    # `!` assigns keys instead of values
    for file_path in "${!src_to_dst_map[@]}"; do
        local dst_path=${src_to_dst_map[$file_path]}
        printf "creating link from $file_path to $dst_path\n" 
        ln -svf "$file_path" "$dst_path"
    done
    
    # emacs 
#    echo "emacs config files:"
#    local emacsConfig=($(ls -A "emacs"))
#    for file in "${emacsConfig[@]}"; do
#        ln -svf "$PWD/emacs/$file" "$HOME_CONFIG_PATH/.emacs.d/"
#    done
}

installSymLinks
