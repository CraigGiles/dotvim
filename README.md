VIM files for syncing VIM across multiple computers. To install:

Clone repository into ~/.vim 
  HTTP: git clone https://github.com/CraigGiles/dotvim.git ~/.vim
  SSH: git clone git@github.com:CraigGiles/dotvim.git ~/.vim 

Clone misc directory to ~/Development/misc
  mkdir -p ~/Development
  HTTP: git clone https://github.com/CraigGiles/misc.git ~/Development/misc
  SSH: git clone git@github.com:CraigGiles/misc.git ~/Development/misc

Update CTags (On OSX)
  brew tap universal-ctags/universal-ctags
  brew install --HEAD universal-ctags

Link your vimrc and gvimrc to included vimrc files:
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  ln -s ~/Development/misc/bashrc ~/.bash_profile
  ln -s ~/Development/misc/tmux.conf ~/.tmux.conf

If you're using MacVim use the following to install w/ ENSIME
  brew install python
  brew install macvim --with-luajit --with-lua --with-override-system-vim
  pip install websocket-client

If you're using NeoVim then make the following changes
  mkdir ~/.config
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim

For scala development
  mkdir -p ~/.sbt/0.13/plugins
  ln -s ~/.vim/sbt-plugins ~/.sbt/0.13/plugins/plugins.sbt

Initialize the plugins:
  :PlugInstall

================================================================================
TMUX:
================================================================================
brew install reattach-to-user-namespace