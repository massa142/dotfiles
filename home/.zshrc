### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## Oh My Zsh Setting
ZSH_THEME="daveverwer"

## Zinit Setting
# Must Load OMZ Git library
zi snippet OMZL::git.zsh

# Load Git plugin from OMZ
zi snippet OMZP::git
zi cdclear -q # <- forget completions provided up to this moment

setopt promptsubst

# Load Prompt
zi snippet OMZT::daveverwer

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

# git-prompt
source ~/.zsh/git-prompt.sh

# git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit && compinit

# PROMPT options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# paste mode
unset zle_bracketed_paste

# git info
autoload -Uz vcs_info compinit && compinit
setopt prompt_subst
zstyle ':vcs_info:*' formats ' (%b)'
precmd() { vcs_info }

# prompt
PROMPT='%F{025}%B%~%b%f%F{008}$vcs_info_msg_0_%f %F{008}%#%f '

# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# ls
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -la'

### cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# go path
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# homebrew cask 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## pyc
export PYTHONDONTWRITEBYTECODE=1

# Python
export PATH=/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.10/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

## Yarn
export PATH="$PATH:$HOME/.yarn/bin"

## pnpm
alias pn=pnpm

# nodebrew
if [[ -f ~/.nodebrew/nodebrew ]]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
