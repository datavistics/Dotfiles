#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "Backing up $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "  linked $dst"
}

echo "Linking dotfiles from $DOTFILES..."
link zshrc        .zshrc
link vimrc        .vimrc
link bashrc       .bashrc
link tmux.conf    .tmux.conf
link ideavimrc    .ideavimrc
link custom.js    .jupyter/custom/custom.js

echo ""
echo "Installing vim-plug if missing..."
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "  vim-plug installed"
else
  echo "  vim-plug already present"
fi

if [ ! -f "$HOME/.zshrc.local" ]; then
  echo ""
  echo "NOTE: Create ~/.zshrc.local for machine-specific config (conda, PATH tweaks, etc.)"
  echo "      It is sourced at the end of ~/.zshrc but is not tracked in git."
fi

echo ""
echo "Done! Open vim and run :PlugInstall to install plugins."
