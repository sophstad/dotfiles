#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
echo "Installing core packages..."
brew bundle --file="$DOTFILES/Brewfile"

read -rp "Install work packages? [y/N] " work
if [[ "$work" =~ ^[Yy]$ ]]; then
  brew bundle --file="$DOTFILES/Brewfile.work"
fi

# Symlink config directories
echo "Linking config..."
mkdir -p "$HOME/.config" "$HOME/.claude"
for dir in "$DOTFILES"/config/*/; do
  name="$(basename "$dir")"
  ln -sfn "$dir" "$HOME/.config/$name"
  echo "  ~/.config/$name"
done
ln -sfn "$DOTFILES/claude/settings.json" "$HOME/.claude/settings.json"
echo "  ~/.claude/settings.json"

# Install fonts (macOS)
if [[ "$(uname)" == "Darwin" ]]; then
  echo "Installing fonts..."
  cp -n "$DOTFILES"/fonts/input-mono/*.ttf "$HOME/Library/Fonts/" 2>/dev/null || true
fi

# Git identity
if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  echo "Setting up git identity..."
  read -rp "  Name: " git_name
  read -rp "  Email: " git_email
  cat > "$HOME/.gitconfig.local" <<EOF
[user]
	name = $git_name
	email = $git_email
[credential]
	helper = osxkeychain
EOF
fi

echo "Done!"
