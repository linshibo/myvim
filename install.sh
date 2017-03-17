#!/bin/bash
cd `dirname $0`
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s _vim ~/.vim
echo "source ~/.vim/comm.vim\n" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/vim/bundle/
vim -c 'PluginInstall' -c ':q!' -c ':q!'
