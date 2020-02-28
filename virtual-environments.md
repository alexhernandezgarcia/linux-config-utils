# How to setup virtual environments for Python
This is a summary guide on how to setup virtual environments for Python using `virtualenv` and `virtualenvwrapper`. A couple of good references are:
* [Hitchhiker's guide to Python](https://docs.python-guide.org/dev/virtualenvs/)
* [`virtualenvwrapper` documentation](https://virtualenvwrapper.readthedocs.io/en/latest/install.html#basic-installation)

### Installation

#### 1. Make sure to have `pip` installed
```
sudo apt install python-pip
```

#### 2. Install `virtualenv`
Note: if installed without `sudo`, `pip` will install under `~/.local/`
```
sudo pip install virtualenv
```

#### 3. Install `virtualenvwrapper`
Note: if installed without `sudo`, `pip` will install under `~/.local/`
```
sudo pip install virtualenvwrapper
```

#### 5. Add the following lines to `~/.bashrc`
Note: you may change the directory of the virtual environments from `~/.virtualenvs` to something else
```
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

#### 5. Reload `~/.bashrc`
```
source ~/.bashrc
```

### Basic commands:
* `mkvirtualenv name-of-virtualenv`: make new virtual environment
* `workon name-of-virtualenv`: start session within virtual environment
* `deactivate name-of-virtualenv`: end session 
* `rm -r $WORKON_HOME/name-of-virtualenv`: remove virtual environment

#### How to specify the Python version of a new virtual environment
See [StackOverflow question](https://stackoverflow.com/questions/16123459/virtualenvwrapper-and-python-3)

For example, to explicitly specify Python 3:
```
mkvirtualenv --python=`which python3` name-of-virtualenv
```
