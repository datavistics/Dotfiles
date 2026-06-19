#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  backing up $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "  linked $dst"
}

echo "==> Linking dotfiles from $DOTFILES..."
link zshrc        .zshrc
link vimrc        .vimrc
link bashrc       .bashrc
link tmux.conf    .tmux.conf
link ideavimrc    .ideavimrc
link p10k.zsh     .p10k.zsh
link custom.js    .jupyter/custom/custom.js

echo ""
echo "==> Installing oh-my-zsh..."
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
  KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  already installed"
fi

echo ""
echo "==> Installing zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  echo "  zsh-autosuggestions installed"
else
  echo "  zsh-autosuggestions already present"
fi

echo ""
echo "==> Installing powerlevel10k theme..."
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
  echo "  powerlevel10k installed"
else
  echo "  powerlevel10k already present"
fi

echo ""
echo "==> Installing vim-plug..."
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
echo "==> Done!"
echo "    Open vim and run :PlugInstall to install plugins."
echo "    Run 'p10k configure' to customize your prompt."
