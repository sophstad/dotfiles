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

wget -nc -P "$INSTALLED_PACKAGES" https://packagecontrol.io/Package%20Control.sublime-package
git_clone "chriskempson/tomorrow-theme" "$RESOURCE_DIR/tomorrow-theme"
curl -O https://developer.apple.com/fonts/downloads/SFPro.zip

if [ -e todo.txt ]
then
    cp todo.txt $RESOURCE_DIR/todo.txt
fi

if [ -d fonts ]
then
  for dir in fonts/*/; do
    if [ -d ${dir} ]; then
      cp ${dir}*.ttf ~/Library/Fonts
    fi
  done
fi

if [ -e SFPro.zip ]
then
  unzip SFPro.zip; rm -rf __MACOSX
  sudo installer -pkg SFPro/San\ Francisco\ Pro.pkg -target /
  rm -rf SFPro.zip SFPro
fi

exit 0
