# Shorten current directory shown in prompt
PROMPT_DIRTRIM=1

# Colors of the prompt
# See: https://www.howtogeek.com/307701/how-to-customize-and-colorize-your-bash-prompt/
# username@host: purple: 01;35m\
# directory: cyan: 01;36m\
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Set vim bindings in bash
set -o vi
set editing-mode vi

# Set vim as visual editor
export VISUAL=vim

# Ctrl-L clears screen in vi-insert
bind -m vi-insert 'Control-l: clear-screen'

# Bash history pressing arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Bash history pressing arrows also in vi-insert
bind -m vi-insert '"\e[A":history-search-backward'
bind -m vi-insert '"\e[B":history-search-forward'

# Bash history with k and j in vi-command
bind -m vi-command '"k":history-search-backward'
bind -m vi-command '"j":history-search-forward'
