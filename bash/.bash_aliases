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

# Alias for "git commit -a -m" (stage every file that is already tracked before doing the commit)
alias gitcam="git commit -a -m"

# Alias for "git ls-tree -r master --name-only"
alias gitls="git ls-tree -r master --name-only"

# Alias for "git log --all --decorate --oneline --graph"
# See: https://i.stack.imgur.com/ElVkf.jpg
alias gitlogadog="git log --all --decorate --oneline --graph"

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

# black & isort --profile black
blisort (){
  black $1
  isort --profile black $1
}

# Weather
weather (){
  # Get the weather forecast in Montreal: $ weather montreal
  curl wttr.in/$1
}

# Get info about SLURM job
 sshow ()                                                                                                                                                                                                                                                                                                                  {
 scontrol show job -dd $1
 }

vactivate() {
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
