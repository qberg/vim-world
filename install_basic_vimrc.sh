#!/bin/sh
set -e

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/basic-server.vim > ~/.vimrc
echo "Installed the Basic Vim configuration for server successfully! Get typing and creating:)"
