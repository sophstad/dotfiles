#!/bin/sh
#
# Install external resources (fonts, themes, etc.)

RESOURCE_DIR="$HOME/Desktop/resources"
SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text 3"
INSTALLED_PACKAGES="$SUBLIME_DIR/Installed Packages"

echo " In resources/install.sh"
mkdir -p $RESOURCE_DIR

git_clone () {
  GIT_PATH=$1
  DEST=$2
  git clone https://github.com/$GIT_PATH.git $DEST
}

wget -nc -P "$RESOURCE_DIR" https://www.fontsquirrel.com/fonts/download/liberation-mono
wget -nc -P "$INSTALLED_PACKAGES" https://packagecontrol.io/Package%20Control.sublime-package
git_clone "chriskempson/tomorrow-theme" "$RESOURCE_DIR/tomorrow-theme"

if [ -e todo.txt ]
then
    cp todo.txt $RESOURCE_DIR/todo.txt
fi

exit 0
