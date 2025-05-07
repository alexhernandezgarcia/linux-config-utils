# Alias for "ls -lAh"
alias lsa="ls -lAh --group-directories-first"

# Alias for "ls -lh -I '*.pyc' -I '*.sw*'"
alias lss="ls -lh -I '*.pyc' -I '*.sw*' --group-directories-first"

# Alias for ls that hides auxiliary LaTeX files
alias lst="ls -lh -I '*.aux' -I '*.bbl' -I '*.blg' -I '*.fdb_latexmk' -I '*.fls' -I '*.log' -I '*.out' -I '*.thm' -I '*.synctex.gz' --group-directories-first"

# Alias for "git status ."
alias gitsa="git status ."

# Alias for "git status -uno ." (ignore untracked files)
alias gits="git status -uno ."

# Alias for "git add -u ."
alias gitu="git add -u ."

# Alias for "git commit -m"
alias gitc="git commit -m"

# Alias for "git commit -a -m" (stage every file that is already tracked before doing the commit)
alias gitcam="git commit -a -m"

# Alias for "git ls-tree -r master --name-only"
alias gitls="git ls-tree -r master --name-only"

# Alias for "git log --all --decorate --oneline --graph"
# See: https://i.stack.imgur.com/ElVkf.jpg
alias gitlogadog="git log --all --decorate --oneline --graph"

# Alias for "git log --all --decorate --oneline --graph"
# See: https://stackoverflow.com/a/41628915/6194082
alias gitloggraph="git log --pretty=format:'%h : %s' --graph"

# Alias to get summary information about current branch
alias gitb="git status | grep branch"

# Alias for copying into clipboard (xclip)
alias c="xclip"

# Alias for pasting from clipboard (xclip -o)
alias v="xclip -o"

# Alias for upgrading pip
alias pipi="python -m pip --upgrade install"

# Alias for showing queue of SLURM jobs
alias sq="squeue -u $USER --sort=+i"

# Alias for disk quota
alias quota="beegfs-ctl --cfgFile=/etc/beegfs/home.d/beegfs-client.conf --getquota --uid $USER"

# Alias for launching nautilus on the current directory
alias nb="nautilus . &"

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

# black & isort --profile black
blisort ()
{
    black $1
    isort --profile black $1
}

# flake8 with black config
blake ()
{
    flake8 --max-line-length=88 --ignore=E203 $1
}

# Weather
weather ()
{
  # Get the weather forecast in Montreal: $ weather montreal
  curl wttr.in/$1
}

# Get info about SLURM job
sshow ()
{
    scontrol show job -dd $1
}

vactivate()
{
    # list envs: $ vactivate 
    # activate env: $ vactivate myenv
	local env
	env=$1
 	if [[ $1 == "" ]];
	 then 
	 	echo "Available virtual envs:\n---"
		find ~/.virtualenvs/* -maxdepth 0 -type d -exec basename {} \;
		echo "---"
	 else
	 	source ~/.virtualenvs/$env/bin/activate
	fi
}

# Crop image and add border
# $1: input image and output image (will overwrite)
# $2: border size in pixels
cropnborder() {
    convert -trim $1 $1
    convert $1 -bordercolor White -border $2x$2 $1
}

# PDF to PNG
# $1: input pdf
# $2: DPI
pdf2png() {
    pdftoppm -png -r $2 $1 .tmp-pdf2png
    mv .tmp-pdf2png-1.png $(basename $1 .pdf).png
}

