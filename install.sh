#!/bin/bash
#set bashrc
cd `dirname $0`
echo "if [ -f ~/workspace/myvim/bashrc ]; then 
    . ~/workspace/myvim/bashrc 
fi" >>~/.bashrc
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
#set vim
if [ -d ~/workspace/myvim/_vim ]; then
    ln -s ~/workspace/myvim/_vim ~/.vim
fi
echo "source ~/.vim/comm.vim\n" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git _vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c ':q!' -c ':q!'
#go get -u github.com/jstemmer/gotags
