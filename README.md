# vim-world

![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

In case the vim version used is the small version without GUI, make sure to do the following,
```
sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime
```


## Install the Basic version for servers

The basic version is useful to install on remote servers where you don't need many plugins, and you don't do many edits.

	git clone --depth=1 https://github.com/qberg/vim-world ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh
