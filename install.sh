#!/bin/bash
#set bashrc
cd `dirname $0`
echo "if [ -f ~/myvim/bashrc ]; then \
    . ~/myvim/bashrc \
fi" >>~/.bashrc
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
#set vim
ln -s ./_vim ~/.vim
echo "source `pwd`/_vim/comm.vim" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git _vim/bundle/vundle
vim -c 'BundleInstall' -c ':q!' -c ':q!'
go get -u github.com/jstemmer/gotags                                                                                                                                         
~                                            
