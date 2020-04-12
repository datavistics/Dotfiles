alias ll='ls -alF'
PATH="$HOME/anaconda3/bin:$PATH"

set -o vi
bind '"jk":vi-movement-mode'

##################
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
##################

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

alias ll='ls -alFh --color=auto'

#######################################################
# Set the ultimate amazing command prompt
#######################################################

# alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
# function __setprompt
# {
#     local LAST_COMMAND=$? # Must come first!
# 
#     # Define colors
#     local LIGHTGRAY="\033[0;37m"
#     local WHITE="\033[1;37m"
#     local BLACK="\033[0;30m"
#     local DARKGRAY="\033[1;30m"
#     local RED="\033[0;31m"
#     local LIGHTRED="\033[1;31m"
#     local GREEN="\033[0;32m"
#     local LIGHTGREEN="\033[1;32m"
#     local BROWN="\033[0;33m"
#     local YELLOW="\033[1;33m"
#     local BLUE="\033[0;34m"
#     local LIGHTBLUE="\033[1;34m"
#     local MAGENTA="\033[0;35m"
#     local LIGHTMAGENTA="\033[1;35m"
#     local CYAN="\033[0;36m"
#     local LIGHTCYAN="\033[1;36m"
#     local NOCOLOR="\033[0m"
# 
#     # Show error exit code if there is one
#     if [[ $LAST_COMMAND != 0 ]]; then
#         # PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
#         PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
#         if [[ $LAST_COMMAND == 1 ]]; then
#             PS1+="General error"
#         elif [ $LAST_COMMAND == 2 ]; then
#             PS1+="Missing keyword, command, or permission problem"
#         elif [ $LAST_COMMAND == 126 ]; then
#             PS1+="Permission problem or command is not an executable"
#         elif [ $LAST_COMMAND == 127 ]; then
#             PS1+="Command not found"
#         elif [ $LAST_COMMAND == 128 ]; then
#             PS1+="Invalid argument to exit"
#         elif [ $LAST_COMMAND == 129 ]; then
#             PS1+="Fatal error signal 1"
#         elif [ $LAST_COMMAND == 130 ]; then
#             PS1+="Script terminated by Control-C"
#         elif [ $LAST_COMMAND == 131 ]; then
#             PS1+="Fatal error signal 3"
#         elif [ $LAST_COMMAND == 132 ]; then
#             PS1+="Fatal error signal 4"
#         elif [ $LAST_COMMAND == 133 ]; then
#             PS1+="Fatal error signal 5"
#         elif [ $LAST_COMMAND == 134 ]; then
#             PS1+="Fatal error signal 6"
#         elif [ $LAST_COMMAND == 135 ]; then
#             PS1+="Fatal error signal 7"
#         elif [ $LAST_COMMAND == 136 ]; then
#             PS1+="Fatal error signal 8"
#         elif [ $LAST_COMMAND == 137 ]; then
#             PS1+="Fatal error signal 9"
#         elif [ $LAST_COMMAND -gt 255 ]; then
#             PS1+="Exit status out of range"
#         else
#             PS1+="Unknown error code"
#         fi
#         PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
#     else
#         PS1=""
#     fi
# 
#     # Date
#     PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
#     PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time
# 
#     # CPU
#     PS1+="(\[${MAGENTA}\]CPU $(cpu)%"
# 
#     # Jobs
#     PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"
# 
#     # Network Connections (for a server - comment out for non-server)
#     PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"
# 
#     PS1+="\[${DARKGRAY}\])-"
# 
#     # User and server
#     local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
#     local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
#     if [ $SSH2_IP ] || [ $SSH_IP ] ; then
#         PS1+="(\[${RED}\]\u@\h"
#     else
#         PS1+="(\[${RED}\]\u"
#     fi
# 
#     # Current directory
#     PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"
# 
#     # Total size of files in current directory
#     PS1+="(\[${GREEN}\]$(/bin/ls -lah | grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"
# 
#     # Number of files
#     PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"
# 
#     # Skip to the next line
#     PS1+="\n"
# 
#     if [[ $EUID -ne 0 ]]; then
#         PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
#     else
#         PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
#     fi
# 
#     # PS2 is used to continue a command using the \ character
#     PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "
# 
#     # PS3 is used to enter a number choice in a script
#     PS3='Please enter a number from above list: '
# 
#     # PS4 is used for tracing a script in debug mode
#     PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
# }
# PROMPT_COMMAND='__setprompt'


if [ -f "~/.local_bash" ]; then
  source ~/.local_bash
fi
