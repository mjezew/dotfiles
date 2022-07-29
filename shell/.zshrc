setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt INC_APPEND_HISTORY        # Immediately append to history, and not on shell exit
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export SAVEHIST=1000000000
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# NNN
export NNN_PLUG='p:preview-tui;c:-!pbcopy < ~/.config/nnn/.selection*'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_BMS="a:$HOME/Desktop;b:$HOME/Desktop/gh/genesis-server"
BLK="00" CHAR="00" DIR="69" EXE="DE" REG="00" HLI="00" SLI="00" MIS="00" ORP="00" FIF="00" SOC="00" UNK="00"
export NNN_FCOLORS="$BLK$CHAR$DIR$EXE$REG$HLI$SLI$MIS$ORP$FIF$SOC$UNK"

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

zmodload zsh/complist
autoload -U compinit; compinit
# Completion configuration
# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C alias-expension complete-word _generic
bindkey '^A' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# Use cache for commands which use it

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix true

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
# disable sort when completing git checkout
zstyle ':completion::git-checkout:' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using , and .
zstyle ':fzf-tab:*' switch-group ',' '.'
source $HOME/zsh_plugins/fzf-tab/fzf-tab.plugin.zsh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH=/Users/meganjezewski/go
export EDITOR=nvim
export GOBIN=/Users/meganjezewski/go/bin
export PATH=$PATH:$GOBIN

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion

#export http_proxy="http://34.198.159.136:8888"
#export https_proxy="http://34.198.159.136:8888"

# uninstall by removing these lines or running `tabtab uninstall slss`
export ERL_AFLAGS="-kernel shell_history enabled"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH

export PATH=$HOME/scripts:$PATH
. "$HOME/.cargo/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
bindkey -v                  # vi-mode
export KEYTIMEOUT=1         # make changing modes lickety split
export MANPAGER="nvim +Man!"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
fpath=($HOME/zsh_plugins $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
eval "$(starship init zsh)"

CDPATH=".:$HOME/Desktop/gh:$HOME/.config"

alias ls='exa -al --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always --group-directories-first'
alias lt='exa -aT --icons --color=always --group-directories-first'
# ASDF config
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/meganjezewski/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/meganjezewski/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/meganjezewski/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/meganjezewski/google-cloud-sdk/completion.zsh.inc'; fi
