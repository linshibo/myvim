#!/bin/bash
#set bashrc
cd `dirname $0`
<<<<<<< HEAD
echo "if [ -f ~/myvim/bashrc ]; then \n
    . ~/myvim/bashrc \n
fi" >>~/.bashrc 
=======
echo "if [ -f ~/myvim/bashrc ]; then \
    . ~/myvim/bashrc \
fi" >>~/.bashrc
>>>>>>> 5450d714e83f00ec0a252e715ade87ac2b346bfb
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
#set vim
ln -s ./_vim ~/.vim
<<<<<<< HEAD
echo "source ~/.vim/comm.vim\n" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git _vim/bundle/vundle
vim -c 'BundleInstall' -c ':q!' -c ':q!'
go get -u github.com/jstemmer/gotags
=======
echo "source `pwd`/_vim/comm.vim" >> ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git _vim/bundle/vundle
vim -c 'BundleInstall' -c ':q!' -c ':q!'
go get -u github.com/jstemmer/gotags                                                                                                                                         
~                                            
>>>>>>> 5450d714e83f00ec0a252e715ade87ac2b346bfb
