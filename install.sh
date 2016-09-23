#!/bin/bash
#set bashrc
cd `dirname $0`
echo "source `pwd`/bashrc" >>~/.bashrc
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s _vim ~/.vim
echo "source ~/.vim/comm.vim\n" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git _vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c ':q!' -c ':q!'
