# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  fzf
  vi-mode
  fasd
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
bindkey -M viins 'jk' vi-cmd-mode
export KEYTIMEOUT=20

# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
# Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
# }

# zle -N zle-keymap-select

# PATH="$HOME/anaconda3/bin/:$PATH"

# https://github.com/mkomitee/dotfiles/blob/master/zsh/key-bindings.zsh
typeset -gA key_info
key_info=(
  'Control'      '\C-'
  'ControlLeft'  '\e[1;5D \e[5D \e\e[D \eOd'
  'ControlRight' '\e[1;5C \e[5C \e\e[C \eOc'
  'Escape'       '\e'
  'Meta'         '\M-'
  'Backspace'    "^?"
  'F1'           "$terminfo[kf1]"
  'F2'           "$terminfo[kf2]"
  'F3'           "$terminfo[kf3]"
  'F4'           "$terminfo[kf4]"
  'F5'           "$terminfo[kf5]"
  'F6'           "$terminfo[kf6]"
  'F7'           "$terminfo[kf7]"
  'F8'           "$terminfo[kf8]"
  'F9'           "$terminfo[kf9]"
  'F10'          "$terminfo[kf10]"
  'F11'          "$terminfo[kf11]"
  'F12'          "$terminfo[kf12]"
  'Insert'       "$terminfo[kich1]"
  'Home'         "$terminfo[khome]"
  'PageUp'       "$terminfo[kpp]"
  'End'          "$terminfo[kend]"
  'PageDown'     "$terminfo[knp]"
  'Up'           "$terminfo[kcuu1]"
  'Left'         "$terminfo[kcub1]"
  'Down'         "$terminfo[kcud1]"
  'Right'        "$terminfo[kcuf1]"
  'BackTab'      "$terminfo[kcbt]"
)

# https://superuser.com/a/983018
bindkey "\e[3~" delete-char

# autoload edit-command-line
# zle -N edit-command-line
#
# zsh-widget-noop () {}
# zle -N zsh-widget-noop

# pressing <ESC> in normal mode is bogus: you need to press 'i' twice to enter insert mode again.
# rebinding <ESC> in normal mode to something harmless solves the problem.
bindkey -M vicmd '\e' zsh-widget-noop

bindkey -M vicmd "$key_info[End]" end-of-line
bindkey -M vicmd "$key_info[Home]" beginning-of-line
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M vicmd "G" end-of-history
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey -M vicmd "gg" beginning-of-history
bindkey -M vicmd v edit-command-line
bindkey -M viins "$key_info[Down]" history-search-forward
bindkey -M viins "$key_info[End]" end-of-line
bindkey -M viins "$key_info[Home]" beginning-of-line
bindkey -M viins "$key_info[Up]" history-search-backward
bindkey -M viins "^O" expand-cmd-path
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins ' ' magic-space
bindkey -M viins '^;' autosuggest-accept


# vi-backward-delete-char does not go back across newlines.
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^?" backward-delete-char

# For autosuggest
bindkey -M viins "^w" forward-word
bindkey -M viins "^b" backward-word


### ---   Fix key-binding errors   --- ###
# helper: only bind when the sequence is non-empty
_bind_if_set() { [[ -n $1 ]] && bindkey "$@" ; }

# harmless ESC in vicmd
zsh-widget-noop() { : }
zle -N zsh-widget-noop
_bind_if_set '\e'         zsh-widget-noop        # replaces the old bindkey

# End / Home in vicmd
_bind_if_set "$key_info[End]"  end-of-line
_bind_if_set "$key_info[Home]" beginning-of-line
# …repeat for the other key_info bindings…

### ---   Gitstatus self-healing   --- ###
# make sure the helper is automatically rebuilt if missing
if [[ ! -x ~/.cache/gitstatus/gitstatusd-* ]]; then
  rm -rf ~/.cache/gitstatus
fi


source ~/.fzf.zsh
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# for file in ~/.ssh/*.pem; do ssh-add $file; done

alias ll='ls -aFGl'

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source /Users/derekthomas/.docker/init-zsh.sh || true # Added by Docker Desktop

# Added by Windsurf
export PATH="/Users/derekthomas/.codeium/windsurf/bin:$PATH"
