#!/bin/python3
import os
from pathlib import Path

# create links for files specified in directory


def linkRecursively(sourceDirectory, destDirectory):
    files = os.listdir(sourceDirectory)
    for fileName in files:
        sourcePath = sourceDirectory + "/" + fileName
        destPath = destDirectory + "/" + fileName
        print(destPath)
        Path(destPath).symlink_to(sourcePath)


if __name__ == "__main__":
    linkRecursively(os.getcwd() + "/emacs", "./test-symlink")
    # setupEmacs() {
    #     # emacs
    #     echo "emacs config files:"
    #     local emacsConfig = ($(ls - A "emacs"))
    #     for file in "${emacsConfig[@]}"; do
    #         ln - svf "$PWD/emacs/$file" "$HOME_CONFIG_PATH/.emacs.d/"
    #     done
    # }

    # # creates symlinks for dot files and copies them over to the appropriate locations
    # setupMac() {
    #     local HOME_CONFIG_PATH = "$PWD/home"
    #     declare - A src_to_dst_map
    #     src_to_dst_map["$HOME_CONFIG_PATH/.zshrc"] = "$HOME"
    #     src_to_dst_map["$HOME_CONFIG_PATH/.config_generic"] = "$HOME"
    #     src_to_dst_map["$HOME_CONFIG_PATH/.config_personal_linux"] = "$HOME"
    #     src_to_dst_map["$HOME_CONFIG_PATH/.vimrc"] = "$HOME"
    #     src_to_dst_map["$HOME_CONFIG_PATH/.gitignore"] = "$HOME"
    #     src_to_dst_map["$HOME_CONFIG_PATH/.tmux.conf"] = "$HOME"
    #     src_to_dst_map["$PWD/.config/nvim"] = "$HOME/.config"

    #     # `!` assigns keys instead of values
    #     for file_path in "${!src_to_dst_map[@]}"; do
    #         local dst_path =${src_to_dst_map[$file_path]}
    #         printf "creating link from $file_path to $dst_path\n"
    #         ln - svf "$file_path" "$dst_path"
    #     done

    #     # setupEmacs()
    # }

    # # creates symlinks for dot files and copies them over to the appropriate locations
    # setupLinux() {
    #     local homeFiles = ($(ls - A "home"))
    #     for file in "${homeFiles[@]}"; do
    #         ln - svf "$PWD/home/$file" "$HOME"
    #     done

    #     local configFiles = ($(ls - A ".config"))
    #     for file in "${configFiles[@]}"; do
    #         ln - svf "$PWD/.config/$file" "$HOME/.config/"
    #     done
    # }

    # # run script
    # while getopts 'lha:' OPTION; do
    #   case "$OPTION" in
    #     m)
    #       echo "c"; ;
    #     l)
    #       echo "script usage: $(basename \$0) [-l] [-h] [-a somevalue]" > &2
    #       exit 1; ;
    #   esac
    # done
    # shift "$(($OPTIND -1))"
