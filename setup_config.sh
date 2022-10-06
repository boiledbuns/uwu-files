#!/usr/bin/env bash
# note: requires associative arrays (present in bash 4 and above)
# will need to install bash using brew (mac default bash is 3.x.x)

setupGeneric() {
    src_to_dst_map["$HOME_CONFIG_PATH/.zshrc"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.config_generic"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.config_personal_linux"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.vimrc"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.gitignore"]="$HOME"
    src_to_dst_map["$HOME_CONFIG_PATH/.tmux.conf"]="$HOME"
    src_to_dst_map["$PWD/.config/nvim"]="$HOME/.config"

    # emacs
    src_to_dst_map["$PWD/emacs/init.el"]="$HOME/.emacs.d/"
    src_to_dst_map["$PWD/emacs/early-init.el"]="$HOME/.emacs.d/"
}

setupMac() {
    :
}

setupLinux() {
    local configFiles=($(ls -A "linux"))
    for file in "${configFiles[@]}"; do
        ln -svf "$PWD/linux/$file" "$HOME/.config/"
    done
}

# === 
declare -A src_to_dst_map
HOME_CONFIG_PATH="$PWD/home"

setupGeneric

if [ "$1" == "linux" ]; then
    setupLinux
elif [ "$1" == "mac" ]; then
    setupMac
else
    echo "Options are mac or linux"
    exit
fi

 # `!` assigns keys instead of values
for file_path in "${!src_to_dst_map[@]}"; do
    dst_path=${src_to_dst_map[$file_path]}
    printf "creating link from $file_path to $dst_path\n" 
    ln -svf "$file_path" "$dst_path"
done
