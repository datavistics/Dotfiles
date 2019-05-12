alias ll='ls -alF'
PATH="$HOME/anaconda3/bin:$PATH"

set -o vi
bind '"jk":vi-movement-mode'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
