# VIM Setup

Clone repository into ~/.vim 

```bash
    HTTP: git clone https://github.com/CraigGiles/dotvim.git ~/.vim
    SSH: git clone git@github.com:CraigGiles/dotvim.git ~/.vim 
```

Link your vimrc and gvimrc to included vimrc files:

```bash
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
```

Initialize the plugins:

```vim
    :PlugInstall
```
