#!/usr/bin/env bash

#echo $SHELL

#vim
while ! [ -f ~/.vimrc ];
do 
    echo "no current vimrc, copying..."
    cp vimrc ~/.vimrc
done
echo "vimrc exists, backing it up to vimrc_old..."
cp ~/.vimrc vimrc_old
cp vimrc ~/.vimrc

#tmux
while ! [ -f ~/.tmux.conf ];
do 
    echo "no current tmux.conf in home dir, copying..."
    echo "please note this only checks home, if your tmux.conf is somewhere else please install manually"
    cp tmux.conf ~/.tmux.conf
done
echo "tmux.conf exists, backing up to tmux_conf_old"
cp ~/.tmux.conf tmux_conf_old 
cp tmux.conf ~/.tmux.conf

#bash
echo "Backing up ~/.bashrc to bashrc_old..."
cp ~/.bashrc bashrc_old

echo "Copying new bashrc..."
cp bashrc ~/.bashrc
source ~/.bashrc

echo "Done. To restore overwrite current configs with thier *_old counterparts in applicable locations"
