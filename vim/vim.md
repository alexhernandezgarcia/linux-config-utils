# How to install `Vundle`

[`Vundle.vim`](https://github.com/VundleVim/Vundle.vim) is a plug-in manager for `vim`

#### 1. Clone the `Vundle.vim` repository
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

#### 2. Launch vim and run 
```
:PluginInstall
```

#### 3. If necessary:
`YouCompleteMe` may not work on a fresh Ubuntu installation because it needs `python-dev`. In that case, follow the instructions from the [`YouCompleteMe` repo](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64):
```
sudo apt install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
python install.py
```
