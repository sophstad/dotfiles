#!/bin/sh
#
# Zsh
#
# Install dependencies required by zshrc.

# Check for Antigen
echo " In zsh/install.sh"
if test ! $(which antigen)
then
  echo " Installing Antigen for you."

  ruby -e "$(curl -o ~/.antigen/antigen.zsh --create-dirs -L git.io/antigen)"
fi

exit 0
