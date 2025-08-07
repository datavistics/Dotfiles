########################################
# Core initialisation – keep this tiny #
########################################

# --- PATH ---
export PATH="$HOME/anaconda3/bin:$PATH"

# --- Locale ---
export LESSCHARSET=utf-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# --- fzf ---
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# --- Shell options ---
set -o vi
bind '"jk":vi-movement-mode'

# --- Source modular pieces ---
for file in ~/.bash_{aliases,functions,completion,options,prompt,local}; do
  [[ -f "$file" ]] && source "$file"
done
