# How to configure `tmux` and its plugins

### 1. Create a `tmux` config file: copy `.tmux.config` into `~/`

### 2. Install the plugins 
Installation of Plugins with [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm)

#### 2.1 Follow: [github.com/tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)

#### 2.2 Clone the [TPM](https://github.com/tmux-plugins/tpm) repository:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### 2.3 Update the configuration:
```
tmux source ~/.tmux.conf
```
From within a `tmux` session, run `<prefix> + I` to fetch the plugins

#### 2.4 Final checks
* Make sure the `.tmux.config` commands are the right ones, according to the version
* Make sure to install `xclip` to allow copy to clipboard
* See: [https://medium.freecodecamp.org/tmux-in-practice-integration-with-system-clipboard-bcd72c62ff7b](https://medium.freecodecamp.org/tmux-in-practice-integration-with-system-clipboard-bcd72c62ff7b)
* See: [http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu](http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu)
