# Color configuration for the terminal
export PROMPT_COMMAND='PS1="$(python ~/.bash.config.color.py)"'

# Bash history pressing arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Alias for "ls -lAh"
alias lsa="ls -lAh --group-directories-first"

# Alias for "ls -lh -I '*.pyc' -I '*.sw*'"
alias lss="ls -lh -I '*.pyc' -I '*.sw*' --group-directories-first"

# Alias for "git status ."
alias gits="git status ."

# Alias for "git add -u ."
alias gitu="git add -u ."

# Alias for "git commit -m"
alias gitc="git commit -m"

# Alias for copying into clipboard (xclip)
alias c="xclip"

# Alias for pasting from clipboard (xclip -o)
alias v="xclip -o"

# Ruby Gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# mkcdir: create directory and change directory into it
mkcdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# rmlatex: remove *.aux, *.bbl, *.blg, *.out, *.log, *.fls, *fdb_latexmk files
rmlatex ()
{
    rm $(find '.' -maxdepth 1 | grep -E "$1"".*((aux)|(bbl)|(blg)|(out)|(log)|(fls)|(fdb_latexmk))")
}

# compile latex: pdflatex > bibtex (x2) > pdflatex (x2)
compilelatex ()
{
    pdflatex $1"tex" &&
    bibtex $1"aux" &&
    bibtex $1"aux" &&
    pdflatex $1"tex" &&
    pdflatex $1"tex"
}

# Enable fuck functionality: typing fuck an error provides suggestions
# See: https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"
