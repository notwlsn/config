#!/usr/bin/env bash
# whoismydns@protonmail.com 2020

#echo $SHELL

#tmux
echo "Restoring old tmux.conf..."
cp tmux_conf_old ~/.tmux.conf

#bash
echo "Restoring old bashrc..."
cp bashrc_old ~/.bashrc

#vim 
echo "Restoring old vimrc..."
cp vimrc_old ~/.vimrc

echo "Done. Use install.sh to re-install configs."
