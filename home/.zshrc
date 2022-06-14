# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ============================
# REGION antigen setup
# ============================
source ~/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-open
antigen bundle history
antigen bundle vi-mode

antigen bundle web-search
ZSH_WEB_SEARCH_ENGINES=(
    wiki https://en.wikipedia.org/wiki/
)

# --- non-default plugins ---
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle agkozak/agkozak-zsh-theme

antigen theme candy

antigen apply
# ============================
# ENDREGION antigen setup
# ============================

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# ============================
# User configuration
# ============================

# vi-mode 
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export ZSHRC='~/.zshrc'
export VIMRC='~/.config/nvim/init.vim'
export KEYTIMEOUT=1
# export EDITOR='code'
export EDITOR='nvim'

# export EDITOR='emacsclient'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ============================
# REGION util functions
# ============================

# sources file if it exists 
# $1 name of the file
and_source() { 
    printf "Running file %s\n" $1
    if [ -f $1 ]; then
        . $1
    else 
       printf "File '%s' doesn't exist\n" $1
    fi
}
# ============================
# REGION load more
# ============================

# aliases I use all the time
and_source ~/.bash_aliases
and_source ~/.bash_aliases_linux
# aliases I use often between projects (often, but not enough to put them in the repo)
and_source ~/.bash_project_aliases
and_source ~/.functions
and_source ~/.path_exports

# ============================
# END REGION load more
# ============================

# mac
# for intel homebrew packages
PATH="/opt/homebrew/bin/brew:$PATH"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

export PSQL_DIR="/usr/local/pgsql/bin"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$PSQL_DIR:$PATH"
export RUST_BACKTRACE=1

PATH="$HOME/.npm-global/bin:$PATH"
PATH="$HOME/Android/Sdk/platform-tools:$PATH"
PATH="$HOME/android-studio/bin:$PATH"
PATH="$HOME/dev/ngrok:$PATH"
PATH="$HOME/dev/flutter/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/kitty.app/bin/kitty:$PATH"
PATH="$HOME/.emacs.d/bin:$PATH"

export GOPATH=$HOME/go-workspace # don't forget to change your path correcly!
export GOROOT=/opt/homebrew/Cellar/go/1.15.7_1/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/markw/.sdkman"
[[ -s "/home/markw/.sdkman/bin/sdkman-init.sh" ]] && source "/home/markw/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
