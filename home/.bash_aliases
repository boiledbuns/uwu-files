#!/usr/bin/env bash
# git 
alias g="git"
alias gg="g --no-pager"
alias gpu="git pull"
alias gco="git checkout"
alias ga="git add"
alias gst="git status"
alias gp="git push"
alias gc="git commit -m"

# for git commands that optionally use less
for prefix in g gg; do
    alias "${prefix}l"="${prefix} log --graph --decorate --pretty=oneline"
    #alias ggl="gg log --graph --decorate --pretty=oneline"
done

# =======
# generic 
# =======
# prompt if existing file
alias mv="mv -i"
# list all hidden
alias ls="ls -F"
alias ll="ls"
alias lsa="ls -A"
alias lla="ll -A"

# always put git repos in this folder
alias repo="cd ~/REPO"
alias edituwu="$EDITOR ~/REPO/uwu-files"
alias editzshrc="$EDITOR $ZSHRC" 
alias editvim="$EDITOR $VIMRC"

# installed manually (vs via homebrew) bc im on monterey T_T
# error with incompatible build tools for macOS 12
# mac
alias emacs=/Applications/Emacs.app/Contents/MacOS/Emacs
