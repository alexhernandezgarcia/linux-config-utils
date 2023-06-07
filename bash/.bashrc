# Color configuration for the terminal
export PROMPT_COMMAND='PS1="$(python ~/.bash.config.color.py)"'

# Set vim bindings in bash
set -o vi
set editing-mode vi

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

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Alias for "ls -lAh"
alias lsa="ls -lAh --group-directories-first"

# Alias for "ls -lh -I '*.pyc' -I '*.sw*'"
alias lss="ls -lh -I '*.pyc' -I '*.sw*' --group-directories-first"

# Alias for ls that hides auxiliary LaTeX files
alias lst="ls -lh -I '*.aux' -I '*.bbl' -I '*.blg' -I '*.fdb_latexmk' -I '*.fls' -I '*.log' -I '*.out' -I '*.thm' -I '*.synctex.gz' --group-directories-first"

# Alias for "git status ."
alias gits="git status ."

# Alias for "git status -uno ." (ignore untracked files)
alias gitsuno="git status -uno ."

# Alias for "git add -u ."
alias gitu="git add -u ."

# Alias for "git commit -m"
alias gitc="git commit -m"

# Alias for "git ls-tree -r master --name-only"
alias gitls="git ls-tree -r master --name-only"

# Alias for "git log --all --decorate --oneline --graph"
# See: https://i.stack.imgur.com/ElVkf.jpg
alias gitlogadog="git log --all --decorate --oneline --graph"

# Alias for copying into clipboard (xclip)
alias c="xclip"

# Alias for pasting from clipboard (xclip -o)
alias v="xclip -o"

# Ruby Gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# pandocpdf: pandoc file.<ext> -o file.pdf
pandocpdf ()
{
    pandoc "$1" -o $(echo $(echo "$1" | cut -d '.' -f1)".pdf")
}

# mkcdir: create directory and change directory into it
mkcdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# rmlatex: remove *.aux, *.bbl, *.blg, *.out, *.log, *.fls, *fdb_latexmk files
rmlatex ()
{
    rm $(find '.' -maxdepth 1 | grep -E "$1"".*((aux)|(bbl)|(blg)|(out)|(thm)|(synctex.gz)|(log)|(fls)|(fdb_latexmk))")
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
