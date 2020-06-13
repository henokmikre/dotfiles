# .bash_profile

# Get settings for interactive non-login shells.
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Color prompt.
YELLOW="\[$(tput setaf 3)\]"
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\n${YELLOW}${BOLD}\u@\h:\w${RESET}\n# "

# Write last command to history on each prompt.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Ignore duplicates and empty spaces from history.
export HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it.
shopt -s histappend

# Check window size after each command and update LINES and COLUMNS.
shopt -s checkwinsize

# Set default editor.
export EDITOR=vim

# Change directory colors.
# See: https://askubuntu.com/a/466203.
LS_COLORS=$LS_COLORS:'di=38;5;27:' ; export LS_COLORS

# Add python user script dir to path.
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

