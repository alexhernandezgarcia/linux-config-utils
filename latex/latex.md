# How to get LaTeX working and install packages

## Full installation via download from [www.tug.org](http://www.tug.org) (
See the prompt to change options. For instance, the default is the full installation, nearly 7 GB.
See: http://www.tug.org/texlive/quickinstall.html 

### Download the `TeX Live` installation package
See: http://www.tug.org/texlive/acquire-netinstall.html
```
cd ~/Downloads
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
```

### Install
```
tar xvzf install-tl-unx.tar.gz
cd install-tl-20200301/
sudo perl install-tl
```

### Update PATH, MANPATH and INFOPATH
Add to `.bashrc`:
```
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH
``` 
### How to install new packages with `tlmgr`
See: https://www.tug.org/texlive/pkginstall.html

By default, `install-tl` will install the packages within `/usr/local/texlive`, which is not writable without `sudo`. Therefore, `tlmgr` has to be run with root permissions, using one of these options:

* `sudo $(which tlmgr)`
* `sudo env PATH="$PATH" tlmgr`

#### Important: if `TeX Live` has been installed via [www.tug.org](http://www.tug.org) `latexmk` should be installed via `tlmgr` and NOT via `sudo apt install latexmk`!:

```
sudo $(which tlmgr) install latexmk
```

Otherwise, `latexmk` will install a new copy of `texlive`, probably on `/usr/share/texlive`

## Installation via the `apt` repository

### Install `texlive` and update `tlmgr`
```
sudo apt install tex-common texlive-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended 
sudo apt install xzdec
tlmgr init-usertree
tlmgr update --self
```

### Troubleshooting
* [Cannot setup TLPDB](https://tex.stackexchange.com/questions/137428/tlmgr-cannot-setup-tlpdb)
* [Remote repository is newer than local](https://tex.stackexchange.com/questions/429714/tlmgr-remote-repository-is-newer-than-local-2017-2018)

### Install a LaTeX package

#### If it exists in the repository
For example, the package `flushend`. Simply run:
```
tlmgr install flushend
```

#### If it is not in the repository, but on CTAN
Follow the instructions from [the LaTeX wiki](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages)

#### 1. Download the package from CTAN https://ctan.org/pkg/flushend?lang=en
1. Download the package into a temporary directory, e.g. ~/Downloads/ and extract the .zip file
2. Extract the .ins files: 
```
latex <package>.ins
latex <package>.dtx
```
It might be necessary to run it twice. This should create the .sty files

3. Install the .sty files by copying them into the proper directory. For example:
```
mkdir -p ~/texmf/tex/latex/flushend/
mv flushend.sty ~/texmf/tex/latex/flushend/
```

## Install a LaTeX language
```
sudo apt install texlive-lang-spanish
```
