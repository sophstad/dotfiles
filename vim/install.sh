#!/bin/sh
#
# Install Vim requirements

VIM_DIR="$HOME/.vim"

git_clone () {
  GIT_PATH=$1
  DEST=$2
  git clone https://github.com/$GIT_PATH.git $DEST
}

git_clone "VundleVim/Vundle.vim" "$VIM_DIR/bundle/Vundle.vim"
